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
  `descripcion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `imagen` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idCateogira`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `categoria` VALUES
(1, 'Alimentos','Articulos de Sobrevivencia','',1),
(2, 'Ropa','Articulos personales','',1),
(3, 'Libreria','Articulos para estudio','',1);
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
  `Telefono` int(8) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `NIT` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
   `estado` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `cliente` VALUES
(1, 'Bryan','Aguire','02/05/1998','bryanorlando@hotmail.com','12345678','Mi casa','682479-6',1),
(2, 'Bryana','Aguire','02/05/1999','bryanaorlando@hotmail.com','12345679','Mi casa','682479-7',1);

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
(1, 'Quetzal','Q',1,1);

CREATE TABLE `compradetalle` (
  `idProducto` int(11) NOT NULL,
  `idCompraEncabezado` int(11) NOT NULL,
  `cantidad` int(5) COLLATE utf8_spanish2_ci NOT NULL,
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
  `idTienda` int(11) NOT NULL,
  `idTipoMoneda` int(2) NOT NULL,
  `impuesto` double NOT NULL,
  `estado` tinyint COLLATE utf8_spanish2_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (idCompraEncabezado)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
INSERT INTO compraencabezado VALUES
(1, '02/05/1998',1,1500.50,1,1,1,12,1);
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
(1, 'Carlos','Laib','10/01/1997','02/09/2020','claib@gmail.com','12345678','su casa',1),
(2, 'Bruno','Diaz','10/01/1997','02/09/2020','bdiazb@gmail.com','13485156','baticueva',1),
(3, 'John','Stewart','10/01/1997','02/09/2020','jtewart@gmail.com','14781','linterna',1),
(4, 'Clark','Dent','10/01/1997','02/09/2020','cdent@gmail.com','12345678','en la jefatura',1),
(5, 'Hal','Jordan','10/01/1997','02/09/2020','hjordan@gmail.com','12345678','lilnterna verde',1);

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
(1, 'Chocolates Milky','zona 10 Edificio Sky Resort','12345678','123456-6','milky@gmail.com','eslogan','logo.jpg','«El Grupo Adidas se esfuerza por ser el líder mundial en la industria de artículos deportivos con marcas basadas en la pasión por el deporte y el estilo de vida deportivo».','«Somos líderes en innovación y diseño que buscan ayudar a los atletas de todos los niveles de habilidad a lograr el máximo rendimiento con cada producto que traemos al mercado».','«Seguridad, colaboración y creatividad».');

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
(2, 'Completado','Pos completado');

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
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `proveedor` VALUES
(1, 'Coca cola','su empresa','12345678','01050-k','COCA@GMAIL.COM');



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
(1, 'Chocolates hershey','Es el alimento que se obtiene mezclando azúcar con dos productos que derivan de la manipulación de las semillas del cacao: la masa del cacao y la manteca de cacao.',1.50,1.50,1,'chocolate.jpeg',1,'',1),
(2, 'Camisa Manga Corta Roja','Prenda de vestir de tela que cubre el torso , abotonada por delante , generalmente con cuello y mangas',15,150,2,'camisa.jpg',1,'',1),
(3, 'Lapices Mongol Triangulares','Es un instrumento de escritura o dibujo que presenta una barra de grafito encerrada en un cilindro de madera u otro material.',20,25,1,'lapiz.jpg',1,'',1),
(4, 'Tenis Deportivo','Es una pieza de calzado que protege al pie, brindándole comodidad a la persona a la hora de llevar a cabo diferentes acciones',30,35,1,'tenis.jpg',1,'',1),
(5, 'Sandalia','Es un tipo de calzado, conocido desde la antigüedad, que consiste en una suela resistente atada al pie mediante cuerdas, cintas o bandas de material ligero, quedando los dedos y otras partes del pie al descubierto.',40,45,1,'chanclas.jpg',1,'',1),
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
(1, '01/01/2005','02/01/2006',1,50,1);
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
(1, 'tarjeta de credito','tarjetas de credito varias',1);

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
( 'Bryan', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '1523752615.jpg',2, 1);
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
(88, 1, 7),
(89, 1, 8),
(90, 1, 9);
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
( 1,1,150,3.5);
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
( 1,1,'02/05/1998',1000,10,1,1,1,1,1,1);

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
(7, 'Consulta Ventas'),
(8, 'Pagos'),
(9, 'Recursos Humanos');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


