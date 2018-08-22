-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.13-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd_smto
DROP DATABASE IF EXISTS `bd_smto`;
CREATE DATABASE IF NOT EXISTS `bd_smto` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bd_smto`;

-- Volcando estructura para tabla bd_smto.area
DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `area_id` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `activo` enum('S','N') NOT NULL DEFAULT 'S',
  `insert_oper` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `update_oper` varchar(15) NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.area: ~11 rows (aproximadamente)
DELETE FROM `area`;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` (`area_id`, `nombre`, `activo`, `insert_oper`, `insert_datetime`, `update_oper`, `update_datetime`) VALUES
	('01', 'MANTENIMIENTO', 'S', 'aluna', '2018-01-15 08:44:40', 'aluna', '2018-01-15 08:44:40'),
	('02', 'ADMINISTRACION', 'S', 'aluna', '2018-01-15 08:44:47', 'aluna', '2018-01-15 08:44:47'),
	('03', 'CONTABILIDAD', 'S', 'aluna', '2018-01-15 08:44:53', 'aluna', '2018-01-15 08:44:53'),
	('04', 'COMERCIAL', 'S', 'aluna', '2018-01-15 08:45:06', 'aluna', '2018-01-15 08:45:06'),
	('05', 'RRHH - SST', 'S', 'aluna', '2018-01-15 08:45:13', 'aluna', '2018-01-15 08:45:13'),
	('06', 'PRODUCCION', 'S', 'aluna', '2018-01-15 08:45:29', 'aluna', '2018-01-15 08:45:29'),
	('07', 'CALIDAD - I + D', 'S', 'aluna', '2018-01-15 08:45:34', 'aluna', '2018-01-15 08:45:34'),
	('08', 'DESPACHOS', 'S', 'aluna', '2018-01-15 08:45:40', 'aluna', '2018-01-15 08:45:40'),
	('09', 'PLANTA 4', 'S', 'aluna', '2018-01-15 08:46:24', 'aluna', '2018-01-15 08:46:44'),
	('10', 'BOGOTA', 'S', 'aluna', '2018-01-15 08:46:51', 'aluna', '2018-01-15 08:46:51'),
	('11', 'PRUEBA', 'S', 'jmto', '2018-03-10 17:31:07', 'jmto', '2018-03-10 17:31:07');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.atributo
DROP TABLE IF EXISTS `atributo`;
CREATE TABLE IF NOT EXISTS `atributo` (
  `seq_atrib_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `atributo` varchar(50) NOT NULL,
  `valor` varchar(50) NOT NULL,
  `activo` char(1) NOT NULL,
  `insert_oper` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `update_oper` varchar(15) NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`seq_atrib_id`)
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.atributo: ~450 rows (aproximadamente)
DELETE FROM `atributo`;
/*!40000 ALTER TABLE `atributo` DISABLE KEYS */;
INSERT INTO `atributo` (`seq_atrib_id`, `atributo`, `valor`, `activo`, `insert_oper`, `insert_datetime`, `update_oper`, `update_datetime`) VALUES
	(1, 'Proceso', 'Mto Predictivo', 'S', 'esistemas', '2014-12-09 16:28:56', 'esistemas', '2014-12-09 16:28:56'),
	(2, 'Proceso', 'Mto Preventivo', 'S', 'esistemas', '2014-12-09 16:29:15', 'esistemas', '2014-12-09 16:29:15'),
	(3, 'Proceso', 'Mto Correctivo', 'S', 'esistemas', '2014-12-09 16:29:30', 'esistemas', '2014-12-09 16:36:51'),
	(19, 'Estado', 'PROGRAMADO', 'S', 'esistemas', '2014-12-10 09:45:07', 'esistemas', '2014-12-10 09:48:42'),
	(20, 'Estado', 'ASIGNADO', 'S', 'esistemas', '2014-12-10 09:45:29', 'esistemas', '2014-12-10 09:45:29'),
	(21, 'Estado', 'EN PROCESO', 'S', 'esistemas', '2014-12-10 09:45:41', 'esistemas', '2014-12-10 09:45:41'),
	(22, 'Estado', 'TERMINADO', 'S', 'esistemas', '2014-12-10 09:46:02', 'esistemas', '2014-12-10 09:46:02'),
	(23, 'Estado', 'CANCELADO', 'N', 'esistemas', '2014-12-10 10:16:58', 'aluna', '2018-03-10 16:42:37'),
	(24, 'Tipo', 'PLANTA DE SALES', 'S', 'esistemas', '2014-12-23 08:44:58', 'esistemas', '2014-12-23 08:44:58'),
	(26, 'PLANTA DE SALES', 'SPRAY DRYER 1 - BOMBA DE ALIMENTACION', 'S', 'esistemas', '2014-12-23 08:46:50', 'esistemas', '2014-12-23 08:46:50'),
	(27, 'PLANTA DE SALES', 'SPRAY DRYER 1 - COLECTOR DE POLVO', 'S', 'esistemas', '2014-12-23 08:47:01', 'esistemas', '2014-12-23 08:47:01'),
	(28, 'PLANTA DE SALES', 'SPRAY DRYER 1 - VALVULA ESTRELLA', 'S', 'esistemas', '2014-12-23 08:47:11', 'esistemas', '2014-12-23 08:47:11'),
	(29, 'PLANTA DE SALES', 'SPRAY DRYER 1 - BLOWER', 'S', 'esistemas', '2014-12-23 08:47:23', 'esistemas', '2014-12-23 08:47:23'),
	(30, 'PLANTA DE SALES', 'SPRAY DRYER 1 - QUEMADOR', 'S', 'esistemas', '2014-12-23 08:47:31', 'esistemas', '2014-12-23 08:47:31'),
	(31, 'PLANTA DE SALES', 'SPRAY DRYER 1 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 08:47:39', 'esistemas', '2014-12-23 08:47:39'),
	(32, 'PLANTA DE SALES', 'SPRAY DRYER 1 - VIBRADOR', 'S', 'esistemas', '2014-12-23 08:47:56', 'esistemas', '2014-12-23 08:47:56'),
	(33, 'PLANTA DE SALES', 'SPRAY DRYER 1 - CAMARA SECADO', 'S', 'esistemas', '2014-12-23 08:48:05', 'esistemas', '2014-12-23 08:48:05'),
	(34, 'PLANTA DE SALES', 'SPRAY DRYER 1 - CICLON', 'S', 'esistemas', '2014-12-23 08:48:15', 'esistemas', '2014-12-23 08:48:15'),
	(35, 'PLANTA DE SALES', 'SPRAY DRYER 1 - DUCTOS', 'S', 'esistemas', '2014-12-23 08:48:24', 'esistemas', '2014-12-23 08:48:24'),
	(36, 'PLANTA DE SALES', 'SPRAY DRYER 1 - BOQUILLAS Y NUCLEO', 'S', 'esistemas', '2014-12-23 08:48:36', 'esistemas', '2014-12-23 08:48:36'),
	(37, 'PLANTA DE SALES', 'SPRAY DRYER 1 - TUBERIAS', 'S', 'esistemas', '2014-12-23 08:48:45', 'esistemas', '2014-12-23 08:48:45'),
	(38, 'PLANTA DE SALES', 'SPRAY DRYER 2 - BLOWER', 'S', 'esistemas', '2014-12-23 08:54:12', 'esistemas', '2014-12-23 08:54:12'),
	(39, 'PLANTA DE SALES', 'SPRAY DRYER 2 - BOMBA DE ALIMENTACION', 'S', 'esistemas', '2014-12-23 08:54:23', 'esistemas', '2014-12-23 08:54:23'),
	(40, 'PLANTA DE SALES', 'SPRAY DRYER 2 - BOQUILLAS Y NUCLEO', 'S', 'esistemas', '2014-12-23 08:54:33', 'esistemas', '2014-12-23 08:54:33'),
	(41, 'PLANTA DE SALES', 'SPRAY DRYER 2 - CAMARA SECADO', 'S', 'esistemas', '2014-12-23 08:54:42', 'esistemas', '2014-12-23 08:54:42'),
	(42, 'PLANTA DE SALES', 'SPRAY DRYER 2 - CICLON', 'S', 'esistemas', '2014-12-23 08:54:52', 'esistemas', '2014-12-23 08:54:52'),
	(43, 'PLANTA DE SALES', 'SPRAY DRYER 2 - COLECTOR DE POLVO', 'S', 'esistemas', '2014-12-23 08:55:06', 'esistemas', '2014-12-23 08:55:06'),
	(44, 'PLANTA DE SALES', 'SPRAY DRYER 2 - DUCTOS', 'S', 'esistemas', '2014-12-23 08:55:20', 'esistemas', '2014-12-23 08:55:20'),
	(45, 'PLANTA DE SALES', 'SPRAY DRYER 2 - QUEMADOR', 'S', 'esistemas', '2014-12-23 08:55:28', 'esistemas', '2014-12-23 08:55:28'),
	(46, 'PLANTA DE SALES', 'SPRAY DRYER 2 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 08:55:37', 'esistemas', '2014-12-23 08:55:37'),
	(47, 'PLANTA DE SALES', 'SPRAY DRYER 2 - TUBERIAS', 'S', 'esistemas', '2014-12-23 08:55:54', 'esistemas', '2014-12-23 08:55:54'),
	(48, 'PLANTA DE SALES', 'SPRAY DRYER 2 - VALVULA ESTRELLA', 'S', 'esistemas', '2014-12-23 08:56:03', 'esistemas', '2014-12-23 08:56:03'),
	(49, 'PLANTA DE SALES', 'SPRAY DRYER 2 - VIBRADOR', 'S', 'esistemas', '2014-12-23 08:56:13', 'esistemas', '2014-12-23 08:56:13'),
	(50, 'PLANTA DE SALES', 'SPRAY DRYER 2 - CEDAZO No 2', 'S', 'esistemas', '2014-12-23 08:56:54', 'esistemas', '2014-12-23 08:56:54'),
	(51, 'PLANTA DE SALES', 'SPRAY DRYER 3 - BLOWER', 'S', 'esistemas', '2014-12-23 08:57:26', 'esistemas', '2014-12-23 08:57:26'),
	(52, 'PLANTA DE SALES', 'SPRAY DRYER 3 - BOMBA DE ALIMENTACION', 'S', 'esistemas', '2014-12-23 08:57:35', 'esistemas', '2014-12-23 08:57:35'),
	(53, 'PLANTA DE SALES', 'SPRAY DRYER 3 - BOQUILLAS Y NUCLEO', 'S', 'esistemas', '2014-12-23 08:57:51', 'esistemas', '2014-12-23 08:57:51'),
	(54, 'PLANTA DE SALES', 'SPRAY DRYER 3 - CAMARA SECADO', 'S', 'esistemas', '2014-12-23 08:58:01', 'esistemas', '2014-12-23 08:58:01'),
	(55, 'PLANTA DE SALES', 'SPRAY DRYER 3 - CICLON', 'S', 'esistemas', '2014-12-23 08:58:09', 'esistemas', '2014-12-23 08:58:09'),
	(56, 'PLANTA DE SALES', 'SPRAY DRYER 3 - COLECTOR DE POLVO', 'S', 'esistemas', '2014-12-23 08:58:18', 'esistemas', '2014-12-23 08:58:18'),
	(57, 'PLANTA DE SALES', 'SPRAY DRYER 3 - DUCTOS', 'S', 'esistemas', '2014-12-23 08:58:27', 'esistemas', '2014-12-23 08:58:27'),
	(58, 'PLANTA DE SALES', 'SPRAY DRYER 3 - QUEMADOR', 'S', 'esistemas', '2014-12-23 08:58:36', 'esistemas', '2014-12-23 08:58:36'),
	(59, 'PLANTA DE SALES', 'SPRAY DRYER 3 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 08:58:46', 'esistemas', '2014-12-23 08:58:46'),
	(60, 'PLANTA DE SALES', 'SPRAY DRYER 3 - TUBERIAS', 'S', 'esistemas', '2014-12-23 08:58:55', 'esistemas', '2014-12-23 08:58:55'),
	(61, 'PLANTA DE SALES', 'SPRAY DRYER 3 - VALVULA ESTRELLA', 'S', 'esistemas', '2014-12-23 08:59:03', 'esistemas', '2014-12-23 08:59:03'),
	(62, 'PLANTA DE SALES', 'SPRAY DRYER 3 - VIBRADOR', 'S', 'esistemas', '2014-12-23 08:59:12', 'esistemas', '2014-12-23 08:59:12'),
	(63, 'PLANTA DE SALES', 'SPRAY DRYER 3 - CEDAZO SUECO No 3', 'S', 'esistemas', '2014-12-23 08:59:34', 'esistemas', '2014-12-23 08:59:34'),
	(64, 'PLANTA DE SALES', 'SPRAY DRYER 4 - BLOWER', 'S', 'esistemas', '2014-12-23 09:33:25', 'esistemas', '2014-12-23 09:33:25'),
	(65, 'PLANTA DE SALES', 'SPRAY DRYER 4 - BOMBA DE ALIMENTACION', 'S', 'esistemas', '2014-12-23 09:33:34', 'esistemas', '2014-12-23 09:33:34'),
	(66, 'PLANTA DE SALES', 'SPRAY DRYER 4 - BOQUILLAS Y NUCLEO', 'S', 'esistemas', '2014-12-23 09:33:46', 'esistemas', '2014-12-23 09:33:46'),
	(67, 'PLANTA DE SALES', 'SPRAY DRYER 4 - CAMARA SECADO', 'S', 'esistemas', '2014-12-23 09:33:57', 'esistemas', '2014-12-23 09:33:57'),
	(68, 'PLANTA DE SALES', 'SPRAY DRYER 4 - CICLON', 'S', 'esistemas', '2014-12-23 09:34:07', 'esistemas', '2014-12-23 09:34:07'),
	(69, 'PLANTA DE SALES', 'SPRAY DRYER 4 - COLECTOR DE POLVO', 'S', 'esistemas', '2014-12-23 09:34:16', 'esistemas', '2014-12-23 09:34:16'),
	(70, 'PLANTA DE SALES', 'SPRAY DRYER 4 - DUCTOS', 'S', 'esistemas', '2014-12-23 09:34:24', 'esistemas', '2014-12-23 09:34:24'),
	(71, 'PLANTA DE SALES', 'SPRAY DRYER 4 - QUEMADOR', 'S', 'esistemas', '2014-12-23 09:34:32', 'esistemas', '2014-12-23 09:34:32'),
	(72, 'PLANTA DE SALES', 'SPRAY DRYER 4 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 09:34:44', 'esistemas', '2014-12-23 09:34:44'),
	(73, 'PLANTA DE SALES', 'SPRAY DRYER 4 - TUBERIAS', 'S', 'esistemas', '2014-12-23 09:34:59', 'esistemas', '2014-12-23 09:34:59'),
	(74, 'PLANTA DE SALES', 'SPRAY DRYER 4 - VALVULA ESTRELLA', 'S', 'esistemas', '2014-12-23 09:35:08', 'esistemas', '2014-12-23 09:35:08'),
	(75, 'PLANTA DE SALES', 'SPRAY DRYER 4 - VIBRADOR', 'S', 'esistemas', '2014-12-23 09:35:18', 'esistemas', '2014-12-23 09:35:18'),
	(76, 'PLANTA DE SALES', 'TUNEL - COLECTOR DE POLVO', 'S', 'esistemas', '2014-12-23 09:35:52', 'esistemas', '2014-12-23 09:35:52'),
	(77, 'PLANTA DE SALES', 'TUNEL - VALVULA ESTRELLA', 'S', 'esistemas', '2014-12-23 09:36:09', 'esistemas', '2014-12-23 09:36:09'),
	(78, 'PLANTA DE SALES', 'TUNEL - BLOWER', 'S', 'esistemas', '2014-12-23 09:36:26', 'esistemas', '2014-12-23 09:36:26'),
	(79, 'PLANTA DE SALES', 'TUNEL - QUEMADOR', 'S', 'esistemas', '2014-12-23 09:36:33', 'esistemas', '2014-12-23 09:36:33'),
	(80, 'PLANTA DE SALES', 'TUNEL - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 09:36:41', 'esistemas', '2014-12-23 09:36:41'),
	(81, 'PLANTA DE SALES', 'TUNEL - AGITADOR', 'S', 'esistemas', '2014-12-23 09:36:50', 'esistemas', '2014-12-23 09:36:50'),
	(82, 'PLANTA DE SALES', 'TUNEL - SIN FIN', 'S', 'esistemas', '2014-12-23 09:36:56', 'esistemas', '2014-12-23 09:36:56'),
	(83, 'PLANTA DE SALES', 'TUNEL - CAMARA DE SECADO', 'S', 'esistemas', '2014-12-23 09:37:06', 'esistemas', '2014-12-23 09:37:06'),
	(84, 'PLANTA DE SALES', 'TUNEL - CICLON', 'S', 'esistemas', '2014-12-23 09:37:12', 'esistemas', '2014-12-23 09:37:12'),
	(85, 'PLANTA DE SALES', 'TUNEL - DUCTOS', 'S', 'esistemas', '2014-12-23 09:37:21', 'esistemas', '2014-12-23 09:37:21'),
	(86, 'PLANTA DE SALES', 'TUNEL - TUBERIAS', 'S', 'esistemas', '2014-12-23 09:37:29', 'esistemas', '2014-12-23 09:37:29'),
	(87, 'PLANTA DE SALES', 'REACTOR 5 - MOTORREDUCTOR', 'S', 'esistemas', '2014-12-23 09:39:15', 'esistemas', '2014-12-23 09:39:15'),
	(88, 'PLANTA DE SALES', 'REACTOR 5 - TUBERIA DE ALIMENTACION', 'S', 'esistemas', '2014-12-23 09:39:25', 'esistemas', '2014-12-23 09:39:25'),
	(89, 'PLANTA DE SALES', 'REACTOR 5 - EJE', 'S', 'esistemas', '2014-12-23 09:39:30', 'esistemas', '2014-12-23 09:39:30'),
	(90, 'PLANTA DE SALES', 'REACTOR 5 - IMPELER', 'S', 'esistemas', '2014-12-23 09:39:37', 'esistemas', '2014-12-23 09:39:37'),
	(91, 'PLANTA DE SALES', 'REACTOR 5 - TANQUE', 'S', 'esistemas', '2014-12-23 09:39:44', 'esistemas', '2014-12-23 09:39:44'),
	(92, 'PLANTA DE SALES', 'REACTOR 5 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 09:39:51', 'esistemas', '2014-12-23 09:39:51'),
	(93, 'PLANTA DE SALES', 'REACTOR 6 - EJE', 'S', 'esistemas', '2014-12-23 09:40:28', 'esistemas', '2014-12-23 09:40:28'),
	(94, 'PLANTA DE SALES', 'REACTOR 6 - IMPELER', 'S', 'esistemas', '2014-12-23 09:40:38', 'esistemas', '2014-12-23 09:40:38'),
	(95, 'PLANTA DE SALES', 'REACTOR 6 - MOTORREDUCTOR', 'S', 'esistemas', '2014-12-23 09:40:47', 'esistemas', '2014-12-23 09:40:47'),
	(96, 'PLANTA DE SALES', 'REACTOR 6 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 09:40:56', 'esistemas', '2014-12-23 09:40:56'),
	(97, 'PLANTA DE SALES', 'REACTOR 6 - TANQUE', 'S', 'esistemas', '2014-12-23 09:41:21', 'esistemas', '2014-12-23 09:41:21'),
	(98, 'PLANTA DE SALES', 'REACTOR 6 - TUBERIA DE ALIMENTACION', 'S', 'esistemas', '2014-12-23 09:41:35', 'esistemas', '2014-12-23 09:41:35'),
	(104, 'PLANTA DE SALES', 'REACTOR 7 - EJE', 'S', 'esistemas', '2014-12-23 09:43:59', 'esistemas', '2014-12-23 09:43:59'),
	(105, 'PLANTA DE SALES', 'REACTOR 7 - IMPELER', 'S', 'esistemas', '2014-12-23 09:44:08', 'esistemas', '2014-12-23 09:44:08'),
	(106, 'PLANTA DE SALES', 'REACTOR 7 - MOTORREDUCTOR', 'S', 'esistemas', '2014-12-23 09:44:18', 'esistemas', '2014-12-23 09:44:18'),
	(107, 'PLANTA DE SALES', 'REACTOR 7 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 09:44:28', 'esistemas', '2014-12-23 09:44:28'),
	(108, 'PLANTA DE SALES', 'REACTOR 7 - TANQUE', 'S', 'esistemas', '2014-12-23 09:44:36', 'esistemas', '2014-12-23 09:44:36'),
	(109, 'PLANTA DE SALES', 'REACTOR 7 - TUBERIA DE ALIMENTACION', 'S', 'esistemas', '2014-12-23 09:44:44', 'esistemas', '2014-12-23 09:44:44'),
	(110, 'PLANTA DE SALES', 'REACTOR 26 - EJE', 'S', 'esistemas', '2014-12-23 09:45:29', 'esistemas', '2014-12-23 09:45:29'),
	(111, 'PLANTA DE SALES', 'REACTOR 26 - IMPELER', 'S', 'esistemas', '2014-12-23 09:45:53', 'esistemas', '2014-12-23 09:45:53'),
	(112, 'PLANTA DE SALES', 'REACTOR 26 - MOTORREDUCTOR', 'S', 'esistemas', '2014-12-23 09:46:07', 'esistemas', '2014-12-23 09:46:07'),
	(113, 'PLANTA DE SALES', 'REACTOR 26 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 09:46:16', 'esistemas', '2014-12-23 09:46:16'),
	(114, 'PLANTA DE SALES', 'REACTOR 26 - TANQUE', 'S', 'esistemas', '2014-12-23 09:46:24', 'esistemas', '2014-12-23 09:46:24'),
	(115, 'PLANTA DE SALES', 'REACTOR 26 - TUBERIA DE ALIMENTACION', 'S', 'esistemas', '2014-12-23 09:46:36', 'esistemas', '2014-12-23 09:46:36'),
	(116, 'PLANTA DE SALES', 'LECHADA DE CAL - BOMBA CENTRIFUGA', 'S', 'esistemas', '2014-12-23 09:47:51', 'esistemas', '2014-12-23 09:47:51'),
	(117, 'PLANTA DE SALES', 'LECHADA DE CAL - BLOWER LECHADA', 'S', 'esistemas', '2014-12-23 09:48:03', 'esistemas', '2014-12-23 09:48:03'),
	(118, 'PLANTA DE SALES', 'LECHADA DE CAL - MOTORREDUCTOR TANQUE', 'S', 'esistemas', '2014-12-23 09:48:17', 'esistemas', '2014-12-23 09:48:17'),
	(119, 'PLANTA DE SALES', 'LECHADA DE CAL - MOTOR BLOWER DE LECHADA', 'S', 'esistemas', '2014-12-23 09:48:36', 'esistemas', '2014-12-23 09:48:36'),
	(120, 'PLANTA DE SALES', 'LECHADA DE CAL - TUBERIA ALIMENTACION LECHADA', 'S', 'esistemas', '2014-12-23 09:48:48', 'esistemas', '2014-12-23 09:48:48'),
	(121, 'PLANTA DE SALES', 'LECHADA DE CAL -  HIDROCICLONES 3 UNI', 'S', 'esistemas', '2014-12-23 09:49:12', 'esistemas', '2014-12-23 09:49:12'),
	(122, 'Tipo', 'PLANTA DE EMULSIFICANTES', 'S', 'esistemas', '2014-12-23 10:02:29', 'esistemas', '2014-12-23 10:02:29'),
	(123, 'PLANTA DE EMULSIFICANTES', 'SPRAY COOLER - BOMBA DE ALIMENTACION', 'S', 'esistemas', '2014-12-23 10:02:59', 'esistemas', '2014-12-23 10:02:59'),
	(124, 'PLANTA DE EMULSIFICANTES', 'SPRAY COOLER - COLECTOR', 'S', 'esistemas', '2014-12-23 10:03:08', 'esistemas', '2014-12-23 10:03:08'),
	(125, 'PLANTA DE EMULSIFICANTES', 'SPRAY COOLER - VALVULA ESTRELLA', 'S', 'esistemas', '2014-12-23 10:03:16', 'esistemas', '2014-12-23 10:03:16'),
	(126, 'PLANTA DE EMULSIFICANTES', 'SPRAY COOLER - BLOWER', 'S', 'esistemas', '2014-12-23 10:03:26', 'esistemas', '2014-12-23 10:03:26'),
	(127, 'PLANTA DE EMULSIFICANTES', 'SPRAY COOLER - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 10:03:42', 'esistemas', '2014-12-23 10:03:42'),
	(128, 'PLANTA DE EMULSIFICANTES', 'SPRAY COOLER - TANQUE DE ALIMENTACION', 'S', 'esistemas', '2014-12-23 10:03:55', 'esistemas', '2014-12-23 10:03:55'),
	(129, 'PLANTA DE EMULSIFICANTES', 'SPRAY PILOTO  - BOMBA DE ALIMENTACION', 'S', 'esistemas', '2014-12-23 10:07:08', 'esistemas', '2014-12-23 10:07:08'),
	(130, 'PLANTA DE EMULSIFICANTES', 'SPRAY PILOTO  - COLECTOR DE POLVO', 'S', 'esistemas', '2014-12-23 10:07:21', 'esistemas', '2014-12-23 10:07:21'),
	(131, 'PLANTA DE EMULSIFICANTES', 'SPRAY PILOTO  - VALVULA ESTRELLA', 'S', 'esistemas', '2014-12-23 10:07:30', 'esistemas', '2014-12-23 10:07:30'),
	(132, 'PLANTA DE EMULSIFICANTES', 'SPRAY PILOTO  - BLOWER', 'S', 'esistemas', '2014-12-23 10:07:47', 'esistemas', '2014-12-23 10:07:47'),
	(133, 'PLANTA DE EMULSIFICANTES', 'SPRAY PILOTO  - QUEMADOR', 'S', 'esistemas', '2014-12-23 10:07:56', 'esistemas', '2014-12-23 10:07:56'),
	(134, 'PLANTA DE EMULSIFICANTES', 'SPRAY PILOTO  - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 10:08:26', 'esistemas', '2014-12-23 10:08:26'),
	(135, 'PLANTA DE EMULSIFICANTES', 'SPRAY PILOTO  - TANQUE ALIMENTACION', 'S', 'esistemas', '2014-12-23 10:08:36', 'esistemas', '2014-12-23 10:08:36'),
	(136, 'PLANTA DE EMULSIFICANTES', 'SPRAY PILOTO  - VIBRADOR', 'S', 'esistemas', '2014-12-23 10:08:52', 'esistemas', '2014-12-23 10:08:52'),
	(137, 'PLANTA DE EMULSIFICANTES', 'REACTOR 20 - REDUCTOR', 'S', 'esistemas', '2014-12-23 10:10:05', 'esistemas', '2014-12-23 10:10:05'),
	(138, 'PLANTA DE EMULSIFICANTES', 'REACTOR 20 - EJE', 'S', 'esistemas', '2014-12-23 10:10:09', 'esistemas', '2014-12-23 10:10:09'),
	(139, 'PLANTA DE EMULSIFICANTES', 'REACTOR 20 - ACCESORIOS', 'S', 'esistemas', '2014-12-23 10:10:19', 'esistemas', '2014-12-23 10:10:19'),
	(140, 'PLANTA DE EMULSIFICANTES', 'REACTOR 20 - IMPELER', 'S', 'esistemas', '2014-12-23 10:10:27', 'esistemas', '2014-12-23 10:10:27'),
	(141, 'PLANTA DE EMULSIFICANTES', 'REACTOR 20 - MOTOR', 'S', 'esistemas', '2014-12-23 10:10:37', 'esistemas', '2014-12-23 10:10:37'),
	(142, 'PLANTA DE EMULSIFICANTES', 'REACTOR 21 - MOTOR', 'S', 'esistemas', '2014-12-23 10:11:04', 'esistemas', '2014-12-23 10:11:04'),
	(143, 'PLANTA DE EMULSIFICANTES', 'REACTOR 21 - REDUCTOR', 'S', 'esistemas', '2014-12-23 10:11:09', 'esistemas', '2014-12-23 10:11:09'),
	(144, 'PLANTA DE EMULSIFICANTES', 'REACTOR 21 - EJE', 'S', 'esistemas', '2014-12-23 10:11:15', 'esistemas', '2014-12-23 10:11:15'),
	(145, 'PLANTA DE EMULSIFICANTES', 'REACTOR 21 - IMPELER', 'S', 'esistemas', '2014-12-23 10:11:28', 'esistemas', '2014-12-23 10:11:28'),
	(146, 'PLANTA DE EMULSIFICANTES', 'REACTOR 21 - TANQUE ENCHAQUETADO', 'S', 'esistemas', '2014-12-23 10:11:37', 'esistemas', '2014-12-23 10:11:37'),
	(147, 'PLANTA DE EMULSIFICANTES', 'REACTOR 21 - VALVULAS DE SEGURIDAD', 'S', 'esistemas', '2014-12-23 10:11:52', 'esistemas', '2014-12-23 10:11:52'),
	(148, 'PLANTA DE EMULSIFICANTES', 'REACTOR 21 - ENTRADA DE NITROGENO', 'S', 'esistemas', '2014-12-23 10:11:59', 'esistemas', '2014-12-23 10:11:59'),
	(149, 'PLANTA DE EMULSIFICANTES', 'REACTOR 21 - SISTEMA DE VACIO', 'S', 'esistemas', '2014-12-23 10:12:10', 'esistemas', '2014-12-23 10:12:10'),
	(150, 'PLANTA DE EMULSIFICANTES', 'REACTOR 21 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 10:12:20', 'esistemas', '2014-12-23 10:12:20'),
	(151, 'PLANTA DE EMULSIFICANTES', 'REACTOR 22 - EJE', 'S', 'esistemas', '2014-12-23 10:13:57', 'esistemas', '2014-12-23 10:13:57'),
	(152, 'PLANTA DE EMULSIFICANTES', 'REACTOR 22 - IMPELER', 'S', 'esistemas', '2014-12-23 10:14:15', 'esistemas', '2014-12-23 10:14:15'),
	(153, 'PLANTA DE EMULSIFICANTES', 'REACTOR 22 - MOTOR', 'S', 'esistemas', '2014-12-23 10:14:23', 'esistemas', '2014-12-23 10:14:23'),
	(154, 'PLANTA DE EMULSIFICANTES', 'REACTOR 22 - REDUCTOR', 'S', 'esistemas', '2014-12-23 10:26:11', 'esistemas', '2014-12-23 10:26:11'),
	(155, 'PLANTA DE EMULSIFICANTES', 'REACTOR 22 - SISTEMA DE VACIO', 'S', 'esistemas', '2014-12-23 10:26:19', 'esistemas', '2014-12-23 10:26:19'),
	(156, 'PLANTA DE EMULSIFICANTES', 'REACTOR 22 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 10:26:28', 'esistemas', '2014-12-23 10:26:28'),
	(157, 'PLANTA DE EMULSIFICANTES', 'REACTOR 22 - TANQUE ENCHAQUETADO', 'S', 'esistemas', '2014-12-23 10:26:40', 'esistemas', '2014-12-23 10:26:40'),
	(158, 'PLANTA DE EMULSIFICANTES', 'REACTOR 22 - VALVULAS DE SEGURIDAD', 'S', 'esistemas', '2014-12-23 10:26:54', 'esistemas', '2014-12-23 10:26:54'),
	(159, 'PLANTA DE EMULSIFICANTES', 'REACTOR 23 - MOTOR', 'S', 'esistemas', '2014-12-23 10:29:49', 'esistemas', '2014-12-23 10:29:49'),
	(160, 'PLANTA DE EMULSIFICANTES', 'REACTOR 23 - REDUCTOR', 'S', 'esistemas', '2014-12-23 10:29:56', 'esistemas', '2014-12-23 10:29:56'),
	(161, 'PLANTA DE EMULSIFICANTES', 'REACTOR 23 - SERPENTIN', 'S', 'esistemas', '2014-12-23 10:30:19', 'esistemas', '2014-12-23 10:30:19'),
	(162, 'PLANTA DE EMULSIFICANTES', 'REACTOR 23 - EJE', 'S', 'esistemas', '2014-12-23 10:30:29', 'esistemas', '2014-12-23 10:30:29'),
	(163, 'PLANTA DE EMULSIFICANTES', 'REACTOR 23 - IMPELER', 'S', 'esistemas', '2014-12-23 10:30:38', 'esistemas', '2014-12-23 10:30:38'),
	(164, 'PLANTA DE EMULSIFICANTES', 'REACTOR 23 - INTERCAMBIADOR DE CALOR', 'S', 'esistemas', '2014-12-23 10:30:56', 'esistemas', '2014-12-23 10:30:56'),
	(165, 'PLANTA DE EMULSIFICANTES', 'REACTOR 23 - VALVULAS DE 3 VIAS', 'S', 'esistemas', '2014-12-23 10:31:04', 'esistemas', '2014-12-23 10:31:04'),
	(166, 'PLANTA DE EMULSIFICANTES', 'REACTOR 23 - TANQUE ENCHAQUETADO', 'S', 'esistemas', '2014-12-23 10:31:14', 'esistemas', '2014-12-23 10:31:14'),
	(167, 'PLANTA DE EMULSIFICANTES', 'REACTOR 23 - VALVULAS DE SEGURIDAD', 'S', 'esistemas', '2014-12-23 10:31:24', 'esistemas', '2014-12-23 10:31:24'),
	(168, 'PLANTA DE EMULSIFICANTES', 'REACTOR 23 - CONTROLADOR DE NITROGENO', 'S', 'esistemas', '2014-12-23 10:31:33', 'esistemas', '2014-12-23 10:31:33'),
	(169, 'PLANTA DE EMULSIFICANTES', 'REACTOR 23 - SISTEMA DE VACIO', 'S', 'esistemas', '2014-12-23 10:31:52', 'esistemas', '2014-12-23 10:31:52'),
	(170, 'PLANTA DE EMULSIFICANTES', 'REACTOR 23 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 10:32:09', 'esistemas', '2014-12-23 10:32:09'),
	(171, 'PLANTA DE EMULSIFICANTES', 'REACTOR 24 - EJE', 'S', 'esistemas', '2014-12-23 10:33:02', 'esistemas', '2014-12-23 10:33:02'),
	(172, 'PLANTA DE EMULSIFICANTES', 'REACTOR 24 - IMPELER', 'S', 'esistemas', '2014-12-23 10:33:19', 'esistemas', '2014-12-23 10:33:19'),
	(173, 'PLANTA DE EMULSIFICANTES', 'REACTOR 24 - INTERCAMBIADOR DE CALOR', 'S', 'esistemas', '2014-12-23 10:33:27', 'esistemas', '2014-12-23 10:33:27'),
	(174, 'PLANTA DE EMULSIFICANTES', 'REACTOR 24 - MOTOR', 'S', 'esistemas', '2014-12-23 10:33:46', 'esistemas', '2014-12-23 10:33:46'),
	(175, 'PLANTA DE EMULSIFICANTES', 'REACTOR 24 - REDUCTOR', 'S', 'esistemas', '2014-12-23 10:33:52', 'esistemas', '2014-12-23 10:33:52'),
	(176, 'PLANTA DE EMULSIFICANTES', 'REACTOR 24 - SERPENTIN', 'S', 'esistemas', '2014-12-23 10:34:08', 'esistemas', '2014-12-23 10:34:08'),
	(177, 'PLANTA DE EMULSIFICANTES', 'REACTOR 24 - SISTEMA DE VACIO', 'S', 'esistemas', '2014-12-23 10:34:12', 'esistemas', '2014-12-23 10:34:12'),
	(178, 'PLANTA DE EMULSIFICANTES', 'REACTOR 24 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 10:34:28', 'esistemas', '2014-12-23 10:34:28'),
	(179, 'PLANTA DE EMULSIFICANTES', 'REACTOR 24 - TANQUE ENCHAQUETADO', 'S', 'esistemas', '2014-12-23 10:34:32', 'esistemas', '2014-12-23 10:34:32'),
	(180, 'PLANTA DE EMULSIFICANTES', 'REACTOR 24 - VALVULAS DE 3 VIAS', 'S', 'esistemas', '2014-12-23 10:34:48', 'esistemas', '2014-12-23 10:34:48'),
	(181, 'PLANTA DE EMULSIFICANTES', 'REACTOR 24 - VALVULAS DE SEGURIDAD', 'S', 'esistemas', '2014-12-23 10:34:54', 'esistemas', '2014-12-23 10:34:54'),
	(182, 'PLANTA DE EMULSIFICANTES', 'REACTOR 25 - EJE', 'S', 'esistemas', '2014-12-23 10:35:30', 'esistemas', '2014-12-23 10:35:30'),
	(183, 'PLANTA DE EMULSIFICANTES', 'REACTOR 25 - IMPELER', 'S', 'esistemas', '2014-12-23 10:35:40', 'esistemas', '2014-12-23 10:35:40'),
	(184, 'PLANTA DE EMULSIFICANTES', 'REACTOR 25 - MOTOR', 'S', 'esistemas', '2014-12-23 10:35:51', 'esistemas', '2014-12-23 10:35:51'),
	(185, 'PLANTA DE EMULSIFICANTES', 'REACTOR 25 - REDUCTOR', 'S', 'esistemas', '2014-12-23 10:35:56', 'esistemas', '2014-12-23 10:35:56'),
	(186, 'PLANTA DE EMULSIFICANTES', 'REACTOR 25 - TANQUE ENCHAQUETADO', 'S', 'esistemas', '2014-12-23 10:36:29', 'esistemas', '2014-12-23 10:36:29'),
	(187, 'PLANTA DE EMULSIFICANTES', 'REACTOR 25 - VALVULAS DE SEGURIDAD', 'S', 'esistemas', '2014-12-23 10:36:36', 'esistemas', '2014-12-23 10:36:36'),
	(188, 'PLANTA DE EMULSIFICANTES', 'REACTOR 25 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 10:36:51', 'esistemas', '2014-12-23 10:36:51'),
	(189, 'PLANTA DE EMULSIFICANTES', 'REACTOR 25 - BOMBA DE TRANSFERENCIA', 'S', 'esistemas', '2014-12-23 10:37:23', 'esistemas', '2014-12-23 10:37:23'),
	(191, 'PLANTA DE EMULSIFICANTES', 'REACTOR 02 - MOTORREDUCTOR', 'S', 'esistemas', '2014-12-23 10:47:02', 'esistemas', '2014-12-23 10:47:02'),
	(192, 'PLANTA DE EMULSIFICANTES', 'REACTOR 02 - EJE', 'S', 'esistemas', '2014-12-23 10:47:09', 'esistemas', '2014-12-23 10:47:09'),
	(193, 'PLANTA DE EMULSIFICANTES', 'REACTOR 02 - IMPELER', 'S', 'esistemas', '2014-12-23 10:47:16', 'esistemas', '2014-12-23 10:47:16'),
	(194, 'PLANTA DE EMULSIFICANTES', 'REACTOR 02 - TANQUE ENCHAQUETADO', 'S', 'esistemas', '2014-12-23 10:47:28', 'esistemas', '2014-12-23 10:47:28'),
	(195, 'PLANTA DE EMULSIFICANTES', 'REACTOR 03 - EJE', 'S', 'esistemas', '2014-12-23 10:47:44', 'esistemas', '2014-12-23 10:47:44'),
	(196, 'PLANTA DE EMULSIFICANTES', 'REACTOR 03 - IMPELER', 'S', 'esistemas', '2014-12-23 10:47:52', 'esistemas', '2014-12-23 10:47:52'),
	(197, 'PLANTA DE EMULSIFICANTES', 'REACTOR 03 - MOTORREDUCTOR', 'S', 'esistemas', '2014-12-23 10:48:07', 'esistemas', '2014-12-23 10:48:07'),
	(198, 'PLANTA DE EMULSIFICANTES', 'REACTOR 03 - TANQUE ENCHAQUETADO', 'S', 'esistemas', '2014-12-23 10:48:14', 'esistemas', '2014-12-23 10:48:14'),
	(199, 'PLANTA DE EMULSIFICANTES', 'REACTOR 04 - EJE', 'S', 'esistemas', '2014-12-23 10:48:29', 'esistemas', '2014-12-23 10:48:29'),
	(200, 'PLANTA DE EMULSIFICANTES', 'REACTOR 04 - IMPELER', 'S', 'esistemas', '2014-12-23 10:48:40', 'esistemas', '2014-12-23 10:48:40'),
	(201, 'PLANTA DE EMULSIFICANTES', 'REACTOR 04 - MOTORREDUCTOR', 'S', 'esistemas', '2014-12-23 10:49:01', 'esistemas', '2014-12-23 10:49:01'),
	(202, 'PLANTA DE EMULSIFICANTES', 'REACTOR 04 - SERPENTIN', 'S', 'esistemas', '2014-12-23 10:49:17', 'esistemas', '2014-12-23 10:49:17'),
	(203, 'PLANTA DE EMULSIFICANTES', 'REACTOR 04 - INTERCAMBIADOR DE CALOR', 'S', 'esistemas', '2014-12-23 10:49:35', 'esistemas', '2014-12-23 10:49:35'),
	(204, 'PLANTA DE EMULSIFICANTES', 'REACTOR 04 - TANQUE ENCHAQUETADO', 'S', 'esistemas', '2014-12-23 10:49:51', 'esistemas', '2014-12-23 10:49:51'),
	(205, 'PLANTA DE EMULSIFICANTES', 'ELEMENTOS COMUNES REACTORES  21-22-23-24', 'S', 'esistemas', '2014-12-23 10:51:01', 'esistemas', '2014-12-23 10:51:01'),
	(206, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 1 - REDUCTOR', 'S', 'esistemas', '2014-12-23 10:51:19', 'esistemas', '2014-12-23 10:51:19'),
	(207, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 1 - TANQUE ENCHAQUETADO', 'S', 'esistemas', '2014-12-23 10:51:27', 'esistemas', '2014-12-23 10:51:27'),
	(208, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 1 - MOTOR', 'S', 'esistemas', '2014-12-23 10:51:45', 'esistemas', '2014-12-23 10:51:45'),
	(209, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - REDUCTOR', 'S', 'esistemas', '2014-12-23 10:52:22', 'esistemas', '2014-12-23 10:52:22'),
	(210, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - EJE MEZCLADOR', 'S', 'esistemas', '2014-12-23 10:52:28', 'esistemas', '2014-12-23 10:52:28'),
	(211, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - ENCHAQUETADO', 'S', 'esistemas', '2014-12-23 10:52:36', 'esistemas', '2014-12-23 10:52:36'),
	(212, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - CEDAZO', 'S', 'esistemas', '2014-12-23 10:52:40', 'esistemas', '2014-12-23 10:52:40'),
	(213, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - VALVULA DE SEGURIDAD', 'S', 'esistemas', '2014-12-23 10:52:52', 'esistemas', '2014-12-23 10:52:52'),
	(214, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - BOMBA NEUMATICA', 'S', 'esistemas', '2014-12-23 10:53:00', 'esistemas', '2014-12-23 10:53:00'),
	(215, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - VIBRADOR', 'S', 'esistemas', '2014-12-23 10:53:07', 'esistemas', '2014-12-23 10:53:07'),
	(216, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - ACOPLE MECANICO', 'S', 'esistemas', '2014-12-23 10:53:19', 'esistemas', '2014-12-23 10:53:19'),
	(217, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - PRENSA Y TOPA', 'S', 'esistemas', '2014-12-23 10:53:28', 'esistemas', '2014-12-23 10:53:28'),
	(218, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - TRAMPA DE VAPOR', 'S', 'esistemas', '2014-12-23 10:53:43', 'esistemas', '2014-12-23 10:53:43'),
	(219, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - CALENTADOR DE AIRE', 'S', 'esistemas', '2014-12-23 10:53:49', 'esistemas', '2014-12-23 10:53:49'),
	(220, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - BOMBA DE SUCCION', 'S', 'esistemas', '2014-12-23 10:54:00', 'esistemas', '2014-12-23 10:54:00'),
	(221, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - BOMBA CATPUMP', 'S', 'esistemas', '2014-12-23 10:54:17', 'esistemas', '2014-12-23 10:54:17'),
	(222, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - MOLINOS', 'S', 'esistemas', '2014-12-23 10:54:22', 'esistemas', '2014-12-23 10:54:22'),
	(223, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 -  WET SCRUBBER', 'S', 'esistemas', '2014-12-23 10:54:40', 'esistemas', '2014-12-23 10:54:40'),
	(224, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - MOTORREDUCTOR', 'S', 'esistemas', '2014-12-23 10:59:22', 'esistemas', '2014-12-23 10:59:22'),
	(225, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - MOTOR', 'S', 'esistemas', '2014-12-23 10:59:30', 'esistemas', '2014-12-23 10:59:30'),
	(226, 'PLANTA DE EMULSIFICANTES', 'RIBOMBLENDER 2 - SISTEMA ELECTRICO', 'S', 'esistemas', '2014-12-23 10:59:39', 'esistemas', '2014-12-23 10:59:39'),
	(227, 'PLANTA DE EMULSIFICANTES', 'MOLINO ELECTRICO - MOTOR SIEMENS', 'S', 'esistemas', '2014-12-23 11:00:00', 'esistemas', '2014-12-23 11:00:00'),
	(228, 'PLANTA DE SALES', 'TK ALIMENTACION 06 FV 12000 LTS', 'S', 'esistemas', '2014-12-23 14:11:38', 'esistemas', '2014-12-23 14:11:38'),
	(229, 'PLANTA DE SALES', 'TK ALIMENTACION 07 FV 12000 LTS', 'S', 'esistemas', '2014-12-23 14:11:54', 'esistemas', '2014-12-23 14:11:54'),
	(230, 'PLANTA DE SALES', 'TK ALIMENTACION 08 FV 10000 LTS', 'S', 'esistemas', '2014-12-23 14:12:13', 'esistemas', '2014-12-23 14:12:13'),
	(231, 'PLANTA DE SALES', 'TK ALIMENTACION 09 FV 6000 LTS', 'S', 'esistemas', '2014-12-23 14:12:32', 'esistemas', '2014-12-23 14:12:32'),
	(232, 'PLANTA DE SALES', 'TK ALIMENTACION 10 FV 6000 LTS', 'S', 'esistemas', '2014-12-23 14:12:46', 'esistemas', '2014-12-23 14:12:46'),
	(233, 'PLANTA DE SALES', 'TK ALIMENTACION 11 FV 4000 LTS', 'S', 'esistemas', '2014-12-23 14:13:04', 'esistemas', '2014-12-23 14:13:04'),
	(234, 'PLANTA DE SALES', 'TK ALIMENTACION 12 FV 5000 LTS', 'S', 'esistemas', '2014-12-23 14:13:40', 'esistemas', '2014-12-23 14:13:40'),
	(235, 'PLANTA DE SALES', 'TK ALIMENTACION 13 FV 3500 LTS', 'S', 'esistemas', '2014-12-23 14:13:56', 'esistemas', '2014-12-23 14:13:56'),
	(236, 'PLANTA DE SALES', 'LAVAMANOS DETRAS SD', 'S', 'esistemas', '2014-12-23 14:17:20', 'esistemas', '2014-12-23 14:17:20'),
	(237, 'PLANTA DE SALES', 'LAVAMANOS SECADOR  X CALOR', 'S', 'esistemas', '2014-12-23 14:17:54', 'esistemas', '2014-12-23 14:17:54'),
	(238, 'PLANTA DE SALES', 'LAVAMANOS INGRESO A PLANTA', 'S', 'esistemas', '2014-12-23 14:18:09', 'esistemas', '2014-12-23 14:18:09'),
	(239, 'PLANTA DE SALES', 'EMPAQUES Y CEDAZADOS', 'S', 'esistemas', '2014-12-23 14:20:35', 'esistemas', '2014-12-23 14:20:35'),
	(240, 'PLANTA DE SALES', 'HEOLICOS 2 UNIDADES', 'S', 'esistemas', '2014-12-23 14:20:53', 'esistemas', '2014-12-23 14:20:53'),
	(241, 'PLANTA DE SALES', 'OTROS EQUIPOS  - MANGUERAS', 'S', 'esistemas', '2014-12-23 14:21:32', 'esistemas', '2014-12-23 14:21:32'),
	(242, 'PLANTA DE SALES', 'OTROS EQUIPOS  - LAMPARAS Y REFLECTORES', 'S', 'esistemas', '2014-12-23 14:21:59', 'esistemas', '2014-12-23 14:21:59'),
	(243, 'PLANTA DE SALES', 'OTROS EQUIPOS  - BOMBA NEUMATICA', 'S', 'esistemas', '2014-12-23 14:22:19', 'esistemas', '2014-12-23 14:22:19'),
	(244, 'PLANTA DE SALES', 'OTROS EQUIPOS  - BOMBA DE TRANSFERENCIA', 'S', 'esistemas', '2014-12-23 14:22:35', 'esistemas', '2014-12-23 14:22:35'),
	(245, 'PLANTA DE SALES', 'OTROS EQUIPOS  - ESCALERAS', 'S', 'esistemas', '2014-12-23 14:23:03', 'esistemas', '2014-12-23 14:23:03'),
	(246, 'PLANTA DE SALES', 'OTROS EQUIPOS  - DUCHA DE EMERGENCIA', 'S', 'esistemas', '2014-12-23 14:23:16', 'esistemas', '2014-12-23 14:23:16'),
	(247, 'PLANTA DE SALES', 'OTROS', 'S', 'esistemas', '2014-12-23 14:23:51', 'esistemas', '2014-12-23 14:23:51'),
	(248, 'Tipo', 'PLANTA DE ENCAPSULADOS', 'S', 'esistemas', '2014-12-23 14:25:12', 'esistemas', '2014-12-23 14:25:12'),
	(249, 'PLANTA DE ENCAPSULADOS', 'CAMARA VERTICAL - BOMBA CENTRIFUGA', 'S', 'esistemas', '2014-12-23 14:42:34', 'esistemas', '2014-12-23 14:42:34'),
	(250, 'PLANTA DE ENCAPSULADOS', 'CAMARA VERTICAL - TK DE MEZCLA 150 KG', 'S', 'esistemas', '2014-12-23 14:42:52', 'esistemas', '2014-12-23 14:42:52'),
	(251, 'PLANTA DE ENCAPSULADOS', 'CAMARA VERTICAL - MOTOR', 'S', 'esistemas', '2014-12-23 14:43:01', 'esistemas', '2014-12-23 14:43:01'),
	(252, 'PLANTA DE ENCAPSULADOS', 'CAMARA VERTICAL - COLECTOR DE POLVO', 'S', 'esistemas', '2014-12-23 14:43:09', 'esistemas', '2014-12-23 14:43:09'),
	(253, 'PLANTA DE ENCAPSULADOS', 'CAMARA VERTICAL - TERMOMETRO 150 GC', 'S', 'esistemas', '2014-12-23 14:43:23', 'esistemas', '2014-12-23 14:43:23'),
	(254, 'PLANTA DE ENCAPSULADOS', 'CAMARA VERTICAL - MANOMETRO 150 PSI', 'S', 'esistemas', '2014-12-23 14:43:34', 'esistemas', '2014-12-23 14:43:34'),
	(255, 'PLANTA DE ENCAPSULADOS', 'CAMARA VERTICAL - BLOWER', 'S', 'esistemas', '2014-12-23 14:43:51', 'esistemas', '2014-12-23 14:43:51'),
	(256, 'PLANTA DE ENCAPSULADOS', 'CAMARA VERTICAL - MOTOR DEL BLOWER', 'S', 'esistemas', '2014-12-23 14:43:59', 'esistemas', '2014-12-23 14:43:59'),
	(257, 'PLANTA DE ENCAPSULADOS', 'CAMARA VERTICAL - TUBERIA SANITARIA A-I 15 MTS', 'S', 'esistemas', '2014-12-23 14:44:55', 'esistemas', '2014-12-23 14:44:55'),
	(258, 'PLANTA DE ENCAPSULADOS', 'CAMARA VERTICAL - TUBERIA SANITARIA A-I 8 MTS', 'S', 'esistemas', '2014-12-23 14:45:10', 'esistemas', '2014-12-23 14:45:10'),
	(259, 'PLANTA DE ENCAPSULADOS', 'CAMARA VERTICAL - BOQUILLA', 'S', 'esistemas', '2014-12-23 14:45:17', 'esistemas', '2014-12-23 14:45:17'),
	(260, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - TK MEZCLA 250 LTS', 'S', 'esistemas', '2014-12-23 14:48:03', 'esistemas', '2014-12-23 14:48:03'),
	(261, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - MOTOR AGITADOR', 'S', 'esistemas', '2014-12-23 14:48:10', 'esistemas', '2014-12-23 14:48:10'),
	(262, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - AGITADORES CON HELICE', 'S', 'esistemas', '2014-12-23 14:48:24', 'esistemas', '2014-12-23 14:48:24'),
	(263, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - TERMOMENTOR 150 GC', 'S', 'esistemas', '2014-12-23 14:48:39', 'esistemas', '2014-12-23 14:48:39'),
	(264, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - BOMBA WAKESHA', 'S', 'esistemas', '2014-12-23 14:48:53', 'esistemas', '2014-12-23 14:48:53'),
	(265, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - BOQUILLAS', 'S', 'esistemas', '2014-12-23 14:49:02', 'esistemas', '2014-12-23 14:49:02'),
	(266, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - MANOMETROS 200 PSI', 'S', 'esistemas', '2014-12-23 14:49:10', 'esistemas', '2014-12-23 14:49:10'),
	(267, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - REGULADORA DE AIRE', 'S', 'esistemas', '2014-12-23 15:09:48', 'esistemas', '2014-12-23 15:09:48'),
	(268, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - TORNILLO SIN FIN', 'S', 'esistemas', '2014-12-23 15:09:58', 'esistemas', '2014-12-23 15:09:58'),
	(269, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - BLOWER', 'S', 'esistemas', '2014-12-23 15:10:02', 'esistemas', '2014-12-23 15:10:02'),
	(270, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - MOTOR BLOWER', 'S', 'esistemas', '2014-12-23 15:10:13', 'esistemas', '2014-12-23 15:10:13'),
	(271, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - COLECTOR DE POLVO', 'S', 'esistemas', '2014-12-23 15:10:20', 'esistemas', '2014-12-23 15:10:20'),
	(272, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - TUBERIA  1 1-2 PUL A-I', 'S', 'esistemas', '2014-12-23 15:10:45', 'esistemas', '2014-12-23 15:10:45'),
	(273, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - VIBRADORES 2 UNI', 'S', 'esistemas', '2014-12-23 15:11:01', 'esistemas', '2014-12-23 15:11:01'),
	(274, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - MOTOR SIN FIN', 'S', 'esistemas', '2014-12-23 15:11:15', 'esistemas', '2014-12-23 15:11:15'),
	(275, 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - REDUCTOR', 'S', 'esistemas', '2014-12-23 15:11:20', 'esistemas', '2014-12-23 15:11:20'),
	(276, 'PLANTA DE ENCAPSULADOS', 'CUARTO CEDAZO - EXTRACTORES', 'S', 'esistemas', '2014-12-23 15:14:35', 'esistemas', '2014-12-23 15:14:35'),
	(277, 'PLANTA DE ENCAPSULADOS', 'CUARTO CEDAZO - EMBUDOS', 'S', 'esistemas', '2014-12-23 15:15:03', 'esistemas', '2014-12-23 15:15:03'),
	(278, 'PLANTA DE ENCAPSULADOS', 'CUARTO CEDAZO - CUNAS METALICAS', 'S', 'esistemas', '2014-12-23 15:15:12', 'esistemas', '2014-12-23 15:15:12'),
	(279, 'PLANTA DE ENCAPSULADOS', 'CUARTO CEDAZO - TANQUE DE FUNDIR', 'S', 'esistemas', '2014-12-23 15:15:25', 'esistemas', '2014-12-23 15:15:25'),
	(280, 'PLANTA DE ENCAPSULADOS', 'CUARTO CEDAZO - TANQUE ENCHAQUETADO', 'S', 'esistemas', '2014-12-23 15:15:47', 'esistemas', '2014-12-23 15:15:47'),
	(281, 'PLANTA DE ENCAPSULADOS', 'ENCAPSULADO 2 - BOMBA CENTRIFUGA', 'S', 'esistemas', '2014-12-23 15:16:09', 'esistemas', '2014-12-23 15:16:09'),
	(282, 'PLANTA DE ENCAPSULADOS', 'ENCAPSULADO 2 - MOTOR', 'S', 'esistemas', '2014-12-23 15:16:22', 'esistemas', '2014-12-23 15:16:22'),
	(283, 'PLANTA DE ENCAPSULADOS', 'ENCAPSULADO 2 - CUNA METALICA', 'S', 'esistemas', '2014-12-23 15:16:46', 'esistemas', '2014-12-23 15:16:46'),
	(284, 'PLANTA DE ENCAPSULADOS', 'CEDAZO ELECTRICO  - ENTRADA SIN FIN', 'S', 'esistemas', '2014-12-23 15:17:54', 'esistemas', '2014-12-23 15:17:54'),
	(285, 'PLANTA DE ENCAPSULADOS', 'CEDAZO ELECTRICO  - MOTORREDUCTOR', 'S', 'esistemas', '2014-12-23 15:18:01', 'esistemas', '2014-12-23 15:18:01'),
	(286, 'PLANTA DE ENCAPSULADOS', 'OTROS', 'S', 'esistemas', '2014-12-23 15:19:34', 'esistemas', '2014-12-23 15:19:34'),
	(287, 'Tipo', 'CUARTO ELECTRICO', 'N', 'esistemas', '2014-12-23 15:20:58', 'aluna', '2018-01-24 13:56:26'),
	(288, 'CUARTO ELECTRICO', 'GABINETE 1 - BREAKER  R 22', 'S', 'esistemas', '2014-12-23 15:23:16', 'esistemas', '2014-12-23 15:23:16'),
	(289, 'CUARTO ELECTRICO', 'GABINETE 1 - VARIADOR R 22', 'S', 'esistemas', '2014-12-23 15:23:36', 'esistemas', '2014-12-23 15:23:36'),
	(290, 'CUARTO ELECTRICO', 'GABINETE 1 - CONTACTOR BOMBA VACIO', 'S', 'esistemas', '2014-12-23 15:24:54', 'esistemas', '2014-12-23 15:24:54'),
	(291, 'CUARTO ELECTRICO', 'GABINETE 1 - CONTACTOR R 23', 'S', 'esistemas', '2014-12-23 15:25:19', 'esistemas', '2014-12-23 15:25:19'),
	(292, 'CUARTO ELECTRICO', 'GABINETE 1 - CONTACTOR BOMBA VACIO AUX', 'S', 'esistemas', '2014-12-23 15:26:06', 'esistemas', '2014-12-23 15:26:06'),
	(293, 'CUARTO ELECTRICO', 'GABINETE 1 - PIROMETRO R 20', 'S', 'esistemas', '2014-12-23 15:36:38', 'esistemas', '2014-12-23 15:36:38'),
	(294, 'CUARTO ELECTRICO', 'GABINETE 1 - PIROMETRO R 23', 'S', 'esistemas', '2014-12-23 15:36:46', 'esistemas', '2014-12-23 15:36:46'),
	(295, 'CUARTO ELECTRICO', 'GABINETE 1 - PIROMETRO R 24', 'S', 'esistemas', '2014-12-23 15:36:52', 'esistemas', '2014-12-23 15:36:52'),
	(296, 'CUARTO ELECTRICO', 'GABINETE 1 - BREAKER EXTRACTOR', 'S', 'esistemas', '2014-12-23 15:38:04', 'esistemas', '2014-12-23 15:38:04'),
	(297, 'CUARTO ELECTRICO', 'GABINETE 1 - BREAKER CAMARA', 'S', 'esistemas', '2014-12-23 15:38:10', 'esistemas', '2014-12-23 15:38:10'),
	(298, 'CUARTO ELECTRICO', 'GABINETE 1 - BREAKER VALVULA 3 VIAS', 'S', 'esistemas', '2014-12-23 15:38:18', 'esistemas', '2014-12-23 15:38:18'),
	(299, 'CUARTO ELECTRICO', 'GABINETE 1 - EXTRACTOR GABINETE', 'S', 'esistemas', '2014-12-23 15:38:35', 'esistemas', '2014-12-23 15:38:35'),
	(300, 'CUARTO ELECTRICO', 'GABINETE 1 - VOLTIMETRO GABINETE', 'S', 'esistemas', '2014-12-23 15:38:48', 'esistemas', '2014-12-23 15:38:48'),
	(301, 'CUARTO ELECTRICO', 'GABINETE 1 - AMPERIMETRO GABINETE', 'S', 'esistemas', '2014-12-23 15:39:02', 'esistemas', '2014-12-23 15:39:02'),
	(302, 'CUARTO ELECTRICO', 'GABINETE 1 - SELECTOR R 20', 'S', 'esistemas', '2014-12-23 15:39:23', 'esistemas', '2014-12-23 15:39:23'),
	(303, 'CUARTO ELECTRICO', 'GABINETE 1 - SELECTOR R 21', 'S', 'esistemas', '2014-12-23 15:39:28', 'esistemas', '2014-12-23 15:39:28'),
	(304, 'CUARTO ELECTRICO', 'GABINETE 1 - SELECTOR R 22', 'S', 'esistemas', '2014-12-23 15:39:34', 'esistemas', '2014-12-23 15:39:34'),
	(305, 'CUARTO ELECTRICO', 'GABINETE 1 - SELECTOR R 24', 'S', 'esistemas', '2014-12-23 15:39:40', 'esistemas', '2014-12-23 15:39:40'),
	(306, 'CUARTO ELECTRICO', 'GABINETE 1 - SELECTOR VALVULA 3 VIAS', 'S', 'esistemas', '2014-12-23 15:39:56', 'esistemas', '2014-12-23 15:39:56'),
	(308, 'CUARTO ELECTRICO', 'GABINETE 1 - PULSADORES', 'S', 'esistemas', '2014-12-23 15:41:00', 'esistemas', '2014-12-23 15:41:00'),
	(309, 'CUARTO ELECTRICO', 'GABINETE 1 - PIROMETRO R 21', 'S', 'esistemas', '2014-12-23 15:41:16', 'esistemas', '2014-12-23 15:41:16'),
	(310, 'CUARTO ELECTRICO', 'GABINETE 1 - INDICADORES LUMINOSOS', 'S', 'esistemas', '2014-12-23 15:41:31', 'esistemas', '2014-12-23 15:41:31'),
	(319, 'CUARTO ELECTRICO', 'GABINETE 2 - VARIADOR R 21', 'S', 'esistemas', '2014-12-23 15:47:33', 'esistemas', '2014-12-23 15:47:33'),
	(320, 'CUARTO ELECTRICO', 'GABINETE 2 -  BREAKER SD 1 Y 3', 'S', 'esistemas', '2014-12-23 15:47:39', 'esistemas', '2014-12-23 15:47:39'),
	(321, 'CUARTO ELECTRICO', 'GABINETE 2 - VARIADORES R 20-24-25-26', 'S', 'esistemas', '2014-12-23 15:47:49', 'esistemas', '2014-12-23 15:47:49'),
	(322, 'CUARTO ELECTRICO', 'GABINETE 2 - BREAKER R 21', 'S', 'esistemas', '2014-12-23 15:48:02', 'esistemas', '2014-12-23 15:48:02'),
	(323, 'CUARTO ELECTRICO', 'GABINETE 2 - BREAKER SD 1 Y 3', 'S', 'esistemas', '2014-12-23 15:48:21', 'esistemas', '2014-12-23 15:48:21'),
	(324, 'CUARTO ELECTRICO', 'GABINETE 2 - BREAKER R 20-24-25-26', 'S', 'esistemas', '2014-12-23 15:48:39', 'esistemas', '2014-12-23 15:48:39'),
	(325, 'CUARTO ELECTRICO', 'GABINETE 2 -  BREAKER SD 2 Y 4', 'S', 'esistemas', '2014-12-23 15:49:07', 'esistemas', '2014-12-23 15:49:07'),
	(326, 'CUARTO ELECTRICO', 'GABINETE 2 - CONTACTORES SD 4', 'S', 'esistemas', '2014-12-23 15:49:22', 'esistemas', '2014-12-23 15:49:22'),
	(327, 'CUARTO ELECTRICO', 'GABINETE 2 - EXTRACTOR GABINETE 2 UNI', 'S', 'esistemas', '2014-12-23 15:50:00', 'esistemas', '2014-12-23 15:50:00'),
	(328, 'CUARTO ELECTRICO', 'GABINETE 2 - SEL MANDO MANUAL TRANSP - SD 1 Y 3', 'S', 'esistemas', '2014-12-23 15:51:14', 'esistemas', '2014-12-23 15:51:14'),
	(329, 'CUARTO ELECTRICO', 'GABINETE 2 - SEL MANDO MANUAL TRANSP - R 20-21', 'S', 'esistemas', '2014-12-23 15:51:27', 'esistemas', '2014-12-23 15:51:27'),
	(330, 'CUARTO ELECTRICO', 'GABINETE 2 - SEL MANDO MANUAL TRANSP - R 24 A 26', 'S', 'esistemas', '2014-12-23 15:51:43', 'esistemas', '2014-12-23 15:51:43'),
	(331, 'CUARTO ELECTRICO', 'GABINETE 2 - SEL MANDO MANUAL TRANSP - LUCES', 'S', 'esistemas', '2014-12-23 15:52:04', 'esistemas', '2014-12-23 15:52:04'),
	(332, 'CUARTO ELECTRICO', 'GABINETE 2 - SEL MANDO MANUAL TRANSP - EXTRACTOR', 'S', 'esistemas', '2014-12-23 15:52:09', 'esistemas', '2014-12-23 15:52:09'),
	(333, 'CUARTO ELECTRICO', 'GABINETE 2 - SEL MANDO MANUAL COMP - SD 1 AL 3', 'S', 'esistemas', '2014-12-23 15:53:06', 'esistemas', '2014-12-23 15:53:06'),
	(334, 'CUARTO ELECTRICO', 'GABINETE 2 - SEL MANDO MANUAL COMP - R 20 Y 21', 'S', 'esistemas', '2014-12-23 15:53:38', 'esistemas', '2014-12-23 15:53:38'),
	(335, 'CUARTO ELECTRICO', 'GABINETE 2 - SEL MANDO MANUAL COMP - R 24 A 26', 'S', 'esistemas', '2014-12-23 15:54:02', 'esistemas', '2014-12-23 15:54:02'),
	(336, 'CUARTO ELECTRICO', 'GABINETE 2 - VOLTIMETRO GABINETE', 'S', 'esistemas', '2014-12-23 15:54:17', 'esistemas', '2014-12-23 15:54:17'),
	(337, 'CUARTO ELECTRICO', 'GABINETE 2 - INDICADORES LUMINOSOS', 'S', 'esistemas', '2014-12-23 15:54:30', 'esistemas', '2014-12-23 15:54:30'),
	(338, 'CUARTO ELECTRICO', 'GABINETE 3 - VARIADOR SD 2', 'S', 'esistemas', '2014-12-23 16:06:00', 'esistemas', '2014-12-23 16:06:00'),
	(339, 'CUARTO ELECTRICO', 'GABINETE 3 - VARIADOR R 3', 'S', 'esistemas', '2014-12-23 16:06:15', 'esistemas', '2014-12-23 16:06:15'),
	(340, 'CUARTO ELECTRICO', 'GABINETE 3 - BREAKER ACIDUMASA 1-2', 'S', 'esistemas', '2014-12-23 16:06:40', 'esistemas', '2014-12-23 16:06:40'),
	(341, 'CUARTO ELECTRICO', 'GABINETE 3 - BREAKER COOLER 1-2', 'S', 'esistemas', '2014-12-23 16:06:58', 'esistemas', '2014-12-23 16:06:58'),
	(342, 'CUARTO ELECTRICO', 'GABINETE 3 - BOMBA PROPIONICO TANQUE', 'S', 'esistemas', '2014-12-23 16:07:35', 'esistemas', '2014-12-23 16:07:35'),
	(343, 'CUARTO ELECTRICO', 'GABINETE 3 - BREAKER PLASTIFICANTE Y R 2', 'S', 'esistemas', '2014-12-23 16:08:21', 'esistemas', '2014-12-23 16:08:21'),
	(344, 'CUARTO ELECTRICO', 'GABINETE 3 - BREAKER CTO CEDAZO Y BOMBA LECHADA', 'S', 'esistemas', '2014-12-23 16:08:47', 'esistemas', '2014-12-23 16:08:47'),
	(345, 'CUARTO ELECTRICO', 'GABINETE 3 - BREAKER EXT TALLER Y BAJO TUNEL', 'S', 'esistemas', '2014-12-23 16:09:10', 'esistemas', '2014-12-23 16:09:10'),
	(346, 'CUARTO ELECTRICO', 'GABINETE 3 - BREAKER SD 1 AL 4', 'S', 'esistemas', '2014-12-23 16:09:35', 'esistemas', '2014-12-23 16:09:35'),
	(347, 'CUARTO ELECTRICO', 'GABINETE 3 - BREAKER EXTRACTOR', 'S', 'esistemas', '2014-12-23 16:09:46', 'esistemas', '2014-12-23 16:09:46'),
	(348, 'CUARTO ELECTRICO', 'GABINETE 3 - CONTACTOR BOMBA DE ACIDO', 'S', 'esistemas', '2014-12-23 16:10:04', 'esistemas', '2014-12-23 16:10:04'),
	(349, 'CUARTO ELECTRICO', 'GABINETE 3 - EXTRACTOR GABINETE', 'S', 'esistemas', '2014-12-23 16:10:20', 'esistemas', '2014-12-23 16:10:20'),
	(350, 'CUARTO ELECTRICO', 'GABINETE 3 - PULSADORES', 'S', 'esistemas', '2014-12-23 16:10:27', 'esistemas', '2014-12-23 16:10:27'),
	(351, 'CUARTO ELECTRICO', 'GABINETE 3 - INDICADOR LUMINOSO', 'S', 'esistemas', '2014-12-23 16:10:42', 'esistemas', '2014-12-23 16:10:42'),
	(352, 'CUARTO ELECTRICO', 'GABINETE 4 - BREAKER BOMBA Y R 7', 'S', 'esistemas', '2014-12-23 16:11:32', 'esistemas', '2014-12-23 16:11:32'),
	(353, 'CUARTO ELECTRICO', 'GABINETE 4 - BREAKER CENTRIFUGA 1 Y 2 -TK AGITADOR', 'S', 'esistemas', '2014-12-23 16:11:56', 'esistemas', '2014-12-23 16:11:56'),
	(354, 'CUARTO ELECTRICO', 'GABINETE 4 - BREAKER BOMBA TRANSF Y  R6', 'S', 'esistemas', '2014-12-23 16:13:26', 'esistemas', '2014-12-23 16:13:26'),
	(355, 'CUARTO ELECTRICO', 'GABINETE 4 - BREAKER TUNEL-MOLINO-CALCINADOR', 'S', 'esistemas', '2014-12-23 16:13:48', 'esistemas', '2014-12-23 16:13:48'),
	(356, 'CUARTO ELECTRICO', 'GABINETE 4 - CONTACTORES R6 Y R7', 'S', 'esistemas', '2014-12-23 16:14:00', 'esistemas', '2014-12-23 16:14:00'),
	(357, 'CUARTO ELECTRICO', 'GABINETE 4 - BREAKER AIRE ACONDICIONADO', 'S', 'esistemas', '2014-12-23 16:14:51', 'esistemas', '2014-12-23 16:14:51'),
	(358, 'CUARTO ELECTRICO', 'GABINETE 4 - TEMPORIZADOR', 'S', 'esistemas', '2014-12-23 16:15:06', 'esistemas', '2014-12-23 16:15:06'),
	(359, 'CUARTO ELECTRICO', 'GABINETE 4 - EXTRACTOR GABINETE', 'S', 'esistemas', '2014-12-23 16:15:28', 'esistemas', '2014-12-23 16:15:28'),
	(360, 'CUARTO ELECTRICO', 'GABINETE 4 - PULSADORE R5 A R7 TK TRATAMIENTO', 'S', 'esistemas', '2014-12-23 16:16:04', 'esistemas', '2014-12-23 16:16:04'),
	(361, 'CUARTO ELECTRICO', 'GABINETE 4 - INDICADORES LUMINOSOS', 'S', 'esistemas', '2014-12-23 16:16:17', 'esistemas', '2014-12-23 16:16:17'),
	(362, 'CUARTO ELECTRICO', 'GABINETE 5 - RELE', 'S', 'esistemas', '2014-12-23 16:16:37', 'esistemas', '2014-12-23 16:16:37'),
	(363, 'CUARTO ELECTRICO', 'GABINETE 5 - TOMAS', 'S', 'esistemas', '2014-12-23 16:16:42', 'esistemas', '2014-12-23 16:16:42'),
	(364, 'CUARTO ELECTRICO', 'GABINETE 5 - TRANSFORMADOR', 'S', 'esistemas', '2014-12-23 16:16:51', 'esistemas', '2014-12-23 16:16:51'),
	(365, 'CUARTO ELECTRICO', 'GABINETE 5 - VARIADOR BOMBA CATPUMP SD1 A SD 3', 'S', 'esistemas', '2014-12-23 16:17:21', 'esistemas', '2014-12-23 16:17:21'),
	(366, 'CUARTO ELECTRICO', 'GABINETE 5 - CONTACTORES', 'S', 'esistemas', '2014-12-23 16:17:38', 'esistemas', '2014-12-23 16:17:38'),
	(367, 'CUARTO ELECTRICO', 'GABINETE 5 - BREAKER', 'S', 'esistemas', '2014-12-23 16:17:44', 'esistemas', '2014-12-23 16:17:44'),
	(368, 'CUARTO ELECTRICO', 'GABINETE 5 - POWER SUPPLY', 'S', 'esistemas', '2014-12-23 16:17:58', 'esistemas', '2014-12-23 16:17:58'),
	(369, 'CUARTO ELECTRICO', 'GABINETE 5 - PUERTO COMUNICACION', 'S', 'esistemas', '2014-12-23 16:18:04', 'esistemas', '2014-12-23 16:18:04'),
	(370, 'CUARTO ELECTRICO', 'GABINETE 5 - PLC SD 1', 'S', 'esistemas', '2014-12-23 16:18:22', 'esistemas', '2014-12-23 16:18:22'),
	(371, 'CUARTO ELECTRICO', 'OTROS', 'S', 'esistemas', '2014-12-23 16:18:44', 'esistemas', '2014-12-23 16:18:44'),
	(372, 'CUARTO ELECTRICO', 'OTROS - LAMPARAS', 'S', 'esistemas', '2014-12-23 16:19:09', 'esistemas', '2014-12-23 16:19:09'),
	(373, 'CUARTO ELECTRICO', 'OTROS - AIRE ACONDICIONADO', 'S', 'esistemas', '2014-12-23 16:19:24', 'esistemas', '2014-12-23 16:19:24'),
	(374, 'CUARTO ELECTRICO', 'GABINETE PC  - DELL OPTIPLEX 3020 COMPLETO', 'S', 'esistemas', '2014-12-23 16:19:59', 'esistemas', '2014-12-23 16:19:59'),
	(375, 'CUARTO ELECTRICO', 'GABINETE PC  - UPS 750 W', 'S', 'esistemas', '2014-12-23 16:20:16', 'esistemas', '2014-12-23 16:20:16'),
	(376, 'CUARTO ELECTRICO', 'GABINETE PC  - REGLETA ELECTRICA', 'S', 'esistemas', '2014-12-23 16:20:23', 'esistemas', '2014-12-23 16:20:23'),
	(377, 'PLANTA DE EMULSIFICANTES', 'OTROS', 'S', 'esistemas', '2014-12-23 16:22:29', 'esistemas', '2014-12-23 16:22:29'),
	(378, 'Tipo', 'DESPACHOS', 'S', 'esistemas', '2014-12-24 10:46:00', 'esistemas', '2014-12-24 10:46:00'),
	(379, 'DESPACHOS', 'CAMIONETA MAZDA', 'S', 'esistemas', '2014-12-24 10:46:27', 'esistemas', '2014-12-24 10:46:27'),
	(380, 'DESPACHOS', 'MONTACARGAS LINDE', 'S', 'esistemas', '2014-12-24 10:46:37', 'esistemas', '2014-12-24 10:46:37'),
	(381, 'DESPACHOS', 'MONTACARGAS TOYOTA', 'S', 'esistemas', '2014-12-24 10:46:45', 'esistemas', '2014-12-24 10:46:45'),
	(382, 'DESPACHOS', 'ESTANTERIAS', 'S', 'esistemas', '2014-12-24 10:46:54', 'esistemas', '2014-12-24 10:46:54'),
	(383, 'DESPACHOS', 'ILUMINANCION', 'S', 'esistemas', '2014-12-24 10:47:02', 'esistemas', '2014-12-24 10:47:02'),
	(384, 'DESPACHOS', 'OTROS', 'S', 'esistemas', '2014-12-24 10:47:12', 'esistemas', '2014-12-24 10:47:12'),
	(385, 'Tipo', 'ZONA DE PONTENCIA', 'S', 'esistemas', '2014-12-24 10:50:13', 'esistemas', '2014-12-24 10:50:13'),
	(386, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - MOTOR DEL BLOWER', 'S', 'esistemas', '2014-12-24 10:52:15', 'esistemas', '2014-12-24 10:52:15'),
	(387, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - MOTOR', 'S', 'esistemas', '2014-12-24 10:52:25', 'esistemas', '2014-12-24 10:52:25'),
	(388, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - BOMBA CALDERIN', 'S', 'esistemas', '2014-12-24 10:52:39', 'esistemas', '2014-12-24 10:52:39'),
	(389, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - TK AISLAMIENTO TERMICO', 'S', 'esistemas', '2014-12-24 10:52:58', 'esistemas', '2014-12-24 10:52:58'),
	(390, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - HAZ DE TUBO', 'S', 'esistemas', '2014-12-24 10:53:10', 'esistemas', '2014-12-24 10:53:10'),
	(391, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - QUEMADOR', 'S', 'esistemas', '2014-12-24 10:53:15', 'esistemas', '2014-12-24 10:53:15'),
	(392, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - TREN DE VALVULAS', 'S', 'esistemas', '2014-12-24 10:53:25', 'esistemas', '2014-12-24 10:53:25'),
	(393, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - CALDERIN', 'S', 'esistemas', '2014-12-24 10:53:30', 'esistemas', '2014-12-24 10:53:30'),
	(394, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - TUBERIA DE GAS', 'S', 'esistemas', '2014-12-24 10:55:30', 'esistemas', '2014-12-24 10:55:30'),
	(395, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - TUBERIA DE VAPOR', 'S', 'esistemas', '2014-12-24 10:55:44', 'esistemas', '2014-12-24 10:55:44'),
	(396, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - TUBERIA DE PURGA', 'S', 'esistemas', '2014-12-24 10:55:52', 'esistemas', '2014-12-24 10:55:52'),
	(397, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - CHEQUE DE ENTRADA', 'S', 'esistemas', '2014-12-24 10:56:05', 'esistemas', '2014-12-24 10:56:05'),
	(398, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - CONTROL NIVEL DEL AGUA', 'S', 'esistemas', '2014-12-24 10:56:14', 'esistemas', '2014-12-24 10:56:14'),
	(399, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - PRESOSTATO', 'S', 'esistemas', '2014-12-24 10:56:26', 'esistemas', '2014-12-24 10:56:26'),
	(400, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - VALVULA DE SEGURIDAD', 'S', 'esistemas', '2014-12-24 10:56:35', 'esistemas', '2014-12-24 10:56:35'),
	(401, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - MANOMETRO', 'S', 'esistemas', '2014-12-24 10:56:40', 'esistemas', '2014-12-24 10:56:40'),
	(402, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - B-A', 'S', 'esistemas', '2014-12-24 10:56:49', 'esistemas', '2014-12-24 10:56:49'),
	(403, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - TERMOMETRO', 'S', 'esistemas', '2014-12-24 10:57:02', 'esistemas', '2014-12-24 10:57:02'),
	(404, 'ZONA DE PONTENCIA', 'CALDERA VAPOR - TABLERO ELECTRICO', 'S', 'esistemas', '2014-12-24 10:57:11', 'esistemas', '2014-12-24 10:57:11'),
	(405, 'ZONA DE PONTENCIA', 'CALDERA ACEITE TERMICO - QUEMADOR EFICIENTE', 'S', 'esistemas', '2014-12-24 10:59:05', 'esistemas', '2014-12-24 10:59:05'),
	(406, 'ZONA DE PONTENCIA', 'CALDERA ACEITE TERMICO - BOMBA CENTRIFUGA', 'S', 'esistemas', '2014-12-24 11:00:04', 'esistemas', '2014-12-24 11:00:04'),
	(407, 'ZONA DE PONTENCIA', 'CALDERA ACEITE TERMICO - CONTADOR', 'S', 'esistemas', '2014-12-24 11:00:15', 'esistemas', '2014-12-24 11:00:15'),
	(408, 'ZONA DE PONTENCIA', 'CALDERA ACEITE TERMICO - MOTOR DE BOMBA', 'S', 'esistemas', '2014-12-24 11:00:20', 'esistemas', '2014-12-24 11:00:20'),
	(409, 'ZONA DE PONTENCIA', 'CALDERA ACEITE TERMICO - TANQUE', 'S', 'esistemas', '2014-12-24 11:00:27', 'esistemas', '2014-12-24 11:00:27'),
	(410, 'ZONA DE PONTENCIA', 'CALDERA ACEITE TERMICO - PRESOSTATO', 'S', 'esistemas', '2014-12-24 11:00:34', 'esistemas', '2014-12-24 11:00:34'),
	(411, 'ZONA DE PONTENCIA', 'CALDERA ACEITE TERMICO - MANOMETRO', 'S', 'esistemas', '2014-12-24 11:00:41', 'esistemas', '2014-12-24 11:00:41'),
	(412, 'ZONA DE PONTENCIA', 'CALDERA ACEITE TERMICO - SERPENTIN', 'S', 'esistemas', '2014-12-24 11:00:51', 'esistemas', '2014-12-24 11:00:51'),
	(413, 'ZONA DE PONTENCIA', 'CALDERA ACEITE TERMICO - CONTADOR DE GAS', 'S', 'esistemas', '2014-12-24 11:00:57', 'esistemas', '2014-12-24 11:00:57'),
	(414, 'ZONA DE PONTENCIA', 'CALDERA ACEITE TERMICO - TABLERO ELECTRONICO', 'S', 'esistemas', '2014-12-24 11:01:07', 'esistemas', '2014-12-24 11:01:07'),
	(415, 'ZONA DE PONTENCIA', 'CALDERA ACEITE TERMICO - TUBERIA', 'S', 'esistemas', '2014-12-24 11:01:18', 'aluna', '2018-01-24 13:56:43'),
	(416, 'ZONA DE PONTENCIA', 'CALDERA ACEITE TERMICO - VALVULA SELENOIDE', 'S', 'esistemas', '2014-12-24 11:01:31', 'esistemas', '2014-12-24 11:01:31'),
	(417, 'ZONA DE PONTENCIA', 'SIS CONTRA INCENDIO - MOTOBOMBA DIESEL', 'S', 'esistemas', '2014-12-24 11:02:09', 'esistemas', '2014-12-24 11:02:09'),
	(418, 'ZONA DE PONTENCIA', 'SIS CONTRA INCENDIO - MOTOBOMBA ELECTRICA', 'S', 'esistemas', '2014-12-24 11:03:12', 'esistemas', '2014-12-24 11:03:12'),
	(419, 'ZONA DE PONTENCIA', 'SIS CONTRA INCENDIO - TK HIDRONEUMATICO', 'S', 'esistemas', '2014-12-24 11:03:25', 'esistemas', '2014-12-24 11:03:25'),
	(420, 'ZONA DE PONTENCIA', 'SIS CONTRA INCENDIO - TUBERIAS', 'S', 'esistemas', '2014-12-24 11:03:32', 'esistemas', '2014-12-24 11:03:32'),
	(421, 'ZONA DE PONTENCIA', 'SIS CONTRA INCENDIO - TK DE AGUA', 'S', 'esistemas', '2014-12-24 11:03:38', 'esistemas', '2014-12-24 11:03:38'),
	(422, 'ZONA DE PONTENCIA', 'TORRE ENFRIAMIENTO - BOMBA CENTRIFUGA', 'S', 'esistemas', '2014-12-24 11:04:07', 'esistemas', '2014-12-24 11:04:07'),
	(423, 'ZONA DE PONTENCIA', 'TORRE ENFRIAMIENTO - BOMBA REACTOR', 'S', 'esistemas', '2014-12-24 11:04:16', 'esistemas', '2014-12-24 11:04:16'),
	(424, 'ZONA DE PONTENCIA', 'TORRE ENFRIAMIENTO - CUERPO TORRE', 'S', 'esistemas', '2014-12-24 11:04:33', 'esistemas', '2014-12-24 11:04:33'),
	(425, 'ZONA DE PONTENCIA', 'TORRE ENFRIAMIENTO - BLOWER', 'S', 'esistemas', '2014-12-24 11:04:40', 'esistemas', '2014-12-24 11:04:40'),
	(426, 'ZONA DE PONTENCIA', 'TORRE ENFRIAMIENTO - MOTOR VENTILADOR', 'S', 'esistemas', '2014-12-24 11:05:00', 'esistemas', '2014-12-24 11:05:00'),
	(427, 'ZONA DE PONTENCIA', 'TORRE ENFRIAMIENTO - MANZANA Y MANGUITO', 'S', 'esistemas', '2014-12-24 11:05:15', 'esistemas', '2014-12-24 11:05:15'),
	(428, 'ZONA DE PONTENCIA', 'TORRE ENFRIAMIENTO - SISTEMA DE RIEGO', 'S', 'esistemas', '2014-12-24 11:05:28', 'esistemas', '2014-12-24 11:05:28'),
	(429, 'ZONA DE PONTENCIA', 'TORRE ENFRIAMIENTO - BOQUILLAS', 'S', 'esistemas', '2014-12-24 11:05:37', 'esistemas', '2014-12-24 11:05:37'),
	(430, 'ZONA DE PONTENCIA', 'TORRE ENFRIAMIENTO - ESTRUCTURA SOPORTE', 'S', 'esistemas', '2014-12-24 11:05:43', 'esistemas', '2014-12-24 11:05:43'),
	(431, 'ZONA DE PONTENCIA', 'TORRE ENFRIAMIENTO - ELIMINADOR DE GOTA', 'S', 'esistemas', '2014-12-24 11:05:59', 'esistemas', '2014-12-24 11:05:59'),
	(432, 'ZONA DE PONTENCIA', 'TORRE ENFRIAMIENTO - TK DE AGUA', 'S', 'esistemas', '2014-12-24 11:06:14', 'esistemas', '2014-12-24 11:06:14'),
	(433, 'ZONA DE PONTENCIA', 'VARIOS - COMPRESOR INGRESOLL RAM', 'S', 'esistemas', '2014-12-24 11:06:48', 'esistemas', '2014-12-24 11:06:48'),
	(434, 'ZONA DE PONTENCIA', 'VARIOS - TK HIDRONEUMATICO', 'S', 'esistemas', '2014-12-24 11:06:59', 'esistemas', '2014-12-24 11:06:59'),
	(435, 'ZONA DE PONTENCIA', 'VARIOS - TK AGUA POTABLE', 'S', 'esistemas', '2014-12-24 11:07:08', 'esistemas', '2014-12-24 11:07:08'),
	(436, 'ZONA DE PONTENCIA', 'VARIOS - TABLERO CONTROL DE BOMBAS', 'S', 'esistemas', '2014-12-24 11:07:19', 'esistemas', '2014-12-24 11:07:19'),
	(437, 'ZONA DE PONTENCIA', 'OTROS', 'S', 'esistemas', '2014-12-24 11:07:24', 'esistemas', '2014-12-24 11:07:24'),
	(438, 'Tipo', 'TANQUES DE PROPIONICO', 'S', 'esistemas', '2014-12-24 11:08:49', 'esistemas', '2014-12-24 11:08:49'),
	(439, 'TANQUES DE PROPIONICO', 'TK 1 INOX CAP 100 TONELADAS', 'S', 'esistemas', '2014-12-24 11:18:25', 'esistemas', '2014-12-24 11:18:25'),
	(440, 'TANQUES DE PROPIONICO', 'TK 2 INOX CAP  22 TONELADAS', 'S', 'esistemas', '2014-12-24 11:18:50', 'esistemas', '2014-12-24 11:18:50'),
	(441, 'TANQUES DE PROPIONICO', 'TK 3 INOX CAP   28 TONELADAS', 'S', 'esistemas', '2014-12-24 11:19:16', 'esistemas', '2014-12-24 11:19:16'),
	(442, 'TANQUES DE PROPIONICO', 'TK 4 INOX CAP  35 TONELADAS', 'S', 'esistemas', '2014-12-24 11:19:48', 'esistemas', '2014-12-24 11:19:48'),
	(443, 'TANQUES DE PROPIONICO', 'TK 5 INOX CAP  50 TONELADAS', 'S', 'esistemas', '2014-12-24 11:20:03', 'esistemas', '2014-12-24 11:20:03'),
	(444, 'Tipo', 'ZONAS COMUNES', 'S', 'esistemas', '2014-12-26 07:54:59', 'esistemas', '2014-12-26 07:54:59'),
	(445, 'ZONAS COMUNES', 'PARQUEADERO', 'S', 'esistemas', '2014-12-26 07:55:19', 'esistemas', '2014-12-26 07:55:19'),
	(446, 'ZONAS COMUNES', 'VIA PRINCIPAL', 'S', 'esistemas', '2014-12-26 07:55:24', 'esistemas', '2014-12-26 07:55:24'),
	(447, 'ZONAS COMUNES', 'VIA ALTERNA', 'S', 'esistemas', '2014-12-26 07:55:32', 'esistemas', '2014-12-26 07:55:32'),
	(448, 'ZONAS COMUNES', 'JARDIN', 'S', 'esistemas', '2014-12-26 07:55:36', 'esistemas', '2014-12-26 07:55:36'),
	(449, 'ZONAS COMUNES', 'PTAR', 'S', 'esistemas', '2014-12-26 07:56:37', 'esistemas', '2014-12-26 07:56:37'),
	(450, 'Contacto', 'Interno', 'S', 'esistemas', '2014-12-26 08:48:30', 'esistemas', '2014-12-26 08:48:30'),
	(451, 'ZONAS COMUNES', 'ZONA VERDE', 'S', 'esistemas', '2014-12-26 10:27:04', 'esistemas', '2014-12-26 10:27:04'),
	(452, 'Tipo', 'OFICINA CARTAGENA', 'S', 'esistemas', '2014-12-29 05:32:02', 'esistemas', '2014-12-29 05:32:02'),
	(453, 'Tipo', 'OFICINA BOGOTA', 'S', 'esistemas', '2014-12-29 05:37:51', 'esistemas', '2014-12-29 05:37:51'),
	(454, 'OFICINA BOGOTA', 'MONTACARGAS', 'S', 'esistemas', '2014-12-29 05:38:19', 'esistemas', '2014-12-29 05:38:19'),
	(455, 'OFICINA BOGOTA', 'OFICINAS', 'S', 'esistemas', '2014-12-29 05:38:26', 'esistemas', '2014-12-29 05:38:26'),
	(456, 'OFICINA BOGOTA', 'ESTANTERIAS', 'S', 'esistemas', '2014-12-29 05:38:33', 'esistemas', '2014-12-29 05:38:33'),
	(457, 'OFICINA CARTAGENA', 'OFICINAS ADMINISTRATIVAS', 'S', 'esistemas', '2014-12-29 09:45:15', 'esistemas', '2014-12-29 09:45:15'),
	(458, 'OFICINA CARTAGENA', 'OFICINA TECNICA', 'S', 'esistemas', '2014-12-29 09:45:33', 'esistemas', '2014-12-29 09:45:33'),
	(459, 'OFICINA CARTAGENA', 'RECEPCION', 'S', 'esistemas', '2014-12-29 09:45:44', 'esistemas', '2014-12-29 09:45:44'),
	(460, 'OFICINA CARTAGENA', 'PORTERIA', 'S', 'esistemas', '2014-12-29 09:45:51', 'esistemas', '2014-12-29 09:45:51'),
	(461, 'OFICINA CARTAGENA', 'BANO DE OPERARIOS', 'S', 'esistemas', '2014-12-29 09:46:10', 'esistemas', '2014-12-29 09:46:10'),
	(462, 'OFICINA CARTAGENA', 'BANOS 1 PISO', 'S', 'esistemas', '2014-12-29 09:46:39', 'esistemas', '2014-12-29 09:46:39'),
	(463, 'OFICINA CARTAGENA', 'BANOS 2 PISO', 'S', 'esistemas', '2014-12-29 09:46:44', 'esistemas', '2014-12-29 09:46:44'),
	(464, 'OFICINA CARTAGENA', 'CAFETERIA', 'S', 'esistemas', '2014-12-29 09:47:16', 'esistemas', '2014-12-29 09:47:16'),
	(465, 'OFICINA CARTAGENA', 'LABORATORIO DE ID', 'S', 'esistemas', '2014-12-29 09:48:11', 'esistemas', '2014-12-29 09:48:11'),
	(466, 'OFICINA CARTAGENA', 'LABORATORIO DE CALIDAD', 'S', 'esistemas', '2014-12-29 09:48:37', 'esistemas', '2014-12-29 09:48:37'),
	(467, 'OFICINA CARTAGENA', 'AIRE CENTRAL 2 PISO', 'S', 'esistemas', '2014-12-29 09:51:01', 'esistemas', '2014-12-29 09:51:01'),
	(468, 'OFICINA CARTAGENA', 'AIRE JCB', 'S', 'esistemas', '2014-12-29 09:51:07', 'esistemas', '2014-12-29 09:51:07'),
	(469, 'OFICINA CARTAGENA', 'AIRE GERENCIA', 'S', 'esistemas', '2014-12-29 09:51:22', 'esistemas', '2014-12-29 09:51:22'),
	(470, 'OFICINA CARTAGENA', 'AIRE SALA DE JUNTAS', 'S', 'esistemas', '2014-12-29 09:51:29', 'esistemas', '2014-12-29 09:51:29'),
	(471, 'OFICINA CARTAGENA', 'AIRE RECEPCION', 'S', 'esistemas', '2014-12-29 09:51:46', 'esistemas', '2014-12-29 09:51:46'),
	(472, 'OFICINA CARTAGENA', 'AIRE CAFETERIA', 'S', 'esistemas', '2014-12-29 09:51:59', 'esistemas', '2014-12-29 09:51:59'),
	(473, 'OFICINA CARTAGENA', 'AIRE LABORATORIO CALIDAD', 'S', 'esistemas', '2014-12-29 09:52:29', 'esistemas', '2014-12-29 09:52:29'),
	(474, 'OFICINA CARTAGENA', 'AIRE LABORATORIO DE ID', 'S', 'esistemas', '2014-12-29 09:52:39', 'esistemas', '2014-12-29 09:52:39'),
	(475, 'OFICINA CARTAGENA', 'AIRE OFICINA TECNICA - CALIDAD', 'S', 'esistemas', '2014-12-29 09:53:18', 'esistemas', '2014-12-29 09:53:18'),
	(476, 'OFICINA CARTAGENA', 'AIRE OFICINA TECNICA - MTO', 'S', 'esistemas', '2014-12-29 09:53:28', 'esistemas', '2014-12-29 09:53:28'),
	(477, 'OFICINA CARTAGENA', 'CUARTO DE SERVIDORES', 'S', 'esistemas', '2014-12-29 09:54:05', 'esistemas', '2014-12-29 09:54:05'),
	(478, 'OFICINA CARTAGENA', 'OTROS', 'S', 'esistemas', '2014-12-29 09:56:13', 'esistemas', '2014-12-29 09:56:13'),
	(479, 'OFICINA CARTAGENA', 'ELEMENTOS DE OFICINA', 'S', 'esistemas', '2014-12-29 11:30:35', 'esistemas', '2014-12-29 11:30:35'),
	(480, 'Tipo', 'PRUEBA1', 'S', 'aluna', '2018-01-24 13:57:21', 'aluna', '2018-01-24 13:57:21'),
	(481, 'PRUEBA1', 'SUB PRUEBA1', 'S', 'aluna', '2018-01-24 13:59:23', 'aluna', '2018-01-24 13:59:23');
/*!40000 ALTER TABLE `atributo` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.componentes
DROP TABLE IF EXISTS `componentes`;
CREATE TABLE IF NOT EXISTS `componentes` (
  `id_componente` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `insert_oper` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `update_oper` varchar(15) NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id_componente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla bd_smto.componentes: ~5 rows (aproximadamente)
DELETE FROM `componentes`;
/*!40000 ALTER TABLE `componentes` DISABLE KEYS */;
INSERT INTO `componentes` (`id_componente`, `nombre`, `descripcion`, `insert_oper`, `insert_datetime`, `update_oper`, `update_datetime`) VALUES
	(1, 'Motorreductor ', 'Motorreductor ', 'insert', '2018-02-22 18:39:38', '', '2018-02-22 18:39:39'),
	(2, 'Bomba Catpumps', 'Bomba Catpumps', 'insert', '2018-02-22 18:40:03', '', '2018-02-22 18:40:04'),
	(3, 'Colector de polvo', 'Colector de polvo', 'insert', '2018-02-22 20:24:21', '', '2018-02-22 20:24:22'),
	(4, 'Blower', 'Blower', 'insert', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
	(5, 'Motor blower', 'Motor blower', 'insert', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `componentes` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.equipo_principal
DROP TABLE IF EXISTS `equipo_principal`;
CREATE TABLE IF NOT EXISTS `equipo_principal` (
  `id_equipo_princ` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `insert_oper` varchar(15) NOT NULL,
  `estado` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `update_oper` varchar(15) NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id_equipo_princ`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla bd_smto.equipo_principal: ~7 rows (aproximadamente)
DELETE FROM `equipo_principal`;
/*!40000 ALTER TABLE `equipo_principal` DISABLE KEYS */;
INSERT INTO `equipo_principal` (`id_equipo_princ`, `nombre`, `descripcion`, `insert_oper`, `estado`, `insert_datetime`, `update_oper`, `update_datetime`) VALUES
	(1, 'REACTOR 23', 'REACTOR 23', 'insert', '1', '0000-00-00 00:00:00', 'update', '0000-00-00 00:00:00'),
	(2, 'CUARTO SD (1,2,4)', 'CUARTO SD (1,2,4)', 'insert', 'S', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00'),
	(12, 'Preba', 'rueba', 'INSERT', '', '2018-03-10 17:34:39', '', '2018-03-10 17:34:39'),
	(13, 'xcxz', 'xzc', 'INSERT', '', '2018-03-10 17:35:28', '', '2018-03-10 17:35:28'),
	(14, 'xcxz', 'xzc', 'INSERT', '', '2018-03-10 17:35:43', '', '2018-03-10 17:35:43'),
	(15, 'dsfdsf', 'dsfds', 'INSERT', '', '2018-03-10 17:35:57', '', '2018-03-10 17:35:57'),
	(16, 'PruebA', '132', 'INSERT', '', '2018-03-10 19:13:46', '', '2018-03-10 19:13:46');
/*!40000 ALTER TABLE `equipo_principal` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.equipo_princ_equipo_sec
DROP TABLE IF EXISTS `equipo_princ_equipo_sec`;
CREATE TABLE IF NOT EXISTS `equipo_princ_equipo_sec` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id_equipo_princ` mediumint(9) NOT NULL DEFAULT '0',
  `nombre_equipo_princ` varchar(50) DEFAULT '0',
  `id_equipo_sec` mediumint(9) NOT NULL DEFAULT '0',
  `nombre_equipo_sec` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla bd_smto.equipo_princ_equipo_sec: ~3 rows (aproximadamente)
DELETE FROM `equipo_princ_equipo_sec`;
/*!40000 ALTER TABLE `equipo_princ_equipo_sec` DISABLE KEYS */;
INSERT INTO `equipo_princ_equipo_sec` (`id`, `id_equipo_princ`, `nombre_equipo_princ`, `id_equipo_sec`, `nombre_equipo_sec`) VALUES
	(1, 1, 'REACTOR 23', 1, 'Bomba de Alimentacion'),
	(2, 1, 'REACTOR 23', 2, 'Colector'),
	(3, 2, 'CUARTO SD (1,2,4)', 3, 'Blower de susccion');
/*!40000 ALTER TABLE `equipo_princ_equipo_sec` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.equipo_secundario
DROP TABLE IF EXISTS `equipo_secundario`;
CREATE TABLE IF NOT EXISTS `equipo_secundario` (
  `id_equipo_sec` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `insert_oper` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `update_oper` varchar(15) NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id_equipo_sec`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla bd_smto.equipo_secundario: ~3 rows (aproximadamente)
DELETE FROM `equipo_secundario`;
/*!40000 ALTER TABLE `equipo_secundario` DISABLE KEYS */;
INSERT INTO `equipo_secundario` (`id_equipo_sec`, `nombre`, `descripcion`, `insert_oper`, `insert_datetime`, `update_oper`, `update_datetime`) VALUES
	(1, 'Bomba de Alimentacion', 'Bomba de Alimentacion', 'insert', '2018-02-22 18:09:28', '', '2018-02-22 18:09:30'),
	(2, 'Colector', 'Colector', 'insert', '2018-02-22 18:09:29', '', '2018-02-22 18:09:29'),
	(3, 'Blower de susccion', 'Blower de susccion', 'insert', '0000-00-00 00:00:00', '', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `equipo_secundario` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.equipo_sec_componente
DROP TABLE IF EXISTS `equipo_sec_componente`;
CREATE TABLE IF NOT EXISTS `equipo_sec_componente` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id_equipo_sec` mediumint(9) NOT NULL DEFAULT '0',
  `nombre_equipo_sec` varchar(50) DEFAULT '0',
  `id_componente` mediumint(9) NOT NULL DEFAULT '0',
  `nombre_componente` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla bd_smto.equipo_sec_componente: ~5 rows (aproximadamente)
DELETE FROM `equipo_sec_componente`;
/*!40000 ALTER TABLE `equipo_sec_componente` DISABLE KEYS */;
INSERT INTO `equipo_sec_componente` (`id`, `id_equipo_sec`, `nombre_equipo_sec`, `id_componente`, `nombre_componente`) VALUES
	(1, 1, 'Bomba de Alimentacion', 1, 'Motorreductor '),
	(2, 1, 'Bomba de Alimentacion', 2, 'Bomba Catpumps'),
	(3, 2, 'Colector', 3, 'Colector de polvo'),
	(4, 3, 'Blower de susccion', 4, 'Blower'),
	(5, 3, 'Blower de susccion', 5, 'Motor blower');
/*!40000 ALTER TABLE `equipo_sec_componente` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.e_mail_error
DROP TABLE IF EXISTS `e_mail_error`;
CREATE TABLE IF NOT EXISTS `e_mail_error` (
  `insert_datetime` datetime NOT NULL,
  `from_name` varchar(120) NOT NULL,
  `from_e_mail` varchar(120) NOT NULL,
  `to_name` varchar(120) NOT NULL,
  `to_e_mail` varchar(120) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `body` text NOT NULL,
  `error_message` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.e_mail_error: ~73 rows (aproximadamente)
DELETE FROM `e_mail_error`;
/*!40000 ALTER TABLE `e_mail_error` DISABLE KEYS */;
INSERT INTO `e_mail_error` (`insert_datetime`, `from_name`, `from_e_mail`, `to_name`, `to_e_mail`, `subject`, `body`, `error_message`) VALUES
	('2014-12-09 13:35:27', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>esistemas</strong> y su contraseña: <strong>gwq1talp</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.5/Mtto/phd_2_12\'>http://192.168.10.5/Mtto/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-09 13:48:32', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'CASALINS LOPEZ PEDRO ANTONIO', 'amantenimiento@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>amto</strong> y su contraseña: <strong>z25jb5oj</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.5/Mtto/phd_2_12\'>http://192.168.10.5/Mtto/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-09 13:49:17', 'Nueva contraseña', 'admin@p-hd.com.ar', 'CASALINS LOPEZ PEDRO ANTONIO', 'amantenimiento@realsa.co', 'Nueva contraseña para PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Se ha modificado su contraseña en PHD Help Desk. <br /> <br />Su usuario es: <strong>amto</strong> y su contraseña: <strong>v2y24oj4</strong> <br /> <br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.5/Mtto/phd_2_12/index.php\'>http://192.168.10.5/Mtto/phd_2_12/index.php</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-09 13:50:41', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'CASALINS LOPEZ PEDRO ANTONIO', 'amantenimiento@realsa.co', 'Nueva contraseña para PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Se ha modificado su contraseña en PHD Help Desk. <br />Su usuario es: <strong>amto</strong> y su contraseña: <strong>29913plj</strong> <br /> <br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.5/Mtto/phd_2_12/index.php\'>http://192.168.10.5/Mtto/phd_2_12/index.php</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-09 15:47:41', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'TORRES QUINTANA JORGE', 'no@aplica.com', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>electromecanico</strong> y su contraseña: <strong>73xmi9j1</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.5/Mtto/phd_2_12\'>http://192.168.10.5/Mtto/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-09 15:51:08', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'BARRIOS MORALES  JULIO', 'no@aplica.com', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>soldador1</strong> y su contraseña: <strong>8g167g4x</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.5/Mtto/phd_2_12\'>http://192.168.10.5/Mtto/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-09 15:52:21', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'RIVERA COGOLLO JHON', 'no@aplica.com', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>soldador2</strong> y su contraseña: <strong>n8y7nxbv</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.5/Mtto/phd_2_12\'>http://192.168.10.5/Mtto/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-09 15:53:32', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'PEREZ ORTIZ ALFREDO', 'no@aplica.com', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>conductor</strong> y su contraseña: <strong>8maxv9m5</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.5/Mtto/phd_2_12\'>http://192.168.10.5/Mtto/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-11 07:43:32', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'BARRAGAN ECHEVERRIA JUAN CARLOS', 'administrativa@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>administrativa</strong> y su contraseña: <strong>56bo3932</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.5/Mtto/phd_2_12\'>http://192.168.10.5/Mtto/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-11 08:54:04', 'BARRAGAN ECHEVERRIA JUAN CARLOS', 'administrativa@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #1 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #1      <b>Fecha:</b> 11/12/2014 08:53:26       <b>Area:</b> 005      <b>Piso:</b> 02 <br /><b>Usuario:</b> (administrativa) - BARRAGAN ECHEVERRIA JUAN CARLOS      <b>Teléfono:</b> 204 <br /> <br /><b>Incidente:</b> DaÃƒÂ±o aire sala de juntas <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-11 08:58:15', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'CONTRATISTA', 'no@aplica.com', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>contratista</strong> y su contraseña: <strong>k8ep43pj</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.5/Mtto/phd_2_12\'>http://192.168.10.5/Mtto/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-11 08:58:49', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'CONTRATISTA', 'no@aplica.com', 'Aviso: se asignó el ticket #1 a (contratista) - CONTRATISTA', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #1      <b>Fecha:</b> 11/12/2014 08:53:26       <b>Area:</b> 005      <b>Piso:</b> 02 <br /><b>Usuario:</b> (administrativa) - BARRAGAN ECHEVERRIA JUAN CARLOS      <b>Teléfono:</b> 204 <br /> <br /><b>Incidente:</b> DaÃƒÂ±o aire sala de juntas <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-11 09:06:02', 'BARRAGAN ECHEVERRIA JUAN CARLOS', 'administrativa@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #2 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #2      <b>Fecha:</b> 11/12/2014 09:05:51       <b>Area:</b> 005      <b>Piso:</b> 02 <br /><b>Usuario:</b> (administrativa) - BARRAGAN ECHEVERRIA JUAN CARLOS      <b>Teléfono:</b> 204 <br /> <br /><b>Incidente:</b> El aire de la sala de junta no enciende <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-11 09:09:45', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'CONTRATISTA', 'no@aplica.com', 'Aviso: se asignó el ticket #2 a (contratista) - CONTRATISTA', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #2      <b>Fecha:</b> 11/12/2014 09:05:51       <b>Area:</b> 005      <b>Piso:</b> 02 <br /><b>Usuario:</b> (administrativa) - BARRAGAN ECHEVERRIA JUAN CARLOS      <b>Teléfono:</b> 204 <br /> <br /><b>Incidente:</b> El aire de la sala de junta no enciende <br /><br /><b>11/12/2014 09:10  - (jmto)</b> - se asigna a un contratista el trabajo\n<br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-11 10:25:45', 'BARRAGAN ECHEVERRIA JUAN CARLOS', 'administrativa@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #3 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #3      <b>Fecha:</b> 11/12/2014 10:26:03       <b>Area:</b> 005      <b>Piso:</b> 02 <br /><b>Usuario:</b> (administrativa) - BARRAGAN ECHEVERRIA JUAN CARLOS      <b>Teléfono:</b> 204 <br /> <br /><b>Incidente:</b> aseo <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-11 10:28:36', 'BARRAGAN ECHEVERRIA JUAN CARLOS', 'administrativa@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #4 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #4      <b>Fecha:</b> 11/12/2014 10:28:29       <b>Area:</b> 019      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lencapsulado) - ACEVEDO BLANQUICET CESAR      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> barba <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-15 16:57:14', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #1 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #1      <b>Fecha:</b> 15/12/2014 16:57:10       <b>Area:</b> 005      <b>Piso:</b> 02 <br /><b>Usuario:</b> (administrativa) - BARRAGAN ECHEVERRIA JUAN CARLOS      <b>Teléfono:</b> 204 <br /> <br /><b>Incidente:</b> se daÃƒÂ±o el codo del spray 4 <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-16 09:28:20', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #2 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #2      <b>Fecha:</b> 16/12/2014 09:28:10       <b>Area:</b> 017      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lsales) - FUENTES MEDINA MICHEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> Cambio de Quemador spray dryer 4 <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-16 09:37:51', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #3 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #3      <b>Fecha:</b> 16/12/2014 09:36:50       <b>Area:</b> 015      <b>Piso:</b> 01 <br /><b>Usuario:</b> (calidad) - TABORDA PUELLO VICTOR MANUEL      <b>Teléfono:</b> Ext 103 <br /> <br /><b>Incidente:</b> Aire del Laboratorio Inv y Desarrollo no funciona <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-16 10:02:26', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'FUENTES  MEDINA MICHEL', 'sales@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>lsales</strong> y su contraseña: <strong>g57eosra</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.66/phd_2_12\'>http://192.168.10.66/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-16 10:03:47', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'CARDONA ALVEAR MIGUEL', 'liderdeemulsificantes@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>lemulsificantes</strong> y su contraseña: <strong>l91c3r7s</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.66/phd_2_12\'>http://192.168.10.66/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-16 10:04:56', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'ACEVEDO BLANQUICET CESAR', 'liderdeencapsulados@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>lencapsulados</strong> y su contraseña: <strong>44dhbaw</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.66/phd_2_12\'>http://192.168.10.66/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-16 10:08:10', 'CARDONA ALVEAR MIGUEL', 'liderdeemulsificantes@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #4 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #4      <b>Fecha:</b> 16/12/2014 10:07:32       <b>Area:</b> 018      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lemulsificantes) - CARDONA ALVEAR MIGUEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> daÃ±o en el motor <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-16 10:14:47', 'CARDONA ALVEAR MIGUEL', 'liderdeemulsificantes@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #5 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #5      <b>Fecha:</b> 16/12/2014 10:13:52       <b>Area:</b> 018      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lemulsificantes) - CARDONA ALVEAR MIGUEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> el eje del reactor 23 se detiene <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-16 10:21:28', 'BARRAGAN ECHEVERRIA JUAN CARLOS', 'administrativa@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #6 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #6      <b>Fecha:</b> 16/12/2014 10:20:44       <b>Area:</b> 005      <b>Piso:</b> 02 <br /><b>Usuario:</b> (administrativa) - BARRAGAN ECHEVERRIA JUAN CARLOS      <b>Teléfono:</b> 204 <br /> <br /><b>Incidente:</b> la cerradura de mi puerta esta daÃ±ada <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-17 08:27:43', 'ACEVEDO BLANQUICET CESAR', 'liderdeencapsulados@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #7 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #7      <b>Fecha:</b> 17/12/2014 08:26:16       <b>Area:</b> 019      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lencapsulado) - ACEVEDO BLANQUICET CESAR      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> cambiar la malla de la cuna del cuarto de cedazo <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-17 14:34:04', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'TORRES LARA ANGEL MARIA', 'produccion1@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>produccion</strong> y su contraseña: <strong>2qj7xag8</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.66/phd_2_12\'>http://192.168.10.66/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-17 14:34:57', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'TABORDA PUELLO VICTOR MANUEL', 'calidad@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>calidad</strong> y su contraseña: <strong>cppb5f43</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.66/phd_2_12\'>http://192.168.10.66/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-17 14:35:57', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'JARAMILLO GUARDO WILDA ROSA', 'controlcalidad@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>laboratorio1</strong> y su contraseña: <strong>eud14m7d</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.66/phd_2_12\'>http://192.168.10.66/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-17 14:36:59', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'CARDENAS RIVERAS AURY ESTELLA', 'investigacionydesarrolo@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>laboratorio2</strong> y su contraseña: <strong>4lch7m6</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.66/phd_2_12\'>http://192.168.10.66/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-17 14:38:34', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'CARO LLERENA JAVIER', 'despachos@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>despachos</strong> y su contraseña: <strong>dszijm91</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.66/phd_2_12\'>http://192.168.10.66/phd_2_12</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-18 09:15:48', 'FUENTES  MEDINA MICHEL', 'sales@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #8 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #8      <b>Fecha:</b> 18/12/2014 09:14:32       <b>Area:</b> 019      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lencapsulado) - ACEVEDO BLANQUICET CESAR      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> daÃ±o en la malla de la cuna del cedazo 2 <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-18 09:55:42', 'FUENTES  MEDINA MICHEL', 'sales@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #9 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #9      <b>Fecha:</b> 18/12/2014 09:54:37       <b>Area:</b> 017      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lsales) - FUENTES MEDINA MICHEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> daÃ±o en el spray Dryer 3 valvula estrella <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-18 09:55:42', 'FUENTES  MEDINA MICHEL', 'sales@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #10 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #10      <b>Fecha:</b> 18/12/2014 09:54:37       <b>Area:</b> 017      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lsales) - FUENTES MEDINA MICHEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> daÃ±o en el spray Dryer 3 valvula estrella <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-18 16:51:21', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #11 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #11      <b>Fecha:</b> 18/12/2014 16:48:28       <b>Area:</b> 002      <b>Piso:</b> 02 <br /><b>Usuario:</b> (systems) - LUNA CASTILLO ANIBAL      <b>Teléfono:</b> 3172811574 <br /> <br /><b>Incidente:</b> La lampara del cuarto del servidor no enciende <br /><br /><b>18/12/2014 16:51  - (esistemas)</b> - no veo respuesta <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-19 08:44:54', 'FUENTES  MEDINA MICHEL', 'sales@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #12 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #12      <b>Fecha:</b> 19/12/2014 08:44:03       <b>Area:</b> 017      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lsales) - FUENTES MEDINA MICHEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> cabio valvula R25 <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-19 11:31:00', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'TORRES QUINTANA JORGE', 'no@aplica.com', 'Nueva contraseña para PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Se ha modificado su contraseña en PHD Help Desk. <br />Su usuario es: <strong>electromecanico</strong> y su contraseña: <strong>dh738gk6</strong> <br /> <br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.66/phd_2_12/index.php\'>http://192.168.10.66/phd_2_12/index.php</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-19 13:11:31', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #13 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #13      <b>Fecha:</b> 19/12/2014 13:11:25       <b>Area:</b> 018      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lemulsificantes) - CARDONA ALVEAR MIGUEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> El cuarto de cedazo se le dano el tanque <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-19 13:13:21', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'BARRIOS MORALES  JULIO', 'no@aplica.com', 'Nueva contraseña para PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Se ha modificado su contraseña en PHD Help Desk. <br />Su usuario es: <strong>soldador1</strong> y su contraseña: <strong>7b3s7noh</strong> <br /> <br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://192.168.10.66/phd_2_12/index.php\'>http://192.168.10.66/phd_2_12/index.php</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-20 10:25:05', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #14 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #14      <b>Fecha:</b> 20/12/2014 10:25:01       <b>Area:</b> 017      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lsales) - FUENTES MEDINA MICHEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> daÃƒÂ±o en reactor 4 daÃƒÂ±o no identificado <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-20 10:55:01', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #15 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #15      <b>Fecha:</b> 20/12/2014 10:54:57       <b>Area:</b> 017      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lsales) - FUENTES MEDINA MICHEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> daÃƒÂ±o en spray dryer 2 <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-26 08:49:54', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #1 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #1      <b>Fecha:</b> 26/12/2014 08:48:31       <b>Area:</b> 017      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lsales) - FUENTES MEDINA MICHEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> EL SPRAY DRYER 3 SE DAÃ‘O LA BLOWER <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-28 15:53:34', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #2 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #2      <b>Fecha:</b> 28/12/2014 17:53:06       <b>Area:</b> 017      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lsales) - FUENTES MEDINA MICHEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> jdjdjd <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-28 16:11:59', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'LOPEZ FLOREZ KETTY PATRICIA', 'compras@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>compras</strong> y su contraseña: <strong>rjductl4</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://ingredsoft.co/webphd\'>http://ingredsoft.co/webphd</a>', 'SMTP Error: Could not authenticate.'),
	('2014-12-28 18:08:04', 'CARDONA ALVEAR MIGUEL', 'liderdeemulsificantes@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #3 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #3      <b>Fecha:</b> 28/12/2014 20:06:52       <b>Area:</b> 018      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lemulsificantes) - CARDONA ALVEAR MIGUEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> El reactor 4 tiene el serpentin con fisura <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-28 18:23:03', 'ACEVEDO BLANQUICET CESAR', 'liderdeencapsulados@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #4 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #4      <b>Fecha:</b> 28/12/2014 20:22:00       <b>Area:</b> 019      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lencapsulado) - ACEVEDO BLANQUICET CESAR      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> Reparar bomba centrifuga <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 05:47:12', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'CABARCAS CASTELLAR LIDIA DEL CARMEN', 'inventarios@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>inventarios</strong> y su contraseña: <strong>7vu3bii</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://ingredsoft.co/webphd\'>http://ingredsoft.co/webphd</a>', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 05:47:28', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'LOPEZ FLOREZ KETTY PATRICIA', 'compras@realsa.co', 'Nueva contraseña para PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Se ha modificado su contraseña en PHD Help Desk. <br />Su usuario es: <strong>compras</strong> y su contraseña: <strong>cxfxtx7o</strong> <br /> <br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://ingredsoft.co/webphd/index.php\'>http://ingredsoft.co/webphd/index.php</a>', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 05:48:32', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'CABARCAS CASTELLAR LIDIA DEL CARMEN', 'inventarios@realsa.co', 'Nueva contraseña para PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Se ha modificado su contraseña en PHD Help Desk. <br />Su usuario es: <strong>inventarios</strong> y su contraseña: <strong>2o3e2ok1</strong> <br /> <br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://ingredsoft.co/webphd/index.php\'>http://ingredsoft.co/webphd/index.php</a>', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 05:51:03', 'Nueva contraseña', 'sistemas.alc@realsa.co', 'RIVERA COGOLLO JHON', 'no@aplica.com', 'Nueva contraseña para PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Se ha modificado su contraseña en PHD Help Desk. <br /> <br />Su usuario es: <strong>soldador2</strong> y su contraseña: <strong>imw1i79s</strong> <br /> <br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://ingredsoft.co/webphd/index.php\'>http://ingredsoft.co/webphd/index.php</a>', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 05:51:34', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'RIVERA COGOLLO JHON', 'no@aplica.com', 'Nueva contraseña para PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Se ha modificado su contraseña en PHD Help Desk. <br />Su usuario es: <strong>soldador2</strong> y su contraseña: <strong>hkgq38ua</strong> <br /> <br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://ingredsoft.co/webphd/index.php\'>http://ingredsoft.co/webphd/index.php</a>', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 06:08:06', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'VITOLA GOMEZ RODGERS', 'financiera@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>financiera</strong> y su contraseña: <strong>8rh3yd7</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://ingredsoft.co/webphd\'>http://ingredsoft.co/webphd</a>', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 06:10:38', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'PRACTICANTE SENA', 'no@aplica.com', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>practicante</strong> y su contraseña: <strong>vav3veia</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://ingredsoft.co/webphd\'>http://ingredsoft.co/webphd</a>', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 06:14:17', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'RUMIE DE CASTILLO JORGE ENRIQUE', 'jer@realsa.co', 'Alta en PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Ha sido dado de alta en PHD Help Desk. <br />Su usuario es: <strong>gerencia</strong> y su contraseña: <strong>rs4598t5</strong> <br /><br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://ingredsoft.co/webphd\'>http://ingredsoft.co/webphd</a>', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 07:10:54', 'FUENTES  MEDINA MICHEL', 'sales@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #5 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #5      <b>Fecha:</b> 29/12/2014 09:10:22       <b>Area:</b> 017      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lsales) - FUENTES MEDINA MICHEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> reparar blower sp 3 <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 09:11:41', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #6 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #6      <b>Fecha:</b> 29/12/2014 11:09:23       <b>Area:</b> 005      <b>Piso:</b> 02 <br /><b>Usuario:</b> (administrativa) - BARRAGAN ECHEVERRIA JUAN CARLOS      <b>Teléfono:</b> 204 <br /> <br /><b>Incidente:</b> Algo salio mal, y ahora no funciona el reactor 2 <br /><br /><b>29/12/2014 09:11  - (esistemas)</b> - Por favor resolver cuanto antes.\n<br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 10:12:21', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #1 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #1      <b>Fecha:</b> 29/12/2014 12:10:17       <b>Area:</b> 004      <b>Piso:</b> 02 <br /><b>Usuario:</b> (compras) - LOPEZ FLOREZ KETTY PATRICIA      <b>Teléfono:</b> Ext 206 <br /> <br /><b>Incidente:</b> Se daño el reactor #20 por favor corregir <br /><br /><b>29/12/2014 10:12  - (jmto)</b> - Se necesita arreglar urgente. <br /><br\n/>', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 11:31:31', 'BARRAGAN ECHEVERRIA JUAN CARLOS', 'administrativa@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #2 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #2      <b>Fecha:</b> 29/12/2014 13:30:50       <b>Area:</b> 005      <b>Piso:</b> 02 <br /><b>Usuario:</b> (administrativa) - BARRAGAN ECHEVERRIA JUAN CARLOS      <b>Teléfono:</b> 204 <br /> <br /><b>Incidente:</b> A mi escritorio se le doblo una pata metalica <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 14:24:39', 'FUENTES  MEDINA MICHEL', 'sales@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #3 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #3      <b>Fecha:</b> 29/12/2014 16:24:08       <b>Area:</b> 017      <b>Piso:</b> 01 <br /><b>Usuario:</b> (lsales) - FUENTES MEDINA MICHEL      <b>Teléfono:</b> Ext 106 <br /> <br /><b>Incidente:</b> dano en el sp1 colector <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-29 14:43:27', 'BARRAGAN ECHEVERRIA JUAN CARLOS', 'administrativa@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #4 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #4      <b>Fecha:</b> 29/12/2014 16:43:03       <b>Area:</b> 005      <b>Piso:</b> 02 <br /><b>Usuario:</b> (administrativa) - BARRAGAN ECHEVERRIA JUAN CARLOS      <b>Teléfono:</b> 204 <br /> <br /><b>Incidente:</b> el aire de la oficina no enciende <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 15:01:16', 'CABARCAS CASTELLAR LIDIA DEL CARMEN', 'inventarios@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #5 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #5      <b>Fecha:</b> 29/12/2014 17:00:06       <b>Area:</b> 003      <b>Piso:</b> 02 <br /><b>Usuario:</b> (inventarios) - CABARCAS CASTELLAR LIDIA DEL CARMEN      <b>Teléfono:</b> Ext 207 <br /> <br /><b>Incidente:</b> el tanque 1 de propionico tiene una fuga <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 16:42:41', 'LOPEZ FLOREZ KETTY PATRICIA', 'compras@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #6 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #6      <b>Fecha:</b> 29/12/2014 18:41:29       <b>Area:</b> 004      <b>Piso:</b> 02 <br /><b>Usuario:</b> (compras) - LOPEZ FLOREZ KETTY PATRICIA      <b>Teléfono:</b> Ext 206 <br /> <br /><b>Incidente:</b> el toma corriente de mi puesto no funciona <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-29 17:09:04', 'TABORDA PUELLO VICTOR MANUEL', 'calidad@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #7 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #7      <b>Fecha:</b> 29/12/2014 19:03:41       <b>Area:</b> 015      <b>Piso:</b> 01 <br /><b>Usuario:</b> (calidad) - TABORDA PUELLO VICTOR MANUEL      <b>Teléfono:</b> Ext 103 <br /> <br /><b>Incidente:</b> el aire del laboratorio de investigacion y desarrollo no esta echando mucho aire <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-30 08:31:13', 'TABORDA PUELLO VICTOR MANUEL', 'calidad@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #8 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #8      <b>Fecha:</b> 30/12/2014 10:27:35       <b>Area:</b> 015      <b>Piso:</b> 01 <br /><b>Usuario:</b> (ccalidad) - JARAMILLO GUARDO WILDA      <b>Teléfono:</b> Ext 102 <br /> <br /><b>Incidente:</b> Se daño el reactor 1 <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-30 10:15:33', 'JARAMILLO GUARDO WILDA ROSA', 'controlcalidad@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #9 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #9      <b>Fecha:</b> 30/12/2014 12:13:59       <b>Area:</b> 015      <b>Piso:</b> 01 <br /><b>Usuario:</b> (ccalidad) - JARAMILLO GUARDO WILDA      <b>Teléfono:</b> Ext 102 <br /> <br /><b>Incidente:</b> cambiar puertas gabinete laboratorio calidad <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-30 11:05:20', 'CARDENAS RIVERAS AURY ESTELLA', 'investigacionydesarrolo@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #10 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #10      <b>Fecha:</b> 30/12/2014 13:04:40       <b>Area:</b> 014      <b>Piso:</b> 01 <br /><b>Usuario:</b> (id) - CARDENAS AURY ESTELLA      <b>Teléfono:</b> 104 <br /> <br /><b>Incidente:</b> el aire del laboratorio de id no funciona <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-30 11:15:38', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'PRACTICANTE SENA', 'no@aplica.com', 'Nueva contraseña para PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Se ha modificado su contraseña en PHD Help Desk. <br />Su usuario es: <strong>practicante</strong> y su contraseña: <strong>z4a64gc9</strong> <br /> <br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://ingredsoft.co/webphd/index.php\'>http://ingredsoft.co/webphd/index.php</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-30 11:34:39', 'TABORDA PUELLO VICTOR MANUEL', 'calidad@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #11 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #11      <b>Fecha:</b> 30/12/2014 13:33:38       <b>Area:</b> 015      <b>Piso:</b> 01 <br /><b>Usuario:</b> (calidad) - TABORDA PUELLO VICTOR MANUEL      <b>Teléfono:</b> Ext 103 <br /> <br /><b>Incidente:</b> Reparacion gato hidraulico puerta de acceso laboratorio de calidad <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-30 11:37:03', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'PEREZ ORTIZ ALFREDO', 'no@aplica.com', 'Nueva contraseña para PHD Help Desk', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br />Se ha modificado su contraseña en PHD Help Desk. <br />Su usuario es: <strong>conductor</strong> y su contraseña: <strong>k5wl2rvy</strong> <br /> <br />El sistema le solicitará que cambie esta contraseña una vez que haya ingresado. <br /><br />Ingrese en: <a href=\'http://ingredsoft.co/webphd/index.php\'>http://ingredsoft.co/webphd/index.php</a>', 'SMTP Error: Could not connect to SMTP host.'),
	('2014-12-30 12:50:48', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #2 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #2      <b>Fecha:</b> 30/12/2014 14:49:09       <b>Area:</b> 007      <b>Piso:</b> 02 <br /><b>Usuario:</b> (despachos) - CARO LLERENA JAVIER      <b>Teléfono:</b> Ext 218 <br /> <br /><b>Incidente:</b> -an-dfmas.mdas.d.asmd-a,.s <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2014-12-30 12:52:34', 'LUNA CASTILLO ANIBAL', 'sistemas.alc@realsa.co', 'FABIAN OROZCO MARTINEZ', 'mantenimiento@realsa.co', 'Aviso: se asignó el ticket #3 a (jmto) - FABIAN OROZCO MARTINEZ', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #3      <b>Fecha:</b> 30/12/2014 14:52:25       <b>Area:</b> 002      <b>Piso:</b> 02 <br /><b>Usuario:</b> (systems) - LUNA CASTILLO ANIBAL      <b>Teléfono:</b> 3172811574 <br /> <br /><b>Incidente:</b> AFASF <br /><br />', 'SMTP Error: Could not authenticate.'),
	('2018-01-24 13:05:39', 'TORRES MARLON', 'sistemas.alc@realsa.co', 'TORRES MARLON', 'sistemas.alc@realsa.co', 'Aviso: se asignó el ticket #5 a (jmto) - TORRES MARLON', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #5      <b>Fecha:</b> 24/01/2018 13:03:20       <b>Area:</b> 03      <b>Piso:</b> 02 <br /><b>Usuario:</b> (ebarrios) - BARRIOS CARABALLOS EUSEBIO      <b>Teléfono:</b> EXT 209 <br /> <br /><b>Incidente:</b> Trapero partido <br /><br />', 'SMTP Error: Could not connect to SMTP host.'),
	('2018-01-24 13:15:00', 'FUENTES JIMENEZ ANDREA', 'seguridadysalud@realsa.co', 'TORRES MARLON', 'sistemas.alc@realsa.co', 'Aviso: se asignó el ticket #6 a (jmto) - TORRES MARLON', '<div style=\'text-align:center\'><img style=\'text-align:center\' src=\'cid:PHD\' alt=\'phd help desk\' border=0 /></div><br /><br /><b>Ticket:</b> #6      <b>Fecha:</b> 24/01/2018 13:13:59       <b>Area:</b> 05      <b>Piso:</b> 02 <br /><b>Usuario:</b> (afuentes) - FUENTES JIMENEZ ANDREA      <b>Teléfono:</b> EXT 218 <br /> <br /><b>Incidente:</b> Puerta del baño dañada <br /><br />', 'SMTP Error: Could not connect to SMTP host.');
/*!40000 ALTER TABLE `e_mail_error` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.hist_pass
DROP TABLE IF EXISTS `hist_pass`;
CREATE TABLE IF NOT EXISTS `hist_pass` (
  `operador_id` varchar(15) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `insert_oper` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.hist_pass: ~25 rows (aproximadamente)
DELETE FROM `hist_pass`;
/*!40000 ALTER TABLE `hist_pass` DISABLE KEYS */;
INSERT INTO `hist_pass` (`operador_id`, `contrasenia`, `insert_oper`, `insert_datetime`) VALUES
	('esistemas', 'e552cdc64c82e37e8705202861f797a0', 'esistemas', '2014-12-09 13:36:38'),
	('administrativa', '6bf76546c6015311a5a2add5ca29db3f', 'administrativa', '2014-12-11 07:49:50'),
	('lsales', '36c9a2966245c963c34666393b065cd2', 'lsales', '2014-12-16 10:02:53'),
	('lemulsificantes', 'c731189e1f6f3740e18092570c585483', 'lemulsificantes', '2014-12-16 10:04:06'),
	('lencapsulados', 'dcd5b6aefe89bfd97fdf9857c6782852', 'lencapsulados', '2014-12-16 10:05:23'),
	('produccion', 'c6bbb61c3105ebddd6cfd3008158f913', 'produccion', '2014-12-17 14:34:27'),
	('calidad', '29fc4eb4d311cf6369107f6014d6b72a', 'calidad', '2014-12-17 14:35:18'),
	('laboratorio1', 'd76ae8c3c9f672949b1de35a81d13f2c', 'laboratorio1', '2014-12-17 14:36:14'),
	('laboratorio2', '44f91bc88b43c43af631fbceeec8f63b', 'laboratorio2', '2014-12-17 14:37:18'),
	('despachos', '004cc8164103135f8d0dee617ed22263', 'despachos', '2014-12-17 14:38:54'),
	('electromecanico', 'a1bf972e6459813d173d29af74bbeeda', 'electromecanico', '2014-12-19 11:31:17'),
	('soldador1', '58f0fd0815b046aee14524a2a5143657', 'soldador1', '2014-12-19 13:13:38'),
	('compras', '8d09ab7d20fd23fb6a4c03bb360f424a', 'compras', '2014-12-29 05:47:55'),
	('inventarios', '99899985bafbaf55915744fb163f27e5', 'inventarios', '2014-12-29 05:48:50'),
	('soldador2', 'b187dd1e03440986d588cb050aea79b1', 'soldador2', '2014-12-29 05:51:55'),
	('financiera', '1ed2c38e769ea7576b5afb84b3b3063f', 'financiera', '2014-12-29 06:08:23'),
	('practicante', '0aea4f56b5c88b302104e5d9dc94263a', 'practicante', '2014-12-29 06:10:59'),
	('gerencia', '8112eb6ee39ce4ee9ed7e635bb1dc2d8', 'gerencia', '2014-12-29 06:14:36'),
	('practicante', 'ea2511c759f802b7e5a6ebd1dbc58aa3', 'practicante', '2014-12-30 11:16:00'),
	('conductor', '931491367db1689a45bb796c57d7d90c', 'conductor', '2014-12-30 11:37:33'),
	('aluna', '3da606e2a8835b469f0dfef6a4738909', 'aluna', '2018-01-12 16:08:18'),
	('jmto', '7d1686cf00e2912f6312ebf40bc70e63', 'jmto', '2018-01-12 16:13:25'),
	('jbarragan', '90ee85eaac48910874d2ffeac2332523', 'jbarragan', '2018-01-15 09:24:16'),
	('afuentes', '427790620915d31aad036dd3f14c55a5', 'afuentes', '2018-01-15 13:56:35'),
	('aluna', 'e10adc3949ba59abbe56e057f20f883e', 'aluna', '2018-03-12 22:37:29');
/*!40000 ALTER TABLE `hist_pass` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.operador
DROP TABLE IF EXISTS `operador`;
CREATE TABLE IF NOT EXISTS `operador` (
  `operador_id` varchar(15) NOT NULL,
  `ape_y_nom` varchar(40) NOT NULL,
  `sector_id` varchar(15) NOT NULL,
  `e_mail` varchar(60) NOT NULL,
  `contrasenia` varchar(255) NOT NULL,
  `privado` enum('S','N') NOT NULL DEFAULT 'S',
  `nivel` tinyint(4) NOT NULL DEFAULT '0',
  `expira_clave` date NOT NULL,
  `avisar_asignado` enum('S','N') NOT NULL DEFAULT 'N',
  `avisar_solicitud` enum('S','N') NOT NULL DEFAULT 'N',
  `insert_oper` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `update_oper` varchar(15) NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`operador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.operador: ~33 rows (aproximadamente)
DELETE FROM `operador`;
/*!40000 ALTER TABLE `operador` DISABLE KEYS */;
INSERT INTO `operador` (`operador_id`, `ape_y_nom`, `sector_id`, `e_mail`, `contrasenia`, `privado`, `nivel`, `expira_clave`, `avisar_asignado`, `avisar_solicitud`, `insert_oper`, `insert_datetime`, `update_oper`, `update_datetime`) VALUES
	('afuentes', 'FUENTES JIMENEZ ANDREA', '05', 'seguridadysalud@realsa.co', 'e10adc3949ba59abbe56e057f20f883e', 'S', 10, '2018-03-16', 'N', 'N', 'aluna', '2018-01-15 11:16:10', 'afuentes', '2018-01-15 13:56:35'),
	('aluna', 'LUNA CASTILLO ANIBAL', '02', 'sistemas.alc@realsa.co', 'fcea920f7412b5da7be0cf42b8c93759', 'S', 20, '2018-05-11', 'N', 'N', 'jmto', '2014-12-09 13:35:17', 'aluna', '2018-03-12 22:37:29'),
	('amillian', 'MILLIAN  ORITIZ ALVARO ANTONIO', '03', 'financiera@realsa.co', '3fbed3f26f66d494448899f3f800812b', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:16:37', 'aluna', '2018-01-15 11:16:37'),
	('aperez', 'PEREZ ORTIZ ALFREDO', '01', 'no@aplica.com', 'e10adc3949ba59abbe56e057f20f883e', 'S', 10, '2015-02-28', 'N', 'N', 'esistemas', '2014-12-09 15:53:22', 'jmto', '2018-01-15 14:30:13'),
	('atorres', 'TORRES LARA ANGEL', '06', 'produccion1@realsa.co', '0e2e7aba0242086732f7fddb45aa7ee6', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:18:43', 'aluna', '2018-01-15 11:18:43'),
	('cacevedo', 'ACEVEDO BLANQUICET CESAR', '06', 'liderdeencapsulados@realsa.co', '9d2277d7ae0f51e222f71e51a720bfdc', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:19:16', 'aluna', '2018-01-15 11:19:16'),
	('ccentanaro', 'CENTANARO CHAVEZ CATHERINE', '06', 'amanufactura@realsa.co', '46440762dcb8d2b1782bd7cbd014c704', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:19:41', 'aluna', '2018-01-15 11:19:41'),
	('contratista', 'CONTRATISTA', '01', 'no@aplica.com', '517594ad51f102c5617bff04f4e4f999', 'S', 10, '2014-12-10', 'N', 'N', 'jmto', '2014-12-11 08:58:05', 'jmto', '2018-01-15 14:30:18'),
	('dvaliente', 'VALIENTE MERCADO DORIS', '03', 'cartera@realsa.co', '19ef503dcdc96276c6cfdf39f1aa46da', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:21:50', 'aluna', '2018-01-15 11:21:50'),
	('ebarrios', 'BARRIOS CARABALLOS EUSEBIO', '03', 'auxcontabilidad@realsa.co', '1c408e19fb1eead965d2e928542ef767', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:29:23', 'aluna', '2018-01-15 11:29:23'),
	('enegrette', 'NEGRETTE ROMERO ELI', '03', 'contabilidad@realsa.co', '15083942e924f3f4171064d4b0d7a160', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:29:35', 'aluna', '2018-01-15 11:29:35'),
	('jbarragan', 'BARRAGAN ECHEVERRIA JUAN CARLOS', '02', 'administrativa@realsa.co', 'e10adc3949ba59abbe56e057f20f883e', 'S', 10, '2018-03-16', 'N', 'N', 'jmto', '2018-01-15 09:20:56', 'aluna', '2018-01-15 11:10:57'),
	('jbarrios', 'BARRIOS MORALES  JULIO', '01', 'no@aplica.com', 'e10adc3949ba59abbe56e057f20f883e', 'S', 10, '2015-02-17', 'N', 'N', 'esistemas', '2014-12-09 15:50:58', 'jmto', '2018-01-15 14:30:42'),
	('jcaro', 'CARO LLERENA JAVIER', '08', 'despachos@realsa.co', '259abf3ff06b3bcac5116fe6818720b3', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:30:03', 'aluna', '2018-01-15 11:30:37'),
	('jfigueroa', 'FIGUEROA DEVOZ JAIME', '08', 'liderdealmacen@realsa.co', '1b53bd1321f7a5260f944f8cdd8a3d37', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:30:24', 'aluna', '2018-01-15 11:30:24'),
	('jmto', 'TORRES MARLON', '01', 'sistemas.alc@realsa.co', 'e10adc3949ba59abbe56e057f20f883e', 'N', 20, '2018-03-13', 'S', 'S', 'SETUP', '2014-12-09 10:56:36', 'jmto', '2018-01-12 16:13:25'),
	('jortega', 'ORTEGA BUITRAGO JOSE ALEX', '04', 'stc3@realsa.co', '075e4d633794034db540ea2ac5239e09', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:31:03', 'aluna', '2018-01-15 11:31:03'),
	('jrivera', 'RIVERA COGOLLO JHON', '01', 'no@aplica.com', 'e10adc3949ba59abbe56e057f20f883e', 'S', 10, '2015-02-27', 'N', 'N', 'esistemas', '2014-12-09 15:52:11', 'jmto', '2018-01-15 14:30:49'),
	('jtorres', 'TORRES QUINTANA JORGE', '01', 'no@aplica.com', 'e10adc3949ba59abbe56e057f20f883e', 'S', 10, '2015-02-17', 'N', 'N', 'esistemas', '2014-12-09 15:47:31', 'jmto', '2018-01-15 14:30:55'),
	('jyepes', 'YEPES RHENAL JESSI', '04', 'stc2@realsa.co', '2ff2c88ebfe01c6cac61652e08b22908', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:31:18', 'aluna', '2018-01-15 11:31:18'),
	('karrieta', 'ARRIETA HERNANDEZ KAREN', '05', 'recepcion@realsa.co', '49bb2425de3b56d91732d2af095e100c', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:31:41', 'aluna', '2018-01-15 11:31:41'),
	('klopez', 'LOPEZ FLOREZ KETTY PATRICIA', '02', 'compras@realsa.co', 'dff04b3a1476947e79d07b4fbdce41d5', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:32:08', 'aluna', '2018-01-15 11:32:08'),
	('lcabarcas', 'CABARCAS CASTELLAR LIDIA DEL CARMEN', '02', 'inventarios@realsa.co', 'e490e0fbc2d5838183c3d1bcf409ba86', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:32:38', 'aluna', '2018-01-15 11:32:38'),
	('ltous', 'TOUS SIERRA LILIANA', '04', 'astc@realsa.co', '25e041b6b047e3905d662007ec6b9116', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:34:24', 'aluna', '2018-01-15 11:34:24'),
	('mcardona', 'CARDONA ALVEAR MIGUEL', '06', 'liderdeemulsificantes@realsa.co', 'af4f6746451ba3197f6f496de2558fa1', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:34:49', 'aluna', '2018-01-15 11:34:49'),
	('mrodriguez', 'RODRIGUEZ VALENCIA MARIANA', '05', 'rhumanos@realsa.co', '6f629739d2c833201123572490e49c4a', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:35:12', 'aluna', '2018-01-15 11:35:12'),
	('pabad', 'ABAD DIAZ PAOLA', '04', 'sales@realsa.co', '1d6c8c50b19206376314d26a2d332557', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:35:44', 'aluna', '2018-01-15 11:35:44'),
	('pcasalins', 'CASALINS LOPEZ PEDRO ANTONIO', '01', 'amantenimiento@realsa.co', '003942df42c36560d3c0b026a2a546c0', 'S', 10, '2014-12-08', 'N', 'N', 'jmto', '2014-12-09 13:48:21', 'jmto', '2018-01-15 14:31:01'),
	('rtatis', 'TATIS CASTRO ROY', '07', 'investigacionydesarrollo@realsa.co', '308efabc0bbac4cdf4c802fdc3d8b5ce', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:37:49', 'aluna', '2018-01-15 13:36:19'),
	('vtaborda', 'TABORDA PUELLO VICTOR MANUEL', '07', 'calidad@realsa.co', '15c8f0d4c695c21a8e1e9496942c3982', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 11:38:14', 'aluna', '2018-01-15 11:38:14'),
	('vuejbe', 'UEJBE AVENDAÑO VICTORIA', '07', 'analistadelaboratorios@realsa.co', 'fc5438b6916f64561fdf68aaa1046b15', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 13:29:57', 'aluna', '2018-01-15 13:29:57'),
	('wjaramillo', 'JARAMILLO GUARDO WILDA', '07', 'controlcalidad@realsa.co', 'b5e7d0612544c673f4f5fec1fd0e3550', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 13:23:26', 'aluna', '2018-01-15 13:23:26'),
	('ymorales', 'MORALES PEREZ YOIS', '07', 'stc@realsa.co', '170c99feb87c8f302f0b02395b1d18f4', 'S', 10, '2018-01-14', 'N', 'N', 'aluna', '2018-01-15 13:23:47', 'aluna', '2018-01-15 13:23:47');
/*!40000 ALTER TABLE `operador` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.parametros
DROP TABLE IF EXISTS `parametros`;
CREATE TABLE IF NOT EXISTS `parametros` (
  `validez_psw` smallint(5) unsigned NOT NULL,
  `dias_psw` smallint(5) unsigned NOT NULL,
  `max_lines_screen` smallint(5) unsigned NOT NULL,
  `max_lines_export` mediumint(8) unsigned NOT NULL,
  `max_dif_min` smallint(5) unsigned NOT NULL,
  `max_attach` mediumint(8) unsigned NOT NULL,
  `assign_ticket` enum('S','N') NOT NULL DEFAULT 'N',
  `from_user_request` varchar(60) NOT NULL,
  `from_user_psw` varchar(60) NOT NULL,
  `contact_default` varchar(20) DEFAULT NULL,
  `process_default` varchar(20) DEFAULT NULL,
  `state_default` varchar(20) DEFAULT NULL,
  `state_alert` varchar(20) DEFAULT NULL,
  `main_screen_state` varchar(20) DEFAULT NULL,
  `date_format` enum('DMA','MDA','AMD') NOT NULL DEFAULT 'DMA',
  `PEN` varchar(20) NOT NULL,
  `PAS` varchar(20) NOT NULL,
  `CAN` varchar(20) NOT NULL,
  `insert_oper` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `update_oper` varchar(15) NOT NULL,
  `update_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.parametros: ~1 rows (aproximadamente)
DELETE FROM `parametros`;
/*!40000 ALTER TABLE `parametros` DISABLE KEYS */;
INSERT INTO `parametros` (`validez_psw`, `dias_psw`, `max_lines_screen`, `max_lines_export`, `max_dif_min`, `max_attach`, `assign_ticket`, `from_user_request`, `from_user_psw`, `contact_default`, `process_default`, `state_default`, `state_alert`, `main_screen_state`, `date_format`, `PEN`, `PAS`, `CAN`, `insert_oper`, `insert_datetime`, `update_oper`, `update_datetime`) VALUES
	(60, 90, 40, 60000, 2000, 120000, 'S', 'mantenimiento@realsa.co', 'no-reply@realsa.co', 'Interno', 'Mto Correctivo', 'PROGRAMADO', '', '', 'DMA', 'Programado', 'En Proceso', 'Terminado', 'SETUP', '2014-12-09 10:56:44', 'aluna', '2018-01-15 11:21:24');
/*!40000 ALTER TABLE `parametros` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.planta
DROP TABLE IF EXISTS `planta`;
CREATE TABLE IF NOT EXISTS `planta` (
  `id_planta` mediumint(9) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `insert_oper` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `update_oper` varchar(15) NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`id_planta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla bd_smto.planta: ~2 rows (aproximadamente)
DELETE FROM `planta`;
/*!40000 ALTER TABLE `planta` DISABLE KEYS */;
INSERT INTO `planta` (`id_planta`, `nombre`, `descripcion`, `insert_oper`, `insert_datetime`, `update_oper`, `update_datetime`) VALUES
	(2, 'PLANTA DE SALES', 'PLANTA DE SALES', 'INSERT', '2018-02-21 21:27:29', '', '2018-02-21 21:27:31'),
	(3, 'PLANTA 4', 'PLANTA 4', 'INSERT', '2018-02-21 21:27:29', '', '2018-02-21 21:27:31');
/*!40000 ALTER TABLE `planta` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.planta_equipo_princ
DROP TABLE IF EXISTS `planta_equipo_princ`;
CREATE TABLE IF NOT EXISTS `planta_equipo_princ` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id_equipo_princ` mediumint(9) NOT NULL DEFAULT '0',
  `nombre_equipo_princ` varchar(50) DEFAULT '0',
  `id_planta` mediumint(9) NOT NULL DEFAULT '0',
  `nombre_planta` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.planta_equipo_princ: ~2 rows (aproximadamente)
DELETE FROM `planta_equipo_princ`;
/*!40000 ALTER TABLE `planta_equipo_princ` DISABLE KEYS */;
INSERT INTO `planta_equipo_princ` (`id`, `id_equipo_princ`, `nombre_equipo_princ`, `id_planta`, `nombre_planta`) VALUES
	(1, 1, 'REACTOR 23', 2, 'PLANTA 4'),
	(2, 2, 'CUARTO SD (1,2,4)', 2, 'PLANTA 4');
/*!40000 ALTER TABLE `planta_equipo_princ` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.sector
DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `sector_id` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `activo` enum('S','N') NOT NULL DEFAULT 'S',
  `insert_oper` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `update_oper` varchar(15) NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`sector_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.sector: ~10 rows (aproximadamente)
DELETE FROM `sector`;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` (`sector_id`, `nombre`, `activo`, `insert_oper`, `insert_datetime`, `update_oper`, `update_datetime`) VALUES
	('01', 'MANTENIMIENTO', 'S', 'SETUP', '2014-12-09 10:56:36', 'SETUP', '2014-12-09 10:56:36'),
	('02', 'ADMINISTRACION', 'S', 'aluna', '2018-01-15 07:58:26', 'aluna', '2018-01-15 07:58:26'),
	('03', 'CONTABILIDAD', 'S', 'aluna', '2018-01-15 07:59:45', 'aluna', '2018-01-15 07:59:45'),
	('04', 'COMERCIAL', 'S', 'aluna', '2018-01-15 07:59:59', 'aluna', '2018-01-15 07:59:59'),
	('05', 'RRHH - SST', 'S', 'aluna', '2018-01-15 08:00:51', 'aluna', '2018-01-15 08:00:51'),
	('06', 'PRODUCCION', 'S', 'aluna', '2018-01-15 08:01:04', 'aluna', '2018-01-15 08:01:04'),
	('07', 'CALIDAD - I + D', 'S', 'aluna', '2018-01-15 08:01:19', 'aluna', '2018-01-15 08:01:19'),
	('08', 'DESPACHOS', 'S', 'aluna', '2018-01-15 08:07:44', 'aluna', '2018-01-15 08:07:44'),
	('09', 'PLANTA 4', 'S', 'aluna', '2018-01-15 08:07:44', 'aluna', '2018-01-15 08:07:44'),
	('10', 'BOGOTA', 'S', 'aluna', '2018-01-15 08:07:44', 'aluna', '2018-01-15 08:07:44');
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.seleccion_componente
DROP TABLE IF EXISTS `seleccion_componente`;
CREATE TABLE IF NOT EXISTS `seleccion_componente` (
  `id_sel_componente` mediumint(9) NOT NULL AUTO_INCREMENT,
  `id_planta` mediumint(9) NOT NULL,
  `nombre_planta` varchar(50) DEFAULT NULL,
  `id_equipo_princ` mediumint(9) NOT NULL,
  `nombre_equipo_princ` varchar(50) DEFAULT NULL,
  `id_equipo_sec` mediumint(9) DEFAULT NULL,
  `nombre_equipo_sec` varchar(50) DEFAULT NULL,
  `id_componente` mediumint(9) DEFAULT NULL,
  `nombre_componente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_sel_componente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT COMMENT='Esta tabla guardará la relacion de tablas en la seleccion de componentes';

-- Volcando datos para la tabla bd_smto.seleccion_componente: ~0 rows (aproximadamente)
DELETE FROM `seleccion_componente`;
/*!40000 ALTER TABLE `seleccion_componente` DISABLE KEYS */;
/*!40000 ALTER TABLE `seleccion_componente` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.sigo_ticket
DROP TABLE IF EXISTS `sigo_ticket`;
CREATE TABLE IF NOT EXISTS `sigo_ticket` (
  `seq_sigo_ticket_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seq_ticket_id` mediumint(8) unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  `operador_id` varchar(15) DEFAULT NULL,
  `usuario_id` varchar(15) DEFAULT NULL,
  `campo_cambiado` varchar(30) DEFAULT NULL,
  `valor_anterior` varchar(60) DEFAULT NULL,
  `valor_actual` varchar(60) DEFAULT NULL,
  `comentario` text,
  `visible` enum('S','N') NOT NULL DEFAULT 'N',
  `adjunto` mediumblob,
  `tipo_adjunto` varchar(128) DEFAULT NULL,
  `nombre_adjunto` varchar(128) DEFAULT NULL,
  `insert_oper` varchar(15) DEFAULT NULL,
  `insert_user` varchar(15) DEFAULT NULL,
  `insert_datetime` datetime NOT NULL,
  PRIMARY KEY (`seq_sigo_ticket_id`),
  KEY `seq_ticket_id` (`seq_ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.sigo_ticket: ~31 rows (aproximadamente)
DELETE FROM `sigo_ticket`;
/*!40000 ALTER TABLE `sigo_ticket` DISABLE KEYS */;
INSERT INTO `sigo_ticket` (`seq_sigo_ticket_id`, `seq_ticket_id`, `fecha`, `operador_id`, `usuario_id`, `campo_cambiado`, `valor_anterior`, `valor_actual`, `comentario`, `visible`, `adjunto`, `tipo_adjunto`, `nombre_adjunto`, `insert_oper`, `insert_user`, `insert_datetime`) VALUES
	(1, 3, '2018-01-15 14:32:03', 'jmto', NULL, 'Asignado a', 'jmto', 'aperez', 'se programa a Alfredo perez para realizar labor el 21/01/2018', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 14:32:03'),
	(2, 3, '2018-01-15 14:32:03', 'jmto', NULL, 'Estado', 'PROGRAMADO', 'ASIGNADO', NULL, 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 14:32:03'),
	(3, 1, '2018-01-15 14:39:35', 'jmto', NULL, 'Prioridad', '2', '3', 'ya se pidio el repuesto para hacer el cambio de cerradura', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 14:39:35'),
	(4, 1, '2018-01-15 14:39:35', 'jmto', NULL, 'Asignado a', 'jmto', 'aperez', NULL, 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 14:39:35'),
	(5, 1, '2018-01-15 14:39:35', 'jmto', NULL, 'Estado', 'PROGRAMADO', 'ASIGNADO', NULL, 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 14:39:35'),
	(6, 2, '2018-01-15 14:41:45', 'jmto', NULL, 'Asignado a', 'jmto', 'pcasalins', 'se va a colocar unas puertas nuevas, ya se pidieron llegan aproximadamente el 30/01/2018', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 14:41:45'),
	(7, 2, '2018-01-15 14:43:13', 'jmto', NULL, 'Estado', 'PROGRAMADO', 'ASIGNADO', NULL, 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 14:43:13'),
	(8, 1, '2018-01-15 14:50:50', 'jmto', NULL, 'Estado', 'ASIGNADO', 'TERMINADO', 'se termino el trabajo antes de la fecha prevista, todo se realizo ok.', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 14:50:50'),
	(9, 1, '2018-01-15 14:51:19', 'jbarragan', NULL, 'Estado', 'TERMINADO', 'EN PROCESO', NULL, 'N', NULL, NULL, NULL, 'jbarragan', NULL, '2018-01-15 14:51:19'),
	(10, 1, '2018-01-15 14:53:35', 'jbarragan', NULL, 'Estado', 'EN PROCESO', 'TERMINADO', NULL, 'N', NULL, NULL, NULL, 'jbarragan', NULL, '2018-01-15 14:53:35'),
	(11, 1, '2018-01-15 14:53:46', 'jbarragan', NULL, 'Calificaci&oacute;n', 'SIN_CALIFICAR', 'BUENO_BPM', NULL, 'N', NULL, NULL, NULL, 'jbarragan', NULL, '2018-01-15 14:53:46'),
	(12, 2, '2018-01-15 15:06:23', 'jmto', NULL, 'Estado', 'ASIGNADO', 'EN PROCESO', 'se tiene el personal trabajando en el ticket', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 15:06:24'),
	(13, 3, '2018-01-15 15:06:46', 'jmto', NULL, 'Estado', 'ASIGNADO', 'EN PROCESO', 'se encuentra en ejecucion su solicitud', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 15:06:46'),
	(14, 2, '2018-01-15 15:07:10', 'jmto', NULL, 'Estado', 'EN PROCESO', 'TERMINADO', 'trabajo terminado, por favor verificar.', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 15:07:10'),
	(15, 3, '2018-01-15 15:07:26', 'jmto', NULL, 'Estado', 'EN PROCESO', 'TERMINADO', 'se instala la nueva puerta si novedad.', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 15:07:26'),
	(16, 4, '2018-01-15 16:09:18', 'jmto', NULL, 'Asignado a', 'jmto', 'aperez', 'se hizo el pedido del tubo llega en 30/01/2018', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 16:09:18'),
	(17, 4, '2018-01-15 16:09:18', 'jmto', NULL, 'Estado', 'PROGRAMADO', 'ASIGNADO', NULL, 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 16:09:18'),
	(18, 4, '2018-01-15 16:09:58', 'jmto', NULL, 'Estado', 'ASIGNADO', 'EN PROCESO', 'se esta ejecutanto la tarea.', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 16:09:58'),
	(19, 4, '2018-01-15 16:15:33', 'jmto', NULL, 'Estado', 'EN PROCESO', 'TERMINADO', 'se cambio el tubo sin inconvenientes.', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 16:15:34'),
	(20, 4, '2018-01-15 16:21:33', 'jbarragan', NULL, 'Calificaci&oacute;n', 'SIN_CALIFICAR', 'BUENO', NULL, 'N', NULL, NULL, NULL, 'jbarragan', NULL, '2018-01-15 16:21:33'),
	(21, 3, '2018-01-15 16:37:52', 'jmto', NULL, 'Prioridad', '1', '3', NULL, 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-15 16:37:52'),
	(22, 5, '2018-01-24 13:07:43', 'jmto', NULL, 'Estado', 'PROGRAMADO', 'TERMINADO', 'Trabajo realizado', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-24 13:07:43'),
	(23, 5, '2018-01-24 13:07:43', 'jmto', NULL, 'Calificaci&oacute;n', 'SIN_CALIFICAR', 'BUENO', NULL, 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-24 13:07:43'),
	(24, 6, '2018-01-24 13:17:32', 'jmto', NULL, 'Comentario', NULL, NULL, 'Se asignará el servicio al sr Pedro casalins fecha tentativa de atencion, 26/01/2018', 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-01-24 13:17:32'),
	(25, 6, '2018-01-24 13:30:13', 'afuentes', NULL, 'Estado', 'PROGRAMADO', 'TERMINADO', NULL, 'N', NULL, NULL, NULL, 'afuentes', NULL, '2018-01-24 13:30:13'),
	(26, 7, '2018-03-10 13:58:52', 'aluna', NULL, NULL, NULL, NULL, 'JXJTKYREK', '', NULL, NULL, NULL, 'aluna', NULL, '2018-03-10 13:58:52'),
	(27, 8, '2018-03-10 14:01:07', 'aluna', NULL, NULL, NULL, NULL, 'FDGFDGFDGFDGDFG', '', NULL, NULL, NULL, 'aluna', NULL, '2018-03-10 14:01:07'),
	(28, 9, '2018-03-10 17:04:42', 'aluna', NULL, NULL, NULL, NULL, 'dewd dcsdc', '', NULL, NULL, NULL, 'aluna', NULL, '2018-03-10 17:04:42'),
	(29, 10, '2018-03-10 17:07:01', 'aluna', NULL, NULL, NULL, NULL, 'dsadsadasd', '', NULL, NULL, NULL, 'aluna', NULL, '2018-03-10 17:07:01'),
	(30, 7, '2018-03-10 17:09:31', 'jmto', NULL, 'Estado', 'PROGRAMADO', 'TERMINADO', NULL, 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-03-10 17:09:31'),
	(31, 9, '2018-03-10 17:09:44', 'jmto', NULL, 'Estado', 'PROGRAMADO', 'TERMINADO', NULL, 'N', NULL, NULL, NULL, 'jmto', NULL, '2018-03-10 17:09:44');
/*!40000 ALTER TABLE `sigo_ticket` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.solicitud
DROP TABLE IF EXISTS `solicitud`;
CREATE TABLE IF NOT EXISTS `solicitud` (
  `seq_solicitud_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `usuario_id` varchar(15) NOT NULL,
  `ape_y_nom` varchar(50) NOT NULL,
  `area` varchar(15) NOT NULL,
  `piso` varchar(4) DEFAULT NULL,
  `e_mail` varchar(60) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `incidente` text NOT NULL,
  `estado` enum('PEN','CAN','PAS') NOT NULL DEFAULT 'PEN',
  `seq_ticket_id` mediumint(8) unsigned DEFAULT NULL,
  `insert_ip` varchar(15) NOT NULL,
  `adjunto` mediumblob,
  `tipo_adjunto` varchar(128) DEFAULT NULL,
  `nombre_adjunto` varchar(128) DEFAULT NULL,
  `insert_user` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `update_oper` varchar(15) DEFAULT NULL,
  `update_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`seq_solicitud_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.solicitud: ~0 rows (aproximadamente)
DELETE FROM `solicitud`;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.ticket
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE IF NOT EXISTS `ticket` (
  `seq_ticket_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `privado` enum('S','N') NOT NULL DEFAULT 'S',
  `operador_id` varchar(15) NOT NULL,
  `operador_sector_id` varchar(15) NOT NULL,
  `contacto` varchar(20) NOT NULL,
  `usuario_id` varchar(15) NOT NULL,
  `ape_y_nom` varchar(50) NOT NULL,
  `area_id` varchar(15) NOT NULL,
  `piso` varchar(4) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `e_mail` varchar(60) DEFAULT NULL,
  `asignado_a` varchar(15) DEFAULT NULL,
  `asignado_a_sector` varchar(15) DEFAULT NULL,
  `prioridad` tinyint(3) unsigned NOT NULL,
  `incidente` text NOT NULL,
  `proceso` varchar(20) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `sub_tipo` varchar(50) DEFAULT NULL,
  `id_planta` varchar(50) NOT NULL,
  `id_equipo_princ` varchar(50) NOT NULL,
  `id_equipo_sec` varchar(50) DEFAULT NULL,
  `id_componente` varchar(50) DEFAULT NULL,
  `estado` varchar(20) NOT NULL,
  `calificacion` varchar(50) DEFAULT NULL,
  `fecha_ultimo_estado` datetime NOT NULL,
  `operador_ultimo_estado` varchar(15) DEFAULT NULL,
  `adjunto` mediumblob,
  `tipo_adjunto` varchar(128) DEFAULT NULL,
  `nombre_adjunto` varchar(128) DEFAULT NULL,
  `insert_oper` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `update_oper` varchar(15) NOT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`seq_ticket_id`),
  KEY `estado` (`estado`),
  KEY `proceso` (`proceso`),
  KEY `fecha` (`fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.ticket: ~10 rows (aproximadamente)
DELETE FROM `ticket`;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` (`seq_ticket_id`, `fecha`, `privado`, `operador_id`, `operador_sector_id`, `contacto`, `usuario_id`, `ape_y_nom`, `area_id`, `piso`, `telefono`, `e_mail`, `asignado_a`, `asignado_a_sector`, `prioridad`, `incidente`, `proceso`, `tipo`, `sub_tipo`, `id_planta`, `id_equipo_princ`, `id_equipo_sec`, `id_componente`, `estado`, `calificacion`, `fecha_ultimo_estado`, `operador_ultimo_estado`, `adjunto`, `tipo_adjunto`, `nombre_adjunto`, `insert_oper`, `insert_datetime`, `update_oper`, `update_datetime`) VALUES
	(1, '2018-01-15 13:49:20', 'N', 'jbarragan', '02', 'Interno', 'jbarragan', 'BARRAGAN ECHEVERRIA JUAN CARLOS', '02', '02', 'Ext 204', 'administrativa@realsa.co', 'aperez', '01', 3, 'la puerta de la oficina administrativa no cierra', 'Mto Correctivo', 'OFICINA CARTAGENA', 'OFICINAS ADMINISTRATIVAS', '0', '0', NULL, NULL, 'TERMINADO', 'BUENO_BPM', '2018-01-15 14:53:34', 'jbarragan', NULL, NULL, NULL, 'jbarragan', '2018-01-15 13:53:45', 'jbarragan', '2018-01-15 14:53:46'),
	(2, '2018-01-15 13:54:14', 'N', 'aluna', '02', 'Interno', 'aluna', 'LUNA CASTILLO ANIBAL', '02', '02', '3172811574', 'sistemas.alc@realsa.co', 'pcasalins', '01', 3, 'las puertas del cuarto del servidor no cierran', 'Mto Correctivo', 'OFICINA CARTAGENA', 'OFICINAS ADMINISTRATIVAS', '0', '0', NULL, NULL, 'TERMINADO', 'SIN_CALIFICAR', '2018-01-15 15:07:09', 'jmto', NULL, NULL, NULL, 'aluna', '2018-01-15 13:55:06', 'jmto', '2018-01-15 15:07:10'),
	(3, '2018-01-15 13:56:40', 'N', 'afuentes', '05', 'Interno', 'afuentes', 'FUENTES JIMENEZ ANDREA', '05', '02', 'EXT 218', 'seguridadysalud@realsa.co', 'aperez', '01', 3, 'La planta de sales no tiene señaladas en paso peatonal', 'Mto Correctivo', 'PLANTA DE SALES', 'OTROS', '0', '0', NULL, NULL, 'TERMINADO', 'SIN_CALIFICAR', '2018-01-15 15:07:25', 'jmto', NULL, NULL, NULL, 'afuentes', '2018-01-15 13:57:29', 'jmto', '2018-01-15 16:37:52'),
	(4, '2018-01-15 15:59:54', 'N', 'jbarragan', '02', 'Interno', 'jbarragan', 'BARRAGAN ECHEVERRIA JUAN CARLOS', '02', '02', '204', 'administrativa@realsa.co', 'aperez', '01', 2, 'cambiar tubo de aire acondicionado oficina administrativa', 'Mto Correctivo', 'OFICINA CARTAGENA', 'AIRE JCB', '0', '0', NULL, NULL, 'TERMINADO', 'BUENO', '2018-01-15 16:15:24', 'jmto', NULL, NULL, NULL, 'jbarragan', '2018-01-15 16:08:19', 'jbarragan', '2018-01-15 16:21:33'),
	(5, '2018-01-24 13:03:20', 'N', 'jmto', '01', 'Interno', 'ebarrios', 'BARRIOS CARABALLOS EUSEBIO', '03', '02', 'EXT 209', 'auxcontabilidad@realsa.co', 'jmto', '01', 2, 'Trapero partido', 'Mto Correctivo', 'ZONA DE PONTENCIA', 'VARIOS - TK AGUA POTABLE', '0', '0', NULL, NULL, 'TERMINADO', 'BUENO', '2018-01-24 13:07:31', 'jmto', NULL, NULL, NULL, 'jmto', '2018-01-24 13:05:28', 'jmto', '2018-01-24 13:07:43'),
	(6, '2018-01-24 13:13:59', 'N', 'afuentes', '05', 'Interno', 'afuentes', 'FUENTES JIMENEZ ANDREA', '05', '02', 'EXT 218', 'seguridadysalud@realsa.co', 'jmto', '01', 2, 'Puerta del baño dañada', 'Mto Correctivo', 'PLANTA DE ENCAPSULADOS', 'CAMARA HORIZONTAL - TK MEZCLA 250 LTS', '0', '0', NULL, NULL, 'TERMINADO', 'SIN_CALIFICAR', '2018-01-24 13:30:12', 'afuentes', NULL, NULL, NULL, 'afuentes', '2018-01-24 13:14:50', 'afuentes', '2018-01-24 13:30:13'),
	(7, '2018-03-10 13:56:47', 'N', 'aluna', '02', 'Interno', 'jbarrajas', 'BARAJAS ROJAS JAIME', '04', '02', '310 4574782', 'directorcomercial@realsa.co', 'jmto', '01', 3, 'UTCDL', 'Mto Correctivo', '0', '0', 'PLANTA DE SALES', 'REACTOR 23', NULL, 'Colector de polvo', 'TERMINADO', 'SIN_CALIFICAR', '2018-03-10 17:09:28', 'jmto', NULL, NULL, NULL, 'aluna', '2018-03-10 13:58:52', 'jmto', '2018-03-10 17:09:31'),
	(8, '2018-03-10 13:58:55', 'N', 'aluna', '02', 'Interno', 'ebarrios', 'BARRIOS CARABALLOS EUSEBIO', '03', '02', 'EXT 209', 'auxcontabilidad@realsa.co', 'jmto', '01', 3, 'FGDFGFG', 'Mto Correctivo', '0', '0', 'PLANTA DE SALES', 'REACTOR 23', 'Colector', 'Colector de polvo', 'PROGRAMADO', 'SIN_CALIFICAR', '2018-03-10 13:58:55', 'aluna', NULL, NULL, NULL, 'aluna', '2018-03-10 14:01:07', 'aluna', '2018-03-10 14:01:07'),
	(9, '2018-03-10 17:04:23', 'N', 'aluna', '02', 'Interno', 'jbarrajas', 'BARAJAS ROJAS JAIME', '04', '02', '310 4574782', 'directorcomercial@realsa.co', 'jmto', '01', 3, 'sdfsfsdfsd', 'Mto Correctivo', '0', '0', 'PLANTA DE SALES', 'REACTOR 23', 'Colector', 'Colector de polvo', 'TERMINADO', 'SIN_CALIFICAR', '2018-03-10 17:09:43', 'jmto', NULL, NULL, NULL, 'aluna', '2018-03-10 17:04:42', 'jmto', '2018-03-10 17:09:44'),
	(10, '2018-03-10 17:06:37', 'N', 'aluna', '02', 'Interno', 'ebarrios', 'BARRIOS CARABALLOS EUSEBIO', '03', '02', 'EXT 209', 'auxcontabilidad@realsa.co', 'jmto', '01', 3, 'asdsadas', 'Mto Correctivo', '0', '0', 'PLANTA DE SALES', 'REACTOR 23', 'Bomba de Alimentacion', NULL, 'PROGRAMADO', 'SIN_CALIFICAR', '2018-03-10 17:06:37', 'aluna', NULL, NULL, NULL, 'aluna', '2018-03-10 17:07:01', 'aluna', '2018-03-10 17:07:01');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.usuario
DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `usuario_id` varchar(15) NOT NULL,
  `ape_y_nom` varchar(50) NOT NULL,
  `area_id` varchar(15) NOT NULL,
  `e_mail` varchar(60) DEFAULT NULL,
  `piso` varchar(4) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `activo` enum('S','N') NOT NULL DEFAULT 'S',
  `contrasenia` varchar(255) DEFAULT NULL,
  `cambia_clave` enum('S','N') NOT NULL DEFAULT 'S',
  `insert_oper` varchar(15) NOT NULL,
  `insert_datetime` datetime NOT NULL,
  `update_oper` varchar(15) DEFAULT NULL,
  `update_user` varchar(15) DEFAULT NULL,
  `update_datetime` datetime NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.usuario: ~32 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`usuario_id`, `ape_y_nom`, `area_id`, `e_mail`, `piso`, `telefono`, `activo`, `contrasenia`, `cambia_clave`, `insert_oper`, `insert_datetime`, `update_oper`, `update_user`, `update_datetime`) VALUES
	('afuentes', 'FUENTES JIMENEZ ANDREA', '05', 'seguridadysalud@realsa.co', '02', 'EXT 218', 'S', NULL, 'S', 'aluna', '2018-01-15 09:54:11', 'aluna', NULL, '2018-01-15 09:54:11'),
	('aluna', 'LUNA CASTILLO ANIBAL', '02', 'sistemas.alc@realsa.co', '02', '3172811574', 'S', NULL, 'S', 'esistemas', '2014-12-09 14:21:19', 'aluna', NULL, '2018-01-15 11:12:09'),
	('amillian', 'MILLIAN  ORITIZ ALVARO ANTONIO', '03', 'financiera@realsa.co', '02', '3168337743', 'S', NULL, 'S', 'esistemas', '2014-12-09 13:57:05', 'aluna', NULL, '2018-01-15 09:31:10'),
	('atorres', 'TORRES LARA ANGEL', '01', 'produccion1@realsa.co', '01', 'Ext 105', 'S', NULL, 'S', 'aluna', '2018-01-15 11:01:10', 'aluna', NULL, '2018-01-15 11:01:10'),
	('cacevedo', 'ACEVEDO BLANQUICET CESAR', '06', 'liderdeencapsulados@realsa.co', '01', 'Ext 106', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:29:21', 'aluna', NULL, '2018-01-15 09:31:18'),
	('ccentanaro', 'CENTANARO CHAVEZ CATHERINE', '06', 'amanufactura@realsa.co', '01', 'Ext 105', 'S', NULL, 'S', 'aluna', '2018-01-15 11:03:52', 'aluna', NULL, '2018-01-15 11:03:52'),
	('dvaliente', 'VALIENTE MERCADO DORIS', '03', 'cartera@realsa.co', '02', 'EXT 208', 'S', NULL, 'S', 'aluna', '2018-01-15 09:36:29', 'aluna', NULL, '2018-01-15 09:36:29'),
	('ebarrios', 'BARRIOS CARABALLOS EUSEBIO', '03', 'auxcontabilidad@realsa.co', '02', 'EXT 209', 'S', NULL, 'S', 'aluna', '2018-01-15 09:35:42', 'aluna', NULL, '2018-01-15 09:35:42'),
	('enegrette', 'NEGRETTE ROMERO ELI', '03', 'contabilidad@realsa.co', '02', 'EXT 211', 'S', NULL, 'S', 'aluna', '2018-01-15 09:37:03', 'aluna', NULL, '2018-01-15 09:37:03'),
	('jbarragan', 'BARRAGAN ECHEVERRIA JUAN CARLOS', '02', 'administrativa@realsa.co', '02', '204', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:08:50', 'aluna', NULL, '2018-01-15 09:30:24'),
	('jbarrajas', 'BARAJAS ROJAS JAIME', '04', 'directorcomercial@realsa.co', '02', '310 4574782', 'S', NULL, 'S', 'aluna', '2018-01-15 10:35:27', 'aluna', NULL, '2018-01-15 10:35:27'),
	('jcaro', 'CARO LLERENA JAVIER', '08', 'despachos@realsa.co', '02', 'Ext 109', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:13:10', 'aluna', NULL, '2018-01-15 09:31:36'),
	('jfigueroa', 'FIGUEROA DEVOZ JAIME', '08', 'liderdealmacen@realsa.co', '01', 'Ext 109', 'S', NULL, 'S', 'aluna', '2018-01-15 10:37:00', 'aluna', NULL, '2018-01-15 10:37:00'),
	('jmto', 'TORRES CANABAL MARLON', '01', 'mantenimiento@realsa.co', '01', 'Ext 107', 'S', NULL, 'S', 'aluna', '2018-01-15 10:58:45', 'aluna', NULL, '2018-01-15 10:58:45'),
	('jortega', 'ORTEGA BUITRAGO JOSE ALEX', '04', 'stc3@realsa.co', '02', 'EXT 214', 'S', NULL, 'S', 'aluna', '2018-01-15 09:49:20', 'aluna', NULL, '2018-01-15 09:50:48'),
	('jrumie', 'RUMIE DE CASTILLO JORGE ENRIQUE', '02', 'jer@realsa.co', '02', 'Ext 201', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:12:25', 'aluna', NULL, '2018-01-15 09:31:45'),
	('jyepes', 'YEPES RHENAL JESSI', '02', 'stc2@realsa.co', '02', 'EXT 212', 'S', NULL, 'S', 'aluna', '2018-01-15 09:45:56', 'aluna', NULL, '2018-01-15 09:45:56'),
	('karrieta', 'ARRIETA HERNANDEZ KAREN', '05', 'recepcion@realsa.co', '01', 'Ext 100', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:21:21', 'aluna', NULL, '2018-01-15 09:32:00'),
	('klopez', 'LOPEZ FLOREZ KETTY PATRICIA', '02', 'compras@realsa.co', '02', 'Ext 206', 'S', '59ce2066cacb4549aeb5dbd665cbfd24', 'S', 'esistemas', '2014-12-09 15:08:16', 'aluna', NULL, '2018-01-15 13:34:22'),
	('lcabarcas', 'CABARCAS CASTELLAR LIDIA DEL CARMEN', '02', 'inventarios@realsa.co', '02', 'Ext 207', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:07:39', 'aluna', NULL, '2018-01-15 09:33:40'),
	('ltous', 'TOUS SIERRA LILIANA', '04', 'astc@realsa.co', '02', 'Ext 215', 'S', NULL, 'S', 'aluna', '2018-01-15 09:50:08', 'aluna', NULL, '2018-01-15 09:50:08'),
	('mbasilio', 'BASILIO PATERNINA MARIA', '06', 'liderdesales@realsa.co', '01', 'Ext 106', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:28:28', 'aluna', NULL, '2018-01-15 09:33:47'),
	('mcardona', 'CARDONA ALVEAR MIGUEL', '06', 'liderdeemulsificantes@realsa.co', '01', 'Ext 106', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:30:26', 'aluna', NULL, '2018-01-15 09:34:12'),
	('mrodriguez', 'RODRIGUEZ VALENCIA MARIANA', '05', 'rhumanos@realsa.co', '02', 'Ext 217', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:15:52', 'aluna', NULL, '2018-01-15 09:34:19'),
	('pabad', 'ABAD DIAZ PAOLA', '04', 'sales@realsa.co', '02', 'EXT 212', 'S', NULL, 'S', 'aluna', '2018-01-15 09:44:55', 'aluna', NULL, '2018-01-15 09:44:55'),
	('pcasalins', 'CASALINS LOPEZ PEDRO', '01', 'amantenimiento@realsa.co', '01', 'Ext 107', 'S', NULL, 'S', 'aluna', '2018-01-15 10:59:40', 'aluna', NULL, '2018-01-15 10:59:40'),
	('porteria', 'CARMONA RODRIGUEZ RAFAEL GUSTAVO', '05', 'porteria@realsa.co', '01', 'Ext 110', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:24:28', 'aluna', NULL, '2018-01-15 09:34:27'),
	('rtatis', 'TATIS CASTRO ROY', '07', 'investigacionydesarrolo@realsa.co', '01', '104', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:25:53', 'aluna', NULL, '2018-01-15 09:34:34'),
	('vtaborda', 'TABORDA PUELLO VICTOR MANUEL', '07', 'calidad@realsa.co', '01', 'Ext 103', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:26:20', 'aluna', NULL, '2018-01-15 09:34:40'),
	('vuejbe', 'UEJBE AVENDAÑO VICTORIA', '07', 'analistadelaboratorio@realsa.co', '01', 'Ext 104', 'S', NULL, 'S', 'aluna', '2018-01-15 13:45:42', 'aluna', NULL, '2018-01-15 13:45:42'),
	('wjaramillo', 'JARAMILLO GUARDO WILDA', '07', 'controlcalidad@realsa.co', '01', 'Ext 102', 'S', NULL, 'S', 'esistemas', '2014-12-09 15:31:47', 'aluna', NULL, '2018-01-15 09:34:45'),
	('ymorales', 'MORALES PEREZ YOIS', '04', 'stc@realsa.co', '02', 'EXT 213', 'S', NULL, 'S', 'aluna', '2018-01-15 10:37:45', 'aluna', NULL, '2018-01-15 10:37:45');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla bd_smto.usuario_area_tmp
DROP TABLE IF EXISTS `usuario_area_tmp`;
CREATE TABLE IF NOT EXISTS `usuario_area_tmp` (
  `usuario_id` varchar(15) NOT NULL,
  `ape_y_nom` varchar(50) NOT NULL,
  `e_mail` varchar(60) DEFAULT NULL,
  `piso` varchar(4) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `area_id` varchar(15) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_smto.usuario_area_tmp: ~0 rows (aproximadamente)
DELETE FROM `usuario_area_tmp`;
/*!40000 ALTER TABLE `usuario_area_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_area_tmp` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
