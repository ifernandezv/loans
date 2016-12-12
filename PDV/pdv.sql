-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2016 at 12:37 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pdv`
--

-- --------------------------------------------------------

--
-- Table structure for table `kpos_phppos_customers`
--

CREATE TABLE IF NOT EXISTS `kpos_phppos_customers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `person_id` int(10) NOT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `balance` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  `credit_limit` decimal(23,10) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `cc_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_preview` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_issuer` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `tier_id` int(10) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `long` decimal(23,10) DEFAULT NULL,
  `lat` decimal(23,10) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `type` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  KEY `deleted` (`deleted`),
  KEY `cc_token` (`cc_token`),
  KEY `phppos_customers_ibfk_2` (`tier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=132 ;

--
-- Dumping data for table `kpos_phppos_customers`
--

INSERT INTO `kpos_phppos_customers` (`id`, `person_id`, `account_number`, `company_name`, `balance`, `credit_limit`, `taxable`, `cc_token`, `cc_preview`, `card_issuer`, `tier_id`, `location_id`, `long`, `lat`, `deleted`, `type`) VALUES
(1, 3, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.1594778000', '-17.4187589000', 0, 1),
(2, 4, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.2003332077', '-17.3899092158', 0, 1),
(3, 5, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.1594778000', '-17.4187589000', 0, 1),
(4, 6, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.1594778000', '-17.4187589000', 0, 1),
(5, 8, NULL, '', '552276.0100000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.1144409095', '-17.3885272749', 0, 1),
(6, 9, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.1561438953', '-17.3984993316', 1, 1),
(7, 10, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1163721000', '-17.3906364000', 0, 1),
(8, 11, NULL, '', '781692.4100000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.1163721000', '-17.3906364000', 1, 1),
(9, 12, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(10, 13, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(11, 14, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(12, 15, '5210560 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(13, 16, '3122860 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(14, 17, '5266363 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(15, 18, '7898330 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(16, 19, '4466170 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(17, 20, '5050751 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(18, 21, '8017376 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(19, 22, '6420498 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(20, 23, '3962139 PO', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(21, 24, 'VIVE EN ESTADOS UNIDOS', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(22, 25, '6449564 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(23, 26, '4876366 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(24, 27, '5207001 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(25, 28, '4507836 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(26, 29, '6475730 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(27, 30, '8773356 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(28, 31, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(29, 32, '5576861 PO', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(30, 33, '3076516 OR', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(31, 34, '1142872 CH', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(32, 35, '5262652 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(33, 36, '4421747 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(34, 37, '4421752 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(35, 38, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(36, 39, '825640 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(37, 40, '3342612 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(38, 41, '5309690 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(39, 42, '4377598 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(40, 43, '3124220 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(41, 44, '4314051 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(42, 45, '6441886 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(43, 46, '5239574 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(44, 47, '3769295 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(45, 48, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(46, 49, '983687 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(47, 50, '6174643 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(48, 51, '4298065 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(49, 52, '3778398 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(50, 53, '4389276 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(51, 54, '3099681 OR', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(52, 55, '4411337 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(53, 56, '8049688 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(54, 57, '3057735 OR', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(55, 58, '6175126 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(56, 59, '3811939 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(57, 60, '3868839 S.C.', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(58, 61, '4525884 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(59, 62, '970360 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(60, 63, '4443542 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(61, 64, '811836 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(62, 65, '3529508 OR', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(63, 66, '6638118 PO', '', '1225556.4500000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1869865023', '-17.3518272763', 0, 1),
(64, 67, '2899007 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(65, 68, '3813140 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(66, 69, '8303430 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(67, 70, '4466777 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(68, 71, '6899350 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(69, 72, '8046078 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4187688000', 0, 1),
(70, 73, '4044537 OR', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(71, 74, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(72, 75, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(73, 76, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(74, 77, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(75, 78, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(76, 79, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(77, 80, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(78, 81, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(79, 82, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(80, 83, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(81, 84, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(82, 85, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(83, 86, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(84, 87, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(85, 88, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(86, 89, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(87, 90, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(88, 91, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(89, 92, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(90, 93, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(91, 94, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(92, 95, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(93, 96, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(94, 97, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(95, 98, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(96, 99, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(97, 100, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(98, 101, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(99, 102, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(100, 103, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(101, 104, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(102, 105, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(103, 106, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(104, 107, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(105, 108, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(106, 109, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(107, 110, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(108, 111, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(109, 112, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(110, 113, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(111, 114, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(112, 115, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(113, 116, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(114, 117, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(115, 118, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(116, 119, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(117, 120, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(118, 121, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(119, 122, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(120, 123, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(121, 124, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(122, 125, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(123, 126, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(124, 127, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(125, 128, '3721515 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1),
(126, 129, '8051570 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1),
(127, 130, '2019398', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1),
(128, 131, '5235197 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1),
(129, 132, '3731046 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1),
(130, 133, '3780468 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1),
(131, 134, '2868895 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kpos_phppos_people`
--

CREATE TABLE IF NOT EXISTS `kpos_phppos_people` (
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `image_id` int(10) DEFAULT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `email` (`email`),
  KEY `phppos_people_ibfk_1` (`image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=135 ;

--
-- Dumping data for table `kpos_phppos_people`
--

INSERT INTO `kpos_phppos_people` (`first_name`, `last_name`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `image_id`, `person_id`) VALUES
('Israel', 'Fernandez', '71490527', 'ifernandez@wokdata.net', 'Av. Heroinas N 278', 'Av. Heroinas N 278', 'cochabamba', 'Cercado', '0000', 'Bolivia', '', NULL, 1),
('Livia', 'Rufino Peralta', '', '', '', '', '', '', '', '', '', NULL, 2),
('YAMIRA MARCIA CONNI', 'GUTIERREZ DE FERNANDEZ', '76904681', '', 'CALLE INNOMINADA S/N', 'ZONA COTAPACHI', 'COCHABAMBA', '', '', 'BOLIVIA', '', NULL, 3),
('SANTIAGO ', 'QUISPE HUARAYO', '72748792', '', 'CALLE EDUARDO RIVAS N° 1994 ', 'ZONA CERRO VERDE SAN MIGUEL', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', 'CLIENTE DE GENARO CABEZAS HERRERA.\n', NULL, 4),
('EDGAR ALEJANDRO', 'REVOLLO SAAVEDRA', '', '', 'AVENIDA MARISCAL DE AYACUCHO S/N', 'ESQUINA BLANCO GALINDO KM. 6 SANTA ROSA SUD ', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', 'COMPRA DE LOTE A CREDITO 60 MESES CON INTERES DEL 10% ANUAL, MANZANO 2 LOTE 2.', NULL, 5),
('SONIA LUZ', 'ROJAS BLANCO', '4569848', '', '', 'AV. BARRIENTOS S/N', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', 'LOTE 14 MZ 2', NULL, 6),
('JIMMY RONALD ', 'PEREDO ZAMBRANA', '79961004', 'jrperedoz@gmail.com', 'AV. FUERZA AEREA NRO 8207', 'ZONA JAIHUAYCO', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', '', NULL, 7),
('DULFREDO CARLOS ', 'VILLA PEREIRA', '72219874', '', 'CALLE URUGUAY N° 575', 'ZONA CENTRAL', 'COCHABAMBA', '', '', '', 'MANZANO 1 LOTE 1 PLAZO 60 MESES\n', NULL, 8),
('DULFREDO CARLOS ', 'VILLA PEREIRA', '72219874', '', 'CALLE URUGUAY N° 575', 'ZONA CENTRAL', 'COCHABAMBA', '', '', '', 'MANZANO 1 LOTE 1 PLAZO 60 MESES\n', NULL, 9),
('ZULMA ', 'CORO CONDORI', '4557774', '', 'CALLE EDUARDO RIVAS N° 1994', '', '', '', '', '', '', NULL, 10),
('YAMIRA MARCIA CONNI', 'GUTIERREZ DE FERNANDEZ', '76904681', '', 'CALLE INNOMINADA S/N', 'ZONA COTAPACHI', 'COCHABAMBA', '', '', 'BOLIVIA', '', NULL, 11),
('VIRGINIA ', 'CAMACHO ROJAS', '65340074', '', 'AVENIDA SUECIA PASAJE 008 ESQUINA QUEBRACHO', '', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', 'COMPRA A CREDITO DE 18 MESES URBANIZACION PARAISO DE KALUYO MANZANO  10 LOTE 8', NULL, 12),
('ZULMA ', 'CORO CONDORI', '4557774', '', 'CALLE EDUARDO RIVAS N° 1994', '', '', '', '', '', '', NULL, 13),
('GONZALO ANDRES', 'TICONA CAHUANA', '', '', '', '', '', '', '', '', '', NULL, 14),
('HERNAN AGUSTIN', 'RODRIGUEZ GUTIERREZ', '60708015', '', 'AV. CHAPARE KM. 5', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '70792829 4720434', NULL, 15),
('IVONE NEYZA', 'ALBA VDA. DE GUTIERREZ', '75916216', '', 'AV. MANCO KAPAC N° 1079', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4581404', NULL, 16),
('CLYDE', 'LOZA QUISPE', '68499720', '', 'CALLE PARAISO S/N BLANCO GALINDO KM. 10 1/2', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '77433238 MARCELINA QUISPE  79980507 CLAUDIA LOZA', NULL, 17),
('JUAN CARLOS ', 'HUAYCHO LAURA', '67409495', '', 'CALLE LIDIA TEJADA SORZANO N° 208 VILLA COSMOS', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 18),
('MONJE', 'HUAYCHO LAURA', '77906557', '', 'CALLE LIDIA TEJADA SORZANO N° 208 VILLA COSMOS', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 19),
('MARIA RENE', 'GAMES PINTO', '77280802', '', 'CALLE BARTOLOME DE LAS CASAS N° 1228', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4416578 CASA 71132924', NULL, 20),
('PAULO CESAR', 'APAZA MIRANDA', '72790681', '', 'AV. SUECIA N° 315 ZONA HUAYRA KHASA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 21),
('JAVIER ', 'TERAN BENAVIDES', '79368724', '', 'AV. SIMON I. PATIÑO S/N VINTO', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4153999 INT 3822 ', NULL, 22),
('MARCO ANTONIO', 'CAMPOS PEREZ', '74827678', '', 'AV. HERNAN SILES N° 2721 ZONA NORTE', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 23),
('CARMEN ROSA ', 'HERBAS DE VELASCO', '79377154', '', 'URB. MIRAFLORES CHILLIMARCA TIQUIPAYA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 24),
('JORGE ARIEL', 'ROMERO REVOLLO', '79797335', '', 'CALLE CAPITAN LUIS RIVERA N° 2850 ENTRE FINAL CABILDO Y LUIS PARAVICINI', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4527579', NULL, 25),
('EDUVIGES', 'LOPEZ NINA', '71240527', '', 'CALLE IDELFONSO MURGUIA S/N ENTRE MELCHOR PEREZ DE OLGUIN Y GABRIEL RENE MORENO', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 26),
('RICARDO VLADIMIR ', 'ARISPE LOPEZ', '77998899', '', 'PASAJE MIGUEL DE CERVANTES N° 8 ZONA TEMPORAL', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 27),
('DUSTIN CHAKER ', 'GONZALES SANDOVAL', '70748909', '', 'CALLE CAÑADA COCHABAMBA N° 2256 ZONA CHIMBA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '67594714', NULL, 28),
('EVELIN', 'BALDIVIESO LIMA', '79746610', '', 'PASAJE EL PALMAR N° 130 VILLA FELICIDAD', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4224101', NULL, 29),
('ANABEL', 'ANTERQUERA CHOQUE', '70792223', '', 'CALLE CARLOS PEÑA N° 3 BARRIO CATAVI AV. BLANCO GALINDO KM. 10 1/2', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4350621 DOMICILIO 65730562 JOSE ANTEQUERA 65338008 LENNY ANTEQUERA', NULL, 30),
('BENEDICTA ', 'TICONA VALLE', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 31),
('ANA MARIA ', 'CRUZ ESCOBAR', '69677325', '', 'AV. PETROLERA KM. 3 1/2', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '77407246 ARIEL ESPOSO', NULL, 32),
('EDGAR ALFREDO ', 'RODRIGUEZ MAMANI', '73797687', '', 'CALLE INNOMINADA S/N BARRIO SAN GABRIEL ', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '65325956 NILKA (HIJA) 60712969 LAURA (HIJA)', NULL, 33),
('CLAUDIA ANDREA ', 'LOPEZ CALIZAYA', '76411511', '', 'AV.PETROLERA KM. 3 1/2', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4765945 4550312 75471661', NULL, 34),
('MARIA DEL PILAR ', 'MENDOZA GONZALES', '70302182', '', '', 'PASAJE DEL MITAYO N° 847 ZONA HIPODROMO', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4241678 DOMICILIO ', NULL, 35),
('NERY BHETZABE', 'LOZA QUISPE', '60380548', '', 'CALLE PARAISO S/N BLANCO GALINDO KM. 10 1/2', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '79980507 CLAUDIA LOZA 68499720 CLYDE LOZA', NULL, 36),
('CLAUDIA ANDREA ', 'LOZA QUISPE', '79980507', '', 'CALLE PARAISO S/N BLANCO GALINDO KM. 10 1/2', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '75916437 WILMER 69487071 EDGAR', NULL, 37),
('SONIA LUZ ROJAS BLANCO', '', '79347569', '', 'CALLE PORFIRIO DIAZ N° 250 ZONA TEMPORAL', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4569848 4596130 JHONNY ALVAREZ 79703919', NULL, 38),
('VIRGINIA', 'COSSIO DE VARGAS', '65329151', '', 'CALLE SUCRE S/N QUILLACOLLO ZONA PURGATORIO', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '76951600', NULL, 39),
('ALICIA ', 'CHAMBI MAMANI', '', '', 'PASAJE DAKAR S/N VILLA PAGADOR', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 40),
('ALEJANDRA MONICA', 'QUINTANILLA LANG', '70371277', '', 'CALLE LUIS CALVO N° 2360 QUERU QUERU', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4453113', NULL, 41),
('FREDDY ALONZO ', 'COAQUIRA TIÑINI', '79102113', '', 'AV. PEDRO DOMINGO MURILLO N° 2300 ZONA AMERICA I', '', 'LA PAZ', 'CERCADO', '', 'BOLIVIA', '74024401 MARIA ROJAS (ESPOSA)', NULL, 42),
('MARIO', 'MAMANI HUARACHI', '71477270', '', 'CALLE SEVERO FERNANDEZ S/N VILLA JERUSALEM ZONA SUD', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', 'BARBARA VENTURA SAJAMA (ESPOSA)', NULL, 43),
('JUAN   ', 'ALVAREZ CUSSI', '73544452', '', 'UNIDAD VECINAL 6-25 N°543 URBANIZACION MARISCAL SANTA CRUZ', '', 'LA PAZ', 'CERCADO', '', 'BOLIVIA', '73065865 ROGELIA TANCARA CHUQUIMIA (ESPOSA)', NULL, 44),
('PLACIDA ', 'VALLEJOS VELARDE', '67536680', '', 'CALLE 6 DE AGOSTO S/N PUNATA', '', 'COCHABAMBA', 'PUNATA', '', 'BOLIVIA', '69533627 JOSE (ESPOSO CUBANO)', NULL, 45),
('MELQUEADES', 'AYALA COLQUE', '73332995', '', 'CALLE INNOMINADA S/N BARRIO KAMI', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '73438596', NULL, 46),
('DANY FRANZ', 'VOCAL ARZE', '79781911', '', 'CALLE J.M. MORALES S/N ZONA PACATA BAJA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 47),
('LIDIA ', 'RAMOS VARGAS', '72934355', '', 'CALLE PORTO NOVO S/N BARRIO GUALBERTO VILLARROEL', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 48),
('BERTHA', 'MEGUILLANES UNTIVEROS', '68456060', '', 'CALLE SAN MIGUEL S/N ZONA CONVENTO', '', 'COCHABAMBA', 'TARATA', '', 'BOLIVIA', '4578229', NULL, 49),
('RICARDO JUAN ', 'FUENTES SOSA', '79535235', '', 'AV. BUSCH EDIFICIO BOSTON DEPTO 3C ZONA MIRAFLORES', '', 'LA PAZ', 'CERCADO', '', 'BOLIVIA', '68109002', NULL, 50),
('ISELA ', 'CHAVEZ LEON', '4256349', '', 'CALLE LANZA N° 940 ENTRE BRASIL Y HONDURAS', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '67412193 - 71491176 JULIO GANDARILLAS (ESPOSO)', NULL, 51),
('GUIDO', 'AYALA TERRAZAS', '60704510', '', 'CALLE PULACAYO ESQUINA COLQUIRI ALOJAMIENTO ARGENTINA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 52),
('JUAN CARLOS ', 'VASQUEZ MERCADO', '72091105', '', 'CALLE "24" S/N ESQUINA DERECHOS HUMANOS ZONA VALLE HERMOSO', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 53),
('ROSSMERY CHOQUE ARPITA', 'CHOQUE ARPITA', '73176048', '', 'CALLE SANTA CRUZ N° 306 BARRIO 26 DE DICIEMBRE', '', 'SANTA CRUZ', 'CERCADO', '', 'BOLIVIA', '', NULL, 54),
('ALBERTO', 'MORALES JACINTO', '4306538', '', 'CALLE NICETO RODRIGUEZ S/N BARRIO COLQUIRI ZONA SUD', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 55),
('ALVARO ', 'SANCHEZ LAURA', '69421098', '', 'AV. BLANCO GALINDO KM. 6 BARRIO OASIS', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 56),
('ROSSE MARY ', 'SOLIZ OLIVAREZ DE VASQUEZ', '72482457', '', 'CALLE GALLEGUILLOS N° 211 ESQ. AV. DEL MAESTRO', '', 'ORURO', 'CERCADO', '', 'BOLIVIA', '73320672 ROXANA SOLIZ OLIVARES 5238211 LUCY MALDONADO', NULL, 57),
('PAOLA MERY', 'DEL VILLAR PEÑARANDA', '71548544', '', 'CALLE YANACOCHA N° 888 ZONA NORTE ', '', 'LA PAZ', 'CERCADO', '', 'BOLIVIA', '', NULL, 58),
('SABINA ', 'VILLCA NINAJA', '75908891', '', 'CALLE 8 S/N VALLE HERMOSO', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 59),
('CARLOS ANTONIO', 'RAMIREZ ANTEZANA', '72101633', '', 'CALLE SEVERO OCHOA S/N ZONA PAMPA GRANDE', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '72141837 CLAUDIA PEREIRA MORALES (ESPOSA)', NULL, 60),
('EDGAR  ', 'VILLANUEVA CHAMBI ', '', '', 'ESPAÑA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 61),
('SENOVIA BACILIA ', 'HERBAS LAFUENTE', '60748445', '', 'CALLE MIGUEL DE CERVANTES Y CALLE MOSTAJO S/N ZONA TEMPORAL', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 62),
('ROCIO BEATRIZ', 'VILLANUEVA CHAMBI ', '', '', 'ESPAÑA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 63),
('MARIA LUISA ', 'CABRERA PADILLA', '70763646', '', 'AV. CALANCHA N° 1217 ', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 64),
('GENARO', 'CABEZAS HERRERA', '65347960', ' ', 'SAN ANTONIO DE BUENA VISTA PARADA MICRO "H"', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 65),
('DOMINGA ', 'AGUANTA ACUÑA', '78325498', '', 'CALLE LOS CEDROS N° 958 SUMUNPAYA SUD AV. BLANCO GALINDO KM 8', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '76463650 WILBER SEGOVIA AGUANTA', NULL, 66),
('MARIA ROSARIO', 'MEGUILLANES UNTIVEROS', '', '', 'CALLE SAN MIGUEL S/N ZONA CONVENTO', '', 'COCHABAMBA', 'TARATA', '', 'BOLIVIA', '', NULL, 67),
('SANDRA HERMINIA', 'MEGUILLANES UNTIVEROS', '', '', 'CALLE SAN MIGUEL S/N ZONA CONVENTO', '', 'COCHABAMBA', 'TARATA', '', 'BOLIVIA', '', NULL, 68),
('MARIA RENE ', 'CABA UGARTE', '60700329', '', 'CALLE LUIS CALVO N° 2146 ESQ. CIRCUNVALACION ZONA QUERU QUERU', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4040038', NULL, 69),
('JOSE BENITO', 'PEÑALOZA', '72323651', '', 'AV. PETROLERA KM. 9 ZONA USPA USPA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '77916708 DELICIA BLANCO ROJAS(ESPOSA)', NULL, 70),
('PABLO ERNESTO', 'CERVANTES LOPEZ', '75816971', '', 'CALLE PORTOCARREÑO N° 1154 ZONA FRANZ TAMAYO', '', 'LA PAZ', 'EL ALTO', '', 'BOLIVIA', '', NULL, 71),
('ISRAEL ', 'BUENO CAHUANA', '71852434', '', 'AV. BLANCO GALINDO KM. 6 BARRIO SANTA ROSA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '71852434 VIRGINIA CAHUANA FLORES (MAMA)', NULL, 72),
('ALVARO LUIS', 'CONDORI MENDOZA', '75487825', '', 'CALLE "12" S/N ZONA CANDELARIA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '76949071 CARLA LORENA ARIAS SOLIS (ESPOSA)', NULL, 73),
('PASTOR ', 'LANZA CLEMENTE', '71831262', '', 'CALLE EMANUEL ASENCIO PADILLA N° 7 CASI ESQUINA JAIME MENDOZA BARRIO SAN PABLO', '', 'SUCRE', 'CERCADO', '', 'BOLIVIA', '78721321 JIMENA LANZA (HIJA)', NULL, 74),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 75),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 76),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 77),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 78),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 79),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 80),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 81),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 82),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 83),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 84),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 85),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 86),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 87),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 88),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 89),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 90),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 91),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 92),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 93),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 94),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 95),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 96),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 97),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 98),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 99),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 100),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 101),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 102),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 103),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 104),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 105),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 106),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 107),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 108),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 109),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 110),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 111),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 112),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 113),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 114),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 115),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 116),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 117),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 118),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 119),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 120),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 121),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 122),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 123),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 124),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 125),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 126),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 127),
('MILTHON', 'SOLIS ROJAS', '79959897', '', 'PARQUE VIRREY TOLEDO', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 128),
('CARLOS EDUARDO', 'FERNANDEZ ROCHA', '79959897', '', 'C. VIRREY TOLEDO N° 1306', '', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', '', NULL, 129),
('MERY', 'SOSA DE VARGAS', '79687859', '', 'CALLE YANACOCHA N° 1186 ZONA NORTE', '', 'LA PAZ', 'LA PAZ', '', 'BOLIVIA', '', NULL, 130),
('MARIANELA ', 'YUJRA RENGEL', '65515500', '', 'PJE. IPORRE SALINAS N° 50 VILLA BUSCH', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4426855 TELF. DOMICILIO', NULL, 131),
('LUIS MARCIAL', 'VARGAS ZAPATA', '', '', 'CALLE VILLA DE OROPEZA N° 825', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 132),
('PATRICIA ERNESTINA ', 'LOMA PAZ', '', '', 'PASAJE EL ROSAL N° 20 ZONA QUERU QUERU', '', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', '', NULL, 133),
('JOSE YURI ', 'LUJAN POSTIGO', '72255073', '', 'CALLE BALDIVIEZO N° 558 ZONA CENTRAL', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 134);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_additional_item_numbers`
--

CREATE TABLE IF NOT EXISTS `phppos_additional_item_numbers` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`,`item_number`),
  UNIQUE KEY `item_number` (`item_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_app_config`
--

CREATE TABLE IF NOT EXISTS `phppos_app_config` (
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_app_config`
--

INSERT INTO `phppos_app_config` (`key`, `value`) VALUES
('additional_payment_types', ''),
('always_show_item_grid', '0'),
('auto_focus_on_item_after_sale_and_receiving', '1'),
('automatically_email_receipt', '0'),
('automatically_show_comments_on_receipt', '0'),
('averaging_method', 'historical_average'),
('barcode_price_include_tax', '0'),
('calculate_average_cost_price_from_receivings', '0'),
('change_sale_date_when_completing_suspended_sale', '0'),
('change_sale_date_when_suspending', '0'),
('commission_default_rate', '0'),
('company', 'PRADERAS DEL VALLE SRL'),
('company_logo', '0'),
('currency_symbol', 'Bs.'),
('customers_store_accounts', '1'),
('date_format', 'little_endian'),
('default_payment_type', 'Línea de crédito'),
('default_sales_person', 'logged_in_employee'),
('default_tax_1_name', ''),
('default_tax_1_rate', ''),
('default_tax_2_cumulative', '0'),
('default_tax_2_name', ''),
('default_tax_2_rate', ''),
('default_tax_3_name', ''),
('default_tax_3_rate', ''),
('default_tax_4_name', ''),
('default_tax_4_rate', ''),
('default_tax_5_name', ''),
('default_tax_5_rate', ''),
('default_tax_rate', '8'),
('disable_confirmation_sale', '0'),
('disable_giftcard_detection', '0'),
('disable_sale_notifications', '0'),
('disable_subtraction_of_giftcard_amount_from_sales', '0'),
('group_all_taxes_on_receipt', '0'),
('hide_barcode_on_sales_and_recv_receipt', '1'),
('hide_customer_recent_sales', '0'),
('hide_dashboard_statistics', '0'),
('hide_layaways_sales_in_reports', '0'),
('hide_signature', '0'),
('hide_store_account_payments_from_report_totals', '0'),
('hide_store_account_payments_in_reports', '0'),
('id_to_show_on_sale_interface', 'number'),
('language', 'spanish'),
('legacy_detailed_report_export', '0'),
('number_of_items_per_page', '500'),
('prices_include_tax', '0'),
('print_after_receiving', '1'),
('print_after_sale', '0'),
('receipt_text_size', 'small'),
('require_customer_for_sale', '1'),
('return_policy', 'Yo ................................................... con C.I. ........................... me comprometo al pago total del monto descrito en la presente nota, \n\n\n                                                                        Firma:..........................................'),
('round_cash_on_sales', '0'),
('round_tier_prices_to_2_decimals', '0'),
('sale_prefix', 'PDV - '),
('select_sales_person_during_sale', '1'),
('show_receipt_after_suspending_sale', '1'),
('spreadsheet_format', 'XLSX'),
('time_format', '12_hour'),
('track_cash', '1'),
('version', '14.4'),
('website', 'www.praderasdelvalle.com');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_app_files`
--

CREATE TABLE IF NOT EXISTS `phppos_app_files` (
  `file_id` int(10) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_data` longblob NOT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_customers`
--

CREATE TABLE IF NOT EXISTS `phppos_customers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `person_id` int(10) NOT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `balance` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  `credit_limit` decimal(23,10) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `cc_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_preview` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_issuer` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `tier_id` int(10) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `long` decimal(23,10) DEFAULT NULL,
  `lat` decimal(23,10) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `type` int(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  KEY `deleted` (`deleted`),
  KEY `cc_token` (`cc_token`),
  KEY `phppos_customers_ibfk_2` (`tier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=132 ;

--
-- Dumping data for table `phppos_customers`
--

INSERT INTO `phppos_customers` (`id`, `person_id`, `account_number`, `company_name`, `balance`, `credit_limit`, `taxable`, `cc_token`, `cc_preview`, `card_issuer`, `tier_id`, `location_id`, `long`, `lat`, `deleted`, `type`) VALUES
(1, 3, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.1594778000', '-17.4187589000', 0, 1),
(2, 4, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.2003332077', '-17.3899092158', 0, 1),
(3, 5, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.1594778000', '-17.4187589000', 0, 1),
(4, 6, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.1594778000', '-17.4187589000', 0, 1),
(5, 8, NULL, '', '552276.0100000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.1144409095', '-17.3885272749', 0, 1),
(6, 9, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.1561438953', '-17.3984993316', 1, 1),
(7, 10, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1163721000', '-17.3906364000', 0, 1),
(8, 11, NULL, '', '781692.4100000000', NULL, 0, NULL, NULL, '', NULL, 1, '-66.1163721000', '-17.3906364000', 1, 1),
(9, 12, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(10, 13, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(11, 14, NULL, '', '0.0000000000', NULL, 0, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(12, 15, '5210560 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(13, 16, '3122860 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(14, 17, '5266363 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(15, 18, '7898330 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(16, 19, '4466170 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(17, 20, '5050751 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(18, 21, '8017376 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(19, 22, '6420498 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(20, 23, '3962139 PO', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(21, 24, 'VIVE EN ESTADOS UNIDOS', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(22, 25, '6449564 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(23, 26, '4876366 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(24, 27, '5207001 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(25, 28, '4507836 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(26, 29, '6475730 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(27, 30, '8773356 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(28, 31, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(29, 32, '5576861 PO', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(30, 33, '3076516 OR', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(31, 34, '1142872 CH', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(32, 35, '5262652 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(33, 36, '4421747 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(34, 37, '4421752 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(35, 38, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(36, 39, '825640 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(37, 40, '3342612 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(38, 41, '5309690 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(39, 42, '4377598 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(40, 43, '3124220 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(41, 44, '4314051 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(42, 45, '6441886 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(43, 46, '5239574 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(44, 47, '3769295 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(45, 48, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(46, 49, '983687 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(47, 50, '6174643 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(48, 51, '4298065 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(49, 52, '3778398 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(50, 53, '4389276 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(51, 54, '3099681 OR', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(52, 55, '4411337 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(53, 56, '8049688 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(54, 57, '3057735 OR', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(55, 58, '6175126 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(56, 59, '3811939 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(57, 60, '3868839 S.C.', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(58, 61, '4525884 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(59, 62, '970360 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(60, 63, '4443542 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(61, 64, '811836 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(62, 65, '3529508 OR', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(63, 66, '6638118 PO', '', '1225556.4500000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1869865023', '-17.3518272763', 0, 1),
(64, 67, '2899007 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(65, 68, '3813140 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(66, 69, '8303430 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(67, 70, '4466777 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(68, 71, '6899350 LP', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(69, 72, '8046078 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4187688000', 0, 1),
(70, 73, '4044537 OR', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(71, 74, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 0, 1),
(72, 75, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(73, 76, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(74, 77, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(75, 78, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(76, 79, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(77, 80, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(78, 81, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(79, 82, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(80, 83, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(81, 84, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(82, 85, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(83, 86, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(84, 87, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(85, 88, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(86, 89, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(87, 90, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(88, 91, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(89, 92, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(90, 93, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(91, 94, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(92, 95, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(93, 96, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(94, 97, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(95, 98, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(96, 99, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(97, 100, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(98, 101, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(99, 102, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(100, 103, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(101, 104, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(102, 105, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(103, 106, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(104, 107, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(105, 108, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(106, 109, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(107, 110, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(108, 111, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(109, 112, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(110, 113, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(111, 114, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(112, 115, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(113, 116, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(114, 117, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(115, 118, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(116, 119, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(117, 120, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(118, 121, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(119, 122, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(120, 123, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(121, 124, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(122, 125, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(123, 126, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(124, 127, NULL, '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 0, NULL, NULL, 1, 1),
(125, 128, '3721515 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1),
(126, 129, '8051570 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1),
(127, 130, '2019398', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1),
(128, 131, '5235197 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1),
(129, 132, '3731046 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1),
(130, 133, '3780468 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1),
(131, 134, '2868895 CB', '', '0.0000000000', NULL, 1, NULL, NULL, '', NULL, 1, '-66.1593849000', '-17.4014646000', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_employees`
--

CREATE TABLE IF NOT EXISTS `phppos_employees` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `person_id` int(10) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commission_percent` decimal(23,10) DEFAULT '0.0000000000',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `phppos_employees`
--

INSERT INTO `phppos_employees` (`id`, `username`, `password`, `person_id`, `language`, `commission_percent`, `deleted`) VALUES
(1, 'admin', '176da0a32ec222b183a328763323fd47', 1, 'spanish', '0.0000000000', 0),
(2, 'lsrufino', '25d55ad283aa400af464c76d713c07ad', 2, 'spanish', '0.0000000000', 0),
(3, 'JPEREDO', '25d55ad283aa400af464c76d713c07ad', 7, 'spanish', '0.0000000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_employees_locations`
--

CREATE TABLE IF NOT EXISTS `phppos_employees_locations` (
  `employee_id` int(10) NOT NULL,
  `location_id` int(10) NOT NULL,
  PRIMARY KEY (`employee_id`,`location_id`),
  KEY `phppos_employees_locations_ibfk_2` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_employees_locations`
--

INSERT INTO `phppos_employees_locations` (`employee_id`, `location_id`) VALUES
(1, 1),
(2, 1),
(4, 1),
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_giftcards`
--

CREATE TABLE IF NOT EXISTS `phppos_giftcards` (
  `giftcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftcard_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` decimal(23,10) NOT NULL,
  `customer_id` int(10) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`giftcard_id`),
  UNIQUE KEY `giftcard_number` (`giftcard_number`),
  KEY `deleted` (`deleted`),
  KEY `phppos_giftcards_ibfk_1` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_inventory`
--

CREATE TABLE IF NOT EXISTS `phppos_inventory` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text COLLATE utf8_unicode_ci NOT NULL,
  `trans_inventory` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `phppos_inventory_ibfk_1` (`trans_items`),
  KEY `phppos_inventory_ibfk_2` (`trans_user`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=310 ;

--
-- Dumping data for table `phppos_inventory`
--

INSERT INTO `phppos_inventory` (`trans_id`, `trans_items`, `trans_user`, `trans_date`, `trans_comment`, `trans_inventory`, `location_id`) VALUES
(1, 1, 2, '2016-08-04 20:53:48', 'Edición Manual de Cantidad', '1.0000000000', 1),
(2, 1, 2, '2016-08-04 20:57:00', 'PDV -  1', '-1.0000000000', 1),
(3, 1, 2, '2016-08-04 20:57:20', 'PDV -  1', '1.0000000000', 1),
(4, 1, 2, '2016-08-04 20:57:20', 'PDV -  1', '-1.0000000000', 1),
(5, 1, 2, '2016-08-04 20:57:48', 'PDV -  1', '1.0000000000', 1),
(6, 1, 2, '2016-08-04 20:58:53', 'PDV -  2', '-1.0000000000', 1),
(7, 1, 2, '2016-08-04 20:59:46', 'PDV -  2', '1.0000000000', 1),
(8, 1, 2, '2016-08-04 20:59:46', 'PDV -  2', '-1.0000000000', 1),
(9, 1, 2, '2016-08-04 20:59:57', 'PDV -  2', '1.0000000000', 1),
(10, 1, 2, '2016-08-04 20:59:57', 'PDV -  2', '-1.0000000000', 1),
(11, 1, 2, '2016-08-04 21:05:28', 'PDV -  2', '1.0000000000', 1),
(12, 1, 2, '2016-08-04 21:05:28', 'PDV -  2', '-1.0000000000', 1),
(13, 1, 2, '2016-08-04 21:08:32', 'PDV -  2', '1.0000000000', 1),
(14, 1, 2, '2016-08-04 21:08:32', 'PDV -  2', '-1.0000000000', 1),
(15, 1, 2, '2016-08-04 21:14:56', 'PDV -  4', '-1.0000000000', 1),
(16, 1, 2, '2016-08-04 21:15:18', 'PDV -  4', '1.0000000000', 1),
(17, 1, 2, '2016-08-04 21:18:30', 'PDV -  2', '1.0000000000', 1),
(18, 1, 2, '2016-08-04 21:18:30', 'PDV -  2', '-1.0000000000', 1),
(19, 1, 2, '2016-08-04 21:21:05', 'PDV -  2', '1.0000000000', 1),
(20, 1, 2, '2016-08-04 21:21:05', 'PDV -  2', '-1.0000000000', 1),
(21, 1, 2, '2016-08-04 21:21:39', 'PDV -  2', '1.0000000000', 1),
(22, 1, 2, '2016-08-04 21:21:39', 'PDV -  2', '-1.0000000000', 1),
(23, 1, 2, '2016-08-04 21:22:01', 'PDV -  2', '1.0000000000', 1),
(24, 5, 2, '2016-08-04 21:58:14', 'Edición Manual de Cantidad', '1.0000000000', 1),
(25, 9, 2, '2016-08-04 22:11:29', 'Edición Manual de Cantidad', '1.0000000000', 1),
(26, 10, 2, '2016-08-04 22:19:04', 'Edición Manual de Cantidad', '1.0000000000', 1),
(27, 11, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(28, 12, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(29, 13, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(30, 14, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(31, 15, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(32, 16, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(33, 17, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(34, 18, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(35, 19, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(36, 20, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(37, 21, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(38, 22, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(39, 23, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(40, 24, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(41, 25, 2, '2016-08-04 22:25:26', 'Importar CSV', '1.0000000000', 1),
(42, 14, 2, '2016-08-05 13:56:21', 'PDV -  5', '-1.0000000000', 1),
(43, 14, 2, '2016-08-05 14:01:43', 'PDV -  6', '-1.0000000000', 1),
(44, 13, 2, '2016-08-05 14:01:43', 'PDV -  6', '-1.0000000000', 1),
(47, 41, 2, '2016-08-06 22:27:50', 'Importar CSV', '1000.0000000000', 1),
(48, 42, 2, '2016-08-06 22:27:50', 'Importar CSV', '1000.0000000000', 1),
(49, 43, 2, '2016-08-06 22:27:50', 'Importar CSV', '1000.0000000000', 1),
(50, 44, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(51, 45, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(52, 46, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(53, 47, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(54, 48, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(55, 49, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(56, 50, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(57, 51, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(58, 52, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(59, 53, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(60, 54, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(61, 55, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(62, 56, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(63, 57, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(64, 58, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(65, 59, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(66, 60, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(67, 61, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(68, 62, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(69, 63, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(70, 64, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(71, 65, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(72, 66, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(73, 67, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(74, 68, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(75, 69, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(76, 70, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(77, 71, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(78, 72, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(79, 73, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(80, 74, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(81, 75, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(82, 76, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(83, 77, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(84, 78, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(85, 79, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(86, 80, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(87, 81, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(88, 82, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(89, 83, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(90, 84, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(91, 85, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(92, 86, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(93, 87, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(94, 88, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(95, 89, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(96, 90, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(97, 91, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(98, 92, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(99, 93, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(100, 94, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(101, 95, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(102, 96, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(103, 97, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(104, 98, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(105, 99, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(106, 100, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(107, 101, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(108, 102, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(109, 103, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(110, 104, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(111, 105, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(112, 106, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(113, 107, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(114, 108, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(115, 109, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(116, 110, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(117, 111, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(118, 112, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(119, 113, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(120, 114, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(121, 115, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(122, 116, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(123, 117, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(124, 118, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(125, 119, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(126, 120, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(127, 121, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(128, 122, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(129, 123, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(130, 124, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(131, 125, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(132, 126, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(133, 127, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(134, 128, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(135, 129, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(136, 130, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(137, 131, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(138, 132, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(139, 133, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(140, 134, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(141, 135, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(142, 136, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(143, 137, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(144, 138, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(145, 139, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(146, 140, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(147, 141, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(148, 142, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(149, 143, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(150, 144, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(151, 145, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(152, 146, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(153, 147, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(154, 148, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(155, 149, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(156, 150, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(157, 151, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(158, 152, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(159, 153, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(160, 154, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(161, 155, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(162, 156, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(163, 157, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(164, 158, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(165, 159, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(166, 160, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(167, 161, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(168, 162, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(169, 163, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(170, 164, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(171, 165, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(172, 166, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(173, 167, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(174, 168, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(175, 169, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(176, 170, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(177, 171, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(178, 172, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(179, 173, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(180, 174, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(181, 175, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(182, 176, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(183, 177, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(184, 178, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(185, 179, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(186, 180, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(187, 181, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(188, 182, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(189, 183, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(190, 184, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(191, 185, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(192, 186, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(193, 187, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(194, 188, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(195, 189, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(196, 190, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(197, 191, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(198, 192, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(199, 193, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(200, 194, 2, '2016-08-06 22:27:50', 'Importar CSV', '1.0000000000', 1),
(201, 195, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(202, 196, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(203, 197, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(204, 198, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(205, 199, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(206, 200, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(207, 201, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(208, 202, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(209, 203, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(210, 204, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(211, 205, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(212, 206, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(213, 207, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(214, 208, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(215, 209, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(216, 210, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(217, 211, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(218, 212, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(219, 213, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(220, 214, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(221, 215, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(222, 216, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(223, 217, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(224, 218, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(225, 219, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(226, 220, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(227, 221, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(228, 222, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(229, 223, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(230, 224, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(231, 225, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(232, 226, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(233, 227, 2, '2016-08-06 22:27:51', 'Importar CSV', '1.0000000000', 1),
(234, 63, 2, '2016-08-07 01:51:57', 'PDV -  7', '-1.0000000000', 1),
(235, 63, 2, '2016-08-07 01:53:49', 'PDV -  8', '-1.0000000000', 1),
(236, 63, 2, '2016-08-07 01:58:26', 'PDV -  9', '-1.0000000000', 1),
(237, 184, 2, '2016-08-07 02:46:55', 'PDV -  17', '-1.0000000000', 1),
(238, 184, 2, '2016-08-07 02:50:14', 'PDV -  18', '-1.0000000000', 1),
(239, 184, 2, '2016-08-07 02:54:25', 'PDV -  20', '-1.0000000000', 1),
(240, 184, 2, '2016-08-07 02:55:47', 'PDV -  21', '-1.0000000000', 1),
(241, 184, 2, '2016-08-07 02:57:38', 'PDV -  22', '-1.0000000000', 1),
(242, 184, 2, '2016-08-07 03:00:33', 'PDV -  23', '-1.0000000000', 1),
(243, 56, 2, '2016-08-07 03:03:34', 'PDV -  25', '-1.0000000000', 1),
(244, 185, 2, '2016-08-07 19:05:25', 'PDV -  26', '-1.0000000000', 1),
(245, 135, 2, '2016-08-07 19:12:48', 'PDV -  27', '-1.0000000000', 1),
(246, 135, 2, '2016-08-07 19:14:45', 'PDV -  28', '-1.0000000000', 1),
(247, 135, 2, '2016-08-07 19:38:39', 'PDV -  29', '-1.0000000000', 1),
(248, 135, 2, '2016-08-07 19:44:07', 'PDV -  29', '1.0000000000', 1),
(249, 135, 2, '2016-08-07 19:45:42', 'PDV -  27', '1.0000000000', 1),
(250, 135, 2, '2016-08-07 19:46:12', 'PDV -  28', '1.0000000000', 1),
(251, 14, 2, '2016-08-10 22:39:05', 'PDV -  5', '1.0000000000', 1),
(252, 14, 2, '2016-08-10 22:39:05', 'PDV -  5', '-1.0000000000', 1),
(253, 14, 2, '2016-08-10 22:43:51', 'PDV -  30', '-1.0000000000', 1),
(254, 75, 2, '2016-08-10 22:57:21', 'PDV -  31', '-1.0000000000', 1),
(255, 75, 2, '2016-08-10 22:58:59', 'PDV -  31', '1.0000000000', 1),
(256, 75, 2, '2016-08-10 22:58:59', 'PDV -  31', '-1.0000000000', 1),
(257, 233, 2, '2016-08-11 15:24:56', 'PDV -  32', '-1.0000000000', 1),
(258, 233, 2, '2016-08-11 15:27:05', 'PDV -  33', '-1.0000000000', 1),
(259, 233, 2, '2016-08-11 15:28:40', 'PDV -  34', '-1.0000000000', 1),
(260, 233, 2, '2016-08-11 15:32:36', 'PDV -  35', '-1.0000000000', 1),
(261, 233, 2, '2016-08-11 15:33:56', 'PDV -  36', '-1.0000000000', 1),
(262, 233, 2, '2016-08-11 15:37:57', 'PDV -  37', '-1.0000000000', 1),
(263, 233, 2, '2016-08-11 15:40:49', 'PDV -  37', '1.0000000000', 1),
(264, 233, 2, '2016-08-11 15:40:49', 'PDV -  37', '-1.0000000000', 1),
(265, 233, 2, '2016-08-11 16:03:39', 'PDV -  37', '1.0000000000', 1),
(266, 233, 2, '2016-08-11 16:04:34', 'PDV -  38', '-1.0000000000', 1),
(267, 233, 2, '2016-08-11 16:07:27', 'PDV -  38', '1.0000000000', 1),
(268, 184, 2, '2016-08-11 16:11:23', 'PDV -  17', '1.0000000000', 1),
(269, 184, 2, '2016-08-11 16:12:13', 'PDV -  18', '1.0000000000', 1),
(270, 184, 2, '2016-08-11 16:12:44', 'PDV -  20', '1.0000000000', 1),
(271, 184, 2, '2016-08-11 16:13:17', 'PDV -  22', '1.0000000000', 1),
(272, 56, 2, '2016-08-11 16:13:32', 'PDV -  25', '1.0000000000', 1),
(273, 184, 2, '2016-08-11 16:14:26', 'PDV -  21', '1.0000000000', 1),
(274, 184, 2, '2016-08-11 16:17:33', 'PDV -  23', '1.0000000000', 1),
(275, 13, 2, '2016-08-11 16:19:03', 'PDV -  6', '1.0000000000', 1),
(276, 14, 2, '2016-08-11 16:19:03', 'PDV -  6', '1.0000000000', 1),
(277, 14, 2, '2016-08-11 16:19:34', 'PDV -  5', '1.0000000000', 1),
(278, 14, 2, '2016-08-11 16:21:03', 'PDV -  30', '1.0000000000', 1),
(279, 63, 2, '2016-08-11 16:21:47', 'PDV -  7', '1.0000000000', 1),
(280, 63, 2, '2016-08-11 16:22:27', 'PDV -  8', '1.0000000000', 1),
(281, 63, 2, '2016-08-11 16:23:09', 'PDV -  9', '1.0000000000', 1),
(282, 75, 2, '2016-08-11 16:24:50', 'PDV -  31', '1.0000000000', 1),
(283, 233, 2, '2016-08-11 16:26:03', 'PDV -  32', '1.0000000000', 1),
(284, 233, 2, '2016-08-11 16:26:15', 'PDV -  33', '1.0000000000', 1),
(285, 233, 2, '2016-08-11 16:26:30', 'PDV -  34', '1.0000000000', 1),
(286, 233, 2, '2016-08-11 16:26:59', 'PDV -  35', '1.0000000000', 1),
(287, 233, 2, '2016-08-11 16:27:13', 'PDV -  36', '1.0000000000', 1),
(288, 185, 2, '2016-08-11 16:31:23', 'Edición Manual de Cantidad', '1.0000000000', 1),
(289, 232, 2, '2016-08-11 16:31:59', 'Edición Manual de Cantidad', '1000.0000000000', 1),
(290, 233, 2, '2016-08-11 16:32:32', 'Edición Manual de Cantidad', '1.0000000000', 1),
(291, 233, 2, '2016-08-11 22:17:45', 'PDV -  35', '1.0000000000', 1),
(292, 150, 2, '2016-08-11 22:17:45', 'PDV -  35', '-1.0000000000', 1),
(293, 150, 2, '2016-08-11 22:21:02', 'PDV -  35', '1.0000000000', 1),
(294, 150, 2, '2016-08-11 22:23:55', 'PDV -  35', '1.0000000000', 1),
(295, 150, 2, '2016-08-11 22:23:55', 'PDV -  35', '-1.0000000000', 1),
(296, 185, 2, '2016-08-12 18:56:14', 'PDV -  26', '1.0000000000', 1),
(297, 150, 2, '2016-08-12 19:38:08', 'PDV -  39', '-1.0000000000', 1),
(298, 150, 2, '2016-08-12 19:39:17', 'PDV -  39', '1.0000000000', 1),
(299, 150, 2, '2016-08-23 21:25:52', 'PDV -  35', '1.0000000000', 1),
(300, 41, 2, '2016-08-23 21:30:19', 'PDV -  41', '-1.0000000000', 1),
(301, 233, 1, '2016-08-24 14:56:53', 'PDV -  48', '-1.0000000000', 1),
(302, 233, 1, '2016-09-07 19:28:19', 'PDV -  49', '-1.0000000000', 1),
(303, 233, 1, '2016-09-07 19:28:52', 'PDV -  48', '1.0000000000', 1),
(304, 233, 1, '2016-09-07 19:29:01', 'PDV -  49', '1.0000000000', 1),
(305, 233, 1, '2016-09-07 19:29:03', 'PDV -  49', '-1.0000000000', 1),
(306, 233, 1, '2016-09-07 19:29:39', 'PDV -  49', '1.0000000000', 1),
(307, 233, 1, '2016-09-07 19:29:52', '', '-1.0000000000', 1),
(308, 233, 1, '2016-09-07 19:30:19', 'PDV -  50', '-1.0000000000', 1),
(309, 41, 1, '2016-11-16 19:12:56', 'PDV -  51', '-1.0000000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items`
--

CREATE TABLE IF NOT EXISTS `phppos_items` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_included` int(1) NOT NULL DEFAULT '0',
  `cost_price` decimal(23,10) NOT NULL,
  `unit_price` decimal(23,10) NOT NULL,
  `promo_price` decimal(23,10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reorder_level` decimal(23,10) DEFAULT NULL,
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `image_id` int(10) DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT '0',
  `is_service` int(1) NOT NULL DEFAULT '0',
  `commission_percent` decimal(23,10) DEFAULT '0.0000000000',
  `commission_fixed` decimal(23,10) DEFAULT '0.0000000000',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_number` (`item_number`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `phppos_items_ibfk_1` (`supplier_id`),
  KEY `name` (`name`),
  KEY `category` (`category`),
  KEY `deleted` (`deleted`),
  KEY `phppos_items_ibfk_2` (`image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=235 ;

--
-- Dumping data for table `phppos_items`
--

INSERT INTO `phppos_items` (`name`, `category`, `supplier_id`, `item_number`, `product_id`, `description`, `size`, `tax_included`, `cost_price`, `unit_price`, `promo_price`, `start_date`, `end_date`, `reorder_level`, `item_id`, `allow_alt_description`, `is_serialized`, `image_id`, `override_default_tax`, `is_service`, `commission_percent`, `commission_fixed`, `deleted`) VALUES
('PDKM01L001', 'KALUYO', NULL, NULL, NULL, '', '', 0, '45000.0000000000', '45000.0000000000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('RESERVA', 'RESERVA', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 2, 0, 0, NULL, 0, 1, NULL, NULL, 1),
('MULTA x RETRASO', 'MULTAS', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 3, 0, 0, NULL, 0, 1, NULL, NULL, 1),
('', '', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 4, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L002', 'URBANIZACION PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 2', '300', 0, '94095.0000000000', '94095.0000000000', NULL, NULL, NULL, '1.0000000000', 5, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('RESERVA BS 100', 'RESERVA', NULL, NULL, NULL, 'RESERVA CON BS 100 CON VENCIMIENTO DE 24 HORAS', '', 0, '100.0000000000', '100.0000000000', NULL, NULL, NULL, NULL, 6, 1, 0, NULL, 0, 0, NULL, NULL, 1),
('RESERVA 100$us', 'RESERVA', NULL, NULL, NULL, 'RESERVA DE 100 DOLARES CON PLAZO DE 5 DIAS PARA COMPLETAR LA CUOTA INICIAL', '', 0, '697.0000000000', '697.0000000000', NULL, NULL, NULL, NULL, 7, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('MULTAS DIAS DE RETRASO', 'MULTAS POR DIAS DE RETRASO', NULL, NULL, NULL, '', '', 0, '6.9700000000', '6.9700000000', NULL, NULL, NULL, NULL, 8, 1, 0, NULL, 0, 0, NULL, NULL, 1),
('UPKM01L002', 'URBANIZACION PARAISO DE KALUYO', NULL, NULL, NULL, '', '300', 0, '10450.0000000000', '10450.0000000000', NULL, NULL, NULL, '1.0000000000', 9, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('UPKM01L003', 'URBANIZACION PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 3', '300', 0, '83640.0000000000', '94095.0000000000', NULL, NULL, NULL, '1.0000000000', 10, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L004', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 4', '300', 0, '94095.0000000000', '94095.0000000000', NULL, NULL, NULL, '1.0000000000', 11, 0, 0, NULL, 0, 0, NULL, '0.0000000000', 1),
('PDKM01L005', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 5', '300', 0, '94096.0000000000', '94096.0000000000', NULL, NULL, NULL, '1.0000000000', 12, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L006', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 6', '300', 0, '94097.0000000000', '94097.0000000000', NULL, NULL, NULL, '1.0000000000', 13, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L007', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 7', '300', 0, '94098.0000000000', '94098.0000000000', NULL, NULL, NULL, '1.0000000000', 14, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L008', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 8', '300', 0, '94099.0000000000', '94099.0000000000', NULL, NULL, NULL, '1.0000000000', 15, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L009', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 9', '300', 0, '94100.0000000000', '94100.0000000000', NULL, NULL, NULL, '1.0000000000', 16, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L010', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 10', '300', 0, '94101.0000000000', '94101.0000000000', NULL, NULL, NULL, '1.0000000000', 17, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L011', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 11', '300', 0, '94102.0000000000', '94102.0000000000', NULL, NULL, NULL, '1.0000000000', 18, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L012', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 12', '300', 0, '94103.0000000000', '94103.0000000000', NULL, NULL, NULL, '1.0000000000', 19, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L013', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 13', '300', 0, '94104.0000000000', '94104.0000000000', NULL, NULL, NULL, '1.0000000000', 20, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L014', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 14', '300', 0, '94105.0000000000', '94105.0000000000', NULL, NULL, NULL, '1.0000000000', 21, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L015', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 15', '300', 0, '94106.0000000000', '94106.0000000000', NULL, NULL, NULL, '1.0000000000', 22, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L016', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 16', '300', 0, '94107.0000000000', '94107.0000000000', NULL, NULL, NULL, '1.0000000000', 23, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L017', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 17', '300', 0, '94108.0000000000', '94108.0000000000', NULL, NULL, NULL, '1.0000000000', 24, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('PDKM01L018', 'PARAISO DE KALUYO', NULL, NULL, NULL, 'MANZANO 1 LOTE 18', '300', 0, '94109.0000000000', '94109.0000000000', NULL, NULL, NULL, '1.0000000000', 25, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('', '', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 26, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('', '', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 27, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('', '', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 28, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('', '', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 29, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('', '', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 30, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('', '', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 31, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('', '', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 32, 0, 0, NULL, 0, 0, NULL, NULL, 1),
('Abono a línea de crédito', 'Abono a línea de crédito', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 34, 0, 0, NULL, 1, 1, '0.0000000000', '0.0000000000', 1),
('RESERVA 24 HORAS', '100 BS', NULL, '000001', 'RESERVA 100', '', '', 0, '0.0000000000', '100.0000000000', NULL, NULL, NULL, NULL, 41, 0, 0, NULL, 0, 0, NULL, NULL, 0),
('RESERVA 5 DIAS', '697 BS', NULL, '000002', 'RESERVA 697', '', '', 0, '0.0000000000', '697.0000000000', NULL, NULL, NULL, NULL, 42, 0, 0, NULL, 0, 0, NULL, NULL, 0),
('CUOTA INICIAL', '', NULL, '000003', 'CUOTA INICIAL', '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 43, 0, 0, NULL, 0, 0, NULL, NULL, 0),
('PDKM001L0001', '50', NULL, NULL, NULL, '', '315.65', 0, '0.0000000000', '121004.4300000000', NULL, NULL, NULL, NULL, 44, 0, 0, NULL, 0, 0, NULL, '2209.5500000000', 1),
('PDKM001L0002', '45', NULL, '000005', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 45, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM001L0003', '45', NULL, '000006', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 46, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM001L0004', '45', NULL, '000007', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 47, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM001L0005', '45', NULL, '000008', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 48, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM001L0006', '45', NULL, '000009', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 49, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM001L0007', '55', NULL, '000010', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 50, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM001L0008', '55', NULL, '000011', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 51, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM001L0009', '55', NULL, '000012', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 52, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM001L0010', '55', NULL, '000013', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 53, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM001L0011', '45', NULL, '000014', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 54, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM001L0012', '45', NULL, '000015', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 55, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM001L0013', '45', NULL, '000016', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 56, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM001L0014', '45', NULL, '000017', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 57, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM001L0015', '45', NULL, '000018', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 58, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM001L0016', '50', NULL, '000019', NULL, '', '369.79', 0, '0.0000000000', '141759.0000000000', NULL, NULL, NULL, NULL, 59, 0, 0, NULL, 0, 0, NULL, '2588.5300000000', 0),
('PDKM001L0017', '45', NULL, '000020', NULL, '', '335.68', 0, '0.0000000000', '128682.9300000000', NULL, NULL, NULL, NULL, 60, 0, 0, NULL, 0, 0, NULL, '2349.7600000000', 0),
('PDKM001L0018', '45', NULL, '000021', NULL, '', '316.55', 0, '0.0000000000', '121349.4400000000', NULL, NULL, NULL, NULL, 61, 0, 0, NULL, 0, 0, NULL, '2215.8500000000', 0),
('PDKM002L0001', '50', NULL, '000022', NULL, '', '319.27', 0, '0.0000000000', '122392.1500000000', NULL, NULL, NULL, NULL, 62, 0, 0, NULL, 0, 0, NULL, '2234.8900000000', 0),
('PDKM002L0002', '45', NULL, '000023', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 63, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM002L0003', '45', NULL, '000024', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 64, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM002L0004', '45', NULL, '000025', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 65, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM002L0005', '45', NULL, '000026', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 66, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM002L0006', '45', NULL, '000027', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 67, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM002L0007', '50', NULL, '000028', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 68, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM002L0008', '45', NULL, '000029', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 69, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM002L0009', '45', NULL, '000030', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 70, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM002L0010', '55', NULL, '000031', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 71, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM002L0011', '45', NULL, '000032', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 72, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM002L0012', '45', NULL, '000033', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 73, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM002L0013', '45', NULL, '000034', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 74, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM002L0014', '45', NULL, '000035', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 75, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM002L0015', '45', NULL, '000036', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 76, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM002L0016', '50', NULL, '000037', NULL, '', '341.37', 0, '0.0000000000', '130864.1900000000', NULL, NULL, NULL, NULL, 77, 0, 0, NULL, 0, 0, NULL, '2389.5900000000', 0),
('PDKM002L0017', '45', NULL, '000038', NULL, '', '338.15', 0, '0.0000000000', '129629.8000000000', NULL, NULL, NULL, NULL, 78, 0, 0, NULL, 0, 0, NULL, '2367.0500000000', 0),
('PDKM003L0001', '55', NULL, '000039', NULL, '', '332.21', 0, '0.0000000000', '127352.7000000000', NULL, NULL, NULL, NULL, 79, 0, 0, NULL, 0, 0, NULL, '2325.4700000000', 0),
('PDKM003L0002', '45', NULL, '000040', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 80, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM003L0003', '45', NULL, '000041', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 81, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM003L0004', '45', NULL, '000042', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 82, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM003L0005', '45', NULL, '000043', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 83, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM003L0006', '45', NULL, '000044', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 84, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM003L0007', '50', NULL, '000045', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 85, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM003L0008', '45', NULL, '000046', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 86, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM003L0009', '45', NULL, '000047', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 87, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM003L0010', '50', NULL, '000048', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 88, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM003L0011', '45', NULL, '000049', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 89, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM003L0012', '45', NULL, '000050', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 90, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM003L0013', '45', NULL, '000051', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 91, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM003L0014', '45', NULL, '000052', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 92, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM003L0015', '45', NULL, '000053', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 93, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM003L0016', '50', NULL, '000054', NULL, '', '398.5', 0, '0.0000000000', '152764.9800000000', NULL, NULL, NULL, NULL, 94, 0, 0, NULL, 0, 0, NULL, '2789.5000000000', 0),
('PDKM004L0001', '55', NULL, '000055', NULL, '', '325', 0, '0.0000000000', '124588.7500000000', NULL, NULL, NULL, NULL, 95, 0, 0, NULL, 0, 0, NULL, '2275.0000000000', 0),
('PDKM004L0002', '55', NULL, '000056', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 96, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM004L0003', '55', NULL, '000057', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 97, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM004L0004', '55', NULL, '000058', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 98, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM004L0005', '55', NULL, '000059', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 99, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM004L0006', '55', NULL, '000060', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 100, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM004L0007', '45', NULL, '000061', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 101, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM004L0008', '45', NULL, '000062', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 102, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM004L0009', '50', NULL, '000063', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 103, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM004L0010', '45', NULL, '000064', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 104, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM004L0011', '45', NULL, '000065', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 105, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM004L0012', '45', NULL, '000066', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 106, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM004L0013', '45', NULL, '000067', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 107, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM004L0014', '55', NULL, '000068', NULL, '', '325', 0, '0.0000000000', '124588.7500000000', NULL, NULL, NULL, NULL, 108, 0, 0, NULL, 0, 0, NULL, '2275.0000000000', 0),
('PDKM005L0001', '50', NULL, '000069', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 109, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM005L0002', '45', NULL, '000070', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 110, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0003', '45', NULL, '000071', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 111, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0004', '45', NULL, '000072', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 112, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0005', '45', NULL, '000073', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 113, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0006', '45', NULL, '000074', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 114, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0007', '55', NULL, '000075', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 115, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM005L0008', '55', NULL, '000076', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 116, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0009', '55', NULL, '000077', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 117, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0010', '55', NULL, '000078', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 118, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0011', '55', NULL, '000079', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 119, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0012', '55', NULL, '000080', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 120, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0013', '55', NULL, '000081', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 121, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0014', '55', NULL, '000082', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 122, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0015', '55', NULL, '000083', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 123, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM005L0016', '45', NULL, '000084', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 124, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM005L0017', '45', NULL, '000085', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 125, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0001', '50', NULL, '000086', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 126, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM006L0002', '45', NULL, '000087', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 127, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0003', '45', NULL, '000088', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 128, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0004', '45', NULL, '000089', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 129, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0005', '45', NULL, '000090', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 130, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0006', '45', NULL, '000091', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 131, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0007', '50', NULL, '000092', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 132, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM006L0008', '45', NULL, '000093', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 133, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0009', '45', NULL, '000094', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 134, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0010', '55', NULL, '000095', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 135, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM006L0011', '45', NULL, '000096', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 136, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0012', '45', NULL, '000097', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 137, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0013', '45', NULL, '000098', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 138, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0014', '45', NULL, '000099', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 139, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0015', '45', NULL, '000100', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 140, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0016', '50', NULL, '000101', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 141, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM006L0017', '45', NULL, '000102', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 142, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM006L0018', '45', NULL, '000103', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 143, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0001', '55', NULL, '000104', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 144, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM007L0002', '45', NULL, '000105', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 145, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0003', '45', NULL, '000106', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 146, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0004', '45', NULL, '000107', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 147, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0005', '45', NULL, '000108', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 148, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0006', '45', NULL, '000109', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 149, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0007', '50', NULL, '000110', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 150, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM007L0008', '45', NULL, '000111', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 151, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0009', '45', NULL, '000112', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 152, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0010', '50', NULL, '000113', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 153, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM007L0011', '45', NULL, '000114', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 154, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0012', '45', NULL, '000115', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 155, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0013', '45', NULL, '000116', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 156, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0014', '45', NULL, '000117', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 157, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0015', '45', NULL, '000118', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 158, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0016', '50', NULL, '000119', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 159, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM007L0017', '45', NULL, '000120', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 160, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM007L0018', '45', NULL, '000121', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 161, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM008L0001', '55', NULL, '000122', NULL, '', '322.36', 0, '0.0000000000', '123576.7100000000', NULL, NULL, NULL, NULL, 162, 0, 0, NULL, 0, 0, NULL, '2256.5200000000', 0),
('PDKM008L0002', '45', NULL, '000123', NULL, '', '325', 0, '0.0000000000', '101936.2500000000', NULL, NULL, NULL, NULL, 163, 0, 0, NULL, 0, 0, NULL, '2275.0000000000', 0),
('PDKM008L0003', '50', NULL, '000124', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 164, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM008L0004', '55', NULL, '000125', NULL, '', '401.59', 0, '0.0000000000', '153949.5300000000', NULL, NULL, NULL, NULL, 165, 0, 0, NULL, 0, 0, NULL, '2811.1300000000', 0),
('PDKM008L0005', '55', NULL, '000126', NULL, '', '359.45', 0, '0.0000000000', '137795.1600000000', NULL, NULL, NULL, NULL, 166, 0, 0, NULL, 0, 0, NULL, '2516.1500000000', 0),
('PDKM008L0006', '55', NULL, '000127', NULL, '', '316.9', 0, '0.0000000000', '121483.6200000000', NULL, NULL, NULL, NULL, 167, 0, 0, NULL, 0, 0, NULL, '2218.3000000000', 0),
('PDKM008L0007', '55', NULL, '000128', NULL, '', '504.78', 0, '0.0000000000', '193507.4100000000', NULL, NULL, NULL, NULL, 168, 0, 0, NULL, 0, 0, NULL, '3533.4600000000', 0),
('PDKM008L0008', '55', NULL, '000129', NULL, '', '341.43', 0, '0.0000000000', '130887.1900000000', NULL, NULL, NULL, NULL, 169, 0, 0, NULL, 0, 0, NULL, '2390.0100000000', 0),
('PDKM009L0001', '50', NULL, '000130', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 170, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM009L0002', '45', NULL, '000131', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 171, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM009L0003', '45', NULL, '000132', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 172, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM009L0004', '55', NULL, '000133', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 173, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM009L0005', '55', NULL, '000134', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 174, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM009L0006', '55', NULL, '000135', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 175, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM009L0007', '55', NULL, '000136', NULL, '', '319.69', 0, '0.0000000000', '104550.0000000000', NULL, NULL, NULL, NULL, 176, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM010L0001', '50', NULL, '000137', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 177, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM010L0002', '45', NULL, '000138', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 178, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM010L0003', '45', NULL, '000139', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 179, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM010L0004', '45', NULL, '000140', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 180, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM010L0005', '45', NULL, '000141', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 181, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM010L0006', '55', NULL, '000142', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 182, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM010L0007', '55', NULL, '000143', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 183, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM010L0008', '55', NULL, '000144', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 184, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM010L0009', '55', NULL, '000145', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 185, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM010L0010', '55', NULL, '000146', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 186, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM010L0011', '55', NULL, '000147', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 187, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM010L0012', '45', NULL, '000148', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 188, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM010L0013', '50', NULL, '000149', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 189, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM010L0014', '45', NULL, '000150', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 190, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM010L0015', '45', NULL, '000151', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 191, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM011L0001', '45', NULL, '000152', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 192, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM011L0002', '45', NULL, '000153', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 193, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM011L0003', '55', NULL, '000154', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 194, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM011L0004', '55', NULL, '000155', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 195, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM011L0005', '55', NULL, '000156', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 196, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM011L0006', '55', NULL, '000157', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 197, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM011L0007', '45', NULL, '000158', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 198, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM011L0008', '45', NULL, '000159', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 199, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM011L0009', '55', NULL, '000160', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 200, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM011L0010', '45', NULL, '000161', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 201, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM011L0011', '45', NULL, '000162', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 202, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM011L0012', '45', NULL, '000163', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 203, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM011L0013', '45', NULL, '000164', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 204, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM011L0014', '50', NULL, '000165', NULL, '', '319.69', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 205, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM011L0015', '45', NULL, '000166', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 206, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM011L0016', '45', NULL, '000167', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 207, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM012L0001', '55', NULL, '000168', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 208, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM012L0002', '55', NULL, '000169', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 209, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM012L0003', '55', NULL, '000170', NULL, '', '297', 0, '0.0000000000', '113854.9500000000', NULL, NULL, NULL, NULL, 210, 0, 0, NULL, 0, 0, NULL, '2079.0000000000', 0),
('PDKM012L0004', '55', NULL, '000171', NULL, '', '319.7', 0, '0.0000000000', '122557.0000000000', NULL, NULL, NULL, NULL, 211, 0, 0, NULL, 0, 0, NULL, '2237.9000000000', 0),
('PDKM012L0005', '45', NULL, '000172', NULL, '', '300.02', 0, '0.0000000000', '94101.2700000000', NULL, NULL, NULL, NULL, 212, 0, 0, NULL, 0, 0, NULL, '2100.1400000000', 0),
('PDKM012L0006', '45', NULL, '000173', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 213, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM013L0001', '55', NULL, '000174', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 214, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM013L0002', '45', NULL, '000175', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 215, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM013L0003', '45', NULL, '000176', NULL, '', '297', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 216, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM013L0004', '45', NULL, '000177', NULL, '', '319.7', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 217, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM013L0005', '45', NULL, '000178', NULL, '', '300.02', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 218, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM013L0006', '50', NULL, '000179', NULL, '', '300', 0, '0.0000000000', '111411.9700000000', NULL, NULL, NULL, NULL, 219, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM013L0007', '55', NULL, '000180', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 220, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM013L0008', '55', NULL, '000181', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 221, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM013L0009', '55', NULL, '000182', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 222, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM013L0010', '55', NULL, '000183', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 223, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM013L0011', '45', NULL, '000184', NULL, '', '300', 0, '0.0000000000', '94095.0000000000', NULL, NULL, NULL, NULL, 224, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM013L0012', '55', NULL, '000185', NULL, '', '319.69', 0, '0.0000000000', '122553.1600000000', NULL, NULL, NULL, NULL, 225, 0, 0, NULL, 0, 0, NULL, '2237.8300000000', 0),
('PDKM013L0013', '55', NULL, '000186', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 226, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('PDKM013L0014', '55', NULL, '000187', NULL, '', '300', 0, '0.0000000000', '115005.0000000000', NULL, NULL, NULL, NULL, 227, 0, 0, NULL, 0, 0, NULL, '2100.0000000000', 0),
('', '', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 228, 0, 0, NULL, 0, 1, NULL, NULL, 1),
('', '', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 229, 0, 0, NULL, 0, 1, NULL, NULL, 1),
('', '', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 230, 0, 0, NULL, 0, 1, NULL, NULL, 1),
('Abono a línea de crédito', 'Abono a línea de crédito', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 231, 0, 0, NULL, 1, 1, '0.0000000000', '0.0000000000', 1),
('MULTAS DIAS DE RETRASO', 'MULTAS', NULL, '40', 'MULTAS POR RETRASO', 'REGISTRA LAS MULTAS POR DIAS DE RETRASO DE LOS CLIENTES\n', '', 0, '0.0000000000', '6.9700000000', NULL, NULL, NULL, '100.0000000000', 232, 1, 0, NULL, 0, 0, NULL, NULL, 0),
('PDKM001L0001', '55', NULL, '000004', 'URBANIZACION PARAISO DE KALUYO', 'MANZANO 1 LOTE 1', '315.65', 0, '0.0000000000', '121004.4300000000', NULL, NULL, NULL, '1.0000000000', 233, 0, 0, NULL, 0, 0, NULL, NULL, 0),
('Abono a línea de crédito', 'Abono a línea de crédito', NULL, NULL, NULL, '', '', 0, '0.0000000000', '0.0000000000', NULL, NULL, NULL, NULL, 234, 0, 0, NULL, 1, 1, '0.0000000000', '0.0000000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items_expenses`
--

CREATE TABLE IF NOT EXISTS `phppos_items_expenses` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax_included` int(1) NOT NULL DEFAULT '0',
  `cost_price` decimal(23,10) NOT NULL,
  `unit_price` decimal(23,10) NOT NULL,
  `promo_price` decimal(23,10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reorder_level` decimal(23,10) DEFAULT NULL,
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `image_id` int(10) DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT '0',
  `is_service` int(1) NOT NULL DEFAULT '0',
  `commission_percent` decimal(23,10) DEFAULT '0.0000000000',
  `commission_fixed` decimal(23,10) DEFAULT '0.0000000000',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_number` (`item_number`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `phppos_items_expenses_ibfk_1` (`supplier_id`),
  KEY `name` (`name`),
  KEY `category` (`category`),
  KEY `deleted` (`deleted`),
  KEY `phppos_items_expenses_ibfk_2` (`image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `phppos_items_expenses`
--

INSERT INTO `phppos_items_expenses` (`name`, `category`, `supplier_id`, `item_number`, `product_id`, `description`, `size`, `tax_included`, `cost_price`, `unit_price`, `promo_price`, `start_date`, `end_date`, `reorder_level`, `item_id`, `allow_alt_description`, `is_serialized`, `image_id`, `override_default_tax`, `is_service`, `commission_percent`, `commission_fixed`, `deleted`) VALUES
('COMISIONES POR PAGAR', 'GASTOS DE COMERCIALIZACION', NULL, '3000', '3000-01', 'PAGO DE COMISIONES POR VENTA DE TERRENOS DE 300 M2', '0', 0, '14637.0000000000', '14637.0000000000', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, 0, 1, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items_taxes`
--

CREATE TABLE IF NOT EXISTS `phppos_items_taxes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tax` (`item_id`,`name`,`percent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_items_tier_prices`
--

CREATE TABLE IF NOT EXISTS `phppos_items_tier_prices` (
  `tier_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `unit_price` decimal(23,10) DEFAULT '0.0000000000',
  `percent_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`tier_id`,`item_id`),
  KEY `phppos_items_tier_prices_ibfk_2` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kits`
--

CREATE TABLE IF NOT EXISTS `phppos_item_kits` (
  `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_kit_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_included` int(1) NOT NULL DEFAULT '0',
  `unit_price` decimal(23,10) DEFAULT NULL,
  `cost_price` decimal(23,10) DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT '0',
  `commission_percent` decimal(23,10) DEFAULT '0.0000000000',
  `commission_fixed` decimal(23,10) DEFAULT '0.0000000000',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_kit_id`),
  UNIQUE KEY `item_kit_number` (`item_kit_number`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `name` (`name`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kits_expenses`
--

CREATE TABLE IF NOT EXISTS `phppos_item_kits_expenses` (
  `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,
  `item_kit_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_included` int(1) NOT NULL DEFAULT '0',
  `unit_price` decimal(23,10) DEFAULT NULL,
  `cost_price` decimal(23,10) DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT '0',
  `commission_percent` decimal(23,10) DEFAULT '0.0000000000',
  `commission_fixed` decimal(23,10) DEFAULT '0.0000000000',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_kit_id`),
  UNIQUE KEY `item_kit_number` (`item_kit_number`),
  UNIQUE KEY `product_id` (`product_id`),
  KEY `name` (`name`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kits_taxes`
--

CREATE TABLE IF NOT EXISTS `phppos_item_kits_taxes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `item_kit_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tax` (`item_kit_id`,`name`,`percent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kits_tier_prices`
--

CREATE TABLE IF NOT EXISTS `phppos_item_kits_tier_prices` (
  `tier_id` int(10) NOT NULL,
  `item_kit_id` int(10) NOT NULL,
  `unit_price` decimal(23,10) DEFAULT '0.0000000000',
  `percent_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`tier_id`,`item_kit_id`),
  KEY `phppos_item_kits_tier_prices_ibfk_2` (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kit_items`
--

CREATE TABLE IF NOT EXISTS `phppos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(23,10) NOT NULL,
  PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  KEY `phppos_item_kit_items_ibfk_2` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_item_kit_items_expenses`
--

CREATE TABLE IF NOT EXISTS `phppos_item_kit_items_expenses` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(23,10) NOT NULL,
  PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  KEY `phppos_item_kit_items_ibfk_2` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_locations`
--

CREATE TABLE IF NOT EXISTS `phppos_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `address` text COLLATE utf8_unicode_ci,
  `phone` text COLLATE utf8_unicode_ci,
  `fax` text COLLATE utf8_unicode_ci,
  `email` text COLLATE utf8_unicode_ci,
  `receive_stock_alert` text COLLATE utf8_unicode_ci,
  `stock_alert_email` text COLLATE utf8_unicode_ci,
  `timezone` text COLLATE utf8_unicode_ci,
  `mailchimp_api_key` text COLLATE utf8_unicode_ci,
  `enable_credit_card_processing` text COLLATE utf8_unicode_ci,
  `merchant_id` text COLLATE utf8_unicode_ci,
  `merchant_password` text COLLATE utf8_unicode_ci,
  `default_tax_1_rate` text COLLATE utf8_unicode_ci,
  `default_tax_1_name` text COLLATE utf8_unicode_ci,
  `default_tax_2_rate` text COLLATE utf8_unicode_ci,
  `default_tax_2_name` text COLLATE utf8_unicode_ci,
  `default_tax_2_cumulative` text COLLATE utf8_unicode_ci,
  `default_tax_3_rate` text COLLATE utf8_unicode_ci,
  `default_tax_3_name` text COLLATE utf8_unicode_ci,
  `default_tax_4_rate` text COLLATE utf8_unicode_ci,
  `default_tax_4_name` text COLLATE utf8_unicode_ci,
  `default_tax_5_rate` text COLLATE utf8_unicode_ci,
  `default_tax_5_name` text COLLATE utf8_unicode_ci,
  `deleted` int(1) DEFAULT '0',
  PRIMARY KEY (`location_id`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `phppos_locations`
--

INSERT INTO `phppos_locations` (`location_id`, `name`, `address`, `phone`, `fax`, `email`, `receive_stock_alert`, `stock_alert_email`, `timezone`, `mailchimp_api_key`, `enable_credit_card_processing`, `merchant_id`, `merchant_password`, `default_tax_1_rate`, `default_tax_1_name`, `default_tax_2_rate`, `default_tax_2_name`, `default_tax_2_cumulative`, `default_tax_3_rate`, `default_tax_3_name`, `default_tax_4_rate`, `default_tax_4_name`, `default_tax_5_rate`, `default_tax_5_name`, `deleted`) VALUES
(1, 'PRADERAS DEL VALLE', 'AV. FUERZA AEREA N° 8207 ', '591 ( 4 ) 4557774', '', 'info@praderasdelvalle.com', '1', 'lsrufinop@praderasdelvalle.com', 'America/La_Paz', '', '0', 'ifernandez', 'KuD.1986', NULL, 'Sales Tax', NULL, 'Sales Tax 2', '0', NULL, '', NULL, '', NULL, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_items`
--

CREATE TABLE IF NOT EXISTS `phppos_location_items` (
  `location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cost_price` decimal(23,10) DEFAULT NULL,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `promo_price` decimal(23,10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `quantity` decimal(23,10) DEFAULT '0.0000000000',
  `reorder_level` decimal(23,10) DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`,`item_id`),
  KEY `phppos_location_items_ibfk_2` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_location_items`
--

INSERT INTO `phppos_location_items` (`location_id`, `item_id`, `location`, `cost_price`, `unit_price`, `promo_price`, `start_date`, `end_date`, `quantity`, `reorder_level`, `override_default_tax`) VALUES
(1, 1, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 2, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 3, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 4, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 5, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 6, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 7, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 8, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 9, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 10, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 11, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 12, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 13, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 14, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 15, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 16, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 17, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 18, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 19, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 20, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 21, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 22, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 23, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 24, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 25, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 26, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 27, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 28, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 29, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 30, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 31, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 32, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 41, '', NULL, NULL, NULL, NULL, NULL, '998.0000000000', NULL, 0),
(1, 42, '', NULL, NULL, NULL, NULL, NULL, '1000.0000000000', NULL, 0),
(1, 43, '', NULL, NULL, NULL, NULL, NULL, '1000.0000000000', NULL, 0),
(1, 44, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 45, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 46, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 47, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 48, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 49, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 50, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 51, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 52, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 53, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 54, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 55, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 56, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 57, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 58, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 59, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 60, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 61, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 62, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 63, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 64, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 65, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 66, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 67, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 68, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 69, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 70, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 71, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 72, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 73, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 74, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 75, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 76, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 77, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 78, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 79, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 80, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 81, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 82, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 83, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 84, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 85, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 86, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 87, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 88, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 89, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 90, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 91, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 92, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 93, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 94, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 95, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 96, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 97, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 98, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 99, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 100, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 101, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 102, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 103, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 104, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 105, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 106, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 107, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 108, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 109, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 110, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 111, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 112, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 113, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 114, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 115, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 116, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 117, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 118, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 119, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 120, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 121, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 122, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 123, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 124, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 125, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 126, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 127, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 128, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 129, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 130, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 131, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 132, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 133, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 134, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 135, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 136, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 137, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 138, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 139, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 140, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 141, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 142, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 143, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 144, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 145, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 146, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 147, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 148, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 149, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 150, '', NULL, NULL, NULL, NULL, NULL, '2.0000000000', NULL, 0),
(1, 151, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 152, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 153, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 154, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 155, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 156, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 157, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 158, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 159, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 160, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 161, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 162, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 163, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 164, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 165, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 166, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 167, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 168, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 169, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 170, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 171, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 172, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 173, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 174, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 175, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 176, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 177, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 178, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 179, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 180, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 181, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 182, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 183, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 184, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 185, '', NULL, NULL, NULL, NULL, NULL, '2.0000000000', NULL, 0),
(1, 186, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 187, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 188, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 189, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 190, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 191, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 192, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 193, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 194, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 195, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 196, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 197, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 198, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 199, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 200, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 201, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 202, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 203, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 204, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 205, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 206, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 207, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 208, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 209, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 210, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 211, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 212, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 213, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 214, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 215, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 216, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 217, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 218, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 219, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 220, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 221, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 222, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 223, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 224, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 225, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 226, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 227, '', NULL, NULL, NULL, NULL, NULL, '1.0000000000', NULL, 0),
(1, 228, '', NULL, NULL, NULL, NULL, NULL, '0.0000000000', NULL, 0),
(1, 229, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(1, 230, '', NULL, NULL, NULL, NULL, NULL, '0.0000000000', NULL, 0),
(1, 232, '', NULL, NULL, NULL, NULL, NULL, '1000.0000000000', NULL, 0),
(1, 233, '', NULL, NULL, NULL, NULL, NULL, '0.0000000000', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_items_expenses`
--

CREATE TABLE IF NOT EXISTS `phppos_location_items_expenses` (
  `location_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cost_price` decimal(23,10) DEFAULT NULL,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `promo_price` decimal(23,10) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `quantity` decimal(23,10) DEFAULT '0.0000000000',
  `reorder_level` decimal(23,10) DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`,`item_id`),
  KEY `phppos_location_items_expenses_ibfk_2` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_location_items_expenses`
--

INSERT INTO `phppos_location_items_expenses` (`location_id`, `item_id`, `location`, `cost_price`, `unit_price`, `promo_price`, `start_date`, `end_date`, `quantity`, `reorder_level`, `override_default_tax`) VALUES
(1, 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_items_taxes`
--

CREATE TABLE IF NOT EXISTS `phppos_location_items_taxes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `item_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(16,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tax` (`location_id`,`item_id`,`name`,`percent`),
  KEY `phppos_location_items_taxes_ibfk_2` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_items_tier_prices`
--

CREATE TABLE IF NOT EXISTS `phppos_location_items_tier_prices` (
  `tier_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `location_id` int(10) NOT NULL,
  `unit_price` decimal(23,10) DEFAULT '0.0000000000',
  `percent_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`tier_id`,`item_id`,`location_id`),
  KEY `phppos_location_items_tier_prices_ibfk_2` (`location_id`),
  KEY `phppos_location_items_tier_prices_ibfk_3` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_item_kits`
--

CREATE TABLE IF NOT EXISTS `phppos_location_item_kits` (
  `location_id` int(11) NOT NULL,
  `item_kit_id` int(11) NOT NULL,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `cost_price` decimal(23,10) DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`,`item_kit_id`),
  KEY `phppos_location_item_kits_ibfk_2` (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_item_kits_expenses`
--

CREATE TABLE IF NOT EXISTS `phppos_location_item_kits_expenses` (
  `location_id` int(11) NOT NULL,
  `item_kit_id` int(11) NOT NULL,
  `unit_price` decimal(23,10) DEFAULT NULL,
  `cost_price` decimal(23,10) DEFAULT NULL,
  `override_default_tax` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`,`item_kit_id`),
  KEY `phppos_location_item_kits_expenses_ibfk_2` (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_item_kits_taxes`
--

CREATE TABLE IF NOT EXISTS `phppos_location_item_kits_taxes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `item_kit_id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(16,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_tax` (`location_id`,`item_kit_id`,`name`,`percent`),
  KEY `phppos_location_item_kits_taxes_ibfk_2` (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_location_item_kits_tier_prices`
--

CREATE TABLE IF NOT EXISTS `phppos_location_item_kits_tier_prices` (
  `tier_id` int(10) NOT NULL,
  `item_kit_id` int(10) NOT NULL,
  `location_id` int(10) NOT NULL,
  `unit_price` decimal(23,10) DEFAULT '0.0000000000',
  `percent_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`tier_id`,`item_kit_id`,`location_id`),
  KEY `phppos_location_item_kits_tier_prices_ibfk_2` (`location_id`),
  KEY `phppos_location_item_kits_tier_prices_ibfk_3` (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_modules`
--

CREATE TABLE IF NOT EXISTS `phppos_modules` (
  `name_lang_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc_lang_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(10) NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_modules`
--

INSERT INTO `phppos_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `icon`, `module_id`) VALUES
('module_config', 'module_config_desc', 100, 'cogs', 'config'),
('module_customers', 'module_customers_desc', 10, 'group', 'customers'),
('module_employees', 'module_employees_desc', 80, 'user', 'employees'),
('module_giftcards', 'module_giftcards_desc', 90, 'credit-card', 'giftcards'),
('module_item_kits', 'module_item_kits_desc', 30, 'inbox', 'item_kits'),
('module_items', 'module_items_desc', 20, 'table', 'items'),
('module_items_expenses', 'module_items_expenses_desc', 25, 'taxi', 'items_expenses'),
('module_locations', 'module_locations_desc', 110, 'home', 'locations'),
('module_receivings', 'module_receivings_desc', 60, 'cloud-download', 'receivings'),
('module_reports', 'module_reports_desc', 50, 'bar-chart-o', 'reports'),
('module_sales', 'module_sales_desc', 70, 'shopping-cart', 'sales'),
('module_sales_expenses', 'module_sales_expenses_desc', 75, 'usd', 'sales_expenses'),
('module_suppliers', 'module_suppliers_desc', 40, 'download', 'suppliers');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_modules_actions`
--

CREATE TABLE IF NOT EXISTS `phppos_modules_actions` (
  `action_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `module_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `action_name_key` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`action_id`,`module_id`),
  KEY `phppos_modules_actions_ibfk_1` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_modules_actions`
--

INSERT INTO `phppos_modules_actions` (`action_id`, `module_id`, `action_name_key`, `sort`) VALUES
('add_update', 'customers', 'module_action_add_update', 1),
('add_update', 'employees', 'module_action_add_update', 130),
('add_update', 'giftcards', 'module_action_add_update', 200),
('add_update', 'item_kits', 'module_action_add_update', 70),
('add_update', 'items', 'module_action_add_update', 40),
('add_update', 'items_expenses', 'module_action_add_update', 45),
('add_update', 'locations', 'module_action_add_update', 240),
('add_update', 'suppliers', 'module_action_add_update', 100),
('assign_all_locations', 'employees', 'module_action_assign_all_locations', 151),
('delete', 'customers', 'module_action_delete', 20),
('delete', 'employees', 'module_action_delete', 140),
('delete', 'giftcards', 'module_action_delete', 210),
('delete', 'item_kits', 'module_action_delete', 80),
('delete', 'items', 'module_action_delete', 50),
('delete', 'items_expenses', 'module_action_delete', 55),
('delete', 'locations', 'module_action_delete', 250),
('delete', 'suppliers', 'module_action_delete', 110),
('delete_sale', 'sales', 'module_action_delete_sale', 230),
('delete_sale_expenses', 'sales_expenses', 'module_action_delete_sale_expenses', 235),
('delete_suspended_sale', 'sales', 'module_action_delete_suspended_sale', 181),
('delete_suspended_sale_expenses', 'sales_expenses', 'module_action_delete_suspended_sale_expenses', 185),
('delete_taxes', 'sales', 'module_action_delete_taxes', 182),
('delete_taxes', 'sales_expenses', 'module_action_delete_taxes', 187),
('edit_sale', 'sales', 'module_edit_sale', 190),
('edit_sale_expenses', 'sales_expenses', 'module_edit_sale_expenses', 195),
('edit_sale_expenses_price', 'sales_expenses', 'module_edit_sale_expenses_price', 175),
('edit_sale_price', 'sales', 'module_edit_sale_price', 170),
('edit_store_account_balance', 'customers', 'customers_edit_store_account_balance', 31),
('give_discount', 'sales', 'module_give_discount', 180),
('give_discount', 'sales_expenses', 'module_give_discount', 185),
('only_suspended_sale', 'sales', 'module_action_only_suspended_sale', 182),
('search', 'customers', 'module_action_search_customers', 30),
('search', 'employees', 'module_action_search_employees', 150),
('search', 'giftcards', 'module_action_search_giftcards', 220),
('search', 'item_kits', 'module_action_search_item_kits', 90),
('search', 'items', 'module_action_search_items', 60),
('search', 'items_expenses', 'module_action_search_items', 65),
('search', 'locations', 'module_action_search_locations', 260),
('search', 'suppliers', 'module_action_search_suppliers', 120),
('see_cost_price', 'item_kits', 'module_see_cost_price', 91),
('see_cost_price', 'items', 'module_see_cost_price', 61),
('see_cost_price', 'items_expenses', 'module_see_cost_price', 66),
('show_cost_price', 'reports', 'reports_show_cost_price', 290),
('show_profit', 'reports', 'reports_show_profit', 280),
('view_categories', 'reports', 'reports_categories', 100),
('view_commissions', 'reports', 'reports_commission', 111),
('view_customers', 'reports', 'reports_customers', 120),
('view_deleted_sales', 'reports', 'reports_deleted_sales', 130),
('view_discounts', 'reports', 'reports_discounts', 140),
('view_employees', 'reports', 'reports_employees', 150),
('view_giftcards', 'reports', 'reports_giftcards', 160),
('view_inventory_reports', 'reports', 'reports_inventory_reports', 170),
('view_item_kits', 'reports', 'module_item_kits', 180),
('view_items', 'reports', 'reports_items', 190),
('view_payments', 'reports', 'reports_payments', 200),
('view_profit_and_loss', 'reports', 'reports_profit_and_loss', 210),
('view_receivings', 'reports', 'reports_receivings', 220),
('view_register_log', 'reports', 'reports_register_log_title', 230),
('view_sales', 'reports', 'reports_sales', 240),
('view_sales_generator', 'reports', 'reports_sales_generator', 110),
('view_store_account', 'reports', 'reports_store_account', 250),
('view_suppliers', 'reports', 'reports_suppliers', 260),
('view_suspended_sales', 'reports', 'reports_suspended_sales', 261),
('view_taxes', 'reports', 'reports_taxes', 270);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_people`
--

CREATE TABLE IF NOT EXISTS `phppos_people` (
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `zip` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comments` text COLLATE utf8_unicode_ci NOT NULL,
  `image_id` int(10) DEFAULT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`),
  KEY `first_name` (`first_name`),
  KEY `last_name` (`last_name`),
  KEY `email` (`email`),
  KEY `phppos_people_ibfk_1` (`image_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=135 ;

--
-- Dumping data for table `phppos_people`
--

INSERT INTO `phppos_people` (`first_name`, `last_name`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `image_id`, `person_id`) VALUES
('Israel', 'Fernandez', '71490527', 'ifernandez@wokdata.net', 'Av. Heroinas N 278', 'Av. Heroinas N 278', 'cochabamba', 'Cercado', '0000', 'Bolivia', '', NULL, 1),
('Livia', 'Rufino Peralta', '', '', '', '', '', '', '', '', '', NULL, 2),
('YAMIRA MARCIA CONNI', 'GUTIERREZ DE FERNANDEZ', '76904681', '', 'CALLE INNOMINADA S/N', 'ZONA COTAPACHI', 'COCHABAMBA', '', '', 'BOLIVIA', '', NULL, 3),
('SANTIAGO ', 'QUISPE HUARAYO', '72748792', '', 'CALLE EDUARDO RIVAS N° 1994 ', 'ZONA CERRO VERDE SAN MIGUEL', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', 'CLIENTE DE GENARO CABEZAS HERRERA.\n', NULL, 4),
('EDGAR ALEJANDRO', 'REVOLLO SAAVEDRA', '', '', 'AVENIDA MARISCAL DE AYACUCHO S/N', 'ESQUINA BLANCO GALINDO KM. 6 SANTA ROSA SUD ', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', 'COMPRA DE LOTE A CREDITO 60 MESES CON INTERES DEL 10% ANUAL, MANZANO 2 LOTE 2.', NULL, 5),
('SONIA LUZ', 'ROJAS BLANCO', '4569848', '', '', 'AV. BARRIENTOS S/N', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', 'LOTE 14 MZ 2', NULL, 6),
('JIMMY RONALD ', 'PEREDO ZAMBRANA', '79961004', 'jrperedoz@gmail.com', 'AV. FUERZA AEREA NRO 8207', 'ZONA JAIHUAYCO', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', '', NULL, 7),
('DULFREDO CARLOS ', 'VILLA PEREIRA', '72219874', '', 'CALLE URUGUAY N° 575', 'ZONA CENTRAL', 'COCHABAMBA', '', '', '', 'MANZANO 1 LOTE 1 PLAZO 60 MESES\n', NULL, 8),
('DULFREDO CARLOS ', 'VILLA PEREIRA', '72219874', '', 'CALLE URUGUAY N° 575', 'ZONA CENTRAL', 'COCHABAMBA', '', '', '', 'MANZANO 1 LOTE 1 PLAZO 60 MESES\n', NULL, 9),
('ZULMA ', 'CORO CONDORI', '4557774', '', 'CALLE EDUARDO RIVAS N° 1994', '', '', '', '', '', '', NULL, 10),
('YAMIRA MARCIA CONNI', 'GUTIERREZ DE FERNANDEZ', '76904681', '', 'CALLE INNOMINADA S/N', 'ZONA COTAPACHI', 'COCHABAMBA', '', '', 'BOLIVIA', '', NULL, 11),
('VIRGINIA ', 'CAMACHO ROJAS', '65340074', '', 'AVENIDA SUECIA PASAJE 008 ESQUINA QUEBRACHO', '', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', 'COMPRA A CREDITO DE 18 MESES URBANIZACION PARAISO DE KALUYO MANZANO  10 LOTE 8', NULL, 12),
('ZULMA ', 'CORO CONDORI', '4557774', '', 'CALLE EDUARDO RIVAS N° 1994', '', '', '', '', '', '', NULL, 13),
('GONZALO ANDRES', 'TICONA CAHUANA', '', '', '', '', '', '', '', '', '', NULL, 14),
('HERNAN AGUSTIN', 'RODRIGUEZ GUTIERREZ', '60708015', '', 'AV. CHAPARE KM. 5', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '70792829 4720434', NULL, 15),
('IVONE NEYZA', 'ALBA VDA. DE GUTIERREZ', '75916216', '', 'AV. MANCO KAPAC N° 1079', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4581404', NULL, 16),
('CLYDE', 'LOZA QUISPE', '68499720', '', 'CALLE PARAISO S/N BLANCO GALINDO KM. 10 1/2', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '77433238 MARCELINA QUISPE  79980507 CLAUDIA LOZA', NULL, 17),
('JUAN CARLOS ', 'HUAYCHO LAURA', '67409495', '', 'CALLE LIDIA TEJADA SORZANO N° 208 VILLA COSMOS', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 18),
('MONJE', 'HUAYCHO LAURA', '77906557', '', 'CALLE LIDIA TEJADA SORZANO N° 208 VILLA COSMOS', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 19),
('MARIA RENE', 'GAMES PINTO', '77280802', '', 'CALLE BARTOLOME DE LAS CASAS N° 1228', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4416578 CASA 71132924', NULL, 20),
('PAULO CESAR', 'APAZA MIRANDA', '72790681', '', 'AV. SUECIA N° 315 ZONA HUAYRA KHASA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 21),
('JAVIER ', 'TERAN BENAVIDES', '79368724', '', 'AV. SIMON I. PATIÑO S/N VINTO', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4153999 INT 3822 ', NULL, 22),
('MARCO ANTONIO', 'CAMPOS PEREZ', '74827678', '', 'AV. HERNAN SILES N° 2721 ZONA NORTE', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 23),
('CARMEN ROSA ', 'HERBAS DE VELASCO', '79377154', '', 'URB. MIRAFLORES CHILLIMARCA TIQUIPAYA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 24),
('JORGE ARIEL', 'ROMERO REVOLLO', '79797335', '', 'CALLE CAPITAN LUIS RIVERA N° 2850 ENTRE FINAL CABILDO Y LUIS PARAVICINI', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4527579', NULL, 25),
('EDUVIGES', 'LOPEZ NINA', '71240527', '', 'CALLE IDELFONSO MURGUIA S/N ENTRE MELCHOR PEREZ DE OLGUIN Y GABRIEL RENE MORENO', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 26),
('RICARDO VLADIMIR ', 'ARISPE LOPEZ', '77998899', '', 'PASAJE MIGUEL DE CERVANTES N° 8 ZONA TEMPORAL', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 27),
('DUSTIN CHAKER ', 'GONZALES SANDOVAL', '70748909', '', 'CALLE CAÑADA COCHABAMBA N° 2256 ZONA CHIMBA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '67594714', NULL, 28),
('EVELIN', 'BALDIVIESO LIMA', '79746610', '', 'PASAJE EL PALMAR N° 130 VILLA FELICIDAD', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4224101', NULL, 29),
('ANABEL', 'ANTERQUERA CHOQUE', '70792223', '', 'CALLE CARLOS PEÑA N° 3 BARRIO CATAVI AV. BLANCO GALINDO KM. 10 1/2', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4350621 DOMICILIO 65730562 JOSE ANTEQUERA 65338008 LENNY ANTEQUERA', NULL, 30),
('BENEDICTA ', 'TICONA VALLE', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 31),
('ANA MARIA ', 'CRUZ ESCOBAR', '69677325', '', 'AV. PETROLERA KM. 3 1/2', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '77407246 ARIEL ESPOSO', NULL, 32),
('EDGAR ALFREDO ', 'RODRIGUEZ MAMANI', '73797687', '', 'CALLE INNOMINADA S/N BARRIO SAN GABRIEL ', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '65325956 NILKA (HIJA) 60712969 LAURA (HIJA)', NULL, 33),
('CLAUDIA ANDREA ', 'LOPEZ CALIZAYA', '76411511', '', 'AV.PETROLERA KM. 3 1/2', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4765945 4550312 75471661', NULL, 34),
('MARIA DEL PILAR ', 'MENDOZA GONZALES', '70302182', '', '', 'PASAJE DEL MITAYO N° 847 ZONA HIPODROMO', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4241678 DOMICILIO ', NULL, 35),
('NERY BHETZABE', 'LOZA QUISPE', '60380548', '', 'CALLE PARAISO S/N BLANCO GALINDO KM. 10 1/2', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '79980507 CLAUDIA LOZA 68499720 CLYDE LOZA', NULL, 36),
('CLAUDIA ANDREA ', 'LOZA QUISPE', '79980507', '', 'CALLE PARAISO S/N BLANCO GALINDO KM. 10 1/2', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '75916437 WILMER 69487071 EDGAR', NULL, 37),
('SONIA LUZ ROJAS BLANCO', '', '79347569', '', 'CALLE PORFIRIO DIAZ N° 250 ZONA TEMPORAL', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4569848 4596130 JHONNY ALVAREZ 79703919', NULL, 38),
('VIRGINIA', 'COSSIO DE VARGAS', '65329151', '', 'CALLE SUCRE S/N QUILLACOLLO ZONA PURGATORIO', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '76951600', NULL, 39),
('ALICIA ', 'CHAMBI MAMANI', '', '', 'PASAJE DAKAR S/N VILLA PAGADOR', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 40),
('ALEJANDRA MONICA', 'QUINTANILLA LANG', '70371277', '', 'CALLE LUIS CALVO N° 2360 QUERU QUERU', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4453113', NULL, 41),
('FREDDY ALONZO ', 'COAQUIRA TIÑINI', '79102113', '', 'AV. PEDRO DOMINGO MURILLO N° 2300 ZONA AMERICA I', '', 'LA PAZ', 'CERCADO', '', 'BOLIVIA', '74024401 MARIA ROJAS (ESPOSA)', NULL, 42),
('MARIO', 'MAMANI HUARACHI', '71477270', '', 'CALLE SEVERO FERNANDEZ S/N VILLA JERUSALEM ZONA SUD', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', 'BARBARA VENTURA SAJAMA (ESPOSA)', NULL, 43),
('JUAN   ', 'ALVAREZ CUSSI', '73544452', '', 'UNIDAD VECINAL 6-25 N°543 URBANIZACION MARISCAL SANTA CRUZ', '', 'LA PAZ', 'CERCADO', '', 'BOLIVIA', '73065865 ROGELIA TANCARA CHUQUIMIA (ESPOSA)', NULL, 44),
('PLACIDA ', 'VALLEJOS VELARDE', '67536680', '', 'CALLE 6 DE AGOSTO S/N PUNATA', '', 'COCHABAMBA', 'PUNATA', '', 'BOLIVIA', '69533627 JOSE (ESPOSO CUBANO)', NULL, 45),
('MELQUEADES', 'AYALA COLQUE', '73332995', '', 'CALLE INNOMINADA S/N BARRIO KAMI', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '73438596', NULL, 46),
('DANY FRANZ', 'VOCAL ARZE', '79781911', '', 'CALLE J.M. MORALES S/N ZONA PACATA BAJA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 47),
('LIDIA ', 'RAMOS VARGAS', '72934355', '', 'CALLE PORTO NOVO S/N BARRIO GUALBERTO VILLARROEL', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 48),
('BERTHA', 'MEGUILLANES UNTIVEROS', '68456060', '', 'CALLE SAN MIGUEL S/N ZONA CONVENTO', '', 'COCHABAMBA', 'TARATA', '', 'BOLIVIA', '4578229', NULL, 49),
('RICARDO JUAN ', 'FUENTES SOSA', '79535235', '', 'AV. BUSCH EDIFICIO BOSTON DEPTO 3C ZONA MIRAFLORES', '', 'LA PAZ', 'CERCADO', '', 'BOLIVIA', '68109002', NULL, 50),
('ISELA ', 'CHAVEZ LEON', '4256349', '', 'CALLE LANZA N° 940 ENTRE BRASIL Y HONDURAS', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '67412193 - 71491176 JULIO GANDARILLAS (ESPOSO)', NULL, 51),
('GUIDO', 'AYALA TERRAZAS', '60704510', '', 'CALLE PULACAYO ESQUINA COLQUIRI ALOJAMIENTO ARGENTINA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 52),
('JUAN CARLOS ', 'VASQUEZ MERCADO', '72091105', '', 'CALLE "24" S/N ESQUINA DERECHOS HUMANOS ZONA VALLE HERMOSO', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 53),
('ROSSMERY CHOQUE ARPITA', 'CHOQUE ARPITA', '73176048', '', 'CALLE SANTA CRUZ N° 306 BARRIO 26 DE DICIEMBRE', '', 'SANTA CRUZ', 'CERCADO', '', 'BOLIVIA', '', NULL, 54),
('ALBERTO', 'MORALES JACINTO', '4306538', '', 'CALLE NICETO RODRIGUEZ S/N BARRIO COLQUIRI ZONA SUD', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 55),
('ALVARO ', 'SANCHEZ LAURA', '69421098', '', 'AV. BLANCO GALINDO KM. 6 BARRIO OASIS', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 56),
('ROSSE MARY ', 'SOLIZ OLIVAREZ DE VASQUEZ', '72482457', '', 'CALLE GALLEGUILLOS N° 211 ESQ. AV. DEL MAESTRO', '', 'ORURO', 'CERCADO', '', 'BOLIVIA', '73320672 ROXANA SOLIZ OLIVARES 5238211 LUCY MALDONADO', NULL, 57),
('PAOLA MERY', 'DEL VILLAR PEÑARANDA', '71548544', '', 'CALLE YANACOCHA N° 888 ZONA NORTE ', '', 'LA PAZ', 'CERCADO', '', 'BOLIVIA', '', NULL, 58),
('SABINA ', 'VILLCA NINAJA', '75908891', '', 'CALLE 8 S/N VALLE HERMOSO', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 59),
('CARLOS ANTONIO', 'RAMIREZ ANTEZANA', '72101633', '', 'CALLE SEVERO OCHOA S/N ZONA PAMPA GRANDE', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '72141837 CLAUDIA PEREIRA MORALES (ESPOSA)', NULL, 60),
('EDGAR  ', 'VILLANUEVA CHAMBI ', '', '', 'ESPAÑA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 61),
('SENOVIA BACILIA ', 'HERBAS LAFUENTE', '60748445', '', 'CALLE MIGUEL DE CERVANTES Y CALLE MOSTAJO S/N ZONA TEMPORAL', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 62),
('ROCIO BEATRIZ', 'VILLANUEVA CHAMBI ', '', '', 'ESPAÑA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 63),
('MARIA LUISA ', 'CABRERA PADILLA', '70763646', '', 'AV. CALANCHA N° 1217 ', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 64),
('GENARO', 'CABEZAS HERRERA', '65347960', ' ', 'SAN ANTONIO DE BUENA VISTA PARADA MICRO "H"', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 65),
('DOMINGA ', 'AGUANTA ACUÑA', '78325498', '', 'CALLE LOS CEDROS N° 958 SUMUNPAYA SUD AV. BLANCO GALINDO KM 8', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '76463650 WILBER SEGOVIA AGUANTA', NULL, 66),
('MARIA ROSARIO', 'MEGUILLANES UNTIVEROS', '', '', 'CALLE SAN MIGUEL S/N ZONA CONVENTO', '', 'COCHABAMBA', 'TARATA', '', 'BOLIVIA', '', NULL, 67),
('SANDRA HERMINIA', 'MEGUILLANES UNTIVEROS', '', '', 'CALLE SAN MIGUEL S/N ZONA CONVENTO', '', 'COCHABAMBA', 'TARATA', '', 'BOLIVIA', '', NULL, 68),
('MARIA RENE ', 'CABA UGARTE', '60700329', '', 'CALLE LUIS CALVO N° 2146 ESQ. CIRCUNVALACION ZONA QUERU QUERU', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4040038', NULL, 69),
('JOSE BENITO', 'PEÑALOZA', '72323651', '', 'AV. PETROLERA KM. 9 ZONA USPA USPA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '77916708 DELICIA BLANCO ROJAS(ESPOSA)', NULL, 70),
('PABLO ERNESTO', 'CERVANTES LOPEZ', '75816971', '', 'CALLE PORTOCARREÑO N° 1154 ZONA FRANZ TAMAYO', '', 'LA PAZ', 'EL ALTO', '', 'BOLIVIA', '', NULL, 71),
('ISRAEL ', 'BUENO CAHUANA', '71852434', '', 'AV. BLANCO GALINDO KM. 6 BARRIO SANTA ROSA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '71852434 VIRGINIA CAHUANA FLORES (MAMA)', NULL, 72),
('ALVARO LUIS', 'CONDORI MENDOZA', '75487825', '', 'CALLE "12" S/N ZONA CANDELARIA', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '76949071 CARLA LORENA ARIAS SOLIS (ESPOSA)', NULL, 73),
('PASTOR ', 'LANZA CLEMENTE', '71831262', '', 'CALLE EMANUEL ASENCIO PADILLA N° 7 CASI ESQUINA JAIME MENDOZA BARRIO SAN PABLO', '', 'SUCRE', 'CERCADO', '', 'BOLIVIA', '78721321 JIMENA LANZA (HIJA)', NULL, 74),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 75),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 76),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 77),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 78),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 79),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 80),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 81),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 82),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 83),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 84),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 85),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 86),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 87),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 88),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 89),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 90),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 91),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 92),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 93),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 94),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 95),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 96),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 97),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 98),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 99),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 100),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 101),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 102),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 103),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 104),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 105),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 106),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 107),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 108),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 109),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 110),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 111),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 112),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 113),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 114),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 115),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 116),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 117),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 118),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 119),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 120),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 121),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 122),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 123),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 124),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 125),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 126),
('', '', '', '', '', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 127),
('MILTHON', 'SOLIS ROJAS', '79959897', '', 'PARQUE VIRREY TOLEDO', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 128),
('CARLOS EDUARDO', 'FERNANDEZ ROCHA', '79959897', '', 'C. VIRREY TOLEDO N° 1306', '', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', '', NULL, 129),
('MERY', 'SOSA DE VARGAS', '79687859', '', 'CALLE YANACOCHA N° 1186 ZONA NORTE', '', 'LA PAZ', 'LA PAZ', '', 'BOLIVIA', '', NULL, 130),
('MARIANELA ', 'YUJRA RENGEL', '65515500', '', 'PJE. IPORRE SALINAS N° 50 VILLA BUSCH', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '4426855 TELF. DOMICILIO', NULL, 131),
('LUIS MARCIAL', 'VARGAS ZAPATA', '', '', 'CALLE VILLA DE OROPEZA N° 825', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 132),
('PATRICIA ERNESTINA ', 'LOMA PAZ', '', '', 'PASAJE EL ROSAL N° 20 ZONA QUERU QUERU', '', 'COCHABAMBA', 'CERCADO', '591', 'BOLIVIA', '', NULL, 133),
('JOSE YURI ', 'LUJAN POSTIGO', '72255073', '', 'CALLE BALDIVIEZO N° 558 ZONA CENTRAL', '', 'COCHABAMBA', 'CERCADO', '', 'BOLIVIA', '', NULL, 134);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_permissions`
--

CREATE TABLE IF NOT EXISTS `phppos_permissions` (
  `module_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`module_id`,`person_id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_permissions`
--

INSERT INTO `phppos_permissions` (`module_id`, `person_id`) VALUES
('config', 1),
('customers', 1),
('employees', 1),
('giftcards', 1),
('item_kits', 1),
('items', 1),
('items_expenses', 1),
('locations', 1),
('receivings', 1),
('reports', 1),
('sales', 1),
('sales_expenses', 1),
('suppliers', 1),
('config', 2),
('customers', 2),
('employees', 2),
('items', 2),
('items_expenses', 2),
('locations', 2),
('receivings', 2),
('reports', 2),
('sales', 2),
('sales_expenses', 2),
('customers', 4),
('sales', 4),
('customers', 7),
('items', 7);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_permissions_actions`
--

CREATE TABLE IF NOT EXISTS `phppos_permissions_actions` (
  `module_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `person_id` int(11) NOT NULL,
  `action_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`module_id`,`person_id`,`action_id`),
  KEY `phppos_permissions_actions_ibfk_2` (`person_id`),
  KEY `phppos_permissions_actions_ibfk_3` (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_permissions_actions`
--

INSERT INTO `phppos_permissions_actions` (`module_id`, `person_id`, `action_id`) VALUES
('customers', 1, 'add_update'),
('customers', 1, 'delete'),
('customers', 1, 'edit_store_account_balance'),
('customers', 1, 'search'),
('employees', 1, 'add_update'),
('employees', 1, 'assign_all_locations'),
('employees', 1, 'delete'),
('employees', 1, 'search'),
('giftcards', 1, 'add_update'),
('giftcards', 1, 'delete'),
('giftcards', 1, 'search'),
('item_kits', 1, 'add_update'),
('item_kits', 1, 'delete'),
('item_kits', 1, 'search'),
('item_kits', 1, 'see_cost_price'),
('items', 1, 'add_update'),
('items', 1, 'delete'),
('items', 1, 'search'),
('items', 1, 'see_cost_price'),
('items_expenses', 1, 'add_update'),
('items_expenses', 1, 'delete'),
('items_expenses', 1, 'search'),
('items_expenses', 1, 'see_cost_price'),
('locations', 1, 'add_update'),
('locations', 1, 'delete'),
('locations', 1, 'search'),
('reports', 1, 'show_cost_price'),
('reports', 1, 'show_profit'),
('reports', 1, 'view_categories'),
('reports', 1, 'view_commissions'),
('reports', 1, 'view_customers'),
('reports', 1, 'view_deleted_sales'),
('reports', 1, 'view_discounts'),
('reports', 1, 'view_employees'),
('reports', 1, 'view_giftcards'),
('reports', 1, 'view_inventory_reports'),
('reports', 1, 'view_item_kits'),
('reports', 1, 'view_items'),
('reports', 1, 'view_payments'),
('reports', 1, 'view_profit_and_loss'),
('reports', 1, 'view_receivings'),
('reports', 1, 'view_register_log'),
('reports', 1, 'view_sales'),
('reports', 1, 'view_sales_generator'),
('reports', 1, 'view_store_account'),
('reports', 1, 'view_suppliers'),
('reports', 1, 'view_suspended_sales'),
('reports', 1, 'view_taxes'),
('sales', 1, 'delete_sale'),
('sales', 1, 'delete_suspended_sale'),
('sales', 1, 'delete_taxes'),
('sales', 1, 'edit_sale'),
('sales', 1, 'edit_sale_price'),
('sales', 1, 'give_discount'),
('sales_expenses', 1, 'delete_sale_expenses'),
('sales_expenses', 1, 'delete_suspended_sale_expenses'),
('sales_expenses', 1, 'delete_taxes'),
('sales_expenses', 1, 'edit_sale_expenses'),
('sales_expenses', 1, 'edit_sale_expenses_price'),
('sales_expenses', 1, 'give_discount'),
('suppliers', 1, 'add_update'),
('suppliers', 1, 'delete'),
('suppliers', 1, 'search'),
('customers', 2, 'add_update'),
('customers', 2, 'delete'),
('customers', 2, 'edit_store_account_balance'),
('customers', 2, 'search'),
('employees', 2, 'add_update'),
('employees', 2, 'assign_all_locations'),
('employees', 2, 'delete'),
('employees', 2, 'search'),
('items', 2, 'add_update'),
('items', 2, 'delete'),
('items', 2, 'search'),
('items', 2, 'see_cost_price'),
('items_expenses', 2, 'add_update'),
('items_expenses', 2, 'delete'),
('items_expenses', 2, 'search'),
('items_expenses', 2, 'see_cost_price'),
('locations', 2, 'add_update'),
('locations', 2, 'search'),
('reports', 2, 'show_cost_price'),
('reports', 2, 'show_profit'),
('reports', 2, 'view_categories'),
('reports', 2, 'view_commissions'),
('reports', 2, 'view_customers'),
('reports', 2, 'view_deleted_sales'),
('reports', 2, 'view_discounts'),
('reports', 2, 'view_employees'),
('reports', 2, 'view_giftcards'),
('reports', 2, 'view_inventory_reports'),
('reports', 2, 'view_item_kits'),
('reports', 2, 'view_items'),
('reports', 2, 'view_payments'),
('reports', 2, 'view_profit_and_loss'),
('reports', 2, 'view_receivings'),
('reports', 2, 'view_register_log'),
('reports', 2, 'view_sales'),
('reports', 2, 'view_sales_generator'),
('reports', 2, 'view_store_account'),
('reports', 2, 'view_suppliers'),
('reports', 2, 'view_suspended_sales'),
('reports', 2, 'view_taxes'),
('sales', 2, 'delete_sale'),
('sales', 2, 'delete_suspended_sale'),
('sales', 2, 'delete_taxes'),
('sales', 2, 'edit_sale'),
('sales', 2, 'edit_sale_price'),
('sales', 2, 'give_discount'),
('sales_expenses', 2, 'delete_sale_expenses'),
('sales_expenses', 2, 'delete_suspended_sale_expenses'),
('sales_expenses', 2, 'delete_taxes'),
('sales_expenses', 2, 'edit_sale_expenses'),
('sales_expenses', 2, 'edit_sale_expenses_price'),
('sales_expenses', 2, 'give_discount'),
('customers', 4, 'add_update'),
('customers', 4, 'search'),
('sales', 4, 'only_suspended_sale'),
('customers', 7, 'add_update'),
('customers', 7, 'delete'),
('customers', 7, 'edit_store_account_balance'),
('customers', 7, 'search'),
('items', 7, 'add_update'),
('items', 7, 'delete'),
('items', 7, 'search'),
('items', 7, 'see_cost_price');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_price_tiers`
--

CREATE TABLE IF NOT EXISTS `phppos_price_tiers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_receivings`
--

CREATE TABLE IF NOT EXISTS `phppos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deleted_by` int(10) DEFAULT NULL,
  `suspended` int(1) NOT NULL DEFAULT '0',
  `location_id` int(11) NOT NULL,
  `transfer_to_location_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`receiving_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`),
  KEY `deleted` (`deleted`),
  KEY `location_id` (`location_id`),
  KEY `transfer_to_location_id` (`transfer_to_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_receivings_items`
--

CREATE TABLE IF NOT EXISTS `phppos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serialnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  `item_cost_price` decimal(23,10) NOT NULL,
  `item_unit_price` decimal(23,10) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_registers`
--

CREATE TABLE IF NOT EXISTS `phppos_registers` (
  `register_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`register_id`),
  KEY `deleted` (`deleted`),
  KEY `phppos_registers_ibfk_1` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `phppos_registers`
--

INSERT INTO `phppos_registers` (`register_id`, `location_id`, `name`, `deleted`) VALUES
(1, 1, 'Caja Cochabamba', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_registers_expenses`
--

CREATE TABLE IF NOT EXISTS `phppos_registers_expenses` (
  `register_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`register_id`),
  KEY `deleted` (`deleted`),
  KEY `phppos_registers_expenses_ibfk_1` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `phppos_registers_expenses`
--

INSERT INTO `phppos_registers_expenses` (`register_id`, `location_id`, `name`, `deleted`) VALUES
(1, 1, 'GASTOS CBBA', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_register_log`
--

CREATE TABLE IF NOT EXISTS `phppos_register_log` (
  `register_log_id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_id_open` int(10) NOT NULL,
  `employee_id_close` int(11) DEFAULT NULL,
  `register_id` int(11) DEFAULT NULL,
  `shift_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shift_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `open_amount` decimal(23,10) NOT NULL,
  `close_amount` decimal(23,10) NOT NULL,
  `cash_sales_amount` decimal(23,10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`register_log_id`),
  KEY `phppos_register_log_ibfk_1` (`employee_id_open`),
  KEY `phppos_register_log_ibfk_2` (`register_id`),
  KEY `phppos_register_log_ibfk_3` (`employee_id_close`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `phppos_register_log`
--

INSERT INTO `phppos_register_log` (`register_log_id`, `employee_id_open`, `employee_id_close`, `register_id`, `shift_start`, `shift_end`, `open_amount`, `close_amount`, `cash_sales_amount`, `deleted`) VALUES
(1, 2, 2, 1, '2016-08-04 20:54:26', '2016-08-06 02:15:52', '0.0000000000', '28.0000000000', '28.0000000000', 0),
(2, 2, 2, 1, '2016-08-07 01:48:48', '2016-08-07 03:06:47', '0.0000000000', '0.0000000000', '0.0000000000', 0),
(3, 2, 2, 1, '2016-08-07 19:02:12', '2016-08-07 19:51:02', '100.0000000000', '100.0000000000', '0.0000000000', 0),
(4, 2, 2, 1, '2016-08-07 19:56:32', '2016-08-08 02:16:37', '1.0000000000', '100.0000000000', '0.0000000000', 0),
(5, 2, 2, 1, '2016-08-10 22:36:14', '2016-08-12 19:30:37', '0.0000000000', '0.0000000000', '6970.0000000000', 0),
(6, 2, 2, 1, '2016-08-12 19:31:15', '2016-08-12 21:34:56', '0.0000000000', '0.0000000000', '0.0000000000', 0),
(7, 2, 2, 1, '2016-08-12 21:35:32', '2016-08-14 00:54:14', '0.0000000000', '0.0000000000', '0.0000000000', 0),
(8, 2, 2, 1, '2016-08-20 14:42:57', '2016-08-21 02:10:34', '0.0000000000', '0.0000000000', '0.0000000000', 0),
(9, 2, 2, 1, '2016-08-23 21:10:11', '2016-08-23 23:11:59', '0.0000000000', '0.0000000000', '10555.0000000000', 0),
(10, 2, NULL, 1, '2016-08-24 13:15:57', '0000-00-00 00:00:00', '0.0000000000', '0.0000000000', '0.0000000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_register_log_expenses`
--

CREATE TABLE IF NOT EXISTS `phppos_register_log_expenses` (
  `register_log_expenses_id` int(10) NOT NULL AUTO_INCREMENT,
  `employee_id_open` int(10) NOT NULL,
  `employee_id_close` int(11) DEFAULT NULL,
  `register_id` int(11) DEFAULT NULL,
  `shift_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shift_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `open_amount` decimal(23,10) NOT NULL,
  `close_amount` decimal(23,10) NOT NULL,
  `cash_sales_amount` decimal(23,10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`register_log_expenses_id`),
  KEY `phppos_register_log_expenses_ibfk_1` (`employee_id_open`),
  KEY `phppos_register_log_expenses_ibfk_2` (`register_id`),
  KEY `phppos_register_log_expenses_ibfk_3` (`employee_id_close`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `phppos_register_log_expenses`
--

INSERT INTO `phppos_register_log_expenses` (`register_log_expenses_id`, `employee_id_open`, `employee_id_close`, `register_id`, `shift_start`, `shift_end`, `open_amount`, `close_amount`, `cash_sales_amount`, `deleted`) VALUES
(1, 1, NULL, 1, '2016-07-25 04:25:17', '0000-00-00 00:00:00', '0.0000000000', '0.0000000000', '0.0000000000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales`
--

CREATE TABLE IF NOT EXISTS `phppos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `sold_by_employee_id` int(10) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `show_comment_on_receipt` int(1) NOT NULL DEFAULT '0',
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_ref_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `deleted_by` int(10) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `suspended` int(1) NOT NULL DEFAULT '0',
  `store_account_payment` int(1) NOT NULL DEFAULT '0',
  `location_id` int(11) NOT NULL,
  `register_id` int(11) DEFAULT NULL,
  `tier_id` int(10) DEFAULT NULL,
  `longsale` float(20,11) NOT NULL DEFAULT '0.00000000000',
  `latsale` float(20,11) NOT NULL DEFAULT '0.00000000000',
  `fecha_pago` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `deleted` (`deleted`),
  KEY `location_id` (`location_id`),
  KEY `phppos_sales_ibfk_4` (`deleted_by`),
  KEY `sales_search` (`location_id`,`store_account_payment`,`sale_time`,`sale_id`),
  KEY `phppos_sales_ibfk_5` (`tier_id`),
  KEY `phppos_sales_ibfk_7` (`register_id`),
  KEY `phppos_sales_ibfk_6` (`sold_by_employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=52 ;

--
-- Dumping data for table `phppos_sales`
--

INSERT INTO `phppos_sales` (`sale_time`, `customer_id`, `employee_id`, `sold_by_employee_id`, `comment`, `show_comment_on_receipt`, `sale_id`, `payment_type`, `cc_ref_no`, `auth_code`, `deleted_by`, `deleted`, `suspended`, `store_account_payment`, `location_id`, `register_id`, `tier_id`, `longsale`, `latsale`, `fecha_pago`) VALUES
('2016-08-04 20:57:00', 3, 2, 2, '', 0, 1, 'Línea de crédito: Bs.45,000.00<br />Cuota Inicial: &#8209;Bs.696.00<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '1970-01-01 01:00:00'),
('2016-08-04 20:58:53', 3, 2, 2, '', 0, 2, 'Línea de crédito: Bs.94,095.00<br />Cuota Inicial: &#8209;Bs.6,970.00<br />Línea de crédito: &#8209;Bs.1,938.05<br />Línea de crédito: &#8209;Bs.1,938.05<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-10 04:00:00'),
('2016-08-04 21:11:20', 3, 2, 2, '', 0, 3, 'Efectivo: Bs.28.00<br />', '', '', 2, 1, 0, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '1970-01-01 01:00:00'),
('2016-08-04 21:12:21', 3, 2, 2, '', 0, 4, 'Cuota Inicial: &#8209;Bs.6,970.00<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '1970-01-01 01:00:00'),
('2016-08-10 22:39:05', 4, 2, 2, '', 1, 5, 'Línea de crédito: Bs.94,098.00<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-08-10 04:00:00'),
('2016-08-05 14:01:43', 4, 2, 2, '', 1, 6, '', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-05 04:00:00'),
('2016-08-07 01:51:57', 6, 2, 2, 'URBANIZACION PARAISO DE KALUYO MANZANO 2 LOTE 2', 1, 7, '', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-12 04:00:00'),
('2016-08-07 01:53:49', 6, 2, 2, 'URBANIZACION PARAISO DE KALUYO MANZANO 2 LOTE 2', 1, 8, '', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-12 04:00:00'),
('2016-08-07 01:58:26', 6, 2, 2, 'URBANIZACION PARAISO DE KALUYO MANZANO 2 LOTE 2', 1, 9, '', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-12 04:00:00'),
('2016-08-07 02:46:55', 5, 2, 1, 'URBANIZACION PARAISO DE KALUYO MANZANO 10 LOTE 7 PLAZO 18 MESES SIN INTERES', 1, 17, '', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '1970-01-01 01:00:00'),
('2016-08-07 02:50:14', 5, 2, 1, 'URBANIZACION PARAISO DE KALUYO MANZANO 10 LOTE 7 PLAZO 18 MESES SIN INTERES', 1, 18, '', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '1970-01-01 01:00:00'),
('2016-08-07 02:52:41', 5, 2, 1, 'URBANIZACION PARAISO DE KALUYO MANZANO 10 LOTE 7 PLAZO 18 MESES SIN INTERES', 1, 19, '', '', '', 2, 1, 2, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '1970-01-01 01:00:00'),
('2016-08-07 02:54:25', 5, 2, 1, 'URBANIZACION PARAISO DE KALUYO MANZANO 10 LOTE 7 PLAZO 18 MESES SIN INTERES', 1, 20, '', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-12 04:00:00'),
('2016-08-07 02:55:47', 5, 2, 1, 'URBANIZACION PARAISO DE KALUYO MANZANO 10 LOTE 7 PLAZO 18 MESES SIN INTERES', 1, 21, '', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-12 04:00:00'),
('2016-08-07 02:57:38', 5, 2, 1, 'URBANIZACION PARAISO DE KALUYO MANZANO 10 LOTE 7 PLAZO 18 MESES SIN INTERES', 1, 22, '', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-12 04:00:00'),
('2016-08-07 03:00:33', 5, 2, 1, 'URBANIZACION PARAISO DE KALUYO MANZANO 10 LOTE 7 PLAZO 18 MESES SIN INTERES', 1, 23, 'Línea de crédito: &#8209;Bs.5,808.38<br />Efectivo: &#8209;Bs.5,808.38<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-12 04:00:00'),
('2016-08-07 03:01:47', 5, 2, 2, '', 1, 24, '', '', '', 2, 1, 2, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '1970-01-01 01:00:00'),
('2016-08-07 03:03:34', 5, 2, 2, '', 1, 25, '', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '1970-01-01 01:00:00'),
('2016-08-07 19:05:25', 6, 2, 2, '', 1, 26, '', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-04 04:00:00'),
('2016-08-07 19:12:48', 3, 2, 7, '', 1, 27, '', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-04 04:00:00'),
('2016-08-07 19:14:45', 3, 2, 7, '', 1, 28, 'Cuota Inicial: Bs.10,455.00<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-04 04:00:00'),
('2016-08-07 19:38:39', 3, 2, 2, '', 1, 29, 'Cuota Inicial: Bs.10,455.00<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-09-04 04:00:00'),
('2016-08-10 22:43:51', 4, 2, 2, '', 1, 30, 'Línea de crédito: Bs.94,098.00<br />Línea de crédito: &#8209;Bs.1,938.11<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '2016-08-10 04:00:00'),
('2016-08-10 22:58:59', 8, 2, 2, '', 0, 31, 'Línea de crédito: Bs.94,095.00<br />Cuota Inicial: &#8209;Bs.10,455.00<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.11637115479, -17.39063644409, '2016-09-10 04:00:00'),
('2016-08-11 15:24:56', 9, 2, 2, '', 1, 32, 'Línea de crédito: Bs.121,004.43<br />Cuota Inicial: Bs.6,970.00<br />Cuota Inicial: Bs.3,485.00<br />', '', '', 2, 1, 0, 0, 1, 1, NULL, -66.11637115479, -17.39063644409, '1970-01-01 01:00:00'),
('2016-08-11 15:27:05', 9, 2, 2, '', 1, 33, 'Línea de crédito: Bs.121,004.43<br />Cuota Inicial: Bs.6,970.00<br />Cuota Inicial: Bs.3,485.00<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.11637115479, -17.39063644409, '2016-09-11 04:00:00'),
('2016-08-11 15:28:40', 9, 2, 2, '', 1, 34, 'Línea de crédito: Bs.121,004.43<br />Cuota Inicial: Bs.6,970.00<br />Cuota Inicial: Bs.3,485.00<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.11637115479, -17.39063644409, '2016-09-11 04:00:00'),
('2016-08-11 22:23:55', 11, 2, 2, 'LOTE 7 MZ 7', 1, 35, 'Línea de crédito: Bs.111,411.97<br />Cuota Inicial: &#8209;Bs.6,970.00<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.11637115479, -17.39063644409, '2016-09-21 04:00:00'),
('2016-08-11 15:33:56', 9, 2, 2, '', 1, 36, 'Línea de crédito: Bs.121,004.43<br />Cuota Inicial: &#8209;Bs.10,455.00<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.11637115479, -17.39063644409, '2016-09-11 04:00:00'),
('2016-08-11 15:40:49', 10, 2, 2, '', 1, 37, 'Línea de crédito: Bs.121,004.43<br />Cuota Inicial: &#8209;Bs.10,455.00<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.11637115479, -17.39063644409, '2016-09-11 04:00:00'),
('2016-08-11 16:04:34', 10, 2, 2, '', 1, 38, 'Línea de crédito: Bs.121,004.43<br />Cuota Inicial: &#8209;Bs.10,455.00<br />Línea de crédito: &#8209;Bs.2,029,571.12<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.11637115479, -17.39063644409, '2016-09-11 04:00:00'),
('2016-08-12 19:38:08', 11, 2, 2, 'LOTE 7 MZ 7', 1, 39, 'Línea de crédito: Bs.111,411.97<br />Cuota Inicial: &#8209;Bs.6,970.00<br />Línea de crédito: &#8209;Bs.2,323.25<br />', '', '', 2, 1, 1, 0, 1, 1, NULL, -66.11637115479, -17.39063644409, '2016-09-21 04:00:00'),
('2016-08-23 21:30:19', 5, 2, 2, 'RESERVA DEL LOTE 5 MZ 7', 1, 41, 'Efectivo: Bs.100.00<br />', '', '', NULL, 0, 0, 0, 1, 1, NULL, -66.15947723389, -17.41875839233, '1970-01-01 01:00:00'),
('2016-08-23 22:57:17', 8, 1, 2, 'PLAZO 60 MESES', 1, 48, 'Línea de crédito: Bs.121,004.43<br />Cuota Inicial: &#8209;Bs.10,455.00<br />', '', '', 1, 1, 1, 0, 1, 1, NULL, -66.15938568115, -17.41876792908, '2016-09-23 04:00:00'),
('2016-09-07 19:28:16', 66, 1, 1, '', 0, 49, 'Línea de crédito: Bs.121,004.43<br />', '', '', 1, 1, 1, 0, 1, 1, NULL, -66.16082763672, -17.39293861389, '0000-00-00 00:00:00'),
('2016-09-07 19:30:17', 66, 1, 1, '', 0, 50, 'Línea de crédito: Bs.121,004.43<br />', '', '', NULL, 0, 1, 0, 1, 1, NULL, -66.16071319580, -17.39294052124, '0000-00-00 00:00:00'),
('2016-11-16 19:12:55', 66, 1, 1, '', 0, 51, '', '', '', NULL, 0, 1, 0, 1, 1, NULL, -66.16078186035, -17.39295768738, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_expenses`
--

CREATE TABLE IF NOT EXISTS `phppos_sales_expenses` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `sold_by_employee_id` int(10) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `show_comment_on_receipt` int(1) NOT NULL DEFAULT '0',
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc_ref_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `deleted_by` int(10) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `suspended` int(1) NOT NULL DEFAULT '0',
  `store_account_payment` int(1) NOT NULL DEFAULT '0',
  `location_id` int(11) NOT NULL,
  `register_id` int(11) DEFAULT NULL,
  `tier_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `deleted` (`deleted`),
  KEY `location_id` (`location_id`),
  KEY `phppos_sales_expenses_ibfk_4` (`deleted_by`),
  KEY `sales_search` (`location_id`,`store_account_payment`,`sale_time`,`sale_id`),
  KEY `phppos_sales_expenses_ibfk_5` (`tier_id`),
  KEY `phppos_sales_expenses_ibfk_7` (`register_id`),
  KEY `phppos_sales_expenses_ibfk_6` (`sold_by_employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `phppos_sales_expenses`
--

INSERT INTO `phppos_sales_expenses` (`sale_time`, `customer_id`, `employee_id`, `sold_by_employee_id`, `comment`, `show_comment_on_receipt`, `sale_id`, `payment_type`, `cc_ref_no`, `auth_code`, `deleted_by`, `deleted`, `suspended`, `store_account_payment`, `location_id`, `register_id`, `tier_id`) VALUES
('2016-08-07 19:26:32', 6, 2, NULL, '', 1, 1, '', '', '', NULL, 0, 1, 0, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_items`
--

CREATE TABLE IF NOT EXISTS `phppos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serialnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  `item_cost_price` decimal(23,10) NOT NULL,
  `item_unit_price` decimal(23,10) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT '0',
  `commission` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  `plazo` int(10) NOT NULL,
  `tasa` decimal(23,10) NOT NULL,
  `frecuencia` int(11) NOT NULL,
  `cuotamensual` decimal(23,10) NOT NULL,
  `cuotainicial` decimal(23,10) NOT NULL,
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_sales_items`
--

INSERT INTO `phppos_sales_items` (`sale_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`, `commission`, `plazo`, `tasa`, `frecuencia`, `cuotamensual`, `cuotainicial`) VALUES
(1, 1, '', '', 1, '1.0000000000', '45000.0000000000', '45000.0000000000', 0, '0.0000000000', 60, '12.0000000000', 1, '985.5180102320', '696.0000000000'),
(2, 1, '', '', 1, '1.0000000000', '45000.0000000000', '94095.0000000000', 0, '0.0000000000', 60, '12.0000000000', 1, '1938.0475045500', '6970.0000000000'),
(3, 3, '', '', 1, '1.0000000000', '0.0000000000', '28.0000000000', 0, '0.0000000000', 60, '12.0000000000', 1, '0.0000000000', '0.0000000000'),
(4, 1, '', '', 1, '1.0000000000', '45000.0000000000', '45000.0000000000', 0, '0.0000000000', 60, '12.0000000000', 1, '0.0000000000', '0.0000000000'),
(5, 14, 'MANZANO 1 LOTE 7', '', 2, '1.0000000000', '94098.0000000000', '94098.0000000000', 0, '0.0000000000', 60, '12.0000000000', 1, '1938.1142378900', '6970.0000000000'),
(6, 13, 'MANZANO 1 LOTE 6', '', 3, '1.0000000000', '94097.0000000000', '94095.0000000000', 0, '0.0000000000', 60, '12.0000000000', 1, '0.0000000000', '6970.0000000000'),
(6, 14, 'MANZANO 1 LOTE 7', '', 2, '1.0000000000', '94098.0000000000', '94095.0000000000', 0, '0.0000000000', 60, '12.0000000000', 1, '1938.1142378900', '6970.0000000000'),
(7, 63, '', '', 1, '1.0000000000', '0.0000000000', '94095.0000000000', 0, '2100.0000000000', 60, '10.0000000000', 1, '0.0000000000', '13940.0000000000'),
(8, 63, '', '', 1, '1.0000000000', '0.0000000000', '94095.0000000000', 0, '2100.0000000000', 60, '10.0000000000', 1, '1703.0568688300', '13940.0000000000'),
(9, 63, '', '', 1, '1.0000000000', '0.0000000000', '94095.0000000000', 0, '2100.0000000000', 60, '10.0000000000', 1, '1703.0568688300', '13940.0000000000'),
(17, 184, '', '', 3, '1.0000000000', '0.0000000000', '115005.0000000000', 0, '2100.0000000000', 18, '1.0000000000', 1, '0.0000000000', '10455.0000000000'),
(18, 184, '', '', 3, '1.0000000000', '0.0000000000', '115005.0000000000', 0, '2100.0000000000', 18, '1.0000000000', 1, '5854.4244967200', '10455.0000000000'),
(19, 184, '', '', 3, '1.0000000000', '0.0000000000', '115005.0000000000', 0, '2100.0000000000', 18, '1.0000000000', 1, '5854.4244967200', '10455.0000000000'),
(20, 184, '', '', 3, '1.0000000000', '0.0000000000', '115005.0000000000', 0, '2100.0000000000', 18, '1.0000000000', 1, '5854.4244967200', '10455.0000000000'),
(21, 184, '', '', 3, '1.0000000000', '0.0000000000', '115005.0000000000', 0, '2100.0000000000', 18, '0.0100000000', 1, '5854.4244967200', '10455.0000000000'),
(22, 184, '', '', 3, '1.0000000000', '0.0000000000', '115005.0000000000', 0, '2100.0000000000', 18, '0.0010000000', 1, '5808.7931705400', '10455.0000000000'),
(23, 184, '', '', 3, '1.0000000000', '0.0000000000', '115005.0000000000', 0, '2100.0000000000', 18, '0.0010000000', 1, '5808.3793167800', '10455.0000000000'),
(24, 45, '', '', 1, '1.0000000000', '0.0000000000', '94095.0000000000', 0, '2100.0000000000', 60, '12.0000000000', 1, '0.0000000000', '0.0000000000'),
(25, 56, '', '', 1, '1.0000000000', '0.0000000000', '94095.0000000000', 0, '2100.0000000000', 60, '12.0000000000', 1, '0.0000000000', '6970.0000000000'),
(26, 185, '', '', 1, '1.0000000000', '0.0000000000', '115005.0000000000', 0, '2100.0000000000', 60, '12.0000000000', 1, '0.0000000000', '10455.0000000000'),
(27, 135, '', '', 1, '1.0000000000', '0.0000000000', '122553.1600000000', 0, '2237.8300000000', 60, '12.0000000000', 1, '0.0000000000', '10455.0000000000'),
(28, 135, '', '', 1, '1.0000000000', '0.0000000000', '122553.1600000000', 0, '2237.8300000000', 60, '12.0000000000', 1, '2493.5616556900', '0.0000000000'),
(29, 135, '', '', 1, '1.0000000000', '0.0000000000', '122553.1600000000', 0, '2237.8300000000', 60, '12.0000000000', 1, '2726.1273562400', '0.0000000000'),
(30, 14, 'MANZANO 1 LOTE 7', '', 2, '1.0000000000', '94098.0000000000', '94098.0000000000', 0, '0.0000000000', 60, '12.0000000000', 1, '1938.1142378900', '6970.0000000000'),
(31, 75, '', '', 1, '1.0000000000', '0.0000000000', '94095.0000000000', 0, '2100.0000000000', 18, '0.0010000000', 1, '4646.7034534200', '10455.0000000000'),
(32, 233, 'MANZANO 1 LOTE 1', '', 1, '1.0000000000', '121004.4300000000', '121004.4300000000', 0, '0.0000000000', 60, '12.0000000000', 1, '0.0000000000', '0.0000000000'),
(33, 233, 'MANZANO 1 LOTE 1', '', 1, '1.0000000000', '121004.4300000000', '121004.4300000000', 0, '0.0000000000', 60, '12.0000000000', 1, '2691.6767127800', '0.0000000000'),
(34, 233, 'MANZANO 1 LOTE 1', '', 1, '1.0000000000', '121004.4300000000', '121004.4300000000', 0, '0.0000000000', 60, '12.0000000000', 1, '2691.6767127800', '0.0000000000'),
(35, 150, '', '', 1, '1.0000000000', '0.0000000000', '111411.9700000000', 0, '2237.8300000000', 60, '12.0000000000', 1, '2323.2539377700', '6970.0000000000'),
(36, 233, 'MANZANO 1 LOTE 1', '', 1, '1.0000000000', '121004.4300000000', '121004.4300000000', 0, '0.0000000000', 60, '12.0000000000', 1, '2691.6767127800', '0.0000000000'),
(37, 233, 'MANZANO 1 LOTE 1', '', 1, '1.0000000000', '121004.4300000000', '121004.4300000000', 0, '0.0000000000', 60, '12.0000000000', 1, '2459.1110122300', '10455.0000000000'),
(38, 233, 'MANZANO 1 LOTE 1', '', 1, '1.0000000000', '121004.4300000000', '121004.4300000000', 0, '0.0000000000', 60, '12.0000000000', 1, '2459.1110122300', '10455.0000000000'),
(39, 150, '', '', 1, '1.0000000000', '0.0000000000', '111411.9700000000', 0, '2237.8300000000', 60, '12.0000000000', 1, '2323.2539377700', '6970.0000000000'),
(41, 41, '', '', 1, '1.0000000000', '0.0000000000', '100.0000000000', 0, '0.0000000000', 60, '12.0000000000', 1, '0.0000000000', '0.0000000000'),
(48, 233, 'MANZANO 1 LOTE 1', '', 1, '1.0000000000', '0.0000000000', '121004.4300000000', 0, '0.0000000000', 60, '12.0000000000', 1, '2459.1110122307', '10455.0000000000'),
(49, 233, 'MANZANO 1 LOTE 1', '', 1, '1.0000000000', '0.0000000000', '121004.4300000000', 0, '0.0000000000', 60, '12.0000000000', 1, '2691.6767127764', '0.0000000000'),
(50, 233, 'MANZANO 1 LOTE 1', '', 1, '1.0000000000', '0.0000000000', '121004.4300000000', 0, '0.0000000000', 60, '12.0000000000', 1, '0.0000000000', '0.0000000000'),
(51, 41, '', '', 1, '1.0000000000', '0.0000000000', '100.0000000000', 0, '0.0000000000', 60, '12.0000000000', 1, '0.0000000000', '0.0000000000');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_items_expenses`
--

CREATE TABLE IF NOT EXISTS `phppos_sales_items_expenses` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `serialnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  `item_cost_price` decimal(23,10) NOT NULL,
  `item_unit_price` decimal(23,10) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT '0',
  `commission` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `phppos_sales_items_expenses`
--

INSERT INTO `phppos_sales_items_expenses` (`sale_id`, `item_id`, `description`, `serialnumber`, `line`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`, `commission`) VALUES
(1, 1, 'PAGO DE COMISIONES POR VENTA DE TERRENOS DE 300 M2', '', 1, '1.0000000000', '14637.0000000000', '14637.0000000000', 0, '0.0000000000');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_items_taxes`
--

CREATE TABLE IF NOT EXISTS `phppos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_item_kits`
--

CREATE TABLE IF NOT EXISTS `phppos_sales_item_kits` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_kit_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  `item_kit_cost_price` decimal(23,10) NOT NULL,
  `item_kit_unit_price` decimal(23,10) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT '0',
  `commission` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  PRIMARY KEY (`sale_id`,`item_kit_id`,`line`),
  KEY `item_kit_id` (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_item_kits_expenses`
--

CREATE TABLE IF NOT EXISTS `phppos_sales_item_kits_expenses` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_kit_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  `item_kit_cost_price` decimal(23,10) NOT NULL,
  `item_kit_unit_price` decimal(23,10) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT '0',
  `commission` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  PRIMARY KEY (`sale_id`,`item_kit_id`,`line`),
  KEY `item_kit_id` (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_item_kits_taxes`
--

CREATE TABLE IF NOT EXISTS `phppos_sales_item_kits_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_kit_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  `cumulative` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sale_id`,`item_kit_id`,`line`,`name`,`percent`),
  KEY `item_id` (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_payments`
--

CREATE TABLE IF NOT EXISTS `phppos_sales_payments` (
  `payment_id` int(10) NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_amount` decimal(23,10) NOT NULL,
  `truncated_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `card_issuer` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `sale_id` (`sale_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=117 ;

--
-- Dumping data for table `phppos_sales_payments`
--

INSERT INTO `phppos_sales_payments` (`payment_id`, `sale_id`, `payment_type`, `payment_amount`, `truncated_card`, `card_issuer`, `payment_date`) VALUES
(3, 1, 'Línea de crédito', '45000.0000000000', '', '', '2016-08-04 20:56:18'),
(4, 1, 'Cuota Inicial', '-696.0000000000', '', '', '2016-08-04 20:56:52'),
(16, 3, 'Efectivo', '28.0000000000', '', '', '2016-08-04 21:11:13'),
(18, 4, 'Cuota Inicial', '-6970.0000000000', '', '', '2016-08-04 21:14:32'),
(25, 2, 'Línea de crédito', '94095.0000000000', '', '', '2016-08-04 20:58:36'),
(26, 2, 'Cuota Inicial', '-6970.0000000000', '', '', '2016-08-04 20:58:48'),
(27, 2, 'Línea de crédito', '-1938.0500000000', '', '', '2016-08-04 21:20:39'),
(28, 2, 'Línea de crédito', '-1938.0500000000', '', '', '2016-08-04 21:21:28'),
(29, 23, 'Línea de crédito', '-5808.3800000000', '', '', '2016-08-07 02:59:58'),
(30, 23, 'Efectivo', '-5808.3800000000', '', '', '2016-08-07 03:00:19'),
(31, 28, 'Cuota Inicial', '10455.0000000000', '', '', '2016-08-07 19:14:26'),
(32, 29, 'Cuota Inicial', '10455.0000000000', '', '', '2016-08-07 19:38:28'),
(33, 5, 'Línea de crédito', '94098.0000000000', '', '', '2016-08-10 22:38:45'),
(34, 30, 'Línea de crédito', '94098.0000000000', '', '', '2016-08-10 22:38:45'),
(35, 30, 'Línea de crédito', '-1938.1100000000', '', '', '2016-08-10 22:43:45'),
(38, 31, 'Línea de crédito', '94095.0000000000', '', '', '2016-08-10 22:56:20'),
(39, 31, 'Cuota Inicial', '-10455.0000000000', '', '', '2016-08-10 22:56:41'),
(40, 32, 'Línea de crédito', '121004.4300000000', '', '', '2016-08-11 15:23:08'),
(41, 32, 'Cuota Inicial', '6970.0000000000', '', '', '2016-08-11 15:23:19'),
(42, 32, 'Cuota Inicial', '3485.0000000000', '', '', '2016-08-11 15:24:43'),
(43, 33, 'Línea de crédito', '121004.4300000000', '', '', '2016-08-11 15:23:08'),
(44, 33, 'Cuota Inicial', '6970.0000000000', '', '', '2016-08-11 15:23:19'),
(45, 33, 'Cuota Inicial', '3485.0000000000', '', '', '2016-08-11 15:24:43'),
(46, 34, 'Línea de crédito', '121004.4300000000', '', '', '2016-08-11 15:23:08'),
(47, 34, 'Cuota Inicial', '6970.0000000000', '', '', '2016-08-11 15:23:19'),
(48, 34, 'Cuota Inicial', '3485.0000000000', '', '', '2016-08-11 15:24:43'),
(51, 36, 'Línea de crédito', '121004.4300000000', '', '', '2016-08-11 15:31:52'),
(52, 36, 'Cuota Inicial', '-10455.0000000000', '', '', '2016-08-11 15:32:07'),
(55, 37, 'Línea de crédito', '121004.4300000000', '', '', '2016-08-11 15:36:29'),
(56, 37, 'Cuota Inicial', '-10455.0000000000', '', '', '2016-08-11 15:37:17'),
(57, 38, 'Línea de crédito', '121004.4300000000', '', '', '2016-08-11 15:36:29'),
(58, 38, 'Cuota Inicial', '-10455.0000000000', '', '', '2016-08-11 15:37:17'),
(59, 38, 'Línea de crédito', '-2029571.1200000000', '', '', '2016-08-11 16:04:17'),
(62, 35, 'Línea de crédito', '111411.9700000000', '', '', '2016-08-11 22:16:50'),
(63, 35, 'Cuota Inicial', '-6970.0000000000', '', '', '2016-08-11 22:17:00'),
(64, 39, 'Línea de crédito', '111411.9700000000', '', '', '2016-08-11 22:16:50'),
(65, 39, 'Cuota Inicial', '-6970.0000000000', '', '', '2016-08-11 22:17:00'),
(66, 39, 'Línea de crédito', '-2323.2500000000', '', '', '2016-08-12 19:37:08'),
(69, 41, 'Efectivo', '100.0000000000', '', '', '2016-08-23 21:28:06'),
(112, 48, 'Línea de crédito', '121004.4300000000', '', '', '2016-08-23 22:50:18'),
(113, 48, 'Cuota Inicial', '-10455.0000000000', '', '', '2016-08-23 22:50:56'),
(115, 49, 'Línea de crédito', '121004.4300000000', '', '', '2016-09-07 19:28:14'),
(116, 50, 'Línea de crédito', '121004.4300000000', '', '', '2016-09-07 19:30:14');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_sales_payments_expenses`
--

CREATE TABLE IF NOT EXISTS `phppos_sales_payments_expenses` (
  `payment_id` int(10) NOT NULL AUTO_INCREMENT,
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_amount` decimal(23,10) NOT NULL,
  `truncated_card` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `card_issuer` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`),
  KEY `sale_id` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `phppos_store_accounts`
--

CREATE TABLE IF NOT EXISTS `phppos_store_accounts` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `transaction_amount` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `balance` decimal(23,10) NOT NULL DEFAULT '0.0000000000',
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`sno`),
  KEY `phppos_store_accounts_ibfk_1` (`sale_id`),
  KEY `phppos_store_accounts_ibfk_2` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=63 ;

--
-- Dumping data for table `phppos_store_accounts`
--

INSERT INTO `phppos_store_accounts` (`sno`, `customer_id`, `sale_id`, `location_id`, `transaction_amount`, `date`, `balance`, `comment`) VALUES
(1, 3, 1, 1, '44304.0000000000', '2016-08-04 20:57:00', '44304.0000000000', ''),
(2, 3, 1, 1, '-45000.0000000000', '2016-08-04 20:57:48', '0.0000000000', ''),
(3, 3, 2, 1, '87125.0000000000', '2016-08-04 20:58:53', '87125.0000000000', ''),
(4, 3, 2, 1, '-10000.0000000000', '2016-08-04 21:05:28', '-57875.0000000000', ''),
(5, 3, 2, 1, '10000.0000000000', '2016-08-04 21:08:32', '-92875.0000000000', ''),
(6, 3, 4, 1, '-6970.0000000000', '2016-08-04 21:14:56', '-238940.0000000000', ''),
(7, 3, 2, 1, '-1938.0500000000', '2016-08-04 21:18:30', '-418003.0500000000', ''),
(8, 3, 2, 1, '-1938.0500000000', '2016-08-04 21:21:39', '-509941.1000000000', ''),
(9, 3, 2, 1, '-90218.9000000000', '2016-08-04 21:22:01', '-638190.0000000000', ''),
(10, 3, NULL, 0, '638190.0000000000', '2016-08-04 21:22:14', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(11, 5, 23, 1, '-5808.3800000000', '2016-08-07 03:00:33', '-5808.3800000000', 'URBANIZACION PARAISO DE KALUYO MANZANO 10 LOTE 7 PLAZO 18 MESES SIN INTERES'),
(12, 3, 28, 1, '10455.0000000000', '2016-08-07 19:14:45', '10455.0000000000', ''),
(13, 3, 29, 1, '10455.0000000000', '2016-08-07 19:38:39', '20910.0000000000', ''),
(14, 4, 5, 1, '94098.0000000000', '2016-08-10 22:39:05', '-35312.5200000000', ''),
(15, 4, 30, 1, '92159.8900000000', '2016-08-10 22:43:51', '56847.3700000000', ''),
(16, 8, 31, 1, '83640.0000000000', '2016-08-10 22:57:21', '83640.0000000000', ''),
(17, 9, 32, 1, '121004.4300000000', '2016-08-11 15:24:56', '121004.4300000000', ''),
(18, 9, 33, 1, '131459.4300000000', '2016-08-11 15:27:05', '252463.8600000000', ''),
(19, 9, 34, 1, '131459.4300000000', '2016-08-11 15:28:40', '383923.2900000000', ''),
(20, 9, 35, 1, '110549.4300000000', '2016-08-11 15:32:36', '494472.7200000000', ''),
(21, 9, 36, 1, '110549.4300000000', '2016-08-11 15:33:56', '605022.1500000000', ''),
(22, 10, 37, 1, '110549.4300000000', '2016-08-11 15:37:57', '110549.4300000000', ''),
(23, 10, 37, 1, '-121004.4300000000', '2016-08-11 16:03:39', '-2029571.1200000000', ''),
(24, 10, 38, 1, '-1919021.6900000000', '2016-08-11 16:04:34', '-3948592.8100000000', ''),
(25, 10, 38, 1, '1908566.6900000000', '2016-08-11 16:07:27', '-3165361.1100000000', ''),
(26, 10, NULL, 0, '3165361.1100000000', '2016-08-11 16:08:55', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(27, 4, NULL, 0, '-56847.3700000000', '2016-08-11 16:09:20', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(28, 5, NULL, 0, '5808.3800000000', '2016-08-11 16:09:52', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(29, 8, NULL, 0, '232028.4100000000', '2016-08-11 16:10:09', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(30, 3, NULL, 0, '388231.5600000000', '2016-08-11 16:10:27', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(31, 9, NULL, 0, '-605022.1500000000', '2016-08-11 16:10:47', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(32, 5, 23, 1, '5808.3800000000', '2016-08-11 16:17:33', '5409436.9000000000', 'URBANIZACION PARAISO DE KALUYO MANZANO 10 LOTE 7 PLAZO 18 MESES SIN INTERES'),
(33, 4, 5, 1, '-94098.0000000000', '2016-08-11 16:19:34', '1545553.4000000000', ''),
(34, 5, NULL, 0, '-5409436.9000000000', '2016-08-11 16:20:12', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(35, 4, NULL, 0, '-1545553.4000000000', '2016-08-11 16:20:29', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(36, 4, 30, 1, '-92159.8900000000', '2016-08-11 16:21:03', '772776.7000000000', ''),
(37, 8, 31, 1, '-94095.0000000000', '2016-08-11 16:24:50', '783231.7000000000', ''),
(38, 9, 32, 1, '-121004.4300000000', '2016-08-11 16:26:03', '762321.7000000000', ''),
(39, 9, 33, 1, '-121004.4300000000', '2016-08-11 16:26:15', '1524643.4000000000', ''),
(40, 9, 34, 1, '-121004.4300000000', '2016-08-11 16:26:30', '2286965.1000000000', ''),
(41, 9, 35, 1, '-121004.4300000000', '2016-08-11 16:26:59', '3070196.8000000000', ''),
(42, 9, 36, 1, '-121004.4300000000', '2016-08-11 16:27:13', '3853428.5000000000', ''),
(43, 4, NULL, 0, '-772776.7000000000', '2016-08-11 16:28:40', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(44, 6, NULL, 0, '-2318330.1000000000', '2016-08-11 16:28:56', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(45, 8, NULL, 0, '-783231.7000000000', '2016-08-11 16:29:13', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(46, 3, NULL, 0, '-772776.7000000000', '2016-08-11 16:29:32', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(47, 9, NULL, 0, '-3853428.5000000000', '2016-08-11 16:29:49', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(48, 5, 35, 1, '-6107.4600000000', '2016-08-11 22:17:45', '104441.9700000000', 'LOTE 7 MZ 7'),
(49, 5, 35, 1, '-111411.9700000000', '2016-08-11 22:21:02', '893781.1300000000', 'LOTE 7 MZ 7'),
(50, 5, NULL, 0, '-893781.1300000000', '2016-08-11 22:21:26', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(51, 5, NULL, 0, '-789339.1600000000', '2016-08-12 18:59:27', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(52, 6, NULL, 0, '-782369.1600000000', '2016-08-12 18:59:58', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(53, 9, NULL, 0, '-783231.7000000000', '2016-08-12 19:00:23', '0.0000000000', 'Edición manual del balance de cuenta de la tienda'),
(54, 11, 39, 1, '102118.7200000000', '2016-08-12 19:38:08', '206560.6900000000', 'LOTE 7 MZ 7'),
(55, 11, 39, 1, '-109088.7200000000', '2016-08-12 19:39:17', '886811.1300000000', 'LOTE 7 MZ 7'),
(56, 11, NULL, 0, '-785369.1600000000', '2016-08-12 21:24:28', '101441.9700000000', 'Edición manual del balance de cuenta de la tienda'),
(58, 11, 35, 1, '-111411.9700000000', '2016-08-23 21:25:52', '781692.4100000000', 'LOTE 7 MZ 7'),
(59, 66, 49, 1, '121004.4300000000', '2016-09-07 19:28:17', '121004.4300000000', ''),
(60, 8, 48, 1, '-121004.4300000000', '2016-09-07 19:28:54', '552276.0100000000', 'PLAZO 60 MESES'),
(61, 66, 49, 1, '-121004.4300000000', '2016-09-07 19:29:41', '1104552.0200000000', ''),
(62, 66, 50, 1, '121004.4300000000', '2016-09-07 19:30:17', '1225556.4500000000', '');

-- --------------------------------------------------------

--
-- Table structure for table `phppos_suppliers`
--

CREATE TABLE IF NOT EXISTS `phppos_suppliers` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `phppos_additional_item_numbers`
--
ALTER TABLE `phppos_additional_item_numbers`
  ADD CONSTRAINT `phppos_additional_item_numbers_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_employees`
--
ALTER TABLE `phppos_employees`
  ADD CONSTRAINT `phppos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `phppos_people` (`person_id`);

--
-- Constraints for table `phppos_giftcards`
--
ALTER TABLE `phppos_giftcards`
  ADD CONSTRAINT `phppos_giftcards_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `phppos_customers` (`person_id`);

--
-- Constraints for table `phppos_inventory`
--
ALTER TABLE `phppos_inventory`
  ADD CONSTRAINT `phppos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_inventory_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`);

--
-- Constraints for table `phppos_items`
--
ALTER TABLE `phppos_items`
  ADD CONSTRAINT `phppos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `phppos_suppliers` (`person_id`),
  ADD CONSTRAINT `phppos_items_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `phppos_app_files` (`file_id`);

--
-- Constraints for table `phppos_items_expenses`
--
ALTER TABLE `phppos_items_expenses`
  ADD CONSTRAINT `phppos_items_expenses_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `phppos_suppliers` (`person_id`),
  ADD CONSTRAINT `phppos_items_expenses_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `phppos_app_files` (`file_id`);

--
-- Constraints for table `phppos_items_taxes`
--
ALTER TABLE `phppos_items_taxes`
  ADD CONSTRAINT `phppos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_items_tier_prices`
--
ALTER TABLE `phppos_items_tier_prices`
  ADD CONSTRAINT `phppos_items_tier_prices_ibfk_1` FOREIGN KEY (`tier_id`) REFERENCES `phppos_price_tiers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_items_tier_prices_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_item_kits_taxes`
--
ALTER TABLE `phppos_item_kits_taxes`
  ADD CONSTRAINT `phppos_item_kits_taxes_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_item_kits_tier_prices`
--
ALTER TABLE `phppos_item_kits_tier_prices`
  ADD CONSTRAINT `phppos_item_kits_tier_prices_ibfk_1` FOREIGN KEY (`tier_id`) REFERENCES `phppos_price_tiers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_item_kits_tier_prices_ibfk_2` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`);

--
-- Constraints for table `phppos_item_kit_items`
--
ALTER TABLE `phppos_item_kit_items`
  ADD CONSTRAINT `phppos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_location_items`
--
ALTER TABLE `phppos_location_items`
  ADD CONSTRAINT `phppos_location_items_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_location_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_location_items_expenses`
--
ALTER TABLE `phppos_location_items_expenses`
  ADD CONSTRAINT `phppos_location_items_expenses_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_location_items_expenses_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items_expenses` (`item_id`);

--
-- Constraints for table `phppos_location_items_taxes`
--
ALTER TABLE `phppos_location_items_taxes`
  ADD CONSTRAINT `phppos_location_items_taxes_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_location_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`) ON DELETE CASCADE;

--
-- Constraints for table `phppos_location_items_tier_prices`
--
ALTER TABLE `phppos_location_items_tier_prices`
  ADD CONSTRAINT `phppos_location_items_tier_prices_ibfk_1` FOREIGN KEY (`tier_id`) REFERENCES `phppos_price_tiers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phppos_location_items_tier_prices_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_location_items_tier_prices_ibfk_3` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_sales`
--
ALTER TABLE `phppos_sales`
  ADD CONSTRAINT `phppos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `phppos_customers` (`person_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `phppos_locations` (`location_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_4` FOREIGN KEY (`deleted_by`) REFERENCES `phppos_employees` (`person_id`),
  ADD CONSTRAINT `phppos_sales_ibfk_5` FOREIGN KEY (`tier_id`) REFERENCES `phppos_price_tiers` (`id`);

--
-- Constraints for table `phppos_sales_items`
--
ALTER TABLE `phppos_sales_items`
  ADD CONSTRAINT `phppos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`),
  ADD CONSTRAINT `phppos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`);

--
-- Constraints for table `phppos_sales_items_taxes`
--
ALTER TABLE `phppos_sales_items_taxes`
  ADD CONSTRAINT `phppos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales_items` (`sale_id`),
  ADD CONSTRAINT `phppos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `phppos_items` (`item_id`);

--
-- Constraints for table `phppos_sales_item_kits`
--
ALTER TABLE `phppos_sales_item_kits`
  ADD CONSTRAINT `phppos_sales_item_kits_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`),
  ADD CONSTRAINT `phppos_sales_item_kits_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`);

--
-- Constraints for table `phppos_sales_item_kits_taxes`
--
ALTER TABLE `phppos_sales_item_kits_taxes`
  ADD CONSTRAINT `phppos_sales_item_kits_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales_item_kits` (`sale_id`),
  ADD CONSTRAINT `phppos_sales_item_kits_taxes_ibfk_2` FOREIGN KEY (`item_kit_id`) REFERENCES `phppos_item_kits` (`item_kit_id`);

--
-- Constraints for table `phppos_sales_payments`
--
ALTER TABLE `phppos_sales_payments`
  ADD CONSTRAINT `phppos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`);

--
-- Constraints for table `phppos_store_accounts`
--
ALTER TABLE `phppos_store_accounts`
  ADD CONSTRAINT `phppos_store_accounts_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `phppos_sales` (`sale_id`),
  ADD CONSTRAINT `phppos_store_accounts_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `phppos_customers` (`person_id`);

--
-- Constraints for table `phppos_suppliers`
--
ALTER TABLE `phppos_suppliers`
  ADD CONSTRAINT `phppos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `phppos_people` (`person_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
