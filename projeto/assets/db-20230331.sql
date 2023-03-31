-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db
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
  `Lote_idLote` int(11) NOT NULL,
  `Armazem` varchar(45) DEFAULT NULL,
  `Cor_idCor` int(11) NOT NULL,
  `Tamanho_idtamanho` int(11) NOT NULL,
  `Categoria_idcategoria` int(11) NOT NULL,
  `Genero_idGenero` int(11) NOT NULL,
  `Marca_idMarca` int(11) NOT NULL,
  `Fornecedor_idFornecedor` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artigo`
--

LOCK TABLES `artigo` WRITE;
/*!40000 ALTER TABLE `artigo` DISABLE KEYS */;
INSERT INTO `artigo` VALUES (2,'11','123','0000-00-00',3,'1',1,12,1,2,1,1,123),(4,'15','100000000','2023-03-29',2,'12',3,4,1,1,2,3,2),(5,'100','1','2023-02-28',2,'1',2,2,1,2,1,3,1283);
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
  `Nome` varchar(45) DEFAULT NULL,
  `Composicao` varchar(100) DEFAULT NULL,
  `PrecoCusto` varchar(45) DEFAULT NULL,
  `PrecoVenda` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ReferenciaBase`),
  UNIQUE KEY `ReferenciaBase_UNIQUE` (`ReferenciaBase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artigobase`
--

LOCK TABLES `artigobase` WRITE;
/*!40000 ALTER TABLE `artigobase` DISABLE KEYS */;
INSERT INTO `artigobase` VALUES (2,'TshirtNike','Poliester','10','20'),(123,'Casaco','Algodao','10','20'),(1283,'TshirtAdidas','Poliester','20','25');
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
INSERT INTO `auth_assignment` VALUES ('Admin',3,1679435997);
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
INSERT INTO `auth_item` VALUES ('/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//controller',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//crud',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//extension',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//form',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//model',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('//module',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/asset/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/asset/compress',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/asset/template',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/cache/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/cache/flush',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/cache/flush-all',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/cache/flush-schema',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/cache/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/fixture/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/fixture/load',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/fixture/unload',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/default/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/default/action',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/default/diff',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/default/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/default/preview',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/gii/default/view',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/hello/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/hello/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/help/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/help/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/message/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/message/config',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/message/extract',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/create',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/down',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/history',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/mark',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/new',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/redo',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/to',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/migrate/up',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/bulk-activate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/bulk-deactivate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/bulk-delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/create',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/grid-page-size',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/grid-sort',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/toggle-attribute',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/update',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth-item-group/view',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/captcha',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/change-own-password',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/confirm-email',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/confirm-email-receive',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/confirm-registration-email',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/login',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/logout',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/password-recovery',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/password-recovery-receive',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/auth/registration',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/bulk-activate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/bulk-deactivate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/bulk-delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/create',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/grid-page-size',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/grid-sort',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/refresh-routes',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/set-child-permissions',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/set-child-routes',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/toggle-attribute',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/update',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/permission/view',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/bulk-activate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/bulk-deactivate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/bulk-delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/create',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/grid-page-size',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/grid-sort',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/set-child-permissions',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/set-child-roles',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/toggle-attribute',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/update',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/role/view',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-permission/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-permission/set',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-permission/set-roles',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/bulk-activate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/bulk-deactivate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/bulk-delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/create',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/grid-page-size',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/grid-sort',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/toggle-attribute',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/update',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user-visit-log/view',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/*',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/bulk-activate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/bulk-deactivate',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/bulk-delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/change-password',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/create',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/delete',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/grid-page-size',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/grid-sort',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/index',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/toggle-attribute',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/update',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('/user-management/user/view',3,NULL,NULL,NULL,1426062189,1426062189,NULL),('Admin',1,'Admin',NULL,NULL,1426062189,1426062189,NULL),('assignRolesToUsers',2,'Assign roles to users',NULL,NULL,1426062189,1426062189,'userManagement'),('bindUserToIp',2,'Bind user to IP',NULL,NULL,1426062189,1426062189,'userManagement'),('changeOwnPassword',2,'Change own password',NULL,NULL,1426062189,1426062189,'userCommonPermissions'),('changeUserPassword',2,'Change user password',NULL,NULL,1426062189,1426062189,'userManagement'),('commonPermission',2,'Common permission',NULL,NULL,1426062188,1426062188,NULL),('createUsers',2,'Create users',NULL,NULL,1426062189,1426062189,'userManagement'),('deleteUsers',2,'Delete users',NULL,NULL,1426062189,1426062189,'userManagement'),('editUserEmail',2,'Edit user email',NULL,NULL,1426062189,1426062189,'userManagement'),('editUsers',2,'Edit users',NULL,NULL,1426062189,1426062189,'userManagement'),('viewRegistrationIp',2,'View registration IP',NULL,NULL,1426062189,1426062189,'userManagement'),('viewUserEmail',2,'View user email',NULL,NULL,1426062189,1426062189,'userManagement'),('viewUserRoles',2,'View user roles',NULL,NULL,1426062189,1426062189,'userManagement'),('viewUsers',2,'View users',NULL,NULL,1426062189,1426062189,'userManagement'),('viewVisitLog',2,'View visit log',NULL,NULL,1426062189,1426062189,'userManagement');
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
INSERT INTO `auth_item_child` VALUES ('Admin','assignRolesToUsers'),('Admin','changeOwnPassword'),('Admin','changeUserPassword'),('Admin','createUsers'),('Admin','deleteUsers'),('Admin','editUsers'),('Admin','viewUsers'),('assignRolesToUsers','/user-management/user-permission/set'),('assignRolesToUsers','/user-management/user-permission/set-roles'),('assignRolesToUsers','viewUserRoles'),('assignRolesToUsers','viewUsers'),('changeOwnPassword','/user-management/auth/change-own-password'),('changeUserPassword','/user-management/user/change-password'),('changeUserPassword','viewUsers'),('createUsers','/user-management/user/create'),('createUsers','viewUsers'),('deleteUsers','/user-management/user/bulk-delete'),('deleteUsers','/user-management/user/delete'),('deleteUsers','viewUsers'),('editUserEmail','viewUserEmail'),('editUsers','/user-management/user/bulk-activate'),('editUsers','/user-management/user/bulk-deactivate'),('editUsers','/user-management/user/update'),('editUsers','viewUsers'),('viewUsers','/user-management/user/grid-page-size'),('viewUsers','/user-management/user/index'),('viewUsers','/user-management/user/view'),('viewVisitLog','/user-management/user-visit-log/grid-page-size'),('viewVisitLog','/user-management/user-visit-log/index'),('viewVisitLog','/user-management/user-visit-log/view');
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
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `NomeFornecedor_UNIQUE` (`NomeFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES (1,'Adidas'),(3,'Nike');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lote`
--

LOCK TABLES `lote` WRITE;
/*!40000 ALTER TABLE `lote` DISABLE KEYS */;
INSERT INTO `lote` VALUES (2,'T-shirts','tshirt',1),(3,'Casacos','Casacos',1);
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
  PRIMARY KEY (`idMarca`),
  UNIQUE KEY `NomeMarca_UNIQUE` (`NomeMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (1,'Adidas'),(2,'Nike');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamanho`
--

DROP TABLE IF EXISTS `tamanho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamanho` (
  `idtamanho` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTamanho` varchar(45) NOT NULL,
  `CTamanho` varchar(45) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'superadmin','kz2px152FAWlkHbkZoCiXgBAd-S8SSjF','$2y$13$MhlYe12xkGFnSeK0sO2up.Y9kAD9Ct6JS1i9VLP7YAqd1dFsSylz2',NULL,1,1,1426062188,1426062188,NULL,NULL,NULL,0),(3,'leonel','3eIs0zeAiEeWD5dDsQevn_t4UJ67zrMF','$2y$13$vB4/7RZ5phUm.VhWaiuoVOmICUh/XNtaHxlw2fHg7nySb9G.WWME.',NULL,1,0,1673821372,1673821372,'::1','','lalt2002@gmail.com',0),(4,'leo','jy4Jt6nHO3bZ_aJCeRnNgsP6zIY8lCjw','$2y$13$/c6d5DUS1hUwDX9wWr3YN.rbbyYzGHAXL8e3rZmBx4yvpyupJiBm6',NULL,1,0,1677709322,1677709322,'::1','',NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_visit_log`
--

LOCK TABLES `user_visit_log` WRITE;
/*!40000 ALTER TABLE `user_visit_log` DISABLE KEYS */;
INSERT INTO `user_visit_log` VALUES (1,'63b6035a6efcf','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1672872794,'Firefox','Windows'),(2,'63b603d335c7e','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1672872915,'Firefox','Windows'),(3,'63b6050c5e45e','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1672873228,'Firefox','Windows'),(4,'63b6051ed5616','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1672873246,'Firefox','Windows'),(5,'63b80faa14a5e','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673007018,'Firefox','Windows'),(6,'63b8102756897','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673007143,'Firefox','Windows'),(7,'63b81178a999b','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673007480,'Firefox','Windows'),(8,'63b814e4461d3','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673008356,'Firefox','Windows'),(9,'63b8154a7d463','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673008458,'Firefox','Windows'),(10,'63bd7c566e81f','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673362518,'Firefox','Windows'),(11,'63c479fad97c2','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673820666,'Firefox','Windows'),(12,'63c47ccf7dff4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',3,1673821391,'Firefox','Windows'),(13,'63c47ceab4d5a','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',1,1673821418,'Firefox','Windows'),(14,'63c484ab990e7','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0',3,1673823403,'Firefox','Windows'),(15,'63d302b07bb8b','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674773168,'Firefox','Windows'),(16,'63d303b81cb9e','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',1,1674773432,'Firefox','Windows'),(17,'63d3042f54928','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674773551,'Firefox','Windows'),(18,'63d3045e1b1e3','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674773598,'Firefox','Windows'),(19,'63d3048209501','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',1,1674773634,'Firefox','Windows'),(20,'63d3a7d0704ce','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',1,1674815440,'Firefox','Windows'),(21,'63d3a8a5150b4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674815653,'Firefox','Windows'),(22,'63d3a8aae02f4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674815658,'Firefox','Windows'),(23,'63d3a8bb510ef','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',1,1674815675,'Firefox','Windows'),(24,'63d3a9db9933a','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674815963,'Firefox','Windows'),(25,'63d3aa0e325bc','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674816014,'Firefox','Windows'),(26,'63d3aa20682f4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674816032,'Firefox','Windows'),(27,'63d3aab3b1b7b','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674816179,'Firefox','Windows'),(28,'63d3aaeae2309','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1674816234,'Firefox','Windows'),(29,'63dbd28b86cde','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',3,1675350667,'Firefox','Windows'),(30,'63dfcea0e47bd','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0',1,1675611808,'Firefox','Windows'),(31,'63f7e2da8fd38','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1677189850,'Firefox','Windows'),(32,'63ffcff253a79','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1677709298,'Firefox','Windows'),(33,'63ffd00a0a2e2','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',4,1677709322,'Firefox','Windows'),(34,'63ffd0151380e','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',4,1677709333,'Firefox','Windows'),(35,'64012fecee0f3','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1677799404,'Firefox','Windows'),(36,'64065f8182b69','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1678139265,'Firefox','Windows'),(37,'64066009500fc','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',1,1678139401,'Firefox','Windows'),(38,'640660fa7d7db','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1678139642,'Firefox','Windows'),(39,'640661159101b','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',1,1678139669,'Firefox','Windows'),(40,'6408ccdf2cd71','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1678298335,'Firefox','Windows'),(41,'6408cd5153859','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',1,1678298449,'Firefox','Windows'),(42,'640e57dc9e0e0','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',3,1678661596,'Firefox','Windows'),(43,'640e57f00f0d4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',1,1678661616,'Firefox','Windows'),(44,'640f803da18cf','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0',1,1678737469,'Firefox','Windows'),(45,'64143eaa56283','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1679048362,'Firefox','Windows'),(46,'641a284bb2749','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1679435851,'Firefox','Windows'),(47,'641a28a87f007','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',3,1679435944,'Firefox','Windows'),(48,'641a28b29d663','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1679435954,'Firefox','Windows'),(49,'641a28ec16df4','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',3,1679436012,'Firefox','Windows'),(50,'641a29347d686','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1679436084,'Firefox','Windows'),(51,'641cc745952eb','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1679607621,'Firefox','Windows'),(52,'641d7ae85d5a6','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1679653608,'Firefox','Windows'),(53,'64233672b84ac','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680029298,'Firefox','Windows'),(54,'6423552c0f6b7','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680037164,'Firefox','Windows'),(55,'6424565412a89','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680102996,'Firefox','Windows'),(56,'6424a52843620','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680123176,'Firefox','Windows'),(57,'642603faabc3d','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680212986,'Firefox','Windows'),(58,'642619554b046','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680218453,'Firefox','Windows'),(59,'642619f44c510','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680218612,'Firefox','Windows'),(60,'6426ab98e2b59','::1','pt','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0',1,1680255896,'Firefox','Windows');
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

-- Dump completed on 2023-03-31 10:46:44
