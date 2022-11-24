-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `caja` (
  `idCaja` int unsigned NOT NULL AUTO_INCREMENT,
  `idUsuarioEmp` int unsigned NOT NULL,
  `fechaApertura` datetime NOT NULL,
  `montoApertura` decimal(20,2) NOT NULL,
  `ventasTotales` decimal(20,2) DEFAULT '0.00',
  `montoCierre` decimal(20,2) DEFAULT '0.00',
  `idEmpleadoReceptor` int unsigned DEFAULT NULL,
  `fechaCierre` datetime DEFAULT NULL,
  PRIMARY KEY (`idCaja`),
  KEY `fk_caja_usuarios1_idx` (`idEmpleadoReceptor`),
  KEY `fk_caja_usuarios2_idx` (`idUsuarioEmp`),
  CONSTRAINT `fk_caja_usuarios1` FOREIGN KEY (`idEmpleadoReceptor`) REFERENCES `usuarios` (`idUsuario`),
  CONSTRAINT `fk_caja_usuarios2` FOREIGN KEY (`idUsuarioEmp`) REFERENCES `usuarios` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caja`
--

LOCK TABLES `caja` WRITE;
/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` VALUES (3,2,'2022-11-20 01:29:16',1.00,1.00,75.00,1,'2022-11-20 01:47:17'),(4,2,'2022-11-20 01:47:38',6.00,1.00,1204.00,3,'2022-11-20 01:48:08'),(5,2,'2022-11-20 01:53:23',5.00,1.00,1601.00,1,'2022-11-20 01:53:50'),(6,2,'2022-11-20 08:58:25',55.00,0.00,55.00,1,'2022-11-20 08:59:22'),(7,2,'2022-11-21 09:24:19',25.00,1.00,624.00,1,'2022-11-21 09:24:55'),(8,2,'2022-11-21 09:25:38',12.00,2.00,833.00,1,'2022-11-21 09:27:38'),(9,2,'2022-11-21 09:27:39',12.00,2.00,1432.00,1,'2022-11-21 09:29:04'),(10,2,'2022-11-21 09:29:05',12.00,0.00,12.00,1,'2022-11-21 16:12:12'),(11,2,'2022-11-21 16:12:21',12.00,0.00,12.00,1,'2022-11-21 16:26:10');
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idCategoria` int unsigned NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Electrodomesticos',1),(2,'Calzado',1),(3,'Ropa',1),(4,'Muebles',1),(5,'belleza',1),(6,'joyas',1),(7,'Electronica',1);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `NIT` varchar(45) DEFAULT NULL,
  `DUI` varchar(45) DEFAULT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'jova','morales','Esperanza','8374627','2883773','83847483',1),(2,'Erika','Zometa','Sanjulian','8283894','9284804','88383849',1),(3,'Elia','Morales','Esperanza','8373892','9837282','83737829',1),(4,'Gilberto','Cienfuegos','Sonsonate','8373628','9327892','93938370',1),(5,'Eli','Casasola','Armenia','6378829','9378993','83736829',1),(6,'Janeth','Cienfuegos','Esperanza','8726482','3928373','83836728',1),(7,'Jeronimo','Vendeta','Colonia14','8636627','8373638','83837399',1),(8,'Carlos','Zomer','Sonsonate','7266282','2837378','82737890',1),(9,'Juana','Vinella','Ponderosa','8283739','9283749','83837792',1),(10,'Marthe','Vigel','Esperanza','8378748','7374638','73738299',1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comprobantes`
--

DROP TABLE IF EXISTS `comprobantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comprobantes` (
  `idComprobante` int NOT NULL,
  `tipoComprobante` enum('Factura','CCF','Ticket') NOT NULL,
  `NoComprobante` varchar(25) NOT NULL,
  `NoSerie` varchar(25) NOT NULL,
  PRIMARY KEY (`idComprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comprobantes`
--

LOCK TABLES `comprobantes` WRITE;
/*!40000 ALTER TABLE `comprobantes` DISABLE KEYS */;
INSERT INTO `comprobantes` VALUES (1,'Factura','1227','00001'),(2,'','1228','00002');
/*!40000 ALTER TABLE `comprobantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_ventas`
--

DROP TABLE IF EXISTS `detalles_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_ventas` (
  `idDetalle` int unsigned NOT NULL AUTO_INCREMENT,
  `idProducto` int unsigned NOT NULL,
  `cantidad` decimal(5,2) NOT NULL,
  `precioUnitario` decimal(5,2) NOT NULL,
  `descuento` decimal(3,2) NOT NULL,
  `idVenta` int unsigned NOT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `fk_detallesVentas_ventas1_idx` (`idVenta`),
  KEY `fk_detallesVentas_productos1_idx` (`idProducto`),
  CONSTRAINT `fk_detallesVentas_productos1` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`idProducto`),
  CONSTRAINT `fk_detallesVentas_ventas1` FOREIGN KEY (`idVenta`) REFERENCES `ventas` (`idVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_ventas`
--

LOCK TABLES `detalles_ventas` WRITE;
/*!40000 ALTER TABLE `detalles_ventas` DISABLE KEYS */;
INSERT INTO `detalles_ventas` VALUES (1,9,1.00,367.00,0.00,1),(2,2,1.00,599.00,0.00,2),(3,8,2.00,55.00,0.00,3),(4,3,1.00,74.00,0.00,4),(5,4,1.00,399.00,0.00,5),(6,2,1.00,599.00,9.99,6),(7,7,1.00,135.00,0.00,7),(8,5,1.00,275.00,0.00,8),(9,10,1.00,45.00,0.00,9),(10,7,1.00,135.00,0.00,10),(11,2,1.00,599.00,0.00,11),(12,1,1.00,56.00,0.00,12),(13,6,1.00,140.00,0.00,13),(14,1,1.00,56.00,0.00,14),(15,2,1.00,599.00,0.00,15),(16,3,1.00,74.00,0.00,16),(17,2,2.00,599.00,0.00,17),(18,4,4.00,399.00,0.00,18),(19,9,3.00,500.00,0.00,19),(20,2,1.00,599.00,0.00,20),(21,2,1.00,599.00,0.00,21),(22,3,3.00,74.00,0.00,22),(23,1,1.00,56.00,0.00,23),(24,2,2.00,599.00,0.00,25),(25,3,3.00,74.00,0.00,26),(26,3,1.00,74.00,0.00,28),(27,2,2.00,599.00,0.00,29),(28,3,3.00,74.00,0.00,30);
/*!40000 ALTER TABLE `detalles_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `idEmpleado` int unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(80) NOT NULL,
  `apellidos` varchar(80) NOT NULL,
  `genero` enum('Masculino','Femenino') NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `DUI` varchar(10) NOT NULL,
  `NIT` varchar(17) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `fechaContratacion` datetime NOT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`idEmpleado`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Nestor','Cienfuegos','Masculino','1234567','ateo@gmail.com','1983-02-08','1234456','12345342','Sensunapan 2','2020-08-04 00:00:00',1),(2,'Gabriel','Rivas','Masculino','1725378','gabriel@gmail.com','1999-03-11','7635261','76363663','Sonzacate','2019-03-05 00:00:00',1),(3,'Evelin','Bonilla','Femenino','1867283','Diana@gmail.com','1999-08-19','1263838','18373683','Calle Olivo','2021-04-08 00:00:00',1),(4,'Gabriela','Vanegas','Femenino','8263572','gabriela@gmail.com','2000-04-28','8337629','26363738','Terminal vieja','2018-03-01 00:00:00',1),(5,'Vinicio','Deltoro','Masculino','2377712','desperado@gmail.com','1973-09-12','6351813','19743997','casavieja','2011-09-11 00:00:00',1),(6,'Walter','White','Masculino','1236638','polloshermanos@gmail.com','1974-08-05','2737389','97327277','Nueva esperanza','2015-08-08 00:00:00',0),(7,'123','123','Masculino','123','123123@.com','2022-11-22','123','123','123','2022-11-03 00:00:00',1);
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodopago`
--

DROP TABLE IF EXISTS `metodopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodopago` (
  `idMetodoPago` int unsigned NOT NULL AUTO_INCREMENT,
  `metodo` varchar(60) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idMetodoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodopago`
--

LOCK TABLES `metodopago` WRITE;
/*!40000 ALTER TABLE `metodopago` DISABLE KEYS */;
INSERT INTO `metodopago` VALUES (1,'Efectivo','Dolares'),(2,'BitCoin','ChivoWallet'),(3,'PayPal','Dolares'),(4,'Tarjeta de Credito','Dolares');
/*!40000 ALTER TABLE `metodopago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones`
--

DROP TABLE IF EXISTS `opciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opciones` (
  `idOpcion` int unsigned NOT NULL AUTO_INCREMENT,
  `opcion` varchar(50) NOT NULL,
  `idPermiso` int unsigned NOT NULL,
  PRIMARY KEY (`idOpcion`),
  KEY `fk_opciones_permisos1_idx` (`idPermiso`),
  CONSTRAINT `fk_opciones_permisos1` FOREIGN KEY (`idPermiso`) REFERENCES `permisos` (`idPermiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones`
--

LOCK TABLES `opciones` WRITE;
/*!40000 ALTER TABLE `opciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `opciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `idPermiso` int unsigned NOT NULL AUTO_INCREMENT,
  `permiso` varchar(50) NOT NULL,
  `idRol` int unsigned NOT NULL,
  PRIMARY KEY (`idPermiso`),
  KEY `fk_permisos_roles1_idx` (`idRol`),
  CONSTRAINT `fk_permisos_roles1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'ISSS',1),(2,'Estudio',1),(3,'Embarazo',3);
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProducto` int unsigned NOT NULL AUTO_INCREMENT,
  `producto` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `idCategoria` int unsigned NOT NULL,
  `marca` varchar(80) NOT NULL,
  `costo` decimal(5,2) NOT NULL,
  `precioVenta` decimal(5,2) NOT NULL,
  `stock` decimal(10,2) NOT NULL,
  `idProveedor` int unsigned NOT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`idProducto`),
  KEY `fk_productos_categorias1_idx` (`idCategoria`),
  KEY `fk_productos_proveedores1_idx` (`idProveedor`),
  CONSTRAINT `fk_productos_categorias1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`),
  CONSTRAINT `fk_productos_proveedores1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Microondas','negro120v60hz',1,'Oster',34.00,56.00,95.00,4,1),(2,'Samsug Galaxy s10','Smarphone',7,'Samsung',356.00,599.00,14.00,1,1),(3,'Convers','Zapatoa llStar',2,'AllStar',44.00,74.00,8.00,10,1),(4,'laptop hp','computador',7,'HP',200.00,399.00,7.00,8,1),(5,'Cama hebron','comamarca hebron',4,'Hebrom',99.00,275.00,48.00,6,1),(6,'collar maxin','collar deoro',6,'Decor',67.00,140.00,2.00,7,0),(7,'lacost pernf','perfume',5,'Lacost',88.00,135.00,28.00,2,1),(8,'Camisa polo','camisa estilo polo',3,'Actual',25.00,65.00,55.00,9,1),(9,'Nintendo Switch','Consolade videojuegos',7,'Nintendo',367.00,500.00,17.00,3,0),(10,'Licuadora Panasonic','Licuadora triple',1,'Panasonic',20.00,45.00,70.00,4,1),(11,'null','verde',1,'Natural',0.25,0.76,100.00,1,0),(12,'null','verde',1,'Natural',1.50,2.00,50.00,1,0),(13,'null','verde',1,'Natural',0.25,0.76,100.00,1,0),(14,'null','verde',1,'Natural',1.50,2.00,50.00,1,0),(15,'null','verde',1,'Natural',0.25,0.76,100.00,1,0),(16,'null','verde',1,'Natural',1.50,2.00,50.00,1,0),(17,'manzana','verde',1,'Natural',0.25,0.76,100.00,1,0),(18,'Pera','verde',1,'Natural',1.50,2.00,50.00,1,0),(19,'manzana','verde',1,'Natural',0.25,0.76,100.00,1,0),(20,'Pera','verde',1,'Natural',1.50,2.00,50.00,1,0),(21,'manzana','verde',1,'Natural',0.25,0.76,100.00,1,0),(22,'Pera','verde',1,'Natural',1.50,2.00,50.00,1,0),(23,'manzana','verde',1,'Natural',0.25,0.76,100.00,1,1),(24,'Pera','verde',1,'Natural',1.50,2.00,50.00,1,1),(25,'manzana','verde',1,'Natural',0.25,0.76,100.00,1,0),(26,'Pera','verde',1,'Natural',1.50,2.00,50.00,1,0),(27,'manzana','verde',1,'Natural',0.25,0.76,100.00,1,1),(28,'Pera','verde',1,'Natural',1.50,2.00,50.00,1,1),(29,'1','1',1,'1',1.00,1.00,1.00,1,0),(30,'1','1',1,'1',1.00,1.00,1.00,1,0),(31,'1','1',1,'1',1.00,1.00,1.00,1,0);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idProveedor` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Panasonic','2837679','panasoni@gmail.com','EEUU',1),(2,'o.s. Global Home','2667888','home@gmail.com','Alabama',1),(3,'Muñoz Bosch','7273673','muñoz@gmail.com','Virginia',1),(4,'Grupo T&HA','2736638','tha@gmail.com','EEUU',1),(5,'Disar','7237388','disar@gmail.com','Canada',1),(6,'Hiopos','7635829','hiopos@gmail.com','Francia',1),(7,'Fresay','7263828','fresay@gmail.co','Los Angeles',1),(8,'DPLgroup','8273636','dpl@gmail.com','Arizona',1),(9,'Fiseca','8236368','fiseca@gmail.com','Alabama',1),(10,'Prioimadel','7277289','prioimadel@gmail.com','EEUU',1);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `idRol` int unsigned NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'gerente'),(3,'Vendedor');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `idUsuario` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(300) NOT NULL,
  `idRol` int unsigned NOT NULL,
  `idEmpleado` int unsigned NOT NULL,
  `estado` tinyint DEFAULT '1',
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `fk_usuarios_empleados1_idx` (`idEmpleado`),
  KEY `fk_usuarios_roles1_idx` (`idRol`),
  CONSTRAINT `fk_usuarios_empleados1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  CONSTRAINT `fk_usuarios_roles1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'sss','4orRGnsLmA4y8OrvqlXUmA==',2,1,1),(2,'admin','4F8Q91ePWMvdNEbFmKiQqA==',2,2,1),(3,'EvBoni','4orRGnsLmA4y8OrvqlXUmA==',2,3,1),(4,'1','9JXkt9BIWW6dH4PnFzq8FA==',3,4,1),(5,'Bolo','4orRGnsLmA4y8OrvqlXUmA==',1,5,1),(6,'Hainzenberg','4orRGnsLmA4y8OrvqlXUmA==',1,6,0),(7,'44','xuhqWwklP2eBOtcy5T2cRQ==',3,7,1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idVenta` int unsigned NOT NULL AUTO_INCREMENT,
  `idCliente` int unsigned NOT NULL,
  `idEmpleado` int unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  `idMetodoPago` int unsigned NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` tinyint DEFAULT '1',
  `tipoComprobante` enum('CCF','FC') NOT NULL,
  `noComprobante` varchar(500) NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `fk_ventas_clientes_idx` (`idCliente`),
  KEY `fk_ventas_empleados1_idx` (`idEmpleado`),
  KEY `fk_ventas_metodoPago1_idx` (`idMetodoPago`),
  CONSTRAINT `fk_ventas_clientes` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  CONSTRAINT `fk_ventas_empleados1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`),
  CONSTRAINT `fk_ventas_metodoPago1` FOREIGN KEY (`idMetodoPago`) REFERENCES `metodopago` (`idMetodoPago`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,6,'2022-04-04 00:00:00',1,367.00,1,'CCF',''),(2,2,5,'2022-01-02 00:00:00',2,599.00,0,'CCF',''),(3,3,5,'2022-03-01 00:00:00',3,110.00,1,'CCF',''),(4,4,6,'2022-03-11 00:00:00',4,74.00,1,'CCF',''),(5,5,6,'2022-02-01 00:00:00',1,399.00,0,'CCF',''),(6,6,6,'2022-02-17 00:00:00',1,539.00,1,'CCF',''),(7,7,5,'2022-08-22 00:00:00',4,135.00,1,'CCF',''),(8,8,6,'2022-01-16 00:00:00',1,275.00,1,'CCF',''),(9,9,6,'2022-03-22 00:00:00',1,45.00,1,'CCF',''),(10,10,5,'2022-05-02 00:00:00',1,135.00,0,'CCF',''),(11,2,2,'2022-11-20 01:18:53',1,599.00,1,'CCF','123'),(12,2,2,'2022-11-20 01:20:33',1,56.00,1,'FC','123'),(13,1,2,'2022-11-20 01:21:26',1,140.00,0,'FC','123'),(14,1,2,'2022-11-20 01:29:28',1,56.00,0,'FC','1'),(15,1,2,'2022-11-20 01:29:53',1,599.00,0,'FC','1'),(16,5,2,'2022-11-20 01:30:00',1,74.00,0,'FC','3'),(17,1,2,'2022-11-20 01:47:55',1,1198.00,1,'CCF','123'),(18,1,2,'2022-11-20 01:53:42',3,1596.00,0,'CCF','4'),(19,2,2,'2022-11-20 08:58:38',1,1500.00,0,'CCF','2'),(20,3,2,'2022-11-21 09:24:41',1,599.00,0,'FC','12'),(21,10,2,'2022-11-21 09:26:15',2,599.00,0,'FC','1'),(22,4,2,'2022-11-21 09:26:23',2,222.00,0,'FC','2'),(23,1,2,'2022-11-21 09:27:45',1,56.00,0,'FC','1'),(25,2,2,'2022-11-21 09:28:21',1,1198.00,0,'FC','123'),(26,1,2,'2022-11-21 09:28:35',1,222.00,0,'FC','3'),(28,3,2,'2022-11-21 09:29:15',1,74.00,0,'FC','3'),(29,1,2,'2022-11-21 15:58:27',1,1198.00,0,'FC','2'),(30,3,2,'2022-11-21 15:58:35',1,222.00,0,'FC','3');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-23 21:05:59
