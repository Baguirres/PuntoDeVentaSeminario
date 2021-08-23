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

-- --------------------------------------------------------

--
-- Table structure for table `bitacora`
--

CREATE TABLE `bitacora` (
  `idBitacora` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `accion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `idCateogira` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `Nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellido` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Telefono` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `NIT` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compradetalle`
--

CREATE TABLE `compradetalle` (
  `idProducto` int(11) NOT NULL,
  `idCompraEncabezado` int(11) NOT NULL,
  `cantidad` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `compraencabezado`
--

CREATE TABLE `compraencabezado` (
  `idCompraEncabezado` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `idProveedor` int(11) NOT NULL,
  `estado` tinytext COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `idDepartamento` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL,
  `Nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Apellido` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `FechaIngreso` date NOT NULL,
  `Correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresa` (
  `idEmpresa` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `nit` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `eslogan` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `mision` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `vision` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `valores` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `Empresacol` varchar(500) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faseseguimiento`
--

CREATE TABLE `faseseguimiento` (
  `idFaseSeguimiento` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idTienda` int(11) NOT NULL,
  `Cantidad` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `municipio`
--

CREATE TABLE `municipio` (
  `idMunicipio` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idDepartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `Precio` double NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `imagen` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promocion`
--

CREATE TABLE `promocion` (
  `idPromocion` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFinal` date NOT NULL,
  `idProducto` int(11) NOT NULL,
  `descuento` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `nit` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proveedorproducto`
--

CREATE TABLE `proveedorproducto` (
  `idProveedor` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seguimientoventa`
--

CREATE TABLE `seguimientoventa` (
  `idSeguimientoVenta` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `idFaseSeguimiento` int(11) NOT NULL,
  `idVentaEncabezado` int(11) NOT NULL,
  `comentarios` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tienda`
--

CREATE TABLE `tienda` (
  `idTienda` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idMunicipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipodepago`
--

CREATE TABLE `tipodepago` (
  `idTipoDePago` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipousuario`
--

CREATE TABLE `tipousuario` (
  `idTipoUsuario` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `usuario` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `contrasena` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `idTipoUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ventadetalle`
--

CREATE TABLE `ventadetalle` (
  `idVentaEncabezado` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `cantidad` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ventaencabezado`
--

CREATE TABLE `ventaencabezado` (
  `idVentaEncabezado` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` tinyint(4) NOT NULL,
  `idTipoDePago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`idBitacora`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCateogira`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `compradetalle`
--
ALTER TABLE `compradetalle`
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idCompraEncabezado` (`idCompraEncabezado`);

--
-- Indexes for table `compraencabezado`
--
ALTER TABLE `compraencabezado`
  ADD PRIMARY KEY (`idCompraEncabezado`),
  ADD KEY `idProveedor` (`idProveedor`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`idDepartamento`);

--
-- Indexes for table `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`idEmpresa`);

--
-- Indexes for table `faseseguimiento`
--
ALTER TABLE `faseseguimiento`
  ADD PRIMARY KEY (`idFaseSeguimiento`);

--
-- Indexes for table `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idTienda` (`idTienda`);

--
-- Indexes for table `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`idMunicipio`),
  ADD KEY `idDepartamento` (`idDepartamento`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indexes for table `promocion`
--
ALTER TABLE `promocion`
  ADD PRIMARY KEY (`idPromocion`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indexes for table `proveedorproducto`
--
ALTER TABLE `proveedorproducto`
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idProveedor` (`idProveedor`) USING BTREE;

--
-- Indexes for table `seguimientoventa`
--
ALTER TABLE `seguimientoventa`
  ADD PRIMARY KEY (`idSeguimientoVenta`);

--
-- Indexes for table `tienda`
--
ALTER TABLE `tienda`
  ADD PRIMARY KEY (`idTienda`);

--
-- Indexes for table `tipodepago`
--
ALTER TABLE `tipodepago`
  ADD PRIMARY KEY (`idTipoDePago`);

--
-- Indexes for table `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`idTipoUsuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idTipoUsuario` (`idTipoUsuario`);

--
-- Indexes for table `ventadetalle`
--
ALTER TABLE `ventadetalle`
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idVentaEncabezado` (`idVentaEncabezado`);

--
-- Indexes for table `ventaencabezado`
--
ALTER TABLE `ventaencabezado`
  ADD PRIMARY KEY (`idVentaEncabezado`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idTipoDePago` (`idTipoDePago`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `idBitacora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCateogira` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compraencabezado`
--
ALTER TABLE `compraencabezado`
  MODIFY `idCompraEncabezado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faseseguimiento`
--
ALTER TABLE `faseseguimiento`
  MODIFY `idFaseSeguimiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `municipio`
--
ALTER TABLE `municipio`
  MODIFY `idMunicipio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seguimientoventa`
--
ALTER TABLE `seguimientoventa`
  MODIFY `idSeguimientoVenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tienda`
--
ALTER TABLE `tienda`
  MODIFY `idTienda` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipodepago`
--
ALTER TABLE `tipodepago`
  MODIFY `idTipoDePago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `idTipoUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`idCateogira`) REFERENCES `producto` (`idProducto`) ON UPDATE CASCADE;

--
-- Constraints for table `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `ventaencabezado` (`idVentaEncabezado`) ON UPDATE CASCADE;

--
-- Constraints for table `compraencabezado`
--
ALTER TABLE `compraencabezado`
  ADD CONSTRAINT `compraencabezado_ibfk_1` FOREIGN KEY (`idCompraEncabezado`) REFERENCES `compradetalle` (`idCompraEncabezado`) ON UPDATE CASCADE;

--
-- Constraints for table `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`idDepartamento`) REFERENCES `municipio` (`idMunicipio`);

--
-- Constraints for table `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_ibfk_1` FOREIGN KEY (`idEmpresa`) REFERENCES `inventario` (`idInventario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `empresa_ibfk_2` FOREIGN KEY (`idEmpresa`) REFERENCES `tienda` (`idTienda`) ON UPDATE CASCADE;

--
-- Constraints for table `faseseguimiento`
--
ALTER TABLE `faseseguimiento`
  ADD CONSTRAINT `faseseguimiento_ibfk_1` FOREIGN KEY (`idFaseSeguimiento`) REFERENCES `seguimientoventa` (`idSeguimientoVenta`);

--
-- Constraints for table `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipio_ibfk_1` FOREIGN KEY (`idMunicipio`) REFERENCES `tienda` (`idTienda`) ON UPDATE CASCADE;

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `promocion` (`idPromocion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`idProducto`) REFERENCES `inventario` (`idInventario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_4` FOREIGN KEY (`idProducto`) REFERENCES `proveedorproducto` (`idProducto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_5` FOREIGN KEY (`idProducto`) REFERENCES `ventadetalle` (`idProducto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_6` FOREIGN KEY (`idProducto`) REFERENCES `compradetalle` (`idProducto`) ON UPDATE CASCADE;

--
-- Constraints for table `promocion`
--
ALTER TABLE `promocion`
  ADD CONSTRAINT `promocion_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON UPDATE CASCADE;

--
-- Constraints for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `compraencabezado` (`idCompraEncabezado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`idProveedor`) REFERENCES `proveedorproducto` (`idProveedor`);

--
-- Constraints for table `tipodepago`
--
ALTER TABLE `tipodepago`
  ADD CONSTRAINT `tipodepago_ibfk_1` FOREIGN KEY (`idTipoDePago`) REFERENCES `ventaencabezado` (`idVentaEncabezado`);

--
-- Constraints for table `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD CONSTRAINT `tipousuario_ibfk_1` FOREIGN KEY (`idTipoUsuario`) REFERENCES `usuario` (`idUsuario`) ON UPDATE CASCADE;

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `bitacora` (`idBitacora`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `empleado` (`idEmpleado`) ON UPDATE CASCADE;

--
-- Constraints for table `ventaencabezado`
--
ALTER TABLE `ventaencabezado`
  ADD CONSTRAINT `ventaencabezado_ibfk_1` FOREIGN KEY (`idVentaEncabezado`) REFERENCES `ventadetalle` (`idVentaEncabezado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ventaencabezado_ibfk_2` FOREIGN KEY (`idVentaEncabezado`) REFERENCES `seguimientoventa` (`idSeguimientoVenta`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
