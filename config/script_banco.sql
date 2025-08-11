-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: b8lmugnwnoh7lvlufru1-mysql.services.clever-cloud.com    Database: b8lmugnwnoh7lvlufru1
-- ------------------------------------------------------
-- Server version	8.4.2-2

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
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorito` (
  `hq_id_hq` int NOT NULL,
  `usuario_id_usuario` int NOT NULL,
  `dt_inclusao_favorito` date DEFAULT NULL,
  `status_favorito` int DEFAULT NULL,
  PRIMARY KEY (`hq_id_hq`,`usuario_id_usuario`),
  KEY `fk_hq_has_usuario_usuario1_idx` (`usuario_id_usuario`),
  KEY `fk_hq_has_usuario_hq1_idx` (`hq_id_hq`),
  CONSTRAINT `fk_hq_has_usuario_hq1` FOREIGN KEY (`hq_id_hq`) REFERENCES `hq` (`id_hq`),
  CONSTRAINT `fk_hq_has_usuario_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
INSERT INTO `favorito` VALUES (1,1,'2024-08-16',1),(2,1,'2024-08-16',0),(3,1,'2024-08-16',0);
/*!40000 ALTER TABLE `favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hq`
--

DROP TABLE IF EXISTS `hq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hq` (
  `id_hq` int NOT NULL AUTO_INCREMENT,
  `nome_hq` varchar(85) DEFAULT NULL,
  `descr_hq` varchar(255) DEFAULT NULL,
  `imagem_hq` varchar(155) DEFAULT NULL,
  `preco_hq` float DEFAULT NULL,
  `status_hq` int DEFAULT '1',
  PRIMARY KEY (`id_hq`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hq`
--

LOCK TABLES `hq` WRITE;
/*!40000 ALTER TABLE `hq` DISABLE KEYS */;
INSERT INTO `hq` VALUES (1,'O Cavaleiro das Trevas','Batman de Frank Miller','imagem/hq/batman.jpg',139,1),(2,'O Retorno do Caveleiro das Trevas ','O retorno do batman de Frank Miller','imagem/hq/batman2.jpg',129.99,1),(3,'Hellraiser','Renascido do Inferno','imagem/hq/hellraiser.jpg',89.98,1),(4,'New QQ','New QQ','imagem/hq/hellraiser.jpg',22000,1);
/*!40000 ALTER TABLE `hq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido` (
  `pedido_id_pedido` int NOT NULL,
  `hq_id_hq` int NOT NULL,
  `quantidade` int NOT NULL,
  KEY `fk_pedido_has_hq_hq1_idx` (`hq_id_hq`),
  KEY `fk_pedido_has_hq_pedido1_idx` (`pedido_id_pedido`),
  CONSTRAINT `fk_pedido_has_hq_hq1` FOREIGN KEY (`hq_id_hq`) REFERENCES `hq` (`id_hq`),
  CONSTRAINT `fk_pedido_has_hq_pedido1` FOREIGN KEY (`pedido_id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
INSERT INTO `item_pedido` VALUES (1,3,1);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `usuario_id_usuario` int NOT NULL,
  `status_pedido` int DEFAULT '1',
  `status_pagamento` varchar(20) DEFAULT NULL,
  `id_pagamento` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_usuario1_idx` (`usuario_id_usuario`),
  CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2024-08-20 20:57:16',1,1,'approved','85494466313');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarefas`
--

DROP TABLE IF EXISTS `tarefas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarefas` (
  `id_tarefa` int NOT NULL AUTO_INCREMENT,
  `nome_tarefa` varchar(45) NOT NULL,
  `prazo_tarefa` date NOT NULL,
  `situacao_tarefa` int NOT NULL DEFAULT '0',
  `status_tarefa` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tarefa`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarefas`
--

LOCK TABLES `tarefas` WRITE;
/*!40000 ALTER TABLE `tarefas` DISABLE KEYS */;
INSERT INTO `tarefas` VALUES (1,'Formatar PC do Cliente 1','2025-04-11',1,1),(2,'Instalar Antivirus no PC do Cliente 2','2025-06-20',1,1),(3,'Formatar PC do Cliente 2','2025-06-28',1,1),(4,'Instalar Antivirus no PC do Cliente 2','2025-10-28',1,1),(5,'teste','2023-12-15',0,0),(6,'xxxxxx','2023-12-15',0,0),(7,'testes','2023-12-15',2,1),(8,'ssssss','2023-12-15',2,0),(9,'sssss','2023-12-15',0,0),(10,'tesjnvjkasdnva','2023-12-16',2,0),(11,'teste','2024-02-21',0,0);
/*!40000 ALTER TABLE `tarefas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_usuario` (
  `id_tipo_usuario` int NOT NULL AUTO_INCREMENT,
  `tipo_usuario` varchar(25) DEFAULT NULL,
  `descricao_usuario` varchar(155) DEFAULT NULL,
  `status_tipo_usuario` int DEFAULT '1',
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT INTO `tipo_usuario` VALUES (1,'Comum','Usuário cadastrado no sistema',1),(2,'Encarregado','Usuário com acesso a consultas na área administrativa',1),(3,'ADM','Usuário com acesso a consultas e edições na área administrativa',1);
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(45) NOT NULL,
  `user_usuario` varchar(45) NOT NULL,
  `senha_usuario` char(60) NOT NULL,
  `email_usuario` varchar(45) NOT NULL,
  `fone_usuario` varchar(14) DEFAULT NULL,
  `cep_usuario` char(8) DEFAULT NULL,
  `numero_usuario` varchar(10) DEFAULT NULL,
  `complemento_usuario` varchar(155) DEFAULT NULL,
  `img_perfil_pasta` varchar(80) DEFAULT NULL,
  `img_perfil_banco` longblob,
  `tipo_usuario` int NOT NULL DEFAULT '1',
  `status_usuario` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_tipo_usuario_idx` (`tipo_usuario`),
  CONSTRAINT `fk_usuario_tipo_usuario` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipo_usuario` (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Helvética','helvinha','$2a$12$J1piFIoOATeGAlIOPW0HSuo.pWb/tBJabaoyNNMkxwgrLAG70MYFK','helvinh@gmail.com','1234567890123','06386670','13','próx. esquina 2',NULL,NULL,3,1),(2,'Ana Julia','anajulia','$2a$12$PlgVYz2SaOfcKcKt6kqrCevcRMRLZSoIw43cCo8cOF8DNECZ9vgRa','ana@julia.com','112342358923',NULL,NULL,NULL,NULL,NULL,1,1),(6,'Joca','Joca','Teste@123','joc@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,1,1),(7,'Ana','Ana','Teste@123','ana@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,1,1),(8,'Teste 123','Teste 123','$2a$12$/Qcei82tf3XIdZo9Xbxg2uPtFEwYc2shWsWIH9GWtOAamTie6UeHm','giovani.wingter@docente.fieb.edu.br',NULL,NULL,NULL,NULL,NULL,NULL,1,0);
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

-- Dump completed on 2025-08-11 20:14:30
