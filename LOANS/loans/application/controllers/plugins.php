<?php

require_once ("secure_area.php");
require_once ("interfaces/idata_controller.php");

class Plugins extends Secure_area implements iData_controller {

    private $_model;
    private $_model_name;

    function __construct()
    {
        parent::__construct(strtolower(get_class()));
        $model_name = ucfirst(str_replace("s", "", get_class()));
        $this->load->model($model_name);
        $this->_model = $this->$model_name;
        $this->_model_name = strtolower($model_name);
    }

    function index()
    {
        $data['controller_name'] = strtolower(get_class());
        // just make sure that controller name is equivalent to the table name in database
        $data['fields'] = $this->_model->get_fields($data['controller_name']);
        
        $this->_model->clear_plugins();

        $directory = FCPATH . "modules";
        $path = $directory;
        $results = scandir($path);

        foreach ($results as $result)
        {
            if ($result === '.' or $result === '..')
                continue;

            if (file_exists($path . '/' . $result . "/meta.json"))
            {
                $meta = file_get_contents($path . '/' . $result . "/meta.json");
                $plugin = json_decode($meta, true);
                $this->_model->validate_plugin($plugin);
            }
        }

        $this->load->view($data['controller_name'] . '/manage', $data);
    }

    function view($id = -1)
    {
        $controller_name = strtolower(get_class());
        $data['info'] = $this->_model->get_info($id);
        $data['id'] = $id;
        $data['fields'] = $this->_model->get_fields($controller_name);
        $data['controller_name'] = $controller_name;
        $this->load->view($controller_name . "/form", $data);
    }

    function save($id = -1)
    {
        $data = $this->input->post();
        unset($data['submit']);



        if ($this->_model->save($data, $id))
        {
            //New
            if ($id == -1)
            {
                echo json_encode(array('success' => true, 'message' => $this->lang->line(strtolower(get_class()) . '_successful_adding') . ' ' .
                    $data[$this->_model_name . '_id'], $this->_model_name . '_id' => $data[$this->_model_name . '_id']));
                $id = $data[$this->_model_name . '_id'];
            }
            else //previous item
            {
                echo json_encode(array('success' => true, 'message' => $this->lang->line(strtolower(get_class()) . '_successful_updating') . ' ' .
                    $data[$this->_model_name . '_id'], $this->_model_name . '_id' => $id));
            }
        }
        else//failure
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line(strtolower(get_class()) . '_error_adding_updating') . ' ' .
                $data[$this->_model_name . '_id'], $this->_model_name . '_id' => -1));
        }
    }

    // copy a directory and all subdirectories and files (recursive)
    // void dircpy( str 'source directory', str 'destination directory' [, bool 'overwrite existing files'] )
    function dircpy($basePath, $source, $dest, $overwrite = false)
    {
        if (!is_dir($basePath . $dest)) //Lets just make sure our new folder is already created. Alright so its not efficient to check each time... bite me
            mkdir($basePath . $dest);
        if ($handle = opendir($basePath . $source))
        {        // if the folder exploration is sucsessful, continue
            while (false !== ($file = readdir($handle)))
            { // as long as storing the next file to $file is successful, continue
                if ($file != '.' && $file != '..')
                {
                    $path = $source . '/' . $file;
                    if (is_file($basePath . $path))
                    {
                        if (!is_file($basePath . $dest . '/' . $file) || $overwrite)
                            if (!@copy($basePath . $path, $basePath . $dest . '/' . $file))
                            {
                                echo '<font color="red">File (' . $path . ') could not be copied, likely a permissions problem.</font>';
                            }
                    }
                    elseif (is_dir($basePath . $path))
                    {
                        if (!is_dir($basePath . $dest . '/' . $file))
                            mkdir($basePath . $dest . '/' . $file); // make subdirectory before subdirectory is copied
                        dircpy($basePath, $path, $dest . '/' . $file, $overwrite); //recurse!
                    }
                }
            }
            closedir($handle);
        }
    }

    function delete()
    {
        $ids = $this->input->post('ids');
        $controller_name = strtolower(get_class());

        if ($this->_model->delete_list($ids))
        {
            echo json_encode(array('success' => true, 'message' => $this->lang->line($controller_name . '_successful_deleted') . ' ' .
                count($ids) . ' ' . $this->lang->line($controller_name . '_one_or_multiple')));
        }
        else
        {
            echo json_encode(array('success' => false, 'message' => $this->lang->line('loan_type_cannot_be_deleted')));
        }
    }

    function data()
    {
        $index = isset($_REQUEST['order'][0]['column']) ? $_REQUEST['order'][0]['column'] : 1;
        $dir = isset($_REQUEST['order'][0]['dir']) ? $_REQUEST['order'][0]['dir'] : "asc";
        $order = array("index" => $index, "direction" => $dir);
        $length = isset($_REQUEST['length'])?$_REQUEST['length']:50;
        $start = isset($_REQUEST['start'])?$_REQUEST['start']:0;
        $key = isset($_REQUEST['search']['value'])?$_REQUEST['search']['value']:"";

        $controller_name = strtolower(get_class());
        $$controller_name = $this->_model->get_all($length, $start, $key, $order);

        $id = strtolower(str_replace("s", "", $controller_name) . "_id");
        $format_result = array();

        $fields = $this->_model->get_fields(ucfirst($controller_name));

        foreach ($$controller_name->result() as $data)
        {
            $tmp = [];
            $tmp[] = "<input type='checkbox' name='chk[]' class='select_' id='" . $controller_name . "_" . $data->$id . "' value='" . $data->$id . "'/>";
            foreach ($fields as $field)
            {
                if ($field !== "module_files"):
                    $tmp[] = $data->$field;
                endif;
            }

            $action = [];

            //$action[] = anchor($controller_name . '/view/' . $data->$id, $this->lang->line('common_edit'), array('class' => 'modal_link btn btn-success', 'data-toggle' => 'modal', 'data-target' => '#' . $controller_name . '_modal', "title" => $this->lang->line($controller_name . '_update')));

            if ($data->status_flag === 'Active')
            {
                $action[] = anchor($controller_name . '/manage/' . $data->$id, $this->lang->line($controller_name . '_manage'), array('class' => 'modal_link btn btn-success', 'data-toggle' => 'modal', 'data-target' => '#' . $controller_name . '_modal', "title" => $this->lang->line($controller_name . '_manage')));
            }
            else
            {
                $action[] = anchor($controller_name . '/activate/' . $data->$id, $this->lang->line($controller_name . '_activate'), array('class' => 'modal_link btn btn-default', "title" => $this->lang->line($controller_name . '_activate')));
            }


            $tmp[] = implode("&nbsp", $action);

            $format_result[] = $tmp;
        }

        $data = array(
            "recordsTotal" => $this->_model->count_all(),
            "recordsFiltered" => $this->_model->count_all(),
            "data" => $format_result
        );

        echo json_encode($data);
        exit;
    }

    public function get_row()
    {
        
    }

    public function search()
    {
        
    }

    public function suggest()
    {
        
    }

    public function get_form_width()
    {
        
    }

    public function upload()
    {
        $directory = FCPATH . "modules/";
        $this->load->library('uploader');
        $data = $this->uploader->upload($directory);

        $module_id = $this->_model->add_plugin($data);

        // decompress the archive file
        $decompress = $this->_decompress($data['filename']);

        echo json_encode(array("filename" => $data['filename'], "module_id" => $module_id, "decompress" => $decompress));
        exit;
    }

    private function _decompress($file)
    {
        // get the absolute path to $file
        $path = FCPATH . "modules/";
        $file = FCPATH . "modules/".$file;

        $zip = new ZipArchive;
        $res = $zip->open($file);
        if ($res === TRUE)
        {
            // extract it to the path we determined above
            $zip->extractTo($path);
            $zip->close();
            return true;
        }
        
        return false;
    }

    public function activate($id)
    {
        $data = $this->_model->get_plugin($id);

        $files = json_decode($data->module_files, true);

        $plugin_name = $data->module_name;

        $controllers = $files['controllers'];

        $this->_move_files($controllers, 'controllers', $plugin_name);

        $models = $files['models'];

        $this->_move_files($models, 'models', $plugin_name);

        $views = $files['views'];

        $this->_move_files($views, 'views', $plugin_name);

        $language = $files['language'];

        $this->_move_files($language, 'language', $plugin_name);

        $js = $files['js'];

        $this->_move_files($js, 'js', $plugin_name);

        // finally, let's save to database;
        $this->_model->register_plugin($plugin_name);

        // update status as active
        $this->_model->update_status("active", $id);

        //var_dump($data);
    }

    private function _move_files($arr, $type, $plugin_name)
    {
        foreach ($arr as $path)
        {
            if (strpos($path, '*') !== false)
            {
                $src = 'modules/' . $plugin_name;
                $dest = 'application';
                $files = glob(FCPATH . "modules/" . $plugin_name . str_replace("*", "", $path) . "*.*");
                foreach ($files as $file)
                {
                    $file_to_go = str_replace($src, $dest, $file);

                    $dir = str_replace($src, $dest, dirname($file));
                    if (!file_exists($dir))
                    {
                        @mkdir($dir);
                    }
                    copy($file, $file_to_go);
                }
            }
        }
    }

}

?>