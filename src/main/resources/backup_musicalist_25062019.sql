-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: musicalist_respaldo
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id_album` int(11) NOT NULL AUTO_INCREMENT,
  `id_artista` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `num_canciones` tinyint(4) NOT NULL,
  `anyo` smallint(6) NOT NULL,
  `imagen_url` varchar(250) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_album`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,1,'Exitos del momento',15,1980,'https://villagepeople/img/1980/exitos_del_momento.jpg',1,'2019-06-23 01:39:37'),(2,2,'Fiestas de cumpleaños',10,1970,'https://cepillinfiestas/img/fiestasdecumple.jpg',1,'2019-06-23 02:23:48');
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_cancion`
--

DROP TABLE IF EXISTS `album_cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_cancion` (
  `id_album_cancion` int(11) NOT NULL AUTO_INCREMENT,
  `id_album` int(11) NOT NULL,
  `id_cancion` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_album_cancion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_cancion`
--

LOCK TABLES `album_cancion` WRITE;
/*!40000 ALTER TABLE `album_cancion` DISABLE KEYS */;
INSERT INTO `album_cancion` VALUES (1,1,1,1,'2019-06-22 21:50:50'),(2,2,2,1,'2019-06-22 22:10:40');
/*!40000 ALTER TABLE `album_cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artista` (
  `id_artista` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `resumen` varchar(250) DEFAULT NULL,
  `genero` varchar(50) NOT NULL,
  `imagen_url` varchar(250) DEFAULT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'Village People','Un grupo viejito con buena musica','Musica Disco','https://musicalist.com/artistas/imagenes/villagepeopel.jpg',1,'2019-06-20 00:00:00'),(2,'Cepillin','Payaso de fiestas','Infantil','https://musicalist.com/canciones/imagenes/cepillin.jpg',1,'2019-06-20 19:38:39');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista_album`
--

DROP TABLE IF EXISTS `artista_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artista_album` (
  `id_artista_album` int(11) NOT NULL AUTO_INCREMENT,
  `id_artista` int(11) NOT NULL,
  `id_album` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_artista_album`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista_album`
--

LOCK TABLES `artista_album` WRITE;
/*!40000 ALTER TABLE `artista_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `artista_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artista_cancion`
--

DROP TABLE IF EXISTS `artista_cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artista_cancion` (
  `id_artista_cancion` int(11) NOT NULL AUTO_INCREMENT,
  `id_artista` int(11) NOT NULL,
  `id_cancion` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_artista_cancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista_cancion`
--

LOCK TABLES `artista_cancion` WRITE;
/*!40000 ALTER TABLE `artista_cancion` DISABLE KEYS */;
/*!40000 ALTER TABLE `artista_cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancion`
--

DROP TABLE IF EXISTS `cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancion` (
  `id_cancion` int(11) NOT NULL AUTO_INCREMENT,
  `id_artista` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `duracion` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_cancion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancion`
--

LOCK TABLES `cancion` WRITE;
/*!40000 ALTER TABLE `cancion` DISABLE KEYS */;
INSERT INTO `cancion` VALUES (1,1,'YMAC',4,1,'2019-06-20 03:11:47'),(2,2,'Las mañanitas con Cepillin',2,1,'2019-06-20 19:38:40'),(3,1,'In the navy',3,1,'2019-06-23 03:26:46'),(4,2,'Una segunda de cepillin',3,1,'2019-06-24 14:17:28');
/*!40000 ALTER TABLE `cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist` (
  `id_playlist` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `duracion` varchar(10) NOT NULL,
  `imagen_url` varchar(250) DEFAULT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_playlist`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,1,'Para programar como mago','2h 50min','https://musicalist.com/playlist/imagenes/imagen1.jpg',1,'2019-06-20 02:50:56'),(2,1,'Para no dormir programando','3h 10min',NULL,1,'2019-06-20 02:52:56'),(3,0,'Para arreglar los errores','5h 30min',NULL,1,'2019-06-25 04:19:12'),(4,0,'Para los hackthones sabrosones','2h 20min',NULL,1,'2019-06-25 04:20:47'),(5,0,'Barbarillas','10h 50min',NULL,1,'2019-06-25 04:23:19');
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_cancion`
--

DROP TABLE IF EXISTS `playlist_cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_cancion` (
  `id_playlist_cancion` int(11) NOT NULL AUTO_INCREMENT,
  `id_playlist` int(11) NOT NULL,
  `id_cancion` int(11) NOT NULL,
  `favorito` tinyint(4) NOT NULL DEFAULT '0',
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_playlist_cancion`)
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_cancion`
--

LOCK TABLES `playlist_cancion` WRITE;
/*!40000 ALTER TABLE `playlist_cancion` DISABLE KEYS */;
INSERT INTO `playlist_cancion` VALUES (2,2,2,0,1,'2019-06-23 19:01:48'),(642,1,1,0,1,'2019-06-24 23:05:53'),(678,1,4,0,1,'2019-06-24 23:17:11');
/*!40000 ALTER TABLE `playlist_cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_usuario`
--

DROP TABLE IF EXISTS `playlist_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playlist_usuario` (
  `id_playlist` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_playlist`,`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_usuario`
--

LOCK TABLES `playlist_usuario` WRITE;
/*!40000 ALTER TABLE `playlist_usuario` DISABLE KEYS */;
INSERT INTO `playlist_usuario` VALUES (1,1,1,'2019-06-19 21:50:56'),(2,1,1,'2019-06-19 21:52:55'),(2,3,1,'2019-06-23 13:37:01');
/*!40000 ALTER TABLE `playlist_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nick` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contraseña` varchar(256) NOT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT '1',
  `fecha_registro` datetime NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'elbarbaro','Leo','Lopez De Alba','leolopezdealba@gmail.com','$2a$10$ycH.x31BlxqSdja9DgKg8u8.uSTLff4nmXDlhgCjisk1xRUk4XfBe',1,'2019-06-19 15:51:31'),(3,'elmagician94','Misael','Suarez','misaelsa@outlook.com','$2a$10$41mVwXdUT6YNBTB2eM08c.MoYBjHJsE3bHAHSb7kMMTPl8WDo3EN.',1,'2019-06-23 18:34:43');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-25 10:29:49
