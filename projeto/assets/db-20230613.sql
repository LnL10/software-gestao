-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: projeto-71
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artigo`
--

DROP TABLE IF EXISTS `artigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artigo` (
  `idArtigo` int(11) NOT NULL AUTO_INCREMENT,
  `Referencia` varchar(45) NOT NULL,
  `CódigoDeBarras` varchar(45) DEFAULT NULL,
  `Data` date DEFAULT NULL,
  `Armazem` varchar(45) DEFAULT NULL,
  `Lote_idLote` int(11) NOT NULL,
  `Fornecedor_idFornecedor` int(11) NOT NULL,
  `Marca_idMarca` int(11) NOT NULL,
  `Genero_idGenero` int(11) NOT NULL,
  `Categoria_idcategoria` int(11) NOT NULL,
  `Tamanho_idtamanho` int(11) NOT NULL,
  `Cor_idCor` int(11) NOT NULL,
  `ArtigoBase_ReferenciaBase` int(11) NOT NULL,
  PRIMARY KEY (`idArtigo`),
  KEY `fk_Artigo_Lote1_idx` (`Lote_idLote`),
  KEY `fk_Artigo_Cor1_idx` (`Cor_idCor`),
  KEY `fk_Artigo_Tamanho1_idx` (`Tamanho_idtamanho`),
  KEY `fk_Artigo_Categoria1_idx` (`Categoria_idcategoria`),
  KEY `fk_Artigo_Genero1_idx` (`Genero_idGenero`),
  KEY `fk_Artigo_Marca1_idx` (`Marca_idMarca`),
  KEY `fk_Artigo_Fornecedor1_idx` (`Fornecedor_idFornecedor`),
  KEY `fk_Artigo_ArtigoBase1_idx` (`ArtigoBase_ReferenciaBase`),
  CONSTRAINT `fk_Artigo_ArtigoBase1` FOREIGN KEY (`ArtigoBase_ReferenciaBase`) REFERENCES `artigobase` (`ReferenciaBase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artigo_Categoria1` FOREIGN KEY (`Categoria_idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artigo_Cor1` FOREIGN KEY (`Cor_idCor`) REFERENCES `cor` (`idCor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artigo_Fornecedor1` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artigo_Genero1` FOREIGN KEY (`Genero_idGenero`) REFERENCES `genero` (`idGenero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artigo_Lote1` FOREIGN KEY (`Lote_idLote`) REFERENCES `lote` (`idLote`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artigo_Marca1` FOREIGN KEY (`Marca_idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Artigo_Tamanho1` FOREIGN KEY (`Tamanho_idtamanho`) REFERENCES `tamanho` (`idtamanho`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artigo`
--

LOCK TABLES `artigo` WRITE;
/*!40000 ALTER TABLE `artigo` DISABLE KEYS */;
INSERT INTO `artigo` VALUES (52,'2.1','3103001001010','2023-05-02','1235',2,3,2,3,1,10,1,2),(54,'123.2','3103002001013','2023-05-02','1235',2,3,2,3,1,13,1,123),(55,'2.2','3103002001014','2023-05-03','1235',3,3,1,3,1,14,1,2),(56,'2.3','3103003001014','2023-05-03','44',2,3,1,3,1,14,1,2),(57,'2.4','3103004001013','2023-05-03','123',2,3,1,1,1,13,1,2),(58,'2.5','1603005004013','2023-05-31','123',2,3,1,2,1,13,4,2);
/*!40000 ALTER TABLE `artigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artigobase`
--

DROP TABLE IF EXISTS `artigobase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artigobase` (
  `ReferenciaBase` int(11) NOT NULL,
  `Nome` varchar(60) NOT NULL,
  `Composicao` varchar(100) DEFAULT NULL,
  `PrecoCusto` decimal(15,0) DEFAULT NULL,
  `PrecoVenda` decimal(15,0) DEFAULT NULL,
  PRIMARY KEY (`ReferenciaBase`),
  UNIQUE KEY `ReferenciaBase_UNIQUE` (`ReferenciaBase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artigobase`
--

LOCK TABLES `artigobase` WRITE;
/*!40000 ALTER TABLE `artigobase` DISABLE KEYS */;
INSERT INTO `artigobase` VALUES (2,'TshirtNike','Poliester',10,20),(123,'Casaco','Algodao',10,20),(1283,'TshirtAdidas','Poliester',20,25);
/*!40000 ALTER TABLE `artigobase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_assignment`
--

DROP TABLE IF EXISTS `auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_assignment`
--

LOCK TABLES `auth_assignment` WRITE;
/*!40000 ALTER TABLE `auth_assignment` DISABLE KEYS */;
INSERT INTO `auth_assignment` VALUES ('Admin',1,1683586340),('Admin',3,1679435997),('NormalUser',1,1683587990),('NormalUser',4,1683584575);
/*!40000 ALTER TABLE `auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item`
--

DROP TABLE IF EXISTS `auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `group_code` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  KEY `fk_auth_item_group_code` (`group_code`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_auth_item_group_code` FOREIGN KEY (`group_code`) REFERENCES `auth_item_group` (`code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item`
--

LOCK TABLES `auth_item` WRITE;
/*!40000 ALTER TABLE `auth_item` DISABLE KEYS */;
INSERT INTO `auth_item` VALUES ('/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//controller',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//crud',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//extension',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//form',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//model',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//module',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/asset/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/asset/compress',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/asset/template',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/cache/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/cache/flush',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/cache/flush-all',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/cache/flush-schema',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/cache/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/fixture/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/fixture/load',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/fixture/unload',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/default/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/default/action',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/default/diff',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/default/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/default/preview',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/default/view',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/hello/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/hello/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/help/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/help/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/message/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/message/config',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/message/extract',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/create',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/down',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/history',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/mark',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/new',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/redo',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/to',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/up',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/bulk-activate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/bulk-deactivate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/bulk-delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/create',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/grid-page-size',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/grid-sort',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/toggle-attribute',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/update',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/view',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/captcha',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/change-own-password',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/confirm-email',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/confirm-email-receive',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/confirm-registration-email',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/login',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/logout',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/password-recovery',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/password-recovery-receive',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/registration',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/bulk-activate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/bulk-deactivate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/bulk-delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/create',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/grid-page-size',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/grid-sort',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/refresh-routes',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/set-child-permissions',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/set-child-routes',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/toggle-attribute',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/update',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/view',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/bulk-activate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/bulk-deactivate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/bulk-delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/create',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/grid-page-size',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/grid-sort',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/set-child-permissions',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/set-child-roles',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/toggle-attribute',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/update',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/view',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-permission/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-permission/set',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-permission/set-roles',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/bulk-activate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/bulk-deactivate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/bulk-delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/create',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/grid-page-size',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/grid-sort',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/toggle-attribute',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/update',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/view',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/bulk-activate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/bulk-deactivate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/bulk-delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/change-password',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/create',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/grid-page-size',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/grid-sort',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/toggle-attribute',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/update',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/view',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('Admin',1,'Admin',NULL,NULL,1426062189,1426062189,NULL),('assignRolesToUsers',2,'Assign roles to users',NULL,NULL,1426062189,1426062189,'userManagement'),('bindUserToIp',2,'Bind user to IP',NULL,NULL,1426062189,1426062189,'userManagement'),('changeOwnPassword',2,'Change own password',NULL,NULL,1426062189,1426062189,'userCommonPermissions'),('changeUserPassword',2,'Change user password',NULL,NULL,1426062189,1426062189,'userManagement'),('commonPermission',2,'Common permission',NULL,NULL,1426062188,1426062188,NULL),('createUsers',2,'Create users',NULL,NULL,1426062189,1426062189,'userManagement'),('deleteUsers',2,'Delete users',NULL,NULL,1426062189,1426062189,'userManagement'),('editUserEmail',2,'Edit user email',NULL,NULL,1426062189,1426062189,'userManagement'),('editUsers',2,'Edit users',NULL,NULL,1426062189,1426062189,'userManagement'),('NormalUser',1,'NormalUser',NULL,NULL,1683584472,1683584472,NULL),('viewRegistrationIp',2,'View registration IP',NULL,NULL,1426062189,1426062189,'userManagement'),('viewUserEmail',2,'View user email',NULL,NULL,1426062189,1426062189,'userManagement'),('viewUserRoles',2,'View user roles',NULL,NULL,1426062189,1426062189,'userManagement'),('viewUsers',2,'View users',NULL,NULL,1426062189,1426062189,'userManagement'),('viewVisitLog',2,'View visit log',NULL,NULL,1426062189,1426062189,'userManagement');
/*!40000 ALTER TABLE `auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_child`
--

DROP TABLE IF EXISTS `auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_child`
--

LOCK TABLES `auth_item_child` WRITE;
/*!40000 ALTER TABLE `auth_item_child` DISABLE KEYS */;
INSERT INTO `auth_item_child` VALUES ('Admin','assignRolesToUsers'),('Admin','changeOwnPassword'),('Admin','changeUserPassword'),('Admin','createUsers'),('Admin','deleteUsers'),('Admin','editUsers'),('Admin','viewUsers'),('assignRolesToUsers','/user-management/user-permission/set'),('assignRolesToUsers','/user-management/user-permission/set-roles'),('assignRolesToUsers','viewUserRoles'),('assignRolesToUsers','viewUsers'),('changeOwnPassword','/user-management/auth/change-own-password'),('changeUserPassword','/user-management/user/change-password'),('changeUserPassword','viewUsers'),('createUsers','/user-management/user/create'),('createUsers','viewUsers'),('deleteUsers','/user-management/user/bulk-delete'),('deleteUsers','/user-management/user/delete'),('deleteUsers','viewUsers'),('editUserEmail','viewUserEmail'),('editUsers','/user-management/user/bulk-activate'),('editUsers','/user-management/user/bulk-deactivate'),('editUsers','/user-management/user/update'),('editUsers','viewUsers'),('NormalUser','changeOwnPassword'),('NormalUser','changeUserPassword'),('NormalUser','editUserEmail'),('viewUsers','/user-management/user/grid-page-size'),('viewUsers','/user-management/user/index'),('viewUsers','/user-management/user/view'),('viewVisitLog','/user-management/user-visit-log/grid-page-size'),('viewVisitLog','/user-management/user-visit-log/index'),('viewVisitLog','/user-management/user-visit-log/view');
/*!40000 ALTER TABLE `auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_item_group`
--

DROP TABLE IF EXISTS `auth_item_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_item_group` (
  `code` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_item_group`
--

LOCK TABLES `auth_item_group` WRITE;
/*!40000 ALTER TABLE `auth_item_group` DISABLE KEYS */;
INSERT INTO `auth_item_group` VALUES ('userCommonPermissions','User common permission',1426062189,1426062189),('userManagement','User management',1426062189,1426062189);
/*!40000 ALTER TABLE `auth_item_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_rule`
--

DROP TABLE IF EXISTS `auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_rule`
--

LOCK TABLES `auth_rule` WRITE;
/*!40000 ALTER TABLE `auth_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `NomeCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategoria`),
  UNIQUE KEY `NomeCategoria_UNIQUE` (`NomeCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Camisola');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cor`
--

DROP TABLE IF EXISTS `cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cor` (
  `idCor` int(11) NOT NULL AUTO_INCREMENT,
  `CorSite` varchar(45) NOT NULL,
  `CCor` varchar(45) NOT NULL,
  PRIMARY KEY (`idCor`),
  UNIQUE KEY `CorSite_UNIQUE` (`CorSite`),
  UNIQUE KEY `CCor_UNIQUE` (`CCor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cor`
--

LOCK TABLES `cor` WRITE;
/*!40000 ALTER TABLE `cor` DISABLE KEYS */;
INSERT INTO `cor` VALUES (1,'Branco','1'),(2,'Vermelho','2'),(3,'Verde','3'),(4,'Castanho','4');
/*!40000 ALTER TABLE `cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `NomeFornecedor` varchar(45) NOT NULL,
  `CFornecedor` varchar(45) NOT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `NomeFornecedor_UNIQUE` (`NomeFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Adidas','1'),(3,'Nike','3');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `idGenero` int(11) NOT NULL AUTO_INCREMENT,
  `TipoGenero` varchar(45) NOT NULL,
  PRIMARY KEY (`idGenero`),
  UNIQUE KEY `TipoGenero_UNIQUE` (`TipoGenero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (2,'Feminino'),(1,'Masculino'),(3,'Unisexo');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lote`
--

DROP TABLE IF EXISTS `lote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lote` (
  `idLote` int(11) NOT NULL AUTO_INCREMENT,
  `NomeLote` varchar(45) NOT NULL,
  `DescricaoLote` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`idLote`),
  KEY `fk_Lote_user1_idx` (`user_id`),
  CONSTRAINT `fk_Lote_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (2,'T-shirts','tshirt',1),(3,'Casacos','Casacos',1),(9,'leo','123',4);
/*!40000 ALTER TABLE `lote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `NomeMarca` varchar(45) NOT NULL,
  `TotalMarca` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMarca`),
  UNIQUE KEY `NomeMarca_UNIQUE` (`NomeMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Adidas',7),(2,'Nike',3);
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferencias`
--

DROP TABLE IF EXISTS `preferencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preferencias` (
  `idpreferencias` int(11) NOT NULL AUTO_INCREMENT,
  `CEstacao` varchar(10) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`idpreferencias`),
  KEY `fk_preferencias_user1_idx` (`user_id`),
  CONSTRAINT `fk_preferencias_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferencias`
--

LOCK TABLES `preferencias` WRITE;
/*!40000 ALTER TABLE `preferencias` DISABLE KEYS */;
INSERT INTO `preferencias` VALUES (1,'16',1);
/*!40000 ALTER TABLE `preferencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamanho`
--

DROP TABLE IF EXISTS `tamanho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamanho` (
  `idtamanho` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTamanho` varchar(10) NOT NULL,
  `CTamanho` varchar(10) NOT NULL,
  PRIMARY KEY (`idtamanho`),
  UNIQUE KEY `Tamanho_UNIQUE` (`SiteTamanho`),
  UNIQUE KEY `CTamanho_UNIQUE` (`CTamanho`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamanho`
--

LOCK TABLES `tamanho` WRITE;
/*!40000 ALTER TABLE `tamanho` DISABLE KEYS */;
INSERT INTO `tamanho` VALUES (1,'XS','1'),(2,'S','2'),(3,'M','3'),(4,'L','4'),(5,'XL','5'),(6,'XXL','6'),(7,'XXXL','7'),(8,'31','8'),(9,'32','9'),(10,'33','10'),(11,'34','11'),(12,'35','12'),(13,'36','13'),(14,'37','14');
/*!40000 ALTER TABLE `tamanho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `superadmin` smallint(1) DEFAULT 0,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `registration_ip` varchar(15) DEFAULT NULL,
  `bind_to_ip` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email_confirmed` smallint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'superadmin','kz2px152FAWlkHbkZoCiXgBAd-S8SSjF','$2y$13$MhlYe12xkGFnSeK0sO2up.Y9kAD9Ct6JS1i9VLP7YAqd1dFsSylz2',NULL,1,1,1426062188,1426062188,NULL,NULL,NULL,0),(3,'leonel','3eIs0zeAiEeWD5dDsQevn_t4UJ67zrMF','$2y$13$vB4/7RZ5phUm.VhWaiuoVOmICUh/XNtaHxlw2fHg7nySb9G.WWME.',NULL,1,0,1673821372,1673821372,'::1','','lalt2002@gmail.com',0),(4,'leo','jy4Jt6nHO3bZ_aJCeRnNgsP6zIY8lCjw','$2y$13$3KVQsWlsMWjpDGoYVUdQO.wuw1JexWrk1SOxpqh2BvzrvtRVvj9l.',NULL,1,0,1677709322,1685094550,'::1','',NULL,0),(6,'leo1','gFddn5deawAKiP7wwwqE4o1mBm4V2pT4','$2y$13$6E5kG1MdVaKidyKHy3oQbu0WfZ244Lq0YZy9ybDyN0416aGYQnYc.',NULL,1,0,1685978397,1685978397,'::1','',NULL,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_visit_log`
--

DROP TABLE IF EXISTS `user_visit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `language` char(2) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_time` int(11) NOT NULL,
  `browser` varchar(30) DEFAULT NULL,
  `os` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_visit_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_visit_log`
--

LOCK TABLES `user_visit_log` WRITE;
/*!40000 ALTER TABLE `user_visit_log` DISABLE KEYS */;
INSERT INTO `user_visit_log` VALUES (1,'63b6035a6efcf','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1672872794,'Firefox','Windows'),(2,'63b603d335c7e','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1672872915,'Firefox','Windows'),(3,'63b6050c5e45e','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1672873228,'Firefox','Windows'),(4,'63b6051ed5616','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1672873246,'Firefox','Windows'),(5,'63b80faa14a5e','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673007018,'Firefox','Windows'),(6,'63b8102756897','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673007143,'Firefox','Windows'),(7,'63b81178a999b','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673007480,'Firefox','Windows'),(8,'63b814e4461d3','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673008356,'Firefox','Windows'),(9,'63b8154a7d463','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673008458,'Firefox','Windows'),(10,'63bd7c566e81f','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673362518,'Firefox','Windows'),(11,'63c479fad97c2','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673820666,'Firefox','Windows'),(12,'63c47ccf7dff4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',3,1673821391,'Firefox','Windows'),(13,'63c47ceab4d5a','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673821418,'Firefox','Windows'),(14,'63c484ab990e7','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',3,1673823403,'Firefox','Windows'),(15,'63d302b07bb8b','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674773168,'Firefox','Windows'),(16,'63d303b81cb9e','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',1,1674773432,'Firefox','Windows'),(17,'63d3042f54928','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674773551,'Firefox','Windows'),(18,'63d3045e1b1e3','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674773598,'Firefox','Windows'),(19,'63d3048209501','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',1,1674773634,'Firefox','Windows'),(20,'63d3a7d0704ce','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',1,1674815440,'Firefox','Windows'),(21,'63d3a8a5150b4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674815653,'Firefox','Windows'),(22,'63d3a8aae02f4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674815658,'Firefox','Windows'),(23,'63d3a8bb510ef','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',1,1674815675,'Firefox','Windows'),(24,'63d3a9db9933a','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674815963,'Firefox','Windows'),(25,'63d3aa0e325bc','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674816014,'Firefox','Windows'),(26,'63d3aa20682f4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674816032,'Firefox','Windows'),(27,'63d3aab3b1b7b','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674816179,'Firefox','Windows'),(28,'63d3aaeae2309','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674816234,'Firefox','Windows'),(29,'63dbd28b86cde','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1675350667,'Firefox','Windows'),(30,'63dfcea0e47bd','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',1,1675611808,'Firefox','Windows'),(31,'63f7e2da8fd38','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1677189850,'Firefox','Windows'),(32,'63ffcff253a79','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1677709298,'Firefox','Windows'),(33,'63ffd00a0a2e2','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',4,1677709322,'Firefox','Windows'),(34,'63ffd0151380e','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',4,1677709333,'Firefox','Windows'),(35,'64012fecee0f3','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1677799404,'Firefox','Windows'),(36,'64065f8182b69','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1678139265,'Firefox','Windows'),(37,'64066009500fc','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',1,1678139401,'Firefox','Windows'),(38,'640660fa7d7db','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1678139642,'Firefox','Windows'),(39,'640661159101b','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',1,1678139669,'Firefox','Windows'),(40,'6408ccdf2cd71','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1678298335,'Firefox','Windows'),(41,'6408cd5153859','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',1,1678298449,'Firefox','Windows'),(42,'640e57dc9e0e0','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1678661596,'Firefox','Windows'),(43,'640e57f00f0d4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',1,1678661616,'Firefox','Windows'),(44,'640f803da18cf','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',1,1678737469,'Firefox','Windows'),(45,'64143eaa56283','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1679048362,'Firefox','Windows'),(46,'641a284bb2749','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1679435851,'Firefox','Windows'),(47,'641a28a87f007','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',3,1679435944,'Firefox','Windows'),(48,'641a28b29d663','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1679435954,'Firefox','Windows'),(49,'641a28ec16df4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',3,1679436012,'Firefox','Windows'),(50,'641a29347d686','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1679436084,'Firefox','Windows'),(51,'641cc745952eb','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1679607621,'Firefox','Windows'),(52,'641d7ae85d5a6','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1679653608,'Firefox','Windows'),(53,'64233672b84ac','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680029298,'Firefox','Windows'),(54,'6423552c0f6b7','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680037164,'Firefox','Windows'),(55,'6424565412a89','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680102996,'Firefox','Windows'),(56,'6424a52843620','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680123176,'Firefox','Windows'),(57,'642603faabc3d','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680212986,'Firefox','Windows'),(58,'642619554b046','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680218453,'Firefox','Windows'),(59,'642619f44c510','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680218612,'Firefox','Windows'),(60,'6426ab98e2b59','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680255896,'Firefox','Windows'),(61,'642b3ee1ca8f1','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680555745,'Firefox','Windows'),(62,'642cad1e0c84a','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680649502,'Firefox','Windows'),(63,'642dbf05472c6','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680719621,'Firefox','Windows'),(64,'642ddade530ce','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680726750,'Firefox','Windows'),(65,'642f3aa386ada','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680816803,'Firefox','Windows'),(66,'6436ef8242ee4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1681321858,'Firefox','Windows'),(67,'6436f468b3a98','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1681323112,'Firefox','Windows'),(68,'643879e599ce8','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1681422821,'Firefox','Windows'),(69,'64391c39c88f5','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1681464377,'Firefox','Windows'),(70,'6439210aeb8bd','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1681465610,'Firefox','Windows'),(71,'6447db17ad70e','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1682430743,'Firefox','Windows'),(72,'64493f8beb9c1','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1682521995,'Firefox','Windows'),(73,'644aebb9ced86','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1682631609,'Firefox','Windows'),(74,'644b93be2f74f','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1682674622,'Firefox','Windows'),(75,'64516700e5488','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683056384,'Firefox','Windows'),(76,'6452791a5cb92','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683126554,'Firefox','Windows'),(77,'64528b6389fd7','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683131235,'Firefox','Windows'),(78,'64528ced61ec4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683131629,'Firefox','Windows'),(79,'6453b423c888f','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683207203,'Firefox','Windows'),(80,'645433be89d72','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683239870,'Firefox','Windows'),(81,'6454cc92e3167','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683278994,'Firefox','Windows'),(82,'6454cc93e2bdb','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683278995,'Firefox','Windows'),(83,'6454cf4da15fb','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',4,1683279693,'Firefox','Windows'),(84,'6454cf6a90618','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683279722,'Firefox','Windows'),(85,'6459752f8426c','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683584303,'Firefox','Windows'),(86,'6459765791d13','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',4,1683584599,'Firefox','Windows'),(87,'645977a38def4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683584931,'Firefox','Windows'),(88,'64597b0e6a4ec','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683585806,'Firefox','Windows'),(89,'64597b4989fb8','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683585865,'Firefox','Windows'),(90,'64597bc9c530d','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',4,1683585993,'Firefox','Windows'),(91,'64597be35b8fa','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683586019,'Firefox','Windows'),(92,'64597cb10551a','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683586225,'Firefox','Windows'),(93,'645983313772a','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683587889,'Firefox','Windows'),(94,'64598e416d5b4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',4,1683590721,'Firefox','Windows'),(95,'64598e89736da','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',1,1683590793,'Firefox','Windows'),(96,'64598ee8f075f','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0',4,1683590888,'Firefox','Windows'),(97,'645ab64e9fbf4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1683666510,'Firefox','Windows'),(98,'645ab65eb9750','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1683666526,'Firefox','Windows'),(99,'645ab6b8d0e07','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1683666616,'Firefox','Windows'),(100,'645ab8e4b5a94','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1683667172,'Firefox','Windows'),(101,'645ab9e9cabeb','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1683667433,'Firefox','Windows'),(102,'645ab9fc88f27','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1683667452,'Firefox','Windows'),(103,'645abefb95125','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1683668731,'Firefox','Windows'),(104,'645abf01493d8','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1683668737,'Firefox','Windows'),(105,'645ac082be695','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1683669122,'Firefox','Windows'),(106,'645ac0d57fc84','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1683669205,'Firefox','Windows'),(107,'645ac1c35df33','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1683669443,'Firefox','Windows'),(108,'645ac4374cb18','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1683670071,'Firefox','Windows'),(109,'645e05e998fd2','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1683883497,'Firefox','Windows'),(110,'645e05f9aad53','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1683883513,'Firefox','Windows'),(111,'645e075cabd38','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1683883868,'Firefox','Windows'),(112,'645e0767d41ff','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1683883879,'Firefox','Windows'),(113,'645e07a2c775c','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1683883938,'Firefox','Windows'),(114,'645e07eeb432a','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1683884014,'Firefox','Windows'),(115,'645e0888ac880','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',NULL,1683884168,'Firefox','Windows'),(116,'645e088f16233','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1683884175,'Firefox','Windows'),(117,'64626fae575f8','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684172718,'Firefox','Windows'),(118,'6463f92ea2ff4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1684273454,'Firefox','Windows'),(119,'6463f947c3414','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684273479,'Firefox','Windows'),(120,'6464da122e7b3','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684331026,'Firefox','Windows'),(121,'64654b37b584b','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684359991,'Firefox','Windows'),(122,'64654df9e3d7d','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684360697,'Firefox','Windows'),(123,'646550c9a6724','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684361417,'Firefox','Windows'),(124,'646631df236b1','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684419039,'Firefox','Windows'),(125,'6466342424785','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684419620,'Firefox','Windows'),(126,'646642df1a28d','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684423391,'Firefox','Windows'),(127,'6466449869a8b','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1684423832,'Firefox','Windows'),(128,'64674132d23a3','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684488498,'Firefox','Windows'),(129,'646744f0d28d1','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684489456,'Firefox','Windows'),(130,'6467455fcedc6','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1684489567,'Firefox','Windows'),(131,'6467457f2f838','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684489599,'Firefox','Windows'),(132,'646b6717b6ecb','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684760343,'Firefox','Windows'),(133,'646b68775e141','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684760695,'Firefox','Windows'),(134,'646b69d53ffc7','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684761045,'Firefox','Windows'),(135,'646b6a076e9d8','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684761095,'Firefox','Windows'),(136,'646b78b35b7e6','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1684764851,'Firefox','Windows'),(137,'646b79dc73fa5','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684765148,'Firefox','Windows'),(138,'646ce5e876192','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684858344,'Firefox','Windows'),(139,'646ce672c08ea','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684858482,'Firefox','Windows'),(140,'646ce67b69298','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684858491,'Firefox','Windows'),(141,'646ce6b5abb55','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684858549,'Firefox','Windows'),(142,'646ce6e25fea6','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684858594,'Firefox','Windows'),(143,'646ce7062a865','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1684858630,'Firefox','Windows'),(144,'646ce7114f36b','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1684858641,'Firefox','Windows'),(145,'64707ad11de82','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1685093073,'Firefox','Windows'),(146,'64707b0d86ae9','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1685093133,'Firefox','Windows'),(147,'64707d64272f4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1685093732,'Firefox','Windows'),(148,'64707d74d7a01','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1685093748,'Firefox','Windows'),(149,'64708087e1a20','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1685094535,'Firefox','Windows'),(150,'647080a2d440d','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1685094562,'Firefox','Windows'),(151,'64750b62778f4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1685392226,'Firefox','Windows'),(152,'647dfaae9394b','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1685977774,'Firefox','Windows'),(153,'647dfb6025431','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1685977952,'Firefox','Windows'),(154,'647dfc4e9c279','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1685978190,'Firefox','Windows'),(155,'647dfc80e2a0a','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',4,1685978240,'Firefox','Windows'),(156,'647dfd1df1462','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',6,1685978397,'Firefox','Windows'),(157,'647dfee6395de','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0',1,1685978854,'Firefox','Windows'),(158,'6487295f16be8','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0',1,1686579551,'Firefox','Windows');
/*!40000 ALTER TABLE `user_visit_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-12 15:32:47
