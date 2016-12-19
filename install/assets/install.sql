set foreign_key_checks=0;

-- Dumping structure for table kpos_app_config
DROP TABLE IF EXISTS `kpos_app_config`;
CREATE TABLE IF NOT EXISTS `kpos_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table kpos_attachments
DROP TABLE IF EXISTS `kpos_attachments`;
CREATE TABLE IF NOT EXISTS `kpos_attachments` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `descriptions` varchar(100) NOT NULL,
  `session_id` varchar(100) NOT NULL,
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table kpos_customers
DROP TABLE IF EXISTS `kpos_customers`;
CREATE TABLE IF NOT EXISTS `kpos_customers` (
  `person_id` int(10) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `added_by` int(5) DEFAULT NULL,
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `kpos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `kpos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table kpos_employees
DROP TABLE IF EXISTS `kpos_employees`;
CREATE TABLE IF NOT EXISTS `kpos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `kpos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `kpos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table kpos_financial_status
DROP TABLE IF EXISTS `kpos_financial_status`;
CREATE TABLE IF NOT EXISTS `kpos_financial_status` (
  `financial_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `income_sources` text NOT NULL,
  PRIMARY KEY (`financial_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table kpos_guarantee
DROP TABLE IF EXISTS `kpos_guarantee`;
CREATE TABLE IF NOT EXISTS `kpos_guarantee` (
  `guarantee_id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(300) NOT NULL,
  `type` varchar(300) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `make` varchar(50) NOT NULL,
  `serial` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `proof` varchar(1000) NOT NULL,
  `images` varchar(1000) NOT NULL,
  `observations` varchar(1000) NOT NULL,
  PRIMARY KEY (`guarantee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table kpos_loans
DROP TABLE IF EXISTS `kpos_loans`;
CREATE TABLE IF NOT EXISTS `kpos_loans` (
  `loan_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL,
  `description` varchar(300) NOT NULL,
  `remarks` varchar(300) NOT NULL,
  `loan_type_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `loan_amount` decimal(10,2) NOT NULL,
  `loan_balance` decimal(10,2) NOT NULL,
  `loan_status` enum('pending','approved','on going','paid') NOT NULL,
  `loan_agent_id` int(11) NOT NULL,
  `loan_approved_by_id` int(11) NOT NULL,
  `loan_reviewed_by_id` int(11) NOT NULL,
  `loan_applied_date` int(11) NOT NULL,
  `loan_payment_date` int(11) NOT NULL,
  `misc_fees` text NOT NULL,
  `delete_flag` int(11) NOT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table kpos_loan_payments
DROP TABLE IF EXISTS `kpos_loan_payments`;
CREATE TABLE IF NOT EXISTS `kpos_loan_payments` (
  `loan_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) NOT NULL DEFAULT '0',
  `loan_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `balance_amount` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `teller_id` int(11) NOT NULL,
  `date_paid` int(11) NOT NULL,
  `date_modified` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `remarks` varchar(2000) NOT NULL,
  `delete_flag` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`loan_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table kpos_loan_types
DROP TABLE IF EXISTS `kpos_loan_types`;
CREATE TABLE IF NOT EXISTS `kpos_loan_types` (
  `loan_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `term` int(11) NOT NULL,
  `term_period_type` varchar(50) NOT NULL,
  `payment_schedule` varchar(50) NOT NULL,
  `percent_charge1` decimal(10,2) NOT NULL,
  `period_charge1` int(11) NOT NULL,
  `period_type1` varchar(50) NOT NULL,
  `percent_charge2` decimal(10,2) NOT NULL,
  `period_charge2` int(11) NOT NULL,
  `period_type2` varchar(50) NOT NULL,
  `percent_charge3` decimal(10,2) NOT NULL,
  `period_charge3` int(11) NOT NULL,
  `period_type3` varchar(50) NOT NULL,
  `percent_charge4` decimal(10,2) NOT NULL,
  `period_charge4` int(11) NOT NULL,
  `period_type4` varchar(50) NOT NULL,
  `percent_charge5` decimal(10,2) NOT NULL,
  `period_charge5` int(11) NOT NULL,
  `period_type5` varchar(50) NOT NULL,
  `percent_charge6` decimal(10,2) NOT NULL,
  `period_charge6` int(11) NOT NULL,
  `period_type6` varchar(50) NOT NULL,
  `percent_charge7` decimal(10,2) NOT NULL,
  `period_charge7` int(11) NOT NULL,
  `period_type7` varchar(50) NOT NULL,
  `percent_charge8` decimal(10,2) NOT NULL,
  `period_charge8` int(11) NOT NULL,
  `period_type8` varchar(50) NOT NULL,
  `percent_charge9` decimal(10,2) NOT NULL,
  `period_charge9` int(11) NOT NULL,
  `period_type9` varchar(50) NOT NULL,
  `percent_charge10` decimal(10,2) NOT NULL,
  `period_charge10` int(11) NOT NULL,
  `period_type10` varchar(50) NOT NULL,
  `added_by` int(11) NOT NULL,
  `date_added` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `date_modified` int(11) NOT NULL,
  PRIMARY KEY (`loan_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping structure for table kpos_payment_schedules
DROP TABLE IF EXISTS `kpos_payment_schedules`;
CREATE TABLE IF NOT EXISTS `kpos_payment_schedules` (
  `payment_schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `recurrence` int(11) NOT NULL DEFAULT '0',
  `delete_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`payment_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table kpos_people
DROP TABLE IF EXISTS `kpos_people`;
CREATE TABLE IF NOT EXISTS `kpos_people` (
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `photo_url` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table kpos_plugins
DROP TABLE IF EXISTS `kpos_plugins`;
CREATE TABLE IF NOT EXISTS `kpos_plugins` (
  `plugin_id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(200) NOT NULL,
  `module_desc` varchar(200) NOT NULL,
  `module_files` text NOT NULL,
  `status_flag` enum('Active','Inactive') NOT NULL DEFAULT 'Inactive',
  PRIMARY KEY (`plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table kpos_sessions
DROP TABLE IF EXISTS `kpos_sessions`;
CREATE TABLE IF NOT EXISTS `kpos_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `kpos_modules`;
CREATE TABLE IF NOT EXISTS `kpos_modules` (
  `module_id` varchar(255) NOT NULL,
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `icons` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `kpos_permissions`;
CREATE TABLE IF NOT EXISTS `kpos_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `module_id` (`module_id`),
  KEY `ospos_permissions_ibfk_2` (`location_id`),
  CONSTRAINT `kpos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `kpos_modules` (`module_id`) ON DELETE CASCADE,
  CONSTRAINT `kpos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `kpos_stock_locations` (`location_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping structure for table kpos_grants
DROP TABLE IF EXISTS `kpos_grants`;
CREATE TABLE IF NOT EXISTS `kpos_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`permission_id`,`person_id`),
  KEY `ospos_grants_ibfk_2` (`person_id`),
  CONSTRAINT `kpos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `kpos_permissions` (`permission_id`),
  CONSTRAINT `kpos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `kpos_employees` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/* INSERTS */
INSERT INTO `kpos_employees` (`username`, `password`, `person_id`, `deleted`) VALUES ('admin', '0192023a7bbd73250516f069df18b500', 1, 0);

INSERT INTO `kpos_app_config` (`key`, `value`) VALUES
	('address', 'Your Address'),
	('company', 'Your Company'),
	('currency_side', '0'),
	('currency_symbol', '$'),
	('custom10_name', '0'),
	('custom1_name', '0'),
	('custom2_name', '0'),
	('custom3_name', '0'),
	('custom4_name', '0'),
	('custom5_name', '0'),
	('custom6_name', '0'),
	('custom7_name', '0'),
	('custom8_name', '0'),
	('custom9_name', '0'),
	('default_tax_1_name', '0'),
	('default_tax_1_rate', '0'),
	('default_tax_2_name', '0'),
	('default_tax_2_rate', '0'),
	('email', ''),
	('fax', ''),
	('language', 'en'),
	('phone', '111-2222'),
	('print_after_sale', '0'),
	('recv_invoice_format', '0'),
	('return_policy', '0'),
	('sales_invoice_format', '0'),
	('tax_included', '0'),
	('timezone', 'America/New_York'),
	('website', '');

INSERT INTO `kpos_modules` (`module_id`, `name_lang_key`, `desc_lang_key`, `sort`, `icons`, `is_active`) VALUES ('config', 'module_config', 'module_config_desc', 100, '<i class="fa fa-cogs" style="font-size: 50px; color:#26B6AE"></i>', 1);
INSERT INTO `kpos_modules` (`module_id`, `name_lang_key`, `desc_lang_key`, `sort`, `icons`, `is_active`) VALUES ('customers', 'module_customers', 'module_customers_desc', 10, '<i class="fa fa-smile-o" style="font-size: 50px; color:#FF5400"></i>', 1);
INSERT INTO `kpos_modules` (`module_id`, `name_lang_key`, `desc_lang_key`, `sort`, `icons`, `is_active`) VALUES ('employees', 'module_employees', 'module_employees_desc', 80, '<i class="fa fa-users" style="font-size: 50px; color:#FF5400"></i>', 1);
INSERT INTO `kpos_modules` (`module_id`, `name_lang_key`, `desc_lang_key`, `sort`, `icons`, `is_active`) VALUES ('loans', 'module_loans', 'module_loans_desc', 80, '<i class="fa fa-money" style="font-size: 50px; color:#4EA216"></i>', 1);
INSERT INTO `kpos_modules` (`module_id`, `name_lang_key`, `desc_lang_key`, `sort`, `icons`, `is_active`) VALUES ('loan_types', 'module_loan_types', 'module_loan_types_desc', 79, '<i class="fa fa-sitemap" style="font-size: 50px; color:#e80a0a"></i>', 1);
INSERT INTO `kpos_modules` (`module_id`, `name_lang_key`, `desc_lang_key`, `sort`, `icons`, `is_active`) VALUES ('overdues', 'module_overdues', 'module_overdues_desc', 80, '<i class="fa fa-file" style="font-size: 50px; color:#1b926c"></i>', 1);
INSERT INTO `kpos_modules` (`module_id`, `name_lang_key`, `desc_lang_key`, `sort`, `icons`, `is_active`) VALUES ('payments', 'module_payments', 'module_payments_desc', 80, '<i class="fa fa-paypal" style="font-size: 50px; color:#2B9EC4"></i>', 1);
INSERT INTO `kpos_modules` (`module_id`, `name_lang_key`, `desc_lang_key`, `sort`, `icons`, `is_active`) VALUES ('plugins', 'module_plugins', 'module_plugin_desc', 79, '<i class="fa fa-gavel" style="font-size: 50px; color:#1b926c"></i>', 1);

INSERT INTO `kpos_grants` (`permission_id`, `person_id`) VALUES ('config', 1);
INSERT INTO `kpos_grants` (`permission_id`, `person_id`) VALUES ('customers', 1);
INSERT INTO `kpos_grants` (`permission_id`, `person_id`) VALUES ('employees', 1);
INSERT INTO `kpos_grants` (`permission_id`, `person_id`) VALUES ('loans', 1);
INSERT INTO `kpos_grants` (`permission_id`, `person_id`) VALUES ('loan_types', 1);
INSERT INTO `kpos_grants` (`permission_id`, `person_id`) VALUES ('overdues', 1);
INSERT INTO `kpos_grants` (`permission_id`, `person_id`) VALUES ('payments', 1);
INSERT INTO `kpos_grants` (`permission_id`, `person_id`) VALUES ('plugins', 1);

INSERT INTO `kpos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('config', 'config', NULL);
INSERT INTO `kpos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('customers', 'customers', NULL);
INSERT INTO `kpos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('employees', 'employees', NULL);
INSERT INTO `kpos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('loans', 'loans', NULL);
INSERT INTO `kpos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('loan_types', 'loan_types', NULL);
INSERT INTO `kpos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('overdues', 'overdues', NULL);
INSERT INTO `kpos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('payments', 'payments', NULL);
INSERT INTO `kpos_permissions` (`permission_id`, `module_id`, `location_id`) VALUES ('plugins', 'plugins', NULL);

INSERT INTO `kpos_payment_schedules` (`payment_schedule_id`, `name`, `recurrence`, `delete_flag`) VALUES (1, 'weekly', 0, 0);
INSERT INTO `kpos_payment_schedules` (`payment_schedule_id`, `name`, `recurrence`, `delete_flag`) VALUES (2, 'biweekly', 0, 0);
INSERT INTO `kpos_payment_schedules` (`payment_schedule_id`, `name`, `recurrence`, `delete_flag`) VALUES (3, 'monthly', 0, 0);
INSERT INTO `kpos_payment_schedules` (`payment_schedule_id`, `name`, `recurrence`, `delete_flag`) VALUES (4, 'bimonthly', 0, 0);

INSERT INTO `kpos_people` (`person_id`, `first_name`, `last_name`, `photo_url`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`) VALUES
	(1, 'Admin', 'Admin', '', '421-2583', 'admin@loans.com', 'nowhere', '', '', '', '', '', '');


