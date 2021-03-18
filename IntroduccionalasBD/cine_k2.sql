-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: cine
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cine`
--

DROP TABLE IF EXISTS `cine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cine` (
  `Nombre_cine` varchar(70) NOT NULL,
  `Direccion` varchar(80) NOT NULL,
  `Telefono` int(10) NOT NULL,
  PRIMARY KEY (`Nombre_cine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cine`
--

LOCK TABLES `cine` WRITE;
/*!40000 ALTER TABLE `cine` DISABLE KEYS */;
INSERT INTO `cine` VALUES ('6 de Agosto','Av 6 de Agosto',24534267),('Cinemateca','Rosendo Gutierrez',22334263),('Mega Center','Av Rafael Pabon',22118777),('Monje Campero','Calle Bueno',22333332),('Multicine','Av Arce',22112463),('Multicine El ALto','Rio Seco',2729098);
/*!40000 ALTER TABLE `cine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `Codigo_emp` varchar(10) NOT NULL,
  `Nombre_emp` varchar(100) NOT NULL,
  `Nacionalidad` varchar(70) NOT NULL,
  PRIMARY KEY (`Codigo_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('EMP0001','John McTiernan','EEUU'),('EMP0002','Bruce Willis','Alemania'),('EMP0003','Alan Rickman','Reino Unido'),('EMP0004','Bonnie Bedelia','EEUU'),('EMP0005','William Atherton','EEUU'),('EMP0006','Vin Diesel','EEUU'),('EMP0007','Dwayne Johnson','EEUU'),('EMP0008','Michelle Rodriguez','EEUU'),('EMP0009','Kurt Russell','EEUU'),('EMP0010','Gary Gray','EEUU'),('EMP0011','Leonardo DiCaprio','EEUU'),('EMP0012','Kate Winslet','Reino Unido'),('EMP0013','Nicole Kidman','EEUU'),('EMP0014','Fionnula Flanagan','Irlanda'),('EMP0015','Patrick Wilson','EEUU'),('EMP0016','Vera Farmiga','EEUU'),('EMP0017','Paolo Vargas','Bolivia'),('EMP0018','Leonel Fransezze','Argentina'),('EMP0019','Patricia García','Peru'),('EMP0020',' Adolfo Paco','Bolivia'),('EMP0021','Tom Hanks','EEUU'),('EMP0022','Tim Allen','EEUU'),('EMP0023','Tony Hale','EEUU'),('EMP0024','Guillermo Francella','Argentina'),('EMP0025','Franco Masini','Argentina'),('EMP0026','Juan Pedro Lanzani','Argentina'),('EMP0027','Tom Hardy','Inglaterra'),('EMP0028','Zoe Kravitz','EEUU'),('EMP0029','David Santalla','Bolivia'),('EMP0030','Tatiana Aponte','Bolivia'),('EMP0031','Russell Crowe','Nueva Zelanda'),('EMP0032','Oliver Reed','Reino Unido'),('EMP0033','Richard Harris','Irlanda'),('EMP0034','Lewis Black','EEUU'),('EMP0035','Diane Lane','EEUU'),('EMP0036','Frank Oz','Reino Unido'),('EMP0037','Bill Hader','EEUU'),('EMP0038','Mario Chavez','Bolivia'),('EMP0039','Alejandro Molina','Bolivia'),('EMP0040','Pablo Fernadez','Bolivia'),('EMP0041','Jorge Arturo Lora','Bolivia'),('EMP0042','Brie Larson','EEUU'),('EMP0043','Jude Law','Reino Unido'),('EMP0044','Samuel Jackson','EEUU'),('EMP0045','Gemma Chan','Reino Unido'),('EMP0046','Gael Garcia Bernal','Mexico'),('EMP0047','Anthony Gonzalez','EEUU'),('EMP0048','Benjamin Bratt','EEUU'),('EMP0049','Gabriel Iglesias','EEUU'),('EMP0050','Carla Medina','Mexico'),('EMP0051','Eddie Murphy','EEUU');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `Identificador` varchar(10) NOT NULL,
  `Titulo_distribucion` varchar(80) NOT NULL,
  `Titulo_original` varchar(80) NOT NULL,
  `Genero` enum('ACCION','ANIMACION','AVENTURA','CIENCIA FICCION','TERROR','DOCUMENTAL','MUSICAL','DRAMA','COMEDIA','ROMANCE','SUSPENSO') NOT NULL,
  `Pais_origen` varchar(50) NOT NULL,
  `Idioma` varchar(20) NOT NULL,
  `Fecha_estreno` date NOT NULL,
  `Subtitulos` enum('SI','NO') NOT NULL,
  `Clasificacion` enum('Apta todo público','Mayor a 9 años','Mayor a 15 años','Mayor a 18 años') NOT NULL,
  `URL` varchar(100) DEFAULT NULL,
  `Resumen` varchar(100) NOT NULL,
  `Duracion` int(4) NOT NULL,
  `Año` int(4) NOT NULL,
  PRIMARY KEY (`Identificador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelicula`
--

LOCK TABLES `pelicula` WRITE;
/*!40000 ALTER TABLE `pelicula` DISABLE KEYS */;
INSERT INTO `pelicula` VALUES ('PEL0001','Duro de Matar','Duro de Matar','ACCION','EEUU','Ingles','2000-01-01','SI','Apta todo público','www.durodematar.com','Ataque terrorista',150,2000),('PEL0002','Rapidos y Furiosos 8','Rapidos y furiosos 8','ACCION','EEUU','Ingles','2017-04-13','SI','Apta todo público','www.RyF8.com','Carreras de autos',100,2017),('PEL0003','Titanic','Titanic','DRAMA','EEUU','Ingles','1997-12-19','SI','Mayor a 15 años','www.titanic.com','Dramática y de Catástrofe',170,1997),('PEL0004','El Conjuro','El Conjuro','TERROR','EEUU','Ingles','2013-07-19','SI','Mayor a 18 años','www.elconjuro.com','Película de Terror',90,2013),('PEL0005','Los Otros','Los Otros','SUSPENSO','EEUU','Ingles','2001-08-02','SI','Mayor a 9 años','www.losotros.com','Película de suspenso ambientada en una isla',80,2001),('PEL0006','Muralla','Muralla','SUSPENSO','Bolivia','Espanol','2018-10-02','NO','Mayor a 15 años','www.muralla.com','Película de suspenso',90,2018),('PEL0007','Averno','Averno','SUSPENSO','Bolivia','Espanol','2018-01-12','NO','Mayor a 18 años','www.averno.com','Película de habitantes andinos',87,2018),('PEL0008','El Atraco','El Atraco','COMEDIA','Bolivia','Espanol','2004-10-12','NO','Mayor a 9 años','www.elatraco.com','Bolivia finales de los ochentas',70,2004),('PEL0009','The Square','The Square','DOCUMENTAL','Egipto','Ingles','2013-01-01','SI','Mayor a 18 años','www.thesquare.com','Película documental sobre revolucion politica de Egispto',60,2013),('PEL0010','Coco','Coco','ANIMACION','Mexico','Espanol','2017-10-27','SI','Apta todo público','www.coco.com','Película de animacion sobre un niño que sueña ser musico',110,2017),('PEL0011','Guason','Guason','DRAMA','EEUU','Ingles','2019-10-03','SI','Mayor a 15 años','www.guason.com','Un hombre ignorado or la sociedad',122,2017),('PEL0012','Toy Story 4','Toy Story 4','ANIMACION','EEUU','Ingles','2019-08-03','SI','Apta todo público','www.toystory4.com','Woody descubrirà lo grande que puede ser el mundo',100,2017),('PEL0013','Capitana Marvel','Capitana Marvel','CIENCIA FICCION','EEUU','Ingles','2019-04-03','SI','Apta todo público','www.capitanamarvel.com','Una guerrera extraterrestre se encuentr atrapada en una batalla',125,2018),('PEL0014','Mad Max','Mad Max','CIENCIA FICCION','EEUU','Ingles','2015-08-20','SI','Mayor a 15 años','www.madmax.com','Mad Max se une a furiosa',120,2016),('PEL0015','Intensamente','Intensamente','COMEDIA','EEUU','Ingles','2015-05-23','SI','Apta todo público','www.intensamente.com','Las cinco emociones que conviven en el interior de una niña',102,2016),('PEL0016','Gldiador','Gladiador','ACCION','EEUU','Ingles','2000-08-01','SI','Mayor a 15 años','www.gladiador.com','Maximo general romano quiere volver a casa',181,1998),('PEL0017','El Clan','El Clan','DRAMA','Argentina','Español','2015-02-13','NO','Apta todo público','www.elclan.com','Una familia que se dedica al secuestro',110,2014),('PEL0018','El Club','El Club','DRAMA','Chile','Español','2014-05-05','NO','Mayor a 15 años','www.elclub','Cuatro curas expìan sus pecados',98,2014),('PEL0019','Chuquiago','Chuquiago','DRAMA','Bolivia','Español','1977-08-08','NO','Apta todo público','www.chuquiago.com','Sociedad Bolivia de los 70',98,1976),('PEL0020','El Ascensor','El Ascensor','DRAMA','Bolivia','Español','2009-08-23','NO','Apta todo público','www.elascensor.com','Un empresario queda atascado en un ascensor con dos asaltantes',90,2008),('PEL0021','El descanso','El Descando','COMEDIA','EEUU','Ingles','2006-11-29','SI','Apta todo público','www.eldescanso.com','Dos mujeres intercambian hogares',120,2005),('PEL0022','Norbit','Norbit','COMEDIA','EEUU','Ingles','2007-02-09','SI','Apta todo público','www.norbit.com','Obligado a casarse con una glotona',120,2005);
/*!40000 ALTER TABLE `pelicula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `Codigo_persona` varchar(10) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Edad` int(3) DEFAULT NULL,
  PRIMARY KEY (`Codigo_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES ('PER0001','Hernan Salas',25),('PER0002','Enrique Gomez',35),('PER0003','Teresa James',35),('PER0004','Marcela Torrez',20),('PER0005','Leo Torrez',21),('PER0006','Lia Arnez',31),('PER0007','Lis Torrente',31),('PER0008','Laura Perez',31),('PER0009','Hugo Molina',25),('PER0010','Facundo Inzua',28),('PER0011','Marcelo Torrez',29),('PER0012','Virgina Zuleta',30),('PER0013','Claudia Martinez',31),('PER0014','Angel Brito',32),('PER0015','Guillermina Sol',33),('PER0016','Martin Salazar',34),('PER0017','Andres Cordoba',35),('PER0018','Laura Corrales',36),('PER0019','Patricia Molina',37),('PER0020','Nestor Calle',38),('PER0021','Ulises Morandi',39),('PER0022','Joel Molle',40),('PER0023','Jose Palermo',41),('PER0024','Matias Ale',42),('PER0025','Mora Estrada',43);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabaja`
--

DROP TABLE IF EXISTS `trabaja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabaja` (
  `Identificador` varchar(10) NOT NULL,
  `Codigo_emp` varchar(10) NOT NULL,
  `Nombre_personaje` varchar(80) NOT NULL,
  `Cargo` enum('Director','Actor','Ambos','Actriz') NOT NULL,
  PRIMARY KEY (`Identificador`,`Codigo_emp`,`Nombre_personaje`,`Cargo`),
  KEY `Codigo_emp` (`Codigo_emp`),
  CONSTRAINT `trabaja_ibfk_1` FOREIGN KEY (`Codigo_emp`) REFERENCES `empleado` (`Codigo_emp`),
  CONSTRAINT `trabaja_ibfk_2` FOREIGN KEY (`Identificador`) REFERENCES `pelicula` (`Identificador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabaja`
--

LOCK TABLES `trabaja` WRITE;
/*!40000 ALTER TABLE `trabaja` DISABLE KEYS */;
INSERT INTO `trabaja` VALUES ('PEL0001','EMP0001','Director','Director'),('PEL0001','EMP0002','John Mc Clane','Actor'),('PEL0001','EMP0003','Hans Gruber','Actor'),('PEL0001','EMP0004','Holy Genna','Actriz'),('PEL0001','EMP0005','Richard Tromburg','Actor'),('PEL0002','EMP0006','Dominic Toretto','Actor'),('PEL0002','EMP0007','Luke Hobes','Actor'),('PEL0002','EMP0008','Letty Ortiz','Actriz'),('PEL0002','EMP0009','Frank Petty','Actor'),('PEL0002','EMP0010','Director','Director'),('PEL0003','EMP0011','Jack Dawson','Actor'),('PEL0003','EMP0012','Rose Dewitt','Actriz'),('PEL0005','EMP0013','Grace Stewart','Actriz'),('PEL0005','EMP0014','Bertha Mils','Actriz'),('PEL0004','EMP0015','Ed Warren','Actor'),('PEL0004','EMP0016','Lorraine','Actriz'),('PEL0006','EMP0017','Tupah','Actor'),('PEL0012','EMP0021','Woody','Actor'),('PEL0012','EMP0022','Buzz','Actor'),('PEL0012','EMP0023','Forky','Actor'),('PEL0017','EMP0024','Arquimedes','Actor'),('PEL0017','EMP0025','Guillermo','Actor'),('PEL0017','EMP0026','Alejandro','Actor'),('PEL0014','EMP0027','Max','Actor'),('PEL0014','EMP0028','Toast','Actriz'),('PEL0019','EMP0029','Carlos','Actor'),('PEL0019','EMP0030','Patricia','Actriz'),('PEL0016','EMP0031','Maximo','Actor'),('PEL0016','EMP0032','Proximo','Actor'),('PEL0016','EMP0033','Marco Aurelio','Actor'),('PEL0015','EMP0034','Furia','Actor'),('PEL0015','EMP0035','Mama de Riley','Actriz'),('PEL0015','EMP0036','Subconsciente','Actor'),('PEL0015','EMP0037','Temor','Actor'),('PEL0013','EMP0042','Carol Danvers','Actriz'),('PEL0013','EMP0043','Yon Rogg','Actor'),('PEL0021','EMP0043','Graham','Actor'),('PEL0013','EMP0044','Nick Fury','Actor'),('PEL0010','EMP0046','Hector','Actor'),('PEL0010','EMP0047','Miguel','Actor'),('PEL0010','EMP0048','Ernesto','Actor'),('PEL0010','EMP0050','Frida','Actriz'),('PEL0022','EMP0051','Rasputita','Actor'),('PEL0022','EMP0051','Sr Wong','Actor');
/*!40000 ALTER TABLE `trabaja` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-20 16:15:12
