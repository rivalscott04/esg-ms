/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL MYSQL
 Source Server Type    : MySQL
 Source Server Version : 80100
 Source Host           : localhost:3306
 Source Schema         : voters

 Target Server Type    : MySQL
 Target Server Version : 80100
 File Encoding         : 65001

 Date: 05/10/2023 21:55:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dapil
-- ----------------------------
DROP TABLE IF EXISTS `dapil`;
CREATE TABLE `dapil` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `jenis_pendaftaran` enum('DPR RI','DPRD Provinsi','DPRD Kabupaten/Kota') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of dapil
-- ----------------------------
BEGIN;
INSERT INTO `dapil` VALUES ('9a0530f8-6877-43ad-9da9-8d41492decc4', 'NTB 1', '2023-08-31 09:34:31', '2023-08-31 09:34:31', 'DPRD Provinsi');
INSERT INTO `dapil` VALUES ('9a053189-b755-43f6-a049-216758bee691', 'NTB 2', '2023-08-31 09:36:06', '2023-08-31 09:36:06', 'DPRD Provinsi');
INSERT INTO `dapil` VALUES ('9a0535f1-38df-4bdb-ba44-7b33cc7ef5ed', 'Nusa Tenggara Barat I', '2023-08-31 09:48:25', '2023-09-01 04:33:30', 'DPR RI');
INSERT INTO `dapil` VALUES ('9a053a0e-4507-4ce2-945d-2bd0b075f5b6', 'Nusa Tenggara Barat II', '2023-08-31 09:59:55', '2023-08-31 10:22:45', 'DPR RI');
INSERT INTO `dapil` VALUES ('9a05414f-6b5c-4e18-ba35-0e21c74d2416', 'Dapil 1', '2023-08-31 10:20:12', '2023-08-31 10:20:12', 'DPRD Kabupaten/Kota');
INSERT INTO `dapil` VALUES ('9a06c938-9f1e-42c9-86ce-2c899caf515c', 'Dapil 2', '2023-09-01 04:36:04', '2023-09-01 04:36:04', 'DPRD Kabupaten/Kota');
COMMIT;

-- ----------------------------
-- Table structure for dapil_area
-- ----------------------------
DROP TABLE IF EXISTS `dapil_area`;
CREATE TABLE `dapil_area` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `dapil_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kabupaten_kota_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kecamatan_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kelurahan_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dapil_area_dapil_id_foreign` (`dapil_id`),
  KEY `dapil_area_kabupaten_kota_id_foreign` (`kabupaten_kota_id`),
  KEY `dapil_area_kecamatan_id_foreign` (`kecamatan_id`),
  KEY `dapil_area_kelurahan_id_foreign` (`kelurahan_id`),
  CONSTRAINT `dapil_area_dapil_id_foreign` FOREIGN KEY (`dapil_id`) REFERENCES `dapil` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dapil_area_kabupaten_kota_id_foreign` FOREIGN KEY (`kabupaten_kota_id`) REFERENCES `kabupaten_kota` (`id`),
  CONSTRAINT `dapil_area_kecamatan_id_foreign` FOREIGN KEY (`kecamatan_id`) REFERENCES `kecamatan` (`id`),
  CONSTRAINT `dapil_area_kelurahan_id_foreign` FOREIGN KEY (`kelurahan_id`) REFERENCES `kelurahan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of dapil_area
-- ----------------------------
BEGIN;
INSERT INTO `dapil_area` VALUES ('25bdddfe-47db-11ee-9d07-274e137307ca', '9a0535f1-38df-4bdb-ba44-7b33cc7ef5ed', '0d37c534-3f01-11ee-9d07-274e137307ca', NULL, NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('25bdfa32-47db-11ee-9d07-274e137307ca', '9a0535f1-38df-4bdb-ba44-7b33cc7ef5ed', '0d37c7fa-3f01-11ee-9d07-274e137307ca', NULL, NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('25bdfec4-47db-11ee-9d07-274e137307ca', '9a0535f1-38df-4bdb-ba44-7b33cc7ef5ed', '0d37c8c2-3f01-11ee-9d07-274e137307ca', NULL, NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('25be01f8-47db-11ee-9d07-274e137307ca', '9a0535f1-38df-4bdb-ba44-7b33cc7ef5ed', '0d37c980-3f01-11ee-9d07-274e137307ca', NULL, NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('25be0504-47db-11ee-9d07-274e137307ca', '9a0535f1-38df-4bdb-ba44-7b33cc7ef5ed', '0d37ca3e-3f01-11ee-9d07-274e137307ca', NULL, NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('348acb32-47d9-11ee-9d07-274e137307ca', '9a0530f8-6877-43ad-9da9-8d41492decc4', '0d37bcf6-3f01-11ee-9d07-274e137307ca', NULL, NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('6d4db6aa-47d9-11ee-9d07-274e137307ca', '9a053189-b755-43f6-a049-216758bee691', '0d37c44e-3f01-11ee-9d07-274e137307ca', NULL, NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('96899024-47df-11ee-9d07-274e137307ca', '9a05414f-6b5c-4e18-ba35-0e21c74d2416', NULL, 'd995246a-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('968996e6-47df-11ee-9d07-274e137307ca', '9a05414f-6b5c-4e18-ba35-0e21c74d2416', NULL, 'd995262c-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('9689989e-47df-11ee-9d07-274e137307ca', '9a05414f-6b5c-4e18-ba35-0e21c74d2416', NULL, 'd99526fe-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('9689a38e-47df-11ee-9d07-274e137307ca', '9a05414f-6b5c-4e18-ba35-0e21c74d2416', NULL, 'd99527bc-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('9689a5b4-47df-11ee-9d07-274e137307ca', '9a05414f-6b5c-4e18-ba35-0e21c74d2416', NULL, 'd99528ca-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('aa3b65a8-47d9-11ee-9d07-274e137307ca', '9a053189-b755-43f6-a049-216758bee691', '0d37c61a-3f01-11ee-9d07-274e137307ca', NULL, NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('ada14ff6-4878-11ee-9d07-274e137307ca', '9a06c938-9f1e-42c9-86ce-2c899caf515c', NULL, 'd99529f6-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('ada1a83e-4878-11ee-9d07-274e137307ca', '9a06c938-9f1e-42c9-86ce-2c899caf515c', NULL, 'd9952aaa-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('ada1b356-4878-11ee-9d07-274e137307ca', '9a06c938-9f1e-42c9-86ce-2c899caf515c', NULL, 'd9952b54-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('ada1b9aa-4878-11ee-9d07-274e137307ca', '9a06c938-9f1e-42c9-86ce-2c899caf515c', NULL, 'd9952bfe-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('ada1bdc4-4878-11ee-9d07-274e137307ca', '9a06c938-9f1e-42c9-86ce-2c899caf515c', NULL, 'd9952c9e-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('ada1cd6e-4878-11ee-9d07-274e137307ca', '9a06c938-9f1e-42c9-86ce-2c899caf515c', NULL, 'd9952d48-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('ada1e3c6-4878-11ee-9d07-274e137307ca', '9a06c938-9f1e-42c9-86ce-2c899caf515c', NULL, 'd9952e56-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('ada1f456-4878-11ee-9d07-274e137307ca', '9a06c938-9f1e-42c9-86ce-2c899caf515c', NULL, 'd9952f00-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('ada1f88e-4878-11ee-9d07-274e137307ca', '9a06c938-9f1e-42c9-86ce-2c899caf515c', NULL, 'd9952faa-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('c11614d2-47dc-11ee-9d07-274e137307ca', '9a053a0e-4507-4ce2-945d-2bd0b075f5b6', '0d37c282-3f01-11ee-9d07-274e137307ca', NULL, NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('c11629e0-47dc-11ee-9d07-274e137307ca', '9a053a0e-4507-4ce2-945d-2bd0b075f5b6', '0d37c732-3f01-11ee-9d07-274e137307ca', NULL, NULL, NULL, NULL);
INSERT INTO `dapil_area` VALUES ('c69c3762-47df-11ee-9d07-274e137307ca', '9a05414f-6b5c-4e18-ba35-0e21c74d2416', NULL, 'd9950fca-3f05-11ee-9d07-274e137307ca', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of events
-- ----------------------------
BEGIN;
INSERT INTO `events` VALUES ('86e6a8d6-3f16-11ee-9d07-274e137307ca', 'PILEGKADA', '2024-02-01', '2023-08-20 05:00:48', '2023-09-15 20:05:08', 1);
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of groups
-- ----------------------------
BEGIN;
INSERT INTO `groups` VALUES ('c5ae5310-3f1c-11ee-9d07-274e137307ca', 'Identitas Responden', '2023-08-20 05:45:30', '2023-08-20 05:45:30');
INSERT INTO `groups` VALUES ('ec6679ce-3f1c-11ee-9d07-274e137307ca', 'Pandangan Politik', '2023-08-20 05:46:35', '2023-08-20 05:47:42');
COMMIT;

-- ----------------------------
-- Table structure for hitung_suara
-- ----------------------------
DROP TABLE IF EXISTS `hitung_suara`;
CREATE TABLE `hitung_suara` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `tps_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jml_surat_suara` int DEFAULT NULL,
  `jml_suara_sah` int DEFAULT NULL,
  `jml_tidak_sah` int DEFAULT NULL,
  `jml_tidak_terpakai` int DEFAULT NULL,
  `jml_suara` int DEFAULT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penugasan_area_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hitung_suara_tps_id_foreign` (`tps_id`),
  KEY `hitung_suara_user_id_foreign` (`user_id`),
  KEY `hitung_suara_event_id_foreign` (`event_id`),
  KEY `hitung_suara_penugasan_area_id_foreign` (`penugasan_area_id`),
  CONSTRAINT `hitung_suara_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `hitung_suara_penugasan_area_id_foreign` FOREIGN KEY (`penugasan_area_id`) REFERENCES `penugasan_area` (`id`),
  CONSTRAINT `hitung_suara_tps_id_foreign` FOREIGN KEY (`tps_id`) REFERENCES `tps` (`id`),
  CONSTRAINT `hitung_suara_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of hitung_suara
-- ----------------------------
BEGIN;
INSERT INTO `hitung_suara` VALUES ('9a4be022-e6e9-4054-80a9-aac4e1d679a4', '9a4bde69-c78b-4b71-b629-0c5d6d7b900d', 1000, 900, 100, 100, 500, 'c065919d-c0f9-4b49-8c21-91084f0881aa', '2023-10-05 18:52:16', '2023-10-05 18:52:16', '86e6a8d6-3f16-11ee-9d07-274e137307ca', '15eeb5be-6375-11ee-926a-453a53f2c502');
INSERT INTO `hitung_suara` VALUES ('9a4be057-e351-4b77-a46a-ee338958c699', '9a4bc8be-1790-465f-95a1-b757f43e4f83', 800, 700, 50, 50, 650, 'c065919d-c0f9-4b49-8c21-91084f0881aa', '2023-10-05 18:52:50', '2023-10-05 18:52:50', '86e6a8d6-3f16-11ee-9d07-274e137307ca', '96e4fba0-636c-11ee-926a-453a53f2c502');
COMMIT;

-- ----------------------------
-- Table structure for jawaban
-- ----------------------------
DROP TABLE IF EXISTS `jawaban`;
CREATE TABLE `jawaban` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bobot` tinyint NOT NULL,
  `with_input` tinyint(1) NOT NULL DEFAULT '0',
  `pertanyaan_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jawaban_pertanyaan_id_foreign` (`pertanyaan_id`),
  CONSTRAINT `jawaban_pertanyaan_id_foreign` FOREIGN KEY (`pertanyaan_id`) REFERENCES `pertanyaan` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jawaban
-- ----------------------------
BEGIN;
INSERT INTO `jawaban` VALUES ('69668b20-3f2d-11ee-9d07-274e137307ca', 'Laki-Laki', 0, 0, '422896aa-3f2a-11ee-9d07-274e137307ca', '2023-08-20 07:44:36', '2023-08-20 07:44:36');
INSERT INTO `jawaban` VALUES ('723e08ea-3f2d-11ee-9d07-274e137307ca', 'Perempuan', 0, 0, '422896aa-3f2a-11ee-9d07-274e137307ca', '2023-08-20 07:44:51', '2023-08-20 07:44:51');
INSERT INTO `jawaban` VALUES ('9a26e83b-ec84-4022-891a-6d42762e4ad9', '17-20', 0, 0, '9a26e811-5cfb-4594-ab16-e434e9e6e683', '2023-09-17 09:49:16', '2023-09-17 09:49:16');
INSERT INTO `jawaban` VALUES ('9a26e85a-1a3f-4db1-8305-1e8c211f3331', '21-30', 0, 0, '9a26e811-5cfb-4594-ab16-e434e9e6e683', '2023-09-17 09:49:36', '2023-09-17 09:49:36');
INSERT INTO `jawaban` VALUES ('9a26e86f-7ae3-4187-8f4a-8cfaf637e471', '30-40', 0, 0, '9a26e811-5cfb-4594-ab16-e434e9e6e683', '2023-09-17 09:49:50', '2023-09-17 09:49:50');
INSERT INTO `jawaban` VALUES ('9a26e88f-adfc-49c0-9ef0-4f878c1ea3e1', 'Diatas 40', 0, 0, '9a26e811-5cfb-4594-ab16-e434e9e6e683', '2023-09-17 09:50:11', '2023-09-17 09:50:11');
INSERT INTO `jawaban` VALUES ('9a26e906-45d3-4784-89c7-c202bf70245d', 'Golkar', 0, 0, '9a26e8ec-84ec-4eba-a303-59b51f4d0738', '2023-09-17 09:51:29', '2023-09-17 09:51:29');
INSERT INTO `jawaban` VALUES ('9a26e91b-ef58-43d2-ad30-7f62a7c0fa59', 'Gerindra', 0, 0, '9a26e8ec-84ec-4eba-a303-59b51f4d0738', '2023-09-17 09:51:43', '2023-09-17 09:51:43');
INSERT INTO `jawaban` VALUES ('9a26e929-3b30-4cba-bbdb-27a94c4412f0', 'PDIP', 0, 0, '9a26e8ec-84ec-4eba-a303-59b51f4d0738', '2023-09-17 09:51:52', '2023-09-17 09:51:52');
INSERT INTO `jawaban` VALUES ('9a26e93a-b278-4103-86f5-5a8cf0c21350', 'PKB', 0, 0, '9a26e8ec-84ec-4eba-a303-59b51f4d0738', '2023-09-17 09:52:03', '2023-09-17 09:52:03');
INSERT INTO `jawaban` VALUES ('9a26e967-4aba-42a0-bbac-82b677e27f41', 'Demokrat', 0, 0, '9a26e8ec-84ec-4eba-a303-59b51f4d0738', '2023-09-17 09:52:32', '2023-09-17 09:52:32');
INSERT INTO `jawaban` VALUES ('9a26e97b-1bc7-428a-ab77-0ed384bca7b8', 'Lainnya', 0, 1, '9a26e8ec-84ec-4eba-a303-59b51f4d0738', '2023-09-17 09:52:45', '2023-09-17 09:52:45');
INSERT INTO `jawaban` VALUES ('9a26ea06-3ebf-4e45-b36e-714fa8736dc4', 'Iya', 1, 0, '9a26e9f1-862d-480c-9fc2-208b5eb2140a', '2023-09-17 09:54:17', '2023-09-17 09:54:17');
INSERT INTO `jawaban` VALUES ('9a26ea13-a7b0-48ad-8bf1-02c019084e4f', 'Tidak', 0, 0, '9a26e9f1-862d-480c-9fc2-208b5eb2140a', '2023-09-17 09:54:25', '2023-09-17 09:54:25');
INSERT INTO `jawaban` VALUES ('9a26ea7a-3d3c-4e73-b514-4f707c5b6adf', 'SD', 0, 0, '9a26ea67-3ab7-4e06-8cca-3e4b362c5eca', '2023-09-17 09:55:33', '2023-09-17 09:55:33');
INSERT INTO `jawaban` VALUES ('9a26ea86-35cc-4587-8bc8-999252e670b5', 'SMP', 0, 0, '9a26ea67-3ab7-4e06-8cca-3e4b362c5eca', '2023-09-17 09:55:40', '2023-09-17 09:55:40');
INSERT INTO `jawaban` VALUES ('9a26ea90-e1df-4ffd-9ab7-e0ead5edab5d', 'SMA', 0, 0, '9a26ea67-3ab7-4e06-8cca-3e4b362c5eca', '2023-09-17 09:55:47', '2023-09-17 09:55:47');
INSERT INTO `jawaban` VALUES ('9a26eaa7-a878-47af-8780-af2e5f387dcd', 'Diploma', 0, 0, '9a26ea67-3ab7-4e06-8cca-3e4b362c5eca', '2023-09-17 09:56:02', '2023-09-17 09:56:02');
INSERT INTO `jawaban` VALUES ('9a26eab5-430e-4db2-b8e5-001f23facbd5', 'Sarjana', 0, 0, '9a26ea67-3ab7-4e06-8cca-3e4b362c5eca', '2023-09-17 09:56:11', '2023-09-17 09:56:11');
INSERT INTO `jawaban` VALUES ('9a26eb46-89c8-4253-b986-b807d65af543', 'Iya', 1, 0, '9a26eb35-d18b-484b-855a-34642e5b4b50', '2023-09-17 09:57:47', '2023-09-17 09:57:47');
INSERT INTO `jawaban` VALUES ('9a26eb58-cfb7-44ab-9fc6-1f920a14fd2b', 'Tidak', 0, 0, '9a26eb35-d18b-484b-855a-34642e5b4b50', '2023-09-17 09:57:59', '2023-09-17 09:57:59');
INSERT INTO `jawaban` VALUES ('9a26ec62-5286-4807-9677-26fb21b4b016', 'Pendidikan', 0, 0, '9a26ec3b-3324-434f-9a54-3e3c594efe9f', '2023-09-17 10:00:53', '2023-09-17 10:00:53');
INSERT INTO `jawaban` VALUES ('9a26ec88-fc54-4ca4-ab68-487147a8d0f3', 'Issue Lingkungan', 0, 0, '9a26ec3b-3324-434f-9a54-3e3c594efe9f', '2023-09-17 10:01:18', '2023-09-17 10:01:18');
INSERT INTO `jawaban` VALUES ('9a26ecc0-9337-4179-853f-41a768b8e12a', 'Harga Bahan Pokok', 0, 0, '9a26ec3b-3324-434f-9a54-3e3c594efe9f', '2023-09-17 10:01:54', '2023-09-17 10:01:54');
INSERT INTO `jawaban` VALUES ('9a26ecd7-c374-431d-b711-8651a0a605a8', 'Perbaikan Infrastruktur', 0, 0, '9a26ec3b-3324-434f-9a54-3e3c594efe9f', '2023-09-17 10:02:09', '2023-09-17 10:02:09');
INSERT INTO `jawaban` VALUES ('9a26ecf8-7eb5-46bb-9480-9b63e6fd3c03', 'Fasilitas Umum', 0, 0, '9a26ec3b-3324-434f-9a54-3e3c594efe9f', '2023-09-17 10:02:31', '2023-09-17 10:02:31');
INSERT INTO `jawaban` VALUES ('9a26ed1b-6c71-4463-a6fd-1150704eda1f', 'Kemudahan Administrasi', 0, 0, '9a26ec3b-3324-434f-9a54-3e3c594efe9f', '2023-09-17 10:02:54', '2023-09-17 10:02:54');
INSERT INTO `jawaban` VALUES ('9a26ed32-2601-4877-8f07-c43ac114b590', 'Lainnya', 0, 1, '9a26ec3b-3324-434f-9a54-3e3c594efe9f', '2023-09-17 10:03:09', '2023-09-17 10:03:09');
COMMIT;

-- ----------------------------
-- Table structure for kabupaten_kota
-- ----------------------------
DROP TABLE IF EXISTS `kabupaten_kota`;
CREATE TABLE `kabupaten_kota` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of kabupaten_kota
-- ----------------------------
BEGIN;
INSERT INTO `kabupaten_kota` VALUES ('0d37bcf6-3f01-11ee-9d07-274e137307ca', 'Kota Mataram', '2023-08-20 10:27:04', '2023-08-20 10:27:04');
INSERT INTO `kabupaten_kota` VALUES ('0d37c282-3f01-11ee-9d07-274e137307ca', 'Kabupaten Lombok Timur', '2023-08-20 10:27:04', '2023-08-20 10:27:04');
INSERT INTO `kabupaten_kota` VALUES ('0d37c44e-3f01-11ee-9d07-274e137307ca', 'Kabupaten Lombok Barat', '2023-08-20 10:27:04', '2023-08-20 10:27:04');
INSERT INTO `kabupaten_kota` VALUES ('0d37c534-3f01-11ee-9d07-274e137307ca', 'Kabupaten Sumbawa', '2023-08-20 10:27:04', '2023-08-20 10:27:04');
INSERT INTO `kabupaten_kota` VALUES ('0d37c61a-3f01-11ee-9d07-274e137307ca', 'Kabupaten Lombok Utara', '2023-08-20 10:27:04', '2023-08-20 10:27:04');
INSERT INTO `kabupaten_kota` VALUES ('0d37c732-3f01-11ee-9d07-274e137307ca', 'Kabupaten Lombok Tengah', '2023-08-20 10:27:04', '2023-08-20 10:27:04');
INSERT INTO `kabupaten_kota` VALUES ('0d37c7fa-3f01-11ee-9d07-274e137307ca', 'Kabupaten Dompu', '2023-08-20 10:27:04', '2023-08-20 10:27:04');
INSERT INTO `kabupaten_kota` VALUES ('0d37c8c2-3f01-11ee-9d07-274e137307ca', 'Kabupaten Sumbawa Barat', '2023-08-20 10:27:04', '2023-08-20 10:27:04');
INSERT INTO `kabupaten_kota` VALUES ('0d37c980-3f01-11ee-9d07-274e137307ca', 'Kabupaten Bima', '2023-08-20 10:27:04', '2023-08-20 10:27:04');
INSERT INTO `kabupaten_kota` VALUES ('0d37ca3e-3f01-11ee-9d07-274e137307ca', 'Kota Bima', '2023-08-20 10:27:04', '2023-08-20 10:27:04');
COMMIT;

-- ----------------------------
-- Table structure for kecamatan
-- ----------------------------
DROP TABLE IF EXISTS `kecamatan`;
CREATE TABLE `kecamatan` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kabupaten_kota_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of kecamatan
-- ----------------------------
BEGIN;
INSERT INTO `kecamatan` VALUES ('d9950fca-3f05-11ee-9d07-274e137307ca', 'Ampenan', '0d37bcf6-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995246a-3f05-11ee-9d07-274e137307ca', 'Mataram', '0d37bcf6-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995262c-3f05-11ee-9d07-274e137307ca', 'Cakranegara', '0d37bcf6-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99526fe-3f05-11ee-9d07-274e137307ca', 'Sekarbela', '0d37bcf6-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99527bc-3f05-11ee-9d07-274e137307ca', 'Selaparang', '0d37bcf6-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99528ca-3f05-11ee-9d07-274e137307ca', 'Sandubaya', '0d37bcf6-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99529f6-3f05-11ee-9d07-274e137307ca', 'Pringgasela', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9952aaa-3f05-11ee-9d07-274e137307ca', 'Aikmel', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9952b54-3f05-11ee-9d07-274e137307ca', 'Pringgabaya', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9952bfe-3f05-11ee-9d07-274e137307ca', 'Suralaga', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9952c9e-3f05-11ee-9d07-274e137307ca', 'Sambelia', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9952d48-3f05-11ee-9d07-274e137307ca', 'Wanasaba', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9952e56-3f05-11ee-9d07-274e137307ca', 'Labuhan Haji', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9952f00-3f05-11ee-9d07-274e137307ca', 'Jerowaru', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9952faa-3f05-11ee-9d07-274e137307ca', 'Keruak', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99545ee-3f05-11ee-9d07-274e137307ca', 'Sembalun', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99548b4-3f05-11ee-9d07-274e137307ca', 'Sakra Barat', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9954a1c-3f05-11ee-9d07-274e137307ca', 'Masbagik', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9954b84-3f05-11ee-9d07-274e137307ca', 'Selong', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9954cc4-3f05-11ee-9d07-274e137307ca', 'Sikur', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9954e0e-3f05-11ee-9d07-274e137307ca', 'Sukamulia', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9954f4e-3f05-11ee-9d07-274e137307ca', 'Terara', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9955098-3f05-11ee-9d07-274e137307ca', 'Sakra Timur', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99551ce-3f05-11ee-9d07-274e137307ca', 'Montong Gading', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99552fa-3f05-11ee-9d07-274e137307ca', 'Sakra', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9955430-3f05-11ee-9d07-274e137307ca', 'Suela', '0d37c282-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995567e-3f05-11ee-9d07-274e137307ca', 'Gerung', '0d37c44e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99557be-3f05-11ee-9d07-274e137307ca', 'Kediri', '0d37c44e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99558fe-3f05-11ee-9d07-274e137307ca', 'Narmada', '0d37c44e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9955a2a-3f05-11ee-9d07-274e137307ca', 'Sekotong', '0d37c44e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9955b6a-3f05-11ee-9d07-274e137307ca', 'Labuapi', '0d37c44e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9955ca0-3f05-11ee-9d07-274e137307ca', 'Gunungsari', '0d37c44e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9955dd6-3f05-11ee-9d07-274e137307ca', 'Lingsar', '0d37c44e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9955f16-3f05-11ee-9d07-274e137307ca', 'Lembar', '0d37c44e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995604c-3f05-11ee-9d07-274e137307ca', 'Batulayar', '0d37c44e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9956182-3f05-11ee-9d07-274e137307ca', 'Kuripan', '0d37c44e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9956326-3f05-11ee-9d07-274e137307ca', 'Lunyuk', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995645c-3f05-11ee-9d07-274e137307ca', 'Alas', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9956588-3f05-11ee-9d07-274e137307ca', 'Utan', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995674a-3f05-11ee-9d07-274e137307ca', 'Batu Lanteh', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9956876-3f05-11ee-9d07-274e137307ca', 'Sumbawa', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99569a2-3f05-11ee-9d07-274e137307ca', 'Moyo Hilir', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9956bdc-3f05-11ee-9d07-274e137307ca', 'Moyo Hulu', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9956d08-3f05-11ee-9d07-274e137307ca', 'Ropang', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9956e34-3f05-11ee-9d07-274e137307ca', 'Lape', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9956f74-3f05-11ee-9d07-274e137307ca', 'Plampang', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99571a4-3f05-11ee-9d07-274e137307ca', 'Empang', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99572e4-3f05-11ee-9d07-274e137307ca', 'Alas Barat', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9957492-3f05-11ee-9d07-274e137307ca', 'Labuhan Badas', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99575c8-3f05-11ee-9d07-274e137307ca', 'Labangka', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99576ea-3f05-11ee-9d07-274e137307ca', 'Buer', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9957816-3f05-11ee-9d07-274e137307ca', 'Rhee', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9957906-3f05-11ee-9d07-274e137307ca', 'Unter Iwes', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995797e-3f05-11ee-9d07-274e137307ca', 'Moyo Utara', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99579ec-3f05-11ee-9d07-274e137307ca', 'Maronge', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9957a5a-3f05-11ee-9d07-274e137307ca', 'Tarano', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9957ac8-3f05-11ee-9d07-274e137307ca', 'Lopok', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9957b40-3f05-11ee-9d07-274e137307ca', 'Orong Telu', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9957bae-3f05-11ee-9d07-274e137307ca', 'Lantung', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9957c26-3f05-11ee-9d07-274e137307ca', 'Lenangguar', '0d37c534-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9957cc6-3f05-11ee-9d07-274e137307ca', 'Tanjung', '0d37c61a-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9957ee2-3f05-11ee-9d07-274e137307ca', 'Gangga', '0d37c61a-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995807c-3f05-11ee-9d07-274e137307ca', 'Kayangan', '0d37c61a-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9958112-3f05-11ee-9d07-274e137307ca', 'Bayan', '0d37c61a-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9958194-3f05-11ee-9d07-274e137307ca', 'Pemenang', '0d37c61a-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9958248-3f05-11ee-9d07-274e137307ca', 'Praya', '0d37c732-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99582c0-3f05-11ee-9d07-274e137307ca', 'Jonggat', '0d37c732-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9958338-3f05-11ee-9d07-274e137307ca', 'Batukliang', '0d37c732-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99583b0-3f05-11ee-9d07-274e137307ca', 'Pujut', '0d37c732-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995841e-3f05-11ee-9d07-274e137307ca', 'Praya Barat', '0d37c732-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99585e0-3f05-11ee-9d07-274e137307ca', 'Praya Timur', '0d37c732-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99586c6-3f05-11ee-9d07-274e137307ca', 'Janapria', '0d37c732-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995875c-3f05-11ee-9d07-274e137307ca', 'Pringgarata', '0d37c732-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99587d4-3f05-11ee-9d07-274e137307ca', 'Kopang', '0d37c732-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995884c-3f05-11ee-9d07-274e137307ca', 'Praya Tengah', '0d37c732-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99588ba-3f05-11ee-9d07-274e137307ca', 'Praya Barat Daya', '0d37c732-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9958932-3f05-11ee-9d07-274e137307ca', 'Batukliang Utara', '0d37c732-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99589e6-3f05-11ee-9d07-274e137307ca', 'Dompu', '0d37c7fa-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9958a5e-3f05-11ee-9d07-274e137307ca', 'Kempo', '0d37c7fa-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9958acc-3f05-11ee-9d07-274e137307ca', 'Hu`u', '0d37c7fa-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9958b44-3f05-11ee-9d07-274e137307ca', 'Kilo', '0d37c7fa-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9958bb2-3f05-11ee-9d07-274e137307ca', 'Woja', '0d37c7fa-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9958e78-3f05-11ee-9d07-274e137307ca', 'Pekat', '0d37c7fa-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9958efa-3f05-11ee-9d07-274e137307ca', 'Manggalewa', '0d37c7fa-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9958f72-3f05-11ee-9d07-274e137307ca', 'Pajo', '0d37c7fa-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995901c-3f05-11ee-9d07-274e137307ca', 'Jereweh', '0d37c8c2-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959094-3f05-11ee-9d07-274e137307ca', 'Taliwang', '0d37c8c2-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995910c-3f05-11ee-9d07-274e137307ca', 'Seteluk', '0d37c8c2-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995917a-3f05-11ee-9d07-274e137307ca', 'Sekongkang', '0d37c8c2-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959238-3f05-11ee-9d07-274e137307ca', 'Brang Rea', '0d37c8c2-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99592ba-3f05-11ee-9d07-274e137307ca', 'Poto Tano', '0d37c8c2-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959328-3f05-11ee-9d07-274e137307ca', 'Brang Ene', '0d37c8c2-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99593a0-3f05-11ee-9d07-274e137307ca', 'Maluk', '0d37c8c2-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959436-3f05-11ee-9d07-274e137307ca', 'Monta', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99594ae-3f05-11ee-9d07-274e137307ca', 'Bolo', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995951c-3f05-11ee-9d07-274e137307ca', 'Woha', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959594-3f05-11ee-9d07-274e137307ca', 'Belo', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959602-3f05-11ee-9d07-274e137307ca', 'Wawo', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959670-3f05-11ee-9d07-274e137307ca', 'Sape', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99596de-3f05-11ee-9d07-274e137307ca', 'Wera', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959756-3f05-11ee-9d07-274e137307ca', 'Donggo', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d995988c-3f05-11ee-9d07-274e137307ca', 'Sanggar', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959904-3f05-11ee-9d07-274e137307ca', 'Ambalawi', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959972-3f05-11ee-9d07-274e137307ca', 'Langgudu', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d99599e0-3f05-11ee-9d07-274e137307ca', 'Lambu', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959a58-3f05-11ee-9d07-274e137307ca', 'Madapangga', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959ac6-3f05-11ee-9d07-274e137307ca', 'Tambora', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959b34-3f05-11ee-9d07-274e137307ca', 'Soromandi', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959bde-3f05-11ee-9d07-274e137307ca', 'Parado', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959c56-3f05-11ee-9d07-274e137307ca', 'Lambitu', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959cc4-3f05-11ee-9d07-274e137307ca', 'Palibelo', '0d37c980-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959d64-3f05-11ee-9d07-274e137307ca', 'RasanaE Barat', '0d37ca3e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959ddc-3f05-11ee-9d07-274e137307ca', 'RasanaE Timur', '0d37ca3e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959e54-3f05-11ee-9d07-274e137307ca', 'Asakota', '0d37ca3e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959ec2-3f05-11ee-9d07-274e137307ca', 'Raba', '0d37ca3e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
INSERT INTO `kecamatan` VALUES ('d9959f30-3f05-11ee-9d07-274e137307ca', 'Mpunda', '0d37ca3e-3f01-11ee-9d07-274e137307ca', '2023-08-20 11:01:25', '2023-08-20 11:01:25');
COMMIT;

-- ----------------------------
-- Table structure for kelurahan
-- ----------------------------
DROP TABLE IF EXISTS `kelurahan`;
CREATE TABLE `kelurahan` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of kelurahan
-- ----------------------------
BEGIN;
INSERT INTO `kelurahan` VALUES ('413f728e-3f09-11ee-9d07-274e137307ca', 'Ampenan Selatan', 'd9950fca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f85e4-3f09-11ee-9d07-274e137307ca', 'Ampenan Tengah', 'd9950fca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f874c-3f09-11ee-9d07-274e137307ca', 'Pejeruk', 'd9950fca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f87e2-3f09-11ee-9d07-274e137307ca', 'Ampenan Utara', 'd9950fca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f886e-3f09-11ee-9d07-274e137307ca', 'Taman Sari', 'd9950fca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f88e6-3f09-11ee-9d07-274e137307ca', 'Banjar', 'd9950fca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f8968-3f09-11ee-9d07-274e137307ca', 'Kebun Sari', 'd9950fca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f89e0-3f09-11ee-9d07-274e137307ca', 'Pajarakan Karya', 'd9950fca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f8a6c-3f09-11ee-9d07-274e137307ca', 'Dayan Peken', 'd9950fca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f8ae4-3f09-11ee-9d07-274e137307ca', 'Bintaro', 'd9950fca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f8bca-3f09-11ee-9d07-274e137307ca', 'Pagesangan', 'd995246a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f8c4c-3f09-11ee-9d07-274e137307ca', 'Mataram Timur', 'd995246a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f8d14-3f09-11ee-9d07-274e137307ca', 'Pagutan', 'd995246a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f8d96-3f09-11ee-9d07-274e137307ca', 'Pagesangan Barat', 'd995246a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f8e04-3f09-11ee-9d07-274e137307ca', 'Pagesangan Timur', 'd995246a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f8e7c-3f09-11ee-9d07-274e137307ca', 'Pejanggik', 'd995246a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f8ef4-3f09-11ee-9d07-274e137307ca', 'Punia', 'd995246a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f8f62-3f09-11ee-9d07-274e137307ca', 'Pagutan Timur', 'd995246a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f8fda-3f09-11ee-9d07-274e137307ca', 'Pagutan Barat', 'd995246a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f907a-3f09-11ee-9d07-274e137307ca', 'Cakranegara Selatan', 'd995262c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f90fc-3f09-11ee-9d07-274e137307ca', 'Cakranegara Barat', 'd995262c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f916a-3f09-11ee-9d07-274e137307ca', 'Cakranegara Timur', 'd995262c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f91e2-3f09-11ee-9d07-274e137307ca', 'Cakranegara Utara', 'd995262c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f925a-3f09-11ee-9d07-274e137307ca', 'Sayang-sayang', 'd995262c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f92d2-3f09-11ee-9d07-274e137307ca', 'Cakranegara Selatan Baru', 'd995262c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9340-3f09-11ee-9d07-274e137307ca', 'Sapta Marga', 'd995262c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f93b8-3f09-11ee-9d07-274e137307ca', 'Cilinaya', 'd995262c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f948a-3f09-11ee-9d07-274e137307ca', 'Mayura', 'd995262c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9502-3f09-11ee-9d07-274e137307ca', 'Karang Taliwang', 'd995262c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f95b6-3f09-11ee-9d07-274e137307ca', 'Karang Pule', 'd99526fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9638-3f09-11ee-9d07-274e137307ca', 'Tanjung Karang', 'd99526fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f96b0-3f09-11ee-9d07-274e137307ca', 'Jempong Baru', 'd99526fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9764-3f09-11ee-9d07-274e137307ca', 'Tanjung Karang Permai', 'd99526fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f97e6-3f09-11ee-9d07-274e137307ca', 'Kekalik Jaya', 'd99526fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f998a-3f09-11ee-9d07-274e137307ca', 'Mataram Barat', 'd99527bc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9a5c-3f09-11ee-9d07-274e137307ca', 'Dasan Agung', 'd99527bc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9ae8-3f09-11ee-9d07-274e137307ca', 'Monjok', 'd99527bc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9b60-3f09-11ee-9d07-274e137307ca', 'Karang Baru', 'd99527bc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9bd8-3f09-11ee-9d07-274e137307ca', 'Rembiga', 'd99527bc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9c50-3f09-11ee-9d07-274e137307ca', 'Gomong', 'd99527bc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9cd2-3f09-11ee-9d07-274e137307ca', 'Dasan Agung Baru', 'd99527bc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9d40-3f09-11ee-9d07-274e137307ca', 'Monjok Timur', 'd99527bc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9db8-3f09-11ee-9d07-274e137307ca', 'Monjok Barat', 'd99527bc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9ebc-3f09-11ee-9d07-274e137307ca', 'Dasan Cermen', 'd99528ca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9f3e-3f09-11ee-9d07-274e137307ca', 'Babakan', 'd99528ca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413f9fac-3f09-11ee-9d07-274e137307ca', 'Bertais', 'd99528ca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa024-3f09-11ee-9d07-274e137307ca', 'Selagalas', 'd99528ca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa09c-3f09-11ee-9d07-274e137307ca', 'Abian Tubuh Baru', 'd99528ca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa10a-3f09-11ee-9d07-274e137307ca', 'Turida', 'd99528ca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa18c-3f09-11ee-9d07-274e137307ca', 'Mandalika', 'd99528ca-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa236-3f09-11ee-9d07-274e137307ca', 'Aik Dewa', 'd99529f6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa2d6-3f09-11ee-9d07-274e137307ca', 'Jurit', 'd99529f6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa3a8-3f09-11ee-9d07-274e137307ca', 'Jurit Baru', 'd99529f6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa434-3f09-11ee-9d07-274e137307ca', 'Pengadangan', 'd99529f6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa4c0-3f09-11ee-9d07-274e137307ca', 'Pengadangan Barat', 'd99529f6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa54c-3f09-11ee-9d07-274e137307ca', 'Pringgasela', 'd99529f6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa5ce-3f09-11ee-9d07-274e137307ca', 'Pringgasela Selatan', 'd99529f6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa65a-3f09-11ee-9d07-274e137307ca', 'Pringgasela Timur', 'd99529f6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa6dc-3f09-11ee-9d07-274e137307ca', 'Rempung', 'd99529f6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa768-3f09-11ee-9d07-274e137307ca', 'Timbanuh', 'd99529f6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa808-3f09-11ee-9d07-274e137307ca', 'Aik Prapa', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa876-3f09-11ee-9d07-274e137307ca', 'Aikmel', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa8ee-3f09-11ee-9d07-274e137307ca', 'Aikmel Barat', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa95c-3f09-11ee-9d07-274e137307ca', 'Aikmel Timur', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fa9d4-3f09-11ee-9d07-274e137307ca', 'Aikmel Utara', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413faa4c-3f09-11ee-9d07-274e137307ca', 'Bagik Nyaka Santri', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413faace-3f09-11ee-9d07-274e137307ca', 'Kalijaga', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fab50-3f09-11ee-9d07-274e137307ca', 'Kalijaga Baru', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fb97e-3f09-11ee-9d07-274e137307ca', 'Kalijaga Selatan', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fc1b2-3f09-11ee-9d07-274e137307ca', 'Kalijaga Tengah', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fc266-3f09-11ee-9d07-274e137307ca', 'Kalijaga Timur', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fc306-3f09-11ee-9d07-274e137307ca', 'Kembang Kerang', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fc39c-3f09-11ee-9d07-274e137307ca', 'Kembang Kerang Daya', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fc41e-3f09-11ee-9d07-274e137307ca', 'Keroya', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fc4aa-3f09-11ee-9d07-274e137307ca', 'Lenek', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fc536-3f09-11ee-9d07-274e137307ca', 'Lenek Baru', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fc5b8-3f09-11ee-9d07-274e137307ca', 'Lenek Daya', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fc644-3f09-11ee-9d07-274e137307ca', 'Lenek Duren', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fc6bc-3f09-11ee-9d07-274e137307ca', 'Lenek Kali Bambang', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fc73e-3f09-11ee-9d07-274e137307ca', 'Lenek Lauk', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fca36-3f09-11ee-9d07-274e137307ca', 'Lenek Pasiraman', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fcaf4-3f09-11ee-9d07-274e137307ca', 'Lenek Ramban Biak', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fcb9e-3f09-11ee-9d07-274e137307ca', 'Sukarema', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fcc20-3f09-11ee-9d07-274e137307ca', 'Toya', 'd9952aaa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fcd38-3f09-11ee-9d07-274e137307ca', 'Anggaraksa', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fcf18-3f09-11ee-9d07-274e137307ca', 'Apit Aik', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fcfae-3f09-11ee-9d07-274e137307ca', 'Bagik Papan', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd026-3f09-11ee-9d07-274e137307ca', 'Batuyang', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd09e-3f09-11ee-9d07-274e137307ca', 'Gunung Malang', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd170-3f09-11ee-9d07-274e137307ca', 'Kerumut', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd1fc-3f09-11ee-9d07-274e137307ca', 'Labuhan Lombok', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd288-3f09-11ee-9d07-274e137307ca', 'Pohgading', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd30a-3f09-11ee-9d07-274e137307ca', 'Pohgading Timur', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd3dc-3f09-11ee-9d07-274e137307ca', 'Pringgabaya', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd45e-3f09-11ee-9d07-274e137307ca', 'Pringgabaya Utara', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd4ea-3f09-11ee-9d07-274e137307ca', 'Seruni Mumbul', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd5b2-3f09-11ee-9d07-274e137307ca', 'Tanak Gadang', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd62a-3f09-11ee-9d07-274e137307ca', 'Teko', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd6b6-3f09-11ee-9d07-274e137307ca', 'Telaga Waru', 'd9952b54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd756-3f09-11ee-9d07-274e137307ca', 'Anjani', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd7ce-3f09-11ee-9d07-274e137307ca', 'Bagik Payung', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd846-3f09-11ee-9d07-274e137307ca', 'Bagik Payung Selatan', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd8be-3f09-11ee-9d07-274e137307ca', 'Bagik Payung Timur', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fd936-3f09-11ee-9d07-274e137307ca', 'Bintang Rinjani', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fda26-3f09-11ee-9d07-274e137307ca', 'Dames Damai', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fdf30-3f09-11ee-9d07-274e137307ca', 'Dasan Borok', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fe192-3f09-11ee-9d07-274e137307ca', 'Gapuk', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fe304-3f09-11ee-9d07-274e137307ca', 'Gerung Permai', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fe4a8-3f09-11ee-9d07-274e137307ca', 'Kerongkong', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fe61a-3f09-11ee-9d07-274e137307ca', 'Paok Lombok', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fe778-3f09-11ee-9d07-274e137307ca', 'Suralaga', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fe8cc-3f09-11ee-9d07-274e137307ca', 'Tebaban', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fea34-3f09-11ee-9d07-274e137307ca', 'Tumbuh Mulia', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413feb88-3f09-11ee-9d07-274e137307ca', 'Waringin', 'd9952bfe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fed68-3f09-11ee-9d07-274e137307ca', 'Bagik Manis', 'd9952c9e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413feea8-3f09-11ee-9d07-274e137307ca', 'Belanting', 'd9952c9e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413fefde-3f09-11ee-9d07-274e137307ca', 'Dadap', 'd9952c9e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413ff10a-3f09-11ee-9d07-274e137307ca', 'Darakunci', 'd9952c9e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413ff25e-3f09-11ee-9d07-274e137307ca', 'Labuhan Pandan', 'd9952c9e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413ff3b2-3f09-11ee-9d07-274e137307ca', 'Madayin', 'd9952c9e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413ff510-3f09-11ee-9d07-274e137307ca', 'Obel-obel', 'd9952c9e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413ff66e-3f09-11ee-9d07-274e137307ca', 'Padak Guar', 'd9952c9e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413ff7c2-3f09-11ee-9d07-274e137307ca', 'Sambalia', 'd9952c9e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413ff90c-3f09-11ee-9d07-274e137307ca', 'Senanggalih', 'd9952c9e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413ffaba-3f09-11ee-9d07-274e137307ca', 'Sugian', 'd9952c9e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413ffc5e-3f09-11ee-9d07-274e137307ca', 'Bandok', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413ffd8a-3f09-11ee-9d07-274e137307ca', 'Bebidas', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('413ffeca-3f09-11ee-9d07-274e137307ca', 'Beriri Jarak', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140001e-3f09-11ee-9d07-274e137307ca', 'Jineng', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41400168-3f09-11ee-9d07-274e137307ca', 'Karang Baru', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414002bc-3f09-11ee-9d07-274e137307ca', 'Karang Baru Timur', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41400456-3f09-11ee-9d07-274e137307ca', 'Mamben Baru', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414005fa-3f09-11ee-9d07-274e137307ca', 'Mamben Daya', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41400820-3f09-11ee-9d07-274e137307ca', 'Mamben Lauk', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41406068-3f09-11ee-9d07-274e137307ca', 'Otak Rarangan', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41406248-3f09-11ee-9d07-274e137307ca', 'Tembeng Putik', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414063ce-3f09-11ee-9d07-274e137307ca', 'Wanasaba', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140654a-3f09-11ee-9d07-274e137307ca', 'Wanasaba Daya', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414066d0-3f09-11ee-9d07-274e137307ca', 'Wanasaba Lauk', 'd9952d48-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414068a6-3f09-11ee-9d07-274e137307ca', 'Banjarsari', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414069e6-3f09-11ee-9d07-274e137307ca', 'Geres', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41406b3a-3f09-11ee-9d07-274e137307ca', 'Ijobalit', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41406c98-3f09-11ee-9d07-274e137307ca', 'Kertasari', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41406dec-3f09-11ee-9d07-274e137307ca', 'Korleko', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41406f40-3f09-11ee-9d07-274e137307ca', 'Korleko Selatan', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41407094-3f09-11ee-9d07-274e137307ca', 'Labuhan Haji', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414071e8-3f09-11ee-9d07-274e137307ca', 'Peneda Gandor', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140733c-3f09-11ee-9d07-274e137307ca', 'Sepakat', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414075da-3f09-11ee-9d07-274e137307ca', 'Suryawangi', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41407760-3f09-11ee-9d07-274e137307ca', 'Tanjung', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414078be-3f09-11ee-9d07-274e137307ca', 'Teros', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41407a12-3f09-11ee-9d07-274e137307ca', 'Tirtanadi', 'd9952e56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41407c92-3f09-11ee-9d07-274e137307ca', 'Batu Nampar', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41407ddc-3f09-11ee-9d07-274e137307ca', 'Batunampar Selatan', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41407f1c-3f09-11ee-9d07-274e137307ca', 'Ekas Buana', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41408070-3f09-11ee-9d07-274e137307ca', 'Jerowaru', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414081c4-3f09-11ee-9d07-274e137307ca', 'Kwang Rundun', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140830e-3f09-11ee-9d07-274e137307ca', 'Pandan Wangi', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41408462-3f09-11ee-9d07-274e137307ca', 'Pare Mas', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414085c0-3f09-11ee-9d07-274e137307ca', 'Pemongkong', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140870a-3f09-11ee-9d07-274e137307ca', 'Pene', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140885e-3f09-11ee-9d07-274e137307ca', 'Sekaroh', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414089b2-3f09-11ee-9d07-274e137307ca', 'Sepapan', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41408b06-3f09-11ee-9d07-274e137307ca', 'Seriwe', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41408c50-3f09-11ee-9d07-274e137307ca', 'Sukadamai', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41408da4-3f09-11ee-9d07-274e137307ca', 'Sukaraja', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41408ef8-3f09-11ee-9d07-274e137307ca', 'Wakan', 'd9952f00-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41409092-3f09-11ee-9d07-274e137307ca', 'Batu Putik', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414091be-3f09-11ee-9d07-274e137307ca', 'Dane Rase', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41409312-3f09-11ee-9d07-274e137307ca', 'Keruak', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41409466-3f09-11ee-9d07-274e137307ca', 'Ketangga Jeraeng', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414096a0-3f09-11ee-9d07-274e137307ca', 'Ketapang Raya', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41409808-3f09-11ee-9d07-274e137307ca', 'Mendana', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41409952-3f09-11ee-9d07-274e137307ca', 'Mendana Raya', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41409aa6-3f09-11ee-9d07-274e137307ca', 'Montong Belae', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41409bfa-3f09-11ee-9d07-274e137307ca', 'Pijot', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41409d44-3f09-11ee-9d07-274e137307ca', 'Pijot Utara', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41409e98-3f09-11ee-9d07-274e137307ca', 'Pulau Maringkik', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41409fec-3f09-11ee-9d07-274e137307ca', 'Selebung Ketangga', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140a140-3f09-11ee-9d07-274e137307ca', 'Senyiur', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140a294-3f09-11ee-9d07-274e137307ca', 'Sepit', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140a3e8-3f09-11ee-9d07-274e137307ca', 'Setungkep', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140a62c-3f09-11ee-9d07-274e137307ca', 'Setungkep Lingsar', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140a8a2-3f09-11ee-9d07-274e137307ca', 'Tanjung Luar', 'd9952faa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140aab4-3f09-11ee-9d07-274e137307ca', 'Bilok Petung', 'd99545ee-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140ad34-3f09-11ee-9d07-274e137307ca', 'Sajang', 'd99545ee-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140ae4c-3f09-11ee-9d07-274e137307ca', 'Sembalun', 'd99545ee-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140aef6-3f09-11ee-9d07-274e137307ca', 'Sembalun Bumbung', 'd99545ee-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140affa-3f09-11ee-9d07-274e137307ca', 'Sembalun Lawang', 'd99545ee-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140b086-3f09-11ee-9d07-274e137307ca', 'Sembalun Timba Gading', 'd99545ee-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140b144-3f09-11ee-9d07-274e137307ca', 'Borok Toyang', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140b1bc-3f09-11ee-9d07-274e137307ca', 'Boyemare', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140b248-3f09-11ee-9d07-274e137307ca', 'Bungtiang', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140b2c0-3f09-11ee-9d07-274e137307ca', 'Gadungmas', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140b338-3f09-11ee-9d07-274e137307ca', 'Gerisak Semanggeleng', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140b3c4-3f09-11ee-9d07-274e137307ca', 'Gunung Rajak', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140b446-3f09-11ee-9d07-274e137307ca', 'Jerogunung', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140b4c8-3f09-11ee-9d07-274e137307ca', 'Kembang Are Sampai', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140b554-3f09-11ee-9d07-274e137307ca', 'Mengkuru', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140b5d6-3f09-11ee-9d07-274e137307ca', 'Montong Beter', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140b662-3f09-11ee-9d07-274e137307ca', 'Pejaring', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140bdf6-3f09-11ee-9d07-274e137307ca', 'Pematung', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140bea0-3f09-11ee-9d07-274e137307ca', 'Pengkelak Mas', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140bf2c-3f09-11ee-9d07-274e137307ca', 'Rensing', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140bfb8-3f09-11ee-9d07-274e137307ca', 'Rensing Bat', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c04e-3f09-11ee-9d07-274e137307ca', 'Rensing Raya', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c0da-3f09-11ee-9d07-274e137307ca', 'Sukarara', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c15c-3f09-11ee-9d07-274e137307ca', 'Tanak Kaken', 'd99548b4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c210-3f09-11ee-9d07-274e137307ca', 'Danger', 'd9954a1c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c29c-3f09-11ee-9d07-274e137307ca', 'Kesik', 'd9954a1c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c328-3f09-11ee-9d07-274e137307ca', 'Kumbang', 'd9954a1c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c3b4-3f09-11ee-9d07-274e137307ca', 'Lendang Nangka', 'd9954a1c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c436-3f09-11ee-9d07-274e137307ca', 'Lendang Nangka Utara', 'd9954a1c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c51c-3f09-11ee-9d07-274e137307ca', 'Masbagik Selatan', 'd9954a1c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c5b2-3f09-11ee-9d07-274e137307ca', 'Masbagik Timur', 'd9954a1c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c634-3f09-11ee-9d07-274e137307ca', 'Masbagik Utara', 'd9954a1c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c6b6-3f09-11ee-9d07-274e137307ca', 'Masbagik Utara Baru', 'd9954a1c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c742-3f09-11ee-9d07-274e137307ca', 'Paokmotong', 'd9954a1c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c7e2-3f09-11ee-9d07-274e137307ca', 'Danggen Timur', 'd9954b84-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c85a-3f09-11ee-9d07-274e137307ca', 'Denggen', 'd9954b84-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c954-3f09-11ee-9d07-274e137307ca', 'Kelayu Jorong', 'd9954b84-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140c9e0-3f09-11ee-9d07-274e137307ca', 'Kelayu Selatan', 'd9954b84-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140ca62-3f09-11ee-9d07-274e137307ca', 'Kelayu Utara', 'd9954b84-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140caee-3f09-11ee-9d07-274e137307ca', 'Kembang Sari', 'd9954b84-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140cbd4-3f09-11ee-9d07-274e137307ca', 'Majidi', 'd9954b84-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140cc60-3f09-11ee-9d07-274e137307ca', 'Pancor', 'd9954b84-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140ccec-3f09-11ee-9d07-274e137307ca', 'Rakam', 'd9954b84-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140cde6-3f09-11ee-9d07-274e137307ca', 'Sandu Baya', 'd9954b84-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140ce7c-3f09-11ee-9d07-274e137307ca', 'Sekarteja', 'd9954b84-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140cefe-3f09-11ee-9d07-274e137307ca', 'Selong', 'd9954b84-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140cf9e-3f09-11ee-9d07-274e137307ca', 'Darmasari', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d016-3f09-11ee-9d07-274e137307ca', 'Gelora', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d0f2-3f09-11ee-9d07-274e137307ca', 'Jeruk Manis', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d17e-3f09-11ee-9d07-274e137307ca', 'Kembang Kuning', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d20a-3f09-11ee-9d07-274e137307ca', 'Kota Raja', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d28c-3f09-11ee-9d07-274e137307ca', 'Loyok', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d35e-3f09-11ee-9d07-274e137307ca', 'Montong Baan', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d3ea-3f09-11ee-9d07-274e137307ca', 'Montong Baan Selatan', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d476-3f09-11ee-9d07-274e137307ca', 'Semaya', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d4f8-3f09-11ee-9d07-274e137307ca', 'Sikur', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d57a-3f09-11ee-9d07-274e137307ca', 'Sikur Barat', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d5fc-3f09-11ee-9d07-274e137307ca', 'Sikur Selatan', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d67e-3f09-11ee-9d07-274e137307ca', 'Tete Batu', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d750-3f09-11ee-9d07-274e137307ca', 'Tetebatu Selatan', 'd9954cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d840-3f09-11ee-9d07-274e137307ca', 'Dasan Lekong', 'd9954e0e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140d9bc-3f09-11ee-9d07-274e137307ca', 'Jantuk', 'd9954e0e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140db1a-3f09-11ee-9d07-274e137307ca', 'Nyiur Tebel', 'd9954e0e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140dc78-3f09-11ee-9d07-274e137307ca', 'Padamara', 'd9954e0e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140dde0-3f09-11ee-9d07-274e137307ca', 'Paok Pampang', 'd9954e0e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140e132-3f09-11ee-9d07-274e137307ca', 'Setanggor', 'd9954e0e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140e326-3f09-11ee-9d07-274e137307ca', 'Setanggor Selatan', 'd9954e0e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140e4b6-3f09-11ee-9d07-274e137307ca', 'Setangor\"', 'd9954e0e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140e60a-3f09-11ee-9d07-274e137307ca', 'Sukamulia', 'd9954e0e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140e77c-3f09-11ee-9d07-274e137307ca', 'Sukamulia Timur', 'd9954e0e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140e95c-3f09-11ee-9d07-274e137307ca', 'Embung Kandong', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140eab0-3f09-11ee-9d07-274e137307ca', 'Embung Raja', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140f136-3f09-11ee-9d07-274e137307ca', 'Jenggik', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140f3ac-3f09-11ee-9d07-274e137307ca', 'Kalianyar', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140f5fa-3f09-11ee-9d07-274e137307ca', 'Lando', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140f780-3f09-11ee-9d07-274e137307ca', 'Leming', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140f9c4-3f09-11ee-9d07-274e137307ca', 'Pandan Duri', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140fb2c-3f09-11ee-9d07-274e137307ca', 'Rarang', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140fc94-3f09-11ee-9d07-274e137307ca', 'Rarang Batas', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140fdfc-3f09-11ee-9d07-274e137307ca', 'Rarang Selatan', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4140ff6e-3f09-11ee-9d07-274e137307ca', 'Rarang Tengah', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41410162-3f09-11ee-9d07-274e137307ca', 'Santong', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414102ca-3f09-11ee-9d07-274e137307ca', 'Selagik', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414104c8-3f09-11ee-9d07-274e137307ca', 'Sukadana', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41410630-3f09-11ee-9d07-274e137307ca', 'Suradadi', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141091e-3f09-11ee-9d07-274e137307ca', 'Terara', 'd9954f4e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412016-3f09-11ee-9d07-274e137307ca', 'Gelanggang', 'd9955098-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412160-3f09-11ee-9d07-274e137307ca', 'Gereneng', 'd9955098-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412264-3f09-11ee-9d07-274e137307ca', 'Gereneng Timur', 'd9955098-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412372-3f09-11ee-9d07-274e137307ca', 'Lenting', 'd9955098-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412476-3f09-11ee-9d07-274e137307ca', 'Lepak', 'd9955098-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412584-3f09-11ee-9d07-274e137307ca', 'Lepak Timur', 'd9955098-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412688-3f09-11ee-9d07-274e137307ca', 'Menceh', 'd9955098-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141278c-3f09-11ee-9d07-274e137307ca', 'Montong Tangi', 'd9955098-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412890-3f09-11ee-9d07-274e137307ca', 'Selayar', 'd9955098-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141298a-3f09-11ee-9d07-274e137307ca', 'Surabaya', 'd9955098-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412a84-3f09-11ee-9d07-274e137307ca', 'Surabaya Utara', 'd9955098-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412bd8-3f09-11ee-9d07-274e137307ca', 'Jenggik Utara', 'd99551ce-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412cd2-3f09-11ee-9d07-274e137307ca', 'Kilang', 'd99551ce-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412dd6-3f09-11ee-9d07-274e137307ca', 'Lendang Belo', 'd99551ce-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412ec6-3f09-11ee-9d07-274e137307ca', 'Montong Betok', 'd99551ce-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41412fc0-3f09-11ee-9d07-274e137307ca', 'Perian', 'd99551ce-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414130ba-3f09-11ee-9d07-274e137307ca', 'Pesanggrahan', 'd99551ce-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141324a-3f09-11ee-9d07-274e137307ca', 'Pringga Jurang', 'd99551ce-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41413358-3f09-11ee-9d07-274e137307ca', 'Pringgajurang Utara', 'd99551ce-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414134a2-3f09-11ee-9d07-274e137307ca', 'Kabar', 'd99552fa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141359c-3f09-11ee-9d07-274e137307ca', 'Keselet', 'd99552fa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41413696-3f09-11ee-9d07-274e137307ca', 'Kuang Baru', 'd99552fa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41413790-3f09-11ee-9d07-274e137307ca', 'Moyot', 'd99552fa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141388a-3f09-11ee-9d07-274e137307ca', 'Peresak', 'd99552fa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41413984-3f09-11ee-9d07-274e137307ca', 'Rumbuk', 'd99552fa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41413a74-3f09-11ee-9d07-274e137307ca', 'Rumbuk Timur', 'd99552fa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41413b6e-3f09-11ee-9d07-274e137307ca', 'Sakra', 'd99552fa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41413c5e-3f09-11ee-9d07-274e137307ca', 'Sakra Selatan', 'd99552fa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41413d3a-3f09-11ee-9d07-274e137307ca', 'Songak', 'd99552fa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41413e48-3f09-11ee-9d07-274e137307ca', 'Suwangi', 'd99552fa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41413f42-3f09-11ee-9d07-274e137307ca', 'Suwangi Timur', 'd99552fa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414078-3f09-11ee-9d07-274e137307ca', 'Ketangga', 'd9955430-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414172-3f09-11ee-9d07-274e137307ca', 'Mekar Sari', 'd9955430-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141426c-3f09-11ee-9d07-274e137307ca', 'Perigi', 'd9955430-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141435c-3f09-11ee-9d07-274e137307ca', 'Puncak Jeringo', 'd9955430-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414456-3f09-11ee-9d07-274e137307ca', 'Sapit', 'd9955430-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414546-3f09-11ee-9d07-274e137307ca', 'Selaparang', 'd9955430-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414640-3f09-11ee-9d07-274e137307ca', 'Suela', 'd9955430-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141473a-3f09-11ee-9d07-274e137307ca', 'Suntalangu', 'd9955430-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414866-3f09-11ee-9d07-274e137307ca', 'Dasan Geres', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414960-3f09-11ee-9d07-274e137307ca', 'Gerung Selatan', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414a5a-3f09-11ee-9d07-274e137307ca', 'Gerung Utara', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414b4a-3f09-11ee-9d07-274e137307ca', 'Kebon Ayu', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414c26-3f09-11ee-9d07-274e137307ca', 'Gapuk', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414d20-3f09-11ee-9d07-274e137307ca', 'Suka Makmur', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414e10-3f09-11ee-9d07-274e137307ca', 'Banyu Urip', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414f0a-3f09-11ee-9d07-274e137307ca', 'Babussalam', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41414ffa-3f09-11ee-9d07-274e137307ca', 'Dasan Tapen', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414150fe-3f09-11ee-9d07-274e137307ca', 'Beleke', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414151ee-3f09-11ee-9d07-274e137307ca', 'Tempos', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414152de-3f09-11ee-9d07-274e137307ca', 'Mesanggok', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414153d8-3f09-11ee-9d07-274e137307ca', 'Taman Ayu', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414154c8-3f09-11ee-9d07-274e137307ca', 'Giri Tembesi', 'd995567e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414155fe-3f09-11ee-9d07-274e137307ca', 'Kediri', 'd99557be-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414156f8-3f09-11ee-9d07-274e137307ca', 'Motong Are', 'd99557be-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414157f2-3f09-11ee-9d07-274e137307ca', 'Jagaraga Indah', 'd99557be-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414158e2-3f09-11ee-9d07-274e137307ca', 'Rumak', 'd99557be-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414159dc-3f09-11ee-9d07-274e137307ca', 'Gelogor', 'd99557be-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41415ad6-3f09-11ee-9d07-274e137307ca', 'Banyumulek', 'd99557be-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41415bd0-3f09-11ee-9d07-274e137307ca', 'Ombe Baru', 'd99557be-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41415cca-3f09-11ee-9d07-274e137307ca', 'Dasan Baru', 'd99557be-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41415dc4-3f09-11ee-9d07-274e137307ca', 'Kediri Selatan', 'd99557be-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41415ebe-3f09-11ee-9d07-274e137307ca', 'Lelede', 'd99557be-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41415ff4-3f09-11ee-9d07-274e137307ca', 'Lembuak', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414161b6-3f09-11ee-9d07-274e137307ca', 'Nyur Lembang', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414162b0-3f09-11ee-9d07-274e137307ca', 'Peresak', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41416cb0-3f09-11ee-9d07-274e137307ca', 'Keru', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41416de6-3f09-11ee-9d07-274e137307ca', 'Batu Kuta', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41416efe-3f09-11ee-9d07-274e137307ca', 'Tanak Beak', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41417016-3f09-11ee-9d07-274e137307ca', 'Sedau', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41417124-3f09-11ee-9d07-274e137307ca', 'Suranadi', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41417232-3f09-11ee-9d07-274e137307ca', 'Selat', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141732c-3f09-11ee-9d07-274e137307ca', 'Lebah Sempage', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414189fc-3f09-11ee-9d07-274e137307ca', 'Sesaot', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41418b3c-3f09-11ee-9d07-274e137307ca', 'Dasan Tereng', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41418c4a-3f09-11ee-9d07-274e137307ca', 'Badrain', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41418de4-3f09-11ee-9d07-274e137307ca', 'Sembung', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41418ef2-3f09-11ee-9d07-274e137307ca', 'Kramat Jaya', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41418ff6-3f09-11ee-9d07-274e137307ca', 'Grimax Indah', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414190fa-3f09-11ee-9d07-274e137307ca', 'Pakuan', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414191f4-3f09-11ee-9d07-274e137307ca', 'Golong', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414192f8-3f09-11ee-9d07-274e137307ca', 'Mekarsari', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141946a-3f09-11ee-9d07-274e137307ca', 'Buwun Sejati', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141a25c-3f09-11ee-9d07-274e137307ca', 'Narmada', 'd99558fe-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141a414-3f09-11ee-9d07-274e137307ca', 'Sekotong Tengah', 'd9955a2a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141a522-3f09-11ee-9d07-274e137307ca', 'Sekotong Barat', 'd9955a2a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141a626-3f09-11ee-9d07-274e137307ca', 'Pelangan', 'd9955a2a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141a72a-3f09-11ee-9d07-274e137307ca', 'Buwun Mas', 'd9955a2a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141a824-3f09-11ee-9d07-274e137307ca', 'Kedaro', 'd9955a2a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141a928-3f09-11ee-9d07-274e137307ca', 'Batu Putih', 'd9955a2a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141aa36-3f09-11ee-9d07-274e137307ca', 'Gili Gede Indah', 'd9955a2a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141ab3a-3f09-11ee-9d07-274e137307ca', 'Cendi Manik', 'd9955a2a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141ac8e-3f09-11ee-9d07-274e137307ca', 'Taman Baru', 'd9955a2a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141ade2-3f09-11ee-9d07-274e137307ca', 'Bengkel', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141af2c-3f09-11ee-9d07-274e137307ca', 'Merembu', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141b026-3f09-11ee-9d07-274e137307ca', 'Bagik Polak', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141b206-3f09-11ee-9d07-274e137307ca', 'Telagawaru', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141b30a-3f09-11ee-9d07-274e137307ca', 'Perampuan', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141b3fa-3f09-11ee-9d07-274e137307ca', 'Bajur', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141b4f4-3f09-11ee-9d07-274e137307ca', 'Terong Tawah', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141b5ee-3f09-11ee-9d07-274e137307ca', 'Kuranji', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141b6e8-3f09-11ee-9d07-274e137307ca', 'Karang Bongkot', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141b7e2-3f09-11ee-9d07-274e137307ca', 'Labuapi', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141b8dc-3f09-11ee-9d07-274e137307ca', 'Bagik Polak Barat', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141b9d6-3f09-11ee-9d07-274e137307ca', 'Kuranji Dalang', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141babc-3f09-11ee-9d07-274e137307ca', 'Bagik Polak Timur', 'd9955b6a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141bbfc-3f09-11ee-9d07-274e137307ca', 'Gunungsari', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141bcf6-3f09-11ee-9d07-274e137307ca', 'Midang', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141bf94-3f09-11ee-9d07-274e137307ca', 'Sesele', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141c2a0-3f09-11ee-9d07-274e137307ca', 'Kekait', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141c3f4-3f09-11ee-9d07-274e137307ca', 'Kekeri', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141c50c-3f09-11ee-9d07-274e137307ca', 'Mambalan', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141c606-3f09-11ee-9d07-274e137307ca', 'Dopang', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141c70a-3f09-11ee-9d07-274e137307ca', 'Penimbung', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141c80e-3f09-11ee-9d07-274e137307ca', 'Taman Sari', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141c908-3f09-11ee-9d07-274e137307ca', 'Jatisela', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141ca16-3f09-11ee-9d07-274e137307ca', 'Guntur Macan', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141cb10-3f09-11ee-9d07-274e137307ca', 'Mekar Sari', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141cc0a-3f09-11ee-9d07-274e137307ca', 'Ranjok', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141cd04-3f09-11ee-9d07-274e137307ca', 'Gelangsar', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141cdfe-3f09-11ee-9d07-274e137307ca', 'Jeringo', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141cf02-3f09-11ee-9d07-274e137307ca', 'Bukittinggi', 'd9955ca0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141e050-3f09-11ee-9d07-274e137307ca', 'Lingsar', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141e1cc-3f09-11ee-9d07-274e137307ca', 'Batu Kumbung', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141e2e4-3f09-11ee-9d07-274e137307ca', 'Sigerongan', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141e3f2-3f09-11ee-9d07-274e137307ca', 'Duman', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141e4f6-3f09-11ee-9d07-274e137307ca', 'Karang Bayan', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141e5fa-3f09-11ee-9d07-274e137307ca', 'Langko', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141e6f4-3f09-11ee-9d07-274e137307ca', 'Dasan Geria', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141e802-3f09-11ee-9d07-274e137307ca', 'Peteluan Indah', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141e8fc-3f09-11ee-9d07-274e137307ca', 'Gegerung', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141e9f6-3f09-11ee-9d07-274e137307ca', 'Batu Mekar', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141eaf0-3f09-11ee-9d07-274e137307ca', 'Giri Madia', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141ebf4-3f09-11ee-9d07-274e137307ca', 'Bug-Bug', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141ecee-3f09-11ee-9d07-274e137307ca', 'Gegelang', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141edfc-3f09-11ee-9d07-274e137307ca', 'Saribaye', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141ef0a-3f09-11ee-9d07-274e137307ca', 'Gontoran', 'd9955dd6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141f4dc-3f09-11ee-9d07-274e137307ca', 'Lembar', 'd9955f16-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141f64e-3f09-11ee-9d07-274e137307ca', 'Jembatan Kembar', 'd9955f16-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141f8ce-3f09-11ee-9d07-274e137307ca', 'Mareje', 'd9955f16-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141fa04-3f09-11ee-9d07-274e137307ca', 'Sekotong Timur', 'd9955f16-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141fb1c-3f09-11ee-9d07-274e137307ca', 'Labuan Tereng', 'd9955f16-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141fc20-3f09-11ee-9d07-274e137307ca', 'Jembatan Gantung', 'd9955f16-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141fd24-3f09-11ee-9d07-274e137307ca', 'Lembar Selatan', 'd9955f16-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141fe28-3f09-11ee-9d07-274e137307ca', 'Mareje Timur', 'd9955f16-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4141ff22-3f09-11ee-9d07-274e137307ca', 'Jembatan Kembar Timur', 'd9955f16-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420026-3f09-11ee-9d07-274e137307ca', 'Eyat Mayang', 'd9955f16-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142012a-3f09-11ee-9d07-274e137307ca', 'Jelateng', 'd9955f16-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420292-3f09-11ee-9d07-274e137307ca', 'Batulayar', 'd995604c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420396-3f09-11ee-9d07-274e137307ca', 'Meninting', 'd995604c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420490-3f09-11ee-9d07-274e137307ca', 'Sandik', 'd995604c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142058a-3f09-11ee-9d07-274e137307ca', 'Lembah Sari', 'd995604c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420684-3f09-11ee-9d07-274e137307ca', 'Senteluk', 'd995604c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142077e-3f09-11ee-9d07-274e137307ca', 'Senggigi', 'd995604c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420882-3f09-11ee-9d07-274e137307ca', 'Bengkaung', 'd995604c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420972-3f09-11ee-9d07-274e137307ca', 'Pusuk Lestari', 'd995604c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420a6c-3f09-11ee-9d07-274e137307ca', 'Batu Layar Barat', 'd995604c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420b66-3f09-11ee-9d07-274e137307ca', 'Malimbu', 'd995604c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420c60-3f09-11ee-9d07-274e137307ca', 'Nipah', 'd995604c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420df0-3f09-11ee-9d07-274e137307ca', 'Kuripan', 'd9956182-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420ef4-3f09-11ee-9d07-274e137307ca', 'Jagaraga', 'd9956182-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41420ff8-3f09-11ee-9d07-274e137307ca', 'Kuripan Utara', 'd9956182-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414210f2-3f09-11ee-9d07-274e137307ca', 'Kuripan Selatan', 'd9956182-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414211ec-3f09-11ee-9d07-274e137307ca', 'Kuripan Timur', 'd9956182-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41421386-3f09-11ee-9d07-274e137307ca', 'Giri Sasak', 'd9956182-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414214c6-3f09-11ee-9d07-274e137307ca', 'Lunyuk Rea', 'd9956326-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414215c0-3f09-11ee-9d07-274e137307ca', 'Lunyuk Ode', 'd9956326-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414216ba-3f09-11ee-9d07-274e137307ca', 'Jamu', 'd9956326-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414217aa-3f09-11ee-9d07-274e137307ca', 'Pada Suka', 'd9956326-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414218ae-3f09-11ee-9d07-274e137307ca', 'Suka Maju', 'd9956326-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414219a8-3f09-11ee-9d07-274e137307ca', 'Perung', 'd9956326-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41421a98-3f09-11ee-9d07-274e137307ca', 'Emang Lestari', 'd9956326-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41421bce-3f09-11ee-9d07-274e137307ca', 'Luar', 'd995645c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41421cc8-3f09-11ee-9d07-274e137307ca', 'Baru', 'd995645c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41421db8-3f09-11ee-9d07-274e137307ca', 'Kalimango', 'd995645c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41421eb2-3f09-11ee-9d07-274e137307ca', 'Marente', 'd995645c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41421fa2-3f09-11ee-9d07-274e137307ca', 'Juran Alas', 'd995645c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142209c-3f09-11ee-9d07-274e137307ca', 'Dalam', 'd995645c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41422196-3f09-11ee-9d07-274e137307ca', 'Pulau Bungin', 'd995645c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41422286-3f09-11ee-9d07-274e137307ca', 'Labuhan Alas', 'd995645c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414223c6-3f09-11ee-9d07-274e137307ca', 'Stowe Brang', 'd9956588-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414224c0-3f09-11ee-9d07-274e137307ca', 'Labuhan Bajo', 'd9956588-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414225ba-3f09-11ee-9d07-274e137307ca', 'Pukat', 'd9956588-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414226aa-3f09-11ee-9d07-274e137307ca', 'Orong Bawa', 'd9956588-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414227a4-3f09-11ee-9d07-274e137307ca', 'Jorok', 'd9956588-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142289e-3f09-11ee-9d07-274e137307ca', 'Motong', 'd9956588-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142298e-3f09-11ee-9d07-274e137307ca', 'Tengah', 'd9956588-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41422a88-3f09-11ee-9d07-274e137307ca', 'Sebedo', 'd9956588-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41422b82-3f09-11ee-9d07-274e137307ca', 'Bale Brang', 'd9956588-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41422cae-3f09-11ee-9d07-274e137307ca', 'Batu Rotok', 'd995674a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41422da8-3f09-11ee-9d07-274e137307ca', 'Tangkam Pulit', 'd995674a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41422ea2-3f09-11ee-9d07-274e137307ca', 'Bao Desa', 'd995674a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41422f92-3f09-11ee-9d07-274e137307ca', 'Tepal', 'd995674a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142308c-3f09-11ee-9d07-274e137307ca', 'Kelungkung', 'd995674a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142317c-3f09-11ee-9d07-274e137307ca', 'Semongkat', 'd995674a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414232b2-3f09-11ee-9d07-274e137307ca', 'Samapuin', 'd9956876-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414233ac-3f09-11ee-9d07-274e137307ca', 'Brang Bara', 'd9956876-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414234a6-3f09-11ee-9d07-274e137307ca', 'Pekat', 'd9956876-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41423596-3f09-11ee-9d07-274e137307ca', 'Seketeng', 'd9956876-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41423690-3f09-11ee-9d07-274e137307ca', 'Bugis', 'd9956876-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41423780-3f09-11ee-9d07-274e137307ca', 'Lempeh', 'd9956876-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142387a-3f09-11ee-9d07-274e137307ca', 'Brang Biji', 'd9956876-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41424252-3f09-11ee-9d07-274e137307ca', 'Uma Sima', 'd9956876-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414243ce-3f09-11ee-9d07-274e137307ca', 'Moyo', 'd99569a2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414244fa-3f09-11ee-9d07-274e137307ca', 'Kakiang', 'd99569a2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41424612-3f09-11ee-9d07-274e137307ca', 'Ngeru', 'd99569a2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414246e4-3f09-11ee-9d07-274e137307ca', 'Berare', 'd99569a2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142482e-3f09-11ee-9d07-274e137307ca', 'Poto', 'd99569a2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414248f6-3f09-11ee-9d07-274e137307ca', 'Serading', 'd99569a2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414249be-3f09-11ee-9d07-274e137307ca', 'Olat Rawa', 'd99569a2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41424a7c-3f09-11ee-9d07-274e137307ca', 'Batu Bangka', 'd99569a2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41424b3a-3f09-11ee-9d07-274e137307ca', 'Moyo Mekar', 'd99569a2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41424bf8-3f09-11ee-9d07-274e137307ca', 'Labuhan Ijuk', 'd99569a2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41424d4c-3f09-11ee-9d07-274e137307ca', 'Sempe', 'd9956bdc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41424e14-3f09-11ee-9d07-274e137307ca', 'Semamung', 'd9956bdc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41424ed2-3f09-11ee-9d07-274e137307ca', 'Sebasang', 'd9956bdc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41424fe0-3f09-11ee-9d07-274e137307ca', 'Batu Tering', 'd9956bdc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414250b2-3f09-11ee-9d07-274e137307ca', 'Batu Bulan', 'd9956bdc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41425170-3f09-11ee-9d07-274e137307ca', 'Mokong', 'd9956bdc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41425274-3f09-11ee-9d07-274e137307ca', 'Pernek', 'd9956bdc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142533c-3f09-11ee-9d07-274e137307ca', 'Leseng', 'd9956bdc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414253fa-3f09-11ee-9d07-274e137307ca', 'Lito', 'd9956bdc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414254b8-3f09-11ee-9d07-274e137307ca', 'Marga Karya', 'd9956bdc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414255c6-3f09-11ee-9d07-274e137307ca', 'Maman', 'd9956bdc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142568e-3f09-11ee-9d07-274e137307ca', 'Brang Rea', 'd9956bdc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41425774-3f09-11ee-9d07-274e137307ca', 'Lebin', 'd9956d08-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41425896-3f09-11ee-9d07-274e137307ca', 'Ropang', 'd9956d08-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142595e-3f09-11ee-9d07-274e137307ca', 'Lawin', 'd9956d08-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41425a1c-3f09-11ee-9d07-274e137307ca', 'Ranan', 'd9956d08-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41425ad0-3f09-11ee-9d07-274e137307ca', 'Lebangkar', 'd9956d08-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41425bb6-3f09-11ee-9d07-274e137307ca', 'Lape', 'd9956e34-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41425c74-3f09-11ee-9d07-274e137307ca', 'Labuhan Kuris', 'd9956e34-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41425d8c-3f09-11ee-9d07-274e137307ca', 'Dete', 'd9956e34-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41425e4a-3f09-11ee-9d07-274e137307ca', 'Hijrah', 'd9956e34-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41425f3a-3f09-11ee-9d07-274e137307ca', 'Muer', 'd9956f74-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142603e-3f09-11ee-9d07-274e137307ca', 'Plampang', 'd9956f74-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41426106-3f09-11ee-9d07-274e137307ca', 'Teluk Santong', 'd9956f74-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414261c4-3f09-11ee-9d07-274e137307ca', 'Sepayung', 'd9956f74-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414262d2-3f09-11ee-9d07-274e137307ca', 'Sepakat', 'd9956f74-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41426390-3f09-11ee-9d07-274e137307ca', 'UPT Perode SP I', 'd9956f74-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142644e-3f09-11ee-9d07-274e137307ca', 'UPT Perode SP II', 'd9956f74-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142658e-3f09-11ee-9d07-274e137307ca', 'UPT Perode SP III', 'd9956f74-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142664c-3f09-11ee-9d07-274e137307ca', 'Selanteh', 'd9956f74-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142670a-3f09-11ee-9d07-274e137307ca', 'Brang Kolong', 'd9956f74-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41426822-3f09-11ee-9d07-274e137307ca', 'Usar', 'd9956f74-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41426912-3f09-11ee-9d07-274e137307ca', 'Boal', 'd99571a4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414269f8-3f09-11ee-9d07-274e137307ca', 'Jotang', 'd99571a4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41426b9c-3f09-11ee-9d07-274e137307ca', 'Empang Atas', 'd99571a4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41426c64-3f09-11ee-9d07-274e137307ca', 'Empang Bawa', 'd99571a4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41426d7c-3f09-11ee-9d07-274e137307ca', 'Ongko', 'd99571a4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41426e44-3f09-11ee-9d07-274e137307ca', 'Lamenta', 'd99571a4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41426ef8-3f09-11ee-9d07-274e137307ca', 'Gapit', 'd99571a4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41426ffc-3f09-11ee-9d07-274e137307ca', 'Pamanto', 'd99571a4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414270c4-3f09-11ee-9d07-274e137307ca', 'Bunga Eja', 'd99571a4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41427178-3f09-11ee-9d07-274e137307ca', 'Jotang Beru', 'd99571a4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41427272-3f09-11ee-9d07-274e137307ca', 'Mapin Rea', 'd99572e4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142733a-3f09-11ee-9d07-274e137307ca', 'Mapin Kebak', 'd99572e4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414273f8-3f09-11ee-9d07-274e137307ca', 'Labuhan Mapin', 'd99572e4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142751a-3f09-11ee-9d07-274e137307ca', 'Lekong', 'd99572e4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414275d8-3f09-11ee-9d07-274e137307ca', 'Gontar', 'd99572e4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142768c-3f09-11ee-9d07-274e137307ca', 'Usar Mapin', 'd99572e4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414277ae-3f09-11ee-9d07-274e137307ca', 'Gontar Baru', 'd99572e4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142786c-3f09-11ee-9d07-274e137307ca', 'Mapin Beru', 'd99572e4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41427998-3f09-11ee-9d07-274e137307ca', 'Labuhan Badas', 'd9957492-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41427a56-3f09-11ee-9d07-274e137307ca', 'Karang Dima', 'd9957492-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41427b0a-3f09-11ee-9d07-274e137307ca', 'Labuhan Sumbawa', 'd9957492-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41427c54-3f09-11ee-9d07-274e137307ca', 'Labuhan Aji', 'd9957492-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41427d12-3f09-11ee-9d07-274e137307ca', 'Sebotok', 'd9957492-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41427dd0-3f09-11ee-9d07-274e137307ca', 'Bajo Medang', 'd9957492-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41427ede-3f09-11ee-9d07-274e137307ca', 'Bugis Medang', 'd9957492-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41427f9c-3f09-11ee-9d07-274e137307ca', 'Kanar', 'd9957492-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414280dc-3f09-11ee-9d07-274e137307ca', 'Labangka', 'd99575c8-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142819a-3f09-11ee-9d07-274e137307ca', 'Sekokat', 'd99575c8-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428258-3f09-11ee-9d07-274e137307ca', 'Suka Mulya', 'd99575c8-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428366-3f09-11ee-9d07-274e137307ca', 'Suka Damai', 'd99575c8-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428424-3f09-11ee-9d07-274e137307ca', 'Jaya Makmur', 'd99575c8-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428500-3f09-11ee-9d07-274e137307ca', 'Tarusa', 'd99576ea-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142864a-3f09-11ee-9d07-274e137307ca', 'Juru Mapin', 'd99576ea-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428708-3f09-11ee-9d07-274e137307ca', 'Kalabeso', 'd99576ea-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414287bc-3f09-11ee-9d07-274e137307ca', 'Labuhan Burung', 'd99576ea-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428906-3f09-11ee-9d07-274e137307ca', 'Pulau Kaung', 'd99576ea-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414289c4-3f09-11ee-9d07-274e137307ca', 'Buin Baru', 'd99576ea-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428a78-3f09-11ee-9d07-274e137307ca', 'Propok', 'd99576ea-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428ba4-3f09-11ee-9d07-274e137307ca', 'Rhee', 'd9957816-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428c62-3f09-11ee-9d07-274e137307ca', 'Sampe', 'd9957816-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428d20-3f09-11ee-9d07-274e137307ca', 'Luk', 'd9957816-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428e24-3f09-11ee-9d07-274e137307ca', 'Rhee Loka', 'd9957816-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428f14-3f09-11ee-9d07-274e137307ca', 'Pelat', 'd9957906-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41428fc8-3f09-11ee-9d07-274e137307ca', 'Kerekeh', 'd9957906-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142911c-3f09-11ee-9d07-274e137307ca', 'Boak', 'd9957906-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414291da-3f09-11ee-9d07-274e137307ca', 'Jorok', 'd9957906-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142928e-3f09-11ee-9d07-274e137307ca', 'Kerato', 'd9957906-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41429374-3f09-11ee-9d07-274e137307ca', 'Pungka', 'd9957906-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41429432-3f09-11ee-9d07-274e137307ca', 'Uma Beringin', 'd9957906-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414294fa-3f09-11ee-9d07-274e137307ca', 'Nijang', 'd9957906-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414295ea-3f09-11ee-9d07-274e137307ca', 'Pungkit', 'd995797e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414296f8-3f09-11ee-9d07-274e137307ca', 'Sebewe', 'd995797e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414297b6-3f09-11ee-9d07-274e137307ca', 'Penyaring', 'd995797e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142986a-3f09-11ee-9d07-274e137307ca', 'Kukin', 'd995797e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41429978-3f09-11ee-9d07-274e137307ca', 'Baru Tahan', 'd995797e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41429a36-3f09-11ee-9d07-274e137307ca', 'Songkar', 'd995797e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41429b9e-3f09-11ee-9d07-274e137307ca', 'Simu', 'd99579ec-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41429c5c-3f09-11ee-9d07-274e137307ca', 'Maronge', 'd99579ec-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41429d1a-3f09-11ee-9d07-274e137307ca', 'Pamasar', 'd99579ec-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41429dce-3f09-11ee-9d07-274e137307ca', 'Labuhan Sangoro', 'd99579ec-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41429f0e-3f09-11ee-9d07-274e137307ca', 'Bantulante', 'd9957a5a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41429fcc-3f09-11ee-9d07-274e137307ca', 'Labuhan Bontong', 'd9957a5a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a0d0-3f09-11ee-9d07-274e137307ca', 'Labuhan Aji', 'd9957a5a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a18e-3f09-11ee-9d07-274e137307ca', 'Labuhan Jambu', 'd9957a5a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a24c-3f09-11ee-9d07-274e137307ca', 'Mata', 'd9957a5a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a350-3f09-11ee-9d07-274e137307ca', 'Tolo Oi', 'd9957a5a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a404-3f09-11ee-9d07-274e137307ca', 'Banda', 'd9957a5a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a4c2-3f09-11ee-9d07-274e137307ca', 'Labuhan Pidang', 'd9957a5a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a5a8-3f09-11ee-9d07-274e137307ca', 'Pungkit', 'd9957ac8-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a65c-3f09-11ee-9d07-274e137307ca', 'Berora', 'd9957ac8-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a710-3f09-11ee-9d07-274e137307ca', 'Lopok', 'd9957ac8-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a7d8-3f09-11ee-9d07-274e137307ca', 'Langam', 'd9957ac8-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a88c-3f09-11ee-9d07-274e137307ca', 'Mamak', 'd9957ac8-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a940-3f09-11ee-9d07-274e137307ca', 'Lopok Beru', 'd9957ac8-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142a9f4-3f09-11ee-9d07-274e137307ca', 'Tatede', 'd9957ac8-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142aada-3f09-11ee-9d07-274e137307ca', 'Senawang', 'd9957b40-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142ab8e-3f09-11ee-9d07-274e137307ca', 'Kelawis', 'd9957b40-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142ac4c-3f09-11ee-9d07-274e137307ca', 'Mungkin', 'd9957b40-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142ad00-3f09-11ee-9d07-274e137307ca', 'Sebeok', 'd9957b40-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142ae40-3f09-11ee-9d07-274e137307ca', 'Lantung', 'd9957bae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142aef4-3f09-11ee-9d07-274e137307ca', 'Sepukur', 'd9957bae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142af9e-3f09-11ee-9d07-274e137307ca', 'Ai Mual', 'd9957bae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142b098-3f09-11ee-9d07-274e137307ca', 'Padesa', 'd9957bae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142b25a-3f09-11ee-9d07-274e137307ca', 'Ledang', 'd9957c26-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142b30e-3f09-11ee-9d07-274e137307ca', 'Tatebal', 'd9957c26-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142b3ae-3f09-11ee-9d07-274e137307ca', 'Lenangguar', 'd9957c26-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142be1c-3f09-11ee-9d07-274e137307ca', 'Telaga', 'd9957c26-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142bf2a-3f09-11ee-9d07-274e137307ca', 'Tanjung', 'd9957cc6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142c01a-3f09-11ee-9d07-274e137307ca', 'Sokong', 'd9957cc6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142c0d8-3f09-11ee-9d07-274e137307ca', 'Jenggala', 'd9957cc6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142c18c-3f09-11ee-9d07-274e137307ca', 'Tegal Maja', 'd9957cc6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142c24a-3f09-11ee-9d07-274e137307ca', 'Sigar Penjalin', 'd9957cc6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142c2fe-3f09-11ee-9d07-274e137307ca', 'Medana', 'd9957cc6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142c3b2-3f09-11ee-9d07-274e137307ca', 'Teniga', 'd9957cc6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142cede-3f09-11ee-9d07-274e137307ca', 'Samaguna', 'd9957cc6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d014-3f09-11ee-9d07-274e137307ca', 'Gondang', 'd9957ee2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d0e6-3f09-11ee-9d07-274e137307ca', 'Bentek', 'd9957ee2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d1ae-3f09-11ee-9d07-274e137307ca', 'Genggelang', 'd9957ee2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d276-3f09-11ee-9d07-274e137307ca', 'Rempek', 'd9957ee2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d334-3f09-11ee-9d07-274e137307ca', 'Sambik Bangkol', 'd9957ee2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d3f2-3f09-11ee-9d07-274e137307ca', 'Segara Katon', 'd9957ee2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d4ba-3f09-11ee-9d07-274e137307ca', 'Selelos', 'd9957ee2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d564-3f09-11ee-9d07-274e137307ca', 'Rempek Darussalam', 'd9957ee2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d654-3f09-11ee-9d07-274e137307ca', 'Kayangan', 'd995807c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d712-3f09-11ee-9d07-274e137307ca', 'Santong', 'd995807c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d7d0-3f09-11ee-9d07-274e137307ca', 'Selengen', 'd995807c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d88e-3f09-11ee-9d07-274e137307ca', 'Sesait', 'd995807c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142d94c-3f09-11ee-9d07-274e137307ca', 'Gumantar', 'd995807c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142da00-3f09-11ee-9d07-274e137307ca', 'Salut', 'd995807c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142dac8-3f09-11ee-9d07-274e137307ca', 'Dangiang', 'd995807c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142db86-3f09-11ee-9d07-274e137307ca', 'Pendua', 'd995807c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142dc44-3f09-11ee-9d07-274e137307ca', 'Pansor', 'd995807c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142dcf8-3f09-11ee-9d07-274e137307ca', 'Santong Mulia', 'd995807c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142de24-3f09-11ee-9d07-274e137307ca', 'Bayan', 'd9958112-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142def6-3f09-11ee-9d07-274e137307ca', 'Loloan', 'd9958112-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142dfb4-3f09-11ee-9d07-274e137307ca', 'Anyar', 'd9958112-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142e072-3f09-11ee-9d07-274e137307ca', 'Sukadana', 'd9958112-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142e126-3f09-11ee-9d07-274e137307ca', 'Akar Akar', 'd9958112-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142e1e4-3f09-11ee-9d07-274e137307ca', 'Senaru', 'd9958112-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142e2a2-3f09-11ee-9d07-274e137307ca', 'Mumbul Sari', 'd9958112-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142e356-3f09-11ee-9d07-274e137307ca', 'Sambik Elen', 'd9958112-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142e414-3f09-11ee-9d07-274e137307ca', 'Karang Bajo', 'd9958112-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142e4b4-3f09-11ee-9d07-274e137307ca', 'Andalan', 'd9958112-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142e5a4-3f09-11ee-9d07-274e137307ca', 'Pemenang Timur', 'd9958194-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142e662-3f09-11ee-9d07-274e137307ca', 'Pemenang Barat', 'd9958194-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142e720-3f09-11ee-9d07-274e137307ca', 'Gili Indah', 'd9958194-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142e842-3f09-11ee-9d07-274e137307ca', 'Malaka', 'd9958194-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142e9f0-3f09-11ee-9d07-274e137307ca', 'Menggala', 'd9958194-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142ead6-3f09-11ee-9d07-274e137307ca', 'Praya', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142eb9e-3f09-11ee-9d07-274e137307ca', 'Leneng', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142ec52-3f09-11ee-9d07-274e137307ca', 'Gerunung', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142ed24-3f09-11ee-9d07-274e137307ca', 'Semayan', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142ede2-3f09-11ee-9d07-274e137307ca', 'Perapen', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142ee96-3f09-11ee-9d07-274e137307ca', 'Tiwugalih', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142ef54-3f09-11ee-9d07-274e137307ca', 'Panji Sari', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f012-3f09-11ee-9d07-274e137307ca', 'Renteng', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f0d0-3f09-11ee-9d07-274e137307ca', 'Mertak Tombok', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f18e-3f09-11ee-9d07-274e137307ca', 'Aik Mual', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f242-3f09-11ee-9d07-274e137307ca', 'Montong Terep', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f300-3f09-11ee-9d07-274e137307ca', 'Jago', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f3be-3f09-11ee-9d07-274e137307ca', 'Bunut Baok', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f472-3f09-11ee-9d07-274e137307ca', 'Mekar Damai', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f51c-3f09-11ee-9d07-274e137307ca', 'Gonjak', 'd9958248-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f60c-3f09-11ee-9d07-274e137307ca', 'Barejulat', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f6c0-3f09-11ee-9d07-274e137307ca', 'Ubung', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f77e-3f09-11ee-9d07-274e137307ca', 'Jelantik', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f83c-3f09-11ee-9d07-274e137307ca', 'Labulia', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f8f0-3f09-11ee-9d07-274e137307ca', 'Batu Tulis', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142f9ae-3f09-11ee-9d07-274e137307ca', 'Perina', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142fa62-3f09-11ee-9d07-274e137307ca', 'Pengenjek', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142fb20-3f09-11ee-9d07-274e137307ca', 'Puyung', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142fbd4-3f09-11ee-9d07-274e137307ca', 'Nyerot', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142fc92-3f09-11ee-9d07-274e137307ca', 'Sukarara', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142fd50-3f09-11ee-9d07-274e137307ca', 'Gemel', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142fe04-3f09-11ee-9d07-274e137307ca', 'Bonjeruk', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142fec2-3f09-11ee-9d07-274e137307ca', 'Bunkate', 'd99582c0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4142ffa8-3f09-11ee-9d07-274e137307ca', 'Bujak', 'd9958338-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41430066-3f09-11ee-9d07-274e137307ca', 'Selebung', 'd9958338-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143011a-3f09-11ee-9d07-274e137307ca', 'Peresak', 'd9958338-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414301d8-3f09-11ee-9d07-274e137307ca', 'Mantang', 'd9958338-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143028c-3f09-11ee-9d07-274e137307ca', 'Aik Darek', 'd9958338-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143034a-3f09-11ee-9d07-274e137307ca', 'Tampak Siring', 'd9958338-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414303fe-3f09-11ee-9d07-274e137307ca', 'Barabali', 'd9958338-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414304b2-3f09-11ee-9d07-274e137307ca', 'Pagutan', 'd9958338-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41430570-3f09-11ee-9d07-274e137307ca', 'Mekar Bersatu', 'd9958338-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143062e-3f09-11ee-9d07-274e137307ca', 'Beber Timur', 'd9958338-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414306e2-3f09-11ee-9d07-274e137307ca', 'Beber Barat', 'd9958338-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414307c8-3f09-11ee-9d07-274e137307ca', 'Sengkol', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41430912-3f09-11ee-9d07-274e137307ca', 'Segala Anyar', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414309d0-3f09-11ee-9d07-274e137307ca', 'Sukadana', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41430a84-3f09-11ee-9d07-274e137307ca', 'Teruwai', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41430b38-3f09-11ee-9d07-274e137307ca', 'Pengengat', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41430bf6-3f09-11ee-9d07-274e137307ca', 'Kawo', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41430cb4-3f09-11ee-9d07-274e137307ca', 'Gapura', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41430d68-3f09-11ee-9d07-274e137307ca', 'Rembitan', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41430e62-3f09-11ee-9d07-274e137307ca', 'Kuta', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41430f2a-3f09-11ee-9d07-274e137307ca', 'Pengembur', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41430fde-3f09-11ee-9d07-274e137307ca', 'Tumpak', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431092-3f09-11ee-9d07-274e137307ca', 'Mertak', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431150-3f09-11ee-9d07-274e137307ca', 'Prabu', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431204-3f09-11ee-9d07-274e137307ca', 'Tanak Awu', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414312b8-3f09-11ee-9d07-274e137307ca', 'Ketara', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143136c-3f09-11ee-9d07-274e137307ca', 'Bangket Parak', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431420-3f09-11ee-9d07-274e137307ca', 'Awang', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414314de-3f09-11ee-9d07-274e137307ca', 'Bare Lantan', 'd99583b0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414315c4-3f09-11ee-9d07-274e137307ca', 'Bonder', 'd995841e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431682-3f09-11ee-9d07-274e137307ca', 'Banyu Urip', 'd995841e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431740-3f09-11ee-9d07-274e137307ca', 'Mangkung', 'd995841e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414317f4-3f09-11ee-9d07-274e137307ca', 'Kateng', 'd995841e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414318a8-3f09-11ee-9d07-274e137307ca', 'Setanggor', 'd995841e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431966-3f09-11ee-9d07-274e137307ca', 'Penujak', 'd995841e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431a1a-3f09-11ee-9d07-274e137307ca', 'Selong Blanak', 'd995841e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431b82-3f09-11ee-9d07-274e137307ca', 'Mekar Sari', 'd995841e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431c40-3f09-11ee-9d07-274e137307ca', 'Batujai', 'd995841e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431cfe-3f09-11ee-9d07-274e137307ca', 'Tanak Rarang', 'd995841e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431de4-3f09-11ee-9d07-274e137307ca', 'Sukaraja', 'd99585e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431ea2-3f09-11ee-9d07-274e137307ca', 'Beleka', 'd99585e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41431f6a-3f09-11ee-9d07-274e137307ca', 'Semoyang', 'd99585e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143201e-3f09-11ee-9d07-274e137307ca', 'Mujur', 'd99585e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414320dc-3f09-11ee-9d07-274e137307ca', 'Landah', 'd99585e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41432190-3f09-11ee-9d07-274e137307ca', 'Sengkerang', 'd99585e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143224e-3f09-11ee-9d07-274e137307ca', 'Bilelando', 'd99585e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143230c-3f09-11ee-9d07-274e137307ca', 'Ganti', 'd99585e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414323c0-3f09-11ee-9d07-274e137307ca', 'Marong', 'd99585e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41432474-3f09-11ee-9d07-274e137307ca', 'Kidang', 'd99585e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143255a-3f09-11ee-9d07-274e137307ca', 'Lekor', 'd99586c6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41432618-3f09-11ee-9d07-274e137307ca', 'Langko', 'd99586c6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414326d6-3f09-11ee-9d07-274e137307ca', 'Janapria', 'd99586c6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143278a-3f09-11ee-9d07-274e137307ca', 'Loang Maka', 'd99586c6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41432848-3f09-11ee-9d07-274e137307ca', 'Saba', 'd99586c6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41432906-3f09-11ee-9d07-274e137307ca', 'Bakan', 'd99586c6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414329ba-3f09-11ee-9d07-274e137307ca', 'Durian', 'd99586c6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41432a78-3f09-11ee-9d07-274e137307ca', 'Pendem', 'd99586c6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41432e06-3f09-11ee-9d07-274e137307ca', 'Selebung Rembiga', 'd99586c6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41432ef6-3f09-11ee-9d07-274e137307ca', 'Kerembong', 'd99586c6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41433054-3f09-11ee-9d07-274e137307ca', 'Jango', 'd99586c6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41433112-3f09-11ee-9d07-274e137307ca', 'Setuta', 'd99586c6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143320c-3f09-11ee-9d07-274e137307ca', 'Pringgarata', 'd995875c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41433716-3f09-11ee-9d07-274e137307ca', 'Sepakek', 'd995875c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41433842-3f09-11ee-9d07-274e137307ca', 'Murbaya', 'd995875c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414339e6-3f09-11ee-9d07-274e137307ca', 'Bagu', 'd995875c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41433ab8-3f09-11ee-9d07-274e137307ca', 'Sintung', 'd995875c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41433b8a-3f09-11ee-9d07-274e137307ca', 'Bilebante', 'd995875c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41433c48-3f09-11ee-9d07-274e137307ca', 'Pemepek', 'd995875c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41433d06-3f09-11ee-9d07-274e137307ca', 'Menemeng', 'd995875c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41433e0a-3f09-11ee-9d07-274e137307ca', 'Arjangka', 'd995875c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41433f54-3f09-11ee-9d07-274e137307ca', 'Taman Indah', 'd995875c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41434012-3f09-11ee-9d07-274e137307ca', 'Sisik', 'd995875c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41434170-3f09-11ee-9d07-274e137307ca', 'Lendang Are', 'd99587d4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143424c-3f09-11ee-9d07-274e137307ca', 'Monggas', 'd99587d4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143430a-3f09-11ee-9d07-274e137307ca', 'Muncan', 'd99587d4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41434abc-3f09-11ee-9d07-274e137307ca', 'Bebuak', 'd99587d4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41434c06-3f09-11ee-9d07-274e137307ca', 'Kopang Rembiga', 'd99587d4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41434cd8-3f09-11ee-9d07-274e137307ca', 'Dasan Baru', 'd99587d4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41434da0-3f09-11ee-9d07-274e137307ca', 'Montong Gamang', 'd99587d4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41434e68-3f09-11ee-9d07-274e137307ca', 'Darmaji', 'd99587d4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41434f26-3f09-11ee-9d07-274e137307ca', 'Wajageseng', 'd99587d4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41434fe4-3f09-11ee-9d07-274e137307ca', 'Aik Bual', 'd99587d4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414350a2-3f09-11ee-9d07-274e137307ca', 'Semparu', 'd99587d4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41435156-3f09-11ee-9d07-274e137307ca', 'Peseng', 'd99587d4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143525a-3f09-11ee-9d07-274e137307ca', 'Gerantung', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41435318-3f09-11ee-9d07-274e137307ca', 'Jontlak', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414353d6-3f09-11ee-9d07-274e137307ca', 'Sasake', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41435494-3f09-11ee-9d07-274e137307ca', 'Jurang Jaler', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41435548-3f09-11ee-9d07-274e137307ca', 'Beraim', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414355fc-3f09-11ee-9d07-274e137307ca', 'Batunyala', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414356ba-3f09-11ee-9d07-274e137307ca', 'Lajut', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41435804-3f09-11ee-9d07-274e137307ca', 'Pengadang', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414358d6-3f09-11ee-9d07-274e137307ca', 'Kelebuh', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41435994-3f09-11ee-9d07-274e137307ca', 'Pejanggik', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41435a48-3f09-11ee-9d07-274e137307ca', 'Dakung', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41436772-3f09-11ee-9d07-274e137307ca', 'Prai Meke', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143684e-3f09-11ee-9d07-274e137307ca', 'Lelong', 'd995884c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41436a42-3f09-11ee-9d07-274e137307ca', 'Montong Sapah', 'd99588ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41436b14-3f09-11ee-9d07-274e137307ca', 'Ungga', 'd99588ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41436bdc-3f09-11ee-9d07-274e137307ca', 'Kabul', 'd99588ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41436ca4-3f09-11ee-9d07-274e137307ca', 'Pelambik', 'd99588ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41436d6c-3f09-11ee-9d07-274e137307ca', 'Darek', 'd99588ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41436e2a-3f09-11ee-9d07-274e137307ca', 'Ranggagata', 'd99588ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41436ee8-3f09-11ee-9d07-274e137307ca', 'Pandan Indah', 'd99588ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41436fb0-3f09-11ee-9d07-274e137307ca', 'Serage', 'd99588ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143706e-3f09-11ee-9d07-274e137307ca', 'Montong Ajan', 'd99588ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143712c-3f09-11ee-9d07-274e137307ca', 'Batu Jangkih', 'd99588ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414374f6-3f09-11ee-9d07-274e137307ca', 'Teduh', 'd99588ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143773a-3f09-11ee-9d07-274e137307ca', 'Setiling', 'd9958932-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41437802-3f09-11ee-9d07-274e137307ca', 'Tanak Beak', 'd9958932-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414378c0-3f09-11ee-9d07-274e137307ca', 'Aik Bukaq', 'd9958932-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41437988-3f09-11ee-9d07-274e137307ca', 'Teratak', 'd9958932-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41437a46-3f09-11ee-9d07-274e137307ca', 'Aik Berik', 'd9958932-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41437b04-3f09-11ee-9d07-274e137307ca', 'Mas-mas', 'd9958932-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41437bc2-3f09-11ee-9d07-274e137307ca', 'Karang Sidemen', 'd9958932-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41437cbc-3f09-11ee-9d07-274e137307ca', 'Bada', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41437d7a-3f09-11ee-9d07-274e137307ca', 'Bali', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41437e38-3f09-11ee-9d07-274e137307ca', 'Potu', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41437ef6-3f09-11ee-9d07-274e137307ca', 'Karijawa', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41437fbe-3f09-11ee-9d07-274e137307ca', 'Dora Tangga', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438072-3f09-11ee-9d07-274e137307ca', 'Kandai I', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438130-3f09-11ee-9d07-274e137307ca', 'Oo', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414381ee-3f09-11ee-9d07-274e137307ca', 'Katua', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414382ac-3f09-11ee-9d07-274e137307ca', 'Karamabura', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438356-3f09-11ee-9d07-274e137307ca', 'Mbawi', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438414-3f09-11ee-9d07-274e137307ca', 'Dore Bara', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414384d2-3f09-11ee-9d07-274e137307ca', 'Kareke', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438590-3f09-11ee-9d07-274e137307ca', 'Mangge Nae', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438644-3f09-11ee-9d07-274e137307ca', 'Manggeasi', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438702-3f09-11ee-9d07-274e137307ca', 'Sori Sakolo', 'd99589e6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414387f2-3f09-11ee-9d07-274e137307ca', 'Kempo', 'd9958a5e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414388b0-3f09-11ee-9d07-274e137307ca', 'Ta`A', 'd9958a5e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143896e-3f09-11ee-9d07-274e137307ca', 'Soro Timur', 'd9958a5e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438a2c-3f09-11ee-9d07-274e137307ca', 'Konte', 'd9958a5e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438ae0-3f09-11ee-9d07-274e137307ca', 'Tolo Kalo', 'd9958a5e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438b9e-3f09-11ee-9d07-274e137307ca', 'Songgaja', 'd9958a5e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438c5c-3f09-11ee-9d07-274e137307ca', 'Doro Kobo', 'd9958a5e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438d1a-3f09-11ee-9d07-274e137307ca', 'Soro Barat', 'd9958a5e-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438e00-3f09-11ee-9d07-274e137307ca', 'Rasa Bou', 'd9958acc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438ebe-3f09-11ee-9d07-274e137307ca', 'Daha', 'd9958acc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41438f7c-3f09-11ee-9d07-274e137307ca', 'Hu`u', 'd9958acc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143903a-3f09-11ee-9d07-274e137307ca', 'Adu', 'd9958acc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414390ee-3f09-11ee-9d07-274e137307ca', 'Cempi Jaya', 'd9958acc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414391ac-3f09-11ee-9d07-274e137307ca', 'Merada', 'd9958acc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41439260-3f09-11ee-9d07-274e137307ca', 'Jala', 'd9958acc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143931e-3f09-11ee-9d07-274e137307ca', 'Sawe', 'd9958acc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41439404-3f09-11ee-9d07-274e137307ca', 'Malaju', 'd9958b44-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414394b8-3f09-11ee-9d07-274e137307ca', 'Lasi', 'd9958b44-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41439576-3f09-11ee-9d07-274e137307ca', 'Mbuju', 'd9958b44-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41439634-3f09-11ee-9d07-274e137307ca', 'Kiwu', 'd9958b44-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414396e8-3f09-11ee-9d07-274e137307ca', 'Taropo', 'd9958b44-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143980a-3f09-11ee-9d07-274e137307ca', 'Karama', 'd9958b44-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414398f0-3f09-11ee-9d07-274e137307ca', 'Monta Baru', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414399ae-3f09-11ee-9d07-274e137307ca', 'Kandai II', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41439a6c-3f09-11ee-9d07-274e137307ca', 'Simpasai', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41439b20-3f09-11ee-9d07-274e137307ca', 'Saneo', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41439bde-3f09-11ee-9d07-274e137307ca', 'Wawonduru', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41439c9c-3f09-11ee-9d07-274e137307ca', 'Matua', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41439d5a-3f09-11ee-9d07-274e137307ca', 'Nowa', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41439e0e-3f09-11ee-9d07-274e137307ca', 'Bara', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41439ecc-3f09-11ee-9d07-274e137307ca', 'Mada Prama', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41439f80-3f09-11ee-9d07-274e137307ca', 'Riwo', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a03e-3f09-11ee-9d07-274e137307ca', 'Mumbu', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a0fc-3f09-11ee-9d07-274e137307ca', 'Sera Kapi', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a1ba-3f09-11ee-9d07-274e137307ca', 'Raba Baka', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a278-3f09-11ee-9d07-274e137307ca', 'Baka Jaya', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a32c-3f09-11ee-9d07-274e137307ca', 'Rasa Nae', 'd9958bb2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a412-3f09-11ee-9d07-274e137307ca', 'Pekat', 'd9958e78-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a4d0-3f09-11ee-9d07-274e137307ca', 'Nangamiro', 'd9958e78-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a58e-3f09-11ee-9d07-274e137307ca', 'Kadindi', 'd9958e78-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a642-3f09-11ee-9d07-274e137307ca', 'Beringin Jaya', 'd9958e78-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a700-3f09-11ee-9d07-274e137307ca', 'Sori Nomo', 'd9958e78-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a7be-3f09-11ee-9d07-274e137307ca', 'Tambora', 'd9958e78-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a908-3f09-11ee-9d07-274e137307ca', 'Doro Peti', 'd9958e78-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143a9bc-3f09-11ee-9d07-274e137307ca', 'Karombo', 'd9958e78-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143aaca-3f09-11ee-9d07-274e137307ca', 'Kadindi Barat', 'd9958e78-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ab92-3f09-11ee-9d07-274e137307ca', 'Nangakara', 'd9958e78-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ac3c-3f09-11ee-9d07-274e137307ca', 'Sori Tatanga', 'd9958e78-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143acfa-3f09-11ee-9d07-274e137307ca', 'Calabai', 'd9958e78-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ae58-3f09-11ee-9d07-274e137307ca', 'Soriutu', 'd9958efa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143af16-3f09-11ee-9d07-274e137307ca', 'Banggo', 'd9958efa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143afd4-3f09-11ee-9d07-274e137307ca', 'Kwangko', 'd9958efa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b092-3f09-11ee-9d07-274e137307ca', 'Suka Damai', 'd9958efa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b146-3f09-11ee-9d07-274e137307ca', 'Nusa Jaya', 'd9958efa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b204-3f09-11ee-9d07-274e137307ca', 'Doromelo', 'd9958efa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b2b8-3f09-11ee-9d07-274e137307ca', 'Nangatumpu', 'd9958efa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b376-3f09-11ee-9d07-274e137307ca', 'Kampasi Meci', 'd9958efa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b42a-3f09-11ee-9d07-274e137307ca', 'Teka Sire', 'd9958efa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b4de-3f09-11ee-9d07-274e137307ca', 'Anamina', 'd9958efa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b59c-3f09-11ee-9d07-274e137307ca', 'Tanju', 'd9958efa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b646-3f09-11ee-9d07-274e137307ca', 'Lanci Jaya', 'd9958efa-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b722-3f09-11ee-9d07-274e137307ca', 'Ranggo', 'd9958f72-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b7e0-3f09-11ee-9d07-274e137307ca', 'Jambu', 'd9958f72-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b89e-3f09-11ee-9d07-274e137307ca', 'Lepadi', 'd9958f72-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143b95c-3f09-11ee-9d07-274e137307ca', 'Lune', 'd9958f72-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ba38-3f09-11ee-9d07-274e137307ca', 'Woko', 'd9958f72-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143bb00-3f09-11ee-9d07-274e137307ca', 'Tembal Lae', 'd9958f72-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143bbb4-3f09-11ee-9d07-274e137307ca', 'Soro Adu', 'd9958f72-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143bca4-3f09-11ee-9d07-274e137307ca', 'Goa', 'd995901c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143bd58-3f09-11ee-9d07-274e137307ca', 'Belo', 'd995901c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143be20-3f09-11ee-9d07-274e137307ca', 'Beru', 'd995901c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143bf24-3f09-11ee-9d07-274e137307ca', 'Dasan Anyar', 'd995901c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143c00a-3f09-11ee-9d07-274e137307ca', 'Menala', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143c0c8-3f09-11ee-9d07-274e137307ca', 'Kuang', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143c186-3f09-11ee-9d07-274e137307ca', 'Bugis', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143c244-3f09-11ee-9d07-274e137307ca', 'Dalam', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143c302-3f09-11ee-9d07-274e137307ca', 'Sampir', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143c3c0-3f09-11ee-9d07-274e137307ca', 'Telaga Bertong', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143c47e-3f09-11ee-9d07-274e137307ca', 'Arab Kenangan', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143c53c-3f09-11ee-9d07-274e137307ca', 'Labuhan Lalar', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143c5fa-3f09-11ee-9d07-274e137307ca', 'Lalar Liang', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143c6c2-3f09-11ee-9d07-274e137307ca', 'Labuhan Kertasari', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143c776-3f09-11ee-9d07-274e137307ca', 'Seloto', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ce2e-3f09-11ee-9d07-274e137307ca', 'Tamekan', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143cef6-3f09-11ee-9d07-274e137307ca', 'Banjar', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143cfb4-3f09-11ee-9d07-274e137307ca', 'Batu Putih', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d072-3f09-11ee-9d07-274e137307ca', 'Sermong', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d126-3f09-11ee-9d07-274e137307ca', 'Lamunga', 'd9959094-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d216-3f09-11ee-9d07-274e137307ca', 'Meraran', 'd995910c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d2d4-3f09-11ee-9d07-274e137307ca', 'Air Suning', 'd995910c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d39c-3f09-11ee-9d07-274e137307ca', 'Rempe', 'd995910c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d45a-3f09-11ee-9d07-274e137307ca', 'Seteluk Atas', 'd995910c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d50e-3f09-11ee-9d07-274e137307ca', 'Seteluk Tengah', 'd995910c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d5cc-3f09-11ee-9d07-274e137307ca', 'Kelanir', 'd995910c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d680-3f09-11ee-9d07-274e137307ca', 'Tapir', 'd995910c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d73e-3f09-11ee-9d07-274e137307ca', 'Seran', 'd995910c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d7fc-3f09-11ee-9d07-274e137307ca', 'Rempe Beru', 'd995910c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d8a6-3f09-11ee-9d07-274e137307ca', 'Lamusung', 'd995910c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143d98c-3f09-11ee-9d07-274e137307ca', 'Sekongkang Atas', 'd995917a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143da4a-3f09-11ee-9d07-274e137307ca', 'Sekongkang Bawah', 'd995917a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143dafe-3f09-11ee-9d07-274e137307ca', 'Tongo', 'd995917a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143dbbc-3f09-11ee-9d07-274e137307ca', 'Ai Kangkung', 'd995917a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143dc7a-3f09-11ee-9d07-274e137307ca', 'Tatar', 'd995917a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143dd2e-3f09-11ee-9d07-274e137307ca', 'Talonang Baru', 'd995917a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ddec-3f09-11ee-9d07-274e137307ca', 'Kemuning', 'd995917a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143de96-3f09-11ee-9d07-274e137307ca', 'Lemar Lempo', 'd995917a-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143df7c-3f09-11ee-9d07-274e137307ca', 'Desa Beru', 'd9959238-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e030-3f09-11ee-9d07-274e137307ca', 'Tepas', 'd9959238-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e0ee-3f09-11ee-9d07-274e137307ca', 'Bangkat Monteh', 'd9959238-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e1ac-3f09-11ee-9d07-274e137307ca', 'Sapugara Bree', 'd9959238-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e26a-3f09-11ee-9d07-274e137307ca', 'Tepas Sepakat', 'd9959238-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e328-3f09-11ee-9d07-274e137307ca', 'Lamuntet', 'd9959238-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e3dc-3f09-11ee-9d07-274e137307ca', 'Rarak Ronges', 'd9959238-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e490-3f09-11ee-9d07-274e137307ca', 'Moteng', 'd9959238-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e544-3f09-11ee-9d07-274e137307ca', 'Seminar Salit', 'd9959238-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e62a-3f09-11ee-9d07-274e137307ca', 'Senayan', 'd99592ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e6de-3f09-11ee-9d07-274e137307ca', 'Mantar', 'd99592ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e79c-3f09-11ee-9d07-274e137307ca', 'Kiantar', 'd99592ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e850-3f09-11ee-9d07-274e137307ca', 'Poto Tano', 'd99592ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e918-3f09-11ee-9d07-274e137307ca', 'UPT Tambak Sari', 'd99592ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143e9d6-3f09-11ee-9d07-274e137307ca', 'Kokarlian', 'd99592ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ea8a-3f09-11ee-9d07-274e137307ca', 'Tebo', 'd99592ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143eb48-3f09-11ee-9d07-274e137307ca', 'Tuananga', 'd99592ba-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ec24-3f09-11ee-9d07-274e137307ca', 'Mura', 'd9959328-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ece2-3f09-11ee-9d07-274e137307ca', 'Lampok', 'd9959328-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ed96-3f09-11ee-9d07-274e137307ca', 'Manemeng', 'd9959328-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ee54-3f09-11ee-9d07-274e137307ca', 'Hijrah', 'd9959328-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ef12-3f09-11ee-9d07-274e137307ca', 'Mataiyang', 'd9959328-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143efc6-3f09-11ee-9d07-274e137307ca', 'Fajar', 'd9959328-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143f070-3f09-11ee-9d07-274e137307ca', 'Kalimantong', 'd9959328-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143f214-3f09-11ee-9d07-274e137307ca', 'Maluk', 'd99593a0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143f30e-3f09-11ee-9d07-274e137307ca', 'Benete', 'd99593a0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143f3cc-3f09-11ee-9d07-274e137307ca', 'Bukit Damai', 'd99593a0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143f48a-3f09-11ee-9d07-274e137307ca', 'Mantun', 'd99593a0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143f584-3f09-11ee-9d07-274e137307ca', 'Pasir Putih', 'd99593a0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143f76e-3f09-11ee-9d07-274e137307ca', 'Tolotangga', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143f872-3f09-11ee-9d07-274e137307ca', 'Sondo', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143f99e-3f09-11ee-9d07-274e137307ca', 'Simpasai', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143fa7a-3f09-11ee-9d07-274e137307ca', 'Sie', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143fb4c-3f09-11ee-9d07-274e137307ca', 'Tangga', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143fc1e-3f09-11ee-9d07-274e137307ca', 'Monta', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143fcfa-3f09-11ee-9d07-274e137307ca', 'Sekuru', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143fdb8-3f09-11ee-9d07-274e137307ca', 'Baralau', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143fe76-3f09-11ee-9d07-274e137307ca', 'Tolouwi', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4143ff98-3f09-11ee-9d07-274e137307ca', 'Wilamaci', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440060-3f09-11ee-9d07-274e137307ca', 'Pela', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440128-3f09-11ee-9d07-274e137307ca', 'Tangga Baru', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414401e6-3f09-11ee-9d07-274e137307ca', 'Nontotera', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440326-3f09-11ee-9d07-274e137307ca', 'Waro', 'd9959436-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440420-3f09-11ee-9d07-274e137307ca', 'Tambe', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440524-3f09-11ee-9d07-274e137307ca', 'Rasabau', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414405ec-3f09-11ee-9d07-274e137307ca', 'Rato', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440736-3f09-11ee-9d07-274e137307ca', 'Kananga', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414407f4-3f09-11ee-9d07-274e137307ca', 'Leu', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414408c6-3f09-11ee-9d07-274e137307ca', 'Timu', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414409ca-3f09-11ee-9d07-274e137307ca', 'Bontokape', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440ab0-3f09-11ee-9d07-274e137307ca', 'Sondosia', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440b6e-3f09-11ee-9d07-274e137307ca', 'Nggembe', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440c86-3f09-11ee-9d07-274e137307ca', 'Sanolo', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440d4e-3f09-11ee-9d07-274e137307ca', 'Tumpu', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440e16-3f09-11ee-9d07-274e137307ca', 'Rada', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440f2e-3f09-11ee-9d07-274e137307ca', 'Kara', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41440fec-3f09-11ee-9d07-274e137307ca', 'Darussalam', 'd99594ae-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144112c-3f09-11ee-9d07-274e137307ca', 'Keli', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414411fe-3f09-11ee-9d07-274e137307ca', 'Tenga', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414412da-3f09-11ee-9d07-274e137307ca', 'Tente', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414413fc-3f09-11ee-9d07-274e137307ca', 'Rabakodo', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414414ce-3f09-11ee-9d07-274e137307ca', 'Samili', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144156e-3f09-11ee-9d07-274e137307ca', 'Kalampa', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144164a-3f09-11ee-9d07-274e137307ca', 'Risa', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414416ea-3f09-11ee-9d07-274e137307ca', 'Pandai', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41441780-3f09-11ee-9d07-274e137307ca', 'Donggobolo', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144180c-3f09-11ee-9d07-274e137307ca', 'Dadibou', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144191a-3f09-11ee-9d07-274e137307ca', 'Talabiu', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414419ba-3f09-11ee-9d07-274e137307ca', 'Naru', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41441a50-3f09-11ee-9d07-274e137307ca', 'Nisa', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41441ae6-3f09-11ee-9d07-274e137307ca', 'Waduwani', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41441bd6-3f09-11ee-9d07-274e137307ca', 'Penapali', 'd995951c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41441c8a-3f09-11ee-9d07-274e137307ca', 'Ncera', 'd9959594-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41441da2-3f09-11ee-9d07-274e137307ca', 'Lido', 'd9959594-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442108-3f09-11ee-9d07-274e137307ca', 'Ngali', 'd9959594-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414421bc-3f09-11ee-9d07-274e137307ca', 'Renda', 'd9959594-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442266-3f09-11ee-9d07-274e137307ca', 'Cenggu', 'd9959594-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414423c4-3f09-11ee-9d07-274e137307ca', 'Runggu', 'd9959594-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442464-3f09-11ee-9d07-274e137307ca', 'Soki', 'd9959594-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414424fa-3f09-11ee-9d07-274e137307ca', 'Roka', 'd9959594-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144264e-3f09-11ee-9d07-274e137307ca', 'Diha', 'd9959594-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442734-3f09-11ee-9d07-274e137307ca', 'Tarlawi', 'd9959602-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414427ca-3f09-11ee-9d07-274e137307ca', 'Ntori', 'd9959602-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414428b0-3f09-11ee-9d07-274e137307ca', 'Maria', 'd9959602-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442950-3f09-11ee-9d07-274e137307ca', 'Pesa', 'd9959602-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414429dc-3f09-11ee-9d07-274e137307ca', 'Raba', 'd9959602-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442a9a-3f09-11ee-9d07-274e137307ca', 'Kambilo', 'd9959602-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442b30-3f09-11ee-9d07-274e137307ca', 'Maria Utara', 'd9959602-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442bc6-3f09-11ee-9d07-274e137307ca', 'Kombo', 'd9959602-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442c52-3f09-11ee-9d07-274e137307ca', 'Ria Mau', 'd9959602-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442d4c-3f09-11ee-9d07-274e137307ca', 'Sari', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442dec-3f09-11ee-9d07-274e137307ca', 'Boke', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442e82-3f09-11ee-9d07-274e137307ca', 'Jia', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442f0e-3f09-11ee-9d07-274e137307ca', 'Bugis', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41442f90-3f09-11ee-9d07-274e137307ca', 'Naru', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144301c-3f09-11ee-9d07-274e137307ca', 'Rasabou', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414430a8-3f09-11ee-9d07-274e137307ca', 'Sangia', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414431e8-3f09-11ee-9d07-274e137307ca', 'NaE', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144327e-3f09-11ee-9d07-274e137307ca', 'Rai Oi', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144330a-3f09-11ee-9d07-274e137307ca', 'Parangina', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41443396-3f09-11ee-9d07-274e137307ca', 'Kowo', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41443472-3f09-11ee-9d07-274e137307ca', 'Buncu', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41443512-3f09-11ee-9d07-274e137307ca', 'Poja', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144359e-3f09-11ee-9d07-274e137307ca', 'Bajo Pulo', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144367a-3f09-11ee-9d07-274e137307ca', 'Naru Barat', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41443710-3f09-11ee-9d07-274e137307ca', 'Tanah Putih', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414437a6-3f09-11ee-9d07-274e137307ca', 'Lamere', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41443878-3f09-11ee-9d07-274e137307ca', 'Oi Maci', 'd9959670-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41443936-3f09-11ee-9d07-274e137307ca', 'Ntoke', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414439cc-3f09-11ee-9d07-274e137307ca', 'Pai', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41443ae4-3f09-11ee-9d07-274e137307ca', 'Nunggi', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41443b7a-3f09-11ee-9d07-274e137307ca', 'Tawali', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41443c10-3f09-11ee-9d07-274e137307ca', 'Hadirasa', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41443ca6-3f09-11ee-9d07-274e137307ca', 'Wora', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41443d3c-3f09-11ee-9d07-274e137307ca', 'Sangiang', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41443dc8-3f09-11ee-9d07-274e137307ca', 'Bala', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444318-3f09-11ee-9d07-274e137307ca', 'Oi Tui', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414443ae-3f09-11ee-9d07-274e137307ca', 'Tadewa', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144449e-3f09-11ee-9d07-274e137307ca', 'Nanga Wera', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444534-3f09-11ee-9d07-274e137307ca', 'Ranggasolo', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414445ca-3f09-11ee-9d07-274e137307ca', 'Kalajena', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414446ce-3f09-11ee-9d07-274e137307ca', 'Mandala', 'd99596de-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144478c-3f09-11ee-9d07-274e137307ca', 'Dori Dungga', 'd9959756-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444840-3f09-11ee-9d07-274e137307ca', 'Kala', 'd9959756-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414448e0-3f09-11ee-9d07-274e137307ca', 'Oo', 'd9959756-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444980-3f09-11ee-9d07-274e137307ca', 'Mbawa', 'd9959756-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444a5c-3f09-11ee-9d07-274e137307ca', 'Palama', 'd9959756-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444af2-3f09-11ee-9d07-274e137307ca', 'Rora', 'd9959756-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444b88-3f09-11ee-9d07-274e137307ca', 'Mpili', 'd9959756-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444c1e-3f09-11ee-9d07-274e137307ca', 'Bumi Pajo', 'd9959756-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444cb4-3f09-11ee-9d07-274e137307ca', 'Ndano NaE', 'd9959756-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444d5e-3f09-11ee-9d07-274e137307ca', 'Piong', 'd995988c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444df4-3f09-11ee-9d07-274e137307ca', 'Boro', 'd995988c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444eda-3f09-11ee-9d07-274e137307ca', 'Kore', 'd995988c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41444f66-3f09-11ee-9d07-274e137307ca', 'Taloko', 'd995988c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445024-3f09-11ee-9d07-274e137307ca', 'Oi Saro', 'd995988c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414450b0-3f09-11ee-9d07-274e137307ca', 'Sandue', 'd995988c-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144516e-3f09-11ee-9d07-274e137307ca', 'Nipa', 'd9959904-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445204-3f09-11ee-9d07-274e137307ca', 'Tolowata', 'd9959904-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414452f4-3f09-11ee-9d07-274e137307ca', 'Rite', 'd9959904-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445394-3f09-11ee-9d07-274e137307ca', 'Mawu', 'd9959904-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144542a-3f09-11ee-9d07-274e137307ca', 'Talapiti', 'd9959904-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414454fc-3f09-11ee-9d07-274e137307ca', 'Kole', 'd9959904-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414455ba-3f09-11ee-9d07-274e137307ca', 'Waworada', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445650-3f09-11ee-9d07-274e137307ca', 'Karumbu', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144572c-3f09-11ee-9d07-274e137307ca', 'Rupe', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414457cc-3f09-11ee-9d07-274e137307ca', 'Kalodu', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445862-3f09-11ee-9d07-274e137307ca', 'Kawuwu', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445934-3f09-11ee-9d07-274e137307ca', 'Doro O\"o', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414459ca-3f09-11ee-9d07-274e137307ca', 'Laju', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445a60-3f09-11ee-9d07-274e137307ca', 'Kangga', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445af6-3f09-11ee-9d07-274e137307ca', 'Karampi', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445bd2-3f09-11ee-9d07-274e137307ca', 'Waduruka', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445c68-3f09-11ee-9d07-274e137307ca', 'Dumu', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445dc6-3f09-11ee-9d07-274e137307ca', 'Rompo', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445e66-3f09-11ee-9d07-274e137307ca', 'Sarae Ruma', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445ef2-3f09-11ee-9d07-274e137307ca', 'Pusu', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41445f88-3f09-11ee-9d07-274e137307ca', 'Sambane', 'd9959972-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144608c-3f09-11ee-9d07-274e137307ca', 'Kaleo', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144612c-3f09-11ee-9d07-274e137307ca', 'Simpasai', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414461c2-3f09-11ee-9d07-274e137307ca', 'Mangge', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446258-3f09-11ee-9d07-274e137307ca', 'Lanta', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414462ee-3f09-11ee-9d07-274e137307ca', 'Nggelu', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144637a-3f09-11ee-9d07-274e137307ca', 'Rato', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446410-3f09-11ee-9d07-274e137307ca', 'Sumi', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414464ec-3f09-11ee-9d07-274e137307ca', 'Soro', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446582-3f09-11ee-9d07-274e137307ca', 'Lambu', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446618-3f09-11ee-9d07-274e137307ca', 'Hidirasa', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414466a4-3f09-11ee-9d07-274e137307ca', 'Lanta Barat', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446730-3f09-11ee-9d07-274e137307ca', 'Melayu', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414467bc-3f09-11ee-9d07-274e137307ca', 'Sangga', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446848-3f09-11ee-9d07-274e137307ca', 'Monta Baru', 'd99599e0-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414468fc-3f09-11ee-9d07-274e137307ca', 'Woro', 'd9959a58-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446988-3f09-11ee-9d07-274e137307ca', 'Campa', 'd9959a58-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446a64-3f09-11ee-9d07-274e137307ca', 'Mpuri', 'd9959a58-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446af0-3f09-11ee-9d07-274e137307ca', 'Ndano', 'd9959a58-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446b7c-3f09-11ee-9d07-274e137307ca', 'Monggo', 'd9959a58-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446c12-3f09-11ee-9d07-274e137307ca', 'Dena', 'd9959a58-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446ca8-3f09-11ee-9d07-274e137307ca', 'Rade', 'd9959a58-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446d3e-3f09-11ee-9d07-274e137307ca', 'Tonda', 'd9959a58-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446dd4-3f09-11ee-9d07-274e137307ca', 'Bolo', 'd9959a58-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446e60-3f09-11ee-9d07-274e137307ca', 'Madawau', 'd9959a58-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446ef6-3f09-11ee-9d07-274e137307ca', 'Ncandi', 'd9959a58-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41446f82-3f09-11ee-9d07-274e137307ca', 'Tololara', 'd9959a58-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144702c-3f09-11ee-9d07-274e137307ca', 'Labuhan Kenanga', 'd9959ac6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414470b8-3f09-11ee-9d07-274e137307ca', 'Kawinda Nae', 'd9959ac6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41447144-3f09-11ee-9d07-274e137307ca', 'Kawinda Toi', 'd9959ac6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414471da-3f09-11ee-9d07-274e137307ca', 'Oi Panihi', 'd9959ac6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41447266-3f09-11ee-9d07-274e137307ca', 'Oi Bura', 'd9959ac6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414472f2-3f09-11ee-9d07-274e137307ca', 'Oi Katupa', 'd9959ac6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144737e-3f09-11ee-9d07-274e137307ca', 'Rasabou', 'd9959ac6-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41447432-3f09-11ee-9d07-274e137307ca', 'Bajo', 'd9959b34-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414474be-3f09-11ee-9d07-274e137307ca', 'punti', 'd9959b34-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41447f72-3f09-11ee-9d07-274e137307ca', 'Wadukopa', 'd9959b34-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448012-3f09-11ee-9d07-274e137307ca', 'Kananta', 'd9959b34-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144809e-3f09-11ee-9d07-274e137307ca', 'Sai', 'd9959b34-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448134-3f09-11ee-9d07-274e137307ca', 'Sampungu', 'd9959b34-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414481c0-3f09-11ee-9d07-274e137307ca', 'Ndano Ndere', 'd9959b34-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448242-3f09-11ee-9d07-274e137307ca', 'Lewintana', 'd9959b34-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414482f6-3f09-11ee-9d07-274e137307ca', 'Parado Wane', 'd9959bde-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448396-3f09-11ee-9d07-274e137307ca', 'Parado Rato', 'd9959bde-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448422-3f09-11ee-9d07-274e137307ca', 'Kuta', 'd9959bde-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414484ae-3f09-11ee-9d07-274e137307ca', 'Kanca', 'd9959bde-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144853a-3f09-11ee-9d07-274e137307ca', 'Lere', 'd9959bde-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414485ee-3f09-11ee-9d07-274e137307ca', 'Kaboro', 'd9959c56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144867a-3f09-11ee-9d07-274e137307ca', 'Kuta', 'd9959c56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448710-3f09-11ee-9d07-274e137307ca', 'Sambori', 'd9959c56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144879c-3f09-11ee-9d07-274e137307ca', 'Teta', 'd9959c56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448828-3f09-11ee-9d07-274e137307ca', 'Londu', 'd9959c56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414488aa-3f09-11ee-9d07-274e137307ca', 'Kaowa', 'd9959c56-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448954-3f09-11ee-9d07-274e137307ca', 'Panda', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414489ea-3f09-11ee-9d07-274e137307ca', 'Belo', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448a76-3f09-11ee-9d07-274e137307ca', 'Tolongondoa', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448b02-3f09-11ee-9d07-274e137307ca', 'Tonggondoa', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448b8e-3f09-11ee-9d07-274e137307ca', 'Tonggorisa', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448c2e-3f09-11ee-9d07-274e137307ca', 'Teke', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448cba-3f09-11ee-9d07-274e137307ca', 'Ntonggu', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448d46-3f09-11ee-9d07-274e137307ca', 'Nata', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448dd2-3f09-11ee-9d07-274e137307ca', 'Dore', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448e5e-3f09-11ee-9d07-274e137307ca', 'Roi', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448eea-3f09-11ee-9d07-274e137307ca', 'Ragi', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41448f76-3f09-11ee-9d07-274e137307ca', 'Padolo', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449002-3f09-11ee-9d07-274e137307ca', 'Bre', 'd9959cc4-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414490ac-3f09-11ee-9d07-274e137307ca', 'Paruga', 'd9959d64-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414492c8-3f09-11ee-9d07-274e137307ca', 'NaE', 'd9959d64-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144935e-3f09-11ee-9d07-274e137307ca', 'SaraE', 'd9959d64-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414493ea-3f09-11ee-9d07-274e137307ca', 'Tanjung', 'd9959d64-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449480-3f09-11ee-9d07-274e137307ca', 'Pane', 'd9959d64-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144950c-3f09-11ee-9d07-274e137307ca', 'Dara', 'd9959d64-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414495c0-3f09-11ee-9d07-274e137307ca', 'Kumbe', 'd9959ddc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449642-3f09-11ee-9d07-274e137307ca', 'Lampe', 'd9959ddc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414496c4-3f09-11ee-9d07-274e137307ca', 'Dodu', 'd9959ddc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449746-3f09-11ee-9d07-274e137307ca', 'Nungga', 'd9959ddc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414497be-3f09-11ee-9d07-274e137307ca', 'Kodo', 'd9959ddc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449840-3f09-11ee-9d07-274e137307ca', 'Oi Fo`O', 'd9959ddc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414498c2-3f09-11ee-9d07-274e137307ca', 'Lelamase', 'd9959ddc-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('414499bc-3f09-11ee-9d07-274e137307ca', 'Melayu', 'd9959e54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449a3e-3f09-11ee-9d07-274e137307ca', 'Jatiwangi', 'd9959e54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449ac0-3f09-11ee-9d07-274e137307ca', 'Jatibaru', 'd9959e54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449b42-3f09-11ee-9d07-274e137307ca', 'Kolo', 'd9959e54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449bc4-3f09-11ee-9d07-274e137307ca', 'Jatibaru Timur', 'd9959e54-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449c64-3f09-11ee-9d07-274e137307ca', 'Penaraga', 'd9959ec2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449ce6-3f09-11ee-9d07-274e137307ca', 'Rontu', 'd9959ec2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449d68-3f09-11ee-9d07-274e137307ca', 'PenanaE', 'd9959ec2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449de0-3f09-11ee-9d07-274e137307ca', 'Kendo', 'd9959ec2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449e62-3f09-11ee-9d07-274e137307ca', 'Ntobo', 'd9959ec2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449ee4-3f09-11ee-9d07-274e137307ca', 'Nitu', 'd9959ec2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449f7a-3f09-11ee-9d07-274e137307ca', 'Rabangodu Selatan', 'd9959ec2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('41449ff2-3f09-11ee-9d07-274e137307ca', 'Rabadompu Timur', 'd9959ec2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144a074-3f09-11ee-9d07-274e137307ca', 'Rite', 'd9959ec2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144a0f6-3f09-11ee-9d07-274e137307ca', 'Rabadompu Barat', 'd9959ec2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144a16e-3f09-11ee-9d07-274e137307ca', 'Rabangodu Utara', 'd9959ec2-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144a222-3f09-11ee-9d07-274e137307ca', 'Monggonao', 'd9959f30-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144a2a4-3f09-11ee-9d07-274e137307ca', 'Sadia', 'd9959f30-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144a31c-3f09-11ee-9d07-274e137307ca', 'Santi', 'd9959f30-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144a9d4-3f09-11ee-9d07-274e137307ca', 'Sambinae', 'd9959f30-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144aa74-3f09-11ee-9d07-274e137307ca', 'Penatoi', 'd9959f30-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144ab0a-3f09-11ee-9d07-274e137307ca', 'Lewirato', 'd9959f30-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144ab96-3f09-11ee-9d07-274e137307ca', 'Mande', 'd9959f30-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144ac18-3f09-11ee-9d07-274e137307ca', 'Panggi', 'd9959f30-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144aca4-3f09-11ee-9d07-274e137307ca', 'Manggemaci', 'd9959f30-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
INSERT INTO `kelurahan` VALUES ('4144ad80-3f09-11ee-9d07-274e137307ca', 'Matakando', 'd9959f30-3f05-11ee-9d07-274e137307ca', '2023-08-20 11:25:47', '2023-08-20 11:25:47');
COMMIT;

-- ----------------------------
-- Table structure for kuota
-- ----------------------------
DROP TABLE IF EXISTS `kuota`;
CREATE TABLE `kuota` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(uuid())',
  `event_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dapil_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jml_kursi` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kuota_event_id_foreign` (`event_id`),
  KEY `kuota_dapil_id_foreign` (`dapil_id`),
  CONSTRAINT `kuota_dapil_id_foreign` FOREIGN KEY (`dapil_id`) REFERENCES `dapil` (`id`),
  CONSTRAINT `kuota_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of kuota
-- ----------------------------
BEGIN;
INSERT INTO `kuota` VALUES ('(uuid())', '86e6a8d6-3f16-11ee-9d07-274e137307ca', '9a053189-b755-43f6-a049-216758bee691', 4, '2023-09-01 05:21:58', '2023-09-01 05:21:58');
INSERT INTO `kuota` VALUES ('389cc2d4-487e-11ee-9d07-274e137307ca', '86e6a8d6-3f16-11ee-9d07-274e137307ca', '9a0530f8-6877-43ad-9da9-8d41492decc4', 2, '2023-09-01 12:19:07', '2023-09-01 12:19:10');
COMMIT;

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `conversions_disk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `generated_conversions` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `media_uuid_unique` (`uuid`),
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  KEY `media_order_column_index` (`order_column`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of media
-- ----------------------------
BEGIN;
INSERT INTO `media` VALUES (4, 'App\\Models\\User', '5fddc9c4-c1c4-4648-965a-1ecc315d5e6a', '00095aa6-83b2-453a-bd66-2c656c2b43f1', 'avatars', '19', 'ahmad-mujamil-id-5fddc9c4-c1c4-4648-965a-1ecc315d5e6a.png', 'image/png', 'public', 'public', 42113, '[]', '[]', '[]', '[]', 1, '2023-09-03 19:26:59', '2023-09-03 19:26:59');
INSERT INTO `media` VALUES (5, 'App\\Models\\User', 'c065919d-c0f9-4b49-8c21-91084f0881aa', 'bef0a086-eb42-4f6f-a34d-f576e8e06ecc', 'avatars', 'login-dark', 'team-1-id-c065919d-c0f9-4b49-8c21-91084f0881aa.png', 'image/png', 'public', 'public', 245886, '[]', '[]', '[]', '[]', 1, '2023-09-15 07:00:01', '2023-09-15 07:00:01');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_reset_tokens_table', 1);
INSERT INTO `migrations` VALUES (3, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (6, '2023_03_28_171854_add_role_to_users_table', 1);
INSERT INTO `migrations` VALUES (7, '2023_08_20_004727_create_kabupaten_kota_table', 1);
INSERT INTO `migrations` VALUES (8, '2023_08_20_012047_create_partai_table', 1);
INSERT INTO `migrations` VALUES (9, '2023_08_20_020945_create_kecamatan_table', 2);
INSERT INTO `migrations` VALUES (10, '2023_08_20_021243_create_kelurahan_table', 3);
INSERT INTO `migrations` VALUES (11, '2023_08_20_034658_create_events_table', 4);
INSERT INTO `migrations` VALUES (12, '2023_08_20_052415_create_groups_table', 5);
INSERT INTO `migrations` VALUES (13, '2023_08_20_055127_create_pertanyaan_table', 6);
INSERT INTO `migrations` VALUES (15, '2023_08_20_065454_create_jawaban_table', 7);
INSERT INTO `migrations` VALUES (16, '2023_08_20_075918_create_users_profile_table', 8);
INSERT INTO `migrations` VALUES (17, '2023_08_20_080920_add_is_active_to_users_table', 8);
INSERT INTO `migrations` VALUES (18, '2023_08_22_075358_add_parent_user_id_to_users_table', 9);
INSERT INTO `migrations` VALUES (23, '2023_08_31_041012_create_dapil_table', 10);
INSERT INTO `migrations` VALUES (24, '2023_08_31_041809_create_dapil_area_table', 10);
INSERT INTO `migrations` VALUES (25, '2023_08_31_065741_add_jenis_pendaftaran_to_dapil_table', 10);
INSERT INTO `migrations` VALUES (26, '2023_09_01_034419_create_kuota_table', 11);
INSERT INTO `migrations` VALUES (27, '2023_09_03_052246_create_tps_table', 12);
INSERT INTO `migrations` VALUES (29, '2023_09_03_190139_create_media_table', 13);
INSERT INTO `migrations` VALUES (32, '2023_09_12_141248_create_registrasi_table', 14);
INSERT INTO `migrations` VALUES (34, '2023_09_13_163655_create_survey_table', 15);
INSERT INTO `migrations` VALUES (35, '2023_09_15_195718_add_is_active_to_events_table', 16);
INSERT INTO `migrations` VALUES (36, '2023_09_15_204152_create_survey_pertanyaan_table', 17);
INSERT INTO `migrations` VALUES (37, '2023_09_15_205121_create_survey_jawaban_table', 17);
INSERT INTO `migrations` VALUES (38, '2023_09_15_190837_create_penugasan_table', 18);
INSERT INTO `migrations` VALUES (39, '2023_09_15_190843_create_penugasan_area_table', 18);
INSERT INTO `migrations` VALUES (40, '2023_09_15_210336_create_hitung_suara_table', 18);
INSERT INTO `migrations` VALUES (41, '2023_10_05_082013_add_event_id_to_hitung_suara_table', 19);
INSERT INTO `migrations` VALUES (42, '2023_10_05_124117_add_event_id_to_penugasan_table', 20);
INSERT INTO `migrations` VALUES (43, '2023_10_05_144708_add_penugasan_area_id_to_hitung_suara_table', 21);
COMMIT;

-- ----------------------------
-- Table structure for partai
-- ----------------------------
DROP TABLE IF EXISTS `partai`;
CREATE TABLE `partai` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of partai
-- ----------------------------
BEGIN;
INSERT INTO `partai` VALUES ('1b566ea6-3efa-11ee-9d07-274e137307ca', 'Nasdem', '2023-08-20 01:37:21', '2023-08-20 01:37:21');
INSERT INTO `partai` VALUES ('d3d8d41a-3ef9-11ee-9d07-274e137307ca', 'Golkar', '2023-08-20 01:35:21', '2023-08-20 01:35:21');
COMMIT;

-- ----------------------------
-- Table structure for password_reset_tokens
-- ----------------------------
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_reset_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for penugasan
-- ----------------------------
DROP TABLE IF EXISTS `penugasan`;
CREATE TABLE `penugasan` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `team_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `event_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penugasan_team_id_foreign` (`team_id`),
  KEY `penugasan_event_id_foreign` (`event_id`),
  CONSTRAINT `penugasan_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `penugasan_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of penugasan
-- ----------------------------
BEGIN;
INSERT INTO `penugasan` VALUES ('9a4bc8fe-6ebb-4c8e-918b-19cb51c1ef40', 'c065919d-c0f9-4b49-8c21-91084f0881aa', '2023-10-05 17:47:33', '2023-10-05 17:47:33', '86e6a8d6-3f16-11ee-9d07-274e137307ca');
INSERT INTO `penugasan` VALUES ('9a4bdebe-870b-4637-870a-96d3357ce71f', 'c065919d-c0f9-4b49-8c21-91084f0881aa', '2023-10-05 18:48:22', '2023-10-05 18:48:22', '86e6a8d6-3f16-11ee-9d07-274e137307ca');
COMMIT;

-- ----------------------------
-- Table structure for penugasan_area
-- ----------------------------
DROP TABLE IF EXISTS `penugasan_area`;
CREATE TABLE `penugasan_area` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `penugasan_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kabupaten_kota_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kecamatan_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kelurahan_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tps_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `penugasan_area_penugasan_id_foreign` (`penugasan_id`),
  KEY `penugasan_area_kabupaten_kota_id_foreign` (`kabupaten_kota_id`),
  KEY `penugasan_area_kecamatan_id_foreign` (`kecamatan_id`),
  KEY `penugasan_area_kelurahan_id_foreign` (`kelurahan_id`),
  KEY `penugasan_area_tps_id_foreign` (`tps_id`),
  CONSTRAINT `penugasan_area_kabupaten_kota_id_foreign` FOREIGN KEY (`kabupaten_kota_id`) REFERENCES `kabupaten_kota` (`id`),
  CONSTRAINT `penugasan_area_kecamatan_id_foreign` FOREIGN KEY (`kecamatan_id`) REFERENCES `kecamatan` (`id`),
  CONSTRAINT `penugasan_area_kelurahan_id_foreign` FOREIGN KEY (`kelurahan_id`) REFERENCES `kelurahan` (`id`),
  CONSTRAINT `penugasan_area_penugasan_id_foreign` FOREIGN KEY (`penugasan_id`) REFERENCES `penugasan` (`id`) ON DELETE CASCADE,
  CONSTRAINT `penugasan_area_tps_id_foreign` FOREIGN KEY (`tps_id`) REFERENCES `tps` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of penugasan_area
-- ----------------------------
BEGIN;
INSERT INTO `penugasan_area` VALUES ('15eeb5be-6375-11ee-926a-453a53f2c502', '9a4bdebe-870b-4637-870a-96d3357ce71f', '0d37c44e-3f01-11ee-9d07-274e137307ca', 'd995567e-3f05-11ee-9d07-274e137307ca', '41414960-3f09-11ee-9d07-274e137307ca', '9a4bde69-c78b-4b71-b629-0c5d6d7b900d', '2023-10-05 18:48:22', '2023-10-05 18:48:22');
INSERT INTO `penugasan_area` VALUES ('96e4fba0-636c-11ee-926a-453a53f2c502', '9a4bc8fe-6ebb-4c8e-918b-19cb51c1ef40', '0d37c44e-3f01-11ee-9d07-274e137307ca', 'd995567e-3f05-11ee-9d07-274e137307ca', '41414866-3f09-11ee-9d07-274e137307ca', '9a4bc8be-1790-465f-95a1-b757f43e4f83', '2023-10-05 17:47:33', '2023-10-05 17:47:33');
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for pertanyaan
-- ----------------------------
DROP TABLE IF EXISTS `pertanyaan`;
CREATE TABLE `pertanyaan` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_jawaban` enum('IT','SO','MC') COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pertanyaan_group_id_foreign` (`group_id`),
  CONSTRAINT `pertanyaan_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pertanyaan
-- ----------------------------
BEGIN;
INSERT INTO `pertanyaan` VALUES ('422896aa-3f2a-11ee-9d07-274e137307ca', 'Jenis Kelamin', 'SO', 'c5ae5310-3f1c-11ee-9d07-274e137307ca', '2023-08-20 07:22:02', '2023-08-20 07:22:02');
INSERT INTO `pertanyaan` VALUES ('50164ae0-3f26-11ee-9d07-274e137307ca', 'Nama Responden', 'IT', 'c5ae5310-3f1c-11ee-9d07-274e137307ca', '2023-08-20 06:53:47', '2023-08-20 06:53:47');
INSERT INTO `pertanyaan` VALUES ('9a26e811-5cfb-4594-ab16-e434e9e6e683', 'Usia', 'SO', 'c5ae5310-3f1c-11ee-9d07-274e137307ca', '2023-09-17 09:48:48', '2023-09-17 09:48:48');
INSERT INTO `pertanyaan` VALUES ('9a26e8ec-84ec-4eba-a303-59b51f4d0738', 'Partai Politik Yang Disukai', 'SO', 'ec6679ce-3f1c-11ee-9d07-274e137307ca', '2023-09-17 09:51:12', '2023-09-17 09:51:12');
INSERT INTO `pertanyaan` VALUES ('9a26e9f1-862d-480c-9fc2-208b5eb2140a', 'Apakah Kenal dengan Caleg (Sebutkan Nama Caleg)', 'SO', 'ec6679ce-3f1c-11ee-9d07-274e137307ca', '2023-09-17 09:54:03', '2023-09-17 09:54:03');
INSERT INTO `pertanyaan` VALUES ('9a26ea67-3ab7-4e06-8cca-3e4b362c5eca', 'Pendidikan Terakhir', 'SO', 'c5ae5310-3f1c-11ee-9d07-274e137307ca', '2023-09-17 09:55:20', '2023-09-17 09:55:20');
INSERT INTO `pertanyaan` VALUES ('9a26eb35-d18b-484b-855a-34642e5b4b50', 'Jika (Sebutkan Nama Caleg) Mencalonkan Diri, Apakah Responden Mau Memilihnya ?', 'SO', 'ec6679ce-3f1c-11ee-9d07-274e137307ca', '2023-09-17 09:57:36', '2023-09-17 09:58:24');
INSERT INTO `pertanyaan` VALUES ('9a26ec3b-3324-434f-9a54-3e3c594efe9f', 'Jika (Sebutkan Nama Caleg) Terpilih, Issue Apa Yang Ingin Responden Angkat Sebagai Janji Politik ?', 'MC', 'ec6679ce-3f1c-11ee-9d07-274e137307ca', '2023-09-17 10:00:27', '2023-09-17 10:00:27');
COMMIT;

-- ----------------------------
-- Table structure for registrasi
-- ----------------------------
DROP TABLE IF EXISTS `registrasi`;
CREATE TABLE `registrasi` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `event_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dapil_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partai_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_urut` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registrasi_event_id_foreign` (`event_id`),
  KEY `registrasi_dapil_id_foreign` (`dapil_id`),
  KEY `registrasi_user_id_foreign` (`user_id`),
  KEY `registrasi_partai_id_foreign` (`partai_id`),
  CONSTRAINT `registrasi_dapil_id_foreign` FOREIGN KEY (`dapil_id`) REFERENCES `dapil` (`id`),
  CONSTRAINT `registrasi_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `registrasi_partai_id_foreign` FOREIGN KEY (`partai_id`) REFERENCES `partai` (`id`),
  CONSTRAINT `registrasi_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of registrasi
-- ----------------------------
BEGIN;
INSERT INTO `registrasi` VALUES ('9a1dc6cf-f9b1-407d-834c-009841c47937', '86e6a8d6-3f16-11ee-9d07-274e137307ca', '9a053189-b755-43f6-a049-216758bee691', '5fddc9c4-c1c4-4648-965a-1ecc315d5e6a', 'd3d8d41a-3ef9-11ee-9d07-274e137307ca', 10, '2023-09-12 20:53:22', '2023-09-12 20:53:22');
COMMIT;

-- ----------------------------
-- Table structure for survey
-- ----------------------------
DROP TABLE IF EXISTS `survey`;
CREATE TABLE `survey` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `tanggal` datetime NOT NULL,
  `event_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kabupaten_kota_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_started` tinyint(1) NOT NULL DEFAULT '0',
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'user tim sukses',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_event_id_foreign` (`event_id`),
  KEY `survey_kabupaten_kota_id_foreign` (`kabupaten_kota_id`),
  KEY `survey_kecamatan_id_foreign` (`kecamatan_id`),
  KEY `survey_kelurahan_id_foreign` (`kelurahan_id`),
  KEY `survey_user_id_foreign` (`user_id`),
  CONSTRAINT `survey_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`),
  CONSTRAINT `survey_kabupaten_kota_id_foreign` FOREIGN KEY (`kabupaten_kota_id`) REFERENCES `kabupaten_kota` (`id`),
  CONSTRAINT `survey_kecamatan_id_foreign` FOREIGN KEY (`kecamatan_id`) REFERENCES `kecamatan` (`id`),
  CONSTRAINT `survey_kelurahan_id_foreign` FOREIGN KEY (`kelurahan_id`) REFERENCES `kelurahan` (`id`),
  CONSTRAINT `survey_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of survey
-- ----------------------------
BEGIN;
INSERT INTO `survey` VALUES ('9a26ef26-9e06-4fc2-8c3a-607f45294a60', '2023-09-17 00:00:00', '86e6a8d6-3f16-11ee-9d07-274e137307ca', '0d37bcf6-3f01-11ee-9d07-274e137307ca', 'd9950fca-3f05-11ee-9d07-274e137307ca', '413f728e-3f09-11ee-9d07-274e137307ca', 1, 1, 'c065919d-c0f9-4b49-8c21-91084f0881aa', '2023-09-17 10:08:37', '2023-09-17 10:09:47');
INSERT INTO `survey` VALUES ('9a26efe9-9ffd-43ac-8e70-13aa7e79b843', '2023-09-17 00:00:00', '86e6a8d6-3f16-11ee-9d07-274e137307ca', '0d37bcf6-3f01-11ee-9d07-274e137307ca', 'd995246a-3f05-11ee-9d07-274e137307ca', '413f8d14-3f09-11ee-9d07-274e137307ca', 1, 1, 'c065919d-c0f9-4b49-8c21-91084f0881aa', '2023-09-17 10:10:45', '2023-09-17 10:12:17');
INSERT INTO `survey` VALUES ('9a27afb9-c453-4f94-96dc-b98cb932d98e', '2023-09-17 00:00:00', '86e6a8d6-3f16-11ee-9d07-274e137307ca', '0d37bcf6-3f01-11ee-9d07-274e137307ca', 'd995262c-3f05-11ee-9d07-274e137307ca', '413f728e-3f09-11ee-9d07-274e137307ca', 1, 1, 'c065919d-c0f9-4b49-8c21-91084f0881aa', '2023-09-17 19:07:05', '2023-09-17 19:09:09');
COMMIT;

-- ----------------------------
-- Table structure for survey_jawaban
-- ----------------------------
DROP TABLE IF EXISTS `survey_jawaban`;
CREATE TABLE `survey_jawaban` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(UUID())',
  `survey_pertanyaan_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jawaban` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tambahan` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bobot` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `survey_jawaban_survey_pertanyaan_id_foreign` (`survey_pertanyaan_id`),
  CONSTRAINT `survey_jawaban_survey_pertanyaan_id_foreign` FOREIGN KEY (`survey_pertanyaan_id`) REFERENCES `survey_pertanyaan` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of survey_jawaban
-- ----------------------------
BEGIN;
INSERT INTO `survey_jawaban` VALUES ('9a26ef31-d884-4c4e-80f5-6cec991877b2', '9a26ef2b-b094-4292-9f0a-1be9a13fec58', 'Zanul', '', 0, '2023-09-17 10:08:44', '2023-09-17 10:08:44');
INSERT INTO `survey_jawaban` VALUES ('9a26ef35-610b-45dc-9763-d6150f5c2b03', '9a26ef2b-b0b9-4746-b47e-a57a22462e26', 'Laki-Laki', '', 0, '2023-09-17 10:08:46', '2023-09-17 10:08:46');
INSERT INTO `survey_jawaban` VALUES ('9a26ef3f-9db1-431c-89e4-2442c79d7d56', '9a26ef2b-b0be-46e0-86a2-9e54e3e02d5c', '21-30', '', 0, '2023-09-17 10:08:53', '2023-09-17 10:08:53');
INSERT INTO `survey_jawaban` VALUES ('9a26ef4b-79e4-41e7-ba8c-61ca625194c9', '9a26ef2b-b0c2-40e3-af39-1d0896612689', 'PKB', '', 0, '2023-09-17 10:09:01', '2023-09-17 10:09:01');
INSERT INTO `survey_jawaban` VALUES ('9a26ef5b-2062-4352-b888-6f05271fc5e3', '9a26ef2b-b0c5-4dd2-8dc2-575ba483dae1', 'Iya', '', 1, '2023-09-17 10:09:11', '2023-09-17 10:09:11');
INSERT INTO `survey_jawaban` VALUES ('9a26ef7a-8b92-4e34-9fbd-bf72a4a95955', '9a26ef2b-b0c8-4b47-81f3-6b5f7047d9dd', 'Sarjana', '', 0, '2023-09-17 10:09:32', '2023-09-17 10:09:32');
INSERT INTO `survey_jawaban` VALUES ('9a26ef7f-e05e-44a7-91e5-0e126a18a327', '9a26ef2b-b0ca-4615-8dc9-eb37bf6c6e0b', 'Iya', '', 1, '2023-09-17 10:09:35', '2023-09-17 10:09:35');
INSERT INTO `survey_jawaban` VALUES ('9a26ef8f-7786-4b6d-94f6-c5f5e7004b3e', '9a26ef2b-b0cd-4672-b7e6-7cc2df5f86c9', 'Pendidikan', '', 0, '2023-09-17 10:09:45', '2023-09-17 10:09:45');
INSERT INTO `survey_jawaban` VALUES ('9a26ef8f-77f5-4f2f-904b-154005839148', '9a26ef2b-b0cd-4672-b7e6-7cc2df5f86c9', 'Issue Lingkungan', '', 0, '2023-09-17 10:09:45', '2023-09-17 10:09:45');
INSERT INTO `survey_jawaban` VALUES ('9a26ef8f-7833-42b9-ac60-604104d0bc30', '9a26ef2b-b0cd-4672-b7e6-7cc2df5f86c9', 'Fasilitas Umum', '', 0, '2023-09-17 10:09:45', '2023-09-17 10:09:45');
INSERT INTO `survey_jawaban` VALUES ('9a26f03c-a2b3-4d38-aeed-632ec14b98ae', '9a26f035-fc48-4ac2-97a1-52ff3b38fdff', 'JOKO', '', 0, '2023-09-17 10:11:39', '2023-09-17 10:11:39');
INSERT INTO `survey_jawaban` VALUES ('9a26f040-12a7-4286-b2ee-21e0a0da6eb9', '9a26f035-fc8a-4a8f-a0a7-c50ad0a973b3', 'Laki-Laki', '', 0, '2023-09-17 10:11:41', '2023-09-17 10:11:41');
INSERT INTO `survey_jawaban` VALUES ('9a26f052-8b71-41e5-867f-30018a74f505', '9a26f035-fc8f-4709-befe-e545dce92255', '21-30', '', 0, '2023-09-17 10:11:53', '2023-09-17 10:11:53');
INSERT INTO `survey_jawaban` VALUES ('9a26f058-5676-472b-b082-870174cd2da0', '9a26f035-fc92-4a6b-9f8e-a3d7d9f02f12', 'SMP', '', 0, '2023-09-17 10:11:57', '2023-09-17 10:11:57');
INSERT INTO `survey_jawaban` VALUES ('9a26f05c-df9a-41bb-9b9c-52c0caf6b3ed', '9a26f035-fc95-4df2-a4bd-6c3c6eef4d9d', 'Gerindra', '', 0, '2023-09-17 10:12:00', '2023-09-17 10:12:00');
INSERT INTO `survey_jawaban` VALUES ('9a26f066-1f01-4252-8dec-5fa838bc75ef', '9a26f035-fc97-4cad-bd78-6a6fa7544ff8', 'Tidak', '', 0, '2023-09-17 10:12:06', '2023-09-17 10:12:06');
INSERT INTO `survey_jawaban` VALUES ('9a26f06e-04c4-480b-bc12-2e760d582404', '9a26f035-fc9a-45b4-a65e-7083ed84c0b5', 'Iya', '', 1, '2023-09-17 10:12:11', '2023-09-17 10:12:11');
INSERT INTO `survey_jawaban` VALUES ('9a26f074-2915-4521-ac1e-ce65ebabfb3d', '9a26f035-fc9d-45a8-861a-0f0d489fe8bf', 'Pendidikan', '', 0, '2023-09-17 10:12:15', '2023-09-17 10:12:15');
INSERT INTO `survey_jawaban` VALUES ('9a26f074-298c-4dc9-b0a1-820b5668f4e9', '9a26f035-fc9d-45a8-861a-0f0d489fe8bf', 'Fasilitas Umum', '', 0, '2023-09-17 10:12:15', '2023-09-17 10:12:15');
INSERT INTO `survey_jawaban` VALUES ('9a26f074-29d0-4014-87c0-fd4ec7dad038', '9a26f035-fc9d-45a8-861a-0f0d489fe8bf', 'Lainnya', '', 0, '2023-09-17 10:12:15', '2023-09-17 10:12:15');
INSERT INTO `survey_jawaban` VALUES ('9a27afdd-dc76-41c2-9e48-3bb919e13906', '9a27afcc-7390-4876-aaa1-bbf1fb1ae03c', 'Adit', '', 0, '2023-09-17 19:07:29', '2023-09-17 19:07:29');
INSERT INTO `survey_jawaban` VALUES ('9a27afe7-f64e-450c-bd96-018fd1105c0e', '9a27afcc-73af-4944-a61b-50f217944348', 'Perempuan', '', 0, '2023-09-17 19:07:36', '2023-09-17 19:07:36');
INSERT INTO `survey_jawaban` VALUES ('9a27aff1-bd83-4e1e-871a-cf9ce5e37165', '9a27afcc-73b2-48a2-b86d-f25abfa39c62', '30-40', '', 0, '2023-09-17 19:07:42', '2023-09-17 19:07:42');
INSERT INTO `survey_jawaban` VALUES ('9a27affa-f668-4f35-840e-b01fc17e3ddd', '9a27afcc-73b4-40b2-a778-86941579a2b7', 'Diploma', '', 0, '2023-09-17 19:07:48', '2023-09-17 19:07:48');
INSERT INTO `survey_jawaban` VALUES ('9a27b012-4390-4ee0-99f9-b4655b904b16', '9a27afcc-73b5-497b-93c9-fd45499ab29b', 'Gerindra', '', 0, '2023-09-17 19:08:03', '2023-09-17 19:08:03');
INSERT INTO `survey_jawaban` VALUES ('9a27b02a-d139-4c97-9af8-2a67ec6294c9', '9a27afcc-73b7-4bcd-9b95-fc036f66f4bf', 'Iya', '', 1, '2023-09-17 19:08:19', '2023-09-17 19:08:19');
INSERT INTO `survey_jawaban` VALUES ('9a27b042-2d89-4618-a563-ca0f781db655', '9a27afcc-73b8-4ea6-b81b-8705f7cc2a05', 'Iya', '', 1, '2023-09-17 19:08:35', '2023-09-17 19:08:35');
INSERT INTO `survey_jawaban` VALUES ('9a27b069-3bab-47de-b90a-23f2b430fd74', '9a27afcc-73b9-4e4a-bb27-82ebd285a319', 'Harga Bahan Pokok', '', 0, '2023-09-17 19:09:00', '2023-09-17 19:09:00');
INSERT INTO `survey_jawaban` VALUES ('9a27b069-3c5e-4344-aa66-5621d6ee6e07', '9a27afcc-73b9-4e4a-bb27-82ebd285a319', 'Pendidikan', '', 0, '2023-09-17 19:09:00', '2023-09-17 19:09:00');
INSERT INTO `survey_jawaban` VALUES ('9a27b069-3c99-4eae-80e9-dcdd446956be', '9a27afcc-73b9-4e4a-bb27-82ebd285a319', 'Perbaikan Infrastruktur', '', 0, '2023-09-17 19:09:00', '2023-09-17 19:09:00');
COMMIT;

-- ----------------------------
-- Table structure for survey_pertanyaan
-- ----------------------------
DROP TABLE IF EXISTS `survey_pertanyaan`;
CREATE TABLE `survey_pertanyaan` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(UUID())',
  `survey_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pertanyaan_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_saved` tinyint(1) NOT NULL DEFAULT '0',
  `nomor` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `survey_pertanyaan_id_unique` (`survey_id`,`pertanyaan_id`),
  KEY `survey_pertanyaan_pertanyaan_id_foreign` (`pertanyaan_id`),
  CONSTRAINT `survey_pertanyaan_pertanyaan_id_foreign` FOREIGN KEY (`pertanyaan_id`) REFERENCES `pertanyaan` (`id`),
  CONSTRAINT `survey_pertanyaan_survey_id_foreign` FOREIGN KEY (`survey_id`) REFERENCES `survey` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of survey_pertanyaan
-- ----------------------------
BEGIN;
INSERT INTO `survey_pertanyaan` VALUES ('9a26ef2b-b094-4292-9f0a-1be9a13fec58', '9a26ef26-9e06-4fc2-8c3a-607f45294a60', '50164ae0-3f26-11ee-9d07-274e137307ca', 1, 1, '2023-09-17 10:08:40', '2023-09-17 10:08:44');
INSERT INTO `survey_pertanyaan` VALUES ('9a26ef2b-b0b9-4746-b47e-a57a22462e26', '9a26ef26-9e06-4fc2-8c3a-607f45294a60', '422896aa-3f2a-11ee-9d07-274e137307ca', 1, 2, '2023-09-17 10:08:40', '2023-09-17 10:08:46');
INSERT INTO `survey_pertanyaan` VALUES ('9a26ef2b-b0be-46e0-86a2-9e54e3e02d5c', '9a26ef26-9e06-4fc2-8c3a-607f45294a60', '9a26e811-5cfb-4594-ab16-e434e9e6e683', 1, 3, '2023-09-17 10:08:40', '2023-09-17 10:08:53');
INSERT INTO `survey_pertanyaan` VALUES ('9a26ef2b-b0c2-40e3-af39-1d0896612689', '9a26ef26-9e06-4fc2-8c3a-607f45294a60', '9a26e8ec-84ec-4eba-a303-59b51f4d0738', 1, 4, '2023-09-17 10:08:40', '2023-09-17 10:09:01');
INSERT INTO `survey_pertanyaan` VALUES ('9a26ef2b-b0c5-4dd2-8dc2-575ba483dae1', '9a26ef26-9e06-4fc2-8c3a-607f45294a60', '9a26e9f1-862d-480c-9fc2-208b5eb2140a', 1, 5, '2023-09-17 10:08:40', '2023-09-17 10:09:11');
INSERT INTO `survey_pertanyaan` VALUES ('9a26ef2b-b0c8-4b47-81f3-6b5f7047d9dd', '9a26ef26-9e06-4fc2-8c3a-607f45294a60', '9a26ea67-3ab7-4e06-8cca-3e4b362c5eca', 1, 6, '2023-09-17 10:08:40', '2023-09-17 10:09:32');
INSERT INTO `survey_pertanyaan` VALUES ('9a26ef2b-b0ca-4615-8dc9-eb37bf6c6e0b', '9a26ef26-9e06-4fc2-8c3a-607f45294a60', '9a26eb35-d18b-484b-855a-34642e5b4b50', 1, 7, '2023-09-17 10:08:40', '2023-09-17 10:09:35');
INSERT INTO `survey_pertanyaan` VALUES ('9a26ef2b-b0cd-4672-b7e6-7cc2df5f86c9', '9a26ef26-9e06-4fc2-8c3a-607f45294a60', '9a26ec3b-3324-434f-9a54-3e3c594efe9f', 1, 8, '2023-09-17 10:08:40', '2023-09-17 10:09:45');
INSERT INTO `survey_pertanyaan` VALUES ('9a26f035-fc48-4ac2-97a1-52ff3b38fdff', '9a26efe9-9ffd-43ac-8e70-13aa7e79b843', '50164ae0-3f26-11ee-9d07-274e137307ca', 1, 1, '2023-09-17 10:11:35', '2023-09-17 10:11:39');
INSERT INTO `survey_pertanyaan` VALUES ('9a26f035-fc8a-4a8f-a0a7-c50ad0a973b3', '9a26efe9-9ffd-43ac-8e70-13aa7e79b843', '422896aa-3f2a-11ee-9d07-274e137307ca', 1, 2, '2023-09-17 10:11:35', '2023-09-17 10:11:41');
INSERT INTO `survey_pertanyaan` VALUES ('9a26f035-fc8f-4709-befe-e545dce92255', '9a26efe9-9ffd-43ac-8e70-13aa7e79b843', '9a26e811-5cfb-4594-ab16-e434e9e6e683', 1, 3, '2023-09-17 10:11:35', '2023-09-17 10:11:53');
INSERT INTO `survey_pertanyaan` VALUES ('9a26f035-fc92-4a6b-9f8e-a3d7d9f02f12', '9a26efe9-9ffd-43ac-8e70-13aa7e79b843', '9a26ea67-3ab7-4e06-8cca-3e4b362c5eca', 1, 4, '2023-09-17 10:11:35', '2023-09-17 10:11:57');
INSERT INTO `survey_pertanyaan` VALUES ('9a26f035-fc95-4df2-a4bd-6c3c6eef4d9d', '9a26efe9-9ffd-43ac-8e70-13aa7e79b843', '9a26e8ec-84ec-4eba-a303-59b51f4d0738', 1, 5, '2023-09-17 10:11:35', '2023-09-17 10:12:00');
INSERT INTO `survey_pertanyaan` VALUES ('9a26f035-fc97-4cad-bd78-6a6fa7544ff8', '9a26efe9-9ffd-43ac-8e70-13aa7e79b843', '9a26e9f1-862d-480c-9fc2-208b5eb2140a', 1, 6, '2023-09-17 10:11:35', '2023-09-17 10:12:06');
INSERT INTO `survey_pertanyaan` VALUES ('9a26f035-fc9a-45b4-a65e-7083ed84c0b5', '9a26efe9-9ffd-43ac-8e70-13aa7e79b843', '9a26eb35-d18b-484b-855a-34642e5b4b50', 1, 7, '2023-09-17 10:11:35', '2023-09-17 10:12:11');
INSERT INTO `survey_pertanyaan` VALUES ('9a26f035-fc9d-45a8-861a-0f0d489fe8bf', '9a26efe9-9ffd-43ac-8e70-13aa7e79b843', '9a26ec3b-3324-434f-9a54-3e3c594efe9f', 1, 8, '2023-09-17 10:11:35', '2023-09-17 10:12:15');
INSERT INTO `survey_pertanyaan` VALUES ('9a27afcc-7390-4876-aaa1-bbf1fb1ae03c', '9a27afb9-c453-4f94-96dc-b98cb932d98e', '50164ae0-3f26-11ee-9d07-274e137307ca', 1, 1, '2023-09-17 19:07:18', '2023-09-17 19:07:29');
INSERT INTO `survey_pertanyaan` VALUES ('9a27afcc-73af-4944-a61b-50f217944348', '9a27afb9-c453-4f94-96dc-b98cb932d98e', '422896aa-3f2a-11ee-9d07-274e137307ca', 1, 2, '2023-09-17 19:07:18', '2023-09-17 19:07:36');
INSERT INTO `survey_pertanyaan` VALUES ('9a27afcc-73b2-48a2-b86d-f25abfa39c62', '9a27afb9-c453-4f94-96dc-b98cb932d98e', '9a26e811-5cfb-4594-ab16-e434e9e6e683', 1, 3, '2023-09-17 19:07:18', '2023-09-17 19:07:42');
INSERT INTO `survey_pertanyaan` VALUES ('9a27afcc-73b4-40b2-a778-86941579a2b7', '9a27afb9-c453-4f94-96dc-b98cb932d98e', '9a26ea67-3ab7-4e06-8cca-3e4b362c5eca', 1, 4, '2023-09-17 19:07:18', '2023-09-17 19:07:48');
INSERT INTO `survey_pertanyaan` VALUES ('9a27afcc-73b5-497b-93c9-fd45499ab29b', '9a27afb9-c453-4f94-96dc-b98cb932d98e', '9a26e8ec-84ec-4eba-a303-59b51f4d0738', 1, 5, '2023-09-17 19:07:18', '2023-09-17 19:08:03');
INSERT INTO `survey_pertanyaan` VALUES ('9a27afcc-73b7-4bcd-9b95-fc036f66f4bf', '9a27afb9-c453-4f94-96dc-b98cb932d98e', '9a26e9f1-862d-480c-9fc2-208b5eb2140a', 1, 6, '2023-09-17 19:07:18', '2023-09-17 19:08:19');
INSERT INTO `survey_pertanyaan` VALUES ('9a27afcc-73b8-4ea6-b81b-8705f7cc2a05', '9a27afb9-c453-4f94-96dc-b98cb932d98e', '9a26eb35-d18b-484b-855a-34642e5b4b50', 1, 7, '2023-09-17 19:07:18', '2023-09-17 19:08:35');
INSERT INTO `survey_pertanyaan` VALUES ('9a27afcc-73b9-4e4a-bb27-82ebd285a319', '9a27afb9-c453-4f94-96dc-b98cb932d98e', '9a26ec3b-3324-434f-9a54-3e3c594efe9f', 1, 8, '2023-09-17 19:07:18', '2023-09-17 19:09:00');
COMMIT;

-- ----------------------------
-- Table structure for tps
-- ----------------------------
DROP TABLE IF EXISTS `tps`;
CREATE TABLE `tps` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '(UUID())',
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lokasi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kabupaten_kota_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kecamatan_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `geom` geometry DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tps_kabupaten_kota_id_foreign` (`kabupaten_kota_id`),
  KEY `tps_kecamatan_id_foreign` (`kecamatan_id`),
  KEY `tps_kelurahan_id_foreign` (`kelurahan_id`),
  CONSTRAINT `tps_kabupaten_kota_id_foreign` FOREIGN KEY (`kabupaten_kota_id`) REFERENCES `kabupaten_kota` (`id`),
  CONSTRAINT `tps_kecamatan_id_foreign` FOREIGN KEY (`kecamatan_id`) REFERENCES `kecamatan` (`id`),
  CONSTRAINT `tps_kelurahan_id_foreign` FOREIGN KEY (`kelurahan_id`) REFERENCES `kelurahan` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tps
-- ----------------------------
BEGIN;
INSERT INTO `tps` VALUES ('9a0afce9-f241-4c1e-8812-cd4560026a09', 'TPS 1', 'Kantor PDAM', '0d37bcf6-3f01-11ee-9d07-274e137307ca', 'd995246a-3f05-11ee-9d07-274e137307ca', '413f8c4c-3f09-11ee-9d07-274e137307ca', NULL, '2023-09-03 05:43:55', '2023-09-03 05:48:59');
INSERT INTO `tps` VALUES ('9a26f106-836a-498e-b0d2-6b9a43b1f7be', 'TPS 2', '-', '0d37bcf6-3f01-11ee-9d07-274e137307ca', 'd9950fca-3f05-11ee-9d07-274e137307ca', '413f728e-3f09-11ee-9d07-274e137307ca', NULL, '2023-09-17 10:13:51', '2023-09-17 10:13:51');
INSERT INTO `tps` VALUES ('9a4bc8be-1790-465f-95a1-b757f43e4f83', 'TPS 123', 'KANTOR DESA DASAN GERES', '0d37c44e-3f01-11ee-9d07-274e137307ca', 'd995567e-3f05-11ee-9d07-274e137307ca', '41414866-3f09-11ee-9d07-274e137307ca', NULL, '2023-10-05 17:46:51', '2023-10-05 17:46:51');
INSERT INTO `tps` VALUES ('9a4bde69-c78b-4b71-b629-0c5d6d7b900d', 'TPS 321', 'KANTOR POS', '0d37c44e-3f01-11ee-9d07-274e137307ca', 'd995567e-3f05-11ee-9d07-274e137307ca', '41414960-3f09-11ee-9d07-274e137307ca', NULL, '2023-10-05 18:47:26', '2023-10-05 18:47:26');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'uuid()',
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('super','admin','user','team') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `parent_user_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_parent_user_id_foreign` (`parent_user_id`),
  CONSTRAINT `users_parent_user_id_foreign` FOREIGN KEY (`parent_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('5fddc9c4-c1c4-4648-965a-1ecc315d5e6a', 'Ahmad Mujamil', 'ahmad.mujamil@gmail.com', NULL, 'jamil', '$2y$10$iqyM1SdohsbFasoFxOQpve3Gl6Nab3J9Q30Yb4opq/gnUnxh9d5Tu', NULL, '2023-08-20 12:00:11', '2023-09-04 06:59:34', 'user', 1, NULL);
INSERT INTO `users` VALUES ('8512f01a-3f10-11ee-9d07-274e137307ca', 'Administrator', 'admin.voters-app@gmail.com', NULL, 'admin', '$2y$10$3JX5E6yuql6pqXuvEadB3eVzxLjqIKUijciIVkmylq0ZZOyYw1bp.', NULL, '2023-08-20 01:26:47', '2023-08-20 01:26:47', 'super', 0, NULL);
INSERT INTO `users` VALUES ('c065919d-c0f9-4b49-8c21-91084f0881aa', 'Team 1', 'ahmad.mujamil@outlook.co.id', NULL, 'team1', '$2a$10$SPxIMvPm8wOB6f7johx0ku7t5QScFC.a8PTVm7.kxqG7GlmAJihXm', NULL, '2023-09-03 20:02:00', '2023-09-03 20:02:00', 'team', 1, '5fddc9c4-c1c4-4648-965a-1ecc315d5e6a');
COMMIT;

-- ----------------------------
-- Table structure for users_profile
-- ----------------------------
DROP TABLE IF EXISTS `users_profile`;
CREATE TABLE `users_profile` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT (uuid()),
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_telp` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `kelurahan_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `partai_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `users_profile_user_id_foreign` (`user_id`),
  KEY `users_profile_kelurahan_id_foreign` (`kelurahan_id`),
  KEY `users_profile_partai_id_foreign` (`partai_id`),
  CONSTRAINT `users_profile_kelurahan_id_foreign` FOREIGN KEY (`kelurahan_id`) REFERENCES `kelurahan` (`id`),
  CONSTRAINT `users_profile_partai_id_foreign` FOREIGN KEY (`partai_id`) REFERENCES `partai` (`id`),
  CONSTRAINT `users_profile_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users_profile
-- ----------------------------
BEGIN;
INSERT INTO `users_profile` VALUES ('1d9cb718-3f51-11ee-9d07-274e137307ca', '5fddc9c4-c1c4-4648-965a-1ecc315d5e6a', 'CITARUM/PERUM DQ REGENCY B5', '09873345632', '-', '413f8bca-3f09-11ee-9d07-274e137307ca', 'd3d8d41a-3ef9-11ee-9d07-274e137307ca', '2023-08-20 12:00:11', '2023-09-03 19:31:14');
INSERT INTO `users_profile` VALUES ('9a0b9996-549b-4bc8-8515-00e3ee1309ad', 'c065919d-c0f9-4b49-8c21-91084f0881aa', 'Mataram', '09873345632', '-', '413f87e2-3f09-11ee-9d07-274e137307ca', 'd3d8d41a-3ef9-11ee-9d07-274e137307ca', '2023-09-03 20:02:00', '2023-09-15 07:00:01');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
