CREATE DATABASE  IF NOT EXISTS `banco_union` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `banco_union`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: banco_union
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `cheque_sequence`
--

DROP TABLE IF EXISTS `cheque_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cheque_sequence` (
  `next_val` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheque_sequence`
--

LOCK TABLES `cheque_sequence` WRITE;
/*!40000 ALTER TABLE `cheque_sequence` DISABLE KEYS */;
INSERT INTO `cheque_sequence` VALUES (1064);
/*!40000 ALTER TABLE `cheque_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cheques`
--

DROP TABLE IF EXISTS `cheques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cheques` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero_cheque` varchar(20) DEFAULT NULL,
  `id_cuenta` int NOT NULL,
  `beneficiario` varchar(100) NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `monto_letras` varchar(255) NOT NULL,
  `prioridad` enum('Alta','Media','Baja') NOT NULL,
  `firma_digital` varchar(64) NOT NULL,
  `estado` enum('Pendiente','Procesado','Rechazado') DEFAULT 'Pendiente',
  `razon_rechazo` enum('Saldo insuficiente','Cuenta bloqueada','Error en datos','Firma inválida','Cuenta inactiva','Límite excedido','Formato inválido','Cliente inactivo') DEFAULT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_proceso` timestamp NULL DEFAULT NULL,
  `cobrado` tinyint(1) DEFAULT '0',
  `cuenta_saldo_momento` decimal(15,2) DEFAULT NULL,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `usuario_modificacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_cheque` (`numero_cheque`),
  KEY `id_cuenta` (`id_cuenta`),
  KEY `idx_estado_prioridad` (`estado`,`prioridad`),
  KEY `idx_fecha_emision` (`fecha_emision`),
  KEY `idx_numero_cheque` (`numero_cheque`),
  KEY `idx_cheque_estado_fecha` (`estado`,`fecha_emision`),
  KEY `idx_cheque_prioridad_fecha` (`prioridad`,`fecha_emision`),
  CONSTRAINT `cheques_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1088 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cheques`
--

LOCK TABLES `cheques` WRITE;
/*!40000 ALTER TABLE `cheques` DISABLE KEYS */;
INSERT INTO `cheques` VALUES (1000,'CH0001001',1,'Luis Fernandez',150000.00,'Ciento cincuenta mil pesos','Alta','FIRMA101','Pendiente',NULL,'2023-12-01',NULL,0,NULL,NULL,NULL),(1001,'CH0001002',2,'Maria Torres',100000.00,'Cien mil pesos','Media','FIRMA102','Procesado',NULL,'2023-12-03',NULL,0,NULL,NULL,NULL),(1002,'CH0001003',3,'Carlos Ramirez',500000.00,'Quinientos mil pesos','Baja','FIRMA103','Rechazado','Saldo insuficiente','2023-12-05',NULL,0,NULL,NULL,NULL),(1003,'CH0001004',4,'Ana Lopez',800000.00,'Ochocientos mil pesos','Alta','FIRMA104','Pendiente',NULL,'2023-12-08',NULL,0,NULL,NULL,NULL),(1004,'CH0001005',5,'Juan Perez',1000000.00,'Un millón de pesos','Alta','FIRMA105','Pendiente',NULL,'2023-12-10',NULL,0,NULL,NULL,NULL),(1005,'CH0001006',6,'Sofia Gomez',250000.00,'Doscientos cincuenta mil pesos','Baja','FIRMA106','Rechazado','Cuenta bloqueada','2023-12-12',NULL,0,NULL,NULL,NULL),(1006,'CH0001007',7,'Miguel Hernandez',750000.00,'Setecientos cincuenta mil pesos','Alta','FIRMA107','Pendiente',NULL,'2023-12-15',NULL,0,NULL,NULL,NULL),(1007,'CH0001008',8,'Laura Martinez',50000.00,'Cincuenta mil pesos','Baja','FIRMA108','Procesado',NULL,'2023-12-18',NULL,0,NULL,NULL,NULL),(1008,'CH0001009',9,'Sara Morales',900000.00,'Novecientos mil pesos','Alta','FIRMA109','Pendiente',NULL,'2023-12-20',NULL,0,NULL,NULL,NULL),(1009,'CH0001010',10,'Lucia Cortez',450000.00,'Cuatrocientos cincuenta mil pesos','Media','FIRMA110','Pendiente',NULL,'2023-12-22',NULL,0,NULL,NULL,NULL),(1010,'CH0001011',11,'Maria Lopez',200000.00,'Doscientos mil pesos','Alta','SIG123','Rechazado','Error en datos','2023-11-10',NULL,0,NULL,NULL,NULL),(1011,'CH0001012',12,'Carlos Reyes',500000.00,'Quinientos mil pesos','Alta','SIG124','Pendiente','Firma inválida','2023-11-12',NULL,0,NULL,NULL,NULL),(1012,'CH0001013',13,'Laura Perez',800000.00,'Ochocientos mil pesos','Alta','SIG125','Pendiente',NULL,'2023-11-13',NULL,0,NULL,NULL,NULL),(1013,'CH0001014',14,'Luis Sanchez',100000.00,'Cien mil pesos','Baja','SIG126','Procesado',NULL,'2023-11-14',NULL,0,NULL,NULL,NULL),(1014,'CH0001015',15,'Ana Torres',300000.00,'Trescientos mil pesos','Media','SIG127','Pendiente',NULL,'2023-11-15',NULL,0,NULL,NULL,NULL),(1015,'CH0001016',1,'Elena Castro',2000000.00,'Dos millones de pesos','Alta','FIRMA201','Pendiente',NULL,'2024-12-18',NULL,0,5000000.00,NULL,NULL),(1016,'CH0001017',2,'Ricardo Paz',1500000.00,'Un millón quinientos mil pesos','Media','FIRMA202','Pendiente',NULL,'2024-12-18',NULL,0,2000000.00,NULL,NULL),(1017,'CH0001018',3,'Jorge Wong',3000000.00,'Tres millones de pesos','Alta','FIRMA203','Rechazado','Límite excedido','2024-12-13',NULL,0,15000000.00,NULL,NULL),(1018,'CH0001019',4,'Patricia Luna',500000.00,'Quinientos mil pesos','Baja','FIRMA204','Procesado',NULL,'2024-12-16',NULL,1,1000000.00,NULL,NULL),(1019,'CH0001020',1,'Test Beneficiario',100000.00,'Cien mil pesos','Alta','FIRMA999','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1020,'CH0001021',1,'Test CRUD 1',8000000.00,'Ocho millones de pesos','Alta','FIRMA_CRUD_1','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1021,'CH0001022',2,'Test CRUD 2',9999999.00,'Nueve millones novecientos noventa y nueve mil novecientos noventa y nueve pesos','Alta','FIRMA_CRUD_2','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1022,'CH0001023',1,'Test Conjunto 1',100000.00,'Cien mil pesos','Alta','FIRMA_TEST_1','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1023,'CH0001024',2,'Test Conjunto 2',200000.00,'Doscientos mil pesos','Media','FIRMA_TEST_2','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1024,'CH0001025',5,'Test Solo Cheque 1',300000.00,'Trescientos mil pesos','Baja','FIRMA_TEST_3','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1025,'CH0001026',6,'Test Solo Cheque 2',400000.00,'Cuatrocientos mil pesos','Alta','FIRMA_TEST_4','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1026,'CH0001027',1,'Beneficiario Auto 242',730670.00,'Monto en letras automático','Baja','FIRMA_AUTO_1330','Rechazado',NULL,'2024-12-07',NULL,0,NULL,NULL,NULL),(1027,'CH0001028',2,'Beneficiario Auto 89',1438157.00,'Monto en letras automático','Alta','FIRMA_AUTO_5488','Procesado',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1028,'CH0001029',3,'Beneficiario Auto 499',2289586.00,'Monto en letras automático','Baja','FIRMA_AUTO_1414','Procesado',NULL,'2024-11-26',NULL,0,NULL,NULL,NULL),(1029,'CH0001030',4,'Beneficiario Auto 832',4699939.00,'Monto en letras automático','Alta','FIRMA_AUTO_7565','Pendiente',NULL,'2024-12-16',NULL,0,NULL,NULL,NULL),(1030,'CH0001031',5,'Beneficiario Auto 57',110269.00,'Monto en letras automático','Baja','FIRMA_AUTO_1810','Procesado',NULL,'2024-12-06',NULL,0,NULL,NULL,NULL),(1031,'CH0001032',6,'Beneficiario Auto 925',1916050.00,'Monto en letras automático','Alta','FIRMA_AUTO_1151','Procesado',NULL,'2024-11-21',NULL,0,NULL,NULL,NULL),(1032,'CH0001033',7,'Beneficiario Auto 238',2273411.00,'Monto en letras automático','Media','FIRMA_AUTO_9830','Procesado',NULL,'2024-11-26',NULL,0,NULL,NULL,NULL),(1033,'CH0001034',8,'Beneficiario Auto 202',3670828.00,'Monto en letras automático','Alta','FIRMA_AUTO_6714','Pendiente',NULL,'2024-12-09',NULL,0,NULL,NULL,NULL),(1034,'CH0001035',9,'Beneficiario Auto 240',1163748.00,'Monto en letras automático','Media','FIRMA_AUTO_791','Procesado',NULL,'2024-12-01',NULL,0,NULL,NULL,NULL),(1035,'CH0001036',10,'Beneficiario Auto 850',2515101.00,'Monto en letras automático','Baja','FIRMA_AUTO_8742','Rechazado',NULL,'2024-12-11',NULL,0,NULL,NULL,NULL),(1036,'CH0001037',11,'Beneficiario Auto 989',865030.00,'Monto en letras automático','Baja','FIRMA_AUTO_5284','Pendiente',NULL,'2024-11-29',NULL,0,NULL,NULL,NULL),(1037,'CH0001038',12,'Beneficiario Auto 569',4376974.00,'Monto en letras automático','Media','FIRMA_AUTO_2785','Rechazado',NULL,'2024-12-01',NULL,0,NULL,NULL,NULL),(1038,'CH0001039',13,'Beneficiario Auto 915',4072044.00,'Monto en letras automático','Alta','FIRMA_AUTO_7402','Pendiente',NULL,'2024-11-21',NULL,0,NULL,NULL,NULL),(1039,'CH0001040',14,'Beneficiario Auto 496',3783790.00,'Monto en letras automático','Alta','FIRMA_AUTO_7566','Pendiente',NULL,'2024-11-26',NULL,0,NULL,NULL,NULL),(1040,'CH0001041',17,'Beneficiario Auto 115',1813217.00,'Monto en letras automático','Media','FIRMA_AUTO_8065','Rechazado',NULL,'2024-12-11',NULL,0,NULL,NULL,NULL),(1041,'CH0001042',18,'Beneficiario Auto 408',1694398.00,'Monto en letras automático','Media','FIRMA_AUTO_8902','Procesado',NULL,'2024-12-17',NULL,0,NULL,NULL,NULL),(1042,'CH0001043',19,'Beneficiario Auto 191',4221225.00,'Monto en letras automático','Media','FIRMA_AUTO_2646','Rechazado',NULL,'2024-11-30',NULL,0,NULL,NULL,NULL),(1043,'CH0001044',20,'Beneficiario Auto 4',1082136.00,'Monto en letras automático','Baja','FIRMA_AUTO_2478','Procesado',NULL,'2024-11-20',NULL,0,NULL,NULL,NULL),(1044,'CH0001045',21,'Beneficiario Auto 695',3367995.00,'Monto en letras automático','Alta','FIRMA_AUTO_9469','Pendiente',NULL,'2024-12-15',NULL,0,NULL,NULL,NULL),(1057,'CH0001046',1,'Test Procesamiento 1',500000.00,'Quinientos mil pesos','Media','FIRMA_PROC_1','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1058,'CH0001047',2,'Test Procesamiento 2',500000.00,'Quinientos mil pesos','Baja','FIRMA_PROC_2','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1059,'CH0001048',3,'Test Procesamiento 3',500000.00,'Quinientos mil pesos','Alta','FIRMA_PROC_3','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1060,'CH0001049',4,'Test Procesamiento 4',500000.00,'Quinientos mil pesos','Media','FIRMA_PROC_4','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1061,'CH0001050',5,'Test Procesamiento 5',500000.00,'Quinientos mil pesos','Baja','FIRMA_PROC_5','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1062,'CH0001051',6,'Test Procesamiento 6',500000.00,'Quinientos mil pesos','Alta','FIRMA_PROC_6','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1063,'CH0001052',7,'Test Procesamiento 7',500000.00,'Quinientos mil pesos','Alta','FIRMA_PROC_7','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1064,'CH0001053',8,'Test Procesamiento 8',500000.00,'Quinientos mil pesos','Alta','FIRMA_PROC_8','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1065,'CH0001054',9,'Test Procesamiento 9',500000.00,'Quinientos mil pesos','Alta','FIRMA_PROC_9','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1066,'CH0001055',10,'Test Procesamiento 10',500000.00,'Quinientos mil pesos','Media','FIRMA_PROC_10','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1067,'CH0001056',11,'Test Procesamiento 11',500000.00,'Quinientos mil pesos','Baja','FIRMA_PROC_11','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1068,'CH0001057',12,'Test Procesamiento 12',500000.00,'Quinientos mil pesos','Alta','FIRMA_PROC_12','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1069,'CH0001058',13,'Test Procesamiento 13',500000.00,'Quinientos mil pesos','Media','FIRMA_PROC_13','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1070,'CH0001059',14,'Test Procesamiento 14',500000.00,'Quinientos mil pesos','Baja','FIRMA_PROC_14','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1071,'CH0001060',17,'Test Procesamiento 17',500000.00,'Quinientos mil pesos','Alta','FIRMA_PROC_17','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1072,'CH0001061',18,'Test Procesamiento 18',500000.00,'Quinientos mil pesos','Alta','FIRMA_PROC_18','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1073,'CH0001062',19,'Test Procesamiento 19',500000.00,'Quinientos mil pesos','Media','FIRMA_PROC_19','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1074,'CH0001063',20,'Test Procesamiento 20',500000.00,'Quinientos mil pesos','Baja','FIRMA_PROC_20','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL),(1075,'CH0001064',21,'Test Procesamiento 21',500000.00,'Quinientos mil pesos','Alta','FIRMA_PROC_21','Pendiente',NULL,'2024-12-18',NULL,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cheques` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_cheques` BEFORE INSERT ON `cheques` FOR EACH ROW BEGIN
    DECLARE next_id INT;
    UPDATE cheque_sequence SET next_val = next_val + 1;
    SELECT next_val INTO next_id FROM cheque_sequence LIMIT 1;
    SET NEW.numero_cheque = CONCAT('CH', LPAD(next_id, 7, '0'));
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `estado` enum('Activo','Inactivo') DEFAULT 'Activo',
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ultima_actividad` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identificacion` (`identificacion`),
  KEY `idx_cliente_estado` (`estado`),
  KEY `idx_ultima_actividad` (`ultima_actividad`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'123456789','Juan','Perez','Calle 1 #123','3001234567','juan.perez@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(2,'987654321','Ana','Lopez','Carrera 5 #45','3207654321','ana.lopez@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(3,'456789123','Carlos','Ramirez','Diagonal 10 #89','3109876543','carlos.ramirez@example.com','Inactivo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(4,'789123456','Laura','Martinez','Av. Principal #101','3501230987','laura.martinez@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(5,'321654987','Maria','Torres','Calle 8 #76','3107654321','maria.torres@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(6,'654321789','Sofia','Gomez','Calle 9 #123','3106543210','sofia.gomez@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(7,'987123654','Luis','Fernandez','Carrera 10 #456','3009871234','luis.fernandez@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(8,'852741963','Carmen','Diaz','Av. Central #789','3208527416','carmen.diaz@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(9,'741852963','Miguel','Hernandez','Carrera 22 #12','3209987456','miguel.hernandez@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(10,'963258741','Sara','Morales','Av. Sur #23','3204567890','sara.morales@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(11,'223456789','Pedro','Gomez','Calle 21 #123','3102234567','pedro.gomez@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(12,'287654321','Lucia','Cortez','Carrera 7 #85','3201234123','lucia.cortez@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(13,'333111444','Roberto','Silva','Av. 45 #90','3157894561','roberto.silva@example.com','Inactivo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(14,'444222555','Diana','Vargas','Calle 67 #23','3209876543','diana.vargas@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(15,'555333666','Mario','Ruiz','Carrera 89 #12','3114567890','mario.ruiz@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(16,'666444777','Carmen','Ortiz','Av. 34 #56','3145678901','carmen.ortiz@example.com','Inactivo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(17,'777555888','Andrea','Vargas','Calle 100 #45','3157894561','andrea.vargas@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(18,'888666999','Ricardo','Mendoza','Av. 78 #23','3209876543','ricardo.mendoza@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(19,'999777000','Carolina','Paz','Carrera 34 #67','3114567890','carolina.paz@example.com','Inactivo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(20,'000888999','Fernando','Luna','Calle 56 #89','3145678901','fernando.luna@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31'),(21,'111999000','Valentina','Rojas','Av. 90 #12','3168529637','valentina.rojas@example.com','Activo','2024-12-18 18:16:31','2024-12-18 18:16:31');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `tipo` enum('Personal','Empresarial') NOT NULL,
  `saldo` decimal(15,2) DEFAULT '0.00',
  `limite_saldo` decimal(15,2) DEFAULT NULL,
  `fecha_apertura` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('Activa','Cerrada') DEFAULT 'Activa',
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`),
  KEY `idx_cuenta_estado` (`estado`),
  KEY `idx_cuenta_tipo_saldo` (`tipo`,`saldo`),
  CONSTRAINT `cuentas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (1,1,'Personal',17193437.00,10000000.00,'2024-12-18 18:16:31','Activa'),(2,2,'Personal',2029740.00,10000000.00,'2024-12-18 18:16:31','Activa'),(3,3,'Empresarial',25127083.00,NULL,'2024-12-18 18:16:31','Activa'),(4,4,'Personal',137329.00,10000000.00,'2024-12-18 18:16:31','Activa'),(5,5,'Empresarial',57079484.00,NULL,'2024-12-18 18:16:31','Activa'),(6,6,'Personal',5245180.00,10000000.00,'2024-12-18 18:16:31','Activa'),(7,7,'Empresarial',30498765.00,NULL,'2024-12-18 18:16:31','Activa'),(8,8,'Personal',3165613.00,10000000.00,'2024-12-18 18:16:31','Activa'),(9,9,'Personal',8429359.00,10000000.00,'2024-12-18 18:16:31','Activa'),(10,10,'Empresarial',23483365.00,NULL,'2024-12-18 18:16:31','Activa'),(11,11,'Personal',7126783.00,10000000.00,'2024-12-18 18:16:31','Activa'),(12,12,'Empresarial',70855782.00,NULL,'2024-12-18 18:16:31','Activa'),(13,13,'Personal',9705730.00,10000000.00,'2024-12-18 18:16:31','Activa'),(14,14,'Empresarial',24056052.00,NULL,'2024-12-18 18:16:31','Activa'),(15,15,'Personal',100000.00,10000000.00,'2024-12-18 18:16:31','Cerrada'),(16,16,'Empresarial',0.00,NULL,'2024-12-18 18:16:31','Cerrada'),(17,17,'Personal',10177715.00,10000000.00,'2024-12-18 18:16:31','Activa'),(18,18,'Personal',8956934.00,10000000.00,'2024-12-18 18:16:31','Activa'),(19,19,'Empresarial',80347382.00,NULL,'2024-12-18 18:16:31','Activa'),(20,20,'Empresarial',94020328.00,NULL,'2024-12-18 18:16:31','Activa'),(21,21,'Personal',1194065.00,10000000.00,'2024-12-18 18:16:31','Activa');
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cuenta` int NOT NULL,
  `tipo` enum('Deposito','Retiro') NOT NULL,
  `monto` decimal(15,2) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `referencia` varchar(50) DEFAULT NULL,
  `saldo_anterior` decimal(15,2) DEFAULT NULL,
  `saldo_nuevo` decimal(15,2) DEFAULT NULL,
  `estado` enum('Exitosa','Fallida') DEFAULT 'Exitosa',
  PRIMARY KEY (`id`),
  UNIQUE KEY `referencia` (`referencia`),
  KEY `idx_fecha` (`fecha`),
  KEY `idx_cuenta_fecha` (`id_cuenta`,`fecha`),
  KEY `idx_transaccion_fecha` (`fecha`),
  KEY `idx_cuenta_monto` (`id_cuenta`,`monto`),
  CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`id_cuenta`) REFERENCES `cuentas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (1,1,'Deposito',5000000.00,'2023-11-01 05:00:00',NULL,NULL,NULL,'Exitosa'),(2,2,'Retiro',1000000.00,'2023-11-02 05:00:00',NULL,NULL,NULL,'Exitosa'),(3,3,'Deposito',3000000.00,'2023-12-01 05:00:00',NULL,NULL,NULL,'Exitosa'),(4,4,'Retiro',2000000.00,'2023-12-02 05:00:00',NULL,NULL,NULL,'Exitosa'),(5,5,'Deposito',8000000.00,'2023-12-03 05:00:00',NULL,NULL,NULL,'Exitosa'),(6,6,'Deposito',2500000.00,'2023-12-05 05:00:00',NULL,NULL,NULL,'Exitosa'),(7,7,'Retiro',5000000.00,'2023-12-07 05:00:00',NULL,NULL,NULL,'Exitosa'),(8,8,'Deposito',1500000.00,'2023-12-10 05:00:00',NULL,NULL,NULL,'Exitosa'),(9,9,'Deposito',2500000.00,'2023-12-15 05:00:00',NULL,NULL,NULL,'Exitosa'),(10,10,'Deposito',3000000.00,'2023-12-20 05:00:00',NULL,NULL,NULL,'Exitosa'),(11,11,'Deposito',4000000.00,'2023-12-25 05:00:00',NULL,NULL,NULL,'Exitosa'),(12,12,'Retiro',5000000.00,'2023-12-28 05:00:00',NULL,NULL,NULL,'Exitosa'),(13,1,'Deposito',1000000.00,'2024-12-13 18:16:31','REF001',4000000.00,5000000.00,'Exitosa'),(14,2,'Retiro',500000.00,'2024-12-15 18:16:31','REF002',2500000.00,2000000.00,'Exitosa'),(15,3,'Deposito',2000000.00,'2024-11-03 18:16:31','REF003',13000000.00,15000000.00,'Exitosa'),(16,4,'Retiro',1000000.00,'2024-11-08 18:16:31','REF004',1000000.00,0.00,'Exitosa'),(17,1,'Deposito',1000000.00,'2024-12-03 18:16:31',NULL,NULL,NULL,'Exitosa'),(18,2,'Retiro',500000.00,'2024-11-28 18:16:31',NULL,NULL,NULL,'Exitosa'),(19,3,'Deposito',750000.00,'2024-11-03 18:16:31',NULL,NULL,NULL,'Exitosa'),(20,1,'Deposito',1000000.00,'2024-10-19 18:16:31',NULL,NULL,NULL,'Exitosa'),(21,2,'Deposito',2000000.00,'2024-11-03 18:16:31',NULL,NULL,NULL,'Exitosa'),(22,3,'Deposito',3000000.00,'2024-11-13 18:16:31',NULL,NULL,NULL,'Exitosa'),(23,1,'Deposito',5000000.00,'2024-12-18 18:16:31','REF_TEST_1',10000000.00,15000000.00,'Exitosa'),(24,2,'Retiro',1000000.00,'2024-12-18 18:16:31','REF_TEST_2',5000000.00,4000000.00,'Exitosa'),(25,3,'Deposito',2000000.00,'2024-12-18 18:16:31','REF_TEST_3',8000000.00,10000000.00,'Exitosa'),(26,4,'Deposito',3000000.00,'2024-12-18 18:16:31','REF_TEST_4',7000000.00,10000000.00,'Exitosa'),(27,1,'Retiro',806563.00,'2024-11-16 18:16:31','REF_AUTO_1_322',5907184.00,5693475.00,'Exitosa'),(28,2,'Deposito',1029740.00,'2024-11-22 18:16:31','REF_AUTO_2_751',1586046.00,2654785.00,'Exitosa'),(29,3,'Retiro',622917.00,'2024-12-08 18:16:31','REF_AUTO_3_473',2804478.00,2920628.00,'Exitosa'),(30,4,'Deposito',137329.00,'2024-12-11 18:16:31','REF_AUTO_4_454',3726738.00,2818347.00,'Exitosa'),(31,5,'Retiro',920516.00,'2024-11-21 18:16:31','REF_AUTO_5_634',3106162.00,2014469.00,'Exitosa'),(32,6,'Deposito',245180.00,'2024-12-15 18:16:31','REF_AUTO_6_408',2598316.00,2862207.00,'Exitosa'),(33,7,'Deposito',498765.00,'2024-12-05 18:16:31','REF_AUTO_7_270',4389893.00,3894385.00,'Exitosa'),(34,8,'Deposito',665613.00,'2024-11-16 18:16:31','REF_AUTO_8_943',1539504.00,4542989.00,'Exitosa'),(35,9,'Retiro',1070641.00,'2024-12-15 18:16:31','REF_AUTO_9_738',3478610.00,2322544.00,'Exitosa'),(36,10,'Deposito',483365.00,'2024-12-14 18:16:31','REF_AUTO_10_713',4572766.00,3157162.00,'Exitosa'),(37,11,'Retiro',873217.00,'2024-12-10 18:16:31','REF_AUTO_11_397',2473643.00,2403798.00,'Exitosa'),(38,12,'Deposito',855782.00,'2024-10-30 18:16:31','REF_AUTO_12_504',1127986.00,4065838.00,'Exitosa'),(39,13,'Deposito',205730.00,'2024-11-25 18:16:31','REF_AUTO_13_365',3630261.00,3666984.00,'Exitosa'),(40,14,'Retiro',943948.00,'2024-12-09 18:16:31','REF_AUTO_14_859',2787990.00,2054928.00,'Exitosa'),(41,17,'Deposito',377715.00,'2024-12-02 18:16:31','REF_AUTO_17_677',4502605.00,3352473.00,'Exitosa'),(42,18,'Retiro',943066.00,'2024-12-11 18:16:31','REF_AUTO_18_304',5650638.00,4681658.00,'Exitosa'),(43,19,'Deposito',347382.00,'2024-11-28 18:16:31','REF_AUTO_19_165',4991145.00,3466615.00,'Exitosa'),(44,20,'Retiro',979672.00,'2024-12-02 18:16:31','REF_AUTO_20_821',2432729.00,5839149.00,'Exitosa'),(45,21,'Deposito',1094065.00,'2024-12-08 18:16:31','REF_AUTO_21_788',3061539.00,4479716.00,'Exitosa');
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'banco_union'
--

--
-- Dumping routines for database 'banco_union'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-18 13:17:25
