-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.30 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para tasksolutic
CREATE DATABASE IF NOT EXISTS `tasksolutic` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tasksolutic`;

-- Copiando estrutura para tabela tasksolutic.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela tasksolutic.auth_group: ~0 rows (aproximadamente)
DELETE FROM `auth_group`;

-- Copiando estrutura para tabela tasksolutic.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela tasksolutic.auth_group_permissions: ~0 rows (aproximadamente)
DELETE FROM `auth_group_permissions`;

-- Copiando estrutura para tabela tasksolutic.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela tasksolutic.auth_permission: ~24 rows (aproximadamente)
DELETE FROM `auth_permission`;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add customer', 7, 'add_customer'),
	(26, 'Can change customer', 7, 'change_customer'),
	(27, 'Can delete customer', 7, 'delete_customer'),
	(28, 'Can view customer', 7, 'view_customer');

-- Copiando estrutura para tabela tasksolutic.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela tasksolutic.auth_user: ~0 rows (aproximadamente)
DELETE FROM `auth_user`;

-- Copiando estrutura para tabela tasksolutic.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela tasksolutic.auth_user_groups: ~0 rows (aproximadamente)
DELETE FROM `auth_user_groups`;

-- Copiando estrutura para tabela tasksolutic.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela tasksolutic.auth_user_user_permissions: ~0 rows (aproximadamente)
DELETE FROM `auth_user_user_permissions`;

-- Copiando estrutura para tabela tasksolutic.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela tasksolutic.django_admin_log: ~0 rows (aproximadamente)
DELETE FROM `django_admin_log`;

-- Copiando estrutura para tabela tasksolutic.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela tasksolutic.django_content_type: ~6 rows (aproximadamente)
DELETE FROM `django_content_type`;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session'),
	(7, 'TaskApp', 'customer');

-- Copiando estrutura para tabela tasksolutic.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela tasksolutic.django_migrations: ~5 rows (aproximadamente)
DELETE FROM `django_migrations`;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2024-10-20 16:33:00.504246'),
	(2, 'auth', '0001_initial', '2024-10-20 16:33:02.773476'),
	(3, 'admin', '0001_initial', '2024-10-20 16:33:03.246409'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2024-10-20 16:33:03.261476'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-10-20 16:33:03.274143'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2024-10-20 16:33:03.487805'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2024-10-20 16:33:03.653689'),
	(8, 'auth', '0003_alter_user_email_max_length', '2024-10-20 16:33:03.692967'),
	(9, 'auth', '0004_alter_user_username_opts', '2024-10-20 16:33:03.703158'),
	(10, 'auth', '0005_alter_user_last_login_null', '2024-10-20 16:33:03.853577'),
	(11, 'auth', '0006_require_contenttypes_0002', '2024-10-20 16:33:03.859155'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2024-10-20 16:33:03.868650'),
	(13, 'auth', '0008_alter_user_username_max_length', '2024-10-20 16:33:04.033157'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2024-10-20 16:33:04.211548'),
	(15, 'auth', '0010_alter_group_name_max_length', '2024-10-20 16:33:04.241509'),
	(16, 'auth', '0011_update_proxy_permissions', '2024-10-20 16:33:04.252086'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2024-10-20 16:33:04.409529'),
	(18, 'sessions', '0001_initial', '2024-10-20 16:33:04.757723'),
	(19, 'TaskApp', '0001_initial', '2024-10-20 17:21:55.673540');

-- Copiando estrutura para tabela tasksolutic.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela tasksolutic.django_session: ~0 rows (aproximadamente)
DELETE FROM `django_session`;

-- Copiando estrutura para tabela tasksolutic.taskapp_customer
CREATE TABLE IF NOT EXISTS `taskapp_customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela tasksolutic.taskapp_customer: ~0 rows (aproximadamente)
DELETE FROM `taskapp_customer`;
INSERT INTO `taskapp_customer` (`id`, `name`, `address`, `email`, `phone`, `date_created`) VALUES
	(1, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(2, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(3, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(4, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(5, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(6, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(7, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(8, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(9, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(10, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(11, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(12, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(13, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(14, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(15, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(16, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(17, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(18, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(19, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(20, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(21, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(22, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(23, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(24, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(25, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(26, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(27, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(28, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(29, 'fabricio', 'rua godofredo silva 216 casa 2 - vila kosmos - rio de janeiro - rj', 'fabricio@gmail.com', '21979574825', '2024-10-20 00:00:00.000000'),
	(30, 'FABRICIO', 'FREIRE CARDOSO ', 'TESTANDO@TESTE.COM', '21979574825', '2024-10-20 23:29:27.351598'),
	(31, 'FABRICIO', 'FREIRE CARDOSO ', 'TESTANDO@TESTE.COM', '21979574825', '2024-10-20 23:31:28.296777'),
	(32, 'TUTUZINHO', 'FREIRE CARDOSO 45', 'TESTANDO@TESTE.COM', '21979574825', '2024-10-20 23:32:47.493793'),
	(33, 'TUTUZINHO', 'FREIRE CARDOSO 45', 'TESTANDO@TESTE.COM', '21979574825', '2024-10-20 23:35:07.321784'),
	(34, 'TUTUZINHO', 'FREIRE CARDOSO 45', 'TESTANDO@TESTE.COM', '21979574825', '2024-10-20 23:41:39.522139'),
	(35, 'TUTUZINHO', 'FREIRE CARDOSO 45', 'TESTANDO@TESTE.COM', '21979574825', '2024-10-21 01:21:04.832020'),
	(36, 'NICOLE KITCHU', 'PENHA', 'KITCHULE@POKEROCKET.COM', '(98) 31982-0184', '2024-10-21 01:24:49.637342'),
	(37, 'TESTE@TESTE.COM', 'TESTE@TESTE.COM', 'TESTE@TESTE.COM', '(22) 22222-2222', '2024-10-21 10:21:44.087037');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
