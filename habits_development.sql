-- MySQL dump 10.13  Distrib 5.7.42, for osx10.18 (x86_64)
--
-- Host: localhost    Database: habits_development
-- ------------------------------------------------------
-- Server version	5.7.42

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
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `record_type` varchar(191) NOT NULL,
  `record_id` bigint(20) NOT NULL,
  `blob_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(191) NOT NULL,
  `filename` varchar(191) NOT NULL,
  `content_type` varchar(191) DEFAULT NULL,
  `metadata` text,
  `byte_size` bigint(20) NOT NULL,
  `checksum` varchar(191) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_blobs`
--

LOCK TABLES `active_storage_blobs` WRITE;
/*!40000 ALTER TABLE `active_storage_blobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_storage_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(191) NOT NULL,
  `value` varchar(191) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2023-05-03 21:57:13.810549','2023-05-03 21:57:13.810549');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habits`
--

DROP TABLE IF EXISTS `habits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(191) NOT NULL,
  `content` varchar(191) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `exp_sum` int(11) DEFAULT '0',
  `level` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_habits_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_541267aaf9` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habits`
--

LOCK TABLES `habits` WRITE;
/*!40000 ALTER TABLE `habits` DISABLE KEYS */;
INSERT INTO `habits` VALUES (2,'Ruby Silver勉強','5月以内に資格を取得する。\r\n合計50時間。\r\n週15時間。\r\n平日朝1.5時間。\r\n休みに7.5時間。','2023-05-06 08:14:14.823772','2023-05-25 09:30:21.993815',1,17,3);
/*!40000 ALTER TABLE `habits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `record_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_likes_on_user_id_and_record_id` (`user_id`,`record_id`),
  KEY `index_likes_on_user_id` (`user_id`),
  KEY `index_likes_on_record_id` (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `records`
--

DROP TABLE IF EXISTS `records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `text` varchar(191) NOT NULL,
  `habit_id` bigint(20) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `exp` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_records_on_habit_id` (`habit_id`),
  KEY `index_records_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_9ba3ba9afc` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `records`
--

LOCK TABLES `records` WRITE;
/*!40000 ALTER TABLE `records` DISABLE KEYS */;
INSERT INTO `records` VALUES (2,'初日。過去問を50問といて、答え合わせと内容の確認。\r\nヒアドキュメント（複数行の文字列をプログラムに組み込む）\r\n可変長引数（任意の引数の数が入れられる）\r\nEnumerable（配列などのメソッド）\r\n配列の細かい呼び出し方（ドットとカンマの違い）\r\n各メソッド（select,find,count,even?,map,replace）',2,'2023-05-07 09:33:20.039512','2023-05-07 09:33:20.039512',1,1),(3,'Rubyのクラス断層。BasicObjectクラスがすべてのクラスの元となっている。オブジェクトを操作するようなメソッドが含まれている。\r\nObjectクラス演算子など基本的なメソッドが含まれている。\r\n\r\nIOクラス。入出力を行うクラス。\r\nFileクラス。ファイルに特化した入出力を行う。\r\n\r\nUTF-8はRubyのデフォルトエンコード',2,'2023-05-08 12:05:46.818841','2023-05-08 20:32:49.881823',1,1),(4,'例外処理　beginからrescueまでの処理に指定したエラーがあった場合、ブロックの処理がされる。\r\n実行される論理演算子　true &&、　false ||\r\n**数値　累乗と指数は先に処理される\r\nメソッド　split：区切り文字と要素数　chr：ASCII数値等をを文字列にエンコードする、引数にエンコードする文字コードの種類を指定できる。',2,'2023-05-09 10:06:28.702092','2023-05-09 12:07:19.083553',1,1),(5,'',2,'2023-05-10 09:07:59.660789','2023-05-10 09:07:59.660789',1,1),(6,'rescueメソッド　後にエラーを代入する。\r\nraiseメソッド　エラーを意図的に例外を発生させる。',2,'2023-05-11 12:12:34.698523','2023-05-11 20:31:44.928607',1,1),(7,'',2,'2023-05-12 10:38:17.111611','2023-05-12 10:38:17.111611',1,1),(8,'',2,'2023-05-13 12:01:55.908955','2023-05-13 12:01:55.908955',1,1),(9,'',2,'2023-05-14 10:10:19.452214','2023-05-14 10:10:19.452214',1,1),(10,'',2,'2023-05-15 09:47:56.509997','2023-05-15 09:47:56.509997',1,1),(11,'',2,'2023-05-16 09:38:27.321028','2023-05-16 09:38:27.321028',1,1),(12,'',2,'2023-05-17 11:57:36.390774','2023-05-17 11:57:36.390774',1,1),(13,'',2,'2023-05-18 09:04:09.049681','2023-05-18 09:04:09.049681',1,1),(14,'',2,'2023-05-20 12:31:58.345838','2023-05-20 12:31:58.345838',1,1),(15,'',2,'2023-05-21 12:12:45.607138','2023-05-21 12:12:45.607138',1,1),(16,'',2,'2023-05-22 09:32:36.349662','2023-05-22 09:32:36.349662',1,1),(17,'',2,'2023-05-23 12:29:23.825749','2023-05-23 12:29:23.825749',1,1),(18,'',2,'2023-05-25 09:30:21.896174','2023-05-25 09:30:21.896174',1,1);
/*!40000 ALTER TABLE `records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(191) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20210914054832'),('20210916214512'),('20211002115330'),('20211002222716'),('20211005123502'),('20211005130853'),('20211019235750'),('20211020000053'),('20211020000153'),('20211026070150');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL DEFAULT '',
  `encrypted_password` varchar(191) NOT NULL DEFAULT '',
  `reset_password_token` varchar(191) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'kengo','test@test','$2a$12$wr9gvYKypdVuMVic/bPCgOMUNhlmrOIFRY8QNE0BNHhuCE1ONuROG',NULL,NULL,NULL,'2023-05-03 22:00:09.556590','2023-05-03 22:00:09.556590');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-11 16:29:14
