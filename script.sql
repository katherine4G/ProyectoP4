-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: DB_PrograIV
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `Areas_Interes`
--

DROP TABLE IF EXISTS `Areas_Interes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Areas_Interes` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Areas_Interes`
--

LOCK TABLES `Areas_Interes` WRITE;
/*!40000 ALTER TABLE `Areas_Interes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Areas_Interes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Carrera`
--

DROP TABLE IF EXISTS `Carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Carrera` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Area` varchar(100) DEFAULT NULL,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Carrera`
--

LOCK TABLES `Carrera` WRITE;
/*!40000 ALTER TABLE `Carrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `Carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documentos`
--

DROP TABLE IF EXISTS `Documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Documentos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Graduado_Id` int DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `URL` text,
  PRIMARY KEY (`Id`),
  KEY `Graduado_Id` (`Graduado_Id`),
  CONSTRAINT `Documentos_ibfk_1` FOREIGN KEY (`Graduado_Id`) REFERENCES `Graduados` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documentos`
--

LOCK TABLES `Documentos` WRITE;
/*!40000 ALTER TABLE `Documentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Encuestas`
--

DROP TABLE IF EXISTS `Encuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Encuestas` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Taller_Id` int DEFAULT NULL,
  `Graduado_Id` int DEFAULT NULL,
  `Puntuacion` int DEFAULT NULL,
  `Comentario` text,
  PRIMARY KEY (`Id`),
  KEY `Taller_Id` (`Taller_Id`),
  KEY `Graduado_Id` (`Graduado_Id`),
  CONSTRAINT `Encuestas_ibfk_1` FOREIGN KEY (`Taller_Id`) REFERENCES `Talleres` (`Id`),
  CONSTRAINT `Encuestas_ibfk_2` FOREIGN KEY (`Graduado_Id`) REFERENCES `Graduados` (`Id`),
  CONSTRAINT `Encuestas_chk_1` CHECK ((`Puntuacion` between 1 and 5))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Encuestas`
--

LOCK TABLES `Encuestas` WRITE;
/*!40000 ALTER TABLE `Encuestas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Encuestas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Exponente`
--

DROP TABLE IF EXISTS `Exponente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Exponente` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Telefono_Trabajo` varchar(20) DEFAULT NULL,
  `Especialidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Exponente`
--

LOCK TABLES `Exponente` WRITE;
/*!40000 ALTER TABLE `Exponente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Exponente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Graduado_Interes`
--

DROP TABLE IF EXISTS `Graduado_Interes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Graduado_Interes` (
  `Graduado_Id` int NOT NULL,
  `Area_Id` int NOT NULL,
  PRIMARY KEY (`Graduado_Id`,`Area_Id`),
  KEY `Area_Id` (`Area_Id`),
  CONSTRAINT `Graduado_Interes_ibfk_1` FOREIGN KEY (`Graduado_Id`) REFERENCES `Graduados` (`Id`),
  CONSTRAINT `Graduado_Interes_ibfk_2` FOREIGN KEY (`Area_Id`) REFERENCES `Areas_Interes` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Graduado_Interes`
--

LOCK TABLES `Graduado_Interes` WRITE;
/*!40000 ALTER TABLE `Graduado_Interes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Graduado_Interes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Graduados`
--

DROP TABLE IF EXISTS `Graduados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Graduados` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Cedula` varchar(20) NOT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Correo_Electronico` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Telefono_Trabajo` varchar(20) DEFAULT NULL,
  `Anio_Egreso` year DEFAULT NULL,
  `Carrera` int DEFAULT NULL,
  `Categoria` varchar(100) DEFAULT NULL,
  `Zona_Geografica` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Cedula` (`Cedula`),
  KEY `Carrera` (`Carrera`),
  CONSTRAINT `Graduados_ibfk_1` FOREIGN KEY (`Carrera`) REFERENCES `Carrera` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Graduados`
--

LOCK TABLES `Graduados` WRITE;
/*!40000 ALTER TABLE `Graduados` DISABLE KEYS */;
/*!40000 ALTER TABLE `Graduados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Roles`
--

DROP TABLE IF EXISTS `Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Roles` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Roles`
--

LOCK TABLES `Roles` WRITE;
/*!40000 ALTER TABLE `Roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `Roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Taller_Graduado`
--

DROP TABLE IF EXISTS `Taller_Graduado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Taller_Graduado` (
  `Taller_Id` int NOT NULL,
  `Graduado_Id` int NOT NULL,
  `Asistencia` tinyint(1) DEFAULT '0',
  `Certificado_Emitido` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Taller_Id`,`Graduado_Id`),
  KEY `Graduado_Id` (`Graduado_Id`),
  CONSTRAINT `Taller_Graduado_ibfk_1` FOREIGN KEY (`Taller_Id`) REFERENCES `Talleres` (`Id`),
  CONSTRAINT `Taller_Graduado_ibfk_2` FOREIGN KEY (`Graduado_Id`) REFERENCES `Graduados` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Taller_Graduado`
--

LOCK TABLES `Taller_Graduado` WRITE;
/*!40000 ALTER TABLE `Taller_Graduado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Taller_Graduado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Talleres`
--

DROP TABLE IF EXISTS `Talleres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Talleres` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text,
  `Requisitos` text,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `Cupo_Maximo` int DEFAULT NULL,
  `Categoria` varchar(100) DEFAULT NULL,
  `Modalidad` varchar(50) DEFAULT NULL,
  `Facilitador_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Facilitador_Id` (`Facilitador_Id`),
  CONSTRAINT `Talleres_ibfk_1` FOREIGN KEY (`Facilitador_Id`) REFERENCES `Exponente` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Talleres`
--

LOCK TABLES `Talleres` WRITE;
/*!40000 ALTER TABLE `Talleres` DISABLE KEYS */;
/*!40000 ALTER TABLE `Talleres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuario` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Contrasena` varchar(255) NOT NULL,
  `Rol` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Rol` (`Rol`),
  CONSTRAINT `Usuario_ibfk_1` FOREIGN KEY (`Rol`) REFERENCES `Roles` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 18:26:08
