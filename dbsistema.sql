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
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idCateogira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `categoria` VALUES
(1, 'Lacteos','Derivados de la leche'),
(2, 'Personales','Articulos personales'),
(3, 'Libreria','Articulos personales');
-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellido` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` int(11) NULL,
  `NIT` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `cliente` VALUES
(1, 'Bryan','Aguire','02/05/1998','bryanorlando@hotmail.com','12345678','Mi casa',1,'682479-6');

-- --------------------------------------------------------

--
-- Table structure for table `compradetalle`
--

CREATE TABLE `compradetalle` (
  `idProducto` int(11) NOT NULL,
  `idCompraEncabezado` int(11) NOT NULL,
  `cantidad` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idProducto`,`idCompraEncabezado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `compradetalle` VALUES
(1, 1,100);

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
  `estado` tinyint COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idCompraEncabezado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
INSERT INTO `compraencabezado` VALUES
(1, '02/05/1998',1,1500.50,1,1);
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
  `telefono` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` int(11) NULL,
  `estado` int(1) NOT NULL DEFAULT 1,
  
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `empleado` VALUES
(1, 'Carlos','Laib','10/01/1997','02/09/2020','claib@gmail.com','12345678','su casa',1,1),
(2, 'Bruno','Diaz','10/01/1997','02/09/2020','bdiazb@gmail.com','13485156','baticueva',NULL,1),
(3, 'John','Stewart','10/01/1997','02/09/2020','jtewart@gmail.com','14781','linterna',NULL,1),
(4, 'Clark','Dent','10/01/1997','02/09/2020','cdent@gmail.com','12345678','en la jefatura',NULL,1),
(5, 'Hal','Jordan','10/01/1997','02/09/2020','hjordan@gmail.com','12345678','lilnterna verde',2,1);

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `nit` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `eslogan` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `mision` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `vision` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `valores` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `empresa` VALUES
(1, 'Chocolates Milky','123456-6','eslogan','logo.jpg','mision','vision','valores');

-- --------------------------------------------------------

--
-- Table structure for table `faseseguimiento`
--

CREATE TABLE `faseseguimiento` (
  `idFaseSeguimiento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idFaseSeguimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `faseseguimiento` VALUES
(1, 'En proceso');

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

INSERT INTO `inventario` VALUES
(1, 1,100);

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

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Precio` double NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `imagen` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY(`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `producto` VALUES
(1, 'Chocolates hershey',1.50,1,'chocolate.jpg');
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
  PRIMARY KEY (`idPromocion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `promocion` VALUES
(1, '01/01/2005','02/01/2006',1,50);
-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `nit` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `proveedor` VALUES
(1, 'Coca cola','su empresa','12345678','01050-k','COCA@GMAIL.COM');
-- --------------------------------------------------------

--
-- Table structure for table `proveedorproducto`
--

CREATE TABLE `proveedorproducto` (
  `idProveedor` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  PRIMARY KEY(`idProveedor`,`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `proveedorproducto` VALUES
(1, 1);

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
  PRIMARY KEY(`idSeguimientoVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `seguimientoventa` VALUES
(1, '05/02/1998',1,1,'no hay com');

-- --------------------------------------------------------

--
-- Table structure for table `tienda`
--

CREATE TABLE `tienda` (
  `idTienda` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idMunicipio` int(11) NOT NULL,
  PRIMARY KEY(`idTienda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `tienda` VALUES
(1, 'de la capital','esta en la capital',1);
-- --------------------------------------------------------

--
-- Table structure for table `tipodepago`
--

CREATE TABLE `tipodepago` (
  `idTipoDePago` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY(`idTipoDePago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_documento` varchar(20) COLLATE utf8_spanish_ci  NULL,
  `num_documento` varchar(20) COLLATE utf8_spanish_ci  NULL,
  `direccion` varchar(70) COLLATE utf8_spanish_ci  NULL,
  `telefono` varchar(20) COLLATE utf8_spanish_ci  NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci  NULL,
  `cargo` varchar(20) COLLATE utf8_spanish_ci  NULL,
  `login` varchar(20) COLLATE utf8_spanish_ci  NULL,
  `clave` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY(`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `usuario` ( `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`, `cargo`, `login`, `clave`, `imagen`, `condicion`) VALUES
( 'Admin', 'DNI', '63238', 'Conocido', '27386126', 'admin@gmail.com', '', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1523752615.jpg', 1),
( 'Bryan', 'DNI', '132', 'Conocido', '27386126', 'admin@gmail.com', '', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1523752615.jpg', 1);
;

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
(88, 1, 7);
-- --------------------------------------------------------
--
-- Table structure for table `ventadetalle`
--

CREATE TABLE `ventadetalle` (
  `idVentaEncabezado` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY(`idVentaEncabezado`,`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `ventadetalle` VALUES
( 1,1,150);
-- --------------------------------------------------------

--
-- Table structure for table `ventaencabezado`
--

CREATE TABLE `ventaencabezado` (
  `idVentaEncabezado` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `total` float NOT NULL,
  `descuento` float NOT NULL,
  `iva` float NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `idTipoDePago` int(11) NOT NULL,
  PRIMARY KEY(`idVentaEncabezado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `ventaencabezado` VALUES
( 1,1,'02/05/1998',1000,10,1,1,1);

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
(6, 'Consultas Compras'),
(7, 'Consulta Ventas');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


