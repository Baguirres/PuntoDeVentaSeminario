-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2021 at 09:07 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbpventa`
--
CREATE DATABASE IF NOT EXISTS `dbpventa`;
USE `dbpventa`;
-- --------------------------------------------------------

--
-- Table structure for table `bitacora`
--

CREATE TABLE `bitacora` (
  `idBitacora` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `accion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idBitacora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `idCateogira` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idCateogira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `categoria` VALUES
(1, 'Alimentos','Articulos de Sobrevivencia','comida.jpg',1),
(2, 'Prendas de Vestir','Articulos personales','ropa.jpg',1),
(3, 'Libreria','Articulos para estudio','libreria.jpg',1),
(4, 'Electrodomesticos','Cosas para el hogar','electro.jpg',1);
-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellido` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaNacimiento` date,
  `Correo` varchar(45) COLLATE utf8_spanish2_ci,
  `Telefono` int(8) COLLATE utf8_spanish2_ci,
  `Direccion` varchar(150) COLLATE utf8_spanish2_ci,
  `NIT` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
   `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `cliente` VALUES
(1, 'Bryan','Aguire','2021-10-07','bryanorlando-98@hotmail.com','12345678','Mi casa','6824796',1),
(2, 'Bryana','Aguire','2021-10-07','bryanorlando-98@hotmail.com','12345679','Mi casa','6824797',1),
(3, 'C/F','C/F','','','','','C/F',1);

-- --------------------------------------------------------

--
-- Table structure for table `compradetalle`
--
CREATE TABLE `tipoMoneda`(
	`idTipoMoneda` int(2) NOT NULL AUTO_INCREMENT,
    `moneda` varchar(45) NOT NULL,
    `simbolo` varchar(1) NOT NULL,
    `tipoCambio` double NOT NULL,
    `estado` tinyint(1) NOT NULL DEFAULT '1',
    PRIMARY KEY (`idTipoMoneda`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
INSERT INTO `tipoMoneda` VALUES
(1, 'Quetzal','Q',1,1),
(2, 'DÃ³lar','$',7.5,1);

CREATE TABLE `compradetalle` (
  `idProducto` int(11) NOT NULL,
  `idCompraEncabezado` int(11) NOT NULL,
  `cantidad` int(5) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idProducto`,`idCompraEncabezado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `compradetalle` VALUES
(9, 1, 4),
(9, 2, 5),
(2, 3, 3),
(3, 4, 10),
(8, 5, 2),
(10, 6, 5),
(4, 7, 1),
(7, 8, 9),
(6, 9, 5),
(1, 10, 2),
(8, 11, 4),
(1, 12, 2),
(8, 13, 8),
(5, 14, 7),
(2, 15, 9),
(5, 16, 7),
(2, 17, 4),
(9, 18, 8),
(9, 19, 6),
(4, 20, 1),
(8, 21, 1),
(4, 22, 8),
(3, 23, 3),
(2, 24, 3),
(7, 25, 4),
(2, 26, 3),
(8, 27, 5),
(5, 28, 6),
(9, 29, 6),
(3, 30, 1),
(2, 31, 3),
(5, 32, 10),
(2, 33, 3),
(3, 34, 2),
(3, 35, 1),
(1, 36, 8),
(5, 37, 8),
(7, 38, 2),
(10, 39, 1),
(3, 40, 3),
(7, 41, 2),
(3, 42, 2),
(9, 43, 4),
(1, 44, 7),
(8, 45, 3),
(10, 46, 8),
(9, 47, 7),
(3, 48, 2),
(9, 49, 10),
(1, 50, 9),
(7, 51, 5),
(8, 52, 9),
(2, 53, 2),
(3, 54, 7),
(8, 55, 10),
(2, 56, 3),
(10, 57, 9),
(10, 58, 7),
(4, 59, 10),
(3, 60, 9),
(5, 61, 8),
(10, 62, 2),
(2, 63, 9),
(8, 64, 10),
(7, 65, 7),
(10, 66, 7),
(4, 67, 4),
(3, 68, 9),
(4, 69, 7),
(8, 70, 3),
(3, 71, 2),
(8, 72, 10),
(3, 73, 7),
(5, 74, 10),
(5, 75, 6),
(9, 76, 8),
(4, 77, 6),
(9, 78, 2),
(6, 79, 5),
(3, 80, 5),
(10, 81, 7),
(8, 82, 10),
(1, 83, 9),
(1, 84, 8),
(5, 85, 5),
(9, 86, 2),
(3, 87, 9),
(10, 88, 2),
(6, 89, 3),
(7, 90, 5),
(8, 91, 1),
(8, 92, 2),
(1, 93, 10),
(5, 94, 8),
(7, 95, 2),
(8, 96, 10),
(5, 97, 7),
(3, 98, 7),
(3, 99, 5),
(6, 100, 9);

-- --------------------------------------------------------

--
-- Table structure for table `compraencabezado`
--

CREATE TABLE `compraencabezado` (
  `idCompraEncabezado` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `total` float NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idTienda` int(11) NOT NULL,
  `idTipoMoneda` int(2) NOT NULL,
  `impuesto` double NOT NULL,
  `estado` tinyint COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (idCompraEncabezado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
INSERT INTO compraencabezado VALUES
(1, '2021-04-02', 1, 1121.55, 1, 1, 1, 12, 1),
(2, '2020-11-10', 1, 1233.43, 1, 1, 1, 12, 1),
(3, '2021-04-03', 1, 1025.1, 1, 1, 1, 12, 1),
(4, '2021-11-01', 1, 1340.12, 1, 1, 1, 12, 1),
(5, '2021-02-03', 1, 1171.57, 1, 1, 1, 12, 1),
(6, '2021-06-30', 1, 1136.07, 1, 1, 1, 12, 1),
(7, '2020-12-31', 1, 1486.69, 1, 1, 1, 12, 1),
(8, '2021-11-02', 1, 1060.05, 1, 1, 1, 12, 1),
(9, '2020-10-18', 1, 1185.39, 1, 1, 1, 12, 1),
(10, '2021-02-04', 1, 1380.82, 1, 1, 1, 12, 1),
(11, '2021-04-10', 1, 1304.66, 1, 1, 1, 12, 1),
(12, '2021-08-05', 1, 1322.31, 1, 1, 1, 12, 1),
(13, '2021-08-05', 1, 1113.32, 1, 1, 1, 12, 1),
(14, '2021-01-19', 1, 1100.56, 1, 1, 1, 12, 1),
(15, '2020-12-17', 1, 1360.06, 1, 1, 1, 12, 1),
(16, '2021-06-14', 1, 1469.09, 1, 1, 1, 12, 1),
(17, '2021-08-09', 1, 1057.43, 1, 1, 1, 12, 1),
(18, '2021-04-17', 1, 1064.26, 1, 1, 1, 12, 1),
(19, '2021-02-16', 1, 1015.76, 1, 1, 1, 12, 1),
(20, '2021-05-16', 1, 1149.06, 1, 1, 1, 12, 1),
(21, '2021-07-21', 1, 1208.17, 1, 1, 1, 12, 1),
(22, '2021-08-21', 1, 1302.72, 1, 1, 1, 12, 1),
(23, '2020-10-14', 1, 1059.28, 1, 1, 1, 12, 1),
(24, '2021-04-04', 1, 1350.64, 1, 1, 1, 12, 1),
(25, '2020-12-20', 1, 1360.77, 1, 1, 1, 12, 1),
(26, '2021-03-11', 1, 1221.17, 1, 1, 1, 12, 1),
(27, '2021-02-28', 1, 1091.81, 1, 1, 1, 12, 1),
(28, '2021-03-12', 1, 1413.19, 1, 1, 1, 12, 1),
(29, '2020-11-21', 1, 1437.61, 1, 1, 1, 12, 1),
(30, '2021-09-04', 1, 1093.07, 1, 1, 1, 12, 1),
(31, '2021-01-11', 1, 1198.03, 1, 1, 1, 12, 1),
(32, '2021-03-06', 1, 1230.54, 1, 1, 1, 12, 1),
(33, '2021-02-05', 1, 1024.13, 1, 1, 1, 12, 1),
(34, '2021-06-05', 1, 1287.38, 1, 1, 1, 12, 1),
(35, '2021-08-07', 1, 1161.22, 1, 1, 1, 12, 1),
(36, '2021-01-29', 1, 1271.49, 1, 1, 1, 12, 1),
(37, '2020-11-16', 1, 1351.46, 1, 1, 1, 12, 1),
(38, '2021-08-24', 1, 1322.89, 1, 1, 1, 12, 1),
(39, '2021-08-24', 1, 1265.04, 1, 1, 1, 12, 1),
(40, '2021-10-02', 1, 1161.73, 1, 1, 1, 12, 1),
(41, '2021-05-29', 1, 1308.0, 1, 1, 1, 12, 1),
(42, '2021-09-05', 1, 1126.11, 1, 1, 1, 12, 1),
(43, '2021-09-06', 1, 1449.05, 1, 1, 1, 12, 1),
(44, '2021-05-22', 1, 1461.55, 1, 1, 1, 12, 1),
(45, '2021-06-23', 1, 1240.73, 1, 1, 1, 12, 1),
(46, '2021-01-31', 1, 1296.29, 1, 1, 1, 12, 1),
(47, '2021-01-22', 1, 1319.84, 1, 1, 1, 12, 1),
(48, '2021-11-01', 1, 1292.81, 1, 1, 1, 12, 1),
(49, '2021-07-16', 1, 1482.09, 1, 1, 1, 12, 1),
(50, '2020-12-05', 1, 1409.56, 1, 1, 1, 12, 1),
(51, '2021-08-24', 1, 1112.48, 1, 1, 1, 12, 1),
(52, '2020-10-25', 1, 1425.65, 1, 1, 1, 12, 1),
(53, '2021-01-20', 1, 1401.1, 1, 1, 1, 12, 1),
(54, '2021-08-17', 1, 1183.36, 1, 1, 1, 12, 1),
(55, '2021-03-27', 1, 1198.49, 1, 1, 1, 12, 1),
(56, '2020-12-24', 1, 1275.32, 1, 1, 1, 12, 1),
(57, '2020-12-08', 1, 1428.47, 1, 1, 1, 12, 1),
(58, '2021-03-14', 1, 1037.49, 1, 1, 1, 12, 1),
(59, '2021-01-04', 1, 1017.56, 1, 1, 1, 12, 1),
(60, '2021-08-01', 1, 1326.64, 1, 1, 1, 12, 1),
(61, '2021-03-19', 1, 1186.17, 1, 1, 1, 12, 1),
(62, '2020-11-30', 1, 1157.77, 1, 1, 1, 12, 1),
(63, '2020-11-07', 1, 1498.19, 1, 1, 1, 12, 1),
(64, '2021-04-27', 1, 1000.69, 1, 1, 1, 12, 1),
(65, '2021-08-26', 1, 1121.96, 1, 1, 1, 12, 1),
(66, '2021-10-01', 1, 1491.52, 1, 1, 1, 12, 1),
(67, '2021-02-14', 1, 1421.89, 1, 1, 1, 12, 1),
(68, '2020-12-14', 1, 1237.28, 1, 1, 1, 12, 1),
(69, '2021-09-07', 1, 1378.21, 1, 1, 1, 12, 1),
(70, '2021-04-28', 1, 1316.22, 1, 1, 1, 12, 1),
(71, '2021-07-01', 1, 1080.7, 1, 1, 1, 12, 1),
(72, '2021-02-14', 1, 1332.42, 1, 1, 1, 12, 1),
(73, '2020-12-06', 1, 1469.55, 1, 1, 1, 12, 1),
(74, '2020-11-29', 1, 1205.55, 1, 1, 1, 12, 1),
(75, '2021-03-01', 1, 1230.86, 1, 1, 1, 12, 1),
(76, '2021-03-02', 1, 1477.37, 1, 1, 1, 12, 1),
(77, '2020-11-25', 1, 1233.85, 1, 1, 1, 12, 1),
(78, '2021-01-20', 1, 1499.06, 1, 1, 1, 12, 1),
(79, '2021-08-19', 1, 1187.36, 1, 1, 1, 12, 1),
(80, '2021-08-18', 1, 1342.74, 1, 1, 1, 12, 1),
(81, '2021-06-15', 1, 1017.65, 1, 1, 1, 12, 1),
(82, '2021-09-15', 1, 1476.06, 1, 1, 1, 12, 1),
(83, '2020-11-21', 1, 1020.65, 1, 1, 1, 12, 1),
(84, '2020-10-11', 1, 1236.09, 1, 1, 1, 12, 1),
(85, '2021-03-29', 1, 1094.35, 1, 1, 1, 12, 1),
(86, '2021-08-07', 1, 1422.38, 1, 1, 1, 12, 1),
(87, '2021-06-24', 1, 1022.2, 1, 1, 1, 12, 1),
(88, '2021-03-09', 1, 1183.49, 1, 1, 1, 12, 1),
(89, '2021-09-24', 1, 1280.77, 1, 1, 1, 12, 1),
(90, '2021-06-12', 1, 1109.54, 1, 1, 1, 12, 1),
(91, '2021-06-28', 1, 1362.37, 1, 1, 1, 12, 1),
(92, '2021-09-09', 1, 1142.79, 1, 1, 1, 12, 1),
(93, '2021-07-09', 1, 1282.95, 1, 1, 1, 12, 1),
(94, '2021-07-10', 1, 1475.6, 1, 1, 1, 12, 1),
(95, '2020-12-19', 1, 1495.54, 1, 1, 1, 12, 1),
(96, '2021-09-17', 1, 1156.15, 1, 1, 1, 12, 1),
(97, '2021-07-19', 1, 1422.4, 1, 1, 1, 12, 1),
(98, '2020-12-28', 1, 1102.82, 1, 1, 1, 12, 1),
(99, '2020-10-11', 1, 1078.81, 1, 1, 1, 12, 1),
(100, '2021-03-18', 1, 1134.26, 1, 1, 1, 12, 1);
-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
INSERT INTO `departamento` VALUES
(1, 'Guatemala'),
(2, 'Huehue');
-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellido` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `FechaIngreso` date NOT NULL,
  `Correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` int(8) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int(1) NOT NULL DEFAULT 1,
  
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `empleado` VALUES
(1, 'Carlos','Laib','2021-10-07','2021-10-07','claib@gmail.com','12345678','su casa',1),
(2, 'Bruno','Diaz','2021-10-07','2021-10-07','bdiazb@gmail.com','13485156','baticueva',1),
(3, 'John','Stewart','2021-10-07','2021-10-07','jtewart@gmail.com','14781','linterna',1),
(4, 'Clark','Dent','2021-10-07','2021-10-07','cdent@gmail.com','12345678','en la jefatura',1),
(5, 'Hal','Jordan','2021-10-07','2021-10-07','hjordan@gmail.com','12345678','lilnterna verde',1);

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` int(8) COLLATE utf8_spanish2_ci NOT NULL,
  `nit` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `eslogan` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `mision` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `vision` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `valores` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `empresa` VALUES
(1, 'Chocolates Milky','zona 10 Edificio Sky Resort','12345678','123456-6','milky@gmail.com','eslogan','logo.png','Â«El Grupo Adidas se esfuerza por ser el lÃ­der mundial en la industria de artÃ­culos deportivos con marcas basadas en la pasiÃ³n por el deporte y el estilo de vida deportivoÂ».','Â«Somos lÃ­deres en innovaciÃ³n y diseÃ±o que buscan ayudar a los atletas de todos los niveles de habilidad a lograr el mÃ¡ximo rendimiento con cada producto que traemos al mercadoÂ».','Â«Seguridad, colaboraciÃ³n y creatividadÂ».');

-- --------------------------------------------------------

--
-- Table structure for table `faseseguimiento`
--

CREATE TABLE `faseseguimiento` (
  `idFaseSeguimiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idFaseSeguimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `faseseguimiento` VALUES
(1, 'En proceso','Pos en proceso'),
(2, 'Completado','Pos completado'),
(3, 'Devuelta','Pos Devuelta');

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

CREATE TABLE `inventario` (
  `idProducto` int(11) NOT NULL,
  `idTienda` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`,`idTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO inventario VALUES
(1, 1,100),
(1, 2,50),
(1, 3,50),
(2, 1,50),
(2, 2,50),
(3, 3,50),
(3, 1,50),
(4, 2,50),
(4, 3,50),
(5, 1,50),
(5, 2,50),
(6, 3,50),
(6, 1,50);

CREATE TABLE `minimos` (
  `idProducto` int(11) NOT NULL,
  `idTienda` int(11) NOT NULL,
  `CantidadMinima` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`,`idTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

CREATE TABLE `alertas` (
  `idAlerta` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` DATETIME NOT NULL,
  `Mensaje` varchar(250) NOT NULL,
  `estado` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idAlerta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

CREATE TABLE `inventarioEncabezado` (
  `idInvEnc` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`idInvEnc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `inventarioencabezado` (`idInvEnc`, `Fecha`) VALUES ('1', '2021-11-01');
INSERT INTO `inventarioencabezado` (`idInvEnc`, `Fecha`) VALUES ('2', '2021-11-02');

CREATE TABLE `inventarioDetalle` (
  `idInvEnc` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idTienda` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idInvEnc`,`idProducto`,`idTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
INSERT INTO `inventariodetalle` (`idInvEnc`, `idProducto`, `idTienda`, `Cantidad`) VALUES ('1', '1', '1', '100'), ('1', '2', '1', '109');
INSERT INTO `inventariodetalle` (`idInvEnc`, `idProducto`, `idTienda`, `Cantidad`) VALUES ('2', '1', '1', '110'), ('2', '2', '1', '105');
-- --------------------------------------------------------

--
-- Table structure for table `municipio`
--

CREATE TABLE `municipio` (
  `idMunicipio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idDepartamento` int(11) NOT NULL,
  PRIMARY KEY (`idMunicipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `municipio` VALUES
(1, 'San jose del golfo',1);
-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` int(8) COLLATE utf8_spanish2_ci NOT NULL,
  `nit` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `proveedor` VALUES
(1, 'Coca cola','su empresa','12345678','01050-k','COCA@GMAIL.COM',1);



CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(21000) NOT NULL,
  `Precio` double NOT NULL,
  `precioCompra` double NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `imagen` text(21000) COLLATE utf8_spanish2_ci NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `caracteristicas` text(21000) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY(`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `producto` VALUES
(1, 'Chocolates hershey','Es el alimento que se obtiene mezclando azÃºcar con dos productos que derivan de la manipulaciÃ³n de las semillas del cacao: la masa del cacao y la manteca de cacao.',1.50,1.50,1,'chocolate.jpeg',1,'',1),
(2, 'Camisa Manga Corta Roja','Prenda de vestir de tela que cubre el torso , abotonada por delante , generalmente con cuello y mangas',15,150,2,'camisa.jpg',1,'',1),
(3, 'Lapices Mongol Triangulares','Es un instrumento de escritura o dibujo que presenta una barra de grafito encerrada en un cilindro de madera u otro material.',20,25,1,'lapiz.jpg',1,'',1),
(4, 'Tenis Deportivo','Es una pieza de calzado que protege al pie, brindÃ¡ndole comodidad a la persona a la hora de llevar a cabo diferentes acciones',30,35,1,'tenis.jpg',1,'',1),
(5, 'Sandalia','Es un tipo de calzado, conocido desde la antigÃ¼edad, que consiste en una suela resistente atada al pie mediante cuerdas, cintas o bandas de material ligero, quedando los dedos y otras partes del pie al descubierto.',40,45,1,'chanclas.jpg',1,'',1),
(6, 'Pumpkin', ' ', 338.31, 952.8, 2, ' ', 1, ' ', 1),
(7, 'Water - Spring Water 500ml', ' ', 344.83, 671.89, 3, ' ', 1, ' ', 1),
(8, 'Squash - Sunburst', ' ', 549.97, 465.66, 3, ' ', 1, ' ', 1),
(9, 'Goat - Whole Cut', ' ', 215.95, 396.79, 3, ' ', 1, ' ', 1),
(10, 'Wine - Red, Cabernet Merlot', ' ', 253.55, 690.95, 2, ' ', 1, ' ', 1),
(11, 'Pork - Ground', ' ', 603.24, 598.97, 3, ' ', 1, ' ', 1),
(12, 'Venison - Striploin', ' ', 785.16, 75.42, 2, ' ', 1, ' ', 1),
(13, 'Garlic - Elephant', ' ', 957.67, 892.04, 2, ' ', 1, ' ', 1),
(14, 'Durian Fruit', ' ', 919.28, 835.81, 3, ' ', 1, ' ', 1),
(15, 'Chevril', ' ', 478.25, 89.4, 3, ' ', 1, ' ', 1),
(16, 'Leeks - Large', ' ', 531.67, 119.66, 3, ' ', 1, ' ', 1),
(17, 'Sambuca - Ramazzotti', ' ', 148.22, 103.56, 2, ' ', 1, ' ', 1),
(18, 'Lotus Leaves', ' ', 505.52, 346.66, 3, ' ', 1, ' ', 1),
(19, 'Soup Knorr Chili With Beans', ' ', 700.21, 327.32, 3, ' ', 1, ' ', 1),
(20, 'Pineapple - Canned, Rings', ' ', 534.85, 443.34, 2, ' ', 1, ' ', 1),
(21, 'Chicken - Whole Roasting', ' ', 379.7, 506.9, 2, ' ', 1, ' ', 1),
(22, 'Soup - Campbells, Classic Chix', ' ', 823.92, 484.71, 2, ' ', 1, ' ', 1),
(23, 'Asparagus - Green, Fresh', ' ', 885.71, 65.25, 2, ' ', 1, ' ', 1),
(24, 'Jolt Cola - Electric Blue', ' ', 609.39, 128.52, 1, ' ', 1, ' ', 1),
(25, 'Cream - 10%', ' ', 375.19, 956.92, 3, ' ', 1, ' ', 1),
(26, 'Club Soda - Schweppes, 355 Ml', ' ', 619.52, 858.37, 3, ' ', 1, ' ', 1),
(27, 'Artichoke - Bottom, Canned', ' ', 907.65, 730.84, 2, ' ', 1, ' ', 1),
(28, 'Tea Peppermint', ' ', 183.46, 959.06, 2, ' ', 1, ' ', 1),
(29, 'Tuna - Canned, Flaked, Light', ' ', 977.21, 524.38, 3, ' ', 1, ' ', 1),
(30, 'Chervil - Fresh', ' ', 331.57, 182.72, 3, ' ', 1, ' ', 1),
(31, 'Extract - Almond', ' ', 568.7, 933.67, 3, ' ', 1, ' ', 1),
(32, 'Beer - Upper Canada Lager', ' ', 821.21, 780.66, 3, ' ', 1, ' ', 1),
(33, 'Pepsi, 355 Ml', ' ', 885.73, 558.61, 1, ' ', 1, ' ', 1),
(34, 'Soup - Campbells Tomato Ravioli', ' ', 651.45, 60.57, 3, ' ', 1, ' ', 1),
(35, 'Wine - Sauvignon Blanc Oyster', ' ', 293.78, 79.45, 3, ' ', 1, ' ', 1),
(36, 'Glass - Juice Clear 5oz 55005', ' ', 968.68, 348.0, 3, ' ', 1, ' ', 1),
(37, 'Coconut Milk - Unsweetened', ' ', 75.43, 87.47, 1, ' ', 1, ' ', 1),
(38, 'Bar Mix - Pina Colada, 355 Ml', ' ', 281.2, 809.15, 1, ' ', 1, ' ', 1),
(39, 'Chicken - Diced, Cooked', ' ', 268.99, 991.32, 2, ' ', 1, ' ', 1),
(40, 'Sprite, Diet - 355ml', ' ', 206.68, 738.36, 3, ' ', 1, ' ', 1),
(41, 'Coffee - Frthy Coffee Crisp', ' ', 995.75, 424.48, 1, ' ', 1, ' ', 1),
(42, 'Tart - Pecan Butter Squares', ' ', 625.3, 273.11, 3, ' ', 1, ' ', 1),
(43, 'Wine - Chianti Classica Docg', ' ', 126.75, 161.56, 1, ' ', 1, ' ', 1),
(44, 'Mousse - Banana Chocolate', ' ', 757.71, 218.44, 3, ' ', 1, ' ', 1),
(45, 'Longan', ' ', 445.07, 564.46, 3, ' ', 1, ' ', 1),
(46, 'Shichimi Togarashi Peppeers', ' ', 638.14, 100.57, 3, ' ', 1, ' ', 1),
(47, 'Pork - Tenderloin, Fresh', ' ', 737.6, 149.47, 1, ' ', 1, ' ', 1),
(48, 'Bread - Onion Focaccia', ' ', 329.29, 822.33, 3, ' ', 1, ' ', 1),
(49, 'Cheese - Cambozola', ' ', 195.23, 661.12, 2, ' ', 1, ' ', 1),
(50, 'Walkers Special Old Whiskey', ' ', 927.52, 252.43, 3, ' ', 1, ' ', 1),
(51, 'Vol Au Vents', ' ', 756.38, 871.21, 1, ' ', 1, ' ', 1),
(52, 'Muffin Mix - Oatmeal', ' ', 592.72, 892.87, 3, ' ', 1, ' ', 1),
(53, 'Island Oasis - Mango Daiquiri', ' ', 146.67, 705.64, 2, ' ', 1, ' ', 1),
(54, 'Cardamon Seed / Pod', ' ', 389.74, 442.13, 2, ' ', 1, ' ', 1),
(55, 'Cake - Bande Of Fruit', ' ', 571.65, 782.03, 1, ' ', 1, ' ', 1),
(56, 'Cheese - Stilton', ' ', 888.15, 783.19, 2, ' ', 1, ' ', 1),
(57, 'Chips - Miss Vickies', ' ', 167.9, 812.45, 3, ' ', 1, ' ', 1),
(58, 'Buffalo - Striploin', ' ', 484.67, 832.7, 2, ' ', 1, ' ', 1),
(59, 'Lemonade - Kiwi, 591 Ml', ' ', 226.51, 623.46, 3, ' ', 1, ' ', 1),
(60, 'Myers Planters Punch', ' ', 965.68, 233.05, 3, ' ', 1, ' ', 1),
(61, 'Honey - Comb', ' ', 554.48, 576.3, 2, ' ', 1, ' ', 1),
(62, 'Aspic - Clear', ' ', 963.13, 809.52, 3, ' ', 1, ' ', 1),
(63, 'Russian Prince', ' ', 581.06, 103.05, 1, ' ', 1, ' ', 1),
(64, 'Lamb - Leg, Bone In', ' ', 766.88, 394.74, 2, ' ', 1, ' ', 1),
(65, 'Truffle Shells - Semi - Sweet', ' ', 994.24, 613.32, 3, ' ', 1, ' ', 1);

alter table producto add column `ganancia` double not null;
alter table producto add column `conf` int not null;
-- --------------------------------------------------------

--
-- Table structure for table `promocion`
--

CREATE TABLE `promocion` (
  `idPromocion` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `idProducto` int(11) NOT NULL,
  `descuento` double NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idPromocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `promocion` VALUES
(1, '2021-10-07','2021-10-07',1,50,1);
-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

-- --------------------------------------------------------

--
-- Table structure for table `proveedorproducto`
--

/*CREATE TABLE `proveedorproducto` (
  `idProveedor` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  PRIMARY KEY(`idProveedor`,`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `proveedorproducto` VALUES
(1, 1);*/

-- --------------------------------------------------------

--
-- Table structure for table `seguimientoventa`
--

CREATE TABLE `seguimientoventa` (
  `idSeguimientoVenta` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `idFaseSeguimiento` int(11) NOT NULL,
  `idVentaEncabezado` int(11) NOT NULL,
  `comentarios` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
`estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY(`idSeguimientoVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO seguimientoventa VALUES
(1,'2021-10-07 20:26:34',2,1,'no hay com',1),
(2,'2021-10-07 20:26:34',2,6,'no hay com',1),
(3,'2021-10-07 20:26:34',2,15,'no hay com',1),
(4,'2021-10-07 20:26:34',1,18,'no hay com',1),
(5,'2021-10-07 20:26:34',1,19,'no hay com',1);

-- --------------------------------------------------------

--
-- Table structure for table `tienda`
--

CREATE TABLE `tienda` (
  `idTienda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `idMunicipio` int(11) NOT NULL,
  `tipoTienda` tinyint(1) NOT NULL DEFAULT '1',
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY(`idTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `tienda` VALUES
(1, 'Capital','esta en la capital',1,1,1),
(2, 'Bodega Central','esta en la florida',1,0,1),
(3, 'Naranjo Mall','esta en la florida',1,1,1),
(4, 'Oakland Mall','esta en la florida',1,1,1),
(5, 'Cayala','esta en la florida',1,1,1);
-- --------------------------------------------------------

--
-- Table structure for table `tipodepago`
--

CREATE TABLE `tipodepago` (
  `idTipoDePago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY(`idTipoDePago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `tipodepago` VALUES
(1, 'Efectivo','Dinero en efectivo',1),
(2, 'tarjeta de credito','tarjetas de credito varias',1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY(`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `usuario` ( `nombre`, `clave`, `imagen`,`idEmpleado`,`condicion`) VALUES
( 'Admin',  '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1523752615.jpg',1, 1),
( 'Bryan',  '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1523752615.jpg',2, 1);
;

/*usuario cliente*/
CREATE TABLE `usuarioCliente` (
  `idUsuarioCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `clave` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `idCliente` int(11) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY(`idUsuarioCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `usuarioCliente` ( `nombre`, `clave`, `imagen`, `idCliente`, `condicion`) VALUES
( 'Admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1523752615.jpg',1, 1),
( 'Bryan', '12345', '1523752615.jpg',2, 1);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_permiso`
--

CREATE TABLE `usuario_permiso` (
  `idusuario_permiso` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) NOT NULL,
  `idpermiso` int(11) NOT NULL,
  PRIMARY KEY(`idusuario_permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario_permiso`
--

INSERT INTO `usuario_permiso` (`idusuario_permiso`, `idusuario`, `idpermiso`) VALUES
(82, 1, 1),
(83, 1, 2),
(84, 1, 3),
(85, 1, 4),
(86, 1, 5),
(87, 1, 6),
(88, 1, 7),
(89, 1, 8),
(90, 1, 9),
(91, 1, 10);
-- --------------------------------------------------------
--
-- Table structure for table `ventadetalle`
--

CREATE TABLE `ventadetalle` (
  `idVentaEncabezado` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` int(5) COLLATE utf8_spanish2_ci NOT NULL,
  `descuento` float NOT NULL,
  PRIMARY KEY(`idVentaEncabezado`,`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `ventadetalle` VALUES
(1, 2, 27, 1.58),
(2, 3, 60, 9.73),
(3, 6, 100, 3.92),
(4, 2, 32, 3.82),
(5, 4, 46, 6.11),
(6, 10, 84, 5.89),
(7, 5, 31, 3.93),
(8, 1, 29, 7.98),
(9, 10, 91, 8.91),
(10, 9, 26, 7.38),
(11, 7, 17, 7.46),
(12, 4, 93, 5.11),
(13, 6, 97, 8.58),
(14, 7, 73, 6.46),
(15, 9, 58, 5.27),
(16, 8, 92, 3.47),
(17, 10, 46, 1.85),
(18, 3, 68, 2.88),
(19, 4, 88, 7.54),
(20, 4, 38, 6.26),
(21, 6, 2, 6.17),
(22, 7, 39, 9.97),
(23, 8, 87, 6.39),
(24, 1, 31, 1.38),
(25, 4, 22, 1.26),
(26, 1, 41, 7.79),
(27, 6, 45, 2.12),
(28, 9, 45, 5.35),
(29, 8, 34, 9.04),
(30, 3, 37, 3.64),
(31, 10, 72, 5.9),
(32, 10, 43, 3.54),
(33, 2, 85, 7.85),
(34, 5, 5, 7.21),
(35, 7, 100, 5.51),
(36, 7, 78, 3.09),
(37, 10, 52, 9.84),
(38, 4, 30, 3.26),
(39, 3, 34, 2.42),
(40, 1, 58, 9.56),
(41, 7, 41, 6.23),
(42, 2, 61, 6.8),
(43, 3, 78, 3.13),
(44, 2, 62, 8.73),
(45, 6, 56, 2.64),
(46, 9, 3, 8.63),
(47, 1, 84, 3.86),
(48, 7, 64, 5.98),
(49, 5, 43, 5.81),
(50, 5, 99, 9.98),
(51, 7, 99, 1.24),
(52, 8, 94, 4.68),
(53, 2, 78, 4.62),
(54, 6, 78, 8.09),
(55, 6, 100, 7.02),
(56, 6, 76, 1.24),
(57, 2, 16, 7.37),
(58, 4, 73, 7.37),
(59, 9, 2, 1.08),
(60, 7, 27, 4.13),
(61, 5, 83, 6.01),
(62, 7, 59, 9.83),
(63, 7, 99, 4.35),
(64, 5, 48, 4.06),
(65, 4, 51, 2.09),
(66, 4, 87, 2.67),
(67, 10, 35, 8.09),
(68, 10, 33, 5.56),
(69, 10, 58, 2.68),
(70, 1, 83, 6.04),
(71, 6, 69, 8.23),
(72, 9, 45, 8.98),
(73, 4, 2, 7.68),
(74, 10, 100, 8.01),
(75, 4, 98, 5.38),
(76, 5, 2, 4.11),
(77, 9, 47, 6.4),
(78, 4, 7, 8.67),
(79, 4, 4, 4.95),
(80, 10, 1, 3.74),
(81, 5, 2, 6.15),
(82, 6, 16, 9.74),
(83, 6, 49, 6.9),
(84, 1, 45, 8.29),
(85, 9, 10, 1.5),
(86, 5, 53, 8.13),
(87, 7, 19, 4.48),
(88, 7, 19, 2.67),
(89, 10, 32, 2.36),
(90, 7, 34, 9.19),
(91, 4, 4, 2.02),
(92, 4, 74, 2.43),
(93, 2, 96, 3.78),
(94, 8, 94, 2.31),
(95, 10, 64, 6.18),
(96, 3, 18, 7.23),
(97, 6, 15, 8.44),
(98, 6, 100, 5.77),
(99, 7, 61, 4.37),
(100, 1, 90, 6.32);

-- --------------------------------------------------------

--
-- Table structure for table `ventaencabezado`
--

CREATE TABLE `ventaencabezado` (
  `idVentaEncabezado` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `total` float NOT NULL,
  `descuento` float NOT NULL,
  `iva` float NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `idUsuario` int(11) NOT NULL,
  `idTienda` int(11) NOT NULL,
  `idTipoDePago` int(11) NOT NULL,
  `idTipoMoneda` int(2) NOT NULL,
  PRIMARY KEY(`idVentaEncabezado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `ventaencabezado` VALUES 
(1, 2, '2021-02-24', 1331.66, 32.52, 55.63, 1, 1, 5, 1, 1),
(2, 1, '2021-11-26', 1614.27, 61.27, 44.38, 1, 2, 4, 1, 1),
(3, 3, '2021-12-19', 1612.17, 31.62, 42.16, 1, 2, 3, 1, 1),
(4, 3, '2021-08-20', 1593.64, 54.88, 52.32, 0, 1, 5, 1, 1),
(5, 1, '2021-03-29', 1290.71, 97.53, 87.26, 1, 1, 4, 1, 1),
(6, 2, '2021-09-04', 1377.81, 52.49, 61.09, 0, 1, 4, 1, 1),
(7, 1, '2021-09-14', 1564.16, 65.95, 84.12, 0, 2, 3, 1, 1),
(8, 3, '2021-11-25', 1224.97, 37.16, 96.94, 1, 1, 4, 1, 1),
(9, 1, '2021-07-20', 1573.75, 11.02, 13.37, 0, 1, 3, 1, 1),
(10, 1, '2021-11-02', 1437.87, 94.05, 40.55, 0, 1, 1, 1, 1),
(11, 1, '2021-10-03', 1396.73, 89.21, 35.99, 0, 1, 4, 1, 1),
(12, 3, '2021-08-20', 1652.15, 79.88, 74.57, 0, 2, 5, 1, 1),
(13, 3, '2021-05-06', 1335.8, 87.84, 81.5, 1, 2, 5, 1, 1),
(14, 1, '2021-06-13', 1214.66, 97.26, 68.95, 0, 2, 5, 1, 1),
(15, 2, '2021-09-28', 1569.94, 38.8, 63.77, 1, 2, 3, 1, 1),
(16, 3, '2021-06-06', 1253.08, 55.42, 82.02, 0, 1, 4, 1, 1),
(17, 1, '2021-06-05', 1055.29, 67.06, 62.46, 0, 1, 3, 1, 1),
(18, 2, '2021-03-21', 1435.97, 96.18, 72.62, 1, 2, 4, 1, 1),
(19, 2, '2021-10-10', 1242.99, 45.62, 95.24, 1, 1, 5, 1, 1),
(20, 2, '2021-04-29', 1310.62, 90.54, 56.04, 0, 2, 5, 1, 1),
(21, 1, '2021-05-28', 1578.76, 10.24, 26.31, 1, 2, 5, 1, 1),
(22, 1, '2021-10-13', 1099.18, 33.91, 33.96, 1, 2, 5, 1, 1),
(23, 1, '2021-01-17', 1289.55, 66.05, 65.78, 0, 2, 5, 1, 1),
(24, 3, '2021-09-06', 1342.8, 69.15, 77.49, 1, 1, 5, 1, 1),
(25, 3, '2021-08-03', 1505.04, 59.75, 96.29, 1, 2, 5, 1, 1),
(26, 2, '2021-08-17', 1157.41, 26.26, 93.5, 0, 1, 3, 1, 1),
(27, 1, '2021-05-14', 1398.07, 61.55, 78.41, 0, 2, 4, 1, 1),
(28, 1, '2021-02-21', 1024.31, 80.2, 77.96, 0, 1, 3, 1, 1),
(29, 3, '2021-05-24', 1352.21, 62.54, 65.26, 1, 1, 4, 1, 1),
(30, 2, '2021-04-22', 1312.26, 99.11, 80.54, 1, 1, 5, 1, 1),
(31, 1, '2021-01-15', 1563.25, 48.66, 24.05, 1, 2, 3, 1, 1),
(32, 2, '2021-01-22', 1347.61, 34.08, 94.1, 1, 1, 5, 1, 1),
(33, 1, '2021-12-21', 1369.97, 12.53, 89.05, 1, 2, 4, 1, 1),
(34, 3, '2021-12-30', 1583.29, 31.85, 53.46, 0, 2, 3, 1, 1),
(35, 3, '2021-02-27', 1649.39, 54.93, 86.77, 1, 1, 3, 1, 1),
(36, 3, '2021-12-12', 1455.59, 87.44, 38.37, 1, 2, 4, 1, 1),
(37, 1, '2021-02-17', 1109.15, 27.68, 93.89, 1, 2, 3, 1, 1),
(38, 3, '2021-07-23', 1569.24, 79.78, 78.03, 1, 2, 4, 1, 1),
(39, 3, '2021-05-24', 1433.6, 82.76, 42.14, 1, 1, 5, 1, 1),
(40, 1, '2021-06-30', 1259.01, 17.97, 44.42, 0, 2, 3, 1, 1),
(41, 2, '2021-10-21', 1009.85, 41.26, 16.23, 0, 1, 4, 1, 1),
(42, 2, '2021-06-24', 1329.85, 17.08, 86.15, 1, 2, 4, 1, 1),
(43, 1, '2021-05-22', 1320.76, 31.59, 53.68, 1, 1, 4, 1, 1),
(44, 3, '2021-07-03', 1306.39, 64.95, 44.19, 1, 2, 3, 1, 1),
(45, 1, '2021-10-17', 1587.63, 47.71, 41.45, 1, 2, 5, 1, 1),
(46, 1, '2021-02-23', 1397.92, 90.09, 29.89, 1, 2, 5, 1, 1),
(47, 1, '2021-08-09', 1348.84, 25.85, 86.94, 1, 2, 3, 1, 1),
(48, 1, '2021-11-01', 1083.47, 69.16, 48.35, 1, 2, 1, 1, 1),
(49, 3, '2021-01-31', 1153.11, 11.93, 22.74, 1, 1, 4, 1, 1),
(50, 3, '2021-05-19', 1654.22, 59.97, 49.79, 0, 1, 4, 1, 1),
(51, 3, '2021-04-22', 1246.87, 85.49, 57.75, 0, 1, 5, 1, 1),
(52, 1, '2021-09-29', 1469.25, 38.3, 33.67, 0, 1, 3, 1, 1),
(53, 2, '2021-12-06', 1245.38, 64.17, 32.8, 0, 2, 3, 1, 1),
(54, 1, '2021-12-05', 1468.23, 66.6, 74.59, 1, 1, 3, 1, 1),
(55, 1, '2021-03-08', 1387.91, 42.02, 22.3, 1, 1, 3, 1, 1),
(56, 2, '2021-01-21', 1341.82, 34.2, 42.64, 1, 1, 5, 1, 1),
(57, 3, '2021-06-06', 1296.68, 90.22, 55.84, 1, 2, 5, 1, 1),
(58, 3, '2021-06-12', 1657.87, 52.77, 73.3, 0, 2, 4, 1, 1),
(59, 1, '2021-07-16', 1624.11, 21.78, 93.92, 1, 2, 5, 1, 1),
(60, 2, '2021-05-18', 1441.88, 19.14, 55.28, 1, 2, 3, 1, 1),
(61, 1, '2021-10-27', 1634.75, 35.64, 71.56, 1, 1, 3, 1, 1),
(62, 3, '2021-04-26', 1249.48, 72.01, 29.56, 1, 1, 5, 1, 1),
(63, 3, '2021-12-08', 1222.31, 21.29, 78.35, 0, 1, 3, 1, 1),
(64, 2, '2021-11-13', 1121.55, 29.01, 53.1, 0, 2, 4, 1, 1),
(65, 3, '2021-06-18', 1578.29, 85.56, 46.06, 1, 1, 3, 1, 1),
(66, 3, '2021-11-16', 1589.81, 34.14, 56.72, 0, 2, 3, 1, 1),
(67, 1, '2021-08-10', 1134.16, 76.05, 40.72, 0, 1, 5, 1, 1),
(68, 2, '2021-01-12', 1636.06, 64.54, 41.99, 0, 1, 4, 1, 1),
(69, 3, '2021-04-04', 1034.37, 85.89, 29.45, 0, 1, 3, 1, 1),
(70, 3, '2021-11-05', 1017.54, 37.67, 43.14, 0, 2, 4, 1, 1),
(71, 1, '2021-09-01', 1042.9, 70.61, 90.9, 1, 1, 4, 1, 1),
(72, 3, '2021-10-20', 1433.84, 10.01, 97.4, 0, 1, 3, 1, 1),
(73, 1, '2021-09-01', 1640.49, 13.67, 59.38, 1, 2, 3, 1, 1),
(74, 2, '2021-03-20', 1292.08, 53.28, 22.5, 0, 2, 3, 1, 1),
(75, 3, '2021-02-21', 1049.68, 56.53, 11.35, 1, 2, 5, 1, 1),
(76, 1, '2021-12-28', 1010.87, 30.54, 75.63, 0, 2, 3, 1, 1),
(77, 3, '2021-09-26', 1344.7, 91.14, 32.2, 1, 2, 5, 1, 1),
(78, 2, '2021-06-19', 1304.27, 97.85, 52.75, 1, 1, 3, 1, 1),
(79, 1, '2021-03-11', 1587.94, 79.12, 37.37, 1, 2, 5, 1, 1),
(80, 1, '2021-12-14', 1639.3, 23.28, 57.49, 1, 2, 3, 1, 1),
(81, 2, '2021-03-10', 1408.01, 46.89, 83.75, 0, 2, 4, 1, 1),
(82, 3, '2021-06-22', 1024.04, 60.87, 46.79, 1, 2, 3, 1, 1),
(83, 2, '2021-11-30', 1645.87, 11.31, 22.92, 0, 1, 3, 1, 1),
(84, 2, '2021-03-04', 1588.98, 15.56, 14.5, 0, 1, 4, 1, 1),
(85, 2, '2021-01-28', 1480.78, 56.87, 67.69, 1, 1, 4, 1, 1),
(86, 3, '2021-06-20', 1135.15, 21.33, 13.62, 1, 1, 3, 1, 1),
(87, 1, '2021-12-26', 1035.98, 50.57, 65.36, 0, 1, 3, 1, 1),
(88, 2, '2021-07-17', 1022.84, 75.31, 75.23, 0, 1, 3, 1, 1),
(89, 1, '2021-08-05', 1494.26, 76.93, 27.26, 0, 2, 5, 1, 1),
(90, 1, '2021-08-25', 1244.5, 12.45, 16.02, 0, 1, 4, 1, 1),
(91, 2, '2021-10-12', 1525.04, 29.04, 17.11, 0, 1, 5, 1, 1),
(92, 3, '2021-04-30', 1281.58, 98.11, 72.31, 0, 1, 5, 1, 1),
(93, 3, '2021-07-17', 1045.84, 81.23, 42.41, 1, 1, 3, 1, 1),
(94, 1, '2021-08-05', 1576.22, 93.45, 43.96, 0, 1, 5, 1, 1),
(95, 2, '2021-12-08', 1574.12, 94.68, 48.72, 1, 2, 3, 1, 1),
(96, 3, '2021-02-13', 1698.77, 81.3, 27.82, 0, 2, 3, 1, 1),
(97, 1, '2021-06-02', 1558.21, 94.88, 75.64, 0, 1, 4, 1, 1),
(98, 2, '2021-10-22', 1162.63, 99.26, 77.49, 1, 2, 3, 1, 1),
(99, 2, '2021-11-27', 1069.5, 99.97, 98.89, 1, 1, 4, 1, 1),
(100, 2, '2021-06-08', 1677.88, 65.0, 89.93, 0, 2, 5, 1, 1);

CREATE TABLE `permiso` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY(`idpermiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `nombre`) VALUES
(1, 'Escritorio'),
(2, 'Almacen'),
(3, 'Compras'),
(4, 'Ventas'),
(5, 'Acceso'),
(6, 'Reportes'),
(7, 'Graficas'),
(8, 'Pagos'),
(9, 'Recursos Humanos'),
(10, 'Configuracion');


CREATE TABLE `devolucion` (
  `idDevolucion` int(11) NOT NULL AUTO_INCREMENT,
  `idVentaEncabezado` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `comentario` varchar(1000) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY(`idDevolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

CREATE TABLE `caracteristica` (
  `idCaracteristica` int(11) NOT NULL AUTO_INCREMENT,
  `caracteristica` varchar(50) NOT NULL,
  `desplegable` tinyint(1) NOT NULL DEFAULT '0',
  `opciones` varchar(1000),
  PRIMARY KEY(`idCaracteristica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `caracteristica` (`idCaracteristica`, `caracteristica`,`desplegable`, `opciones`) VALUES
(1, 'Talla',1,'XS, S, M, L'),
(2, 'Color',0,NULL),
(3, 'Contenido del paquete',0,NULL);

CREATE TABLE `caracteristicasCategoria` (
  `idCategoria` int(11) NOT NULL,
  `idCaracteristica` int(11) NOT NULL,
  PRIMARY KEY(`idCategoria`,`idCaracteristica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `caracteristicasCategoria` (`idCategoria`, `idCaracteristica`) VALUES
(2, 2),
(2, 1),
(3, 3);
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
