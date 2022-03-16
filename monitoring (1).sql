-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2021 at 08:05 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monitoring`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Getall` (IN `uid` INT, OUT `rey1` INT, OUT `name1` VARCHAR(255))  BEGIN
set @i:=0;
SELECT
t1.rey,
t1.name
INTO @rey1,@name1
FROM
(SELECT
 @i:=@i+1 as rey,
tr.id,
tr.name
FROM 
v_teachers_reyting tr)t1 where t1.id=uid;
SELECT
@rey1 as rey1,@name1 as name1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dars`
--

CREATE TABLE `dars` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `kid` int(11) NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `tipurok_id` bigint(20) UNSIGNED NOT NULL,
  `statusurok_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mavzu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guruh` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sana` date NOT NULL,
  `ilova` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ball` double(8,1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dars`
--

INSERT INTO `dars` (`id`, `user_id`, `kid`, `subject_id`, `tipurok_id`, `statusurok_id`, `mavzu`, `guruh`, `sana`, `ilova`, `ball`, `created_at`, `updated_at`) VALUES
(10, 27, 18, 2, 1, 2, 'Tergov ', '101-21', '2021-01-01', '1633517902_Akademy.pptx', 10.0, '2021-10-06 05:58:22', '2021-10-06 05:59:01'),
(15, 31, 1, 1, 1, 2, 'Kriptografiya', '101-21', '2021-10-14', '1633950819_0000test1409.png', 10.0, '2021-10-11 06:13:39', '2021-10-11 06:26:23'),
(16, 41, 11, 2, 2, 2, 'So\'roq qilish', '219-20 ', '2021-10-01', '1634797403_м1.PNG', 5.0, '2021-10-21 01:23:23', '2021-10-21 01:26:36');

-- --------------------------------------------------------

--
-- Table structure for table `dissertats`
--

CREATE TABLE `dissertats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `mavzu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maqomi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shifr` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nomi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tsana` date NOT NULL,
  `ysana` date DEFAULT NULL,
  `dalolatnoma` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ball` double DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `dissertats`
--

INSERT INTO `dissertats` (`id`, `user_id`, `mavzu`, `maqomi`, `shifr`, `nomi`, `fan`, `tsana`, `ysana`, `dalolatnoma`, `ball`, `status`, `created_at`, `updated_at`) VALUES
(5, 31, 'Axborot - kutubxona tarmoqlarini tashqi xatarlardan ximoyalash mexanizmlari', '1', '05.01.05', 'Axborot xavfsizligi', 'Texnika fanlari', '2021-07-02', '2021-10-11', '1633949867_1633517902_Akademy.pptx', 12.5, '1', '2021-10-11 05:57:23', '2021-10-11 23:55:37'),
(6, 31, 'Suniy intellekt tehnologiyalariga asoslangan qidiruv tizimlari', '2', '05.01.04', 'EXM dasturiy ta\'minoti', 'Texnika fanlari', '2021-10-01', '2021-10-12', '1633950794_photo-1535713875002-d1d0cf377fde.jpg', 35, '1', '2021-10-11 06:12:57', '2021-10-11 23:55:40'),
(7, 32, 'Avtomobil dvigitelini takomillashtirish ', '1', '05.04.06', 'Avtomobilsozlik', 'Texnika fanlari', '2021-09-29', '2021-10-11', '1633952719_XoldorovF.jpg', 12.5, '1', '2021-10-11 06:43:17', '2021-10-11 06:45:34'),
(8, 33, 'Kriptografiyaning matematik taxlillari', '1', '05.04.05', 'Kriptografiya', 'Texnika fanlari', '2021-10-01', '2021-11-07', '1633954394_icons8-contract-160.png', 12.5, '1', '2021-10-11 07:13:05', '2021-10-11 07:13:26'),
(10, 31, 'Diss test 1', '1', 'sss', '2222', 'eeee', '2021-10-01', '2021-10-23', '1634015058_icons8-rocket-80.png', 12.5, '1', '2021-10-12 00:04:18', '2021-10-12 00:04:40');

-- --------------------------------------------------------

--
-- Table structure for table `diss_maqomi`
--

CREATE TABLE `diss_maqomi` (
  `id` int(11) NOT NULL,
  `maqomi` varchar(25) NOT NULL,
  `ball` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `diss_maqomi`
--

INSERT INTO `diss_maqomi` (`id`, `maqomi`, `ball`, `created_at`, `updated_at`) VALUES
(1, 'Falsafa doktori (PhD)', 12.5, '2021-10-10 13:31:27', '2021-10-10 13:31:27'),
(2, 'Fan doktori (DSc)', 35, '2021-10-10 13:31:32', '2021-10-10 13:31:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ilmiy`
--

CREATE TABLE `ilmiy` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ilmiy`
--

INSERT INTO `ilmiy` (`id`, `name`) VALUES
(1, 'Dotsent'),
(2, 'Professor'),
(5, 'Mavjud emas');

-- --------------------------------------------------------

--
-- Table structure for table `ilmiyd`
--

CREATE TABLE `ilmiyd` (
  `id` int(11) NOT NULL,
  `ilmiydaraja` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ilmiyd`
--

INSERT INTO `ilmiyd` (`id`, `ilmiydaraja`, `created_at`, `updated_at`) VALUES
(1, 'PhD(Falsafa doktori)', '2021-10-07 08:28:39', NULL),
(2, 'DSc(Fan doktori)', '2021-10-07 08:28:39', NULL),
(3, 'Mavjud emas', '2021-10-07 08:28:52', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ilmiy_darajas`
--

CREATE TABLE `ilmiy_darajas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `ilmiyDaraja` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ilmiyDarajalova` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ilmiy_darajas`
--

INSERT INTO `ilmiy_darajas` (`id`, `user_id`, `ilmiyDaraja`, `ilmiyDarajalova`, `creator`, `status`, `created_at`, `updated_at`) VALUES
(6, 31, '1', '1633949597_icons8-contract-160.png', '31', '1', '2021-10-11 05:53:17', '2021-10-12 07:27:13'),
(7, 32, '1', '1633951345_icons8-rocket-80.png', '32', '1', '2021-10-11 06:22:25', '2021-10-12 07:27:15'),
(9, 39, '2', '1634038766_фан доктори.jpg', '39', '1', '2021-10-12 06:39:26', '2021-10-12 06:41:45'),
(10, 41, '1', '1634797097_А.Султонов илмий даража дипломи.jpg', '41', '1', '2021-10-21 01:18:17', '2021-10-21 01:21:13'),
(11, 42, '1', '1637996077_SERT2.png', '42', '1', '2021-11-27 01:54:37', '2021-11-27 01:55:51');

-- --------------------------------------------------------

--
-- Table structure for table `ilmprofiles`
--

CREATE TABLE `ilmprofiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `ilmd` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ilmdi` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iui` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `ball` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ilmprofiles`
--

INSERT INTO `ilmprofiles` (`id`, `user_id`, `ilmd`, `ilmdi`, `iu`, `iui`, `status`, `ball`, `created_at`, `updated_at`) VALUES
(11, 31, NULL, NULL, '1', '1634041676_icons8-contract-160.png', 1, NULL, '2021-10-11 05:53:11', '2021-10-12 07:27:56'),
(12, 32, NULL, NULL, '5', '1633951339_icons8-new-job-200.png', 1, NULL, '2021-10-11 06:22:19', '2021-10-12 04:15:31'),
(14, 39, NULL, NULL, '2', '1634038759_professor.jpg', 1, NULL, '2021-10-12 06:39:19', '2021-10-12 06:41:57'),
(15, 41, NULL, NULL, '1', '1634796981_А.Султонов илмий унвон дипломи.jpg', 1, NULL, '2021-10-21 01:16:21', '2021-10-21 01:21:26'),
(16, 42, NULL, NULL, '1', '1637996066_SERT.png', 1, NULL, '2021-11-27 01:54:26', '2021-11-27 01:56:01');

-- --------------------------------------------------------

--
-- Table structure for table `kafedras`
--

CREATE TABLE `kafedras` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kafName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kafedras`
--

INSERT INTO `kafedras` (`id`, `kafName`, `created_at`, `updated_at`) VALUES
(1, 'Axborot tehnologiyalari kafedrasi', NULL, NULL),
(2, 'Dastlabki tergov va kriminalistika kafedrasi', NULL, NULL),
(3, 'Davlat-huquqiy fanlar kafedrasi', NULL, NULL),
(4, 'Fuqarolik-huquqiy fanlar kafedrasi', NULL, NULL),
(5, 'Harbiy tayyorgarlik kafedrasi', NULL, NULL),
(6, 'Huquqbuzarliklar profilaktikasi kafedrasi', NULL, NULL),
(7, 'Ijtimoiy-iqtisodiy fanlar kafedrasi', NULL, NULL),
(8, 'Jamoat tartibi va xavfsizligini ta\'minlash kafedrasi', NULL, NULL),
(9, 'Jangovar va jismoniy tayyorgarlik kafedrasi', NULL, NULL),
(10, 'Jinoyat va jinoyat ijroiya huquqi kafedrasi', NULL, NULL),
(11, 'Jinoyat-protssesual huquqi kafedrasi', NULL, NULL),
(12, 'Kriminalistik ekspertizalar kafedrasi', NULL, NULL),
(13, 'Kriminalogiya kafedrasi', NULL, NULL),
(14, 'Ma\'muriy huquq kafedrasi', NULL, NULL),
(15, 'Terrorizm va odam savdosiga qarshi kurash kafedrassi', NULL, NULL),
(16, 'Tezkor-qidiruv faoliyati kafedrasi', NULL, NULL),
(17, 'Tillarni o\'rganish kafedrasi', NULL, NULL),
(18, 'Xizmat faoliyati psixologiyasi kafedrasi', NULL, NULL),
(19, 'Yo\'l harakati xavfsizligini ta\'minlash kafedrasi', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kurs`
--

CREATE TABLE `kurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `turi` int(11) NOT NULL,
  `nomi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sana` int(11) NOT NULL,
  `ball` double DEFAULT NULL,
  `ilova` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kurs`
--

INSERT INTO `kurs` (`id`, `user_id`, `turi`, `nomi`, `sana`, `ball`, `ilova`, `status`, `created_at`, `updated_at`) VALUES
(3, 31, 4, 'Axborot texnologiyalari', 1, 1.5, 'icons8-handshake-128.png', '1', '2021-10-11 06:17:38', '2021-10-11 06:32:16');

-- --------------------------------------------------------

--
-- Table structure for table `kurs_turi`
--

CREATE TABLE `kurs_turi` (
  `id` int(11) NOT NULL,
  `turi` varchar(255) NOT NULL,
  `ball` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kurs_turi`
--

INSERT INTO `kurs_turi` (`id`, `turi`, `ball`, `created_at`, `updated_at`) VALUES
(1, 'Ilmiy jamiyat, Fan to\'garagiga raxbarlik qilish', 1.2, '2021-10-10 11:08:19', '2021-10-10 13:29:21'),
(2, 'Faxrli 1-o\'rinni egallaganda', 3, '2021-10-10 11:08:19', '2021-10-10 13:29:25'),
(3, 'Faxrli 2-o\'rinni egallaganda', 2.25, '2021-10-10 11:08:19', '2021-10-10 13:29:41'),
(4, 'Faxrli 3-o\'rinni egallaganda', 1.5, '2021-10-10 11:08:19', '2021-10-10 13:29:51');

-- --------------------------------------------------------

--
-- Table structure for table `langs`
--

CREATE TABLE `langs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `langname_id` int(11) NOT NULL,
  `langtype_id` int(11) NOT NULL,
  `bsana` date NOT NULL,
  `ysana` date NOT NULL,
  `ilova` varchar(252) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ball` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `langs`
--

INSERT INTO `langs` (`id`, `user_id`, `langname_id`, `langtype_id`, `bsana`, `ysana`, `ilova`, `ball`, `status`, `created_at`, `updated_at`) VALUES
(7, 31, 1, 2, '2021-10-01', '2022-05-11', 'icons8-contract-160.png', '7.5', '1', '2021-10-11 06:17:16', '2021-10-11 06:32:09');

-- --------------------------------------------------------

--
-- Table structure for table `lang_name`
--

CREATE TABLE `lang_name` (
  `id` int(11) NOT NULL,
  `lang_name` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lang_name`
--

INSERT INTO `lang_name` (`id`, `lang_name`, `created_at`, `updated_at`) VALUES
(1, 'Ingliz tili', '2021-10-10 14:11:07', '2021-10-10 14:11:07'),
(2, 'Nemis tili', '2021-10-10 14:11:07', '2021-10-10 14:11:07'),
(3, 'Xitoy tili', '2021-10-10 14:11:07', '2021-10-10 14:11:07'),
(4, 'Turk tili', '2021-10-10 14:11:07', '2021-10-10 14:11:07');

-- --------------------------------------------------------

--
-- Table structure for table `lang_type`
--

CREATE TABLE `lang_type` (
  `id` int(11) NOT NULL,
  `lang_type` varchar(50) DEFAULT NULL,
  `ball` double NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `lang_type`
--

INSERT INTO `lang_type` (`id`, `lang_type`, `ball`, `created_at`, `updated_at`) VALUES
(1, 'A2,A2+', 5, '2021-10-10 14:12:54', '2021-10-10 18:30:49'),
(2, 'B1,B1+', 7.5, '2021-10-10 14:12:54', '2021-10-10 18:30:45'),
(3, 'B2,C1', 10, '2021-10-10 14:12:54', '2021-10-10 18:30:40');

-- --------------------------------------------------------

--
-- Table structure for table `lavozims`
--

CREATE TABLE `lavozims` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `lavozim` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lavozims`
--

INSERT INTO `lavozims` (`id`, `lavozim`, `created_at`, `updated_at`) VALUES
(2, 'Katta o\'qituvchi', NULL, NULL),
(3, 'Kafedra boshlig\'i', NULL, NULL),
(4, 'Kafedra boshlig\'i o\'rinbosari', NULL, NULL),
(5, 'O\'qituvchi', NULL, NULL),
(6, 'Kabinet boshlig\'i', NULL, NULL),
(7, 'Dotsent', NULL, NULL),
(8, 'Professor', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `loyihas`
--

CREATE TABLE `loyihas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `miqyosi` int(11) NOT NULL,
  `mavzu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `raqami` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bsana` date NOT NULL,
  `ysana` date NOT NULL,
  `buyruq` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ball` double DEFAULT NULL,
  `ilova` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `loyihas`
--

INSERT INTO `loyihas` (`id`, `user_id`, `miqyosi`, `mavzu`, `raqami`, `bsana`, `ysana`, `buyruq`, `ball`, `ilova`, `status`, `created_at`, `updated_at`) VALUES
(3, 31, 4, 'DarkNet labaratoriyasi', 'LN0078', '2021-10-01', '2022-05-13', 'BN0057', 5, '1633951015_icons8-new-job-200.png', '1', '2021-10-11 06:16:55', '2021-10-11 06:32:02');

-- --------------------------------------------------------

--
-- Table structure for table `loyiha_turi`
--

CREATE TABLE `loyiha_turi` (
  `id` int(11) NOT NULL,
  `miqyosi` varchar(191) NOT NULL,
  `ball` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `loyiha_turi`
--

INSERT INTO `loyiha_turi` (`id`, `miqyosi`, `ball`, `created_at`, `updated_at`) VALUES
(1, 'Xorijiy loyiha raxbarligi', 15, '2021-10-10 04:05:57', NULL),
(2, 'Xorijiy loyiha a\'zoligi', 7.5, '2021-10-10 04:05:57', NULL),
(3, 'Maxalliy loyiha raxbarligi', 10, '2021-10-10 04:05:57', NULL),
(4, 'Maxalliy loyiha a\'zoligi', 5, '2021-10-10 04:05:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `malakas`
--

CREATE TABLE `malakas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `turi` int(11) NOT NULL,
  `mavzu` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sana` int(11) NOT NULL,
  `kun` int(11) NOT NULL,
  `ball` double DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ilova` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `malakas`
--

INSERT INTO `malakas` (`id`, `user_id`, `turi`, `mavzu`, `sana`, `kun`, `ball`, `status`, `ilova`, `created_at`, `updated_at`) VALUES
(3, 31, 2, 'CISCO CCNA', 1, 20, 2.4, '1', 'icons8-new-job-200.png', '2021-10-11 06:17:55', '2021-10-11 06:41:40');

-- --------------------------------------------------------

--
-- Table structure for table `malaka_turi`
--

CREATE TABLE `malaka_turi` (
  `id` int(11) NOT NULL,
  `turi` varchar(50) NOT NULL,
  `ball` double NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `malaka_turi`
--

INSERT INTO `malaka_turi` (`id`, `turi`, `ball`, `created_at`, `updated_at`) VALUES
(1, 'Chet elda malaka oshirish', 0.2, '2021-10-10 12:23:14', NULL),
(2, 'Respublikada malak oshirish', 0.12, '2021-10-10 12:23:14', '2021-10-10 12:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `maqolas`
--

CREATE TABLE `maqolas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `turi` int(11) NOT NULL,
  `mavzu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mualliflik` int(11) NOT NULL,
  `miqyosi` int(11) NOT NULL,
  `ball` double DEFAULT NULL,
  `ilova` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maqolas`
--

INSERT INTO `maqolas` (`id`, `user_id`, `turi`, `mavzu`, `mualliflik`, `miqyosi`, `ball`, `ilova`, `status`, `created_at`, `updated_at`) VALUES
(6, 31, 1, 'Blokchain tehnologiyalari asosida elektron hujjat almashish tizimlarin ximoyalash istiqbollari', 1, 1, 15, '1633950881_tr_kursant.png', '1', '2021-10-11 06:14:41', '2021-10-11 06:27:14'),
(7, 32, 1, 'Транспорт воситаларининг хавфсиз ҳаракатланиш жараёнларини такомиллаштириш', 1, 3, 3.5, '1633951438_XoldorovF.jpg', '1', '2021-10-11 06:23:58', '2021-10-11 06:27:17'),
(8, 32, 2, 'OTM maqola', 1, 6, 1, '1634013446_icons8-handshake-128.png', '1', '2021-10-11 23:37:26', '2021-10-11 23:38:31'),
(9, 39, 1, 'Test', 1, 1, 15, '1635402244_1631688157_img674.jpg', '1', '2021-10-28 01:24:04', '2021-11-27 01:18:28'),
(10, 39, 1, 'gfdgfdgfdg', 1, 1, 15, '1637993845_Image_008.png', '1', '2021-11-27 01:17:25', '2021-11-27 01:18:13'),
(11, 42, 1, 'Maqola1', 3, 2, 1.6666666666667, '1637996250_photo_2021-08-26_12-09-39.jpg', '1', '2021-11-27 01:57:30', '2021-11-27 01:58:24');

-- --------------------------------------------------------

--
-- Table structure for table `maqola_miqyosi`
--

CREATE TABLE `maqola_miqyosi` (
  `id` int(11) NOT NULL,
  `miqyosi` varchar(255) NOT NULL,
  `turi` int(11) NOT NULL,
  `ball` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maqola_miqyosi`
--

INSERT INTO `maqola_miqyosi` (`id`, `miqyosi`, `turi`, `ball`, `created_at`, `updated_at`) VALUES
(1, 'Scopus, Web of Science yoki boshqa umumetirof etilgan indeksatsiyalangan ma\'lumotlar bazalari jurnallari', 1, 15, NULL, '2021-10-10 13:33:46'),
(2, 'Xorijiy nashrlarda', 1, 5, NULL, '2021-10-10 13:33:51'),
(3, 'Respublika miqyosida OAK ro\'yhatidagi nashrlar', 1, 3.5, NULL, '2021-10-10 13:33:55'),
(4, 'Xalqaro miqyosda', 2, 5, NULL, '2021-10-10 13:34:08'),
(5, 'Respublika miqyosida', 2, 2.5, NULL, '2021-10-10 13:34:11'),
(6, 'OTM miqyosida', 2, 1, NULL, '2021-10-10 13:34:18'),
(7, 'Boshqa', 2, 1, NULL, '2021-10-10 13:34:29'),
(8, 'Boshqa', 1, 1, NULL, '2021-10-10 13:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `maqola_turi`
--

CREATE TABLE `maqola_turi` (
  `id` int(11) NOT NULL,
  `turi` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maqola_turi`
--

INSERT INTO `maqola_turi` (`id`, `turi`, `created_at`, `updated_at`) VALUES
(1, 'Ilmiy maqola', '2021-10-08 07:14:02', NULL),
(2, 'Tezis, Doklad', '2021-10-08 07:14:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `turi` int(11) NOT NULL,
  `nomi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `taboq` double NOT NULL,
  `muallif` int(11) NOT NULL,
  `sana` date NOT NULL,
  `ball` double DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ilova` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `user_id`, `turi`, `nomi`, `taboq`, `muallif`, `sana`, `ball`, `status`, `ilova`, `created_at`, `updated_at`) VALUES
(5, 31, 1, 'IIO da axborot xavfsizligi', 5, 1, '2021-10-05', 12.5, '1', '1633950925_icons8-internet-64.png', '2021-10-11 06:15:25', '2021-10-11 06:27:35'),
(6, 32, 3, 'АВТОТРАНСПОРТ ВОСИТАЛАРИНИНГ ТЕХНИК ЭКСПЛУАТАЦИЯСИ ВА НАЗОРАТИ', 8, 2, '2021-10-13', 6, '1', '1633951564_XoldorovF.jpg', '2021-10-11 06:26:04', '2021-10-11 06:27:38'),
(7, 31, 1, 'd', 1, 1, '2021-10-02', NULL, NULL, '1634016275_icons8-rocket-80.png', '2021-10-12 00:24:35', '2021-10-12 00:24:35');

-- --------------------------------------------------------

--
-- Table structure for table `material_turi`
--

CREATE TABLE `material_turi` (
  `id` int(11) NOT NULL,
  `turi` varchar(50) NOT NULL,
  `ball` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `material_turi`
--

INSERT INTO `material_turi` (`id`, `turi`, `ball`, `created_at`, `updated_at`) VALUES
(1, 'Yangi darslik', 2.5, '2021-10-09 06:52:28', '2021-10-10 13:35:56'),
(2, 'Qayta nashr', 1.5, '2021-10-09 06:52:28', '2021-10-10 13:36:01'),
(3, 'Ma\'ruza kurslari, O\'quv qo\'llanma', 1.5, '2021-10-09 06:52:28', '2021-10-10 13:36:05'),
(4, 'Monografiya', 2.5, '2021-10-09 06:52:28', '2021-10-10 13:36:08');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `kafid` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message`, `kafid`, `created_at`, `updated_at`) VALUES
(10, NULL, 'Академия ахборот таълим порталига Ўзбекистон Республикаси ИИВ Академияси ходимларни “COVID-19”га қарши эмланганликлари тўғрисида маълумотнома намунаси жойлаштирилди.', NULL, '2021-10-12 07:03:06', '2021-10-12 07:03:06'),
(11, NULL, 'Амир Темур номидаги Ўзбекистон Республикаси ДХХ Академияси давлат хавфсизлигини таъминлаш масалаларига доир илмий илмий тадқиқот ахборот-тахлилий фаолият натижаларини, шунингдек махсус ҳарбий таълим ҳамда ўқув-тарбиявий жараёнининг илмий-услубий жихатларини ёритиш ва амалиётга тадбиқ этиш мақсадида \"Хавфсизлик масалалари\" илмий журнали таъсис этилганлигини маълум қилиб, профессор-ўқитувчилар томонидан журналнинг махсус очиқ сони учун хат матнида қайд этилган йўналишларга оид тайёрланган мақолаларни тақдим этилиши сўралган.', NULL, '2021-10-12 07:03:12', '2021-10-12 07:03:12');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_000000_create_users_table', 1),
(11, '2014_10_12_100000_create_password_resets_table', 1),
(12, '2019_08_19_000000_create_failed_jobs_table', 1),
(13, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(14, '2021_09_19_121413_create_kafedras_table', 1),
(15, '2021_09_26_055158_create_subjects_table', 2),
(16, '2021_09_26_054142_create_dar_typs_table', 3),
(17, '2021_09_26_055114_create_dar_stats_table', 4),
(18, '2021_09_26_054044_create_dars_table', 5),
(19, '2021_10_02_094700_create_lavozims_table', 6),
(20, '2021_10_04_040745_create_userprofiles_table', 7),
(21, '2021_10_04_051331_create_ilmprofiles_table', 8),
(22, '2021_10_04_053621_create_userimages_table', 9),
(23, '2021_10_07_053213_create_ilmiy_darajas_table', 10),
(24, '2021_10_08_064245_create_maqolas_table', 11),
(25, '2021_10_08_102811_create_dissertats_table', 12),
(26, '2021_10_09_061949_create_materials_table', 13),
(27, '2021_10_09_102912_create_patents_table', 14),
(28, '2021_10_09_103917_create_patents_table', 15),
(29, '2021_10_09_115148_create_loyihas_table', 16),
(30, '2021_10_10_055129_create_langs_table', 17),
(31, '2021_10_10_104931_create_kurs_table', 18),
(32, '2021_10_10_122532_create_malakas_table', 19),
(33, '2021_10_12_092812_create_messages_table', 20);

-- --------------------------------------------------------

--
-- Table structure for table `old_maqolas`
--

CREATE TABLE `old_maqolas` (
  `id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL,
  `turi` int(11) NOT NULL,
  `mavzu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mualliflik` int(11) NOT NULL,
  `miqyosi` int(11) NOT NULL,
  `ilova` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `old_maqolas`
--

INSERT INTO `old_maqolas` (`id`, `user_id`, `turi`, `mavzu`, `mualliflik`, `miqyosi`, `ilova`, `created_at`, `updated_at`) VALUES
(51, 52, 1, 'Ҳуқуқбузарликлар профилактикасида профилактик стратегия ва тактиканинг илмий-амалий аҳамияти.', 2, 3, '1-мақола.jpg', '2020-10-26 07:00:16', '2020-10-26 07:00:16'),
(52, 52, 1, 'Ҳуқуқбузарликлар профилактикаси ислоҳат, натижа ва истиқбол.', 2, 3, '372-мақола.pdf', '2020-10-26 08:40:43', '2020-10-26 08:40:43'),
(53, 52, 1, 'Ўзбекистон Республикаси ички ишлар вазирлиги Академияси ҳузурида жамоатчилик кенгаши тузилди', 1, 3, '369.jpg', '2020-10-27 04:14:12', '2020-10-27 04:14:12'),
(54, 52, 2, 'Ички ишлар органларида хизмат интизомини мустаҳкамлашнинг айрим масалалари', 1, 5, '366.jpg', '2020-10-28 05:31:12', '2020-10-28 05:31:12'),
(55, 52, 2, 'Ҳуқуқбузарликлар профилактикасига оид қонунлар ижросини таъминлаш билан боғлиқ муаммо ва ечимлар', 2, 5, '367.jpg', '2020-10-28 05:34:57', '2020-10-28 05:34:57'),
(56, 52, 2, 'Коррупция ва унга қарши курашишнинг долзарб масалалари', 2, 5, '370.jpg', '2020-10-29 04:53:55', '2020-10-29 04:53:55'),
(57, 60, 2, 'Kiberchinojatchilik real havf', 2, 5, 'Qalqon Shit 2020 (Kiberchinojatchilik real havf).pdf', '2020-10-30 09:38:48', '2020-10-30 09:38:48'),
(58, 60, 2, 'Киберпреступность -угроза информационному обществу', 2, 5, 'Qurolli kuchlar 2020 (Киберпреступность -угроза информационному обществу).pdf', '2020-10-30 09:39:18', '2020-10-30 09:39:18'),
(59, 60, 2, 'Педагогик жараён самарадорлигини оширишда ахборот технологиялари дастурий воситалари имкониятларидан фойдаланиш', 2, 5, 'Qurolli kuchlar 2020 (Педагогик жараён самарадорлигини оширишда ахборот технологиялари дастурий воситалари имкониятларидан фойдаланиш).pdf', '2020-10-30 09:39:42', '2020-10-30 09:39:42'),
(60, 60, 2, 'Давлат хизматларидан фойдалашда электрон хукумат тизимининг афзалликлари', 2, 5, 'TATU 2019 (Давлат хизматларидан фойдалашда электрон хукумат тизимининг афзалликлари).pdf', '2020-10-30 09:40:08', '2020-10-30 09:40:08'),
(61, 60, 2, 'Ўзбекистон республикасида электрон ҳукумат тизимини ривожлантиришнинг истиқболлари', 2, 5, 'TATU 2019 (Ўзбекистон республикасида электрон ҳукумат тизимини ривожлантиришнинг истиқболлари).pdf', '2020-10-30 09:40:30', '2020-10-30 09:40:30'),
(62, 60, 2, 'Педагогик жараён самарадорлигини оширишда ахборот технологиялари дастурий воситалари имкониятларидан фойдаланиш', 2, 5, 'TATU Qarshi filiali 2018 (Педагогик жараён самарадорлигини оширишда ахборот технологиялари дастурий воситалари имкониятларидан фойдаланиш).pdf', '2020-10-30 09:41:06', '2020-10-30 09:41:06'),
(63, 60, 2, 'Ўзбекистон республикасида электрон ҳукумат тизимини ривожлантиришнинг истиқболлари', 2, 5, 'TATU Qarshi filiali 2019 (Ўзбекистон электрон ҳукумат тизимини ривожлантиришда ҳориж тажрибаси).pdf', '2020-10-30 09:41:40', '2020-10-30 09:41:40'),
(64, 60, 2, 'Электрон ҳукумат тизимида ахборот хавфсизлигини таъминлашнинг айрим жиҳатлари', 2, 5, 'TATU Qarshi filiali 2019 (Электрон ҳукумат тизимида ахборот хавфсизлигини таъминлашнинг айрим жиҳатлари).pdf', '2020-10-30 09:42:10', '2020-10-30 09:42:10'),
(65, 60, 1, 'Ўзбекистонда киберҳавфсизликни таъминлаш масалалари', 1, 3, 'Maqola Akademiya.pdf', '2020-10-30 09:53:15', '2020-10-30 09:53:15'),
(66, 63, 1, 'Трасологик экспертизаларнинг долзарб муаммолари', 1, 3, '2018 йил 2 сон АХБОРОТНОМА.docx', '2020-10-30 10:39:01', '2020-10-30 10:39:01'),
(67, 63, 1, 'ЖИНОЯТЛАРНИ ОЛДИНИ ОЛИШ ВА УНИ ФОШ ЭТИШДА ТРАСОЛОГИК ЭКСПЕРТИЗАЛАРНИ АҲАМИЯТИ', 1, 2, '1.Huquqiy_tadkikotlar_yunalishi_2_qism.pdf', '2020-10-30 10:44:13', '2020-10-30 10:44:13'),
(68, 63, 1, 'IMPROVEMENT OF PROVIDING WITH RESOURCES OF THE FORENSIC EXPERT SERVICE OFFICERS’ ACTIVITY IN HOLDING TRACEOLOGY RESEARCH', 1, 1, 'япония нашри.pdf', '2020-10-30 12:51:20', '2020-10-30 12:51:20'),
(113, 74, 2, 'Значение военно-патриотического воспитания молодежи для вооруженных сил в Республике Узбекистан //  Ўзбекистон Республикаси Қуролли Кучлари ҳарбий хизматчиларининг маънавиятини юксалтиришда гуманитар фанларнинг ўрни ва роли. Республика илмий-услубий семин', 1, 0, 'ЧОТУМБЮ.jpg', '2020-11-03 06:25:29', '2020-11-03 06:25:29'),
(112, 74, 2, 'Значение военно-патриотического воспитания молодежи для вооруженных сил в Республике Узбекистан //  Ўзбекистон Республикаси Қуролли Кучлари ҳарбий хизматчиларининг маънавиятини юксалтиришда гуманитар фанларнинг ўрни ва роли. Республика илмий-услубий семин', 1, 5, 'ЧОТУМБЮ.jpg', '2020-11-03 06:22:09', '2020-11-03 06:22:09'),
(111, 74, 2, 'К вопросу об осуществлении негосударственной судебно-экспертной деятельности // Ўзбекистон ички ишлар органлари тизимида амалга оширилаётган маъмурий-ҳуқуқий ислоҳотлар: республика илмий-амалий конференцияси материаллари (2020 йил 25 март). – Т.:  Ўзбекис', 1, 5, 'Академия тезис.jpg', '2020-11-03 06:19:48', '2020-11-03 06:19:48'),
(110, 74, 1, 'Некоторые вопросы правовой оценки предварительных исследований следов рук // Научные труды Академии МВД Республики Узбекистан им. Генерал-майора Алиева Э.А.. – 2020. – № 1 – С. 83-86.', 1, 2, 'Научные труды Кыргызстан.jpg', '2020-11-03 06:16:44', '2020-11-03 06:16:44'),
(109, 74, 2, 'Реформирование судебной экспертизы в республике Узбекистан // Деятельность правоохранительных органов на современном этапе: наука, образование, практика: сб. статей / Акад. упр. при Президенте Респ. Беларусь. – Минск: Академия Управления при президенте Ре', 1, 4, 'Республика Беларусь.jpg', '2020-11-03 06:14:16', '2020-11-03 06:14:16'),
(107, 74, 1, 'The concept of development of forensic inquiry in the Republic of Uzbekistan  // International Multidisciplinary Conference “Scientific research results in pandemic conditions (COVID-19)”. Proceedings of the Conference / Part-4 (June, 2020). Primedia E-la', 1, 2, 'США.jpg', '2020-11-03 06:10:14', '2020-11-03 06:10:14'),
(108, 74, 1, 'Основные направления развития судебной экспертизы в Республике Узбекистан // Юрист ахборотномаси-Вестник юриста- Lawyer herald – 2020. – № 3. – С.104-111.', 1, 3, 'Вестник Юриста.jpg', '2020-11-03 06:12:04', '2020-11-03 06:12:04'),
(981, 57, 1, 'Методы сравнительного исследования при производстве криминалистических портретных экспертиз как гаранты достоверности выводов эксперта', 1, 3, '2019-4 ахборотнома.jpg', '2020-12-14 10:59:14', '2020-12-14 10:59:14'),
(979, 288, 1, 'Филология, таржимашунослик', 1, 3, 'узджтутуплами.pdf', '2020-12-14 10:56:51', '2020-12-14 10:56:51'),
(980, 57, 1, 'К вопросу о требованиях к образцам элементов внешности человека в портретной идентификации личности', 1, 3, '2019-2 ахборотнома.jpg', '2020-12-14 10:58:21', '2020-12-14 10:58:21'),
(978, 62, 1, 'Особенности взаимодействия следственных и оперативно-розыскных подразделений при раскрытии и расследовании преступлений', 2, 2, '151515 001.jpg', '2020-12-14 10:37:05', '2020-12-14 10:37:05'),
(977, 62, 1, 'Электронные документы - как доказательства при расследовании киберпреступлений', 1, 2, '004.jpg', '2020-12-14 09:41:14', '2020-12-14 09:41:14'),
(106, 74, 2, 'Негосударственная судебно-экспертная деятельность в Республике Узбекистан:  становление и развитие // Актуальные проблемы борьбы с преступлениями и иными правонарушениями : материалы восемнадцатой международной научно-практической конференции / под ред. Ю', 1, 4, 'БЮИ-2.jpg', '2020-11-03 06:08:12', '2020-11-03 06:08:12'),
(976, 64, 1, 'Горизантал ва шунга яқин ҳолатда шунингдек ўтирган холатда жабрланувчиларни уриб юборишда ҳосил бўладиган', 1, 3, '66 001 Горизантал ва шунга яқин ҳолатда шунингдек ўтирган холатда жабрланувчиларни уриб юборишда ҳосил бўладиган .jpg', '2020-12-14 09:40:46', '2020-12-14 09:40:46'),
(974, 62, 1, 'Ichki ishlar organlarida fuqarolarning murojaat qilish huquqini ta\'minlash - Konstitutsiya talabi', 1, 3, '4 001.jpg', '2020-12-14 09:37:12', '2020-12-14 09:37:12'),
(975, 62, 1, 'Социальная обусловленность взаимодействия дознавателя, следователя с подразделениями уголовного розыска в работе по противодействию коррупции', 2, 3, '11 001.jpg', '2020-12-14 09:39:08', '2020-12-14 09:39:08'),
(972, 64, 1, 'Пути совершенствование судебно-экспертной деятельности в Республике Узбекистан', 1, 2, '2 001 ПУТИ .jpg', '2020-12-14 09:33:41', '2020-12-14 09:33:41'),
(973, 64, 1, 'Трасологик экспертизани таснифи', 1, 2, '55ХОРИЖ .jpg', '2020-12-14 09:36:03', '2020-12-14 09:36:03'),
(970, 64, 1, 'ЙТХ ТРАСОЛОГИК ЭКСПЕРТИЗА', 1, 3, '4 001ЙТХ ТРАСОЛОГИК ЭКСПЕРТИЗА .jpg', '2020-12-14 09:29:25', '2020-12-14 09:29:25'),
(971, 64, 1, 'ЙТХ ТРАСОЛОГИК ЭКСПЕРТИЗА', 1, 3, '4 001ЙТХ ТРАСОЛОГИК ЭКСПЕРТИЗА .jpg', '2020-12-14 09:29:27', '2020-12-14 09:29:27'),
(105, 90, 2, 'IIOlarining to\'li va chegara hududlardagi tezkor bo\'linmalarining terrorizmga qarshi kurashishini takomillashtirish', 1, 8, 'ushbu maqola yopiq ei,.docx', '2020-11-03 04:50:48', '2020-11-03 04:50:48'),
(969, 64, 2, 'ИИОда суд экспертиза муассасаларининг суд-экспертлик фаолиятини амалга оширишдаги ўзаро ҳамкорлиги борасида айрим фикирлар', 1, 5, '4 001 ИИО .jpg', '2020-12-14 09:22:03', '2020-12-14 09:22:03'),
(968, 64, 2, 'ИИОда суд экспертиза муассасаларининг суд-экспертлик фаолиятини амалга оширишдаги ўзаро ҳамкорлиги борасида айрим фикирлар', 1, 5, '4 001 ИИО .jpg', '2020-12-14 09:22:03', '2020-12-14 09:22:03'),
(967, 64, 2, 'ЙТХ ходисаларида транспорт воситаси жабрланувчиларининг кийими ва пойабзалида хосил бўладиган изларнинг таснифланиши.', 1, 4, '44 001ЙТХ Юрид универ .jpg', '2020-12-14 09:13:37', '2020-12-14 09:13:37'),
(965, 64, 1, 'Хатшунослик экспертизаларининг турлари ва хулосаларини асослаш', 1, 3, '2 001 хат .jpg', '2020-12-14 08:56:08', '2020-12-14 08:56:08'),
(966, 64, 1, 'Одатий ёзиш қўлини алмаштириб бажарилган ёзувлар диагностик тадқиқотларининг хусусиятлари', 1, 3, '22 001 хатшунослик .jpg', '2020-12-14 09:01:30', '2020-12-14 09:01:30'),
(103, 90, 1, 'Terrorizm va ekstremizmga qarshi kurashda zamonaviy ta\'limning tutgan o\'rni', 1, 3, 'Maqola terrorizm.docx', '2020-11-03 04:28:12', '2020-11-03 04:28:12'),
(104, 90, 1, 'Terrorizm va ekstremizmga qarshi kurashda zamonaviy ta\'limning tutgan o\'rni', 1, 3, 'Maqola terrorizm.docx', '2020-11-03 04:35:10', '2020-11-03 04:35:10'),
(963, 64, 1, '“Хатшунослик экспертизасида “белги” тушунчаси” номли илмий мақола', 1, 3, 'БелгиТушунчаси.PNG', '2020-12-14 08:46:57', '2020-12-14 08:46:57'),
(964, 64, 1, 'Хатшунослик экспертизаларининг турлари ва хулосаларини асослаш', 1, 3, '2 001 хат .jpg', '2020-12-14 08:56:08', '2020-12-14 08:56:08'),
(99, 78, 1, 'ТЕРРОРИЗМ ВА ЭКСТРЕМИЗМГА ҚАРШИ КУРАШДА ЗАМОНАВИЙ ТАЪЛИМНИНГ ТУТГАН ЎРНИ', 1, 3, 'янгии 2чи мақола.docx', '2020-11-02 05:10:15', '2020-11-02 05:10:15'),
(100, 78, 1, 'Terrorizm va ekstremizmga qarshi kurashda zamonaviy ta\'limning tutgan o\'rni', 1, 0, 'янгии 2чи мақола.docx', '2020-11-02 05:18:27', '2020-11-02 05:18:27'),
(101, 78, 1, 'Terrorizm va ekstremizmga qarshi kurashda zamonaviy ta\'limning tutgan o\'rni', 1, 0, 'янгии 2чи мақола.docx', '2020-11-02 05:19:37', '2020-11-02 05:19:37'),
(102, 78, 2, 'Ички ишлар органларининг тоғли ва чегара ҳудудлардаги тезкор  бўлинмаларининг терроризмга қарши курашишни  такомиллаштириш.', 1, 0, 'Ички ишлар органларининг тоғли ва чегара ҳудудлардаги тезкор  бўлинмаларининг терроризмга қарши курашишни  такомиллаштириш. .docx', '2020-11-02 05:40:31', '2020-11-02 05:40:31'),
(114, 74, 1, 'Некоторые аспекты развития автоматизированных дактилоскопических идентификационных систем: опыт Республики Узбекистан // Научные труды Академии МВД Республики узбекистан им. Генерал-майора Алиева Э.А.., — 2019. — № 4. — С. 39-43.', 1, 2, 'Республика Кыргызстан.jpg', '2020-11-03 06:29:29', '2020-11-03 06:29:29'),
(115, 74, 2, 'Use of dactyloscopic accounts in foreign countries and the Republic of Uzbekistan // Стратегия развития современной науки: Международный сборник научных статей. — Ташкент, 2019. — С. 121-125.', 1, 4, 'photo_2020-10-31_11-33-37.jpg', '2020-11-03 06:32:54', '2020-11-03 06:32:54'),
(116, 74, 2, 'Законодательная регламентация дактилоскопической регистрации в Республике Узбекистан // Деятельность правоохранительных органов на современном этапе : наука, образование, практика : сб. материалов науч.-практ. семинара (Минск,  15 февр. 2019 г.) / Акад. у', 1, 4, 'photo_2020-10-31_12-29-29.jpg', '2020-11-03 06:35:05', '2020-11-03 06:35:05'),
(117, 74, 2, 'Анализ зарубежного опыта использования автоматизированных дактилоскопичсеких идентификационных систем // XXI аср илм-фани муаммо ва истиқбол: Республика илмий амалий конференцияси материаллари 2019 йил 25 апрель  тўплами- Т., 2019  - с. 123-130', 1, 4, 'photo_2020-10-31_12-30-02.jpg', '2020-11-03 06:37:52', '2020-11-03 06:37:52'),
(118, 98, 1, 'Давлат йўл ҳаракати  хавфсизлиги хизмати соҳасини замонавий лабораторияларини лойиҳалаштиришда интеллектуал транспорт тизимидан фойдаланиш', 2, 3, 'Илмий макола-1 Ш.Ризаев.pdf', '2020-11-03 08:08:01', '2020-11-03 08:08:01'),
(119, 98, 2, 'Етарлича кўринмаслик  ва  қоронғи  пайтларда  ҳаракат хавфсизлигини таъминлашда автомобилни бошқариш усуллари', 2, 6, 'Илмий макола-2 Ш.Ризаев.pdf', '2020-11-03 08:09:14', '2020-11-03 08:09:14'),
(120, 98, 2, 'Модель процессов безопасности автомобильных перевозок', 2, 6, 'Макола-2 ИТИга Ш.Ризаев тезис.pdf', '2020-11-03 08:11:42', '2020-11-03 08:11:42'),
(121, 75, 1, 'Analysis of road transportation incidents and its role in providing road safety', 1, 3, '9-Текст статьи-215-1-10-20200921.pdf', '2020-11-03 08:16:16', '2020-11-03 08:16:16'),
(122, 98, 2, 'Йўл ҳаракати сохасидаги қоидабузарликларни аниқлаш ва уларга хуқуқий таъсир чораларини қўллаш', 2, 6, 'Макола-4 ИТИга Ш тезис3.pdf', '2020-11-03 08:21:10', '2020-11-03 08:21:10'),
(123, 75, 1, 'Совершенствование деятельности Государственной службы безопасности дорожного движения в Республике Узбекистан', 1, 1, 'Статья Орел 2020.jpg', '2020-11-03 08:21:32', '2020-11-03 08:21:32'),
(124, 98, 2, 'Тирбандликларни пайдо бўлиш сабаблари ва уларни олдини олиш чора-тадбирлари', 2, 6, 'Макола-5 ИТИга Ш тезис4.pdf', '2020-11-03 08:22:37', '2020-11-03 08:22:37'),
(125, 75, 1, 'Современные автомобильные газовые баллоны сжатого природного газа и их безопасная эксплуатация', 1, 3, '+ Журнал Вестник ТАДИ №1 2020.jpg', '2020-11-03 08:23:08', '2020-11-03 08:23:08'),
(126, 75, 1, 'Техническое диагностирование стальных баллонов, работающих под давлением', 1, 3, 'Вестник ТАЙИ №2 2020.jpg', '2020-11-03 08:25:02', '2020-11-03 08:25:02'),
(988, 288, 1, 'Филология, таржимашунослик', 1, 3, 'combinepdf (4).pdf', '2020-12-14 11:20:14', '2020-12-14 11:20:14'),
(987, 288, 1, 'Филология, таржимашунослик', 1, 2, 'Н_Б_%20Абдурашитова.jpg', '2020-12-14 11:08:27', '2020-12-14 11:08:27'),
(962, 73, 1, 'Ўзбекистонда кўппартиявийлик тизимининг тарихий илдизлари', 1, 3, 'axborotnoma.pdf', '2020-12-14 08:37:21', '2020-12-14 08:37:21'),
(986, 288, 1, 'Филология, таржимашунослик', 1, 3, 'сертификат украинадан.pdf', '2020-12-14 11:07:51', '2020-12-14 11:07:51'),
(130, 75, 1, 'Тенденции обеспечения безопасности дорожного движения в Республике Узбекистан', 1, 3, 'Вестник Акад 2019.jpg', '2020-11-03 08:56:54', '2020-11-03 08:56:54'),
(131, 75, 2, 'Вопросы безопасной эксплуатации  газобаллонных автомобилей', 1, 4, 'Конф Акад сент 2019.jpg', '2020-11-03 08:58:52', '2020-11-03 08:58:52'),
(132, 75, 2, 'Периодическое освидетельствование баллонов для сжиженного нефтяного газа', 1, 4, 'АндМи Газ баллон 2020.jpg', '2020-11-03 09:02:56', '2020-11-03 09:02:56'),
(133, 75, 2, 'Принципы “Europrotoсol” в регистрации дорожно-транспортных происшествий', 1, 4, 'АндМИ Европротокол 2020.jpg', '2020-11-03 09:03:21', '2020-11-03 09:03:21'),
(134, 75, 2, 'Современные автомобильные газовые баллоны из металлокомпозиционных материалов и их безопасность', 1, 4, 'Конф Беларусь комп баллон -2020.jpg', '2020-11-03 09:05:34', '2020-11-03 09:05:34'),
(135, 84, 1, 'Хизмат кўрсатиш майдонларини ҳисоблаш', 1, 3, 'Фаргона макола.pdf', '2020-11-03 11:39:55', '2020-11-03 11:39:55'),
(985, 57, 2, 'Идентификационные элементы и признаки внешности человека', 1, 4, '2020 тезис конституция.jpg', '2020-12-14 11:06:05', '2020-12-14 11:06:05'),
(984, 57, 2, 'Некоторые особенности при получении образцов элементов внешности человека для портретной идентификации личности', 1, 4, '2019 конституция тезис.jpg', '2020-12-14 11:05:17', '2020-12-14 11:05:17'),
(983, 57, 2, 'Современное состояние и перспективы развития криминалистического учения о внешнем облике человека', 2, 4, '2019 конституция тезис с аскаровой.jpg', '2020-12-14 11:03:56', '2020-12-14 11:03:56'),
(982, 57, 1, 'Методы исследования внешнего облика человека', 1, 3, '2019 стратегия статья.jpg', '2020-12-14 11:01:18', '2020-12-14 11:01:18'),
(140, 123, 2, 'Ўзбекистон республикасида электрон ҳукумат тизимини ривожлантиришнинг истиқболлари', 2, 5, 'TATU 2019 (Ўзбекистон республикасида электрон ҳукумат тизимини ривожлантиришнинг истиқболлари).pdf', '2020-11-04 04:29:33', '2020-11-04 04:29:33'),
(141, 123, 2, 'Ўзбекистон республикасида электрон ҳукумат тизимини ривожлантиришнинг хориж тажрибаси', 2, 5, 'TATU Qarshi filiali 2019 (Ўзбекистон электрон ҳукумат тизимини ривожлантиришда ҳориж тажрибаси).pdf', '2020-11-04 04:30:39', '2020-11-04 04:30:39'),
(142, 110, 1, 'Characteristic Features of The Investment Climate of Free Economic Zones', 1, 1, 'yuldashev.pdf', '2020-11-04 05:43:56', '2020-11-04 05:43:56'),
(143, 67, 1, 'Jinoyatlarni ochish va tergov qilishda ballistik ekspertiza o\'tkazish usullarining xususiyatlari', 1, 0, '1.pdf', '2020-11-04 06:16:55', '2020-11-04 06:16:55'),
(144, 67, 2, 'О значении судебно-баллистической экспертизы в расследовании преступлений', 1, 4, '2.pdf', '2020-11-04 06:25:10', '2020-11-04 06:25:10'),
(145, 58, 1, 'Talonchilikni jinoyatini boshqa o\'xshash tarkibli jinoyatlardan farqlash masalalari', 1, 3, 'МУНДАРИЖА. МАРТ 2020_5235738521.pdf', '2020-11-04 06:28:06', '2020-11-04 06:28:06'),
(146, 58, 2, 'Talonchilik uchun javobgarlikni takomillashtirish', 1, 5, '1.Huquqiy_tadkikotlar_yunalishi_2_qism.pdf', '2020-11-04 06:31:31', '2020-11-04 06:31:31'),
(147, 58, 1, 'Jinoyat protsessida isbot qilishning ishtirokchilari', 2, 3, 'юрист журнали 2 сон.pdf', '2020-11-04 06:34:10', '2020-11-04 06:34:10'),
(148, 58, 2, 'Sodir etilgan talonchilik jinoyatlarini fosh etish va oldini olish choralari', 1, 5, 'содир этилган талончилик жиноятларини фош этиш ва олдини олиш чоралари.pdf', '2020-11-04 07:36:10', '2020-11-04 07:36:10'),
(149, 58, 2, 'Shartli xukmni qo\'llash yuzasidan ayrim mulohazalar', 1, 5, 'шартли хукмни қўллаш юзасидан айрим мулохазалар.pdf', '2020-11-04 07:38:45', '2020-11-04 07:38:45'),
(150, 58, 2, 'Zaruriy mudofaani qo\'llashning ayrim huquqiy shartlari', 1, 5, 'зарурий мудофаани қўллашнинг айрим ҳуқуқий шартлари.pdf', '2020-11-04 07:40:48', '2020-11-04 07:40:48'),
(151, 58, 2, 'Ichki ishlar xodimlari o\'rtasida korrupsiyaga qarshi kurashish yuzasidan ayrim mulohazalar', 1, 5, 'ички ишлар органларида коррупция қарши курашиш юзасидан айрим мулоҳазалар.pdf', '2020-11-04 07:43:13', '2020-11-04 07:43:13'),
(152, 81, 1, 'СИЛЫ, ДЕЙСТВУЮЩИЕ ОТ КОЛЕСА АВТОМОБИЛЯ НА ДОРОЖНОЕ ПОКРЫТИЕ', 1, 2, 'макола 1.pdf', '2020-11-04 08:38:33', '2020-11-04 08:38:33'),
(153, 81, 1, 'ЙЎЛ-ТРАНСПОРТ ҲОДИСАЛАРИ ОЛДИНИ ОЛИШ: МУАММО ВА ЕЧИМЛАР', 2, 3, 'макола 2.pdf', '2020-11-04 08:40:19', '2020-11-04 08:40:19'),
(154, 81, 1, 'ПРИРОДНО-КЛИМАТИЧЕСКИЕ ФАКТОРЫ И ТРАНСПОРТНО-ЭКСПЛУАТАЦИОННЫЕ КАЧЕСТВА АВТОМОБИЛЬНОЙ ДОРОГИ', 2, 3, 'макола 3.pdf', '2020-11-04 08:41:40', '2020-11-04 08:41:40'),
(155, 81, 1, 'ДАВЛАТ ЙЎЛ ҲАРАКАТИ ХАВФСИЗЛИГИ ХИЗМАТИНИНГ ТАРИХИ', 2, 3, 'макола 4.pdf', '2020-11-04 08:42:49', '2020-11-04 08:42:49'),
(156, 81, 1, 'ЙЎЛ-ТРАНСПОРТ ҲОДИСАЛАРИНИ ТАҲЛИЛ ҚИЛИШНИНГ АСОСИЙ ВАЗИФАЛАРИ ВА УСУЛЛАРИ', 2, 3, 'макола 5.pdf', '2020-11-04 08:44:00', '2020-11-04 08:44:00'),
(157, 63, 1, 'НОРМАТИВНЫЕ ТРЕБОВАНИЯ К ИЗЪЯТИЮ ОБРАЗЦОВ ДЛЯ ТРАСОЛОГИЧЕСКИХ ИССЛЕДОВАНИЙ В УЗБЕКИСТАНЕ', 1, 2, 'КАЗАКСтан макола.docx', '2020-11-04 10:19:02', '2020-11-04 10:19:02'),
(158, 112, 1, 'Инглиз ва ўзбек тилларида ҳарбий терминларнинг лингвокультурологик хусусиятлари', 1, 3, 'УзМУ макола.pdf', '2020-11-04 10:34:55', '2020-11-04 10:34:55'),
(159, 63, 1, 'Трасологик тадіиіотларда іґлланиладиган техник-криминалистик воситалар', 1, 3, 'Axborotnoma-2018-4.pdf', '2020-11-04 10:37:31', '2020-11-04 10:37:31'),
(160, 143, 1, 'Ҳақиқатни аниқлаш ва исбот қилиш одил судловни амалга оширишнинг шартидир.', 1, 7, 'Макола Исбот килиш.doc', '2020-11-04 10:38:18', '2020-11-04 10:38:18'),
(161, 63, 1, 'Трасологик экспертизаларда дастлабки тадіиіотларнинг хусусиятлари', 1, 3, 'Axborotnoma-2019-3.pdf', '2020-11-04 10:42:03', '2020-11-04 10:42:03'),
(162, 72, 1, 'Использование информационных технологий-один из факторов анти коррупционной деятельности органов внутренних дел', 1, 3, 'Документ Microsoft Office Word.docx', '2020-11-04 10:48:39', '2020-11-04 10:48:39'),
(163, 72, 2, 'Особенности обеспечения прав человека в процессе доказывания по преступлениям, связанным с дорожно-транспортными происшествиями', 1, 4, 'Документ Microsoft Office Word.docx', '2020-11-04 10:51:30', '2020-11-04 10:51:30'),
(164, 94, 2, 'Ichki ishlar organlari xodimlarining korrupsiyaga qarshi kurashdagi o\'rni', 1, 5, 'Boshqaruv temur.pdf', '2020-11-04 12:51:45', '2020-11-04 12:51:45'),
(165, 94, 2, 'Dispozitiv normalarni qo\'llash doirasini kengaytirish istiqbollari', 2, 5, 'temur fuqarolik.pdf', '2020-11-04 12:57:33', '2020-11-04 12:57:33'),
(166, 94, 2, 'Korrupsiyaga qarshi kurashda subekt masalasi', 1, 5, 'temur korrupsiya.pdf', '2020-11-04 13:03:04', '2020-11-04 13:03:04'),
(167, 94, 2, 'Isbotlash jarayonida tergov harakatlarining o\'rni', 1, 5, 'temur mamuriy.pdf', '2020-11-04 13:06:33', '2020-11-04 13:06:33'),
(168, 94, 2, 'Korrupsiyaviy jinoyatlarga qarshi kurashda jioyat subektining ahamiyati', 2, 5, 'temur 21 asr.pdf', '2020-11-04 13:09:16', '2020-11-04 13:09:16'),
(169, 95, 2, 'Aybsizlik prezumsiyasi prinsipini-jinoyat-protsessual munosabatlarda ifodalanishi', 2, 5, 'Ravshan konstitutsiya.pdf', '2020-11-04 13:18:24', '2020-11-04 13:18:24'),
(170, 150, 1, 'махсус мавзу', 1, 7, '13. ёшларда ватанга садокат.docx', '2020-11-04 13:50:09', '2020-11-04 13:50:09'),
(171, 150, 1, 'махсус мавзу', 1, 7, '15. Исломда жиноят ва жазо.rtf', '2020-11-04 13:51:14', '2020-11-04 13:51:14'),
(172, 156, 2, 'Jinoyat protsessida dalillarni to\'plash tartibi va asoslari', 1, 5, 'turdiyev boshqaruv.pdf', '2020-11-05 04:32:53', '2020-11-05 04:32:53'),
(173, 156, 2, 'Dalilning mohiyati, to\'plash protsessual tartibi va qo\'llash shartlari', 1, 5, 'turdiyev boshqaruv.pdf', '2020-11-05 04:40:32', '2020-11-05 04:40:32'),
(174, 156, 2, 'Jinoyat protsessida dalillarni to\'plashdagi kamchiliklar va dallilarni to\'plashning protsessual tartibi', 1, 5, 'turdiyev mamuriy.pdf', '2020-11-05 04:44:56', '2020-11-05 04:44:56'),
(175, 154, 1, 'Mehnat migrasiyasi va uning o`ziga xos xususiyatlari.', 1, 3, 'мақола.jpeg', '2020-11-05 04:48:05', '2020-11-05 04:48:05'),
(176, 156, 2, 'Jinoyat protsessida isbot qilish masalalari', 1, 5, '2.pdf', '2020-11-05 04:51:45', '2020-11-05 04:51:45'),
(177, 154, 1, 'Tezkor qidiruv tadbirlarida qo`llaniladigan kuzatuv vositalarining o`ziga xosligi.', 1, 3, 'мақола №1.docx', '2020-11-05 04:57:51', '2020-11-05 04:57:51'),
(178, 154, 1, 'Ички ишлар органлари профилактика инспекторларининг экстремизм билан боғлиқ ҳуқуқбузарликларни олдини олишдаги роли', 2, 3, 'мақола №1.docx', '2020-11-05 05:01:04', '2020-11-05 05:01:04'),
(179, 154, 1, 'Одам савдоси жиноятларини аниқлашда кўмаклашувчи шахслардан фойдаланишнинг айрим масалалари.', 2, 3, 'мақола №1.docx', '2020-11-05 05:03:36', '2020-11-05 05:03:36'),
(180, 154, 1, 'Коррупция тараққиёт заволи.', 2, 3, 'мақола №1.docx', '2020-11-05 05:06:04', '2020-11-05 05:06:04'),
(181, 154, 1, 'Ноқонуний меҳнат миграциясининг ижтимоий хавфи.', 1, 3, 'мақола №1.docx', '2020-11-05 05:08:27', '2020-11-05 05:08:27'),
(182, 154, 1, 'Тезкор аппаратлари томонидан одам савдоси билан боғлиқ жиноятларга қарши курашишда кўмаклашувчи шахсларни танлаш ва ўрганиш амалиёти', 1, 3, 'мақола №1.docx', '2020-11-05 05:11:50', '2020-11-05 05:11:50'),
(183, 123, 1, 'The Role innovative tehnologis in the developmtnt of education', 2, 2, 'Скан Макола Акад Межд Конф 2019.pdf', '2020-11-05 05:13:36', '2020-11-05 05:13:36'),
(184, 123, 2, 'The Role innovative tehnologis in the developmtnt of education', 2, 4, 'Скан Макола Акад Межд Конф 2019.pdf', '2020-11-05 05:17:06', '2020-11-05 05:17:06'),
(185, 154, 1, 'Терроризм жиноятларининг психологик хусусиятлари.', 2, 3, 'мақола №1.docx', '2020-11-05 05:19:49', '2020-11-05 05:19:49'),
(186, 154, 1, 'Терроризм ва экстремизм – тараққиёт кушандаси.', 2, 3, 'мақола №1.docx', '2020-11-05 05:21:58', '2020-11-05 05:21:58'),
(187, 123, 2, 'Кибер преступность - новая угроза развитию', 2, 5, 'Макола UNICON-2020.pdf', '2020-11-05 05:23:28', '2020-11-05 05:23:28'),
(188, 154, 1, 'Одам савдоси жинояти ва уни очишда ҳамкорликнинг ўзига хос хусусиятлари.', 1, 3, 'мақола №1.docx', '2020-11-05 05:24:09', '2020-11-05 05:24:09'),
(189, 154, 1, 'Террористик ва экстремистик тузилмалар тарғиботининг ёшлар онгига таҳдиди.', 1, 3, 'мақола №1.docx', '2020-11-05 05:26:50', '2020-11-05 05:26:50'),
(190, 123, 2, 'Аудит информационных  технологий по требованиям информационной безопастности', 2, 5, 'Макола UNICON-2020.pdf', '2020-11-05 05:27:37', '2020-11-05 05:27:37'),
(191, 123, 1, 'Ўзбекистон Республикасининг конституцияси-мамлакатимизда ахборот ва сўз эркинлигининг ҳуқуқий асоси', 2, 3, 'Скан Макола Акад Ахборотномаси 2018.pdf', '2020-11-05 05:35:08', '2020-11-05 05:35:08'),
(192, 123, 2, '\"Ички ишлар органлари тўғрисида\"ги қонуннинг қабул қилиниши-инсон манфаатларини таъминлашнинг муҳим ҳуқуқий кафолати', 2, 5, 'макола-2017-март.pdf', '2020-11-05 05:41:13', '2020-11-05 05:41:13'),
(193, 123, 1, 'Бола ҳуқуқлари кафолатлари', 2, 7, 'Скан Газета ТО 2018_ 2 чи макола.pdf', '2020-11-05 05:49:55', '2020-11-05 05:49:55'),
(194, 158, 1, 'Jinoyat-protsessual qonunchilikdagi xususiy ayblov institutini qo\'llash mexanizmi bilan bog`liq muammolar', 1, 3, '1.pdf', '2020-11-05 05:52:01', '2020-11-05 05:52:01'),
(195, 123, 1, 'Уяли телефоннинг зарарли таъсири борми?', 2, 7, 'Скан газета 2018  11.pdf', '2020-11-05 05:52:08', '2020-11-05 05:52:08'),
(196, 88, 1, 'Мураккаб шароитларда ҳаракатланувчи автотранспорт воситалари шиналарининг ресурсини аниқлаш', 1, 3, '1 .pdf', '2020-11-05 06:03:37', '2020-11-05 06:03:37'),
(197, 88, 1, 'Транспорт воситаларининг хавфсиз ҳаракатланиш жараёнларини такомиллаштириш', 1, 3, '2.pdf', '2020-11-05 06:04:58', '2020-11-05 06:04:58'),
(198, 88, 1, 'ЙЎЛ ТРАНСПОРТ ҲОДИСАЛАРИНИ ТАХЛИЛ ҚИЛИШ ЖАРАЁНЛАРИНИ ТАКОМИЛЛАШТИРИШ', 1, 3, '3.pdf', '2020-11-05 06:05:42', '2020-11-05 06:05:42'),
(199, 88, 1, 'Особенности эксплуатации и производства радиальных пнавматических шин', 2, 3, '4.pdf', '2020-11-05 06:06:21', '2020-11-05 06:06:21'),
(200, 88, 2, 'Ўзбекистон табиий иқлим шароитларининг транспорт воситалари шиналари ресурсларига таъсири', 2, 5, '5.pdf', '2020-11-05 06:07:13', '2020-11-05 06:07:13'),
(201, 88, 2, 'Автотранспорт воситаларининг атроф-муҳитга салбий таъсирини камайтириш', 2, 4, '6.pdf', '2020-11-05 06:09:31', '2020-11-05 06:09:31'),
(202, 88, 1, 'Автотранспорт воситаларининг деталларини тиклаш ва самарадорлигини яхшилаш йўллари', 2, 3, '7.pdf', '2020-11-05 06:10:34', '2020-11-05 06:10:34'),
(203, 88, 1, 'Сифат кўрсаткичлари тизими ва транспорт воситасининг ишлаш самарадорлиги', 2, 3, '8.pdf', '2020-11-05 06:11:29', '2020-11-05 06:11:29'),
(204, 88, 2, 'Пиёдаларнинг хавфсизлигини оширишда автомобиль ташқи хавфсизлик ёстиқчаси тизими.', 2, 6, '9.pdf', '2020-11-05 06:12:44', '2020-11-05 06:12:44'),
(205, 82, 1, 'Автотранспорт воситаларининг деталларини тиклаш ва самарадорлигини яхшилаш йўллари', 2, 3, '7.pdf', '2020-11-05 06:22:03', '2020-11-05 06:22:03'),
(206, 158, 1, 'Айрим Осиё мамлакатлари қонунчилигида хусусий айблов институтининг белгиланиши', 1, 5, '2... сон 4. 11  Ак. Ахборотномаси pdf.pdf', '2020-11-05 06:49:19', '2020-11-05 06:49:19'),
(207, 158, 1, 'O\'zbekiston Respublikasida ilgari amalda bo\'lgan jinoyat-protsessual qonunchilikka ko\'ra xususiy ayblov asosida ish yuritishning xususiyatlari', 1, 3, 'huquq-2020-son-SI3-2.pdf', '2020-11-05 06:52:52', '2020-11-05 06:52:52'),
(208, 158, 1, 'O\'zbekiston jinoyat-protsessual qonunchiligining rivojlanishi', 1, 2, 'Қарағанда ак-яси ах-тномаси Ўз ЖП ривож.pdf', '2020-11-05 06:54:53', '2020-11-05 06:54:53'),
(209, 158, 2, 'СОВЕРШЕНСТВОВАНИЕ ИНСТИТУТА ЧАСТНОГО ОБВИНЕНИЯ В УГОЛОВНОМ ПРОЦЕССЕ И ОСУЩЕСТВЛЕНИЕ СУДЕБНО-ПРАВОВЫХ РЕФОРМ В РЕСПУБЛИКЕ УЗБЕКИСТАН', 1, 4, 'СБОРНИК_АКТУАЛЬНЫЕ_ПРОБЛЕМЫ_ПР_2020 Волгоград.pdf', '2020-11-05 06:57:29', '2020-11-05 06:57:29'),
(210, 158, 1, 'Жиноят-процессуал қонунчилик ривожланишида хусусий айблов институтининг кенгайтирилиши', 1, 3, 'Maqola nusxasi.docx', '2020-11-05 07:00:25', '2020-11-05 07:00:25'),
(211, 158, 1, 'Improvement Of The Procedure Of Production Of Criminal Cases Of Private Action', 1, 1, 'document.pdf', '2020-11-05 07:02:08', '2020-11-05 07:02:08'),
(212, 136, 2, 'Ахборот коммуникация технологияларининг ривожланиш истикболлари ТАТЙ Карши филиали', 2, 5, 'TATU_Qarshi_filiali_2018_Педагогик_жараён_самарадорлигини_оширишда.pdf', '2020-11-05 07:06:35', '2020-11-05 07:06:35'),
(213, 158, 1, 'Jinoyat-protsessual huquq sohasidagi sud-huquq islohotlari va xususiy ayblov institutini kengaytirish istiqbollari', 1, 3, 'прокуратура.pdf', '2020-11-05 07:10:50', '2020-11-05 07:10:50'),
(214, 158, 1, 'Особенности начала судопроизводства на основе частного обвинения по уголовно-процессуальному законодательству, раньше действовавшие на территории Республики Узбекистан', 1, 2, '19 Рашидов Б.Н..pdf', '2020-11-05 07:13:59', '2020-11-05 07:13:59'),
(215, 136, 1, 'Кибержиноятчилик реал хавф', 2, 7, 'Qalqon Shit 2020 (Kiberchinojatchilik real havf).pdf', '2020-11-05 07:14:20', '2020-11-05 07:14:20'),
(216, 158, 1, 'ПРОБЛЕМЫ, СВЯЗАННЫЕ С МЕХАНИЗМОМ ПРИМЕНЕНИЯ ИНСТИТУТА ЧАСТНОГО ОБВИНЕНИЯ ПО УГОЛОВНО-ПРОЦЕССУАЛЬНОМУ ЗАКОНОДАТЕЛЬСТВУ РЕСПУБЛИКИ УЗБЕКИСТАН', 1, 1, 'ЭЛЕКТРОН МАНЗИЛИ.docx', '2020-11-05 07:17:10', '2020-11-05 07:17:10'),
(217, 136, 2, 'АХБОРОТ ТЕХНОЛОГИЯЛАРИ ВА КОММУНИКАЦИЯЛАРИ  СОҲАСИДА АХБОРОТ ХАВФСИЗЛИГИ МУАММОЛАРИ', 2, 5, 'АХ семинар_тўплами ИМИНОВ 2020.pdf', '2020-11-05 07:32:29', '2020-11-05 07:32:29'),
(218, 167, 2, 'The use of rhetorical questions in legal documents', 1, 5, 'ЎзДЖТУ тезис.pdf', '2020-11-05 08:42:55', '2020-11-05 08:42:55'),
(219, 167, 1, 'The problem of translation political literature and legal-thriller terminology', 1, 3, 'Илм сарчашмалари Фируз мақола.pdf', '2020-11-05 08:44:31', '2020-11-05 08:44:31'),
(220, 167, 1, 'Approaches to the study of politeness', 1, 2, 'Германия мақола.pdf', '2020-11-05 08:45:42', '2020-11-05 08:45:42'),
(221, 167, 1, 'The problem оf translating pоlitiсаl speeсh аnd diplоmаtiс lаnguаge', 1, 7, 'Андижон мақоласи.pdf', '2020-11-05 08:47:09', '2020-11-05 08:47:09'),
(222, 167, 1, 'Буйруқ – тилшуносликнинг  объекти сифатида', 1, 7, 'Қўқон ДПИ мақоласи.pdf', '2020-11-05 08:48:00', '2020-11-05 08:48:00'),
(223, 167, 2, 'Some thoughts on the issue of order in linguistics', 1, 4, 'Фарғона тезис.pdf', '2020-11-05 08:49:27', '2020-11-05 08:49:27'),
(224, 167, 2, 'The “order” genre and “power” discourse in Uzbek and English political-legal documents', 1, 5, 'Бухоро мақола.pdf', '2020-11-05 08:50:49', '2020-11-05 08:50:49'),
(225, 167, 2, 'Theoretical approaches on the issue of military “order”', 1, 4, 'Андижон Халқаро.pdf', '2020-11-05 08:52:20', '2020-11-05 08:52:20'),
(226, 167, 1, 'Ситуация адресатности в жанре «приказ» (на примерах русского и английского языков)', 1, 7, 'Наманган мақола.pdf', '2020-11-05 08:53:19', '2020-11-05 08:53:19'),
(227, 167, 1, 'The role of ICT in the process of teaching ESP learners (based on the  analysis of militarized educational establishments)', 1, 2, 'pdf.pdf', '2020-11-05 08:54:18', '2020-11-05 08:54:18'),
(228, 167, 2, 'Буйруқ гаплар ва буйруқ лексемасининг матнда қўлланилиши (Абдулла Қодирийнинг “Ўткан кунлар” ва Абдулҳамид Чўлпоннинг “Кеча ва кундуз” романлари таҳлили асосида)', 1, 4, 'Навоий Халқаро.pdf', '2020-11-05 08:55:31', '2020-11-05 08:55:31'),
(229, 167, 1, 'Historical development of the origin of order genre in Linguistics', 1, 1, 'Abdusalomov Firuz Abdukholikovich.pdf', '2020-11-05 08:56:05', '2020-11-05 08:56:05'),
(230, 107, 1, 'О некоторых аспектах деятельности защитника в уголовном процессе', 1, 7, '2.3.jpg', '2020-11-05 08:58:49', '2020-11-05 08:58:49'),
(231, 107, 2, 'О деятельности защитника в уголовном процессе', 1, 4, 'маы.docx', '2020-11-05 09:04:57', '2020-11-05 09:04:57'),
(232, 165, 1, 'Legal Bases of Information Security in Electronic Commerce', 2, 2, 'Legal Bases of Information Security in.PDF', '2020-11-05 09:45:34', '2020-11-05 09:45:34'),
(233, 165, 1, 'Электрон тижоратда ахборот хавфсизлигининг меъёрий-ҳуқуқий асослари', 0, 3, 'Электрон тижоратда ахборот хавфсизлигининг меъёрий-ҳуқуқий асослари.pdf', '2020-11-05 09:46:40', '2020-11-05 09:46:40'),
(234, 158, 2, 'Giyohvandlik vositalari yoki psixotrop moddalar bilan qonunga xilof ravishda muomala qilish holatlarida jinoyat ishini qo`zg`atish', 1, 5, 'Giyo.pdf', '2020-11-05 10:03:49', '2020-11-05 10:03:49'),
(235, 158, 2, 'Jinoyat protsessida xususiy ayblov institutini qo`llashning mohiyati', 2, 5, 'Isht.pdf', '2020-11-05 10:05:59', '2020-11-05 10:05:59'),
(236, 110, 2, 'Свободные экономические зоны как эффективный метод привлечения инвестиций', 1, 5, 'Мақола 2 МГ.pdf', '2020-11-05 10:06:06', '2020-11-05 10:06:06'),
(237, 158, 2, 'Giyohvandlik vositalari  yoki psixotrop moddalar bilan qonunga xilof ravishda muomala qilish holatlarida jinoyat ishini qo`zgatish', 1, 5, 'Giyo.pdf', '2020-11-05 10:11:12', '2020-11-05 10:11:12'),
(238, 158, 0, 'Uyushgan jinoyatchilikning davlat konstitutsiyaviy asoslariga tahdidi', 1, 0, 'Kor.pdf', '2020-11-05 10:12:42', '2020-11-05 10:12:42'),
(239, 158, 0, 'Uyushgan jinoyatchilikning davlat konstitutsiyaviy asoslariga tahdidi', 1, 0, 'Kor.pdf', '2020-11-05 10:12:51', '2020-11-05 10:12:51'),
(240, 158, 2, 'Uyushgan jinoyatchilikning davlat konstitutsiyaviy asoslariga tahdidi', 1, 5, 'Kor.pdf', '2020-11-05 10:13:08', '2020-11-05 10:13:08'),
(241, 136, 1, 'АППАРАТНО-ПРОГРАММНЫЙ КОМПЛЕКС «БЕЗОПАСНЫЙ ГОРОД»: ПРОБЛЕМЫ И РЕШЕНИЯ', 1, 3, 'Ахб. безопасный город -2019.4.pdf', '2020-11-05 11:14:41', '2020-11-05 11:14:41'),
(242, 84, 1, 'Магистрал йўлларда шовқин муҳофазаси бўйича норматив-техник ҳужжатларни тахлили', 2, 2, 'макола 1.pdf', '2020-11-05 11:23:04', '2020-11-05 11:23:04'),
(243, 106, 1, 'Психологические состоянии участников дорожного движения являюшимся фактором безопасности', 1, 3, 'Дорожно-транспортные происшествия с участием пешеходов.pdf', '2020-11-05 13:08:28', '2020-11-05 13:08:28'),
(244, 106, 2, 'Психологические состоянии участников дорожного движения являюшимся фактором безопасности', 2, 4, 'Психологические состоянии участников дорожного движения являюшимся фактором безопасности.pdf', '2020-11-05 13:11:29', '2020-11-05 13:11:29'),
(245, 106, 2, 'Йўл ҳаракати хавфсизлигини таъминлашнинг асосий муаммолари', 1, 5, 'Йўл ҳаракати хавфсизлигини таъминлашнинг асосий муаммолари.pdf', '2020-11-05 13:16:37', '2020-11-05 13:16:37'),
(246, 106, 2, 'Шахар транспорт тизимида харакат хавфсизлигини таъминлаш', 2, 5, 'Шахар транспорт тизимида харакат хавфсизлигини таъминлаш.pdf', '2020-11-05 13:18:05', '2020-11-05 13:18:05'),
(247, 106, 2, 'Йўл транспорт ходисаларида инсон омили', 2, 5, 'Йўл транспорт ходисаларида инсон омили.pdf', '2020-11-05 13:19:01', '2020-11-05 13:19:01'),
(248, 106, 2, 'Йулнинг ўтказувчанлик қобилиятини яхшилаш', 2, 5, 'Йулнинг ўтказувчанлик қобилиятини яхшилаш.pdf', '2020-11-05 13:20:06', '2020-11-05 13:20:06'),
(249, 106, 2, 'Хайдовчи мехнатининг психофизиологик асослари', 2, 5, 'Хайдовчи мехнатининг психофизиологик асослари.pdf', '2020-11-05 13:20:49', '2020-11-05 13:20:49'),
(250, 106, 0, 'Ахоли пунктларида пиёдалар харакатини ташкил этиш', 2, 0, 'Ахоли пунктларида пиёдалар харакатини ташкил этиш.pdf', '2020-11-05 13:21:24', '2020-11-05 13:21:24'),
(251, 106, 0, 'Ахоли пунктларида пиёдалар харакатини ташкил этиш', 2, 0, 'Ахоли пунктларида пиёдалар харакатини ташкил этиш.pdf', '2020-11-05 13:21:50', '2020-11-05 13:21:50'),
(252, 88, 2, 'AVTOMOBIL SHINALARINI ATROF-MUHIT VA INSON  SALOMATLIGIGA TAS’IRI', 2, 5, '1.pdf', '2020-11-05 13:25:44', '2020-11-05 13:25:44'),
(253, 88, 2, 'ТРАНСПОРТ ВОСИТАЛАРИНИНГ ХАВФСИЗ  ҲАРАКАТЛАНИШИДА ЙЎЛ ШАРОИТИНИНГ ТАЪСИРИНИ  ЎРГАНИШ', 2, 5, '2.pdf', '2020-11-05 13:26:32', '2020-11-05 13:26:32'),
(254, 88, 2, 'AVTOBUS MARSHRUTLARNI MURAKKABLIGINI TOSHKENT  SHAHRIDA TAHLIL QILISH', 2, 5, '3.pdf', '2020-11-05 13:27:12', '2020-11-05 13:27:12'),
(255, 88, 2, 'XAVFSIZLIK TALABLARINI OSHIRISHDA AVTOMOBIL TEXNIKALARINING TORMOZ TIZIMLARINI  TAKOMILLASHTIRISHDAGI O’RNI', 2, 5, '4.pdf', '2020-11-05 13:27:55', '2020-11-05 13:27:55'),
(256, 88, 2, 'AVTOMOBIL SHINALARINI ATROF-MUHIT VA  INSONSALOMATLIGIGA TAS’IRI', 2, 5, '5.pdf', '2020-11-05 13:28:35', '2020-11-05 13:28:35'),
(257, 88, 2, 'YO’L HARAKATINI TASHKIL ETISHNING TEXNIK VOSITALARINI  TAKOMILLASHTIRISH', 2, 5, '6.pdf', '2020-11-05 13:29:44', '2020-11-05 13:29:44'),
(258, 151, 2, 'O\'zini o\'zi boshqarish idorasi - mahallada jamoatchilik nazoratining ayrim funktsiyalari xususida', 1, 5, '20180516_094917.jpg', '2020-11-06 03:07:38', '2020-11-06 03:07:38'),
(259, 151, 1, 'Yurt taqdiriga daxldorlik - oliy tuyg\'u', 2, 3, '20180516_095020.jpg', '2020-11-06 03:09:35', '2020-11-06 03:09:35'),
(260, 151, 2, 'Fuqarolik jamiyatida maxallaning o\'rni', 1, 5, '245105259_297618.jpg', '2020-11-06 03:11:20', '2020-11-06 03:11:20'),
(261, 172, 1, 'Terrorizm va ekstremizmga qarshi kurashda zamonaviy ta\'limning tutgan o\'rni', 1, 3, 'Maqola terrorizm.docx', '2020-11-06 06:20:01', '2020-11-06 06:20:01'),
(262, 172, 2, 'IIOlarining to\'li va chegara hududlardagi tezkor bo\'linmalarining terrorizmga qarshi kurashishini takomillashtirish', 1, 6, 'ushbu maqola yopiq ei,.docx', '2020-11-06 06:35:18', '2020-11-06 06:35:18'),
(263, 165, 2, 'The ways of enhancement in postal communication sphere', 2, 4, 'сканирование0010.jpg', '2020-11-06 07:11:03', '2020-11-06 07:11:03'),
(264, 110, 1, 'The role of free economic zones in innovation driven development of economy', 1, 2, 'макола 3.pdf', '2020-11-06 10:08:20', '2020-11-06 10:08:20'),
(265, 165, 1, 'Automation Of Maintenance Processing System In Uzbekistan', 1, 2, 'Ahmadbekov Xokimbek.PDF', '2020-11-06 12:05:02', '2020-11-06 12:05:02'),
(266, 84, 2, 'Транспортни хавфсиз бошқариш кўрсаткичларини баҳолаш', 2, 5, 'Транспортни хавфсиз бошқариш кўрсаткичларини баҳолаш.docx', '2020-11-07 05:51:27', '2020-11-07 05:51:27'),
(267, 84, 2, 'Транспортни хавфсиз бошқариш кўрсаткичларини баҳолаш', 2, 5, 'Транспортни хавфсиз бошқариш кўрсаткичларини баҳолаш.pdf', '2020-11-07 05:56:47', '2020-11-07 05:56:47'),
(268, 84, 2, 'Хавфсизлик талабларини оширишда автомобиль техникаларининг тормоз тизимларини такомиллаштиришдаги ўрни', 2, 5, 'Хавфсизлик талабларини оширишда....pdf', '2020-11-07 05:59:04', '2020-11-07 05:59:04'),
(269, 84, 2, 'Автомобилларнинг ҳаракат миқдорини баҳолаш', 2, 5, 'Автомобилларнинг ҳаракат миқдорини баҳолаш.pdf', '2020-11-07 06:01:03', '2020-11-07 06:01:03'),
(270, 84, 2, 'Автомобильные шины и их влияние на безопасность дорожного движения', 2, 5, 'Автомобильные шины и их влияние....pdf', '2020-11-07 06:39:51', '2020-11-07 06:39:51'),
(271, 84, 2, 'Турли иқлим шароитларида устахона майдонларини ҳисоблаш усуллари', 2, 5, 'Турли иқлим шароитларида устахона май....pdf', '2020-11-07 06:41:24', '2020-11-07 06:41:24'),
(272, 156, 1, 'Гаров эҳтиёт чораси ва уни қўллаш тартиби', 2, 3, 'Axborotnoma-2013-02.pdf', '2020-11-07 07:58:07', '2020-11-07 07:58:07'),
(273, 174, 1, 'Jinoyat protsessida dalillarni toʼplashni takomillashtirish', 1, 3, 'ЖУРНАЛ ХУКУКИЙ ТАТКИКОТЛАР 2018 9-СОН (04-09-БЕТДА).pdf', '2020-11-07 09:07:56', '2020-11-07 09:07:56'),
(274, 174, 2, 'Sud-huquq tizimini liberallashtirish jarayonida eksperiment oʼtkazishning oʼziga xos jihatlari', 1, 5, 'Суд-ҳуқуқ тизимини либераллаштириш жараёнида эксперимент.pdf', '2020-11-07 09:25:46', '2020-11-07 09:25:46'),
(275, 174, 1, 'Вопросы регулирования собрания доказательств в уголовном процессе', 1, 3, 'Axborotnoma-2019-2.pdf', '2020-11-07 09:32:59', '2020-11-07 09:32:59'),
(276, 174, 1, 'Jinoyat protsessida isbot qilishning umumiy shartlari bilan bogʼliq muammolar', 1, 3, 'IMG_20191217_173419_140.jpg', '2020-11-07 09:36:12', '2020-11-07 09:36:12'),
(277, 174, 1, 'Dalillar majmuini baholash isbot qilishning umumiy sharti sifatida', 1, 3, 'МУНДАРИЖА ШУ 2019 2 сонн .pdf', '2020-11-07 09:52:28', '2020-11-07 09:52:28'),
(278, 174, 1, 'СОБИРАНИЕ ДОКАЗАТЕЛЬСТВ В УГОЛОВНОМ ПРОЦЕССЕ: ОПЫТ УЗБЕКИСТАНА', 1, 1, 'Раджабов ред.pdf', '2020-11-07 10:00:09', '2020-11-07 10:00:09'),
(279, 174, 1, 'Таниб олиш учун кўрсатиш хорижий мамлакатлар тажрибаси таҳлили', 2, 3, 'ХУКУК ВА БУРЧ МАКОЛА 2020.pdf', '2020-11-07 10:04:26', '2020-11-07 10:04:26'),
(280, 174, 1, 'Jinoyat protsessida isbot qilishning ishtirokchilari', 2, 3, 'юрист журнали 2 сон.pdf', '2020-11-07 10:06:31', '2020-11-07 10:06:31'),
(281, 174, 1, 'Исбот қилишнинг умумий шарти сифатида далилларни тўплаш', 1, 3, 'Б.А.Ражабов Исбот килишнинг умумий шарти сифатида.pdf', '2020-11-07 13:00:16', '2020-11-07 13:00:16'),
(282, 174, 1, 'Обеспечение соблюдения общих условий', 1, 1, 'Обеспечение соблюдения общих условий.pdf', '2020-11-07 13:03:33', '2020-11-07 13:03:33'),
(283, 174, 1, 'Б.РАЖАБОВ ПРОБЛЕМЫ, СВЯЗАННЫЕ С ОБЕСПЕЧЕНИЕМ СОБЛЮДЕНИЯ ОБЩИМ УСЛОВИЯМ ДОКАЗЫВАНИЯ', 1, 1, 'Б.РАЖАБОВ ПРОБЛЕМЫ, СВЯЗАННЫЕ С ОБЕСПЕЧЕНИЕМ СОБЛЮДЕНИЯ ОБЩИМ УСЛОВИЯМ ДОКАЗЫВАНИЯ.pdf', '2020-11-07 13:04:29', '2020-11-07 13:04:29'),
(284, 174, 1, 'статья Ражабов Б. Турдиев Л. СОБИРАНИЕ ДОК.', 2, 1, 'статья Ражабов Б. Турдиев Л. СОБИРАНИЕ ДОК..docx', '2020-11-07 13:06:49', '2020-11-07 13:06:49'),
(285, 174, 2, 'Исбот қилишнинг умумий шартларига риоя этилишини  таъминлашнинг ҳуқуқий механизмига оид муаммолар', 2, 5, '21 АСР ИЛМ ФАНИ (50-61 бет).docx', '2020-11-07 13:08:16', '2020-11-07 13:08:16'),
(286, 174, 2, 'Жазолар ва ЖХТнинг бошқа чорларини ижро этувчи органлар', 0, 5, 'Новый документ 2019-10-17 14.48.06_1.jpg', '2020-11-07 13:11:57', '2020-11-07 13:11:57'),
(287, 174, 1, 'Б.РАЖАБОВ (ЭЛЕКТРОН ДАЛИЛЛАР)', 1, 3, '1. Б.РАЖАБОВ (ЭЛЕКТРОН ДАЛИЛЛАР).docx', '2020-11-07 13:13:29', '2020-11-07 13:13:29'),
(288, 174, 2, 'PROOF IN THE CRIMINAL PROCESSREPUBLIC OF UZBEKISTAN', 2, 4, 'Rаjabov B (PROOF IN THE CRIMINAL PROCESS).docx', '2020-11-07 13:14:33', '2020-11-07 13:14:33'),
(289, 75, 1, 'Нормирование расхода топлива и обеспечение уменьшения расхода топлива карьерных автосамосвалов', 2, 3, 'Вестник ТАЙИ-2019-4.jpg', '2020-11-09 07:50:27', '2020-11-09 07:50:27'),
(290, 75, 1, 'Особенности эксплуатации автомобильных газовых баллонов сжатого природного газа', 2, 3, 'Вестник ТАЙИ-2019-2.jpg', '2020-11-09 07:53:29', '2020-11-09 07:53:29'),
(291, 75, 1, 'Тенденции обеспечения безопасности дорожного движения в Республике Узбекистан', 1, 3, 'Вестник Академии-2019.jpg', '2020-11-09 07:55:22', '2020-11-09 07:55:22'),
(292, 75, 2, 'Автомобильные заторы:  причины, последствия и способы устранения', 1, 5, 'Конф Акад май 2020.jpg', '2020-11-09 08:01:11', '2020-11-09 08:01:11'),
(293, 75, 2, 'Диметиловый эфир – альтернативное моторное топливо', 1, 5, 'Конф Акад май 2020-02.jpg', '2020-11-09 08:04:16', '2020-11-09 08:04:16'),
(294, 75, 2, 'Преимущества использования системы “Europrotoсol” в регистрации дорожно-транспортных происшествий', 1, 5, 'Конф Акад май 2020-03.jpg', '2020-11-09 08:06:22', '2020-11-09 08:06:22'),
(295, 75, 1, 'Использование природного газа в качестве моторного топлива для механических транспортных средств. Проблемы и перспективы', 2, 2, 'Автопром-2017.jpg', '2020-11-09 08:09:43', '2020-11-09 08:09:43'),
(296, 75, 1, 'Перспективы использования альтернативных моторных топлив в Узбекистане', 2, 2, 'Высш школа-2017.jpg', '2020-11-09 08:11:46', '2020-11-09 08:11:46'),
(297, 75, 2, 'Вопросы оптимизации температурного режима систем и деталей двигателя внутреннего сгорания', 2, 4, 'Конф Чимкент-2017 - 01.jpg', '2020-11-09 08:14:54', '2020-11-09 08:14:54'),
(298, 75, 2, 'Электромобили: проблемы создания и эксплуатации', 2, 4, 'Конф Чимкент-2017 - 02.jpg', '2020-11-09 08:16:24', '2020-11-09 08:16:24'),
(299, 75, 2, 'Исследование композиционных топлив с использованием спиртов', 2, 4, 'Конф ТАЙИ-2017-01.jpg', '2020-11-09 08:18:59', '2020-11-09 08:18:59'),
(300, 75, 2, 'Обеспечение эксплуатационной безопасности газобаллонных автомобилей', 2, 4, 'Конф ТАЙИ-2017-02.jpg', '2020-11-09 08:20:26', '2020-11-09 08:20:26'),
(301, 75, 1, 'Молодежь, инновации и окружающая среда', 2, 3, 'Таълим, фан ва инновац.jpg', '2020-11-09 08:22:49', '2020-11-09 08:22:49'),
(302, 75, 1, 'От образования к инновациям и экономике знаний', 2, 3, 'Экон вестник - 2018.jpg', '2020-11-09 08:25:24', '2020-11-09 08:25:24'),
(303, 75, 1, 'Проблемы экологии при проектировании, строительстве и эксплуатации автомобильных дорог', 2, 3, 'Экол вестник - 2017.jpg', '2020-11-09 08:26:46', '2020-11-09 08:26:46'),
(304, 75, 2, 'Инновации в сфере экологического образования и воспитания молодежи', 2, 4, 'Конф Гомель - 2018.jpg', '2020-11-09 08:29:17', '2020-11-09 08:29:17'),
(305, 150, 1, 'Жиноят қидирув ва уюшган жиноятчиликка қарши кураш бўлимида олиб бориладиган гиёҳвандлик воситалари билан боғлиқ жиноятларга қарши курашнинг ўзига хослиги', 2, 7, '1.docx', '2020-11-09 09:27:41', '2020-11-09 09:27:41'),
(306, 150, 1, 'Ёш авлодни гиёҳвандликдан асраш билан боғлиқ айрим муаммолар', 1, 7, '2.docx', '2020-11-09 09:29:55', '2020-11-09 09:29:55'),
(307, 150, 1, 'Жиноятчиларни қўлга олиш операциясини ўтказиш тактикаси', 2, 7, '3.docx', '2020-11-09 09:31:24', '2020-11-09 09:31:24'),
(308, 150, 1, 'Махсус техника воситалари ёрдамида портловчи моддалар ва воситаларни аниқлашнинг ўзига хос хусусиятлари', 2, 7, '4.docx', '2020-11-09 09:33:18', '2020-11-09 09:33:18'),
(309, 150, 1, 'БМТ нинг терроризмга қарши кураш соҳасидаги халқаро ҳужжат-лари ва уларнинг Ўзбекистонда ратификация қилиниши', 2, 7, '5.docx', '2020-11-09 09:34:27', '2020-11-09 09:34:27'),
(310, 150, 1, 'Одам савдоси жиноятлари билан боғлиқ айрим жиҳатлар', 2, 7, '6.docx', '2020-11-09 09:35:38', '2020-11-09 09:35:38'),
(311, 150, 1, 'Тезкор комбинация ўтказишнинг ўзига хос хусусиятлари, психологик жиҳатлари ҳамда юзага келадиган муаммоларни бартараф этиш йўналишлари', 2, 7, '7.docx', '2020-11-09 09:36:47', '2020-11-09 09:36:47'),
(312, 165, 2, 'Ахборот хавфсизлигини таъминлашнинг ҳуқуқий асослари (электрон тижорат мисолида)', 2, 4, 'sertifikat.pdf', '2020-11-09 10:08:43', '2020-11-09 10:08:43'),
(313, 150, 1, 'Уюшган жиноятчиликка қарши курашишда ИИИлари “махсус” аппарати фаолиятини янада такомиллаштириш йўналишлари', 1, 7, '10.docx', '2020-11-09 11:12:38', '2020-11-09 11:12:38'),
(314, 150, 1, 'Республикада қонунчилик самарадорлигини ошириш муаммолари', 2, 7, '11.docx', '2020-11-09 11:14:22', '2020-11-09 11:14:22'),
(315, 150, 1, 'Ўзбекистонда судлов тизими - фуқарларнинг ҳуқуқ ва эркинликлари кафолатчиси сифатида', 1, 7, '12.docx', '2020-11-09 11:14:48', '2020-11-09 11:14:48'),
(316, 150, 1, 'Исломда ҳуқуқ ҳамда шариат нормаларининг бугунги кун жаҳон сиёсий харитасидаги ўрни', 1, 3, '13.docx', '2020-11-09 11:17:02', '2020-11-09 11:17:02'),
(317, 150, 1, 'Ёшларни асраш қайғуси', 1, 7, '14.docx', '2020-11-09 11:18:19', '2020-11-09 11:18:19'),
(318, 150, 1, 'Жиноят ишини қўзғатиш ва дастлабки терговни амалга оширишда тезкор-қидирув фаолияти натижаларидан фойдаланиш хусусиятлари', 2, 7, '15.docx', '2020-11-09 11:19:26', '2020-11-09 11:19:26'),
(319, 150, 1, 'Тезкор вазият бўйича маълумотлар тўплашнинг ўзига хослиги', 2, 1, '16.docx', '2020-11-09 11:20:20', '2020-11-09 11:20:20'),
(320, 150, 1, 'Оммавий тартибсизликлар юзага келишининг асосий психологик сабаб ва моҳиятлари', 2, 1, '17.docx', '2020-11-09 11:21:39', '2020-11-09 11:21:39'),
(321, 150, 1, 'Ёш авлодни терроризмдан асраш муаммоси', 1, 1, '18.docx', '2020-11-09 11:22:30', '2020-11-09 11:22:30'),
(322, 150, 1, 'Фуқароларнинг ҳуқуқий онги ва ҳуқуқий маданиятинг юксалиши жамият тараққиётининг асосий мезонидир', 2, 7, '21.docx', '2020-11-09 11:26:03', '2020-11-09 11:26:03'),
(323, 150, 1, 'Фуқаролик жамиятини ривожлантиришда «сиёсий мухолифат» ёки соғлом рақобатнинг аҳамияти', 1, 1, '31.docx', '2020-11-09 11:27:27', '2020-11-09 11:27:27'),
(324, 150, 1, 'Транспорт воситаларини ўғирлаш ва олиб қочиш жиноятларининг тезкор тактик тавсифи ва ўзига хос белгилари', 1, 1, '34.docx', '2020-11-09 11:29:09', '2020-11-09 11:29:09'),
(325, 150, 1, 'Оммавий тартибсизликларнинг олдини олиш бўйича ўтказиладиган чора тадбирларнинг ўзига хослиги', 2, 7, '34.1.docx', '2020-11-09 11:29:59', '2020-11-09 11:29:59'),
(326, 150, 1, 'Транспорт воситаларини ўғирлаш ва олиб қочиш жиноятларининг бугунги  кундаги ҳолати ва уларнинг ўзига хос хусусиятлари', 1, 7, '35.docx', '2020-11-09 11:30:54', '2020-11-09 11:30:54'),
(327, 150, 1, 'Тезкор қидирув тадбирларида қидирув техникасини қўллашнинг ўзига хослиги', 2, 7, '36.docx', '2020-11-09 11:31:34', '2020-11-09 11:31:34'),
(328, 150, 1, 'Ички ишлар идоралари соҳасидаги ислоҳотлар – тинчлик ва осойишталикни таъминлаш гарови', 1, 7, '40.docx', '2020-11-09 11:32:51', '2020-11-09 11:32:51'),
(329, 150, 1, 'Тезкор қидирув тадбирларида айрим турдаги махсус техника воситалари қўллашнинг ўзига хосликлари', 1, 7, '41.docx', '2020-11-09 11:34:01', '2020-11-09 11:34:01'),
(330, 150, 1, 'Ўғирлик жиноятларининг содир этилишига таъсир этувчи тезкор тактик омиллар', 2, 7, '42.docx', '2020-11-09 11:34:40', '2020-11-09 11:34:40'),
(331, 150, 1, 'Жиноятчиликка қарши курашда қидирув техникасидан фойдаланишнинг хусусиятлари', 1, 7, '43.docx', '2020-11-09 11:35:30', '2020-11-09 11:35:30'),
(332, 150, 1, 'Технические преимущества ионно-дрейфового детектора «КЕРБЕР-Т', 2, 7, '44.docx', '2020-11-09 11:36:15', '2020-11-09 11:36:15'),
(333, 150, 1, 'Терроризм ва экстремизм ғояларининг интернет воситаси орқали ёшлар онггига таъсири', 1, 1, '48.docx', '2020-11-09 11:37:40', '2020-11-09 11:37:40'),
(334, 150, 1, 'ИИОлари тезкор аппаратларининг одам савдоси жиноятларини фош этишдаги асосий вазифалари', 1, 1, '49.docx', '2020-11-09 11:38:35', '2020-11-09 11:38:35'),
(335, 150, 1, 'Оперативные средства идентификации достоверности информации в борьбе против преступности', 2, 7, '50.docx', '2020-11-09 11:39:20', '2020-11-09 11:39:20'),
(336, 150, 1, 'Тактика расскрытия хищений чужого имущества, совершаемых организованными группами', 1, 1, '52.docx', '2020-11-09 11:40:45', '2020-11-09 11:40:45');
INSERT INTO `old_maqolas` (`id`, `user_id`, `turi`, `mavzu`, `mualliflik`, `miqyosi`, `ilova`, `created_at`, `updated_at`) VALUES
(337, 150, 1, 'Ахборотнинг техник каналларидан ахборот олиш – тезкор маълумотлар тўплаш усули сифатида', 2, 1, '53.docx', '2020-11-09 11:41:42', '2020-11-09 11:41:42'),
(338, 150, 1, 'Телевидения ва видеокузатув тизимининг умумий жиҳатлари', 2, 7, '54.1..docx', '2020-11-09 11:43:35', '2020-11-09 11:43:35'),
(339, 150, 1, 'Терроричилар томонидан портлатилган жойларни сифатли кўздан кечиришнинг айрим жиҳатлари', 2, 7, '54.docx', '2020-11-09 11:44:26', '2020-11-09 11:44:26'),
(340, 150, 1, 'Оммавий тартибсизлик билан боғлиқ жиноятларнинг жамият барқарорлигига таҳдиди', 2, 7, '57.docx', '2020-11-09 11:45:31', '2020-11-09 11:45:31'),
(341, 150, 1, 'Автотранспорт воситаларини ўғирлаш ва олиб қочиш жиноятларининг ўзига хос белгилари', 2, 1, '63.docx', '2020-11-09 11:46:40', '2020-11-09 11:46:40'),
(342, 150, 1, 'Ноқонуний меҳнат миграцияси: ижобий ва салбий жиҳатлар', 1, 7, '64.docx', '2020-11-09 11:47:47', '2020-11-09 11:47:47'),
(343, 150, 1, 'Ҳуқуқий онг ва ҳуқуқий маданиятнинг юксалиши - коррупцияга қарши курашиш мезони сифатида', 1, 1, '65.docx', '2020-11-09 11:48:32', '2020-11-09 11:48:32'),
(344, 150, 1, 'Коррупцияга қарши курашиш муаммо ва ечимлари', 1, 7, '66.docx', '2020-11-09 11:49:10', '2020-11-09 11:49:10'),
(345, 77, 1, 'Система подготовки кадров в сфере обеспечения безопасности дорожного движения: проблемы и решения', 1, 3, 'IMG_0004.pdf', '2020-11-09 11:55:21', '2020-11-09 11:55:21'),
(346, 136, 2, 'ВОЗМОЖНОСТИ ИЗУЧЕНИЯ ТОЧНЫХ НАУК В ОБРАЗОВАТЕЛЬНОМ ПРОВАЙДЕРЕ ОТКРЫТОГО ОНЛАЙН-КУРСА COURSERA', 2, 4, '2020-11-10 09_35_43-111.pdf.png', '2020-11-10 04:39:22', '2020-11-10 04:39:22'),
(347, 72, 2, 'Об особенностях экспертно-криминалистических исследований дорожно-транспортных происшествий в Узбекистане', 1, 4, 'Документ Microsoft Office Word.docx', '2020-11-12 04:54:43', '2020-11-12 04:54:43'),
(348, 167, 1, 'Bobur ijodida Vtan, sevgi va sadoqat madhi', 1, 5, 'Milliy Gvardiya.pdf', '2020-11-12 07:20:35', '2020-11-12 07:20:35'),
(349, 167, 2, 'The problem of translation political literature and translation', 2, 6, 'O`zDJTU Master.pdf', '2020-11-12 07:23:34', '2020-11-12 07:23:34'),
(350, 167, 1, 'Technology of compiling EBD', 1, 7, 'uzdjtu master 222.pdf', '2020-11-12 07:25:06', '2020-11-12 07:25:06'),
(351, 167, 1, 'The role of Information communication technologies in the process of teaching and learning English', 1, 3, 'ЎзДЖТУ Филология масалалари.pdf', '2020-11-12 07:27:05', '2020-11-12 07:27:05'),
(352, 167, 2, 'The problem оf translating pоlitiсаl speeсh аnd diplоmаtiс lаnguаge', 1, 4, 'Андижон мақоласи.pdf', '2020-11-12 07:33:42', '2020-11-12 07:33:42'),
(353, 167, 2, 'Буйруқ – тилшуносликнинг  объекти сифатида', 1, 5, 'Қўқон ДПИ мақоласи.pdf', '2020-11-12 07:35:22', '2020-11-12 07:35:22'),
(354, 167, 2, 'Ситуация адресатности в жанре «приказ» (на примерах русского и английского языков)', 1, 5, 'Наманган мақола.pdf', '2020-11-12 07:36:54', '2020-11-12 07:36:54'),
(355, 167, 2, 'Technology of compiling EBD', 1, 5, 'uzdjtu master 222.pdf', '2020-11-12 07:38:43', '2020-11-12 07:38:43'),
(356, 199, 1, 'Korrupsiya diskursida leksik-semantik xususiyatlar tahlili', 1, 3, 'Happy. Akademiya.pdf', '2020-11-12 07:41:22', '2020-11-12 07:41:22'),
(357, 199, 1, 'Diskursda so`zlovchi inson rolining pragmalingvistik jihatlarining ifodalanishi', 1, 7, 'Happy Tank.pdf', '2020-11-12 07:42:45', '2020-11-12 07:42:45'),
(358, 111, 2, 'Делопроизводство на государственном языке в органах внутренних дел', 1, 5, '111111111111111111111.jpg', '2020-11-12 08:07:14', '2020-11-12 08:07:14'),
(359, 111, 1, 'Konstitutsiya - davlat tilining huquqiy asosi', 1, 3, 'Axborotnoma-2018-махсус.pdf', '2020-11-12 09:09:52', '2020-11-12 09:09:52'),
(360, 84, 2, 'Йўлларда хавфсиз ҳаракатланишни ташкил этишда пиёдаларинг ўрни', 2, 6, 'Макола 1.pdf', '2020-11-12 09:09:56', '2020-11-12 09:09:56'),
(361, 84, 2, 'Йўлларда ҳаракатланиш қоидаларига риоя қилиш барча йўл ҳаракати иштирокчиларининг бурчидир', 2, 6, 'Макола 2.pdf', '2020-11-12 09:11:51', '2020-11-12 09:11:51'),
(362, 84, 2, 'Болалар иштирокидаги йўл-транспорт ҳодисаларининг олдини олиш', 2, 6, 'Макола 3.pdf', '2020-11-12 09:12:55', '2020-11-12 09:12:55'),
(363, 111, 2, 'Tilga e`tiborsiz - elga e`tiborsiz', 1, 6, '10-сон АКАДЕМИЯ ЁШЛАРИ_s.pdf', '2020-11-12 09:49:10', '2020-11-12 09:49:10'),
(364, 82, 2, 'Ҳарбий автотранспорт воситаларида ҳаракат хавфсизлигини таъминлашда \"Ҳайдовчи-автомобиль-йўл\" тизимининг ахамияти', 2, 4, 'МГ1.pdf', '2020-11-13 05:38:04', '2020-11-13 05:38:04'),
(365, 82, 2, 'Хавфсиз ҳаракатланишда автранспорт воситаларинг техник ҳолатининг аҳамияти', 2, 4, 'МГ2.pdf', '2020-11-13 05:39:45', '2020-11-13 05:39:45'),
(366, 82, 2, 'Оценка топливной экономичности замлеройно-транспортных машин их разработке', 2, 5, 'МГ3.pdf', '2020-11-13 05:41:43', '2020-11-13 05:41:43'),
(367, 82, 2, 'Бухоро вилоятида болалар иштирокидаги ЙТҲларини олдини олиш', 2, 5, 'кафедра тўплам.pdf', '2020-11-13 05:43:20', '2020-11-13 05:43:20'),
(368, 82, 2, 'Хавфли йўл бўлакларини аниқлашда ЙТҲни статистик (тахлил)нинг ахамияти', 2, 5, 'Академия Ҳуқуқшунослик истиқболлари 2020 й..pdf', '2020-11-13 05:46:06', '2020-11-13 05:46:06'),
(369, 82, 2, '\"Йўл ҳаракати хавфсизлиги тўғрисида\"ги қабул қилинганига беш йил тўлди', 2, 5, 'Автохамрох1.pdf', '2020-11-13 05:49:36', '2020-11-13 05:49:36'),
(370, 82, 1, 'Автотранспорт воситаларининг деталларини тиклаш ва самарадорлигини яхшилаш йўллари', 2, 3, 'макола илмий.pdf', '2020-11-13 05:53:55', '2020-11-13 05:53:55'),
(371, 144, 2, 'Tinchlik va barqarorlikni ta\'minlashda pasport tizimining ro\'li', 1, 5, 'Maqola PDF1.pdf', '2020-11-13 07:26:09', '2020-11-13 07:26:09'),
(372, 60, 2, 'Advanced information security management', 2, 4, 'Ilmiy maqola Всший школа.pdf', '2020-11-13 09:20:25', '2020-11-13 09:20:25'),
(373, 60, 1, 'Пути повышения почтовой безопасности в пунктах почтового обмена АО \"Узбекистон почтаси\"', 1, 2, 'maqola высшая школа.pdf', '2020-11-13 09:31:56', '2020-11-13 09:31:56'),
(374, 168, 2, 'К вопросу юридико-лингвистической антикоррупционной экспертизы нормативно-правовых актов', 2, 6, '1.pdf', '2020-11-13 10:13:50', '2020-11-13 10:13:50'),
(375, 168, 2, 'Воспитание патриотизма на уроках русского языка', 1, 6, '2.pdf', '2020-11-13 10:15:43', '2020-11-13 10:15:43'),
(376, 168, 2, 'Теоретические основы использования инновационных технологий в изучении модуля \"сложное предложение\"', 1, 6, '2.pdf', '2020-11-13 10:17:36', '2020-11-13 10:17:36'),
(377, 168, 2, 'Теоретические аспекты юридико-лингвистической антикоррупционной экспертизы нормативных правовых актов и их проекты', 2, 6, '3.pdf', '2020-11-13 10:20:10', '2020-11-13 10:20:10'),
(378, 168, 2, 'Юридико-лингвистические антикоррупционные экспертизы в нормативно-правовых актах', 1, 6, '4.pdf', '2020-11-13 10:22:29', '2020-11-13 10:22:29'),
(379, 168, 2, 'Комил инсон орзуси', 1, 8, '5.pdf', '2020-11-13 10:23:48', '2020-11-13 10:23:48'),
(380, 201, 1, 'O’zbekiston Respublikasi ma’muriy sud ishlarini yuritishda advokat ishtirokining o’ziga xos xususiyatlari', 1, 1, 'M_fuqarolikni_ts.pdf', '2020-11-14 08:31:19', '2020-11-14 08:31:19'),
(381, 174, 1, 'Жазони ижро этувчи муассасалар ва  органлар фаолияти устидан суд назорати', 1, 3, 'МАКОЛА СКАНЕР.docx', '2020-11-14 10:06:41', '2020-11-14 10:06:41'),
(382, 174, 1, 'Жазони ижро этувчи муассасалар ва  органлар ваколатига оид нормаларни такомиллаштириш', 2, 0, 'Ражабов макола.docx', '2020-11-14 10:10:08', '2020-11-14 10:10:08'),
(383, 174, 1, 'Жазони ижро этувчи муассасалар ва  органлар ваколатига оид нормаларни такомиллаштириш', 2, 0, 'Ражабов макола.docx', '2020-11-14 10:10:29', '2020-11-14 10:10:29'),
(384, 174, 2, 'Жазони ижро этувчи муассасалар ва  органлар ваколатига оид нормаларни такомиллаштириш', 2, 5, 'Ражабов макола.docx', '2020-11-14 10:11:56', '2020-11-14 10:11:56'),
(385, 174, 2, 'Таниб олиш учун кўрсатиш', 2, 5, 'Ражабов макола.docx', '2020-11-14 10:14:02', '2020-11-14 10:14:02'),
(386, 174, 1, 'Далиллар мажмуини баҳолаш', 1, 3, 'Ражабов макола.docx', '2020-11-14 10:17:08', '2020-11-14 10:17:08'),
(387, 174, 1, 'Далилларни баҳолашнинг айрим жиҳатлари', 1, 3, 'Документ Microsoft Office Word.docx', '2020-11-14 10:35:06', '2020-11-14 10:35:06'),
(388, 174, 1, 'ВОПРОСЫ ОЦЕНКИ ДОКАЗАТЕЛЬСТВ В УГОЛОВНОМ ПРОЦЕССЕ', 1, 1, 'СЕРТИФИКАТ 1 (ПРОБЛЕМА И НАУКА).jpg', '2020-11-14 10:36:26', '2020-11-14 10:36:26'),
(389, 174, 1, 'ДОКАЗЫВАНИЕ В УГОЛОВНОМ ПРОЦЕССЕ', 1, 1, 'Справка о публикации ПСНО Ражабов.pdf', '2020-11-14 10:37:36', '2020-11-14 10:37:36'),
(390, 174, 1, 'ЖИНОЯТ ПРОЦЕССИДА ИСБОТ ҚИЛИШНИНГ УМУМИЙ ШАРТЛАРИГА ОИД ҚОИДАЛАРНИНГ РЕТРОСПЕКТИВ ТАҲЛИЛИ', 1, 3, 'Huquq 2019 ЙИЛ 04-СОН.pdf', '2020-11-14 10:40:28', '2020-11-14 10:40:28'),
(391, 174, 1, 'РЕТРОСПЕКТИВНЫЙ АНАЛИЗ ПОЛОЖЕНИЙ, КАСАЮЩИХСЯ ОБЩИХ УСЛОВИЙ ДОКАЗЫВАНИЯ В УГОЛОВНОМ ПРОЦЕССЕ', 1, 1, 'Ражабов макола.docx', '2020-11-14 10:43:37', '2020-11-14 10:43:37'),
(392, 174, 1, 'Далиллар баҳолашни такомиллаштириш', 1, 3, 'ОДИЛЛИК МЕЗОНИ (50-54-БЕТ).pdf', '2020-11-14 10:45:22', '2020-11-14 10:45:22'),
(393, 174, 1, 'ПРАВИЛА ОЦЕНКИ СОВОКУПНОСТИ ДОКАЗАТЕЛЬСТВ В КАЧЕСТВЕ МЕХАНИЗМА ОБЕСПЕЧЕНИЯ СОБЛЮДЕНИЯ ОБЩИМ УСЛОВИЯМ ДОКАЗЫВАНИЯ', 1, 1, 'ЯНГИ МАКОЛА ЧИККАН ЖУРНАЛ ОБЛОЖКАСИ.jpeg', '2020-11-14 10:46:57', '2020-11-14 10:46:57'),
(394, 174, 1, 'Жиноят процессида далиллар мажмуини  баҳолаш масалалари', 1, 3, 'Ражабов макола.docx', '2020-11-14 10:49:26', '2020-11-14 10:49:26'),
(395, 174, 1, 'ЖИНОЯТ ПРОЦЕССИДА ИСБОТ ҚИЛИШ ТУШУНЧАСИ ТАҲЛИЛИ', 1, 3, 'Б.А.РАЖАБОВ (ЖПда ИСБОТ КИЛИШ.).docx', '2020-11-14 10:50:17', '2020-11-14 10:50:17'),
(396, 174, 1, 'THE MECHANISM FOR ENSURING COMPLIANCE WITH THE GENERAL CONDITIONS OF EVIDENCEAND PROBLEMS RELATED WITH IT', 1, 1, 'ХИНДИСТОН ЖУРНАЛ СЕТИФИКАТИ.jpg', '2020-11-14 10:51:15', '2020-11-14 10:51:15'),
(397, 174, 1, 'СОВЕРШЕНСТВОВАНИЯ РЕГУЛИРОВАНИЕ СОБИРАНИЕ ДОКАЗАТЕЛЬСТВ В УГОЛОВНОМ ПРОЦЕССЕ', 1, 3, 'Ражабов макола.docx', '2020-11-14 10:55:51', '2020-11-14 10:55:51'),
(398, 174, 1, 'Совершенсвование зашита прав человека', 2, 3, 'Ражабов макола.docx', '2020-11-14 10:57:55', '2020-11-14 10:57:55'),
(399, 174, 2, 'Жиноят процессида далилларга баҳо бериш масалалари', 1, 5, 'Новый документ 2019-01-11 16.03.43_1.jpg', '2020-11-14 11:00:12', '2020-11-14 11:00:12'),
(400, 174, 1, 'СОВЕРШЕНСТВОВАНИЯ РЕГУЛИРОВАНИЕ ОЦЕНКИ ДОКАЗАТЕЛЬСТВ В УГОЛОВНОМ ПРОЦЕССЕ', 1, 2, 'Rajabov B (сертификат).jpg', '2020-11-14 11:01:25', '2020-11-14 11:01:25'),
(401, 174, 1, 'PROBLEMS OF EXAMINATION OF CRIMINAL PROCEEDINGS', 1, 1, 'Rajabov B (сертификат).jpg', '2020-11-14 11:02:41', '2020-11-14 11:02:41'),
(402, 174, 2, 'Жиноят процессуал гувоҳлантириш жиноятнинг очилишига ёрдам берувчи кечиктириб бўлмас тергов ҳаракати', 1, 5, 'Новый документ 2019-01-11 10.49.40_1.jpg', '2020-11-14 11:04:17', '2020-11-14 11:04:17'),
(403, 174, 2, 'Ўзбекистон Республикаси Жиноят-процессида исбот қилишнинг умумий шартлари', 1, 5, 'УзР. ЖПда ИСБОТ КИЛИШНИНГ УМУМИЙ ШАРТЛАРИ.docx', '2020-11-14 11:05:18', '2020-11-14 11:05:18'),
(404, 174, 2, 'SOME DISCUSSION PROOF IN THE CRIMINAL PROCESS', 1, 4, 'АНГЛИЯ ТУПЛАМ (15-18-Б).pdf', '2020-11-14 11:06:37', '2020-11-14 11:06:37'),
(405, 174, 2, 'ЖИНОЯТ ПРОЦЕССИДА ДАЛИЛЛАРНИ ТЕКШИРИШ ВА УНИ ТАКОМИЛЛАШТИРИШ МАСАЛАЛАРИ', 1, 5, 'СЕРТИФИКАТИ (Baxrtiyor Rajabov 02.2019).jpg', '2020-11-14 11:08:16', '2020-11-14 11:08:16'),
(406, 174, 1, 'EVALUATION OF EVIDENCE IN CRIMINAL PROCEEDINGS', 1, 1, 'СЕРТИФИКАТ ХИНДИСТОН ТЕЗИС.jpg', '2020-11-14 11:10:07', '2020-11-14 11:10:07'),
(407, 174, 1, 'ЖИНОЯТ ПРОЦЕССИДА ИСБОТ ҚИЛИШНИНГ УМУМИЙ ШАРТЛАРИ МАЗМУНИ, ТИЗИМИ ВА ТАСНИФЛАНИШИ', 1, 3, 'СЕРТИФИКАТ 2-ОНЛАЙН МИЛЛИЙ КОНФЕРЕНЦИЯ МАРТ 2019.jpg', '2020-11-14 11:10:58', '2020-11-14 11:10:58'),
(408, 174, 1, 'ОСОБЕННОСТИ СОБИРАНИЯ ДОКАЗАТЕЛЬСТВ В УГОЛОВНОМ ПРОЦЕССЕ', 1, 1, 'СЕРТИФИКАТ ИСПАНИЯ (Rajabov Baxtiyor).jpg', '2020-11-14 11:11:56', '2020-11-14 11:11:56'),
(409, 174, 2, 'ОЦЕНКИ СОВОКУПНОСТИ ДОКАЗАТЕЛЬСТВ  В УГОЛОВНОМ ПРОЦЕССЕ', 1, 4, 'АКШ СЕРТИФИКАТ АПРЕЛ 2019.jpg', '2020-11-14 11:12:50', '2020-11-14 11:12:50'),
(410, 174, 1, 'СОБИРАНИЕ ДОКАЗАТЕЛЬСТВ В УГОЛОВНОМ ПРОЦЕССЕ: ОПЫТ УЗБЕКИСТАНА', 1, 1, '2_5269556299573495384.pdf', '2020-11-14 11:19:40', '2020-11-14 11:19:40'),
(411, 174, 0, 'IMPROVEMENTS  REGULATION  COLLECTION  OF  EVIDENCE  IN  THE  CRIMINAL PROCESS', 1, 0, 'ЖУРНАЛ ХУКУКИЙ ТАТКИКОТЛАР 2018 9-СОН (04-09-БЕТДА).pdf', '2020-11-14 11:43:52', '2020-11-14 11:43:52'),
(412, 174, 1, 'IMPROVEMENTS  REGULATION  COLLECTION  OF  EVIDENCE  IN  THE  CRIMINAL PROCESS', 1, 3, 'ЖУРНАЛ ХУКУКИЙ ТАТКИКОТЛАР 2018 9-СОН (04-09-БЕТДА).pdf', '2020-11-14 11:44:10', '2020-11-14 11:44:10'),
(413, 202, 1, 'LEGAL PROVISION OF INFORMATION SECURITY  AS AN INTEGRAL FACTOR IN THE CONTEXT OF  A PANDEMIC', 2, 2, 'Расулев Собиров Саъдуллаев Article Text-862-1-10-20200630.pdf', '2020-11-14 11:45:12', '2020-11-14 11:45:12'),
(414, 174, 1, 'Далиллар мажмуини баҳолаш исбот қилишнинг умумий шартларига риоя этилишини  таъминлаш механизми сифатида', 1, 3, 'МУНДАРИЖА ШУ 2019 2 сонн .pdf', '2020-11-14 11:45:17', '2020-11-14 11:45:17'),
(415, 174, 1, 'ЖИНОЯТ ПРОЦЕССИДА ИСБОТ ҚИЛИШНИНГ УМУМИЙ ШАРТЛАРИГА РИОЯ ЭТИЛИШИНИ ТАЪМИНЛАШ БИЛАН БОҒЛИҚ МУАММОЛАР', 1, 3, 'IMG_20191217_173419_140.jpg', '2020-11-14 11:47:00', '2020-11-14 11:47:00'),
(416, 174, 1, 'Обеспечение соблюдения общих условий доказывания в судебно-следственной практике Республики Узбекистан и проблемы в этой сфере', 1, 1, 'Обеспечение соблюдения общих условий.pdf', '2020-11-14 11:48:13', '2020-11-14 11:48:13'),
(417, 174, 1, 'ПРОБЛЕМЫ, СВЯЗАННЫЕ С ОБЕСПЕЧЕНИЕМ СОБЛЮДЕНИЯ ОБЩИМ УСЛОВИЯМ ДОКАЗЫВАНИЯ В УГОЛОВНОМ ПРОЦЕССЕ РЕСПУБЛИКИ УЗБЕКИСТАН', 1, 1, 'Справка о публикации ПСНО Ражабов.pdf', '2020-11-14 11:50:09', '2020-11-14 11:50:09'),
(418, 174, 2, 'ИСБОТ ҚИЛИШНИНГ УМУМИЙ ШАРТЛАРИГА РИОЯ  ЭТИЛИШИНИ ТАЪМИНЛАШНИНГ ҲУҚУҚИЙ МЕХАНИЗМИГА  ОИД МУАММОЛАР', 1, 4, '21 АСР ИЛМ ФАНИ (50-61 бет).docx', '2020-11-14 11:52:07', '2020-11-14 11:52:07'),
(419, 174, 2, 'Жазолар ва ЖХТнинг бошқа чорларини ижро этувчи органлар ваколатлари', 1, 4, 'Новый документ 2019-10-17 14.48.06_1.jpg', '2020-11-14 11:54:11', '2020-11-14 11:54:11'),
(420, 174, 2, 'RETROSPECTIVE ANALYSIS OF THE RULES FOR GENERAL CONDITIONS OF PROVING IN CRIMINAL PROCEDURE', 1, 4, 'Rajabov Bakhtiyor .jpg', '2020-11-14 11:55:44', '2020-11-14 11:55:44'),
(421, 174, 2, 'PROOF IN THE CRIMINAL PROCESSREPUBLIC OF UZBEKISTAN', 2, 4, 'Rаjabov B (PROOF IN THE CRIMINAL PROCESS).docx', '2020-11-14 11:56:38', '2020-11-14 11:56:38'),
(422, 174, 2, 'Дастлабки тергов ва суд терговида  таниб олиш учун кўрсатиш тергов ҳаракатининг роли ва бошқа тергов  ҳаракатлари билан боғликлиги', 2, 4, 'Ражабов макола.docx', '2020-11-14 11:58:40', '2020-11-14 11:58:40'),
(423, 174, 2, 'Issues of regulation of investigative actions presentation for identification in the criminal procedure legislation of foreign countries', 2, 4, 'СЕРТИФИКАТИ.jpg', '2020-11-14 11:59:34', '2020-11-14 11:59:34'),
(424, 174, 2, 'Improvements regulation collection of evidence in the criminal process', 2, 4, 'Ражабов макола.docx', '2020-11-14 12:02:27', '2020-11-14 12:02:27'),
(425, 174, 1, 'ЖИНОЯТ ПРОЦЕССИДАИСБОТ ҚИЛИШНИНГ ИШТИРОКЧИЛАРИ', 2, 3, 'IMG_20200809_160449_409.jpg', '2020-11-14 12:03:39', '2020-11-14 12:03:39'),
(426, 174, 1, 'ДАЛИЛЛАРНИ ТЎПЛАШДА ЗАМОНАВИЙ ТЕХНИКА ВОСИТАЛАРИДАН ФОЙДАЛАНИШ ВА ЭЛЕКТРОН ДАЛИЛЛАР МАСАЛАСИ', 2, 3, 'Ражабов макола.docx', '2020-11-14 12:06:27', '2020-11-14 12:06:27'),
(427, 174, 1, 'Гувоҳлантириш тергов ҳаракатини ўтказишда шахс ҳуқуқларининг таъминланиши', 1, 3, 'Гувоҳлантириш тергов ҳаракатини ўтказишда шахс ҳуқуқларининг таъминланиши.docx', '2020-11-15 08:58:11', '2020-11-15 08:58:11'),
(428, 174, 1, 'ГУВОҲЛАНТИРИШ ВА КЎЗДАН КЕЧИРИШ - УХШАШ ВА ФАРКЛИ ЖИХАТЛАР', 1, 3, 'ГУВОҲЛАНТИРИШ ВА КЎЗДАН КЕЧИРИШ - УХШАШ ВА ФАРКЛИ ЖИХАТЛАР.docx', '2020-11-15 09:10:52', '2020-11-15 09:10:52'),
(429, 174, 2, 'ФАХРИЙЛАР ТИНГЛОВЧИЛАР ХУЗУРИДА', 1, 5, 'ФАХРИЙЛАР ТИНГЛОВЧИЛАР ХУЗУРИДА.docx', '2020-11-15 09:11:53', '2020-11-15 09:11:53'),
(430, 174, 1, 'ГУВОҲЛАНТИРИШ ЖАРАЁНИДА КОНСТИТУЦИЯВИЙ ХУКУКЛАРИ ТАЪМИНЛАШ', 1, 3, 'ГУВОҲЛАНТИРИШ ЖАРАЁНИДА КОНСТИТУЦИЯВИЙ ХУКУКЛАРИ ТАЪМИНЛАШ.docx', '2020-11-15 09:13:57', '2020-11-15 09:13:57'),
(431, 174, 1, 'ГУВОҲЛАНТИРИШ ЎТКАЗИШДА ШАХСНИНГ КОНСТИТУЦИЯВИЙ ХУКУКЛАРИНИ ТАЪМИНЛАШ', 1, 3, 'ГУВОҲЛАНТИРИШ ЎТКАЗИШДА ШАХСНИНГ КОНСТИТУЦИЯВИЙ ХУКУКЛАРИНИ ТАЪМИНЛАШ.docx', '2020-11-15 09:18:53', '2020-11-15 09:18:53'),
(432, 174, 1, 'Гувохлантиришнинг ижтимоий хукукий асослари', 1, 3, 'Гувохлантиришнинг ижтимоий хукукий асослари.docx', '2020-11-15 09:19:58', '2020-11-15 09:19:58'),
(433, 174, 1, 'Гувохлантиришнинг ижтимоий хукукий асослари', 1, 3, 'Гувохлантиришнинг ижтимоий хукукий асослари.docx', '2020-11-15 09:21:46', '2020-11-15 09:21:46'),
(434, 174, 1, 'ШАХС ХУКУКЛАРИНИ ТАЪМИНЛАШДА ГУВОХЛАНТИРИШ ЖАРАЁНИ МАСАЛАЛАРИ', 1, 3, 'ШАХС ХУКУКЛАРИНИ ТАЪМИНЛАШДА ГУВОХЛАНТИРИШ ЖАРАЁНИ МАСАЛАЛАРИ.docx', '2020-11-15 09:23:19', '2020-11-15 09:23:19'),
(435, 174, 1, 'ГУВОХЛАНТИРИШ БУЙИЧА АЙРИМ МУЛОХАЗА ВА ХОРИЖ ТАЖРИБАСИ', 1, 3, 'ГУВОХЛАНТИРИШ БУЙИЧА АЙРИМ МУЛОХАЗА ВА ХОРИЖ ТАЖРИБАСИ.docx', '2020-11-15 09:30:04', '2020-11-15 09:30:04'),
(436, 174, 1, 'МОЛ-МУЛК СОЛИГИНИ ХУКУКИЙ ТАРТИБГА СОЛИШ', 1, 3, 'МОЛ-МУЛК СОЛИГИНИ ХУКУКИЙ ТАРТИБГА СОЛИШ.docx', '2020-11-15 09:57:09', '2020-11-15 09:57:09'),
(437, 174, 2, 'ЭКСПЕРИМЕНТ ЎТКАЗИШНИНГ ЎЗИГА ХОС ЖИҲАТЛАРИ', 1, 4, 'ЭКСПЕРИМЕНТ ЎТКАЗИШНИНГ ЎЗИГА ХОС ЖИҲАТЛАРИ.docx', '2020-11-15 10:01:16', '2020-11-15 10:01:16'),
(438, 195, 2, 'Тараққиётнинг муҳим омили мавзусида', 2, 5, 'Калкон макола №8 2020 йил.doc', '2020-11-16 06:06:59', '2020-11-16 06:06:59'),
(439, 195, 2, 'Бобокалонимиз Амир Темур давридаги солиқ сиёсати', 2, 5, 'Низомий  макола 2020 йил.doc', '2020-11-16 06:16:01', '2020-11-16 06:16:01'),
(440, 195, 2, 'Буюк саркарда тутган сиёсат', 2, 5, 'Калкон макола №4 2013 йил.doc', '2020-11-16 06:18:29', '2020-11-16 06:18:29'),
(441, 195, 2, 'Буюк саркарда тутган сиёсат', 2, 5, 'Адолат макола №16 2011 йил.doc', '2020-11-16 06:22:25', '2020-11-16 06:22:25'),
(442, 195, 2, 'Духовность и обновление общества мавзусида', 2, 5, 'На посту макола №9 2014 йил.doc', '2020-11-16 06:26:20', '2020-11-16 06:26:20'),
(443, 195, 1, 'Мамлкатимизда қулай инвестицион муҳитнинг иқтисодий тараққиёт омили эканлиги', 2, 3, 'Ахборотнома макола  2015 йил.doc', '2020-11-16 06:29:12', '2020-11-16 06:29:12'),
(444, 111, 2, 'Возвышение науки в произведениях Навои', 1, 5, '5 (4205).pdf', '2020-11-16 07:13:05', '2020-11-16 07:13:05'),
(445, 111, 2, 'Бола ҳуқуқларини кафолатлаш', 1, 5, '21 (21.05.2016).pdf', '2020-11-16 07:15:01', '2020-11-16 07:15:01'),
(446, 111, 2, 'Навоий асарларида илмнинг улуғланиши', 1, 5, '5 (4209).pdf', '2020-11-16 07:16:11', '2020-11-16 07:16:11'),
(447, 111, 2, 'Воспевание Родины в творчестве Эркина Вахидова', 1, 5, '9 (4209).pdf', '2020-11-16 07:16:58', '2020-11-16 07:16:58'),
(448, 111, 2, 'Эркин Вох,идов ижодида Ватан мадх,и', 1, 5, '9 (4213).pdf', '2020-11-16 07:17:49', '2020-11-16 07:17:49'),
(449, 111, 2, 'Жизнь и творчество Саида Ахмада', 1, 5, '17 (4217).pdf', '2020-11-16 07:34:03', '2020-11-16 07:34:03'),
(450, 111, 2, 'ВОСПЕВАНИЕ РОДИНЫ В СТИХАХ АБДУЛЛЫ ОРИПОВА', 1, 5, '30 (4230).pdf', '2020-11-16 07:34:56', '2020-11-16 07:34:56'),
(451, 111, 2, 'Академия фахри', 1, 5, 'Qalqon.pdf', '2020-11-16 07:35:59', '2020-11-16 07:35:59'),
(452, 111, 2, 'ТОСКА ПО РОДИНЕ В ПРОИЗВЕДЕНИЯХ (МХИРИДДИНА МУХАММАДА БАБУРА', 1, 5, '5 (4309).pdf', '2020-11-16 07:37:00', '2020-11-16 07:37:00'),
(453, 111, 2, 'Вайронакор ғояларнинг салбий оқибатлари', 1, 5, '11 (4267).pdf', '2020-11-16 07:39:08', '2020-11-16 07:39:08'),
(454, 111, 2, 'УТКИР Х,ОШИМОВ ИЖОДИДА ИНСОНИЙЛИК МУНОСАБАТЛАРИ', 1, 5, '16 (4272).pdf', '2020-11-16 07:39:50', '2020-11-16 07:39:50'),
(455, 111, 2, 'ПОЭТ-ПРОСВЕТИТЕЛЬ ИСХОКХОН ИБРАТ', 1, 5, '33 (4285).pdf', '2020-11-16 07:40:37', '2020-11-16 07:40:37'),
(456, 111, 2, 'СЛУЖЕНИЕ РОДИНЕ - ВЫСШЕЕ БЛАГО И ЧЕСТЬ', 1, 5, '42 (4294).pdf', '2020-11-16 07:41:17', '2020-11-16 07:41:17'),
(457, 111, 2, 'Шарқона ва Ғарбона демократия', 1, 5, '42 (4298).pdf', '2020-11-16 07:42:25', '2020-11-16 07:42:25'),
(458, 111, 2, 'ВАТАНГА ХИЗМАТ - ОЛИЙ САОДАТ', 1, 5, '56 (4312).pdf', '2020-11-16 07:43:52', '2020-11-16 07:43:52'),
(459, 111, 2, 'ЖАМИЯТНИНГ ДУРУ ГАВҲАРИ', 1, 5, 'Qalqon-2016.pdf', '2020-11-16 07:47:23', '2020-11-16 07:47:23'),
(460, 111, 2, 'Билимли ва салоҳиятли кадрлар - тараққиётга қанот', 1, 5, 'Qalqon-2018.pdf', '2020-11-16 07:48:47', '2020-11-16 07:48:47'),
(461, 65, 2, 'Тараққиётнинг муҳим омили', 2, 5, '3.4-шакл-илмий ишлар руйхати.doc', '2020-11-16 09:40:44', '2020-11-16 09:40:44'),
(462, 104, 1, '\"Оммавий маданият\" тушунчаси билан боғлиқ бази мулохазалар', 1, 3, 'IMG_20201103_204101.jpg', '2020-11-18 06:49:21', '2020-11-18 06:49:21'),
(1198, 104, 2, 'Ўзбек миллий менталитети', 1, 5, 'IMG_20210103_095723_1.jpg', '2021-01-04 04:52:23', '2021-01-04 04:52:23'),
(464, 104, 1, 'Ўзбекистон маданиятида маргиналлик ва унинг хусусиятлари', 1, 3, 'IMG_20201103_204411.jpg', '2020-11-18 07:32:35', '2020-11-18 07:32:35'),
(1197, 104, 2, 'Ўзбекистон Республикаси конституциясида миллий қадриятларнинг акс эттирилиши', 1, 5, 'IMG_20210103_095529.jpg', '2021-01-04 04:45:46', '2021-01-04 04:45:46'),
(466, 104, 2, 'Культурные учреждения села как составная часть социальной сферы социалистического общества', 1, 5, 'IMG_20201103_204633.jpg', '2020-11-19 06:27:56', '2020-11-19 06:27:56'),
(1196, 104, 2, 'Зардуштийлик динини ўрганишда тарихий манбаларнинг аҳамияти', 1, 5, 'IMG_20210103_095448_1.jpg', '2021-01-04 04:43:07', '2021-01-04 04:43:07'),
(469, 104, 1, 'Ўзбекистон маданиятида маргиналлик ва унинг хусусиятлари', 1, 3, 'IMG_20201103_204411.jpg', '2020-11-19 06:37:09', '2020-11-19 06:37:09'),
(470, 104, 1, '\"Оммавий маданият\" тушунчаси билан боғлиқ баъзи мулоҳазалар', 1, 3, 'IMG_20201103_204101.jpg', '2020-11-19 06:39:46', '2020-11-19 06:39:46'),
(471, 104, 2, 'Бозор иқтисодиёти ва миллий қадриятлар', 1, 5, 'IMG_20201118_103801_1.jpg', '2020-11-19 06:50:49', '2020-11-19 06:50:49'),
(1195, 104, 2, 'Оммавий маданият моҳияти', 1, 5, 'IMG_20210103_095344_1.jpg', '2021-01-04 04:39:31', '2021-01-04 04:39:31'),
(1194, 104, 2, 'Жамият маънавий ҳаётида диннинг ўрни ва аҳамияти', 1, 5, 'IMG_20210103_095155.jpg', '2021-01-04 04:37:20', '2021-01-04 04:37:20'),
(1192, 104, 2, 'Военное искусство Амира Тимура', 1, 5, '248211682_260579.jpg', '2021-01-04 04:28:47', '2021-01-04 04:28:47'),
(1193, 104, 2, 'Ўзбек хонликларида ватанпарварлик туйғуси ва унинг ўзига хос хусусиятлари', 1, 5, 'IMG_20210103_094922_1.jpg', '2021-01-04 04:33:37', '2021-01-04 04:33:37'),
(476, 153, 1, 'APPLICATION OF ADMINISTRATIVE RESPONSIBILITY FOR OFFENSES IN THE FIELD OF TRAFFIC', 1, 2, '3.pdf', '2020-11-19 12:19:42', '2020-11-19 12:19:42'),
(477, 174, 1, 'ЖПда ИСБОТ КИЛИШ ТУШУНЧАСИ ТАХЛИЛИ', 1, 3, 'ЖПда ИСБОТ КИЛИШ ТУШУНЧАСИ ТАХЛИЛИ.docx', '2020-11-20 03:44:56', '2020-11-20 03:44:56'),
(478, 174, 1, 'Маҳсулот етказиб бериш шартномасининг объекти сифатида товарларнинг хусусиятлари', 2, 3, 'МАКОЛА РАЖАБОВ.docx', '2020-11-20 03:51:44', '2020-11-20 03:51:44'),
(479, 174, 1, 'гувоҳлантиришнинг механизмини такомиллаштиришга оид фикр ва мулоҳазалар', 1, 3, 'МАКОЛА РАЖАБОВ.docx', '2020-11-20 04:28:50', '2020-11-20 04:28:50'),
(480, 174, 2, 'гувоҳлантириш тергов ҳаракати ўтказишда вояга етмаганлар ҳуқуқларини ҳимоя қилиш', 2, 5, 'МАКОЛА РАЖАБОВ.docx', '2020-11-20 04:33:37', '2020-11-20 04:33:37'),
(481, 174, 2, 'Гувоҳлантиришда шахс ҳуқуқларини таъминлаш масалалари', 1, 5, 'МАКОЛА РАЖАБОВ.docx', '2020-11-20 04:36:45', '2020-11-20 04:36:45'),
(482, 52, 1, 'Реформы в системе профилактики правнарушений, их результаты и перспективы', 0, 2, '375.pdf', '2020-11-20 05:20:50', '2020-11-20 05:20:50'),
(483, 204, 2, 'Вояга етмаганлар ўртасида назоратсизлик ва ҳуқуқбузарликлар профилактикасида тарбиянинг роли', 1, 5, '2_5447400179357452269.pdf', '2020-11-20 05:33:45', '2020-11-20 05:33:45'),
(484, 204, 2, 'Гиёҳвандлик воситалари ёки психотроп маддалар билан қонунга хилоф равишда муомала қилишдан иборат жиноятларнинг олдини олиш тўғрисида айрим мулоҳазалар', 1, 5, 'rayimov.pdf', '2020-11-20 05:49:04', '2020-11-20 05:49:04'),
(485, 111, 1, 'КОРРУПЦИЯГА ҚАРШИ КУРАШИШДА МАЪНАВИЙ ТАРБИЯНИНГ ЎРНИ', 1, 3, 'КОРРУПЦИЯГА ҚАРШИ КУРАШИШДА МАЪНАВИЙ.pdf', '2020-11-20 06:07:14', '2020-11-20 06:07:14'),
(486, 157, 1, 'The conception and types of responsibility on non-execution of procedural duties', 1, 2, 'DT.pdf', '2020-11-20 12:34:02', '2020-11-20 12:34:02'),
(487, 153, 1, 'Административные правонарушения, посягающие на безопасность дорожного движения', 2, 3, '2.pdf', '2020-11-21 04:42:52', '2020-11-21 04:42:52'),
(488, 153, 2, 'Вопросы применения административной ответственности водителей транспортных средств в состоянии опьянения', 0, 4, '5.pdf', '2020-11-21 04:48:28', '2020-11-21 04:48:28'),
(489, 153, 2, 'Административные правонарушения, посягающие на безопасность дорожного движения', 2, 4, '2.pdf', '2020-11-21 04:50:19', '2020-11-21 04:50:19'),
(490, 153, 2, 'Обеспечение правовой защиты при применении административного принуждения в области безопасности дорожного движения', 1, 5, '6.pdf', '2020-11-21 05:05:30', '2020-11-21 05:05:30'),
(491, 174, 1, 'The mechanism for ensuring compliance with the general conditions of evidenceand problems related with it', 1, 1, 'МАКОЛА РАЖАБОВ.docx', '2020-11-23 09:48:46', '2020-11-23 09:48:46'),
(492, 174, 1, 'Жиноят процессида далилларга баҳо бериш масалалари', 1, 3, 'МАКОЛА РАЖАБОВ.docx', '2020-11-23 09:52:08', '2020-11-23 09:52:08'),
(493, 213, 2, 'жиноят мотиви ва мақсадининг қилмишни квалификация қилишдаги аҳамияти', 1, 5, 'Новый документ 2020-02-14 16.20.38_4.jpg', '2020-11-24 05:25:09', '2020-11-24 05:25:09'),
(494, 213, 2, 'жиноят мотиви ва мақсадининг қилмишни квалификация қилишдаги аҳамияти', 1, 6, 'Новый документ 2020-02-14 16.20.38_4.jpg', '2020-11-24 05:30:07', '2020-11-24 05:30:07'),
(495, 213, 2, 'Ўғрилик жиноятига қарши курашни такомиллаштириш масалалари. Хорижий мамлакатлар тажрибаси', 1, 6, 'Новый документ 2020-02-14 16.25.17_3.jpg', '2020-11-24 05:37:02', '2020-11-24 05:37:02'),
(496, 213, 2, 'ЖИНОИЙ-ҲУҚУҚИЙ НОРМАЛАР РАҚОБАТИДА ЖИНОЯТЛАРНИ КВАЛИФИКАЦИЯ ҚИЛИШНИНГ ҚОИДАЛАРИ', 1, 5, 'илмий мақола.docx', '2020-11-24 06:15:36', '2020-11-24 06:15:36'),
(497, 213, 2, 'Жиноятларни умумий ва махсус нормалар рақобати мавжудлигида квалификация қилишнинг ўзига хос хусусиятлари', 1, 5, 'илмий мақола.docx', '2020-11-24 06:26:13', '2020-11-24 06:26:13'),
(498, 213, 2, 'Тадбиркорлик фаолиятига тўсқинлик қилиш ва қонунга хилоф равишда аралашиш билан боғлиқ жиноятлар учун жавобгарлик асослари.', 1, 5, 'ДАДАЖОНОВ МАКОЛА ТАДБИРКОРЛИК.docx', '2020-11-24 07:07:21', '2020-11-24 07:07:21'),
(499, 213, 2, 'Порахўрлик - коррупциянинг негизи', 1, 6, 'ДАДАЖОНОВ МАКОЛА ПОРАХУРЛИК.docx', '2020-11-24 07:09:22', '2020-11-24 07:09:22'),
(500, 213, 1, 'ЖИНОИЙ-ҲУҚУҚИЙ НОРМАЛАР РАҚОБАТИДА ЖИНОЯТЛАРНИ КВАЛИФИКАЦИЯ ҚИЛИШНИНГЎЗИГА ХОС ХУСУСИЯТЛАРИ ВА ҚОИДАЛАРИ', 1, 3, 'макола нормалар ракобати Ўз.А.docx', '2020-11-24 07:17:02', '2020-11-24 07:17:02'),
(501, 215, 1, 'EVOLUTION OF THE CONCEPT \"SUSTAINABLE DEVELOPMENT\"', 1, 1, 'Full-Paper-EVOLUTION-OF-THE-CONCEPT-SUSTAINABLE-DEVELOPMENT.pdf', '2020-11-24 07:56:08', '2020-11-24 07:56:08'),
(502, 216, 1, 'Ўспиринлик ёшидаги болаларнинг жисмоний фаоллигини оширишнинг психологик хусусиятлари', 1, 3, '5.Мактаб ва Ҳаёт 2020 й.pdf', '2020-11-24 07:58:17', '2020-11-24 07:58:17'),
(503, 215, 2, 'Место органов внутренних дел в механизме обеспечения правопорядка в Республике Узбекистан', 2, 8, 'Сборник_заочной_конференции_20_06.pdf', '2020-11-24 08:01:45', '2020-11-24 08:01:45'),
(504, 216, 1, 'Ўқувчиларда касбга нисбатан қизиқишни вужудга келтириш, қизиқишнинг бази бир психологик муаммолари', 0, 3, '2.УзМУ 02.08.2018.pdf', '2020-11-24 08:02:52', '2020-11-24 08:02:52'),
(505, 215, 1, 'Xalq ishonchi - fuqarolik jamiyati rivojlanishining muhim omili', 1, 3, 'Axborotnoma-2019-3.pdf', '2020-11-24 08:07:24', '2020-11-24 08:07:24'),
(506, 216, 1, 'Психологияда шахс тушунчаси, шахснинг тузилиши', 1, 3, '2.УзМУ 02.08.2018.pdf', '2020-11-24 08:11:25', '2020-11-24 08:11:25'),
(507, 219, 1, 'Уюшмаган ёшлар µуіуібузарликлари профилактикасининг асосий  йґналишлари', 2, 3, 'Axborotnoma-2019-3.pdf', '2020-11-24 11:38:46', '2020-11-24 11:38:46'),
(508, 219, 2, 'concert and content of \"unorganized youths\"', 1, 4, 'Халқаро мақола сканери 3.jpg', '2020-11-24 11:41:40', '2020-11-24 11:41:40'),
(509, 219, 2, 'Перспективы совершенствования организационной основы профилактики правонарушений среди неорганизованной молодежи', 1, 4, 'photo_2020-03-12_14-21-32.jpg', '2020-11-24 11:44:50', '2020-11-24 11:44:50'),
(510, 219, 1, 'ёшлар ўртасида ҳуқуқбузарликлар профилактикаси бўйича АҚШ ва Германия тажрибаси таҳлили', 1, 3, 'Новый документ 2019-12-06 10.40.58_3.jpg', '2020-11-24 11:52:35', '2020-11-24 11:52:35'),
(511, 219, 2, 'мамлакатимизда ҳуқуқий онг ва ҳуқуқий маданиятни юксалтириш тизимининг тубдан такомиллаштириш', 2, 4, 'Сертификат қозоқ 05.11.2020..jpg', '2020-11-24 11:59:40', '2020-11-24 11:59:40'),
(512, 219, 2, 'Вояга етмаганлар ўртасида назоратсизлик ва ҳуқуқбузарликлар профилактикасини ташкил этиш ва амалга оширишнинг муаммолари', 0, 4, 'Сертификати.jpg', '2020-11-24 12:00:38', '2020-11-24 12:00:38'),
(513, 219, 1, 'Ҳуқуқбузарликлар профилактикасида «уюшмаган ёшлар» тушунчасининг назарий-ҳуқуқий таҳлили', 1, 3, 'сканирование0034.jpg', '2020-11-24 12:03:07', '2020-11-24 12:03:07'),
(514, 219, 2, 'Профилактика инспекторининг маъмурий юрисдикциявий фаолиятининг ўзига хос хусусиятлари', 1, 5, 'сканирование0024.jpg', '2020-11-24 12:04:59', '2020-11-24 12:04:59'),
(515, 219, 1, 'Ёшлар ўртасида ҳуқуқбузарликлар профилактикасини такомиллаштириш йўллари', 1, 3, 'сканирование0068.jpg', '2020-11-24 12:06:43', '2020-11-24 12:06:43'),
(516, 219, 2, 'HE ROLE OF SCIENCE AND EDUCATION IN THE EDUCATION OF YOUNG PEOPLE', 1, 4, 'Сертификати.jpg', '2020-11-24 12:09:54', '2020-11-24 12:09:54'),
(517, 219, 1, 'Уюшмаган ёшлар ўртасидаги ҳуқуқбузарликлар профилактикасининг ташкилий асосларини такомиллаштириш истиқболлари', 1, 3, 'Снимок1.PNG', '2020-11-24 12:16:40', '2020-11-24 12:16:40'),
(518, 219, 1, 'ҲУҚУҚБУЗАРЛИКЛАР ПРОФИЛАКТИКАСИ ФАОЛИЯТИНИ БАҲОЛАШ МЕЪЗОНЛАРИ ТАҲЛИЛИ', 1, 3, 'ҳуқуқбузарликлар.jpg', '2020-11-24 12:25:45', '2020-11-24 12:25:45'),
(519, 219, 1, 'ОИЛА ТУРМУШ МУНОСАБАТЛАРИ ДОИРАСИДАГИ ЖИНОЯТЛАРДАН ЖАБРЛАНИШНИНГ САБАБЛАРИ ВА ШАРТ-ШАРОИТЛАРИНИНГ АЙРИМ МАСАЛАЛАРИ', 2, 3, 'оила.jpg', '2020-11-24 12:27:12', '2020-11-24 12:27:12'),
(520, 215, 1, 'Yoshlarga oid islohotlar - barqaror taraqqiyotga erishishning muhim sharti', 1, 3, 'макола тадкикот.pdf', '2020-11-25 08:16:54', '2020-11-25 08:16:54'),
(521, 222, 1, 'Socio-Psychological Causes of Juvenile Delinquency and its Prophylaxis', 2, 1, 'макола скопс Умирзаков Б.А..pdf', '2020-11-25 11:51:13', '2020-11-25 11:51:13'),
(522, 171, 2, 'Коррупция ва унга қарши курашнинг долзарб масалалари.', 2, 5, '3.jpg', '2020-11-26 04:05:52', '2020-11-26 04:05:52'),
(523, 171, 2, 'Илгари судланган шахслар ўртасида ҳуқуқбузарликларнинг махсус профилактикасини амалга ошириш фаолиятининг ўзига хос хусусиятлари', 1, 5, 'Т.Мақола 1.pdf', '2020-11-26 04:12:45', '2020-11-26 04:12:45'),
(524, 171, 2, 'Ҳуқуқбузарликларнинг якка тартибдаги профилактикасида шахсни мажбурий даволанишга юбориш масаласи', 1, 5, 'Т.Мақола 2.pdf', '2020-11-26 04:15:35', '2020-11-26 04:15:35'),
(525, 171, 2, 'Ўзини ўзи ўлдириш даражасига етказиш жиноятининг тавсифи ҳақида айрим мулоҳазалар', 1, 5, '2-мақола.pdf', '2020-11-26 04:19:31', '2020-11-26 04:19:31'),
(526, 171, 1, 'Фирибгарлик жиноятининг сабаб ва шароитлари ҳамда унинг профилактикаси', 1, 3, 'huquq-2019-04.pdf', '2020-11-26 04:20:59', '2020-11-26 04:20:59'),
(527, 171, 1, 'Фирибгарлик жиноятининг тушунчаси, таркиби ва унинг фуқаролик-ҳуқуқий муносабатлардан фарқи.', 1, 2, 'қозоқ мақола.pdf', '2020-11-26 04:51:20', '2020-11-26 04:51:20'),
(528, 222, 1, 'Криминологическая характеристика и профилактика преступности несовершеннолетних в Республике Узбекистан', 2, 2, 'Барнаул макола 2019.pdf', '2020-11-26 04:52:00', '2020-11-26 04:52:00'),
(529, 222, 1, 'Ўзбекистонда вояга етмаганлар жиноятчилигининг профилактикасини ташкил этишнинг айрим жиҳатлари', 1, 2, 'Козогистон макола гувохнома Умирзаков.pdf', '2020-11-26 04:54:11', '2020-11-26 04:54:11'),
(530, 171, 2, '-	Нотинч оилаларда содир этиладиган ҳуқуқбузарликларнинг олдини олишда психологик билимларнинг аҳамияти.', 2, 5, 'Аброр.jpg', '2020-11-26 05:01:25', '2020-11-26 05:01:25'),
(531, 212, 1, 'Korrupsiyaga undovchi omillarning ilmiy-nazariy talqini', 1, 3, 'SHR_2020-11-26 10_04_44-D__Davron_2 Академия_2019. 4-со.png', '2020-11-26 05:02:35', '2020-11-26 05:02:35'),
(532, 212, 1, 'Гордость и таланты Академии', 1, 3, 'SHR_2020-11-26 10_06_48-D__MUHARRIRLA_8. Axborotnoma_20.png', '2020-11-26 05:04:20', '2020-11-26 05:04:20'),
(533, 171, 2, 'Профилактика инспекторининг шахсни мажбурий даволанишга юбориш фаолияти', 1, 5, '7777.pdf', '2020-11-26 05:42:45', '2020-11-26 05:42:45'),
(534, 171, 2, 'Суд органларининг профилактик фаолияти ва жиноятларни олдини олиш тизимидаги ўрни ҳақида айрим мулоҳазалар', 1, 5, '888.pdf', '2020-11-26 05:58:09', '2020-11-26 05:58:09'),
(535, 171, 2, 'Фирибгарлик жиноятларининиг сабаб ва шароитлари ҳамда уларнинг олдини олиш чоралари', 2, 5, '999.pdf', '2020-11-26 05:58:40', '2020-11-26 05:58:40'),
(536, 52, 1, 'O\'zbekiston Respublikasi Saylov tizimining xususiyatlari', 1, 3, 'Янги.pdf', '2020-11-26 06:35:31', '2020-11-26 06:35:31'),
(537, 215, 1, 'Barqaror taraqqiyotni ta’minlashda yoshlarning ahamiyati', 1, 7, 'Наманган_туплами.pdf', '2020-11-26 08:59:51', '2020-11-26 08:59:51'),
(538, 215, 1, 'Barqaror taraqqiyotni ta’minlashda yoshlarning o’rni bilan bog’liq konseptual yondashuvlar', 1, 7, 'ИГФ-конференция.pdf', '2020-11-26 09:30:10', '2020-11-26 09:30:10'),
(539, 215, 1, 'Yoshlar ijodiy tafakkurining muammolari', 1, 7, 'Maqolalar-toplami ДБА.pdf', '2020-11-26 09:40:01', '2020-11-26 09:40:01'),
(540, 215, 1, 'Yoshlar tarbiyasi – barqaror taraqqiyot poydevori', 1, 7, 'ТДПУ 2020 1.pdf', '2020-11-26 09:58:30', '2020-11-26 09:58:30'),
(541, 153, 1, 'DAVLAT YO\'L NARAKATI [OVFSIZLIGI XIZMATI FAOLIYATYINING HUQUQIY ASOSLARI', 1, 3, 'макола 11.pdf', '2020-11-26 11:06:52', '2020-11-26 11:06:52'),
(542, 153, 1, 'Application of administrative responsibility for traffic offenses', 1, 2, 'индия 14.pdf', '2020-11-26 11:19:50', '2020-11-26 11:19:50'),
(994, 289, 1, 'Маъмурий назорат тўғрисидаги қонун нормаларини такомиллаштириш', 1, 3, 'автореф.№4..pdf', '2020-12-15 06:49:07', '2020-12-15 06:49:07'),
(993, 289, 1, 'Конституциявий норма  ҳуқуқбузарликлар профи¬лактикасида фуқароларнинг иштирокининг ҳуқуқий асоси', 1, 3, 'автореф.№3..pdf', '2020-12-15 06:48:06', '2020-12-15 06:48:06'),
(992, 289, 1, 'Ensuring interaction in the field of victimological prevention in Uzbekistan', 1, 2, 'автореф.№1..pdf', '2020-12-15 06:43:31', '2020-12-15 06:43:31'),
(991, 233, 1, 'ЮҚОРИ МАЛАКАЛИ ФУТБОЛЧИЛАРНИ ТЕХНИК-ТАКТИК ХАРАКАТЛАРИ', 1, 3, 'акмал макола.pdf', '2020-12-14 13:15:51', '2020-12-14 13:15:51'),
(989, 288, 1, 'Филология, таржимашунослик', 1, 3, 'combinepdf (3).pdf', '2020-12-14 11:21:41', '2020-12-14 11:21:41'),
(990, 288, 1, 'Филология, таржимашунослик', 1, 7, 'combinepdf (5).pdf', '2020-12-14 11:22:11', '2020-12-14 11:22:11'),
(961, 73, 2, 'Перспективы внедрения концепции TQM (Total Quality Management) в высших учебных заведениях Узбекистана', 1, 4, 'tosh xalqaro.pdf', '2020-12-14 08:35:18', '2020-12-14 08:35:18'),
(549, 226, 1, 'Criminal law and criminological measuresto combat crimes in the fields of information technology and security', 2, 2, 'сканирование0031.pdf', '2020-11-30 07:30:35', '2020-11-30 07:30:35'),
(550, 226, 2, 'Влияния интернета на поведение и интеллектуальное развитие молодёжи', 2, 4, 'баку.pdf', '2020-11-30 07:36:25', '2020-11-30 07:36:25'),
(551, 226, 1, 'Противодействие преступлениям в сфере информационных технологий и безопасности в Республике Узбекистан на современном этапе', 1, 2, 'Прот прест в сфере инф тех и без  РУЗ Журнал юрид исслед. 2019 г.pdf', '2020-11-30 07:40:23', '2020-11-30 07:40:23'),
(552, 226, 1, 'Уголовно-правовые и криминологические меры борьбы   с преступлениями в сфере информационных   технологий и безопасности', 2, 2, 'минск.pdf', '2020-11-30 08:45:40', '2020-11-30 08:45:40'),
(553, 226, 1, 'LEGAL PROVISION OF INFORMATION SECURITY  AS AN INTEGRAL FACTOR IN THE CONTEXT OF  A PANDEMIC', 2, 2, 'Расулев Собиров Саъдуллаев Article Text-862-1-10-20200630.pdf', '2020-11-30 08:47:17', '2020-11-30 08:47:17'),
(554, 226, 1, 'ÏÐÎÒÈÂÎÄÅÉÑÒÂÈÅ ÊÈÁÅÐÏÐÅÑÒÓÏÍÎÑÒÈ: ÑÎÂÐÅÌÅÍÍÛÅ ÏÎÄÕÎÄÛ ÏÎ ÏÎÄÃÎÒÎÂÊÅ ÊÀÄÐÎÂ', 1, 3, 'вестник юриста.pdf', '2020-11-30 08:51:11', '2020-11-30 08:51:11'),
(555, 226, 1, 'ИНТЕРНЕТ И БЕСКОНТРОЛЬНОСТЬ ПОЛЬЗОВАТЕЛЕЙ В УСЛОВИЯХ ПАНДЕМИИ', 1, 3, 'Одил судлов Инт и бесконтр в условиях пандемии 2020.pdf', '2020-11-30 08:52:53', '2020-11-30 08:52:53'),
(556, 226, 1, 'Противодействие экстремизму в сети Интернет в Республике Узбекистан', 1, 3, 'Прот экстремизму хукукий тадкикотлар -2020-son-SI-3-qism.pdf', '2020-11-30 08:57:42', '2020-11-30 08:57:42'),
(557, 226, 1, 'Общая характеристика и свойства цифровых доказательств', 2, 3, 'Адвокат.pdf', '2020-11-30 09:02:50', '2020-11-30 09:02:50'),
(558, 226, 1, 'ИНФОРМАЦИОННАЯ БЕЗОПАСНОСТЬ В  УСЛОВИЯХ ПАНДЕМИИ КОРОНАВИРУСА', 1, 3, 'юридик фанлар ахборотномаси.pdf', '2020-11-30 09:06:03', '2020-11-30 09:06:03'),
(559, 226, 2, 'Взаимодействие органов внутренних дел с народом - важный фактор доверия и эффективности', 1, 4, 'сканирование0017.jpg', '2020-11-30 09:08:39', '2020-11-30 09:08:39'),
(560, 104, 1, 'Мирзо Улағбекнинг давлат бошқарувидаги қарашлари', 1, 3, 'IMG_20201103_204202_1.jpg', '2020-11-30 10:21:42', '2020-11-30 10:21:42'),
(1191, 104, 2, 'Военное искусство Амира Тимура', 1, 5, '248211682_260579.jpg', '2021-01-04 04:27:28', '2021-01-04 04:27:28'),
(562, 104, 2, 'Без исторической памяти нет будушего', 1, 5, 'IMG_20201106_083351.jpg', '2020-11-30 10:34:37', '2020-11-30 10:34:37'),
(563, 104, 2, 'Уроки нравственного воспитания в произведениях Абдурахмана Джами', 2, 5, 'IMG_20201106_083418_1.jpg', '2020-11-30 10:39:54', '2020-11-30 10:39:54'),
(564, 104, 2, 'Духовное наследие и национальное самосознание', 1, 5, 'IMG_20201106_083511_1.jpg', '2020-11-30 10:42:43', '2020-11-30 10:42:43'),
(565, 104, 2, 'Воспевание Родинқ в творчестве Захириддин Мухаммад Бабура', 1, 5, 'IMG_20201106_083537_1.jpg', '2020-11-30 10:45:28', '2020-11-30 10:45:28'),
(566, 104, 2, 'Исламские ценности и исламская культура', 1, 5, 'IMG_20201106_083642_1.jpg', '2020-11-30 10:49:11', '2020-11-30 10:49:11'),
(567, 104, 2, 'Учение Бахауддина Накшбанда', 1, 5, 'IMG_20201106_083659.jpg', '2020-11-30 10:51:31', '2020-11-30 10:51:31'),
(568, 104, 2, 'Садовник жизни служитель жизни', 1, 5, 'IMG_20201106_083727.jpg', '2020-11-30 10:53:37', '2020-11-30 10:53:37'),
(569, 104, 2, 'Духовность - приоритетное направление государственной политики', 2, 5, 'IMG_20201106_083840_1.jpg', '2020-11-30 10:56:14', '2020-11-30 10:56:14'),
(570, 104, 2, 'Верность Родине вқсшее проявление преданности', 1, 5, 'IMG_20201106_152906_1.jpg', '2020-11-30 10:59:11', '2020-11-30 10:59:11'),
(571, 104, 2, 'Основнқе качества руководителя и их взаимосвязь с эффективностью решения руководяўих задач', 1, 5, 'IMG_20201106_153025_1.jpg', '2020-11-30 11:02:09', '2020-11-30 11:02:09'),
(572, 104, 2, 'Искусство управления в \"Уложениях\" Амира Темура', 1, 5, 'IMG_20201106_153110_1.jpg', '2020-11-30 11:04:40', '2020-11-30 11:04:40'),
(573, 104, 2, 'Новый Узбекистан новая система образования', 1, 5, 'IMG_20201106_153141_1.jpg', '2020-11-30 11:08:22', '2020-11-30 11:08:22'),
(574, 104, 2, 'Страна воспитавшая великих гениев', 1, 5, 'IMG_20201112_121640_1.jpg', '2020-11-30 11:12:58', '2020-11-30 11:12:58'),
(575, 104, 2, 'Страна воспитавшая великих гениев', 1, 5, 'IMG_20201112_121640_1.jpg', '2020-11-30 11:14:49', '2020-11-30 11:14:49'),
(576, 172, 2, 'Terroristik harakatlar sodir bo\'lgan joyni ko\'zdan kechirish va tekshirishda e\'tibor beriladigan holatlar', 1, 4, '4-Терроризм мақола халкаро.docx', '2020-11-30 13:03:44', '2020-11-30 13:03:44'),
(577, 110, 1, 'Эркин иқтисодий ҳудудларга ҳорижий инвестиция жалб килишда иқтисодий сиёсат асослари', 1, 1, 'макола 4 инновация.pdf', '2020-12-01 05:16:49', '2020-12-01 05:16:49'),
(578, 110, 1, 'Принципы создания и функционирования свободных экономических зон', 1, 3, 'макола 5 молия.pdf', '2020-12-01 05:28:41', '2020-12-01 05:28:41'),
(579, 110, 1, 'Характерные черты и классификация свободных экономических зон', 1, 3, 'макола 6 молия.pdf', '2020-12-01 05:30:52', '2020-12-01 05:30:52'),
(580, 110, 2, 'Особенности деятельности органов внутренних дел в условиях свободных экономических зон', 1, 6, 'макола1 академия.pdf', '2020-12-01 05:35:15', '2020-12-01 05:35:15'),
(581, 110, 2, 'Эркин иқтисодий ҳудудларнинг мохияти ва ташкил килишнинг асосий сабаблари', 1, 5, 'тезис 1 тдиу.pdf', '2020-12-01 05:40:03', '2020-12-01 05:40:03'),
(582, 91, 2, 'Monitoring the activities of business entities', 2, 4, 'Халкаро макола С.М.Селиманова 2020.pdf', '2020-12-01 06:41:04', '2020-12-01 06:41:04'),
(583, 91, 2, 'Совершенствование административного судопроизводства', 1, 5, 'Селиманова.pdf', '2020-12-01 07:16:05', '2020-12-01 07:16:05'),
(584, 91, 2, 'Особенности подготовки сотрудников органов внутренних дел к охране общественного порядка', 2, 5, 'Селиманова Ахмедова.pdf', '2020-12-01 07:19:00', '2020-12-01 07:19:00'),
(585, 91, 2, 'Противодействие коррупции - актуальная задача административных реформ в Республике Узбекистан', 1, 5, 'селиманова 1.pdf', '2020-12-01 07:21:38', '2020-12-01 07:21:38'),
(586, 92, 2, 'Коррупция қарши курашиш самарадорлигини ошириш хусусида фикрлар', 2, 5, 'CamScanner 17-10-2020 10.51.10.pdf', '2020-12-01 07:38:00', '2020-12-01 07:38:00'),
(587, 87, 2, 'Коррупция қарши курашиш самарадорлигини ошириш хусусида фикрлар', 2, 5, 'CamScanner 17-10-2020 10.51.10.pdf', '2020-12-01 07:39:53', '2020-12-01 07:39:53'),
(588, 110, 2, 'Цели и условия создания свободных экономических зон', 1, 5, 'Тезис 2 молия.pdf', '2020-12-01 12:51:52', '2020-12-01 12:51:52'),
(589, 110, 2, 'Конкурентные отношения в свободных экономических зонах', 0, 5, 'Тезис 3 ТДИУ.pdf', '2020-12-01 12:54:10', '2020-12-01 12:54:10'),
(590, 110, 2, 'Особенности развития конкуренции в свободных экономических зонах', 1, 5, 'тезис 4 ТДИУ.pdf', '2020-12-01 12:57:00', '2020-12-01 12:57:00'),
(591, 110, 2, 'TRANSPORT VOSITALARIDAN CHIQAYOTGAN ZAXARLI GAZLARNI ATROF-MUHITGA VA INSON SALOMATLIGIGA TA’SIRI', 2, 5, 'Тезис 5 акад.pdf', '2020-12-01 13:42:48', '2020-12-01 13:42:48'),
(592, 232, 1, 'Особенности тренировочного процесса со сборной командой по служебному биатлону в контексте совмещения легкоатлетической нагрузки со стрельбой из пистолета макарова', 2, 2, '-1362506880.pdf', '2020-12-02 05:25:26', '2020-12-02 05:25:26'),
(593, 110, 2, 'Психофизиологические особенности поведения на дороге ребенка дошкольного возраста', 2, 6, 'тезис 6 акад.pdf', '2020-12-02 05:43:28', '2020-12-02 05:43:28'),
(594, 110, 2, 'Психофизиологические особенности поведения на дороге младшего школьника', 2, 6, 'тезис 7 акад.pdf', '2020-12-02 05:45:39', '2020-12-02 05:45:39'),
(595, 110, 2, 'Охрана окружающей среды при проектировании автомобильных дорог', 2, 6, 'тезис 8 акад.pdf', '2020-12-02 05:48:06', '2020-12-02 05:48:06'),
(596, 110, 2, 'Инновационные технологии обустройства пешеходных переходов', 2, 6, 'тезис 9 акад.pdf', '2020-12-02 05:50:38', '2020-12-02 05:50:38'),
(597, 227, 1, 'Тошкентда «хавфсиз пойтахт» концепцияси асосида жамоат тартибини, ҳуқуқбузарликлар профилактикаси ва жиноятчиликка қарши курашишни таъминлашнинг янги тизими яратилмоқда', 1, 3, 'Axborotnoma-2018-03.pdf', '2020-12-02 12:04:24', '2020-12-02 12:04:24'),
(598, 240, 1, 'Ярашув институтининг ривожланиш босқичлари, бугунги ҳолати, такомиллаштириш истиқболлари.', 1, 3, 'МУНДАРИЖА 8-сон.pdf', '2020-12-02 12:32:36', '2020-12-02 12:32:36'),
(599, 240, 1, 'УГОЛОВНО-ПРАВОВОЙ АНАЛИЗ ОСВОБОЖДЕНИЯ ОТ ОТВЕТСТВЕННОСТИ В СВЯЗИ С ПРИМИРЕНИЕМ', 1, 2, 'Анализ освобождения.docx', '2020-12-02 12:41:58', '2020-12-02 12:41:58'),
(600, 240, 2, 'Ўзбекистон Республикаси жиноят ҳуқуқида ярашув институтининг ривожланиш босқичлари', 1, 5, '21 аср.docx', '2020-12-02 12:45:56', '2020-12-02 12:45:56'),
(601, 240, 1, 'ЯРАШИЛГАНЛИГИ МУНОСАБАТИ БИЛАН ЖИНОИЙ ЖАВОБГАРЛИКДАН ОЗОД ҚИЛИШ ИНСТИТУТИНИ ТАКОМИЛЛАШТИРИШ ИСТИҚБОЛЛАРИ', 1, 2, '25 йиллик.docx', '2020-12-02 12:51:10', '2020-12-02 12:51:10'),
(602, 240, 1, 'Совремменые тенденции развития уголовной политики Республики Узбекистан', 1, 3, '25 йиллик.docx', '2020-12-02 12:55:12', '2020-12-02 12:55:12'),
(603, 55, 2, 'Konstitusiya inson huquqlarini taʼminlovchi asosiy qonun', 1, 5, '1.jpg', '2020-12-02 13:06:38', '2020-12-02 13:06:38'),
(604, 55, 2, 'Maxsus subyektlar jinoiy javobgarligining oʼziga xos jihatlari', 1, 5, '2.doc', '2020-12-02 14:15:09', '2020-12-02 14:15:09'),
(605, 55, 2, 'Maxsus subyektlar jinoiy javobgarligining oʼziga xos jihatlari', 1, 5, '2.doc', '2020-12-02 14:15:27', '2020-12-02 14:15:27'),
(606, 55, 2, 'Значение элемента субъективной строньпреступленияхулиганства', 2, 4, '2-5-PB.pdf', '2020-12-02 14:23:18', '2020-12-02 14:23:18'),
(607, 99, 1, 'коррупцияга қарши ахлоқий фазилатларни ички ишлар органлари ходимларида шакллантиршнинг ўрни ва ахамияти', 2, 7, 'IMG_20201203_105538_573.jpg', '2020-12-03 05:57:25', '2020-12-03 05:57:25'),
(608, 109, 1, 'Malakali sportchilarni ish qobiliyatini aniqlash va tahlil qilish', 1, 7, 'Етмишбоев Мухтор.docx', '2020-12-03 06:27:16', '2020-12-03 06:27:16'),
(609, 109, 1, 'Sportchilarni tayyorlash, tanlab olish va yo\'naltirish mezonlari', 1, 7, 'Етмишбоев Мухторжон мақола.doc', '2020-12-03 06:33:19', '2020-12-03 06:33:19'),
(610, 66, 1, 'Психология рукопашника', 2, 3, 'психология рукопашника.pdf', '2020-12-03 07:49:29', '2020-12-03 07:49:29'),
(611, 66, 1, 'Совершенствование физической подготовки сотрудников ОВД', 1, 3, 'Совершенствование физической подготовки сотрудников ОВД.pdf', '2020-12-03 07:53:11', '2020-12-03 07:53:11'),
(612, 66, 1, 'О НЕОБХОДИМОСТИ СВОЕВРЕМЕННОГО ПРЕДУПРЕЖДЕНИЯ И ИСКОРЕНЕНИЯ НАРКОМАНИИ СРЕДИ МОЛОДЕЖИ', 1, 3, 'О НЕОБХОДИМОСТИ СВОЕВРЕМЕННОГО ПРЕДУПРЕЖДЕНИЯ И ИСКОРЕНЕНИЯ НАРКОМАНИИ СРЕДИ МОЛОДЕЖИ.pdf', '2020-12-03 07:55:53', '2020-12-03 07:55:53'),
(613, 66, 1, 'Формирование интереса к спорту у педагогически запущенных подростков', 1, 3, 'Scan-201203-0004.jpg', '2020-12-03 07:58:12', '2020-12-03 07:58:12'),
(614, 66, 1, 'Исследование методов совершенствования скоростной выносливости юных футболистов', 1, 3, 'Scan-201203-0001.jpg', '2020-12-03 08:00:27', '2020-12-03 08:00:27'),
(615, 222, 1, 'Вояга етмаганлар жиноятчилиги тушунчаси ва олдини олиш', 1, 3, '2-макола.pdf', '2020-12-03 13:01:19', '2020-12-03 13:01:19'),
(616, 222, 1, 'Вояга етмаганлар ва ота-оналар ҳуқуқларини ҳимоя қилишнинг конституциявий асослари', 1, 3, '3-макола.pdf', '2020-12-03 13:03:13', '2020-12-03 13:03:13'),
(617, 222, 1, 'Вояга етмаганлар жиноятчилигининг олдини олишнинг ўзига хос жиҳатлари', 1, 3, '4-макола.pdf', '2020-12-03 13:06:51', '2020-12-03 13:06:51'),
(618, 203, 1, 'Курсантларнинг саломатлигини сақлаш ва мустаҳкамлашда соғлом турмуш тарзининг ахамияти.', 2, 0, 'Мақола ВАК.PDF', '2020-12-03 13:46:28', '2020-12-03 13:46:28'),
(619, 203, 1, 'Курсантларнинг саломатлигини сақлаш ва мустаҳкамлашда соғлом турмуш тарзининг ахамияти.', 2, 3, 'Мақола ВАК.PDF', '2020-12-03 13:49:12', '2020-12-03 13:49:12'),
(620, 203, 2, 'Баркамол авлодни жисмоний тарбиялашда оила, мактаб ва махалла ҳамкорлиги.', 1, 5, 'Мақола 2 та.PDF', '2020-12-03 13:52:51', '2020-12-03 13:52:51'),
(621, 203, 2, 'Жисмоний маданият ривожига таъсир этувчи омиллар.', 1, 5, 'Мақола 2 та.PDF', '2020-12-03 13:54:17', '2020-12-03 13:54:17'),
(622, 203, 1, 'Футболчиларни махсус жисмоний тайёргарлик даражасини аниқлаш.', 1, 3, 'Тўплам 2020 Футбол.pdf', '2020-12-03 14:04:11', '2020-12-03 14:04:11'),
(623, 163, 1, 'Футболчиларни комплекс назорат қилиш масалалари.', 1, 3, 'Тўплам 2020 Футбол.pdf', '2020-12-03 14:06:11', '2020-12-03 14:06:11'),
(624, 163, 1, 'Ички ишлар органлари фаолиятини такомиллаштиришнинг муҳим ҳуқуқий асоси.', 2, 3, 'Қодиров, Дустмуродов 2017 йил.pdf', '2020-12-03 14:08:44', '2020-12-03 14:08:44'),
(625, 163, 1, 'Айбсизлик презумпцияси принципи: муаммо ва ечимлар.', 2, 3, 'айбсизлик презумпцияси .pdf', '2020-12-03 14:32:49', '2020-12-03 14:32:49'),
(626, 163, 1, 'Коррупциянинг ижтимоий хавфлилиги ва унга қарши курашишнинг аҳамияти', 1, 3, 'Коррупциянинг ижтимоий хавфлилиги ва унга қарши курашишнинг аҳамияти.pdf', '2020-12-03 14:35:58', '2020-12-03 14:35:58'),
(627, 163, 1, 'Болалар футболи ёш футболчиларни танлаб олиш ва тарбиялаш', 1, 3, 'болалар футболи.pdf', '2020-12-03 14:43:16', '2020-12-03 14:43:16'),
(628, 163, 1, 'Жиноят ишини тугатиш асосларининг вужудга келиши ва ривожланиш босқичлар', 2, 3, 'жиноят ишини тугатиш асослари вужудга келиши.pdf', '2020-12-03 14:50:20', '2020-12-03 14:50:20'),
(629, 163, 1, 'Конституция - инсон ҳуқуқларини таъминлашнинг мухим ҳуқуқий асоси', 2, 3, 'конституция -инсон хукуклари.pdf', '2020-12-03 15:04:48', '2020-12-03 15:04:48'),
(630, 163, 1, 'Коррупцияга қарши курашнинг халқаро  ҳуқуқий асослари', 2, 3, 'У.А.Кодиров, У.И.Дустмуродов Коррупция.pdf', '2020-12-03 15:17:20', '2020-12-03 15:17:20'),
(631, 163, 1, 'СПЕЦИФИКА И ОРГАНИЗАЦИОННО-МЕТОДИЧЕСКИЕ УКАЗАНИЯ ПРИ ПРОВЕДЕНИИ ЗАЧЕТА ПО ФИЗИЧЕСКОЙ ПОДГОТОВКЕ', 2, 2, 'краснодар статья.pdf', '2020-12-03 15:25:22', '2020-12-03 15:25:22'),
(632, 98, 1, 'Йўл ҳаракати хавфсизлиги тўғрисидаги янги тахрирдаги конунимиз амалда', 1, 3, 'макола Калкон Ризаев.doc', '2020-12-04 05:44:21', '2020-12-04 05:44:21'),
(633, 98, 1, 'Йўл - транспорт ҳодисаларини олдини олиш учун яна бир қадам', 2, 7, 'макола  Ш.Ш.Ризаев, Сайидов.doc', '2020-12-04 05:46:49', '2020-12-04 05:46:49'),
(634, 245, 1, 'EVALUATION OF THE BIOLOGICAL COMPLETENESS OF FOOD DIETS IN  SPECIALIZED INSTITUTIONS OF THE MINISTRY OF INTERNAL AFFAIRS (MIA)', 2, 1, 'Мақола АҚШ 2020_5_6-AJR_12.pdf', '2020-12-04 10:02:50', '2020-12-04 10:02:50'),
(635, 245, 1, 'Гигиенические принципы нормировании питания в пенитенциарных учреждениях', 1, 3, '20170311_190712.jpg', '2020-12-04 10:07:39', '2020-12-04 10:07:39'),
(636, 245, 1, 'Гигиенические принципы нормировании питания в пенитенциарных учреждениях', 1, 2, '20170311_191023.jpg', '2020-12-04 10:12:06', '2020-12-04 10:12:06'),
(637, 245, 2, 'Actual problems of prevention of non-infectious diseases among the control of penitential institutions', 1, 4, 'Мақола АҚШ 2020_5_6-AJR_12.pdf', '2020-12-04 10:25:07', '2020-12-04 10:25:07');
INSERT INTO `old_maqolas` (`id`, `user_id`, `turi`, `mavzu`, `mualliflik`, `miqyosi`, `ilova`, `created_at`, `updated_at`) VALUES
(638, 245, 1, 'Гигиеническая оценка факторов риска загрязнения продукции животноводчества производимых вусловиях маловодья // Профилактическая и клиническая медицина. Научный журнал / Министерство здравоохранения и социального развития Российской федерации. Санкт Петерб', 2, 2, 'Снимок.PNG', '2020-12-04 11:10:21', '2020-12-04 11:10:21'),
(639, 245, 1, 'По оценке состояния питания осужденных в пенитенциарных учреждениях Узбекистана // Соғлом ва пархез овқатланишнинг долзарб муаммолари.', 1, 7, '01.jpg', '2020-12-04 11:11:40', '2020-12-04 11:11:40'),
(640, 245, 2, 'По оценке состояния питания осужденных в пенитенциарных учреждениях Узбекистана // Соғлом ва пархез овқатланишнинг долзарб муаммолари.', 1, 5, '01.jpg', '2020-12-04 11:13:53', '2020-12-04 11:13:53'),
(641, 258, 1, 'Чорва моллари  ўғирликларини олдини олишда ҳамкорликнинг асосий йўналишлари', 1, 3, 'Маъмурий ислоҳотлар консепцияси.doc', '2020-12-04 15:03:12', '2020-12-04 15:03:12'),
(642, 112, 1, 'ҲАРБИЙ ТЕРМИНЛАРНИНГ ИШЛАТИЛИШИ ВА УЛАРДАГИ ЎЗГАРИШЛАРНИНГ ЎЗИГА ХОС ХУСУСИЯТЛАРИ', 1, 3, 'fledu.uz 2018 4 сон.pdf', '2020-12-04 15:33:13', '2020-12-04 15:33:13'),
(643, 112, 1, 'THE LINGUACULTUROLOGICAL AND SEMANTIC PECULIARITIES OF MILITARY-TECHNICAL VOCABULARY IN TEXTS', 1, 3, 'fledu.uz макола 2019. 1.сон.pdf', '2020-12-04 15:34:01', '2020-12-04 15:34:01'),
(644, 112, 1, 'ИНГЛИЗ ВА ЎЗБЕК ТИЛИ ҲАРБИЙ ТЕРМИНЛАРИНИНГ ЛИНГВОМАДАНИЙ ХУСУСИЯТЛАРИ', 1, 2, 'Журнал.pdf', '2020-12-04 15:41:40', '2020-12-04 15:41:40'),
(645, 91, 2, 'Ички ишлар органлари ва миллий гвардия томонидан оммавий тадбирлар ўтказиш вақтида жамоат тартибини сақлаш бўйича илғор тажриба', 2, 5, 'CamScanner 01-12-2020 11.25.pdf', '2020-12-05 05:05:07', '2020-12-05 05:05:07'),
(646, 91, 2, 'Лицензирование - в механизме административно-правового регулирования экономики в Республике Узбекистан', 1, 5, 'CamScanner 01-12-2020 11.29.pdf', '2020-12-05 05:06:58', '2020-12-05 05:06:58'),
(647, 236, 1, 'Антик Грецияда жисмоний тарбиянинг шаклланиши', 1, 3, 'IMG_20201205_103652_706.jpg', '2020-12-05 05:35:56', '2020-12-05 05:35:56'),
(648, 236, 1, 'Жисмоний тарбия машғулотининг назарий билимларини ўзлаштиришда инновацион усуллардан фойдаланиш', 1, 3, 'IMG_20201205_103657_633.jpg', '2020-12-05 05:37:31', '2020-12-05 05:37:31'),
(649, 236, 1, 'Тайёргарликнинг турли босқичларда умумий ва жанговар тайёргарликни ўзаро нисбати', 2, 3, 'IMG_20201205_103655_523.jpg', '2020-12-05 05:38:27', '2020-12-05 05:38:27'),
(650, 258, 1, 'Ушлаб туриш ҳақида айрим фикрлар', 1, 3, '1. Ушлаб туриш ҳақида айрим фикрлар.doc', '2020-12-05 06:56:36', '2020-12-05 06:56:36'),
(651, 146, 2, 'Таълим муассасалари раҳбарларининг профессионал фаолиятини тадқиқ этишнинг ҳуқуқий назарияси хусусида', 1, 5, 'тарбия.docx', '2020-12-05 09:36:58', '2020-12-05 09:36:58'),
(652, 239, 1, 'ОБЕСПЕЧЕНИЕ ОТКРЫТОСТИ ДЕЯТЕЛЬНОСТИ  ОПЕРАТИВНЫХ ПОДРАЗДЕЛЕНИЙ ОРГАНОВ  ВНУТРЕННИХ ДЕЛ', 1, 3, '+ОБЕСПЕЧЕНИЕ ОТКРЫТОСТИ ДЕЯТЕЛЬНОСТИ Оперативных ОРГАНОВ.doc', '2020-12-05 09:37:00', '2020-12-05 09:37:00'),
(653, 146, 2, 'Ҳуқуқий тарбия ва ҳуқуқий маданиятнинг методологик асосларига доир мулоҳазалар', 1, 5, 'хукукий тарбия.docx', '2020-12-05 09:38:24', '2020-12-05 09:38:24'),
(654, 239, 1, 'УСИЛЕНИЕ МЕР ПО ПРЕДУПРЕЖДЕНИЮ ТОРГОВЛИ ЛЮДЬМИ', 1, 3, 'Усиления мер по предупреждению торговли людми.docx', '2020-12-05 09:38:33', '2020-12-05 09:38:33'),
(655, 239, 1, 'НЕКОТОРЫЕ АСПЕКТЫ ИЗ ОБЛАСТИ ПСИХОЛОГИИ ЛЖИ', 1, 3, 'мақола Убайдуллаев К.Н..rtf', '2020-12-05 09:39:53', '2020-12-05 09:39:53'),
(656, 239, 1, 'ОСНОВНЫЕ ТЕНДЕНЦИИ СОВРЕМЕННОГО ТЕРРОРИЗМА', 1, 3, '+ОСНОВНЫЕ ТЕНДЕНЦИИ СОВРЕМЕННОГО ТЕРРОРИЗМА.doc', '2020-12-05 09:41:37', '2020-12-05 09:41:37'),
(657, 239, 1, 'ТЕЗКОР-ҚИДИРУВ ФАОЛИЯТИДА ЮЗАГА КЕЛУВЧИ МУНОСАБАТЛАРДА АХЛОҚ НОРМАЛАРИНИНГ  ЎЗИГА ХОС ХУСУСИЯТЛАРИ', 1, 3, 'Убайдуллаев К..docx', '2020-12-05 09:44:48', '2020-12-05 09:44:48'),
(658, 239, 1, 'ВОЯГА ЕТМАГАНЛАР ОРАСИДА ТЕРРОРИЗМ ВА ДИНИЙ ЭКСТРЕМИЗМ ҒОЯЛАРИНИНГ ТАРҚАЛИШИГА  ҚАРШИ КУРАШ ЙЎЛЛАРИТЕРРОРИЗМ ВА ДИНИЙ ЭКСТРЕМИЗМ ҒОЯЛАРИНИНГ ТАРҚАЛИШИГА  ҚАРШИ КУРАШ ЙЎЛЛАРИ', 1, 3, 'вояга етмаганлар терроризми.docx', '2020-12-05 09:47:40', '2020-12-05 09:47:40'),
(659, 146, 2, 'Иштирокчиликда  содир  этиладиган  босқинчилик  жиноятларини  квалификация  қилиш  масалалари', 1, 5, 'иштирокчилик.docx', '2020-12-05 09:48:44', '2020-12-05 09:48:44'),
(660, 146, 2, 'Гиѐҳвандлик воситалари билан қонунга хилоф равишда  муомала қилишнинг жиноий-ҳуқуқий тавсифи', 1, 5, 'иштирокчилик.docx', '2020-12-05 09:52:11', '2020-12-05 09:52:11'),
(661, 239, 1, 'ТЕЗКОР-ҚИДИРУВ ТАДБИРЛАР НАТИЖАСИДА НОҚОНУНИЙ МЕҲНАТ МИГРАЦИЯ ПРОФИЛАКТИКАСИ', 2, 3, 'Макола ТКФ-1.docx', '2020-12-05 11:29:53', '2020-12-05 11:29:53'),
(662, 268, 1, 'ТЕЗКОР-ҚИДИРУВ ТАДБИРЛАР НАТИЖАСИДА НОҚОНУНИЙ МЕҲНАТ МИГРАЦИЯ ПРОФИЛАКТИКАСИ', 2, 3, 'Макола ТКФ-1.docx', '2020-12-05 11:31:10', '2020-12-05 11:31:10'),
(663, 268, 1, 'НОҚОНУНИЙ МИГРАЦИЯ БИЛАН БОҒЛИҚ ЖИНОЯТЛАРНИ ФОШ ЭТИШДА ЖИНОЯТ-ҚИДИРУВ  БЎЛИНМАЛАРИ ФАОЛИЯТИНИ ТАКОМИЛЛАШТИРИШ', 1, 3, 'Макола ТКФ.doc', '2020-12-05 11:31:52', '2020-12-05 11:31:52'),
(664, 258, 1, 'ЧОРВА МОЛЛАРИ ЎҒИРЛИКЛАРИГА ҚАРШИ КУРАШИШНИНГ НАЗАРИЙ АСОСЛАРИ ВА ТАРИХИЙ ШАКЛЛАНИШИ', 1, 2, 'ТАРИХИЙ ШАКЛЛАНИШИ.docx', '2020-12-05 12:33:06', '2020-12-05 12:33:06'),
(665, 258, 1, 'ЧОРВА МОЛЛАРИ ЎҒИРЛИКЛАРИГА ҚАРШИ КУРАШИШНИНГ НАЗАРИЙ АСОСЛАРИ ВА ТАРИХИЙ ШАКЛЛАНИШИ', 1, 3, '14.жиноий ҳуқуқий ва криминологик.docx', '2020-12-05 12:34:47', '2020-12-05 12:34:47'),
(666, 258, 1, 'ЧОРВА МОЛЛАРИ ЎҒИРЛИКЛАРИГА ҚАРШИ КУРАШИШНИНГ НАЗАРИЙ АСОСЛАРИ ВА ТАРИХИЙ ШАКЛЛАНИШИ', 1, 3, '16.назарий ва ҳуқуқий асослари.docx', '2020-12-05 12:35:28', '2020-12-05 12:35:28'),
(667, 258, 1, 'ЧОРВА МОЛЛАРИ ЎҒИРЛИКЛАРИГА ҚАРШИ КУРАШИШНИНГ НАЗАРИЙ АСОСЛАРИ ВА ТАРИХИЙ ШАКЛЛАНИШИ', 1, 3, '13. ҳуқуқий асослар.docx', '2020-12-05 12:36:36', '2020-12-05 12:36:36'),
(668, 258, 1, 'ЧОРВА МОЛЛАРИ ЎҒИРЛИКЛАРИГА ҚАРШИ КУРАШИШНИНГ НАЗАРИЙ АСОСЛАРИ ВА ТАРИХИЙ ШАКЛЛАНИШИ', 1, 3, '13. ҳуқуқий асослар.docx', '2020-12-05 12:36:37', '2020-12-05 12:36:37'),
(669, 258, 1, 'ЧОРВА МОЛЛАРИ ЎҒИРЛИКЛАРИГА ҚАРШИ КУРАШИШНИНГ НАЗАРИЙ АСОСЛАРИ ВА ТАРИХИЙ ШАКЛЛАНИШИ', 1, 3, '13. ҳуқуқий асослар.docx', '2020-12-05 12:36:39', '2020-12-05 12:36:39'),
(670, 258, 2, 'Ички ишлар органларида ноқонуний миграцияни олдини олишнинг айрим жиҳатлари', 2, 6, '11.Б.Эгамбердиев-Бобомуродов.doc', '2020-12-05 12:38:32', '2020-12-05 12:38:32'),
(671, 258, 1, 'ХОНАДОНЛАРДА СОДИР ЭТИЛГАН  ЎҒРИЛИК ЖИНОЯТЛАРИГА ҚАРШИ КУРАШИШДА ЗАМОНАВИЙ МАХСУС ТЕХНИКА ВОСИТАЛАРИ ИМКОНИЯТЛАРИДАН ФОЙДАЛАНИШНИНГ САМАРАДОРЛИГИ', 1, 3, '10.ХОНАДОНЛАРДА СОДИР ЭТИЛГАН  ЎҒРИЛИК ЖИНОЯТЛАРИГА ҚАРШИ КУРАШИШДА ЗАМОНАВИЙ МАХСУС ТЕХНИКА ВОСИТАЛАРИ ИМКОНИЯТЛАРИДАН ФОЙДАЛАНИШНИНГ САМАРАДОРЛИГИ.docx', '2020-12-05 12:40:02', '2020-12-05 12:40:02'),
(672, 258, 1, 'ЎҒРИЛИК ЖИНОЯТЛАРИНИНГ ТАСНИФЛАНИШИ ВА  УНГА ҚАРШИ КУРАШИШДА МАХСУС ТЕХНИКА  ВОСИТАЛАРИДАН ФОЙДАЛАНИШНИНГ АҲАМИЯТИ ВА ДОЛЗАРБЛИГИ', 2, 3, '9. ЎҒРИЛИК ЖИНОЯТЛАРИНИНГ ТАСНИФЛАНИШИ ВА  УНГА ҚАРШИ КУРАШИШДА МАХСУС ТЕХНИКА ВОСИТАЛАРИДАНФОЙДАЛАНИШНИНГ АҲАМИЯТИ ВА ДОЛЗАРБЛИГИ.docx', '2020-12-05 12:41:06', '2020-12-05 12:41:06'),
(673, 258, 1, 'ЎҒРИЛИК ЖИНОЯТЛАРИНИНГ ТАСНИФЛАНИШИ ВА  УНГА ҚАРШИ КУРАШИШДА МАХСУС ТЕХНИКА  ВОСИТАЛАРИДАН ФОЙДАЛАНИШНИНГ АҲАМИЯТИ ВА ДОЛЗАРБЛИГИ', 2, 3, '9. ЎҒРИЛИК ЖИНОЯТЛАРИНИНГ ТАСНИФЛАНИШИ ВА  УНГА ҚАРШИ КУРАШИШДА МАХСУС ТЕХНИКА ВОСИТАЛАРИДАНФОЙДАЛАНИШНИНГ АҲАМИЯТИ ВА ДОЛЗАРБЛИГИ.docx', '2020-12-05 12:41:12', '2020-12-05 12:41:12'),
(674, 258, 1, 'ҲУҚУҚИЙ ТАРБИЯ, ҲУҚУҚИЙ ОНГ ВА ҲУҚУҚИЙ МАДАНИЯТНИ ШАКЛЛАНТИРИШНИНГ МУҲИМ  ОМИЛИ', 1, 7, '8.ҲУҚУҚИЙ ТАРБИЯ, ҲУҚУҚИЙ ОНГ ВА ҲУҚУҚИЙ МАДАНИЯТНИ ШАКЛЛАНТИРИШНИНГ МУҲИМ  ОМИЛИ.docx', '2020-12-05 12:42:41', '2020-12-05 12:42:41'),
(675, 258, 1, 'ҲУҚУҚИЙ ТАРБИЯ, ҲУҚУҚИЙ ОНГ ВА ҲУҚУҚИЙ МАДАНИЯТНИ ШАКЛЛАНТИРИШНИНГ МУҲИМ  ОМИЛИ', 1, 7, '8.ҲУҚУҚИЙ ТАРБИЯ, ҲУҚУҚИЙ ОНГ ВА ҲУҚУҚИЙ МАДАНИЯТНИ ШАКЛЛАНТИРИШНИНГ МУҲИМ  ОМИЛИ.docx', '2020-12-05 12:42:43', '2020-12-05 12:42:43'),
(676, 258, 1, 'ҲУҚУҚИЙ ТАРБИЯ, ҲУҚУҚИЙ ОНГ ВА ҲУҚУҚИЙ МАДАНИЯТНИ ШАКЛЛАНТИРИШНИНГ МУҲИМ  ОМИЛИ', 1, 7, '8.ҲУҚУҚИЙ ТАРБИЯ, ҲУҚУҚИЙ ОНГ ВА ҲУҚУҚИЙ МАДАНИЯТНИ ШАКЛЛАНТИРИШНИНГ МУҲИМ  ОМИЛИ.docx', '2020-12-05 12:42:43', '2020-12-05 12:42:43'),
(677, 258, 1, 'ҲУҚУҚИЙ ТАРБИЯ, ҲУҚУҚИЙ ОНГ ВА ҲУҚУҚИЙ МАДАНИЯТНИ ШАКЛЛАНТИРИШНИНГ МУҲИМ  ОМИЛИ', 1, 7, '8.ҲУҚУҚИЙ ТАРБИЯ, ҲУҚУҚИЙ ОНГ ВА ҲУҚУҚИЙ МАДАНИЯТНИ ШАКЛЛАНТИРИШНИНГ МУҲИМ  ОМИЛИ.docx', '2020-12-05 12:42:48', '2020-12-05 12:42:48'),
(678, 258, 2, 'ҲУҚУҚИЙ ТАРБИЯ, ҲУҚУҚИЙ ОНГ ВА ҲУҚУҚИЙ МАДАНИЯТНИ ШАКЛЛАНТИРИШНИНГ МУҲИМ  ОМИЛИ', 1, 6, '8.ҲУҚУҚИЙ ТАРБИЯ, ҲУҚУҚИЙ ОНГ ВА ҲУҚУҚИЙ МАДАНИЯТНИ ШАКЛЛАНТИРИШНИНГ МУҲИМ  ОМИЛИ.docx', '2020-12-05 12:43:54', '2020-12-05 12:43:54'),
(679, 258, 2, 'ФУҚАРОЛАРНИНГ  ҲУҚУҚИЙ ОНГИ ВА МАДАНИЯТИНИ ЮКСАЛТИРИШДА ҲУҚУҚИЙ ВА ҚОНУНЧИЛИК ТАРҒИБОТ ИШЛАРИНИНГ АҲАМИЯТИ', 2, 6, '7. ФУҚАРОЛАРНИНГ  ҲУҚУҚИЙ ОНГИ ВА МАДАНИЯТИНИ ЮКСАЛТИРИШДА ҲУҚУҚИЙ ВА ҚОНУНЧИЛИК ТАРҒИБОТ ИШЛАРИНИНГ АҲАМИЯТИ.docx', '2020-12-05 12:44:46', '2020-12-05 12:44:46'),
(680, 258, 2, 'ЎҒРИЛИК ЖИНОЯТЛАРИНИНГ ЖИНОИЙ ҲУҚУҚИЙ ТАСНИФЛАНИШИ ВА УЛАРГА ҚАРШИ КУРАШИШДА ТЕЗКОР ХОДИМЛАРИНИНГ ИШ ФАОЛИЯТИНИ ТАШКИЛ ЭТИШ БЎЙИЧА БАЪЗИ ФИКР ВА МУЛОҲАЗАЛАР', 1, 6, '6.ЎҒРИЛИК ЖИНОЯТЛАРИНИНГ ЖИНОИЙ ҲУҚУҚИЙ ТАСНИФЛАНИШИ ВА УЛАРГА ҚАРШИ КУРАШИШДА ТЕЗКОР ХОДИМЛАРИНИНГ ИШ ФАОЛИЯТИНИ ТАШКИЛ ЭТИШ БЎЙИЧА БАЪЗИ ФИКР ВА МУЛОҲАЗАЛАР.docx', '2020-12-05 12:45:27', '2020-12-05 12:45:27'),
(681, 258, 2, 'ТЕЗКОР-ҚИДИРУВ ФАОЛИЯТИНИ АМАЛГА ОШИРУВЧИ ОРГАНЛАРНИНГ ХОРИЖИЙ ДАВЛАТ ОРГАНЛАРИ БИЛАН ҚИЁСИЙ ТАҲЛИЛИ ҲАМДА УЛАРНИНГ  ҲУҚУҚИЙ МАҚОМИНИ МУСТАҲКАМЛАШ БОРАСИДА  БАЪЗИ ФИКРЛАР', 2, 6, '5.ТЕЗКОР-ҚИДИРУВ ФАОЛИЯТИНИ АМАЛГА ОШИРУВЧИ ОРГАНЛАРНИНГ ХОРИЖИЙ ДАВЛАТ ОРГАНЛАРИ БИЛАН ҚИЁСИЙ ТАҲЛИЛИ ҲАМДА УЛАРНИНГ  ҲУҚУҚИЙ МАҚОМИНИ МУСТАҲКАМЛАШ БОРАСИДА  БАЪЗИ ФИКРЛАР.docx', '2020-12-05 12:46:36', '2020-12-05 12:46:36'),
(682, 258, 1, 'ТЕЗКОР-ҚИДИРУВ ФАОЛИЯТИНИ АМАЛГА ОШИРУВЧИ ОРГАНЛАРНИНГ ХОРИЖИЙ ДАВЛАТ ОРГАНЛАРИ БИЛАН ҚИЁСИЙ ТАҲЛИЛИ ҲАМДА УЛАРНИНГ  ҲУҚУҚИЙ МАҚОМИНИ МУСТАҲКАМЛАШ БОРАСИДА  БАЪЗИ ФИКРЛАР', 1, 2, '4.Жамиятимиз  ривожига раҳна солиши мумкин бўлган таҳдидлар моҳият ва мақсадлар.docx', '2020-12-05 12:48:34', '2020-12-05 12:48:34'),
(683, 258, 1, 'Диний экстремизм ва терроризм – башарият душмани', 2, 2, '3.Диний экстремизм ва терроризм – башарият душмани.docx', '2020-12-05 12:49:32', '2020-12-05 12:49:32'),
(684, 258, 2, 'ЧОРВА МОЛЛАРИ ЎҒИРЛИГИНИНГ ТАВСИФИ', 1, 6, 'ФАРҲОД МАҚОЛА.docx', '2020-12-05 12:56:04', '2020-12-05 12:56:04'),
(685, 259, 2, 'Ёшларда янгича касбий таффакурни шакллантиришнинг ўзига хос мухим  жиҳатлари', 2, 5, '1.Ёшларда янгича касбий таффакур.pdf', '2020-12-07 04:54:35', '2020-12-07 04:54:35'),
(686, 98, 2, 'Ҳамкорлик ва самарали натижалар', 2, 5, 'макола-2 Э.Ражапов+Ш.Ризаев.pdf', '2020-12-07 05:20:08', '2020-12-07 05:20:08'),
(687, 172, 2, 'Ichki ishlar organlari tezkor bo\'linmalarining tog\'li hududlarda terrorizmga qarshi kurashishning o\'ziga xos xususiyatlariсусиятлари', 2, 6, '4-maqola yopiq nashrga.docx', '2020-12-07 06:01:06', '2020-12-07 06:01:06'),
(688, 258, 1, 'Чорва моллари ўғирлиги жиноятларининг тезкор-қидирув тавсифи', 1, 3, 'Ахборотнома.docx', '2020-12-07 06:40:38', '2020-12-07 06:40:38'),
(689, 258, 1, 'Чорва моллари ўғирлигининг криминалистик жиҳатлари', 1, 3, 'Чорва моллари ўғирлигининг криминалистик жиҳатлари.docx', '2020-12-07 06:41:37', '2020-12-07 06:41:37'),
(690, 258, 2, ', Ички ишлар органлари тезкор-қидирув бўлинмалари томонидан коррупциявий жиноятларга қарши курашишнинг ҳуқуқий асослари ҳамда  тезкор-қидирув профилактикасини ташкил этишнинг аҳамияти', 2, 5, 'коррупциявий жиноятларга қарши курашишнинг ҳуқуқий асослари.docx', '2020-12-07 06:43:14', '2020-12-07 06:43:14'),
(691, 258, 2, 'Коррупцияни олдини олиш – долзарб вазифа    Ҳуқуқни муҳофаза қилувчи орган ходимларининг одоб-ахлоқ қоидаларига риоя этиши – коррупцияга қарши курашнинг энг муҳим мезони', 1, 5, 'Коррупцияни олдини олиш – долзарб вазифа.docx', '2020-12-07 06:44:09', '2020-12-07 06:44:09'),
(692, 258, 1, 'Чорва моллари ўғирликлари тезкор-қидирув профилактикасининг тушунчаси, мақсади ва вазифалари', 1, 3, 'Чорва моллари ўғирликлари тезкор-қидирув профилактикасининг тушунчаси, мақсади ва вазифалари.docx', '2020-12-07 06:45:02', '2020-12-07 06:45:02'),
(693, 258, 1, 'Ички ишлар органлари тезкор-қидирув фаолиятида идоравий назоратни амалга ошириш жараёнида қонунийликни таъминлашнинг  аҳамияти', 1, 7, 'идоравий назоратни амалга ошириш жараёнида қонунийликни.docx', '2020-12-07 06:46:42', '2020-12-07 06:46:42'),
(694, 258, 2, 'Ички ишлар органлари тезкор-қидирув фаолиятида идоравий назоратни амалга ошириш жараёнида қонунийликни таъминлашнинг  аҳамияти', 1, 5, 'идоравий назоратни амалга ошириш жараёнида қонунийликни.docx', '2020-12-07 06:47:10', '2020-12-07 06:47:10'),
(695, 258, 2, 'Ички ишлар органлари  тезкор-қидирув бўлинмаларининг чорва моллари ўғирликларини фош этиш тактикасини такомиллаштириш', 1, 5, 'Ички ишлар органлари  тезкор-қидирув бўлинмаларининг чорва моллари ўғирликларини фош этиш тактикасини такомиллаштириш.docx', '2020-12-07 06:48:13', '2020-12-07 06:48:13'),
(696, 258, 2, 'Ички ишлар органлари тезкор-қидирув бўлинмаларининг чорва моллари ўғирликларини фош этишнинг ташкилий фаолиятини  такомиллаштириш', 1, 5, 'Ички ишлар органлари тезкор-қидирув бўлинмаларининг чорва моллари ўғирликларини фош этишнинг ташкилий фаолиятини  такомиллаштириш.docx', '2020-12-07 06:49:04', '2020-12-07 06:49:04'),
(697, 258, 2, 'Ички ишлар органлари жиноят қидирув бўлимлари томонидан мол ўғирлиги жиноятларига қарши курашишда тезкор-қидирув фаолиятига кўмаклашувчи шахсларни жалб этиш хусусиятлари', 2, 5, 'мол ўғирлиги жиноятларига қарши курашишда тезкор-қидирув фаолиятига кўмаклашувчи шахсларни.docx', '2020-12-07 06:49:37', '2020-12-07 06:49:37'),
(698, 258, 2, 'Мол ўғирлиги жиноятларининг олдини олиш ва фош этишнинг ташкилий-тактик асосларини такомиллаштириш', 1, 5, 'Мол ўғирлиги жиноятларининг олдини олиш ва фош этишнинг ташкилий-тактик асосларини такомиллаштириш.docx', '2020-12-07 06:50:07', '2020-12-07 06:50:07'),
(699, 258, 2, 'Тезкор қидирув фаолиятида кўмаклашувчи шахсларнинг жиноятларни олдини олиш ва фош этишдаги  аҳамияти', 2, 5, 'Тезкор қидирув фаолиятида кўмаклашувчи шахсларнинг жиноятларни олдини олиш ва фош этишдаги  аҳамияти.docx', '2020-12-07 06:50:41', '2020-12-07 06:50:41'),
(700, 258, 2, 'Ички ишлар органлари тезкор-қидирув фаолиятида тезкор ҳисоб йиғма жилдларига қўйиладиган талаблар', 2, 5, 'тезкор ҳисоб йиғма жилдларига қўйиладиган талаблар.docx', '2020-12-07 06:51:15', '2020-12-07 06:51:15'),
(701, 258, 2, 'Чорва моллари ўғирлигининг тезкор-қидирув тавсифи', 1, 5, 'тезкор-қидирув тавсифи Ички ишлар органлари тезкор-қидирув бўлинмаларининг  жиноятчиликка қарши курашиш фаолиятини.docx', '2020-12-07 06:52:02', '2020-12-07 06:52:02'),
(702, 258, 2, 'тезкор-қидирув фаолиятида конунийликни  таъминлашда прокурор назорати', 1, 5, 'тезкор-қидирув фаолиятида конунийликни  таъминлашда прокурор назорати.docx', '2020-12-07 06:52:45', '2020-12-07 06:52:45'),
(703, 258, 2, 'Ички ишлар органлари тизимидаги ушланган ва ҳибсга олинган шахсларни вақтинча сақлаш хоналари ва тергов ҳибсхоналарида амалга ошириладиган махсус ишлар фаолиятини такомиллаштиришнинг аҳамияти ва асосий йўналишлари', 2, 5, 'ушланган ва ҳибсга олинган шахсларни вақтинча сақлаш.docx', '2020-12-07 06:53:34', '2020-12-07 06:53:34'),
(704, 258, 2, 'Чорва моллари  ўғирликларини олдини олишда ҳамкорликнинг асосий йўналишлари', 1, 5, 'Чорва моллари  ўғирликларини олдини олишда ҳамкорликнинг асосий йўналишлари.docx', '2020-12-07 06:54:33', '2020-12-07 06:54:33'),
(705, 258, 2, 'Чорва моллари ўғирлигининг сабаблари ва содир этилишига имкон берган шарт-шароитлар', 1, 5, 'Чорва моллари ўғирлигининг сабаблари ва содир этилишига имкон берган шарт-шароитла.docx', '2020-12-07 06:55:10', '2020-12-07 06:55:10'),
(706, 258, 2, 'Чорва моллари ўғирликлари содир этилишининг ўзига хос хусусиятлари', 2, 5, 'Чорва моллари ўғирликлари содир этилишининг ўзига хос хусусиятлари.docx', '2020-12-07 06:55:47', '2020-12-07 06:55:47'),
(707, 258, 2, 'Чорва моллари ўғирликларига қарши курашишга оид ҳуқуқий нормаларни ривожлантириш', 1, 5, 'Чорва моллари ўғирликларига қарши курашишга оид ҳуқуқий нормаларни ривожлантириш.docx', '2020-12-07 06:56:16', '2020-12-07 06:56:16'),
(708, 258, 2, 'Чорва моллари ўғирликларига қарши курашишга салбий таъсир кўрсатувчи омиллар', 1, 5, 'Чорва моллари ўғирликларига қарши курашишга салбий таъсир кўрсатувчи омиллар.docx', '2020-12-07 06:56:57', '2020-12-07 06:56:57'),
(709, 258, 2, 'Чорва моллари ўғирликларига қарши курашишга салбий таъсир кўрсатувчи субъектив ва объектив омиллар', 1, 5, 'Чорва моллари ўғирликларига қарши курашишга салбий таъсир кўрсатувчи субъектив ва объектив омиллар.docx', '2020-12-07 06:57:59', '2020-12-07 06:57:59'),
(710, 258, 2, 'Чорва моллари ўғирликларига қарши курашишга салбий таъсир кўрсатувчи ташкилий омиллар', 1, 5, 'Чорва моллари ўғирликларига қарши курашишга салбий таъсир кўрсатувчи ташкилий омиллар.docx', '2020-12-07 06:58:45', '2020-12-07 06:58:45'),
(711, 258, 2, 'Чорва моллари ўғирликларига қарши курашишнинг тарихий даврлари', 1, 5, 'Чорва моллари ўғирликларига қарши курашишнинг тарихий даврлари.docx', '2020-12-07 06:59:42', '2020-12-07 06:59:42'),
(712, 258, 2, 'Чорва моллари ўғирликларига қарши курашишнинг тарихий шаклланиши', 2, 5, 'Чорва моллари ўғирликларига қарши курашишнинг тарихий шаклланиши.docx', '2020-12-07 07:00:24', '2020-12-07 07:00:24'),
(713, 258, 2, 'Чорва моллари ўғирликларига қарши курашишнинг ҳуқуқий механизмлари', 1, 5, 'Чорва моллари ўғирликларига қарши курашишнинг ҳуқуқий механизмлари.docx', '2020-12-07 07:00:54', '2020-12-07 07:00:54'),
(714, 258, 2, 'Чорва моллари ўғирликларини фош этишга  салбий таъсир кўрсатувчи  айрим омиллар', 2, 5, 'Чорва моллари ўғирликларини фош этишга  салбий таъсир кўрсатувчи  айрим омиллар.docx', '2020-12-07 07:01:28', '2020-12-07 07:01:28'),
(715, 258, 2, 'Чорва моллари ўғирликларини фош этишга салбий таъсир кўрсатувчи омиллар', 2, 5, 'Чорва моллари ўғирликларини фош этишга салбий таъсир кўрсатувчи омиллар.docx', '2020-12-07 07:02:01', '2020-12-07 07:02:01'),
(716, 258, 2, 'Чорва моллари ўғирликларининг  тезкор-тактик ҳамда тезкор-қидирув тавсифининг илмий таҳлили', 1, 5, 'Чорва моллари ўғирликларининг  тезкор-тактик ҳамда тезкор-қидирув тавсифининг илмий таҳлили.docx', '2020-12-07 07:03:26', '2020-12-07 07:03:26'),
(717, 258, 2, 'Чорва моллари ўғирликларининг жиноий-ҳуқуқий тавсифи ҳақида баъзи фикрлар/', 1, 5, 'Чорва моллари ўғирликларининг жиноий-ҳуқуқий тавсифи ҳақида баъзи фикрлар.docx', '2020-12-07 07:03:56', '2020-12-07 07:03:56'),
(718, 258, 2, 'Чорва моллари ўғирликларининг тезкор-қидирув профилактик чора-тадбирларини такомиллаштириш йўналишлари', 1, 5, 'Чорва моллари ўғирликларининг тезкор-қидирув профилактик чора-тадбирларини такомиллаштириш йўналишлари.docx', '2020-12-07 07:04:24', '2020-12-07 07:04:24'),
(719, 258, 2, 'Чорва моллари ўғирликларининг тезкор-қидирув профилактикасини такомиллаштириш йўналишлари', 1, 5, 'Чорва моллари ўғирликларининг тезкор-қидирув профилактикасини такомиллаштириш йўналишлари.docx', '2020-12-07 07:05:01', '2020-12-07 07:05:01'),
(720, 257, 2, 'Терроризм ва диний экстремизмга қарши курашишда тезкор аппаратларнинг вазифалари', 1, 5, 'макола тер.docx', '2020-12-07 07:13:25', '2020-12-07 07:13:25'),
(721, 257, 2, 'Тезкор-қидирув фаолиятини амалга оширувчи органларнинг хорижий давлат органлари билан қиёсий таҳлили ҳамда уларнинг ҳуқуқий мақомини мустаҳкамлаш борасида ваъзи фикрлар', 2, 5, 'макола2.docx', '2020-12-07 07:16:52', '2020-12-07 07:16:52'),
(722, 257, 2, 'Коррупцияга қарши курашишда тезкор-қидирув фаолияти қонунчилининг аҳамияти ва ҳуқуқни муҳофаза қилувчи органларнинг ўзаро ҳамкорлигини такомиллаштиришнинг айрим жиҳатлари', 2, 5, 'макола3.docx', '2020-12-07 07:29:47', '2020-12-07 07:29:47'),
(723, 257, 2, 'Ички ишлар органлари тезкор аппаратлари ходимларининг махсус ишларига қўйиладиган талаблар', 1, 5, 'макола4.docx', '2020-12-07 07:31:10', '2020-12-07 07:31:10'),
(724, 257, 2, 'Ички ишлар органлари тезкор-қидирув фаолиятини ташкил этишнинг умумий қоидалари', 2, 5, 'макола5.docx', '2020-12-07 07:32:05', '2020-12-07 07:32:05'),
(725, 257, 2, 'Ички ишлар органларининг тезкор қидирув фаолиятини ахборот билан таъминлашни ташкил қилишнинг омиллари', 1, 5, 'макола6.docx', '2020-12-07 07:33:02', '2020-12-07 07:33:02'),
(726, 257, 2, 'Тезкор қидирув фаолиятида ёрдамчи кучларнинг жиноятларни олдини олиш ва фош этишдаги ўрни', 1, 5, 'макола7.docx', '2020-12-07 07:33:55', '2020-12-07 07:33:55'),
(727, 257, 2, '. Коррупциявий жиноятларни олдини олиш ва фош этишда ички ишлар органларининг тезкор бўлинмаларини олдидаги вазифалар', 1, 5, 'макола8.docx', '2020-12-07 07:34:51', '2020-12-07 07:34:51'),
(728, 257, 2, 'Ахборот билан таъминлашдаги муаммолар ва уларнинг ечимлари', 1, 5, 'макола9.docx', '2020-12-07 07:37:40', '2020-12-07 07:37:40'),
(729, 257, 2, 'Коррупция билан боғлиқ жиноятларнинг тушунчаси ва тезкор-қидирув тавсифи', 1, 5, 'макола10.docx', '2020-12-07 07:40:50', '2020-12-07 07:40:50'),
(730, 257, 2, 'Терроризм ва экстремизмга қарши курашишда махсус ишларни амалга оширишнинг босқичлари', 1, 5, 'макола11.docx', '2020-12-07 07:42:26', '2020-12-07 07:42:26'),
(731, 257, 2, 'Терроризм ва экстремизмга қарши курашишда махсус ишларни амалга оширишнинг босқичлари', 1, 5, 'макола11.docx', '2020-12-07 07:42:26', '2020-12-07 07:42:26'),
(732, 222, 1, 'Вояга етмаган жиноятчи шахсининг криминологик ва психологик тавсифи', 1, 3, '5-МУНДАРИЖА 2020 2-сон 1200.pdf', '2020-12-07 08:59:05', '2020-12-07 08:59:05'),
(733, 222, 1, 'ВОЯГА ЕТМАГАНЛАР ЖИНОЯТЧИЛИГИНИ ОЛДИНИ ОЛИШНИНГ ТУРЛАРИ', 1, 3, '6-Jurisprudence-2020-1.pdf', '2020-12-07 09:06:39', '2020-12-07 09:06:39'),
(734, 222, 1, 'Вояга етмаганлар жиноятчилигининг криминологик тавсифи ва профилактикаси', 2, 3, '11-макола.pdf', '2020-12-07 09:08:41', '2020-12-07 09:08:41'),
(735, 222, 1, 'Вояга етмаганлар учун белгиланган жиноий жазоларни либераллаштириш масалалари', 2, 3, '12-макола.pdf', '2020-12-07 09:09:48', '2020-12-07 09:09:48'),
(736, 222, 1, 'ЖИНОЯТЧИЛМККА ҚАРШ И КУРАШДА ҲУҚУҚБУЗАРЛИЮ1АР ПРОФИЛАКТИКАСИ - ИЧКИ ИШ ЛАР ОРГАНЛАРИНИНГ АСОСИЙ ЙЎНАЛИШИ', 1, 3, '15-макола.pdf', '2020-12-07 09:11:59', '2020-12-07 09:11:59'),
(737, 222, 1, 'Вояга етмаганлар жиноятчилигининг сабаблари', 1, 3, '16-макола.pdf', '2020-12-07 09:12:51', '2020-12-07 09:12:51'),
(738, 222, 2, 'Вояга етмаганларнинг ҳукукбузарликлар профилактикаси - улар ўртасида миграция жараёнларини тартибга солишнинг муҳим кафолати', 1, 5, '17-макола.pdf', '2020-12-07 09:13:55', '2020-12-07 09:13:55'),
(739, 222, 1, 'Вояга етмаганларнинг ҳуқук ва эркинликларини ҳимоя қилишнинг халқаро ҳуқуқий асослари таҳлил', 1, 3, '20-макола.pdf', '2020-12-07 09:16:33', '2020-12-07 09:16:33'),
(740, 222, 1, 'Вояга етмаганларнинг жиноий хулқ-атворини ўрганишда психологиянинг аҳамияти', 2, 3, '21-макола.pdf', '2020-12-07 09:17:33', '2020-12-07 09:17:33'),
(741, 222, 1, 'АМЕРИКА ҚЎШМА ШТАТЛАРИДА ВОЯГА ЕТМАГАНЛАР ЖИНОЯТЧИЛИГИНИНГ ХУСУСИЯТЛАРИ ВА УНИНГ ОЛДИНИ ОЛИШГА ОИД ҚОНУНЛАРТАҲЛИЛИ', 1, 3, '24-макола.pdf', '2020-12-07 09:19:25', '2020-12-07 09:19:25'),
(742, 113, 1, 'ОБ ОСОБЕННОСТЯХ  РАСКРЫТИЯ И РАССЛЕДОВАНИЯ КИБЕРПРЕСТУПЛЕНИЙ', 1, 1, 'Статья  Матчанов киберпр 2020 испр. для перевода.doc', '2020-12-07 09:33:28', '2020-12-07 09:33:28'),
(743, 208, 2, 'ЎЗБЕКИСТОН РЕСПУБЛИКАСИ ИЧКИ ИШЛАР ОРГАНЛАРИ ТИЗИМИДАГИ ТУБ ИСЛОҲОТЛАР – ҚОНУНЛАР ИЖРОСИНИ ТАЪМИНЛАШ МЕХАНИЗМИНИНГ ГАРОВИ', 1, 4, 'АЗИЗОВ Элбек Усмонжонович.jpg', '2020-12-07 10:34:47', '2020-12-07 10:34:47'),
(744, 208, 2, 'Хорижий мамлакатлар полиция тизимларида қонунлар ижросини таъминлаш механизми', 1, 4, 'Элбек АЗИЗОВ .jpg', '2020-12-07 10:37:32', '2020-12-07 10:37:32'),
(745, 208, 1, 'Ҳуқуқий мониторинг - ички ишлар органларида қонунлар ижросини таъминлашнинг муҳим омили', 1, 3, 'IMG_20200324_181555_865.jpg', '2020-12-07 10:41:13', '2020-12-07 10:41:13'),
(746, 208, 2, 'Конституциявий-ҳуқуқий тизимни модернизациялаш шароитида ички ишлар органлари томонидан маъмурий чеклаш чораларини қўллашнинг ўзига хос хусусиятлари', 1, 5, 'Адрес.jpg', '2020-12-07 10:49:33', '2020-12-07 10:49:33'),
(747, 208, 2, 'Вояга етмаганлар ҳуқуқбузарликларининг олдини олишда ички ишлар идораларининг оила ва таълим муассасалари билан ҳамкорлиги', 1, 5, 'Адрес.jpg', '2020-12-07 10:54:19', '2020-12-07 10:54:19'),
(748, 208, 2, 'МАЪМУРИЙ МАЖБУРЛОВ ТУШУНЧАСИ, ХУСУСИЯТЛАРИ ВА УСУЛЛАРИНИНГ ТУРЛАРИ', 1, 5, 'Адрес.jpg', '2020-12-07 10:57:29', '2020-12-07 10:57:29'),
(749, 236, 1, 'Малакали спортчиларни тайёрлашда миллий давлатчилигимизни ўрни', 1, 3, 'IMG_20201207_162858_836.jpg', '2020-12-07 11:27:55', '2020-12-07 11:27:55'),
(750, 236, 1, 'Тезкорлик харакатини ривожлантириш йўллари', 1, 3, 'IMG_20201207_163737_152.jpg', '2020-12-07 11:35:59', '2020-12-07 11:35:59'),
(751, 203, 1, 'НАФАС  МАШҚЛАРИ  ҚЎЛАНИЛИШИ  АСОСИДА  ТУРЛИ ЎЙИН  АМПЛУАЛАРДАГИ   ЁШ    ФУТБОЛЧИЛАРНИНГ ФУНКЦИОНАЛ    ТАЙЁРГАРЛИГИ', 1, 3, 'нукус.pdf', '2020-12-07 12:02:21', '2020-12-07 12:02:21'),
(752, 203, 1, 'БОЛАЛАР ФУТБОЛИ ЁШ ФУТБОЛЧИЛАРНИ ТАНЛАБ ОЛИШ ВА ТАРБИЯЛАШ', 1, 7, 'маколааа.pdf', '2020-12-07 12:04:08', '2020-12-07 12:04:08'),
(753, 203, 1, 'ДАСТЛАБКИ ЎРГАТИШ БОСҚИЧИДА 10-13 ЁШЛИ ФУТБОЛЧИЛАРНИ ЖИСМОНИЙ СИФАТЛАРИНИ ТАРБИЯЛАШ', 1, 3, 'маколааа.pdf', '2020-12-07 12:05:47', '2020-12-07 12:05:47'),
(754, 203, 2, 'Ёш футболчиларни жисмоний тайёргарлигини назорат килиш', 1, 5, 'маколла.pdf', '2020-12-07 12:07:55', '2020-12-07 12:07:55'),
(755, 203, 2, 'ЁШ ФУТБОЛЧИЛАРНИ ЖИСМОНИЙ ТАЙЁРГАРЛИГИНИ БАХОЛАШ', 1, 5, 'маколааа.pdf', '2020-12-07 12:09:45', '2020-12-07 12:09:45'),
(756, 203, 2, 'МАЛАКАЛИ ФУТБОЛЧИЛАРНИ ФАОЛИЯТИ ДАВОМИДА ЖАРОХАТЛАНИШ ХОЛАТЛАРИ ВА УНИ ОЛДИНИ ОЛИШ', 1, 5, 'маколлла.pdf', '2020-12-07 12:11:37', '2020-12-07 12:11:37'),
(757, 203, 2, 'ЖИСМОНИЙ ТАРБИЯ ФАНЛАРИНИ ЎҚИТИШДА ЯНГИ ИННОВАЦИОН ТЕХНОЛОГИЯЛАРДАН ФОЙДАЛАНИШ.', 1, 5, 'макола.pdf', '2020-12-07 12:12:48', '2020-12-07 12:12:48'),
(758, 203, 2, 'МУСОБАҚА ШАРОИТИДА МИНИ ФУТБОЛЧИЛАРНИНГ ЎЙИН ДАВОМИДАГИ ТЕХНИК ТАКТИК ХАРАКАТЛАРИНИ ЎРГАНИШ', 1, 5, 'макола.pdf', '2020-12-07 12:15:06', '2020-12-07 12:15:06'),
(759, 203, 1, 'ОММАВИЙ ФУТБОЛНИНГ СОҒЛОМЛАШТИРИШ ТАДБИРЛАРИДАГИ АХАМИЯТИ', 1, 3, 'макола.pdf', '2020-12-07 12:16:32', '2020-12-07 12:16:32'),
(760, 203, 2, 'СОҒЛОМ ТУРМУШ ТАРЗИ ВА УНИНГ ТАРКИБИДА МАҚСАДЛИ МАШҒУЛОТЛАР', 1, 5, 'макола.pdf', '2020-12-07 12:17:58', '2020-12-07 12:17:58'),
(761, 203, 2, 'МАЛАКАЛИ ФУТБОЛЧИЛАРНИ МУСОБАҚА ФАОЛИЯТИДА СПОРТ ФОРМАСИНИ ЮҚОРИ ДАРАЖАДА БЎЛИШИНИ ТАЪМИНЛАШ', 1, 5, 'мкола.pdf', '2020-12-07 12:19:34', '2020-12-07 12:19:34'),
(762, 203, 2, 'Футбол спорт турининг саломатликка таъсири', 1, 5, 'Ташхис газета.pdf', '2020-12-07 12:21:21', '2020-12-07 12:21:21'),
(763, 203, 2, 'УМУМИЙ ЎРТА ТАЪЛИМ МАКТАБЛАРИДА ЎҚУВЧИЛАРНИНГ САЛОМАТЛИГИНИ САҚЛАШ ВА МУСТАҲКАМЛАШДА СОҒЛОМ ТУРМУШ ТАРЗИНИНГ АҲАМИЯТИ', 1, 5, 'Умумий ўрта таълим.pdf', '2020-12-07 12:22:21', '2020-12-07 12:22:21'),
(764, 203, 2, 'УМУМТАЪЛИМ МАКТАБЛАРИДА ЁШ ФУТБОЛЧИЛАРНИ ТАЙЁРЛАШНИНГ ЎЗИГА ХОС ХУСУСИЯТЛАРИ', 1, 5, 'Умумтаълим мактаблари.pdf', '2020-12-07 12:23:20', '2020-12-07 12:23:20'),
(765, 203, 2, 'ӮСМИР ЁШДАГИ ФУТБОЛЧИЛАРНИНГ ЖИСМОНИЙ ТАЙЁРГАРЛИГИНИ ВА МУСОБАҚА ФАОЛИЯТИНИ НАЗОРАТ ҚИЛИШ', 1, 5, 'Ўсмир ёшдаги футболчилар.pdf', '2020-12-07 12:24:31', '2020-12-07 12:24:31'),
(766, 203, 2, 'ӮСМИР ЁШДАГИ ФУТБОЛЧИЛАРНИНГ ЖИСМОНИЙ ТАЙЁРГАРЛИГИНИ ВА МУСОБАҚА ФАОЛИЯТИНИ НАЗОРАТ ҚИЛИШ', 1, 5, 'Футболчиларни жт.pdf', '2020-12-07 12:25:33', '2020-12-07 12:25:33'),
(767, 203, 2, 'ФУТБОЛЧИЛАРНИ ИНДИВИДУАЛ ТЕХНИК – ТАКТИК ХАРАКАТЛАРИНИ МУСОБАҚА ШАРОИТИДА ЎРГАНИШ', 1, 5, 'Футболчиларни индивидуал.pdf', '2020-12-07 12:26:44', '2020-12-07 12:26:44'),
(768, 203, 2, 'ФУТБОЛЧИЛАРНИ ПСИХОЛОГИК ТАЙЁРГАРЛИГИНИНГ ВОСИТАЛАРИ', 1, 5, 'Футболчиларни психологик тайёргарлиги.pdf', '2020-12-07 12:27:54', '2020-12-07 12:27:54'),
(769, 203, 2, 'ФУТБОЛЧИ ҚИЗЛАРНИ ЎҚУВ МАШҒУЛОТ ЖАРАЁНИДА ТЕХНИК-ТАКТИК ТАЙЁРГАРЛИК САМАРАДОРЛИГИНИ ОШИРИШ', 1, 5, 'Футболчиларни ўқув машғулот жараёни.pdf', '2020-12-07 12:28:49', '2020-12-07 12:28:49'),
(770, 203, 2, 'ФУТБОЛЧИЛАРНИНГ ЖАМОАДАГИ ҲУЖУМ ҲАРАКАТЛАРИНИ ТАДҚИҚ ҚИЛИШ', 1, 5, 'Футболчиларнинг хужум харакати.pdf', '2020-12-07 12:29:38', '2020-12-07 12:29:38'),
(771, 203, 2, 'ЮҚОРИ МАЛАКАЛИ ФУТБОЛЧИЛАРНИ ТЕХНИК-ТАКТИК ХАРАКАТЛАРИ', 1, 5, 'Юқори малакали футболчилар.pdf', '2020-12-07 12:30:25', '2020-12-07 12:30:25'),
(772, 203, 2, 'ЮҚОРИ ТОИФАДАГИ ФУТБОЛЧИЛАРДА ТАЙЁРГАРЛИК ДАВРИДАГИ ЮКЛАМА ДИНАМИКАСИ ТАҲЛИЛИ', 1, 5, 'Юқори тоифадаги футболчилар.pdf', '2020-12-07 12:31:16', '2020-12-07 12:31:16'),
(773, 203, 1, 'УМУМИЙ ЎРТА ТАЪЛИМ МАКТАБЛАРИДА ЎҚУВЧИЛАРНИНГ САЛОМАТЛИГИНИ САҚЛАШ ВА МУСТАҲКАМЛАШДА СОҒЛОМ ТУРМУШ ТАРЗИНИНГ АҲАМИЯТИ', 2, 3, 'Исроилов Мирзакулов Пед институт.pdf', '2020-12-07 12:48:32', '2020-12-07 12:48:32'),
(774, 203, 2, 'БАРКАМОЛ АВЛОДНИ ЖИСМОНИЙ ТАРБИЯЛАШДА ОИЛА, МАКТАБ ВА МАХАЛЛА ХАМКОРЛИГИ', 1, 5, 'Мирзакулов А.pdf', '2020-12-07 12:54:57', '2020-12-07 12:54:57'),
(775, 203, 2, 'Ёш футболчиларнинг шахсий хусусиятларини ҳисобга олган ҳолда уларнинг техник-тактик тайёргарлигини такомиллаштириш', 1, 5, 'Фарход-Акром макола.pdf', '2020-12-07 12:57:36', '2020-12-07 12:57:36'),
(776, 203, 2, 'ДАСТЛАБКИ ЎРГАТИШ БОСҚИЧИДА 10-13 ЁШЛИ ФУТБОЛЧИЛАРНИ ЖИСМОНИЙ СИФАТЛАРИНИ ТАРБИЯЛАШ', 1, 5, 'Мирзакулов А.Г..pdf', '2020-12-07 13:00:15', '2020-12-07 13:00:15'),
(777, 172, 2, 'TERRORIZM BILAN BOG\'LIQ ATAMALARNING YURIDIK TAHLILI', 1, 5, '3-Maqola terrorizm.docx', '2020-12-07 14:06:01', '2020-12-07 14:06:01'),
(778, 265, 2, 'КОРРУПЦИЯГА ОИД ЖИНОЯТЛАРНИ ФОШ ЭТИШ  ВА ОЛДИНИ ОЛИШДА ТЕРГОВЧИ ВА ТЕЗКОР ХОДИМЛАРИНИНГ ЎЗАРО ҲАМКОРЛИГИ', 1, 5, 'Коррупция.docx', '2020-12-07 14:38:29', '2020-12-07 14:38:29'),
(779, 265, 2, 'КОРРУПЦИЯГА ОИД ЖИНОЯТЛАРНИ ФОШ ЭТИШ  ВА ОЛДИНИ ОЛИШДА ТЕРГОВЧИ ВА ТЕЗКОР ХОДИМЛАРИНИНГ ЎЗАРО ҲАМКОРЛИГИ', 1, 5, 'Коррупция.docx', '2020-12-07 14:38:29', '2020-12-07 14:38:29'),
(780, 265, 2, 'ЖИНОЯТЛАРНИ ФОШ ЭТИШ ҲАМДА ҚОНУНИЙЛИКНИ ТАЪМИНЛАНИШИДА ФУҚАРОЛАРНИНГ ИШТИРОКИ ВА МАЗКУР ВАЗИФАЛАРНИ БАЖАРИЛИШИДАГИ ФУҚАРОЛАРНИНГ ҲАМКОРЛИГИ МУАММОЛАРИ', 1, 5, 'Ҳамкорлик муаммолар.docx', '2020-12-07 14:39:29', '2020-12-07 14:39:29'),
(781, 265, 2, 'Терроризм-демократик жамиятимизнинг реал таҳдиди', 2, 5, '1-мақола.docx', '2020-12-07 14:41:30', '2020-12-07 14:41:30'),
(782, 265, 2, 'Жиноятларни фош этиш ҳамда қонунийликни таъминланишида фуқароларнинг иштироки ва мазкур вазифаларни бажарилишидаги фуқароларнинг ҳамкорлиги муаммолари', 1, 5, '2-мақола.docx', '2020-12-07 14:42:37', '2020-12-07 14:42:37'),
(783, 265, 2, 'Коррупцияга оид жиноятларни фош этиш ва олдини олишда терговчи ва тезкор ходимларнинг ўзаро ҳамкорлиги', 1, 5, '3-мақола.docx', '2020-12-07 14:43:25', '2020-12-07 14:43:25'),
(784, 265, 2, 'Қалбаки пул, акциз маркаси ёки қимматли қоғозлар ясаш ва уларни ўтказиш билан боғлиқ жиноятларни олдини олиш ва очишнинг ўзига хос хусусиятлари', 1, 5, '4-мақола.docx', '2020-12-07 14:44:04', '2020-12-07 14:44:04'),
(785, 265, 2, 'Тезкор-қидирув тадбирларини амалга ошириш давомида фуқаролар ва кўмаклашувчи шахсларни молиявий таъминланишида амалиётда юзага келадиган муаммолар', 1, 5, '5-мақола.docx', '2020-12-07 14:45:06', '2020-12-07 14:45:06'),
(786, 265, 2, 'Жамоат тартибини сақлаш, фуқаролар хавфсизлигини таъминлаш, жиноятларнинг олдини олиш ва фош этилишида тезкор ходимларнинг аҳлоқий ва касбий сифатлари', 1, 5, '6-мақола.docx', '2020-12-07 14:45:46', '2020-12-07 14:45:46'),
(787, 265, 2, 'Жиноятчиликка қарши кураш ва жиноятларнинг олдини олишда тезкор хизмат ходимлари ҳамда профилактика инспекторларининг ҳамкорлиги масалалари', 1, 5, '7-мақола.docx', '2020-12-07 14:46:42', '2020-12-07 14:46:42'),
(788, 113, 1, 'Место криминалистической характеристики в технологии расследования коррупционных преступлений', 1, 2, '1.jpg', '2020-12-07 20:59:07', '2020-12-07 20:59:07'),
(789, 113, 1, 'On the specific features of disclosure and investigation of cybercrimes', 1, 1, 'Статья  Матчанов на анг. 2020 гот.-2.doc', '2020-12-07 21:01:06', '2020-12-07 21:01:06'),
(790, 279, 1, 'Ўзбекистонда миграция соҳасидаги миллий қонунчиликни такомиллаштиришнинг ҳалқаро-ҳуқуқий зарурати', 1, 2, 'москва конф.jpg', '2020-12-08 06:40:05', '2020-12-08 06:40:05'),
(791, 279, 1, 'Some ideas on the regulation of migration processes', 1, 2, 'америка 2020.JPG', '2020-12-08 06:40:56', '2020-12-08 06:40:56'),
(792, 279, 1, 'International legal aspects of regulation of migration processes', 1, 2, 'укр 2020.JPG', '2020-12-08 06:42:05', '2020-12-08 06:42:05'),
(793, 279, 1, 'Theoretical basis of migration regulation', 1, 1, 'волгаград.JPG', '2020-12-08 06:43:44', '2020-12-08 06:43:44'),
(794, 279, 1, 'Some ideas on the regulation of migration processes', 1, 1, 'америка 2020.JPG', '2020-12-08 06:44:59', '2020-12-08 06:44:59'),
(795, 278, 1, 'Спортивнқй менеджмент в образавательнқх учереждениях', 1, 3, 'Scan10006.pdf', '2020-12-08 06:45:22', '2020-12-08 06:45:22'),
(796, 279, 1, 'International legal aspects of regulation of migration processes', 1, 2, 'халқаро 1.JPG', '2020-12-08 06:45:56', '2020-12-08 06:45:56'),
(797, 278, 1, 'Оздоровительных занятий по видам единоборств', 1, 3, 'Scan10009.pdf', '2020-12-08 06:48:50', '2020-12-08 06:48:50'),
(798, 278, 1, 'Спортивные соревнования и подготовка курашистов', 1, 3, 'Scan10012.pdf', '2020-12-08 06:50:33', '2020-12-08 06:50:33'),
(799, 279, 1, 'Ноқонуний миграция профилактикасини амалга оширишда ички ишлар органларининг жамоат тузилмалари билан ҳамкорлиги', 1, 3, 'ахб акад 2017 2.JPG', '2020-12-08 06:57:44', '2020-12-08 06:57:44'),
(800, 279, 1, 'Миграция жараёнлари: нималарга эътибор қаратиш керак?', 1, 3, 'хукук бурч 2018 10.JPG', '2020-12-08 06:59:00', '2020-12-08 06:59:00'),
(801, 279, 1, 'Миграция жараёнларини тартибга солишда ички ишлар органларининг жамоат тузилмалари билан ҳамкорлигининг ҳуқуқий жиҳатлари', 1, 3, 'одил судлов 2019 1.JPG', '2020-12-08 06:59:39', '2020-12-08 06:59:39'),
(802, 279, 1, 'Миграцияни тартибга солишда шахс ҳуқуқларини таъминлаш механизмлари: миллий ва хорижий тажриба', 1, 3, 'ахб Акад 2019 1.JPG', '2020-12-08 07:00:31', '2020-12-08 07:00:31'),
(803, 279, 1, 'Ноқонуний миграция тушунчасининг назарий-ҳуқуқий таҳлили', 1, 3, 'ахб МГ 2019 1 нок миг.JPG', '2020-12-08 07:01:09', '2020-12-08 07:01:09'),
(804, 279, 1, 'Ички ишлар ва Миллий гвардиянинг жамоат хавфсизлигини таъминлаш фаолияти: ҳамкорлигининг ҳуқуқий асослари ва янада такомиллаштириш йўллари', 2, 3, 'ахб 2 МГ 2019 1 хам.JPG', '2020-12-08 07:01:54', '2020-12-08 07:01:54'),
(805, 279, 1, 'Понятие, классификация, причины незаконной миграции как угрозы безопасности страны и их последствия', 1, 3, 'одил судлов русча.JPG', '2020-12-08 07:02:50', '2020-12-08 07:02:50'),
(806, 279, 1, 'Scientific-theoretical analysis of the regulation of migration process', 1, 3, 'демократлаштириш.JPG', '2020-12-08 07:08:37', '2020-12-08 07:08:37'),
(807, 279, 1, 'Миграция жараёнлари ва қонунийлик', 1, 3, 'хукук ва бурч 2019 3.JPG', '2020-12-08 07:09:15', '2020-12-08 07:09:15'),
(808, 278, 1, 'Роль оздоровительных,физкультурно спортивных мероприятий в укреплении здоровья населения', 2, 2, 'Scan10016.pdf', '2020-12-08 07:09:16', '2020-12-08 07:09:16'),
(809, 279, 1, 'Ўзбекистонда миграцияни тартибга солишда халқаро ҳуқуқий масалалар таҳлили', 1, 3, 'одил судлов 2019 10.JPG', '2020-12-08 07:10:00', '2020-12-08 07:10:00'),
(810, 279, 1, 'Миграция соҳасидаги миллий қонунчиликни такомиллаштириш зарурати', 1, 3, 'ахб акад 2020 1.JPG', '2020-12-08 07:10:33', '2020-12-08 07:10:33'),
(811, 279, 1, 'Ички ишлар органларида ички миграцияни таъминлаш  амалиёти', 1, 3, 'одил судлов 2020 8.JPG', '2020-12-08 07:11:17', '2020-12-08 07:11:17'),
(812, 279, 1, 'Жамоат хавфсизлигини таъминлашга оид ҳуқуқий асосларни такомиллаштириш', 2, 3, 'Мг 2020 1 хам жамоат.JPG', '2020-12-08 07:12:04', '2020-12-08 07:12:04'),
(813, 279, 1, 'Ички ишлар органларининг миграция соҳасидаги ҳамкорлиги', 1, 3, 'хукук ва бурч  2020 7.JPG', '2020-12-08 07:12:55', '2020-12-08 07:12:55'),
(814, 279, 2, 'Долзарб вазифалардан бири', 2, 8, 'қалкон 2018 12.GIF', '2020-12-08 07:13:50', '2020-12-08 07:13:50'),
(815, 279, 2, 'Долзарб вазифалардан бири', 2, 5, 'қалкон 2018 12.GIF', '2020-12-08 07:14:38', '2020-12-08 07:14:38'),
(816, 279, 2, 'Ноқонуний миграцини олдини олишда ҳуқуқй таълимнинг аҳамияти', 1, 5, 'конф хуку таълим.JPG', '2020-12-08 07:16:02', '2020-12-08 07:16:02'),
(817, 279, 2, 'Ноқонуний миграция профилактикаси – ички ишлар органлари фаолиятининг асосий йўналиши сифатида', 1, 5, 'конф ИИО 17 март.JPG', '2020-12-08 07:17:03', '2020-12-08 07:17:03'),
(818, 279, 2, 'Ҳуқуқбузарликлар профилактикаси ва жиноятчиликка қарши курашиш тизимини таъминлаш йўлида', 2, 5, 'кал 2017 7.JPG', '2020-12-08 07:17:54', '2020-12-08 07:17:54'),
(819, 279, 2, 'ноқонуний миграция профилактикасини таъминлашнинг ўзига ҳос хусусиятлари', 2, 5, 'конф ИИО 17 март.JPG', '2020-12-08 07:18:40', '2020-12-08 07:18:40'),
(820, 279, 2, 'Ташқи сиёсатда миграция жараёнларини тартибга солиш устувор йўналиш сифатида', 1, 5, 'стратегия 2018.JPG', '2020-12-08 07:19:14', '2020-12-08 07:19:14'),
(821, 279, 2, 'Коррупцияга қарши курашиш соҳасидаги қонун ҳужжатлар: коррупцияга оид ҳуқуқбузарликларни олдини олишнинг муҳим кафолати сифатида', 2, 5, 'конф корруп.JPG', '2020-12-08 07:20:02', '2020-12-08 07:20:02'),
(822, 278, 1, 'Курашчиларда техник усуллар', 1, 3, '2.pdf', '2020-12-08 07:20:03', '2020-12-08 07:20:03'),
(823, 279, 2, 'Ташқи сиёсатда миграция жараёнларини тартибга солиш масалалари терроризм ва экстремизмни олдини олишнинг муҳим йўналиши сифатида', 1, 5, 'конф терроризм.JPG', '2020-12-08 07:20:36', '2020-12-08 07:20:36'),
(824, 279, 2, 'Ноқонуний миграциянинг фуқаролар хавфсизлигига таҳдиди сифатида: тушунчаси, турлари, сабаблари ва унинг салбий оқибатлари', 2, 5, 'қалқон 2018 7.GIF', '2020-12-08 07:21:36', '2020-12-08 07:21:36'),
(825, 279, 2, 'Профилактика инспекторларининг миграция жараёнларига доир фаолиятини такомиллаштиришнинг ташкилий-ҳуқуқий жиҳатлари', 1, 5, 'проф конф.JPG', '2020-12-08 07:22:32', '2020-12-08 07:22:32'),
(826, 278, 1, 'Юнон-рим курашчиларини техника', 1, 3, '3.pdf', '2020-12-08 07:23:00', '2020-12-08 07:23:00'),
(827, 279, 2, 'Ўзбекистонда миграция жараёнларини тартибга солишни такомиллаштириш чоралари', 1, 5, 'миграция конф 2.JPG', '2020-12-08 07:23:21', '2020-12-08 07:23:21'),
(828, 279, 2, 'Миграция жараёнларини тартибга солишнинг ўзига хос жиҳатлари: миллий ва хорижий тажриба', 2, 5, 'миграция конф 1.JPG', '2020-12-08 07:23:52', '2020-12-08 07:23:52'),
(829, 279, 2, 'Ўзбекистонда миграцияни тартибга солишнинг конститциявий-ҳуқуқий жиҳатлари', 1, 5, 'конс конф 2019.JPG', '2020-12-08 07:24:31', '2020-12-08 07:24:31'),
(830, 279, 2, 'Ички ишлар органларининг миграция жараёнларини ҳуқуқий тартибга солиш механизмлари: муаммо ва ечимлари', 1, 5, 'норматив конф 2020.JPG', '2020-12-08 07:25:08', '2020-12-08 07:25:08'),
(831, 279, 2, 'Ички ишлар органларининг миграция жараёнларига доир амалиётини маъмурий-ҳуқуқий такомилаштириш истиқболари', 1, 5, 'маъмурий.JPG', '2020-12-08 07:25:41', '2020-12-08 07:25:41'),
(832, 278, 2, 'Курашчиларни тайёргарлигида жисмоний сифатлар', 1, 5, 'IMG_20160610_121121.pdf', '2020-12-08 08:05:17', '2020-12-08 08:05:17'),
(833, 172, 2, 'Ichki ishlar organlari tezkor bo\'linmalarining tog\'li hududlarda terrorizmga qarshi kurashishning o\'ziga xos xususiyatlariсусиятлари', 2, 5, 'yopiq kafedraning to\'plamiga.docx', '2020-12-08 09:05:23', '2020-12-08 09:05:23'),
(834, 278, 1, 'Повышения эффективности выполнение технико-тактических действий борцов греко-римского стиля', 1, 2, 'Scan10003.pdf', '2020-12-08 10:50:25', '2020-12-08 10:50:25'),
(835, 278, 1, 'Значения соревновательной деятельности на базовом этапе технико-тактической подготовки борцов', 1, 2, 'Scan10004.pdf', '2020-12-08 10:53:11', '2020-12-08 10:53:11'),
(836, 278, 1, 'Планирование учебно-тренировочного прцесса у боцов', 1, 2, 'Scan10005.pdf', '2020-12-08 10:56:54', '2020-12-08 10:56:54'),
(837, 278, 1, 'planing of traning process', 1, 2, 'Scan10012.pdf', '2020-12-08 11:00:14', '2020-12-08 11:00:14'),
(838, 278, 1, 'Курашчиларда техник усулларни ўргатиш услубиятини аниқлаш', 1, 3, 'Scan10023.pdf', '2020-12-08 11:07:41', '2020-12-08 11:07:41'),
(839, 278, 1, 'Планирование учебно-тренировачного процесса', 1, 3, 'Scan10024.pdf', '2020-12-08 11:10:39', '2020-12-08 11:10:39'),
(840, 278, 1, 'Повышения эффективности', 1, 2, 'Scan10025.pdf', '2020-12-08 11:11:37', '2020-12-08 11:11:37'),
(841, 278, 1, 'Курашчиларда техник усуллар', 1, 3, 'Scan10028.pdf', '2020-12-08 11:13:24', '2020-12-08 11:13:24'),
(842, 278, 1, 'Юнон-рим курашчиларининг техник усуллари', 1, 3, 'Scan10032.pdf', '2020-12-08 11:15:06', '2020-12-08 11:15:06'),
(843, 278, 1, 'Курашчининг тактик харакатлари самарадорлиги', 1, 3, 'Scan10033.pdf', '2020-12-08 11:17:34', '2020-12-08 11:17:34'),
(844, 278, 1, 'Жисмоний тарбия дарсларида тўгарак машғулотлари', 1, 3, 'IMG_20160628_155843.pdf', '2020-12-08 11:20:29', '2020-12-08 11:20:29'),
(845, 278, 1, 'Курашчи қизлар', 1, 3, 'IMG_20160628_155854.pdf', '2020-12-08 11:21:21', '2020-12-08 11:21:21'),
(846, 278, 1, 'Яккакураш спорт турлари', 1, 3, 'IMG_20160629_095204.pdf', '2020-12-08 11:22:59', '2020-12-08 11:22:59'),
(847, 278, 1, '8-10 ёшдеги спортчи қизлар', 1, 3, 'IMG_20160629_095228.pdf', '2020-12-08 11:24:01', '2020-12-08 11:24:01'),
(848, 278, 1, 'Жисмоний тарбия дарсларида', 1, 3, 'IMG_20160629_095259.pdf', '2020-12-08 11:25:14', '2020-12-08 11:25:14'),
(849, 278, 1, 'Курашчи қизларнинг машғулот жараёнида', 1, 3, 'IMG_20160629_095317.pdf', '2020-12-08 11:26:09', '2020-12-08 11:26:09'),
(850, 278, 1, 'Ёшлар тарбиясида жисмоний тарбиянинг ўрни', 1, 3, 'IMG_20160629_095329.pdf', '2020-12-08 11:27:27', '2020-12-08 11:27:27'),
(851, 278, 1, 'Юнон-рим курашчиларини махсус', 1, 3, 'IMG_20160629_095341.pdf', '2020-12-08 11:28:20', '2020-12-08 11:28:20'),
(852, 278, 1, 'Курашчиларда чаққонлик сифати', 1, 3, 'IMG_20160629_095354.pdf', '2020-12-08 11:29:11', '2020-12-08 11:29:11'),
(853, 278, 1, 'Курашчи-маънавий иродавий', 1, 3, 'IMG_20160629_095407.pdf', '2020-12-08 11:30:03', '2020-12-08 11:30:03'),
(854, 278, 1, 'Миллий кураш-ёшларда', 1, 3, 'IMG_20160629_095421.pdf', '2020-12-08 11:31:13', '2020-12-08 11:31:13'),
(855, 278, 1, 'Курашчиларда техник усуллар', 1, 3, '3.pdf', '2020-12-08 11:32:55', '2020-12-08 11:32:55'),
(856, 278, 1, 'Планирование учебно тренировачного процесса', 1, 2, '5.pdf', '2020-12-08 11:34:39', '2020-12-08 11:34:39'),
(857, 278, 1, 'Геометрия курсининг топологияга доир', 0, 3, '9.pdf', '2020-12-08 11:36:08', '2020-12-08 11:36:08'),
(858, 278, 1, 'Значения соревновательнқй', 1, 2, '4.pdf', '2020-12-08 11:37:40', '2020-12-08 11:37:40'),
(859, 278, 1, 'Партерда мураккаб харакатлар', 1, 3, '1.pdf', '2020-12-08 11:39:16', '2020-12-08 11:39:16'),
(860, 278, 1, 'Юнон-рум курашчиларини усулларини', 1, 3, '1.pdf', '2020-12-08 11:42:05', '2020-12-08 11:42:05'),
(861, 278, 1, 'Самарадорлик курашчилар', 1, 3, '1.pdf', '2020-12-08 11:42:58', '2020-12-08 11:42:58'),
(862, 278, 1, 'планирование тренировок', 1, 2, '1.pdf', '2020-12-08 11:45:01', '2020-12-08 11:45:01'),
(863, 278, 1, 'Курашчиларнинг тактик харакатлари самарадорлиги', 1, 3, '5.pdf', '2020-12-09 02:55:28', '2020-12-09 02:55:28'),
(864, 278, 1, 'Юнон-рим курашчиларини техник асослари', 1, 3, '9.pdf', '2020-12-09 02:56:11', '2020-12-09 02:56:11'),
(865, 278, 1, 'Курашчиларда техник усулларни ўргатиш', 1, 3, 'Scan10003.pdf', '2020-12-09 02:59:52', '2020-12-09 02:59:52'),
(866, 278, 1, 'Планирование учебно-тренировачного', 1, 3, '1.pdf', '2020-12-09 03:01:11', '2020-12-09 03:01:11'),
(867, 278, 1, 'Повышения эффективности', 1, 3, '2.pdf', '2020-12-09 03:01:49', '2020-12-09 03:01:49'),
(868, 278, 1, 'Соревновательый деятельность', 1, 3, '5.pdf', '2020-12-09 03:07:23', '2020-12-09 03:07:23'),
(869, 278, 1, 'Трениравчный процесс', 1, 3, '7.pdf', '2020-12-09 03:10:32', '2020-12-09 03:10:32'),
(870, 208, 1, 'НЕКОТОРЫЕ АСПЕКТЫ МЕХАНИЗМА ОБЕСПЕЧЕНИЯ ИСПОЛНЕНИЯ ЗАКОНОВ В ОРГАНАХ ВНУТРЕННИХ ДЕЛ РЕСПУБЛИКИ УЗБЕКИСТАН', 1, 1, 'Ипакфактор 1.jpg', '2020-12-09 04:11:56', '2020-12-09 04:11:56'),
(871, 208, 2, 'ИЧКИ ИШЛАР ОРГАНЛАРИДА ҚОНУНЛАР ИЖРОСИНИ ТАЪМИНЛАШ МЕХАНИЗМИНИНГ ЎЗИГА ХОС ХУСУСИЯТЛАРИ', 1, 4, 'Халқаро конф.jpg', '2020-12-09 04:14:28', '2020-12-09 04:14:28'),
(872, 227, 1, 'Миграцияни тартибга солишнинг ҳуқуқий такомиллаштириш', 1, 3, 'миграция конф 1.JPG', '2020-12-09 04:40:44', '2020-12-09 04:40:44'),
(873, 280, 2, 'Ichki ishlar organlarining uzoq muddatga xorijga ketgan va qaytib kelgan shaxslar bilan ishlash faoliyati', 1, 5, 'миграция конф 2.JPG', '2020-12-09 07:04:35', '2020-12-09 07:04:35'),
(874, 208, 1, 'Қонунлар ижросини таъминлашда ички ишлар органлари фаолияти самарадорлигини ошириш йўллари', 1, 3, '2017 й. 2-сон.jpg', '2020-12-09 07:17:24', '2020-12-09 07:17:24'),
(875, 208, 1, 'Коррупцияга қарши курашишга оид қонунлар ижросини таъминлаш ва амалга ошириш - устувор вазифа', 1, 3, '2019 й. 1-сон.jpg', '2020-12-09 07:19:38', '2020-12-09 07:19:38'),
(876, 208, 1, 'Ички ишлар органларида қонунлар ижросини таъминлаш механизминниг ҳозирги аҳволи ва долзарб масалалари', 1, 3, '2020 й. 2-сон Ахборотнома.jpg', '2020-12-09 07:21:33', '2020-12-09 07:21:33'),
(877, 232, 1, 'Евро-2004', 1, 2, 'photo_2020-12-09_11-33-10 (2).pdf', '2020-12-09 07:48:06', '2020-12-09 07:48:06'),
(878, 232, 1, 'Взаимосвязь футболисток', 1, 2, 'photo_2020-12-09_11-33-10.pdf', '2020-12-09 07:49:19', '2020-12-09 07:49:19'),
(879, 232, 1, 'Психологический контроль', 1, 2, 'photo_2020-12-09_11-33-12.pdf', '2020-12-09 07:50:14', '2020-12-09 07:50:14'),
(880, 232, 1, 'Квалифицированный футболисты', 1, 3, 'photo_2020-12-09_11-33-13.pdf', '2020-12-09 07:51:29', '2020-12-09 07:51:29'),
(881, 232, 1, 'Strengheng of pfysical', 1, 2, 'photo_2020-12-09_11-33-14.pdf', '2020-12-09 07:53:16', '2020-12-09 07:53:16'),
(882, 232, 1, 'Футболчиларни харакатлари', 1, 3, 'photo_2020-12-09_11-35-20.pdf', '2020-12-09 08:12:04', '2020-12-09 08:12:04'),
(883, 227, 1, 'Ички ишлар органлари тўғрисида”ги Ўзбекистон Республикаси қонуннинг қабул қилиниши – инсон манфаатларини таъминлашнинг муҳим ҳуқуқий кафолати.', 1, 3, 'конф ИИО 17 март.JPG', '2020-12-09 09:38:27', '2020-12-09 09:38:27'),
(884, 227, 1, 'Ҳуқуқбузарликлар профилактикаси ва жиноятчиликка қарши кураш тизимини янада такомиллаштириш йўлида', 2, 7, 'кал 2017 7.JPG', '2020-12-09 09:45:41', '2020-12-09 09:45:41'),
(885, 227, 1, 'Ҳуқуқбузарликлар профилактикасида самарали ҳамкорлик ва мувофиқлаштиришни таъминлашга оид маъмурий-ҳуқуқий ислоҳотлар', 1, 3, 'маъмурий.JPG', '2020-12-09 10:21:22', '2020-12-09 10:21:22'),
(886, 227, 1, 'Ҳуқуқбузарликлар профилактикаси ва жиноятчиликка қарши курашиш тизимини янада такомиллаштириш йўлида', 2, 3, 'кал 2017 7.JPG', '2020-12-09 10:26:31', '2020-12-09 10:26:31'),
(887, 227, 1, 'Ўзбекистон Республикасининг “Ички ишлар органлари тўғрисида”ги қонуни - тинчлик ва осойишталикни таъминлаш гарови.', 1, 3, '2016 4.pdf', '2020-12-09 10:47:30', '2020-12-09 10:47:30'),
(888, 227, 1, 'Ўзбекистон Республикаси Конституцияси - экстремизмга қарши курашнинг ҳуқуқий асосларини яратиш манбаи', 1, 3, '2018 махсус сон.pdf', '2020-12-09 10:50:57', '2020-12-09 10:50:57'),
(889, 227, 1, 'Фан, таълим ва амалиёт уйғунлигини таъминлаш жараёнлари', 1, 3, '2019 3.JPG', '2020-12-09 10:52:28', '2020-12-09 10:52:28'),
(890, 227, 1, 'Виктимологическая профилактика правонарушений в законодательства Республики Узбекистан', 2, 2, 'вестник.JPG', '2020-12-09 10:54:49', '2020-12-09 10:54:49'),
(891, 278, 1, 'Юнон-рим курашчиларини техник-тактик тай', 1, 3, 'Документ Microsoft Word.pdf', '2020-12-09 10:58:23', '2020-12-09 10:58:23'),
(892, 227, 1, 'Профессор Зарипов – человек с большой буквы и основатель криминологии в Узбекистане', 1, 2, 'Зарипов.З.С.pdf', '2020-12-09 11:04:20', '2020-12-09 11:04:20'),
(893, 278, 1, 'Юнон-рим курашчиларини тактик', 1, 3, 'Документ Microsoft Word.pdf', '2020-12-09 11:05:26', '2020-12-09 11:05:26'),
(894, 227, 1, 'Оиладаги зўравонлик ва у биан боғлиқ ҳуқуқбузарликлар профилактикаси', 2, 3, 'одил судлов.pdf', '2020-12-09 11:06:42', '2020-12-09 11:06:42'),
(895, 276, 1, 'жисмоний тарбия фаннинг талабаларини интеклектуал кобилиятларини ривожлантиршдаги ахамияти', 1, 3, '222.jpg', '2020-12-09 11:09:45', '2020-12-09 11:09:45'),
(896, 276, 1, 'болалар спортини ривожлантиришда жисмоний тарбия ва согломлаштириш машгулотларнинг ахамияти', 1, 3, '111.jpg', '2020-12-09 11:10:43', '2020-12-09 11:10:43'),
(897, 73, 1, 'Развитие юриспруденции как науки', 1, 2, 'Справка Проблемы науки.pdf', '2020-12-09 11:11:53', '2020-12-09 11:11:53'),
(898, 236, 1, 'Ёш футболчиларнинг жисмоний таёйргарлигини ошириш', 1, 3, 'Давлетова Нилуфар.docx', '2020-12-09 11:43:37', '2020-12-09 11:43:37'),
(899, 274, 1, 'Ўзбекистонда жисмоний тарбия ва спортни ривожлантириш', 1, 3, 'Зохид 1.pdf', '2020-12-10 04:02:27', '2020-12-10 04:02:27'),
(900, 274, 1, 'Жисмоний тарбия дарсларида таълим самарадорлиги', 1, 3, 'зохид 2.pdf', '2020-12-10 04:03:56', '2020-12-10 04:03:56'),
(901, 274, 1, 'Волейбол', 1, 3, 'зохид 3.pdf', '2020-12-10 04:04:56', '2020-12-10 04:04:56'),
(902, 280, 2, 'Ichki ishlar organlaridagi xizmatga qabul qilishning umumiy asoslari', 1, 5, 'Мақола.JPG', '2020-12-10 05:31:54', '2020-12-10 05:31:54'),
(903, 281, 1, 'RHETORIC IN THE ENGLISH AND UZBEK LANGUAGES', 2, 1, '2020 Rhetoric.pdf', '2020-12-10 05:48:46', '2020-12-10 05:48:46'),
(904, 281, 2, 'ИНГЛИЗ ТИЛИДАГИ ТЕРГОВ ТЕРМИНЛАРИНИНГ ЛИНВОКУЛЬТУРОЛОГИК ВА СЕМАНТИК ХУСУСИЯТЛАРИ', 1, 5, '2019 ЎзДЖТУ.pdf', '2020-12-10 06:02:29', '2020-12-10 06:02:29'),
(905, 281, 1, 'ИНГЛИЗ ТИЛИДАГИ ТЕРГОВГА ОИД ТЕРМИНЛАРНИНГ ЛИНВОКУЛЬТУРОЛОГИК ВА СЕМАНТИК ХУСУСИЯТЛАРИ', 1, 3, '2019 FLEDU.pdf', '2020-12-10 06:03:21', '2020-12-10 06:03:21'),
(906, 281, 2, 'ИНГЛИЗ ВА ЎЗБЕК ТИЛЛАРИ ТАРКИБИДА ОЗИҚ-ОВҚАТ КОМПОНЕНТЛИ МАҚОЛ ВА МАТАЛЛАР ХУСУСИДА', 1, 5, '2018 ТВТУ .pdf', '2020-12-10 06:04:32', '2020-12-10 06:04:32'),
(907, 281, 2, 'LINGUOCULTURAL AND SEMANTIC FEATURES OF LEGAL TERMS (on the material of inquiry terms)', 1, 4, 'Казахстан.pdf', '2020-12-10 06:07:37', '2020-12-10 06:07:37'),
(908, 83, 1, 'иновация ва замонавий ахборот технологиялари таълим тизимида сифат узгариши омили сифатида', 1, 3, '77.jpg', '2020-12-10 07:06:31', '2020-12-10 07:06:31'),
(909, 83, 1, 'спортнинг тараққий этиши ва халқаро спорт уюшмаларининг вужудга келиши', 1, 3, '99.jpg', '2020-12-10 07:07:46', '2020-12-10 07:07:46'),
(910, 83, 1, 'Жисмоний тарбия ва спорт мутахассислари компетентлигини таъминлаш масалалари', 1, 3, '1111.jpg', '2020-12-10 07:31:38', '2020-12-10 07:31:38'),
(911, 83, 1, 'о проблемах полового диморфизма в женском спорте', 2, 3, '2222.jpg', '2020-12-10 07:34:37', '2020-12-10 07:34:37');
INSERT INTO `old_maqolas` (`id`, `user_id`, `turi`, `mavzu`, `mualliflik`, `miqyosi`, `ilova`, `created_at`, `updated_at`) VALUES
(912, 83, 1, 'Ўзбекистонда жисмоний тарбия ва спорт ривожланишининг тарихий тараққиёт босқичлари', 1, 3, '3333.jpg', '2020-12-10 07:36:12', '2020-12-10 07:36:12'),
(913, 227, 1, 'Ҳуқуқбузарликлар барвақт профилактикасини назарий ва таълимий таъминлаш', 1, 3, 'Адлия ЮМОМ.JPG', '2020-12-10 11:25:00', '2020-12-10 11:25:00'),
(914, 227, 1, 'Профилактическая работа органов внут-ренних дел с несовершеннолетними', 1, 2, 'международ наука 2019.JPG', '2020-12-10 11:31:11', '2020-12-10 11:31:11'),
(915, 227, 1, 'Совершенствование системы управления органов внутренних дел – гарант эффек-тивной организации их деятельности.', 1, 2, '2019 4-6 сен между.JPG', '2020-12-10 12:00:19', '2020-12-10 12:00:19'),
(916, 227, 0, 'Амир Темур салтанати ва бугунги Ўзбекистонда халқ манфаат ва мурожаатлари:', 2, 0, '2017 1.JPG', '2020-12-10 12:02:35', '2020-12-10 12:02:35'),
(917, 227, 1, 'Амир Темур салтанати ва бугунги Ўзбекистонда халқ манфаат ва мурожаатлари:', 2, 3, '2017 1.JPG', '2020-12-10 12:04:33', '2020-12-10 12:04:33'),
(918, 227, 1, 'Эффективная система охраны общественного порядка и безопасности, профилактики правонарушений, обеспечения борьбы с преступностью и её перспективы.', 1, 3, '2019 махс.JPG', '2020-12-10 12:07:13', '2020-12-10 12:07:13'),
(919, 227, 1, 'Ички ишлар органлари тизимида инновацион ғояларни ҳуқуқий таъминлаш', 1, 3, 'Уз-А ОА.JPG', '2020-12-10 13:38:49', '2020-12-10 13:38:49'),
(920, 83, 1, 'мусобақа даврида футболчиларни техник-тактик харакатлар самарадорлигини ошириш', 1, 3, '11.jpg', '2020-12-11 04:29:35', '2020-12-11 04:29:35'),
(921, 83, 1, 'Болалар ва ўсмирлар спортини ривожлантириш муаммолари ва истиқболлари', 1, 3, '11.jpg', '2020-12-11 04:47:32', '2020-12-11 04:47:32'),
(922, 83, 1, 'Спорт-Баркамол авлодни тарбиялашнинг муҳим воситаси', 1, 3, '11.jpg', '2020-12-11 04:57:37', '2020-12-11 04:57:37'),
(923, 283, 2, 'ЙТҲ ва унинг олдини олиш чоралари', 1, 5, '2015 автохамроҳ.pdf', '2020-12-11 06:27:12', '2020-12-11 06:27:12'),
(924, 283, 2, 'Автомобилингизни техник кўрикдан ўтказдинггизми?', 1, 5, 'макола 2010.pdf', '2020-12-11 06:29:51', '2020-12-11 06:29:51'),
(925, 234, 1, 'Improvement of the legal regulation system of tort relations  with the participation of internal affairs organs', 1, 3, 'ЧИКДИ-2020й.253-Текст статьи-939-1-10-20201112.pdf', '2020-12-11 10:54:55', '2020-12-11 10:54:55'),
(926, 234, 1, 'СОВЕРШЕНСТВОВАНИЕ СИСТЕМЫ ПРАВОВОГО  РЕГУЛИРОВАНИЯ ДЕЛИКТНЫХ ОТНОШЕНИЙ  ПРИ УЧАСТИИ ОРГАНОВ ВНУТРЕННИХ ДЕЛ', 1, 2, 'Право и жизнь.docx', '2020-12-11 11:07:12', '2020-12-11 11:07:12'),
(927, 234, 1, 'IIO ishtirokidagi delikt munosabatlarni huquqiy tartibga solish', 1, 3, 'Миллий гвардия.docx', '2020-12-11 11:22:59', '2020-12-11 11:22:59'),
(928, 234, 1, 'СОВЕРШЕНСТВОВАНИЕ СИСТЕМЫ   ПРАВОВОГО РЕГУЛИРОВАНИЯ   ДЕЛИКТНЫХ ОТНОШЕНИЙ ПРИ УЧАСТИИ   ОРГАНОВ ВНУТРЕННИХ ДЕЛ   В РЕСПУБЛИКЕ УЗБЕКИСТАН', 2, 2, 'Чикди.Камалов, Кулдашев.pdf', '2020-12-11 11:28:08', '2020-12-11 11:28:08'),
(929, 234, 2, 'ҲУҚУҚБУЗАРЛИКЛАР ОҚИБАТИДА ЕТКАЗИЛГАН ЗАРАРНИ  ҚОПЛАШНИ ҲУҚУҚИЙ АСОСЛАРИНИ ТАКОМИЛЛАШТИРИШ', 1, 4, 'Акад конф. Word (2).docx', '2020-12-11 11:34:45', '2020-12-11 11:34:45'),
(930, 172, 2, 'Ichki ishlar organlari tezkor bo\'linmalarining tog\'li hududlarda terrorizmga qarshi kurashishning o\'ziga xos xususiyatlari', 1, 5, 'yopiq kafedraning to\'plamiga.docx', '2020-12-12 07:36:47', '2020-12-12 07:36:47'),
(931, 172, 2, 'IIOlarining tog\'li va chegara hududlardagi tezkor bo\'linmalarining terrorizmga qarshi kurashishini takomillashtirish', 1, 5, 'тқф кафедраси мақолалар тўпламига.docx', '2020-12-12 07:39:13', '2020-12-12 07:39:13'),
(932, 172, 2, 'TERRORIZM BILAN BOG\'LIQ ATAMALARDA SHAXS VA INSON OMILI TUSHUNCHALARINING O\'ZIGA XOSLIGI', 1, 4, '6-Maqola terrorizm инсон хукуклари.docx', '2020-12-12 08:16:05', '2020-12-12 08:16:05'),
(933, 73, 1, 'Совершенствование правового воспитания в Узбекистане - требование времени', 1, 2, 'СОВЕРШЕНСТВОВАНИЕ ПРАВОВОГО ВОСПИТАНИЯ В УЗБЕКИСТАНЕ.pdf', '2020-12-12 09:01:06', '2020-12-12 09:01:06'),
(934, 73, 1, 'ХХ аср бошларида Туркистон ўлкаси сиёсий партиялари дастурларида илм-маърифатни ривожлантириш ғояларининг акс этиши', 1, 3, 'макола ПДФ УзА.pdf', '2020-12-12 09:06:13', '2020-12-12 09:06:13'),
(935, 79, 1, 'Малакали дзцдочиларнинг мусобақа давридаги хужум самарасини машғулотлар даврида ошириш омилларини аниқлаш', 1, 3, '1.jpg', '2020-12-12 11:24:52', '2020-12-12 11:24:52'),
(936, 79, 1, 'Ҳалқаро тероризмнинг криминологик тавсифи ва унинг профилактикаси', 1, 3, '5.jpg', '2020-12-12 11:28:56', '2020-12-12 11:28:56'),
(937, 79, 1, 'Об особенностях криминалистической тактики задержаниея лица, совершившего преступление', 1, 3, '5.jpg', '2020-12-12 11:30:36', '2020-12-12 11:30:36'),
(938, 79, 1, 'Болалар харакат кўникмаларини миллий харакатли ўйинлар орқали ривожлантириш', 1, 3, '4.jpg', '2020-12-12 11:31:37', '2020-12-12 11:31:37'),
(939, 79, 1, 'Оммавий ахборот воситаларининг шахс маънавий тарбиясига таъсири', 1, 3, '3.jpg', '2020-12-12 11:32:41', '2020-12-12 11:32:41'),
(940, 79, 1, 'гиёҳвандлик воситалари билан қонунга ҳилоф равишда муомала қилишнинг олдини олиш масалалари', 1, 3, '2.jpg', '2020-12-12 11:34:18', '2020-12-12 11:34:18'),
(941, 250, 1, 'Suisidal xulq-atvir va uning oldini olish muammolari', 2, 3, 'Слайд1.JPG', '2020-12-12 11:39:11', '2020-12-12 11:39:11'),
(942, 250, 1, 'Ichki ishlar organlari tizimida psixologik xizmatni tashkil etishning metodologik asoslari', 2, 3, '14.02.2020.ppt', '2020-12-12 11:54:39', '2020-12-12 11:54:39'),
(943, 250, 1, 'nikoh oldi omillari va ularning oila mustahkamligiga ta\'siri', 2, 7, '24.05.2020.ppt', '2020-12-12 12:12:38', '2020-12-12 12:12:38'),
(944, 79, 1, 'Ички ишлар органлари ходимлари ўртасида коррупцияга қарши кураш юзасидан айрим мулоҳазалар', 2, 3, '2.jpg', '2020-12-12 12:28:37', '2020-12-12 12:28:37'),
(945, 234, 1, 'Delikt munosabatlarda IIOning ishtiroki', 1, 3, 'CamScanner 09-12-2020 09.06.37.pdf', '2020-12-14 04:20:58', '2020-12-14 04:20:58'),
(946, 285, 2, 'Ҳуқуқни амалга ошириш самарадорлигига таъсир қилувчи омиллар', 1, 4, 'Хориж маыола.pdf', '2020-12-14 04:23:49', '2020-12-14 04:23:49'),
(947, 285, 2, 'Конституциявий ҳуқуқий муносабатларнинг хусусиятлари', 1, 5, '3kh toplam.pdf', '2020-12-14 04:29:27', '2020-12-14 04:29:27'),
(948, 108, 1, 'Ўзбекистоннинг ижтимоий зиддиятларни бартараф этиш тажрибаси', 1, 3, 'пед унверстет.pdf', '2020-12-14 04:39:40', '2020-12-14 04:39:40'),
(949, 108, 1, 'CONFLICTOLOGY: CURRENT STATE AND DEVELOPMENT PROSPECTS', 1, 1, '2_5442796695970644969.pdf', '2020-12-14 04:43:54', '2020-12-14 04:43:54'),
(950, 108, 1, 'Низоларнинг келиб чиқиш сабаблари', 1, 3, 'қорақалпоқ 2.pdf', '2020-12-14 04:47:17', '2020-12-14 04:47:17'),
(951, 285, 2, 'Ҳуқуқни амалга ошириш механизми', 1, 5, '9 iio nhh itm bhi.pdf', '2020-12-14 05:00:00', '2020-12-14 05:00:00'),
(952, 108, 1, 'К ВОПРОСУ О ВОЗНИКНОВЕНИИ КОНФЛИКТОЛОГИИ', 1, 1, 'Қозоқ журнал-конвертирован.doc', '2020-12-14 05:07:03', '2020-12-14 05:07:03'),
(953, 108, 1, 'конфиктология ғояларини шаклланиши', 1, 3, 'Ҳуқуқ ва фалсафа.pdf', '2020-12-14 05:09:08', '2020-12-14 05:09:08'),
(954, 108, 1, 'Жамиятда конфликтологиянинг ўрни....', 1, 3, 'урганч 1.JPG', '2020-12-14 05:10:29', '2020-12-14 05:10:29'),
(955, 108, 1, 'Диний-экстремистик  гуруҳларнинг бирлашув омиллари', 2, 7, '2018-Мухамедов У.Х.-Оилалардаги зуравонлик Илмамконфтупл.doc', '2020-12-14 05:28:07', '2020-12-14 05:28:07'),
(956, 108, 2, 'Диний-экстремистик  гуруҳларнинг бирлашув омиллари', 2, 5, '2018-Мухамедов У.Х.-Оилалардаги зуравонлик Илмамконфтупл.doc', '2020-12-14 05:28:52', '2020-12-14 05:28:52'),
(957, 108, 1, 'ЖАМИЯТДА ЗИДДИЯТНИНГ РОЛИ', 1, 3, '2019 Наманган-конвертирован.docx', '2020-12-14 07:52:55', '2020-12-14 07:52:55'),
(958, 108, 2, 'Абу Наср Форобийнинг зиддиятларга оид қарашлари.', 1, 5, 'Наманган 2018 (1).docx', '2020-12-14 08:18:19', '2020-12-14 08:18:19'),
(959, 72, 1, 'Значение криминалистической характеристики в обеспечении фиксации дорожно-транспортных происшествий', 1, 2, 'photo_2020-10-31_13-01-47.jpg', '2020-12-14 08:27:56', '2020-12-14 08:27:56'),
(960, 73, 1, 'Туркистон сиёсий партиялари дастурларида давлат мустақиллиги тўғрисидаги ғояларнинг ифодаланиши', 1, 3, 'Нукус Ахборотнома.pdf', '2020-12-14 08:33:48', '2020-12-14 08:33:48'),
(995, 289, 1, 'Ҳуқуқбузарликлар виктимологик профилактикасига оид таълимотларнинг пайдо бўлиши ва ривожланиш босқичлари', 1, 3, 'автореф.№5..pdf', '2020-12-15 06:50:02', '2020-12-15 06:50:02'),
(996, 289, 1, 'Фирибгарлик жиноятининг сабаб-шароитлари, усуллари виктимологик профилактикасига оид айрим масалалар', 1, 3, 'автореф.№6..pdf', '2020-12-15 06:51:48', '2020-12-15 06:51:48'),
(997, 289, 1, 'Ҳуқуқбузарликлар виктимологик профилактикасининг моҳияти', 1, 3, 'автореф.№7..pdf', '2020-12-15 06:54:24', '2020-12-15 06:54:24'),
(998, 289, 1, '. Коррупцион ҳуқуқбузарликларни келтириб чиқарувчи виктим омиллар таҳлили ҳамда виктимологик профилактикасини такомиллаш¬тириш масалалари', 1, 3, 'автореф.№8..pdf', '2020-12-15 06:56:02', '2020-12-15 06:56:02'),
(999, 289, 2, 'Analysis of concepts associated with victimization // Ички ишлар органларида норматив-ҳуқуқий ҳужжатларнинг ижросини таъминлаш механизми: бугунги ҳолати ва истиқболлари', 1, 5, 'автореф.№11..pdf', '2020-12-15 07:00:59', '2020-12-15 07:00:59'),
(1000, 289, 2, 'Ички ишлар органлари томонидан ҳуқуқбузарлик-лардан жабрланган шахслар ўртасида суициднинг виктимологик профилакти-касини ташкил этиш', 1, 5, 'автореф.№12..pdf', '2020-12-15 07:01:49', '2020-12-15 07:01:49'),
(1001, 289, 1, 'Ҳуқуқбузарликларнинг виктимологик профилактикаси тушунчаси билан боғлиқ айрим масалаларнинг илмий таҳлили', 2, 7, 'автореф.№13..pdf', '2020-12-15 07:03:55', '2020-12-15 07:03:55'),
(1002, 289, 1, 'Виктимологическая профилактика правонарушений в законодательстве Республики Узбекистана', 2, 2, 'автореф.№14..pdf', '2020-12-15 07:05:00', '2020-12-15 07:05:00'),
(1003, 289, 2, 'Ҳуқуқбузарликлар виктимологик профилактикаси чора-тадбирлари', 2, 5, 'автореф.№15.pdf', '2020-12-15 07:05:54', '2020-12-15 07:05:54'),
(1004, 289, 2, 'Вояга етмаганлар фоҳишалигининг сабаб-шароитлари ва профилактикаси', 2, 5, 'автореф.№16..pdf', '2020-12-15 07:06:40', '2020-12-15 07:06:40'),
(1005, 289, 2, 'Ҳуқуқбузарликлар виктимологик профилактикасини ташкил этишдаги муаммолар ҳамда уларнинг ечимлари', 2, 5, 'автореф.№17..pdf', '2020-12-15 07:07:32', '2020-12-15 07:07:32'),
(1006, 289, 2, 'Оила-турмуш доирасидаги ҳуқуқбузар¬ликлар сабаб-шароитлари ва профилактикаси', 2, 5, 'автореф.№18..pdf', '2020-12-15 07:08:18', '2020-12-15 07:08:18'),
(1007, 289, 2, 'Виктимлик билан боғлиқ тушунчалар ҳамда уни келтириб чиқарувчи омилларнинг илмий ва қиёсий таҳлили', 2, 5, 'автореф.№18..pdf', '2020-12-15 07:09:03', '2020-12-15 07:09:03'),
(1008, 289, 2, 'Ички ишлар органлари томонидан шахсни ҳуқуқбузарликдан жабрланишига олиб келувчи омилларни ўрганишнинг аҳамияти', 2, 5, 'автореф.№20..pdf', '2020-12-15 07:11:13', '2020-12-15 07:11:13'),
(1009, 62, 1, 'НЕКОТОРЫЕ АСПЕКТЫ ИСПОЛЬЗОВАНИЯ КРИМИНАЛИСТИЧЕСКИХ УЧЕТОВ В РАСКРЫТИИ И РАССЛЕДОВАНИИ ПРЕСТУПЛЕНИЙ', 1, 2, 'Безымянный.png', '2020-12-15 07:32:03', '2020-12-15 07:32:03'),
(1010, 62, 2, 'ДУХОВНОСТЬ - ОСНОВА АНТИКОРРУПЦИОННОГО ПОВЕДЕНИЯ СОТРУДНИКОВ ОРГАНОВ ВНУТРЕННИХ ДЕЛ', 1, 5, 'ШЕР 1.png', '2020-12-15 08:07:33', '2020-12-15 08:07:33'),
(1011, 65, 1, 'Ўзбекистонда тадбиркорлик фаолиятнинг ҳуқуқий ҳолати ва ривожланиш истиқболлари', 2, 3, 'Axborotnoma-2010-03 Узбекистонда тадбиркорлик фаолияти-разблокирован-страницы-1-2,43-50.pdf', '2020-12-15 09:37:28', '2020-12-15 09:37:28'),
(1012, 64, 1, 'Комплекс экспертиза тушунчасини такомиллаштириш борасида айрим фикрлар', 1, 3, 'ИНОФАЦИЯ  КОМПЛЕКС ЭКСПЕРТИЎЗАСИ ТАКОМИЛЛАШТИРИШ .pdf', '2020-12-15 15:24:17', '2020-12-15 15:24:17'),
(1013, 64, 2, 'Одамни уриб юбориш изларини бошқа объектларни уриб юбориш изларидан фарқлаш', 1, 4, '33 001 Одамни уриб юбориш .jpg', '2020-12-15 15:28:56', '2020-12-15 15:28:56'),
(1014, 64, 2, 'Трасологическая экспертиза и ёе роль ДТП', 1, 4, '4 001Трасологический экспертиза  .jpg', '2020-12-15 15:33:19', '2020-12-15 15:33:19'),
(1015, 64, 2, 'СУД КОМПЛЕКС ЭКСПЕРТИЗАСИ БЎЙИЧА АЙРИМ ФИКРЛАР', 1, 4, '4 001Суд комплекс экспертизаси бўйича айрим фикрлар.jpg', '2020-12-15 15:39:12', '2020-12-15 15:39:12'),
(1016, 64, 1, 'ЙТХни тергов қилишда трасологик экспертизанинг имкониятлари', 1, 3, '555 001ЙТХ ТЕРГОВ ҚИЛИШДА ТАСОЛОГИК ЭКСПЕРТИЗАНИНГ ИМКОНИЯТЛАРИ .jpg', '2020-12-15 15:44:25', '2020-12-15 15:44:25'),
(1017, 64, 1, 'ТРАНСПОРТ ВОСИТАЛАРИ ТЎҚНАШУВИ ТРАСОЛОГИК ТАДКИҚОТЛАРИНИНГ ХУСУСИЯТЛАРИ', 1, 3, '3 001 ТРАНСПОРТ ВОСИТАЛАРИ ТЎҚНАШУВИ ТРАСОЛОГИК ТАДКИҚОТЛАРИНИНГ ХУСУСИЯТЛАРИ .jpg', '2020-12-15 15:48:25', '2020-12-15 15:48:25'),
(1018, 64, 2, 'ЙТХ пайтида жабрланувчини харакатда ёки ҳаракатсиз бўлганлигини аниқлаш', 1, 4, '33 001ЙТХ пайтида жабрланувчини ҳаракатда ёки ҳаракатсиз бўлганлигини аниқлаш .jpg', '2020-12-15 15:53:43', '2020-12-15 15:53:43'),
(1019, 64, 1, '“Тик турган ҳолатдаги пиёдани уриб юборишда енгил автомобилларда излар ҳосил бўлишининг қонуниятлари” номли илмий мақола', 1, 3, '2 001“Тик турган ҳолатдаги пиёдани уриб юборишда енгил автомобилларда излар ҳосил бўлишининг қонуниятлари” номли илмий мақола .jpg', '2020-12-15 15:56:34', '2020-12-15 15:56:34'),
(1020, 64, 1, 'Янги методик тавсиялар суд-экспертлик фаолиятига татбиқ қилиш масаласи', 1, 3, '33 001 Янги методик тавсиялар суд-экспертлик фаолиятига татбиқ қилиш масаласи .jpg', '2020-12-15 16:00:22', '2020-12-15 16:00:22'),
(1021, 65, 1, 'Тадбиркорларни ижтимоий-ҳуқуқий ҳимоя қилиш – мамлакат ижтимоий-иқтисодий тараққиётининг гарови', 2, 3, 'Axborotnoma-2011-01-разблокирован-страницы-1-2,22-25.pdf', '2020-12-16 03:57:49', '2020-12-16 03:57:49'),
(1022, 65, 1, 'Мамлкатимизда қулай инвестицион муҳитнинг иқтисодий тараққиёт омили эканлиги', 2, 3, 'Axborotnoma-2015-01 (3).pdf', '2020-12-16 04:22:02', '2020-12-16 04:22:02'),
(1023, 65, 2, 'Давлатнинг ижтимиоий сиёсатида солиқларнинг тутган ўрни', 1, 5, 'Ижтим сиёсат.doc', '2020-12-16 04:23:57', '2020-12-16 04:23:57'),
(1024, 65, 2, '“Баркамол авлод йили” давлат Дастури мамлакат ижтимоий-иқтисодий хавфсизлигини мустаҳкамлаш омили сифатида', 2, 5, 'Баркамол авлод.doc', '2020-12-16 04:25:54', '2020-12-16 04:25:54'),
(1025, 65, 2, 'Мустаҳкам оила – барқарорлик ва хавфсизлик гаровидир', 2, 5, 'Мустахкам оила.doc', '2020-12-16 04:27:59', '2020-12-16 04:27:59'),
(1026, 65, 2, 'Мамлакат иқтисодиётида инвестицияларнинг ўрни', 2, 5, 'Инвестиция.doc', '2020-12-16 04:36:41', '2020-12-16 04:36:41'),
(1027, 65, 2, 'Глобаллашув шароитида инсон капитали – хавфсизлик ва тараққиёт гарови', 1, 5, 'Инсон капитали.doc', '2020-12-16 04:38:31', '2020-12-16 04:38:31'),
(1028, 233, 1, 'ЁШ ФУТБОЛЧИЛАРНИ ЖИСМОНИЙ ТАЙЁРГАРЛИГИНИ БАХОЛАШ', 1, 3, 'photo_2020-12-16_10-48-49.pdf', '2020-12-16 05:47:16', '2020-12-16 05:47:16'),
(1029, 99, 1, 'Коррупция', 2, 3, 'photo_2020-12-16_11-29-28.pdf', '2020-12-16 06:26:37', '2020-12-16 06:26:37'),
(1030, 99, 1, 'коррупция', 2, 3, 'photo_2020-12-16_11-29-28.pdf', '2020-12-16 06:27:27', '2020-12-16 06:27:27'),
(1031, 153, 2, 'Автомобиль транспорти инсон ва табиатга салбий таъсири', 2, 5, '2222.pdf', '2020-12-16 09:25:03', '2020-12-16 09:25:03'),
(1032, 153, 2, 'Ҳарбий хизматчилар томонидан хизмат билан боғлиқ маъмурий, жиноий қилмиш содир этилса махсус субъект сифатида ҳуқуқий баҳоланиши.', 2, 5, '3333.pdf', '2020-12-16 09:34:17', '2020-12-16 09:34:17'),
(1033, 153, 2, 'Йўл-патруль хизмати ходимлари йул ҳаракати қатнашчилари билан ўзаро муносабатлари.', 0, 5, '4444.pdf', '2020-12-16 09:37:13', '2020-12-16 09:37:13'),
(1034, 197, 1, 'Ички ишлар идоралари ходимларининг тафаккур маданияти', 1, 3, '200158600570_123338.jpg', '2020-12-17 06:32:35', '2020-12-17 06:32:35'),
(1035, 197, 1, 'Мантиқ қонунлари-Ички ишлар органлари ходимлари тафаккур маданиятини юксалтиришнинг муҳим омили', 1, 3, '200092200963_324382.jpg', '2020-12-17 06:34:38', '2020-12-17 06:34:38'),
(1036, 197, 1, 'Ҳуқуқий саводхонликни ошириш-ёшлар ҳуқуқий онги ва ҳуқуқий маданиятини юксалтиришнинг муҳим омили', 1, 3, '200099100597_311394.jpg', '2020-12-17 06:36:48', '2020-12-17 06:36:48'),
(1037, 197, 1, 'Тарихий хотира ва ёшлар тарбияси', 1, 3, '200099400928_309836.jpg', '2020-12-17 06:37:35', '2020-12-17 06:37:35'),
(1038, 197, 1, 'Ҳуқуқий тарбия ёшлар ҳуқуқий онги ва маданиятини юксалтиришнинг муҳим омили', 1, 2, '200114900176_257531.jpg', '2020-12-17 06:39:13', '2020-12-17 06:39:13'),
(1039, 197, 1, 'Социологический анализ правовой культуры молодёжи-веления времени', 1, 2, '200117400370_264438.jpg', '2020-12-17 06:42:12', '2020-12-17 06:42:12'),
(1040, 197, 1, 'Оилада ғоявий тарбия', 1, 3, '200117400508_264269.jpg', '2020-12-17 06:43:02', '2020-12-17 06:43:02'),
(1041, 197, 1, 'Ёшлар бандлигини таьминлаш-ҳуқуқий онг ва маданиятни юксалтириш омили: илғор хорижий тажриба', 1, 3, '200123400656_267763.jpg', '2020-12-17 06:44:56', '2020-12-17 06:44:56'),
(1042, 98, 1, 'Йўл - транспорт ҳодисаларини олдини олиш учун яна бир қадам', 2, 3, 'макола  Ш.Ш.Ризаев, Сайидов.doc', '2020-12-17 09:26:00', '2020-12-17 09:26:00'),
(1043, 98, 2, 'Йўл ҳаракати хавфсизлиги тўғрисидаги янги тахрирдаги конунимиз амалда', 1, 5, 'макола Калкон Ризаев.doc', '2020-12-17 09:27:14', '2020-12-17 09:27:14'),
(1044, 291, 2, 'Konstitutsiya-islohotlarning muhim poydevori', 1, 5, 'New_Doc_2020-12-21_11.45.04[1].pdf', '2020-12-21 07:00:39', '2020-12-21 07:00:39'),
(1045, 291, 2, 'Korrupsiya-taraqqiyot zavoli', 2, 5, 'New_Doc_2020-12-21_11.45.04_2[1].pdf', '2020-12-21 07:38:07', '2020-12-21 07:38:07'),
(1046, 291, 2, 'Qonun ijodkorligi jarayoni hususida ayrim mulohazalar', 1, 5, 'New_Doc_2020-12-21_11.45.04_3[1].pdf', '2020-12-21 07:40:30', '2020-12-21 07:40:30'),
(1047, 291, 1, 'Huquq shakli (manbai) tushunchasi va turlari', 1, 7, 'New_Doc_2020-12-21_11.45.04_4[1].pdf', '2020-12-21 08:19:38', '2020-12-21 08:19:38'),
(1048, 291, 1, 'Huquq shakli (manbai) tushunchasi va turlari', 1, 3, 'New_Doc_2020-12-21_11.45.04_4[1].pdf', '2020-12-21 08:21:11', '2020-12-21 08:21:11'),
(1049, 236, 1, 'Сравнительная оценка физического развития', 1, 3, '12.jpg', '2020-12-21 10:03:16', '2020-12-21 10:03:16'),
(1050, 196, 2, 'Убайдулла Таджиханов как руководитель', 1, 6, '1.pdf', '2020-12-22 09:16:31', '2020-12-22 09:16:31'),
(1051, 196, 2, 'Он как опытный руководитель', 1, 6, '200111600159_265405.jpg', '2020-12-22 09:22:41', '2020-12-22 09:22:41'),
(1052, 146, 2, 'Судга қадар иш юритиш босқичида жиноятларни олдини', 1, 5, 'копия.docx', '2020-12-22 11:42:52', '2020-12-22 11:42:52'),
(1053, 146, 2, 'Фирибгарлик жиноятларини квалификация қилиш хусусиятлари', 1, 5, 'копия.docx', '2020-12-22 11:48:50', '2020-12-22 11:48:50'),
(1054, 146, 2, 'КОРРУПЦИЯГА ҚАРШИ КУРАШНИНГ ИЖТИМОИЙ ВА', 1, 5, 'копия.docx', '2020-12-22 11:53:10', '2020-12-22 11:53:10'),
(1055, 146, 2, 'Жиноят ҳуқуқида хато ва унинг жиноят-ҳуқуқий таҳлили', 2, 5, 'копия.docx', '2020-12-22 11:56:12', '2020-12-22 11:56:12'),
(1056, 146, 2, 'Фирибгарлик жиноятларини сабаб ва шароитларини ҳамда уларни олдини олиш чоралари', 2, 5, 'копия.docx', '2020-12-22 12:19:45', '2020-12-22 12:19:45'),
(1057, 146, 2, 'ФИРИБГАРЛИКНИНГ КРИМИНАЛИСТИК ТАВСИФИ', 1, 5, 'копия.docx', '2020-12-22 12:23:32', '2020-12-22 12:23:32'),
(1058, 146, 1, 'Уголовно-правовые характеристика мошшеничество, как особой формы хищения чужого иммущества', 1, 3, 'копия.docx', '2020-12-22 12:28:39', '2020-12-22 12:28:39'),
(1059, 146, 2, 'МАЪМУРИЙ ҚОНУНЧИЛИКНИ ТАКОМИЛЛАШТИРИШ ИСТИҚБОЛЛАРИ', 1, 5, 'копия.docx', '2020-12-22 12:33:27', '2020-12-22 12:33:27'),
(1060, 72, 1, 'Криминалистическая фиксация дорожно - транспортных происшествий на примере Республики Узбекистан', 1, 2, '1111 001.jpg', '2020-12-23 04:27:56', '2020-12-23 04:27:56'),
(1061, 72, 1, 'Осмотр как способ криминалистического обеспечения фиксации дорожно - транспортного происшествия', 1, 3, '1112 001.jpg', '2020-12-23 04:29:52', '2020-12-23 04:29:52'),
(1062, 72, 1, 'Криминалистическая фиксация при совершении дорожно - транспортных происшествий в Республике Узбекистан', 1, 3, '1113 001.jpg', '2020-12-23 04:31:19', '2020-12-23 04:31:19'),
(1063, 72, 2, 'Некоторые вопросы технико - криминалистической фиксации при совершении дорожно - транспортных происшествий в Узбекистане', 1, 4, '1114 001.jpg', '2020-12-23 04:33:21', '2020-12-23 04:33:21'),
(1064, 72, 2, 'Криминалистическая фиксация при совершении дорожно - транспортных происшествий', 1, 4, '1115 001.jpg', '2020-12-23 04:36:30', '2020-12-23 04:36:30'),
(1065, 72, 2, 'Особенности экспертно - криминалистической фиксации при совершении дорожно - транспортных происшествий в условиях Узбекистана', 1, 5, '1116 001.jpg', '2020-12-23 04:40:50', '2020-12-23 04:40:50'),
(1066, 72, 2, 'Вопросы технико - криминалистической фиксации дорожно - транспортных происшествий', 1, 5, '1117 001.jpg', '2020-12-23 04:42:23', '2020-12-23 04:42:23'),
(1067, 72, 1, 'Трасологоик экспертизалар ўтказишдаги хатолар ва уларни бартараф этиш йўллари', 2, 3, '1118 001.jpg', '2020-12-23 04:44:08', '2020-12-23 04:44:08'),
(1068, 72, 1, 'Использование информационных технологий в деятельности органов внутренних дел Узбекистана', 1, 2, '1119 001.jpg', '2020-12-23 04:46:42', '2020-12-23 04:46:42'),
(1069, 72, 1, 'Отдельные аспекты технико - криминалистической фиксации при совершении дорожно - транспортных происшествий в Узбекистане', 1, 2, '1120 001.jpg', '2020-12-23 04:48:07', '2020-12-23 04:48:07'),
(1070, 72, 2, 'Использование современных технических средств фиксации для обеспечения общественной безопасности при осмотре места дорожно - транспортных происшествий', 1, 4, '1121 001.jpg', '2020-12-23 04:50:48', '2020-12-23 04:50:48'),
(1071, 72, 2, 'К вопросу применения инновационных решений при фиксации дорожно - транспортных происшествий', 1, 4, '1122 001.jpg', '2020-12-23 04:52:26', '2020-12-23 04:52:26'),
(1072, 72, 2, 'Современное состояние и перспективы применения беспилотных летательных аппаратов', 2, 4, '1123 001.jpg', '2020-12-23 04:53:38', '2020-12-23 04:53:38'),
(1073, 72, 1, 'Перспективы использования беспилотных летательных аппаратов для выявления нарушений ПДД в Узбекистане', 1, 3, '1124 001.jpg', '2020-12-23 04:55:51', '2020-12-23 04:55:51'),
(1074, 72, 2, 'Криминалистическая характеристика в процессе фиксации дорожно - транспортных происшествий', 1, 4, '1125 001.jpg', '2020-12-23 04:57:20', '2020-12-23 04:57:20'),
(1176, 72, 2, 'Грани сотрудничества', 1, 5, 'гранисотрудничества.jpg', '2020-12-30 05:43:08', '2020-12-30 05:43:08'),
(1177, 72, 1, 'Возможности применения полиграфа в раскрытии и расследовании преступлений', 2, 3, 'применениеполиграфа.jpg', '2020-12-30 05:45:29', '2020-12-30 05:45:29'),
(1077, 70, 2, 'Guvohlar xuquqi nima', 1, 5, '1997.pdf', '2020-12-23 08:48:28', '2020-12-23 08:48:28'),
(1078, 70, 1, 'Guvox-sud jarayonida', 2, 3, '1999.pdf', '2020-12-23 08:50:21', '2020-12-23 08:50:21'),
(1079, 70, 1, 'Mol o\'g\'irlash jinoyatlari tergovida guvohlarni so\'roq qilish hususiyatlari', 2, 3, '2001.pdf', '2020-12-23 08:54:23', '2020-12-23 08:54:23'),
(1080, 70, 2, 'О факторах, обуславливающих процессуальную активность свидетелей', 1, 5, '2003.pdf', '2020-12-23 08:57:54', '2020-12-23 08:57:54'),
(1081, 70, 1, 'Mikroob\'ektlarni topish, olish va ekspertiza tayinlash xususiyatlari', 2, 3, '2004-1.pdf', '2020-12-23 09:00:59', '2020-12-23 09:00:59'),
(1082, 70, 2, 'Portlash bilan bog\'liq jinoyat ishlari bo\'yicha voqea joyini ko\'zdan kechirishning o\'ziga xos xususiyatlari', 2, 4, '2004-2.pdf', '2020-12-23 09:03:42', '2020-12-23 09:03:42'),
(1083, 70, 2, 'Portlash sodir bo\'lgan joyni muhofaza qilishga doir ayrim mulohazalar', 1, 5, '2005.pdf', '2020-12-23 09:07:13', '2020-12-23 09:07:13'),
(1084, 70, 2, 'Tergov harakatlarini o\'tkazishda ekspert-kriminalistlar ishtirokida olingan dalilardan foydalanish', 1, 5, '2012.pdf', '2020-12-23 09:10:26', '2020-12-23 09:10:26'),
(1085, 70, 2, 'Ekspertiza, surishtiruv va tergov xodimlarining ochilmay qolgan jinoyatlarni tergovidagi hamkorligi', 1, 5, '2014.pdf', '2020-12-23 09:13:38', '2020-12-23 09:13:38'),
(1086, 70, 1, 'Voqea joyini ko\'zdan kechirishda mikroob\'ektlar bilan ishlashning o\'ziga xos xususiyatlari', 2, 3, '2016.pdf', '2020-12-23 09:18:39', '2020-12-23 09:18:39'),
(1087, 70, 1, 'Sud ekspertizalarini tayinlash va o\'tkazish bo\'yicha tavsiyalar', 1, 3, '2018.pdf', '2020-12-23 09:24:08', '2020-12-23 09:24:08'),
(1088, 70, 2, 'Повышение квалификации - требование времени', 1, 5, '1 001.jpg', '2020-12-23 09:25:19', '2020-12-23 09:25:19'),
(1089, 70, 2, 'Rossiya Federatsiyasi IIV xodimlarining malakasini oshirish instituti', 1, 5, '1 001.jpg', '2020-12-23 09:27:36', '2020-12-23 09:27:36'),
(1090, 70, 2, 'Терроризм-главная угроза человечеству', 1, 4, '1 001.jpg', '2020-12-23 09:29:19', '2020-12-23 09:29:19'),
(1091, 70, 1, 'Обнаружение, осмотр, фиксация, изъятие и исследование взрывотехнических объектов', 1, 2, '2019-2.pdf', '2020-12-23 09:31:04', '2020-12-23 09:31:04'),
(1092, 70, 2, 'Славный путь наставника', 1, 5, '1 001.jpg', '2020-12-23 09:32:08', '2020-12-23 09:32:08'),
(1093, 165, 2, 'AUTOMATION OF MAINTENANCE PROCESSING SYSTEM IN UZBEKISTAN', 2, 4, '451.pdf', '2020-12-23 11:03:59', '2020-12-23 11:03:59'),
(1094, 290, 2, 'Manaviy taxdidlarga qarshi kurashishda o\'smirlar-yoshlar ma\'naviy salohiyatini yuksaltirish', 1, 5, 'Документ Microsoft Word.docx', '2020-12-24 09:59:54', '2020-12-24 09:59:54'),
(1095, 290, 2, 'Voyaga yetmagan yoshlar ma\'naviy yuksalishning omili', 1, 5, 'Документ Microsoft Word.docx', '2020-12-24 10:05:26', '2020-12-24 10:05:26'),
(1096, 290, 2, 'Tanosil yoki OITS kasalilklarini tarqatishga qarshi kurashning jinoyat-huquqiy choralari va uni barkamol avlodni tarbiyalashdagi', 1, 5, 'Новый документ 2020-12-24 14.53.10.pdf', '2020-12-24 10:09:02', '2020-12-24 10:09:02'),
(1097, 292, 1, 'The Nature And Importance Of International Standards In Ensuring And Protecting The Rights Of Victims', 1, 1, 'автореф 1.pdf', '2020-12-24 10:21:03', '2020-12-24 10:21:03'),
(1098, 292, 1, 'Жабрланувчи ва гувоҳнинг ҳуқуқ ва қонуний манфаатлари қўриқланишининг ўзига хос жиҳатлари', 1, 3, 'автореф 2.pdf', '2020-12-24 10:25:26', '2020-12-24 10:25:26'),
(1099, 292, 1, 'Жабрланувчининг манфаатларини ҳимоя қилишда АҚШ тажрибасига оид баъзи мулоҳазалар', 1, 3, 'автореф 3.pdf', '2020-12-24 10:27:21', '2020-12-24 10:27:21'),
(1100, 292, 1, 'Тезкор-қидирув фаолиятида жабрланувчининг манфаат¬ларини муҳофаза қилиш.', 1, 3, 'автореф 4.pdf', '2020-12-24 10:28:38', '2020-12-24 10:28:38'),
(1101, 292, 1, 'Жиноят процессида жабрланувчининг ҳуқуқ ва манфаат¬ла¬рини муҳофаза қилиш механизмини такомиллаштириш', 1, 3, 'автореф 6.pdf', '2020-12-24 10:31:55', '2020-12-24 10:31:55'),
(1102, 292, 1, 'Ўзбекистон ва айрим хорижий давлатлар жиноят процессида жабрланувчининг ҳуқуқий мақоми', 1, 3, 'автореф 7.pdf', '2020-12-24 10:34:52', '2020-12-24 10:34:52'),
(1103, 292, 1, 'Жиноят ишларини юритишда жабрланувчининг ҳуқуқ ва қонуний манфаатларини муҳофаза қилиш амалиёти таҳлили', 1, 3, 'автореф 8.pdf', '2020-12-24 10:36:14', '2020-12-24 10:36:14'),
(1104, 292, 1, 'Терговга қадар текширув босқичида жабрланувчининг ҳуқуқ ва манфаатларини муҳофаза қилинишининг ҳуқуқий жиҳатлари', 1, 3, 'автореф 9.pdf', '2020-12-24 10:37:41', '2020-12-24 10:37:41'),
(1105, 292, 1, 'Алоҳида тоифадаги ишлар бўйича жабрланувчининг ҳуқуқ ва манфаатлари муҳофазасини такомиллаштириш: ярашув тўғрисидаги ишлар бўйича', 1, 3, 'автореф 11.pdf', '2020-12-24 10:40:47', '2020-12-24 10:40:47'),
(1106, 292, 2, 'Гувоҳнинг ҳуқуқ ва манфаатлари ҳимоясини кучайтириш масалалари', 1, 5, 'автореф 17.pdf', '2020-12-24 10:51:33', '2020-12-24 10:51:33'),
(1107, 146, 2, 'Жиноят ҳуқуқида хато ва унинг жиноят-ҳуқуқий таҳлили', 1, 5, 'Документ Microsoft Office Word.docx', '2020-12-24 10:51:39', '2020-12-24 10:51:39'),
(1108, 292, 2, 'XXI аср ноанъанавий тадқиқот усуллари ва улар асосида жабрланувчининг қонуний манфаатлари муҳофаза қилиниши', 1, 5, 'автореф 18.pdf', '2020-12-24 10:55:08', '2020-12-24 10:55:08'),
(1109, 292, 2, 'Мамлакатимизда демократик ислоҳотларни янада чуқурлаштириш ва фуқаролик жамиятини ривожлантириш концепцияси» асосида Ўзбекистонда жиноят-процессуал қонунчиликни ривожлантиришнинг илмий масалалари', 1, 5, 'автореф 20.pdf', '2020-12-24 10:58:21', '2020-12-24 10:58:21'),
(1110, 292, 2, 'Коррупцияга қарши курашишнинг ташкилий-ҳуқуқий механизмларини такомиллаштириш ва бу жиноятнинг жабрланувчиларга таъсири', 1, 5, 'автореф 23.pdf', '2020-12-24 11:07:59', '2020-12-24 11:07:59'),
(1111, 292, 1, 'Жиноят процессида жабрланувчининг ҳуқуқ ва манфаатларини муҳофаза қилиш масалаларига доир', 1, 3, 'Д.Тураева.pdf', '2020-12-24 11:23:18', '2020-12-24 11:23:18'),
(1112, 209, 1, 'Prospects for improvement and provision of reasonable importance of information as a result of identification for recognition in the criminal procedure of the Republic of Uzbekistan', 1, 1, 'автореф.№1.pdf', '2020-12-25 05:40:26', '2020-12-25 05:40:26'),
(1113, 209, 1, 'Вопросы регулирования следственного действия «предъявление для опознания» в уголовно-процессуальном законодательстве зарубежных стран // Проблемы современной науки и образования.', 1, 1, 'автореф.№2.pdf', '2020-12-25 05:41:02', '2020-12-25 05:41:02'),
(1114, 209, 1, 'Таниб олиш учун кўрсатиш жиноят процессида унга оид процессуал қоидаларнинг такомиллашиши', 1, 3, 'автореф.№3.pdf', '2020-12-25 05:41:59', '2020-12-25 05:41:59'),
(1115, 209, 1, 'Жиноят процессида таниб олиш учун кўрсатиш тергов ҳаракатини ўтказишдаги мавжуд муаммолар', 1, 3, 'автореф.№4.pdf', '2020-12-25 05:42:34', '2020-12-25 05:42:34'),
(1116, 209, 1, 'Жиноят процессида тергов харакатларига оид айрим мулоҳазалар', 1, 3, 'автореф.№5.pdf', '2020-12-25 05:42:56', '2020-12-25 05:42:56'),
(1117, 209, 1, 'Тергов ҳаракати ва унинг бошқа тергов ҳаракатларидаги ўрни', 1, 3, 'автореф.№6.pdf', '2020-12-25 05:43:21', '2020-12-25 05:43:21'),
(1118, 209, 1, 'О гарантиях соблюдения прав человека при предъявлении лица для опознания в уголовном процессе', 1, 3, 'автореф.№7.pdf', '2020-12-25 05:43:48', '2020-12-25 05:43:48'),
(1119, 209, 1, 'Хорижий мамлакатлар жиноят-процессуал қонунчилигида таниб олиш учун кўрсатиш тергов ҳаракатининг тартибга солиниши масалалари', 2, 3, 'автореф.№8.pdf', '2020-12-25 05:44:13', '2020-12-25 05:44:13'),
(1120, 209, 1, 'Таниб олиш учун кўрсатиш натижасида олинган далилларнинг мақбуллигини таъминлашга оид айрим мулоҳазалар', 1, 3, 'автореф.№9.pdf', '2020-12-25 05:44:44', '2020-12-25 05:44:44'),
(1121, 209, 1, 'Таниб олиш учун кўрсатиш тергов ҳаракатини ўтказиш  тартиби,  тактикаси ва унинг натижаларини расмийлаштириш масалалари', 1, 3, 'автореф.№10.pdf', '2020-12-25 05:45:40', '2020-12-25 05:45:40'),
(1122, 209, 2, 'О необходимости совершенствования процессуального порядка предъявления для опознания', 1, 4, 'автореф.№11.pdf', '2020-12-25 05:46:10', '2020-12-25 05:46:10'),
(1123, 209, 2, 'О зарубежном опыте уголовно-процессуального порядка предъявления для опазнания', 1, 4, 'автореф.№12.pdf', '2020-12-25 05:46:38', '2020-12-25 05:46:38'),
(1124, 209, 2, 'Таниб олиш учун кўрсатиш тергов ҳаракати ва унинг бошқа тергов ҳаракатлари тизимида тутган ўрни ҳамда ўзига хос жиҳатлари', 1, 5, 'автореф.№13.pdf', '2020-12-25 05:47:05', '2020-12-25 05:47:05'),
(1125, 209, 2, 'Таниб олиш учун кўрсатиш тергов ҳаракатини ўтказиш билан боғлиқ амалиёт: муаммо ва ечимлар', 1, 5, 'автореф.№14.pdf', '2020-12-25 05:47:39', '2020-12-25 05:47:39'),
(1126, 209, 2, 'Экстремизм билан боғлиқ жиноятларни тергов қилишда таниб олиш учун кўрсатиш тергов ҳаракатининг аҳамияти', 1, 4, 'автореф.№15.pdf', '2020-12-25 05:48:12', '2020-12-25 05:48:12'),
(1127, 209, 2, 'Identification of the investigative action and its role in the system of other investigative actions', 1, 4, 'автореф.№16.pdf', '2020-12-25 05:48:55', '2020-12-25 05:48:55'),
(1128, 209, 2, 'Some considerations on identification of the investigative action', 1, 4, 'автореф.№17.pdf', '2020-12-25 05:49:24', '2020-12-25 05:49:24'),
(1129, 209, 2, 'Вопросы обеспечения приемлемости доказательств, полученных в результате оказания услуг по признанию в уголовном процессе', 1, 4, 'автореф.№18.pdf', '2020-12-25 05:49:59', '2020-12-25 05:49:59'),
(1130, 209, 2, 'Issues of regulation of investigative actions presentation for identification in the criminal procedure legislation of foreign countries', 2, 4, 'автореф.№19.pdf', '2020-12-25 05:50:37', '2020-12-25 05:50:37'),
(1131, 209, 2, 'Таниб олиш тергов ҳаракатларини ўтказишда шахснинг конституциявий ҳуқуқларни таъминлаш', 2, 5, 'автореф.№20.pdf', '2020-12-25 05:51:20', '2020-12-25 05:51:20'),
(1132, 209, 2, 'Таниб олиш учун кўрсатиш тергов ҳаракатининг ривожланиш босқичлари', 1, 5, 'автореф.№21.pdf', '2020-12-25 05:52:08', '2020-12-25 05:52:08'),
(1133, 209, 2, 'Дастлабки тергов ва суд терговида таниб олиш учун кўрсатиш тергов ҳаракатининг роли ва бошқа тергов ҳаракатлари билан боғлиқлиги', 2, 5, 'автореф.№22.pdf', '2020-12-25 05:53:23', '2020-12-25 05:53:23'),
(1134, 209, 2, 'Жиноят процессида таниб олиш учун кўрсатиш тергов ҳаракати ва унинг бошқа тергов ҳаракатлари тизимидаги аҳамияти // Конституция – тинчлик ва тараққиёт кафолати', 1, 5, 'автореф.№23.pdf', '2020-12-25 05:53:46', '2020-12-25 05:53:46'),
(1135, 209, 2, 'Жиноят процессида таниб олиш учун кўрсатиш натижасида олинган далилларнинг мақбуллигини таъминлаш ва унинг ўзига хос хусусиятлари', 2, 5, 'автореф.№24.pdf', '2020-12-25 05:54:12', '2020-12-25 05:54:12'),
(1136, 100, 1, 'ОБУЧЕНИЕ ИНОЯЗЫЧНОМУ  ПРОФЕССИОНАЛЬНО-ОРИЕНТИРОВАННОМУ ОБЩЕНИЮ В ПРОФЕСИОНАЛЬНОЙ ПОДГОТОВКЕ СТУДЕНТОВ ВУЗОВ', 1, 3, '2019 UZSWLU.pdf', '2020-12-26 07:09:20', '2020-12-26 07:09:20'),
(1137, 100, 2, 'FREE WORK OF STUDENTS IS THE MOST IMPORTANT FACTOR', 1, 4, '2020 УзР КК Академияси Чет тилларни укитишда хорижий тажриба.pdf', '2020-12-26 07:21:11', '2020-12-26 07:21:11'),
(1138, 174, 1, 'Mechanism for ensuring compliance with the general conditions of evidenceand problems', 1, 1, 'МАКОЛА РАЖАБОВ.docx', '2020-12-26 12:39:33', '2020-12-26 12:39:33'),
(1139, 174, 2, 'DISCUSSION PROOF IN THE CRIMINAL PROCESS', 1, 4, 'СЕРТИФИКАН АНГЛИЯ (Б.А.РАЖАБОВ).jpg', '2020-12-26 12:48:53', '2020-12-26 12:48:53'),
(1140, 174, 1, 'RETROSPECTIVE ANALYSIS OF THE RULES FOR GENERAL CONDITIONS OF PROVING IN CRIMINAL PROCEDURE', 1, 1, 'МАКОЛА РАЖАБОВ.docx', '2020-12-26 15:07:02', '2020-12-26 15:07:02'),
(1141, 240, 1, 'Ярашилганлиги муносабати билан жиноий жавобгарликдан озод қилиш институтини кенгайтириш масалалари', 1, 3, 'ПАЙЗИЕВ МАКОЛА.docx', '2020-12-27 04:54:37', '2020-12-27 04:54:37'),
(1142, 240, 1, 'Ярашилганлиги муносабати  билан жиноий жавобгарликдан озод қилиш институтинингтарихий ва ҳуқуқий таҳлили', 1, 3, 'ПАЙЗИЕВ МАКОЛА.docx', '2020-12-27 05:01:58', '2020-12-27 05:01:58'),
(1143, 240, 1, 'Шахс дахлсизлиги муаммоси', 1, 3, 'Документ Microsoft Word.docx', '2020-12-27 05:52:46', '2020-12-27 05:52:46'),
(1144, 240, 1, 'Жиноят содир этишдан ихтиёрий қайтиш', 1, 3, 'Документ Microsoft Word.docx', '2020-12-27 06:12:30', '2020-12-27 06:12:30'),
(1145, 240, 2, 'Жиноят қонунчилигида такроран содир этилган жиноятларни квалификация қилиш қоидалари', 1, 5, 'Документ Microsoft Word.docx', '2020-12-27 06:30:03', '2020-12-27 06:30:03'),
(1146, 240, 2, 'Контрабанда жинояти предмети аниқлашга доир баъзи фикрлар', 1, 5, 'Документ Microsoft Word.docx', '2020-12-27 07:44:37', '2020-12-27 07:44:37'),
(1147, 174, 2, 'Ҳуқуқий ислоҳотлар шароитида шахснинг ҳуқуқ ва эркинликлари ҳимоясини кучайтиришнинг асосий йўналишлари', 1, 4, 'РАЖАБОВ ТЕЗИС ТДЮУ.docx', '2020-12-28 03:42:24', '2020-12-28 03:42:24'),
(1148, 174, 2, 'EVALUATION OF EVIDENCE COLLECTION IN CRIMINAL PROCEDURE', 1, 4, 'РАЖАБОВ АКШ СЕРТИФИКАТ.jpg', '2020-12-28 03:47:35', '2020-12-28 03:47:35'),
(1149, 104, 1, 'Ёшларни ватанпарварлик руҳида тарбиялаш муаммолари', 1, 3, 'IMG_20201227_065656_1.jpg', '2020-12-28 07:29:53', '2020-12-28 07:29:53'),
(1150, 104, 2, 'Ўзбекистонда оммавий маданият ривожланиши муаммолари', 1, 5, 'IMG_20201208_101403_1.jpg', '2020-12-28 07:35:06', '2020-12-28 07:35:06'),
(1151, 104, 2, 'Демократия ва виждон эркинлиги', 1, 5, 'IMG_20201208_101047_1.jpg', '2020-12-28 07:39:06', '2020-12-28 07:39:06'),
(1152, 104, 2, 'Диний экстремизмга қарши курашнинг ҳуқуқий асослари', 1, 5, 'IMG_20201113_141558_1.jpg', '2020-12-28 07:45:27', '2020-12-28 07:45:27'),
(1153, 104, 2, 'Ўзбекистонда диннинг тутган ўрни ва мавқеи', 1, 5, 'IMG_20201113_141354_1.jpg', '2020-12-28 07:49:22', '2020-12-28 07:49:22'),
(1154, 104, 2, 'Основные качества руководителя и их взаимосвязь с эффективностью решения руководящих задач', 1, 5, 'IMG_20201112_121901_1.jpg', '2020-12-28 07:53:57', '2020-12-28 07:53:57'),
(1155, 104, 2, 'Идеологические корни религизного экстремизма', 1, 5, 'IMG_20201112_121707.jpg', '2020-12-28 07:58:22', '2020-12-28 07:58:22'),
(1156, 112, 1, 'Specifics of English law terms', 1, 3, 'Филология мас_Jurnal_4_son.pdf', '2020-12-28 08:19:48', '2020-12-28 08:19:48'),
(1157, 240, 2, 'Ўзбекистон Республикаси жиноят қоунчилигида жиноят тушунчаси', 1, 5, 'Документ Microsoft Word.docx', '2020-12-28 08:57:31', '2020-12-28 08:57:31'),
(1158, 240, 2, 'Пора билан совғани фарқлаш юзасидан айрим мулоҳазалар', 2, 5, 'Документ Microsoft Word.docx', '2020-12-28 09:05:07', '2020-12-28 09:05:07'),
(1159, 240, 2, 'Вояга етмаганлар ҳуқуқбузарликларига таъсир этувчи ижтимоий шарт шароитлар', 1, 4, 'Документ Microsoft Word.docx', '2020-12-28 09:13:48', '2020-12-28 09:13:48'),
(1160, 240, 2, 'Баркамол авлод фаровонлигини таъминлаш давлат ижтимоий сиёсатининг устувор йўналиши', 1, 5, 'Документ Microsoft Word.docx', '2020-12-28 09:21:26', '2020-12-28 09:21:26'),
(1161, 240, 2, 'Талончилик жиноятидаги зўрлик ишлатишнинг ҳуқуқий таърифи', 1, 5, 'Документ Microsoft Word.docx', '2020-12-28 09:32:10', '2020-12-28 09:32:10'),
(1162, 240, 2, 'Одам савдоси жиноятининг жиноий-ҳуқуқий тавсифи', 1, 5, 'Документ Microsoft Word.docx', '2020-12-28 09:38:27', '2020-12-28 09:38:27'),
(1163, 240, 2, 'Мустаҳкам оила-боланинг жисмоний аҳлоқий ривожланишининг гарови', 2, 5, 'Документ Microsoft Word.docx', '2020-12-28 09:44:35', '2020-12-28 09:44:35'),
(1164, 240, 2, 'PECULIARITIES OF THE INSTITUTE OF CRIMINAL LAW RECONCILIATION OF THE REPUBLIC OF UZBEKISTAN', 1, 4, 'Документ Microsoft Word.docx', '2020-12-28 10:12:28', '2020-12-28 10:12:28'),
(1165, 240, 2, 'ВОПРОСЫ ПРИМИРЕНИЯ ПО УГЛОВНОМУ ЗАКОНАДАТЕЛЬСТВУ РЕСПУБЛИКИ УЗБЕКИСТАН', 1, 4, 'Документ Microsoft Word.docx', '2020-12-28 10:18:18', '2020-12-28 10:18:18'),
(1166, 240, 1, 'Ўзбекистон Республикасида ярашилганлиги муносбати билан жиноий жавобгарликдан озод қилиш инчтитутининг ретроспектив таҳлили', 1, 1, 'Документ Microsoft Word.docx', '2020-12-28 10:24:46', '2020-12-28 10:24:46'),
(1167, 293, 1, 'қонун лойиҳаларини жамоатчилик муҳокамаси', 1, 3, 'Авто реф №11 (2).pdf', '2020-12-28 11:21:15', '2020-12-28 11:21:15'),
(1168, 99, 1, 'Ички ишлар органлари тўғрисидаги қонуннинг қабул қилиниши-инсон манфаатларини таъминлашнинг мухим ҳуқуқий кафолати', 2, 3, 'фф1.pdf', '2020-12-29 06:32:57', '2020-12-29 06:32:57'),
(1169, 96, 1, 'Коррупцияга қарши курашишда ички ишлар органларининг ўрни', 1, 3, 'шер.pdf', '2020-12-29 06:37:20', '2020-12-29 06:37:20'),
(1170, 96, 1, 'ПРИМЕНЕНИЕ КОМПЬЮТЕРНЫХ ТЕХНОЛОГИЙ НА ЗАНЯТИЯХ ПО ФИЗИЧЕСКОЙ ПОДГОТОВКЕ', 2, 2, 'международная статья салимов.pdf', '2020-12-29 06:48:20', '2020-12-29 06:48:20'),
(1171, 96, 1, 'Musobaqa oldi tayyorlov bosqichida katta osmirlarda ihtisoslashgan vositalarni tanlash', 1, 3, '222.pdf', '2020-12-29 07:54:59', '2020-12-29 07:54:59'),
(1172, 109, 1, 'Sportchilarni tayyorlash, tanlab olish va yo\'naltirish mezonlari', 1, 3, 'sertifikat.PDF', '2020-12-29 10:34:03', '2020-12-29 10:34:03'),
(1173, 109, 1, 'Malakali sportchilarni ish qobiliyatini aniqlash va tahlil qilish', 2, 3, 'мақола.pdf', '2020-12-29 10:49:28', '2020-12-29 10:49:28'),
(1174, 109, 1, 'Malakali sportchilarni ish qobiliyatini aniqlash va tahlil qilish', 1, 3, 'мақола.pdf', '2020-12-29 10:50:09', '2020-12-29 10:50:09'),
(1178, 64, 2, 'Суд экспертизаларини  ўтказишда ўзаро хамкорлик', 1, 8, '33 001.pdf', '2020-12-30 18:03:49', '2020-12-30 18:03:49'),
(1179, 64, 1, 'Йўл-транспорт ҳодисаси бўйича трасологик экспертизасини ривожлантириш масалалари', 1, 3, '1 001.pdf', '2020-12-30 19:44:13', '2020-12-30 19:44:13'),
(1180, 64, 1, 'Трасологик тадқиқотларнинг замонавий имкониятлари', 1, 3, '2 001.pdf', '2020-12-30 19:45:25', '2020-12-30 19:45:25'),
(1181, 64, 1, 'Кийимдаги механик шикастланишларни трасологик тадқиқотларининг замонавий имкониятлари', 2, 3, '3 001.pdf', '2020-12-30 19:46:46', '2020-12-30 19:46:46'),
(1182, 64, 1, 'Трасологик объектлар криминалистик тадқиқотларининг замонавий имкониятлари бўйича айрим фикрлар', 1, 3, '300-Текст статьи-1249-1-10-20201229 (2) (1).pdf', '2020-12-30 20:24:55', '2020-12-30 20:24:55'),
(1183, 92, 2, 'Некоторые мысли и соображения по правилам паспортной системы', 2, 5, 'CamScanner 15-12-2020 12.34.pdf', '2021-01-02 05:08:39', '2021-01-02 05:08:39'),
(1184, 92, 2, 'МАЪМУРИЙ ЖАРИМА ЖАЗОСИ ИЖРОСИНИ ТАКОМИЛЛАШТИРИШ', 1, 5, 'CamScanner 17-10-2020 10.33.57.pdf', '2021-01-02 05:14:58', '2021-01-02 05:14:58'),
(1185, 92, 2, 'Лицензирование - форма государственного регулирования отдельных видов предпринимательской деятельности', 2, 4, 'CamScanner 17-10-2020 11.48.36.pdf', '2021-01-02 06:57:25', '2021-01-02 06:57:25'),
(1186, 92, 2, 'Конституция - жамият ҳаётининг ҳуқуқий асоси', 1, 5, 'CamScanner 17-10-2020 17.47.17.pdf', '2021-01-02 07:05:17', '2021-01-02 07:05:17'),
(1187, 92, 2, 'Тадбиркорлик субъектларига нисбатан қўлланиладиган ҳуқуқий таъсир чоралари юзасидан фикр мулохазалар.', 2, 5, 'CamScanner 17-10-2020 18.17.13.pdf', '2021-01-02 07:16:48', '2021-01-02 07:16:48'),
(1188, 92, 2, 'Чет эл фуқаролари ва фуқаролиги бўлмаган шахсларни  Ўзбекистон Республикаси ҳудудидан маъмурий тарзда  чиқариб юбориш', 1, 5, 'CamScanner 17-10-2020 18.17.13.pdf', '2021-01-02 07:21:50', '2021-01-02 07:21:50'),
(1189, 165, 2, 'E-COMMERCE SECURITY: LEGAL AND POLICY ASPECTS OF TECHNOLOGY SOLUTIONS IN UZBEKISTAN', 2, 4, '471-Article Text-1880-1-10-20201228.pdf', '2021-01-03 03:00:23', '2021-01-03 03:00:23'),
(1190, 165, 2, 'ЎЗБЕКИСТОНДА ПОЧТА ЖЎНАТМАЛАРИГА ИШЛОВ БЕРИШ ТИЗИМИНИ АВТОМАТЛАШТИРИШ', 2, 4, '448-Article Text-1834-1-10-20201222.pdf', '2021-01-03 03:03:44', '2021-01-03 03:03:44'),
(1199, 104, 2, 'Маданият ва ҳуқуқий тартибот', 1, 5, 'IMG_20210103_100242_1.jpg', '2021-01-04 04:59:23', '2021-01-04 04:59:23'),
(1200, 104, 2, 'Подвиги предков бессмертны', 1, 5, 'IMG_20210104_112447.jpg', '2021-01-04 10:42:35', '2021-01-04 10:42:35'),
(1201, 104, 2, 'Бухара столица культуры исламского мира', 1, 5, 'IMG_20210104_120527_1.jpg', '2021-01-04 10:45:20', '2021-01-04 10:45:20'),
(1202, 104, 2, 'Великое наследие великой исторической личности', 1, 5, 'IMG_20201103_204528.jpg', '2021-01-04 10:49:49', '2021-01-04 10:49:49'),
(1203, 104, 2, '\"Оммавий маданият\"нинг аҳолига салбий таъсирини бартараф этишда профилактика инспекторларининг вазифалари', 1, 5, 'IMG_20201103_203539.jpg', '2021-01-04 10:56:27', '2021-01-04 10:56:27'),
(1204, 92, 2, 'Коррупция ва унга қарши курашишни такомиллаштириш хусусида фикрлар', 1, 6, 'CamScanner 04-01-2021 15.22.pdf', '2021-01-04 10:58:10', '2021-01-04 10:58:10'),
(1205, 104, 2, 'Идея мужества в эпосе Алпомыш', 1, 5, 'IMG_20201106_083603.jpg', '2021-01-04 10:59:23', '2021-01-04 10:59:23'),
(1206, 104, 2, 'Музеи зеркало нашей истории', 1, 5, 'IMG_20201106_083622_1.jpg', '2021-01-04 11:01:07', '2021-01-04 11:01:07'),
(1207, 92, 2, 'Обеспечение судебно-правовой защиты лиц при применении административных всызканий', 1, 5, 'CamScanner 04-01-2021 15.24.pdf', '2021-01-04 11:01:20', '2021-01-04 11:01:20'),
(1208, 104, 2, 'Маданият ва бозор иқтисоди', 1, 5, 'IMG_20201103_204844.jpg', '2021-01-04 11:05:26', '2021-01-04 11:05:26'),
(1209, 104, 2, 'Роль города в повышении культуры сельского населения', 1, 5, 'IMG_20201103_204747.jpg', '2021-01-04 11:07:29', '2021-01-04 11:07:29'),
(1210, 104, 2, 'Маданиятларнинг ўзаро таъсири ва унинг ривожланиш босқичлари', 1, 5, 'IMG_20210104_151912_1.jpg', '2021-01-05 05:31:02', '2021-01-05 05:31:02'),
(1211, 198, 1, 'Фуқоролик жамиятининг манавий ва хуқуқий асослари', 2, 3, 'maqola1.jpg', '2021-01-05 06:32:34', '2021-01-05 06:32:34'),
(1212, 198, 1, 'Маънавий-маърифий тарбия – фуқаролик жамияти тараққиётининг муҳим стратегик мақсади', 1, 3, 'мақола2.jpg', '2021-01-05 06:37:17', '2021-01-05 06:37:17'),
(1213, 198, 1, 'Фуқаролик жамияти институтларини ривожлантириш истикболлари', 1, 3, 'IMG_20181222_135138.jpg', '2021-01-05 06:40:18', '2021-01-05 06:40:18'),
(1214, 198, 1, 'Маънавий тарбия ва сиёсий маданият', 2, 3, 'макола 3.jpg', '2021-01-05 06:45:00', '2021-01-05 06:45:00'),
(1215, 198, 1, 'Фуқаролик жамияти институтларини ривожлантириш: жамоатчилик назорати талқинида', 1, 3, 'макола4.jpg', '2021-01-05 06:50:58', '2021-01-05 06:50:58'),
(1216, 108, 1, 'фалсафа қонунларининг ҳуқуқшунослик амалиётидаги ўрни', 1, 3, '10.jpg', '2021-01-05 12:43:49', '2021-01-05 12:43:49'),
(1217, 108, 2, 'коррупцияга қарши курашишда ҳалқаро ҳуқуқий амалиёт ва илғор тажриба', 1, 5, '5.jpg', '2021-01-05 12:46:41', '2021-01-05 12:46:41'),
(1218, 63, 1, 'Suggestion for elimination of existing problems in garrying out trasological expertise and conditions of their implementation', 1, 2, 'Академия 25 йиллик. макола туплами.pdf', '2021-01-06 06:13:35', '2021-01-06 06:13:35'),
(1219, 63, 1, 'Трасология таълимотининг вужудга келиши ва Ўзбекистон Республикаси ривожлантириш босқичлари', 1, 3, '5 онлайн конференция.pdf', '2021-01-06 07:24:27', '2021-01-06 07:24:27'),
(1220, 63, 2, 'Трасологик экспертизалар тадқиқотларини такомиллаштиришда криминалистик ҳисобнинг аҳамияти', 1, 5, 'конституция... макола туплами.pdf', '2021-01-06 07:25:28', '2021-01-06 07:25:28'),
(1221, 63, 1, 'Пойафзални ягона излар бўйича идентификация қилишнинг назарий асослари', 1, 7, 'XXI   Крими  макола туплами.pdf', '2021-01-06 07:27:03', '2021-01-06 07:27:03'),
(1222, 63, 1, 'Эксперт-криминалистнинг жиноятларни содир этилишига енгиллик яратган шароитларни аниқлаш фаолияти', 1, 7, 'криминалогия макола туплами.pdf', '2021-01-06 07:28:10', '2021-01-06 07:28:10'),
(1223, 63, 1, 'Суд экспертизасида трасологик экспертизанинг ўрни', 1, 7, 'Жамият... макола туплами.pdf', '2021-01-06 07:28:57', '2021-01-06 07:28:57'),
(1224, 63, 1, 'Трасологик тадқиқотларни такомиллаштириш', 1, 3, 'конун устуворлиги  макола туплами.pdf', '2021-01-06 07:30:30', '2021-01-06 07:30:30'),
(1225, 227, 1, 'Новая система обеспечения общественной безопасности: реформы и результаты', 1, 3, 'Қалқон 12.2019.jpg', '2021-01-07 06:53:17', '2021-01-07 06:53:17'),
(1226, 136, 1, 'Кибержиноятчиликка қарши -киберхавфсизлик', 1, 7, 'Постда1.pdf', '2021-01-08 05:03:11', '2021-01-08 05:03:11'),
(1227, 219, 2, 'Ёшларни тарбиялашда илм ва маърифатни ўрни', 1, 5, '24.pdf', '2021-01-09 13:02:58', '2021-01-09 13:02:58'),
(1228, 219, 2, 'Хотин-қизларни қўллаб-қувватлаш ва оила институтини мустаҳкамлаш  соҳасидаги фаолиятини тубдан такомиллаштириш борасида амалга оширилган ислоҳотлар самараси', 1, 5, '23.pdf', '2021-01-09 13:06:57', '2021-01-09 13:06:57'),
(1229, 219, 2, 'Ҳуқуқбузарликлар профилактикаси тушунчасининг назарий-ҳуқуқий таҳлили.', 2, 5, '9.pdf', '2021-01-09 13:13:18', '2021-01-09 13:13:18'),
(1230, 219, 2, 'Ҳуқуқбузарликлар умумий профилактикасида профилактиканинг принципларига амал қилишининг ўзига ҳос жиҳатлари.', 2, 5, '8.pdf', '2021-01-09 13:15:44', '2021-01-09 13:15:44'),
(1231, 219, 2, 'Ички ишлар органларининг таянч пунктлари-ҳуқуқбузарликлар профилактикаасини таъминловчи марказ', 2, 5, '6.pdf', '2021-01-09 13:18:24', '2021-01-09 13:18:24'),
(1232, 284, 1, 'Яшаш манзилидан', 2, 7, 'Қалқон 1.jpg', '2021-01-12 07:06:18', '2021-01-12 07:06:18'),
(1233, 284, 1, 'Ноконуний миграция', 2, 3, 'Қалқон 2.jpg', '2021-01-12 07:07:42', '2021-01-12 07:07:42'),
(1234, 281, 1, 'RHETORICAL ASPECT OF SPEECH CULTURE', 2, 1, '2021-USA.pdf', '2021-01-12 10:48:58', '2021-01-12 10:48:58'),
(1235, 243, 1, '“The concept of stress resistance and its formation among employees of the internal affairs bodies of the republik of Uzbekistan”.', 2, 2, 'Khakimova Iroda Mukhammadjanovna, Sadirov Azamat Aytbayevich.pdf', '2021-01-13 05:31:30', '2021-01-13 05:31:30'),
(1236, 299, 1, 'PSYCHOLOGICAL ASSISTANCE IN SUICIDAL BEHAVIOR OF INTERNAL AFFAIRS: DIAGNOSTICS, CORRECTION, CONSULTING', 1, 3, 'Tursunova Ozoda Abdullaevna.pdf', '2021-01-13 05:34:44', '2021-01-13 05:34:44'),
(1237, 243, 1, '“The concept of stress resistance and its formation among employees of the internal affairs bodies of the republik of Uzbekistan”.', 2, 3, 'Khakimova Iroda Mukhammadjanovna, Sadirov Azamat Aytbayevich.pdf', '2021-01-13 05:41:34', '2021-01-13 05:41:34'),
(1238, 243, 1, '“Formation of stress resistance among employees of internal affairs bodies”.', 2, 2, 'Full-Paper-FORMATION-OF-STRESS-RESISTANCE-AMONG-EMPLOYEES-OF-INTERNAL-AFFAIRS-BODIES.pdf', '2021-01-13 07:05:19', '2021-01-13 07:05:19'),
(1239, 299, 2, 'Профилактика суицыда в органов внутренних дел', 1, 5, 'Мақола 2.pdf', '2021-01-13 07:29:26', '2021-01-13 07:29:26'),
(1240, 299, 2, '“Наркомания как вид аддиктивного поведения”', 2, 5, 'Мақола 1_opt.pdf', '2021-01-13 07:32:33', '2021-01-13 07:32:33'),
(1241, 299, 2, 'Вояга етмаганлар билан ишлашда оила, маҳалла ва мактаб ҳамкорлиги масалаларининг психологик омили', 2, 5, 'Вояга етмаганлар билан ишлашда оила, мактаб ва махалла ҳамкорлигининг масалалари психологик омиллари_opt.pdf', '2021-01-13 07:59:22', '2021-01-13 07:59:22'),
(1242, 299, 2, 'Профилактика суицида среди детей и подростков.', 1, 5, 'Мақола.pdf 3.pdf', '2021-01-13 08:25:29', '2021-01-13 08:25:29'),
(1243, 299, 2, 'Психологическая профилактика суицидального поведения сотрудников ОВД', 1, 5, 'Мақола 4.pdf', '2021-01-13 08:28:10', '2021-01-13 08:28:10'),
(1244, 299, 2, 'Суицидал хулқ-атвор психопрофилактикасида психологик хизматнинг тутган ўрни', 1, 5, 'Мақола 5_opt.pdf', '2021-01-13 09:56:23', '2021-01-13 09:56:23'),
(1245, 299, 2, 'Стресс ва унинг олдини олишда психологик маслаҳатнинг аҳамияти', 2, 5, 'Мақола 6_opt.pdf', '2021-01-13 09:57:58', '2021-01-13 09:57:58'),
(1246, 298, 1, 'Ички ишлар органлари ходимларини касбий фаолиятга мослашувининг психологик жиҳатлари', 2, 3, 'узму илмий мақола.docx', '2021-01-14 12:15:54', '2021-01-14 12:15:54'),
(1247, 298, 1, 'Психологические факторы, обеспечивающие эффективность профессиональной деятельности сотрудников органов внутренних дел', 1, 2, 'Сборник международной практической конфиренции (халқаро мақолалар тўплами) 2019 й.pdf', '2021-01-14 12:33:26', '2021-01-14 12:33:26');
INSERT INTO `old_maqolas` (`id`, `user_id`, `turi`, `mavzu`, `mualliflik`, `miqyosi`, `ilova`, `created_at`, `updated_at`) VALUES
(1248, 298, 1, 'Ҳарбийлаштирилган таълим тизимида курсантларнинг касбий компетентлигини шакллантиришнинг психологик жиҳатлари', 1, 0, 'казан.docx', '2021-01-14 12:44:35', '2021-01-14 12:44:35'),
(1249, 298, 1, 'Ҳарбийлаштирилган таълим тизимида курсантларнинг касбий компетентлигини шакллантиришнинг психологик жиҳатлари', 1, 2, 'казан.docx', '2021-01-15 03:39:13', '2021-01-15 03:39:13'),
(1250, 215, 1, 'ЁШЛАР ТАРБИЯСИ - БАРК^РОР ТАРАК^ИЁТНИ ТАЪМИНЛАШ ОМИЛИ', 1, 3, 'Тургунова.pdf', '2021-01-15 04:14:35', '2021-01-15 04:14:35'),
(1251, 298, 1, 'Ички ишлар органлари ходимларининг касбий фаолиятга психологик мослашув муаммоси', 1, 3, 'психология илмий макола_s-сжатый.pdf', '2021-01-15 05:34:16', '2021-01-15 05:34:16'),
(1252, 298, 2, 'Наркомания как вид аддиктивного поведения', 2, 5, 'гиёхвандлик.pdf', '2021-01-15 05:39:49', '2021-01-15 05:39:49'),
(1253, 298, 2, 'Вояга етмаганлар билан ишлашда оила, мактаб ва махалла ҳамкорлигининг масалалари психологик омиллари', 2, 5, 'Вояга етмаганлар билан ишлашда оила, мактаб ва махалла ҳамкорлигининг масалалари психологик омиллари.pdf', '2021-01-15 05:42:17', '2021-01-15 05:42:17'),
(1254, 298, 2, 'Ёшларни  ижтимоий  фаоллигини  оширишда узлуксиз таълим ва миллий  тарбиянинг аҳамияти', 2, 5, 'М.Г. Давлетшин Сирлиев ва Шерматова ғк.pdf', '2021-01-15 06:12:36', '2021-01-15 06:12:36'),
(1255, 298, 2, 'Ички ишлар органлари ходимларида касбий бузилиш тушунчаси ва уларнинг олдини олиш йўллари', 1, 4, 'давлетшин Ички ишлар органлари ходимларида касбий бузилиш тушунчаси ва уларнинг олдини олиш йўллари.docx', '2021-01-15 06:31:09', '2021-01-15 06:31:09'),
(1256, 298, 2, 'Жазони ижро этиш муассасаларида касбий бузилиш тушунчаси ва уларни бартараф  этиш йўллари', 1, 5, 'Жазони ижро этиш муассасаларида касбий бузилиш тушунчаси ва уларни бартараф этиш йўллари.docx', '2021-01-15 07:46:24', '2021-01-15 07:46:24'),
(1257, 172, 1, 'IIOlari tezkor bo\'linmalarining tog\'li hududlarda terrorizmga qarshi kurashishda boshqa xizmat tezkor bo\'linmalari va jamoatchilik bilan hamkorligi', 1, 3, '7-мақола тогли терроризм.docx', '2021-01-15 08:28:17', '2021-01-15 08:28:17'),
(1258, 298, 2, 'Ички  ишлар  органлари  ходимларида  касбий  компетентлик шаклланишининг психологик механизмлари', 1, 5, 'ИИО касбий компетентликнинг шакллантиришнинг психологик механизмлари.docx', '2021-01-15 08:54:52', '2021-01-15 08:54:52'),
(1259, 298, 2, 'Таьлим жараёнида курсантларнинг касбий компетентлигини шакллантиришнинг психологик жиҳатлари', 1, 5, 'Таьлим жараёнида курсантларнинг касбий компетентлигини шакллантиришнинг психологик жиҳатлари (456-460 бет).docx', '2021-01-15 09:09:37', '2021-01-15 09:09:37'),
(1260, 298, 2, 'Психологик тайёргарлик раҳбарнинг муҳим шахсий касбий хусусиятларини шакллантириш сифатида', 2, 5, 'Психологик тайёргарлик раҳбарнинг муҳим шахсий касбий хусусиятларини шакллантириш сифатида (82-86).docx', '2021-01-15 09:10:12', '2021-01-15 09:10:12'),
(1261, 305, 1, 'Коммуникативная функция общения  в профессиональной деятельности следователя органов внутренних дел', 1, 3, 'Axborotnoma-2020-3.pdf', '2021-01-15 09:26:27', '2021-01-15 09:26:27'),
(1262, 306, 1, 'CHARACTERISTICS AND FORMS OF OTHER FEES CONNECTED WITH CRIMINAL PROCEEDINGS', 1, 1, 'Sultanov Abdulla Azamatovich.pdf', '2021-01-16 06:14:04', '2021-01-16 06:14:04'),
(1263, 306, 1, 'Concept of procedural expenses in criminal procedural law', 1, 1, '1. Concept of procedural expenses in criminal procedural law.pdf', '2021-01-16 06:15:30', '2021-01-16 06:15:30'),
(1264, 306, 1, 'LEGAL REGULATION OF SOME EXPENSES IN THE CRIMINAL PROCEEDINGS', 1, 2, '2. Текст статьи-612-1-10-20201016.pdf', '2021-01-16 06:19:09', '2021-01-16 06:19:09'),
(1265, 306, 1, 'УГОЛОВНО-ПРОЦЕССУАЛЬНЫЕ ЗАДАЧИ ИНСТИТУТА ПРОЦЕССУАЛЬНЫХ ИЗДЕРЖЕК', 1, 1, 'АКШ маколаси.docx', '2021-01-16 06:27:09', '2021-01-16 06:27:09'),
(1266, 306, 1, 'О ПРОЦЕССУАЛЬНЫХ ОСНОВАНИЯХ И ЗНАЧЕНИЕ ИНСТИТУТА ПРОЦЕССУАЛЬНЫХ РАСХОДОВ СВЯЗАННЫХ С РАССЛЕДОВАНИЕМ ПРЕСТУПЛЕНИЙ В УЗБЕКИСТАНЕ', 1, 2, 'Болгария маколаси.docx', '2021-01-16 06:48:07', '2021-01-16 06:48:07'),
(1267, 306, 1, 'ИШНИ СУДГА ҚАДАР ЮРИТИШ БОСҚИЧИДА ПРОЦЕССУАЛ ХАРАЖАТЛАРНИ ТЎЛАШ МЕХАНИЗМИНИ ТАКОМИЛЛАШТИРИШ', 1, 3, 'Прок.Академия.docx', '2021-01-16 07:08:02', '2021-01-16 07:08:02'),
(1268, 306, 1, 'ÆÈÍÎßÒ ÈØÈÍÈ ÞÐÈÒÈØ ÁÈËÀÍ ÁÎ¢ËÈ£ ÏÐÎÖÅÑÑÓÀË ÕÀÐÀÆÀÒËÀÐÍÈ Ò¤ËÀØ: ÀÌÀËÈ¨Ò ÂÀ £ÎÍÓÍ×ÈËÈÊ ÒÀ¥ËÈËÈ', 1, 3, 'Тадкикот.docx', '2021-01-16 07:12:00', '2021-01-16 07:12:00'),
(1269, 306, 1, '“Адолат харажатлари” миллий  тизимини жорий этиш орқали процессуал харажатларни тўлаш манбасини такомиллаштириш', 1, 3, 'ЎзА.png', '2021-01-16 07:15:41', '2021-01-16 07:15:41'),
(1270, 306, 2, 'Процессуал харажатлар – одил судловни амалга оширишнинг иқтисодий кафолати сифатида', 1, 5, 'Тергов амалиёти.JPG', '2021-01-16 09:48:31', '2021-01-16 09:48:31'),
(1271, 306, 1, 'Процессуал харажатларни тўлаш тартибига оид хорижий давлатлар тажрибаси', 1, 3, 'прок.тумлам.docx', '2021-01-16 09:54:37', '2021-01-16 09:54:37'),
(1272, 306, 2, 'Процессуал харажатлар институтининг юридик табиатига алоқадор ҳуқуқ институтлари', 1, 5, 'Гвардия туплам.docx', '2021-01-16 10:01:35', '2021-01-16 10:01:35'),
(1273, 306, 2, 'Процессуал харажатлар - жиноят процессуал қонунчиликдаги коррупцион омиллардан бири сифатида', 1, 5, 'Коррупция.docx', '2021-01-16 10:11:20', '2021-01-16 10:11:20'),
(1274, 306, 1, 'Legal regulation of some expenses in the criminal proceedings', 1, 2, '2. Текст статьи-612-1-10-20201016.pdf', '2021-01-16 10:24:17', '2021-01-16 10:24:17'),
(1275, 309, 2, 'Ichki ishlar organlari faoliyatida normativ-huquqiy hujjatlarni sharhlash', 1, 5, 'CamScanner 16-01-2021 15.24.pdf', '2021-01-16 10:29:04', '2021-01-16 10:29:04'),
(1276, 215, 1, 'ЁШЛАР ТАРБИЯСИ – БАРҚАРОР ТАРАҚҚИЁТ ПОЙДЕВОРИ', 1, 7, 'ТДПУ 2020 1.pdf', '2021-01-18 11:06:05', '2021-01-18 11:06:05'),
(1277, 150, 1, 'Климатические условия влияющие на надежность и долговечность автомобиля', 2, 1, '77.docx', '2021-01-19 07:16:17', '2021-01-19 07:16:17'),
(1278, 150, 1, 'Особенности эксплуатации грузовых автомобилей в условиях пустынно-песчаной местности и жаркого климата.', 2, 1, '78.docx', '2021-01-19 07:17:21', '2021-01-19 07:17:21'),
(1279, 150, 1, 'Особенности эксплуатации грузовых автомобилей в условиях пустынно-песчаной местности и жаркого климата.', 2, 1, '78.docx', '2021-01-19 07:21:14', '2021-01-19 07:21:14'),
(1280, 150, 1, 'Ички ишлар идоралари соҳасидаги ислоҳотлар – тинчлик ва осойишталикни таъминлаш гарови', 1, 1, '79.docx', '2021-01-19 07:22:17', '2021-01-19 07:22:17'),
(1281, 311, 1, 'Муаммонинг илдизи қирқилса оилавий зўравонлик бархам топади.', 1, 3, 'ҳуқуқ вва бурч.pdf', '2021-01-19 09:20:00', '2021-01-19 09:20:00'),
(1282, 311, 1, 'Жамоатчилик фикри-коррупцияга қаршикурашнинг асосий омили', 1, 0, 'Ахбортнома 2018.pdf', '2021-01-19 09:22:52', '2021-01-19 09:22:52'),
(1283, 311, 1, 'Жамоатчилик фикри-коррупцияга қаршикурашнинг асосий омили', 1, 0, 'Ахбортнома 2018.pdf', '2021-01-19 09:23:12', '2021-01-19 09:23:12'),
(1284, 311, 1, 'Жамоатчилик фикри-коррупцияга қаршикурашнинг асосий омили', 1, 0, 'Ахбортнома 2018.pdf', '2021-01-19 09:23:49', '2021-01-19 09:23:49'),
(1285, 311, 1, 'Жамоатчилик фикри-коррупцияга қаршикурашнинг асосий омили', 1, 3, 'Ахбортнома 2018.pdf', '2021-01-19 09:24:26', '2021-01-19 09:24:26'),
(1286, 311, 1, 'Ички ишлар органларининг ахборот таҳлил фаолиятини такомиллаштириш-давр талаби', 1, 3, 'ахборотнома 2019.1.pdf', '2021-01-19 09:26:42', '2021-01-19 09:26:42'),
(1287, 209, 2, 'Етук малакали кадрларни тайёрлашнинг ҳуқуқий асослари', 1, 0, 'Изображение 002.jpg', '2021-01-20 06:39:31', '2021-01-20 06:39:31'),
(1288, 226, 2, 'Международно-правовые меры совершенствования нормативно-правовых актов по противодействию преступлению в сфере информационной безопасности и киберпреступности', 1, 4, 'Международно-правовые меры совершенствования нормативно-правовых актов по противодействию преступлению в сфере информационной безопасности и киберпреступности 1.pdf', '2021-01-20 07:16:49', '2021-01-20 07:16:49'),
(1289, 226, 2, 'Криминологическая характеристика преступлений в сфере информационных (компьютерных) преступлений', 1, 4, 'Криминологическая характеристика преступлений в сфере информационных (компьютерных) преступлений.pdf', '2021-01-20 07:24:23', '2021-01-20 07:24:23'),
(1290, 226, 2, 'Уголовно-правовая и криминалистическая характеристика мошенничества, совершенное с использованием информационных -технологий', 2, 5, 'Уголовно-правовая и криминалистическая характеристика мошенничества, совершенное с использованием информационных -технологий.pdf', '2021-01-20 07:25:53', '2021-01-20 07:25:53'),
(1291, 209, 2, 'коррупцияга қарши курашишда давлат органларининг роли', 1, 5, 'XIX аср илм фан 2019.pdf', '2021-01-20 07:49:59', '2021-01-20 07:49:59'),
(1292, 209, 2, 'фуқаролар мурожаати эътиборда', 1, 8, 'газета огохлик тонги 2015.pdf', '2021-01-20 07:51:35', '2021-01-20 07:51:35'),
(1293, 226, 2, 'Уголовно-правовая охрана отношений в области электронной коммерции', 1, 5, 'Уголовно-правовая охрана отношений в области электронной коммерции.pdf', '2021-01-20 07:57:35', '2021-01-20 07:57:35'),
(1294, 226, 2, 'Законодательное определение информационной безопасности в Республике Узбекистан', 1, 5, 'Законодательное определение информационной безопасности в Республике Узбекистан.pdf', '2021-01-20 07:59:19', '2021-01-20 07:59:19'),
(1295, 226, 2, 'Ўзбекистонда ўлим жазосининг бекор қилиниши ва Жиноят кодексини янада либераллаштириш марралари', 2, 4, 'Ўзбекистонда ўлим жазосининг бекор қилиниши ва Жиноят кодексини янада либераллаштириш марралари.pdf', '2021-01-20 08:00:17', '2021-01-20 08:00:17'),
(1296, 226, 2, 'Сфера обеспечения информационной безопасности государства, как объект преступных посягательств и их место, роль в системе Особенной части УК Республики Узбекистан', 2, 5, 'Сфера обеспечения информационной безопасности государства, как объект преступных посягательств и их место, роль в системе Особенной части УК Республики Узбекистан.pdf', '2021-01-20 08:01:15', '2021-01-20 08:01:15'),
(1297, 209, 2, 'ИИО тўғрисидаги қонунила инсон манфаатларининг  кафолати', 2, 5, 'ИИО тўғ қон аҳам.pdf', '2021-01-20 08:03:52', '2021-01-20 08:03:52'),
(1298, 209, 1, 'ЖТ ва ХТда ахборот-таҳлил фаолиянинг аҳамияти', 1, 3, 'Қонунчилик таҳлили 2019 2сон.pdf', '2021-01-20 08:06:28', '2021-01-20 08:06:28'),
(1299, 209, 2, 'ИИОда АТФнинг амалиётдагиўрни ва хужжатларни тайёрлаш босқичлари', 1, 5, 'Миграция тўплам 2019.pdf', '2021-01-20 08:08:32', '2021-01-20 08:08:32'),
(1300, 209, 2, 'Ҳуқуқбузарликлар профилактикасида ИИОнинг ахборот олиш ва уни таҳлил қилиш фаолиятининг аҳамияти', 1, 5, 'Ҳуқуқбузарликлар Профилактикаси Долзар масалалар 2019.pdf', '2021-01-20 08:11:12', '2021-01-20 08:11:12'),
(1301, 209, 2, 'Ҳуқуқий қонунчилик тарғиботини ташкил этишда бошқарув қарорларининг аҳамияти', 2, 5, 'ҳуқуқий таълим тар ......pdf', '2021-01-20 08:13:40', '2021-01-20 08:13:40'),
(1302, 226, 1, 'Преступления в сфере информационных технологий и информационной безопасности. Профилактика и противодействие.', 1, 3, 'Преступления в сфере информационных технологий и информационной безопасности. Профилактика и противодействие..pdf', '2021-01-20 08:28:47', '2021-01-20 08:28:47'),
(1303, 226, 1, 'Международно-правовые аспекты противодействия нарушениям конституционных (личных) прав и свобод личности в информационных системах и глобальной сети Интернет', 1, 3, 'Международно-правовые аспекты противодействия нарушениям конституционных (личных) прав и свобод личности в информационных системах и глобальной сети Интернет.pdf', '2021-01-20 08:29:53', '2021-01-20 08:29:53'),
(1304, 226, 1, 'Тенденции развития объекта киберпреступлений в англосаксонской правовой системе', 1, 2, 'Тенденции развития объекта киберпреступлений в англосаксонской правовой системе.pdf', '2021-01-20 08:31:01', '2021-01-20 08:31:01'),
(1305, 226, 1, 'Фирибгарлик жинояти ва уни тўғри квалификация қилиш билан боғлиқ мулоҳазалар', 1, 3, 'Фирибгарлик жинояти ва уни тўғри квалификация қилиш билан боғлиқ мулоҳазалар.pdf', '2021-01-20 08:31:59', '2021-01-20 08:31:59'),
(1306, 209, 2, 'етук малакали кадрларни тайёрлаш инг ҳуқуқий асослари', 1, 5, 'етук кадрларни тарбиялаш.pdf', '2021-01-20 08:33:18', '2021-01-20 08:33:18'),
(1307, 209, 2, 'Жис ва юрид шахсларнинг мурож тўғ қон ўзига хос хусусиятлари', 1, 5, 'Жис ва юрид шахснинг мурожаатлари тўғрисидаги қонуннинг ўзига хос хусусияти.pdf', '2021-01-20 08:34:56', '2021-01-20 08:34:56'),
(1308, 226, 1, 'Ўзбекистон Республикаси электрон ҳукумати тизимида ахборот хавфсизлигини ташкилий-ҳуқуқий таъминлашнинг айрим жиҳатлари', 1, 3, 'Ўзбекистон Республикаси электрон ҳукумати тизимида ахборот хавфсизлигини ташкилий-ҳуқуқий таъминлашнинг айрим жиҳатлари.pdf', '2021-01-20 08:36:01', '2021-01-20 08:36:01'),
(1309, 209, 2, 'Оилада вояга етмаганларнинг маъ хус шаклда таълим-тарбиянинг аҳамияти', 1, 5, 'оилада вояга етмаганларнинг маънавий хусусиятларни шакллантиришда таълим-тарбиянинг аҳамияти.pdf', '2021-01-20 08:36:14', '2021-01-20 08:36:14'),
(1310, 226, 1, 'Information security in the criminal legislation of the Republic of Uzbekistan', 1, 2, 'Information security in the criminal legislation of the Republic of Uzbekistan.pdf', '2021-01-20 08:37:15', '2021-01-20 08:37:15'),
(1311, 226, 1, 'Современные тенденции развития международного сотрудничества по противодействию киберпреступности', 1, 3, 'Современные тенденции развития международного сотрудничества по противодействию киберпреступности.pdf', '2021-01-20 08:38:05', '2021-01-20 08:38:05'),
(1312, 226, 1, 'Проблемы определения субъективной стороны при квалификации несанкционированного доступа к компьютерной информации', 2, 3, 'Проблемы определения субъективной стороны при квалификации несанкционированного доступа к компьютерной информации.pdf', '2021-01-20 08:39:11', '2021-01-20 08:39:11'),
(1313, 226, 1, 'Детерминанты преступлений в сфере информационных технологий и безопасности', 1, 2, 'Детерминанты преступлений в сфере информационных технологий и безопасности.pdf', '2021-01-20 08:40:20', '2021-01-20 08:40:20'),
(1314, 226, 1, 'Влияние сети Интернет на формирование личности молодых хакеров', 1, 3, 'Влияние сети Интернет на формирование личности молодых хакеров.pdf', '2021-01-20 08:42:05', '2021-01-20 08:42:05'),
(1315, 226, 1, 'Замонавий Интернет-кафе ва Интернет клублар фаолиятининг ҳуқуқий асослари', 1, 3, 'Замонавий Интернет-кафе ва Интернет клублар фаолиятининг ҳуқуқий асослари.pdf', '2021-01-20 08:42:35', '2021-01-20 08:42:35'),
(1316, 226, 1, 'Юридический анализ хищений в киберпространствеUntitled', 1, 3, 'Юридический анализ хищений в киберпространствеUntitled.pdf', '2021-01-20 08:43:33', '2021-01-20 08:43:33'),
(1317, 226, 1, 'Родовой объект преступлений в сфере информационных технологий и безопасности', 1, 3, 'Родовой объект преступлений в сфере информационных технологий и безопасности.pdf', '2021-01-20 08:44:26', '2021-01-20 08:44:26'),
(1318, 226, 1, 'Реализация права доступа в Интернет в Республике Узбекистан', 1, 3, 'Реализация права доступа в Интернет в Республике Узбекистан.pdf', '2021-01-20 08:46:41', '2021-01-20 08:46:41'),
(1319, 226, 1, 'Негативное влияние социальных сетей', 1, 3, 'Негативное влияние социальных сетей.pdf', '2021-01-20 08:47:21', '2021-01-20 08:47:21'),
(1320, 226, 1, 'Противодействие кибертерроризму: международно-правовые и уголовно-правовые аспекты', 1, 3, 'Противодействие кибертерроризму.pdf', '2021-01-20 08:48:40', '2021-01-20 08:48:40'),
(1321, 226, 1, 'Концептуальные основы уголовно-правовой охраны информационных отношений в Республике Узбекистан', 1, 3, 'Концептуальные основы уголовно-правовой охраны информационных отношений в Республике Узбекистан.pdf', '2021-01-20 08:49:37', '2021-01-20 08:49:37'),
(1322, 226, 2, 'Особенности производства проверочных действий в стадии возбуждения уголовного дела', 1, 4, 'Особенности производства проверочных действий в стадии возбуждения уголовного дела.pdf', '2021-01-20 08:54:11', '2021-01-20 08:54:11'),
(1323, 226, 2, 'Международно-правовые меры совершенствования нормативно-правовых актов по противодействию преступлению в сфере информационной безопасности и киберпреступности', 1, 4, 'Международно-правовые меры совершенствования нормативно-правовых актов по противодействию преступлению в сфере информационной безопасности и киберпреступности.pdf', '2021-01-20 08:56:41', '2021-01-20 08:56:41'),
(1324, 226, 2, 'Криминологическая характеристика преступлений в сфере информационных (компьютерных) преступлений', 1, 5, 'Криминологическая характеристика преступлений в сфере информационных (компьютерных) преступлений.pdf', '2021-01-20 08:57:50', '2021-01-20 08:57:50'),
(1325, 226, 1, 'Information security and criminal law (Uzbek and foreign experience)', 2, 2, 'Information security and criminal law (Uzbek and foreign experience).pdf', '2021-01-20 08:59:00', '2021-01-20 08:59:00'),
(1326, 226, 1, 'Уголовно-правовой анализ норм национального и зарубежного законодательства, обеспечивающих информационную безопасность в сети Интернет.', 1, 3, 'Уголовно-правовой анализ норм национального и зарубежного законодательства, обеспечивающих информационную безопасность в сети Интернет..pdf', '2021-01-20 09:00:25', '2021-01-20 09:00:25'),
(1327, 226, 2, 'Международное сотрудничество и опыт уголовно-правового регулирования противодействия компьютерным преступлениям1', 1, 5, 'Международное сотрудничество и опыт уголовно-правового регулирования противодействия компьютерным преступлениям1.pdf', '2021-01-20 09:01:32', '2021-01-20 09:01:32'),
(1328, 226, 1, 'Некоторые вопросы международного сотрудничества в сфере противодействия киберпреступлениям', 1, 2, 'Некоторые вопросы международного сотрудничества в сфере противодействия киберпреступлениям.pdf', '2021-01-20 09:05:18', '2021-01-20 09:05:18'),
(1329, 226, 1, 'Противодействие киберпреступности современные подходы по подготовке кадров Юрист Ахборотномаси 2020', 1, 3, 'Противодействие киберпреступности современные подходы по подготовке кадров Юрист Ахборотномаси 2020.pdf', '2021-01-20 09:07:56', '2021-01-20 09:07:56'),
(1330, 312, 2, 'жис ва юрик шахсларнинг мурожаатлари қонун ҳимиясида', 2, 5, 'Жис ва юрид шахснинг мурожаатлари тўғрисидаги қонуннинг ўзига хос хусусияти.pdf', '2021-01-20 09:17:05', '2021-01-20 09:17:05'),
(1331, 312, 2, 'ИИО нинг транспортда хавф таъ бўлинмалари фаолиятининг хуқуқий асослари', 1, 5, 'ёшларни террор.pdf', '2021-01-20 09:18:53', '2021-01-20 09:18:53'),
(1332, 312, 2, 'ИИОнинг транспортда жамоат хавфсизлигини таъминлашда терроризмнинг олдини олиш муаммолари', 1, 5, 'ИИОда Нормтив.pdf', '2021-01-20 09:20:46', '2021-01-20 09:20:46'),
(1333, 226, 2, 'Characteristics of general prevention of offences and its basic properties USA_Covid19', 2, 4, 'Characteristics of general prevention of offences and its basic properties USA_Covid19.pdf', '2021-01-20 09:21:17', '2021-01-20 09:21:17'),
(1334, 312, 2, 'ИИО тўғрисидаги қонунила инсон манфаатларининг  кафолати', 2, 5, 'ИИО тўғ қон аҳам.pdf', '2021-01-20 09:22:24', '2021-01-20 09:22:24'),
(1335, 226, 2, 'Legal provision of information security asan integral factor in the context of a pandemic', 2, 4, 'Legal provision of information security asan integral factor in the context of a pandemic Расулев Собиров Саъдуллаев 1-10-20200630.pdf', '2021-01-20 09:23:27', '2021-01-20 09:23:27'),
(1336, 226, 2, 'Countering cybercrime: modern approaches to training', 2, 4, 'Countering cybercrime modern approaches to training12.pdf', '2021-01-20 09:30:29', '2021-01-20 09:30:29'),
(1337, 226, 1, 'Ножўя (жиноий) қилмиш учун жавобгарлик белгиланган хорижий давлатлар тажрибаси ва уларни Ўзбекистон Республикаси Жиноят кодексида қўллаш имкониятлари', 2, 3, 'Ножўя (жиноий) қилмиш учун жавобгарлик белгиланган хорижий давлатлар тажрибаси ва уларни Ўзбекистон Республикаси Жиноят кодексида қўллаш имкониятлари2020 2-сон 1200.pdf', '2021-01-20 09:33:29', '2021-01-20 09:33:29'),
(1338, 226, 1, 'Ҳуқуқбузарликлар профилактикаси ислоҳот, натижа ва истиқбол', 2, 3, 'Ҳуқуқбузарликлар профилактикаси ислоҳот, натижа ва истиқбол.pdf', '2021-01-20 09:35:29', '2021-01-20 09:35:29'),
(1339, 226, 1, 'Crimes in the field of information technology and security determinants and warnings', 2, 1, 'Crimes in the field of information technology and security determinants and warnings .pdf', '2021-01-20 09:58:25', '2021-01-20 09:58:25'),
(1340, 226, 1, 'Организационно-правовые   аспекты   применения цифровых  технологий  в  противодействии  коррупции зарубежный опыт правоприменительной практики )', 2, 1, 'Организационно-правовые   аспекты   применения цифровых  технологий  в  противодействии  коррупции зарубежный опыт правоприменительной практики ).pdf', '2021-01-20 09:59:37', '2021-01-20 09:59:37'),
(1341, 226, 1, 'Ҳозирги босқичда Ўзбекистон Республикасида ахборот технологиялари ва хавфсизлиги соҳасидаги жиноятларга қарши курашиш', 2, 3, 'Ҳозирги босқичда Ўзбекистон Республикасида ахборот технологиялари ва хавфсизлиги соҳасидаги жиноятларга қарши курашиш12.pdf', '2021-01-20 13:29:32', '2021-01-20 13:29:32'),
(1342, 226, 1, 'Правовые меры реагирования по противодействию киберпреступлениям и подготовка кадров в сфере информационной безопасности', 2, 2, 'Правовые меры реагирования по противодействию киберпреступлениям и подготовка кадров в сфере информационной безопасности.pdf', '2021-01-20 13:32:06', '2021-01-20 13:32:06'),
(1343, 226, 2, 'Стремление к честности – долг каждого', 1, 5, 'Стремление к честности – долг каждого.pdf', '2021-01-21 04:15:52', '2021-01-21 04:15:52'),
(1344, 226, 1, 'Уголовно-правовые основы защиты частной собственности в сети Интернет', 1, 3, 'Уголовно-правовые основы защиты частной собственности в сети Интернет.pdf', '2021-01-21 04:17:10', '2021-01-21 04:17:10'),
(1345, 226, 1, 'Determinants of crimes in the sphere of information technologies and safety.', 1, 2, 'Determinants of crimes in the sphere of information technologies and safety..pdf', '2021-01-21 04:18:56', '2021-01-21 04:18:56'),
(1346, 226, 1, 'Как осуществляется сбор киберулик', 2, 2, 'Как осуществляется сбор киберулик.pdf', '2021-01-21 04:20:11', '2021-01-21 04:20:11'),
(1347, 226, 2, 'Взаимодействие в области профилактики правонарушений', 1, 5, 'Взаимодействие в области профилактики правонарушений.pdf', '2021-01-21 04:21:04', '2021-01-21 04:21:04'),
(1348, 226, 1, 'Новые подходы к подготовке специалистов в сфере предупреждения киберпреступности', 1, 2, 'Новые подходы к подготовке специалистов в сфере предупреждения киберпреступности.pdf', '2021-01-21 04:22:42', '2021-01-21 04:22:42'),
(1349, 226, 2, 'Importance of international cooperation in fight against cybercrimes', 1, 4, 'Importance of international cooperation in fight against cybercrimes.pdf', '2021-01-21 04:23:48', '2021-01-21 04:23:48'),
(1350, 226, 1, 'Dialogue as the new form of prevention of cybercrime among youth', 1, 2, 'Dialogue as the new form of prevention of cybercrime among youth.pdf', '2021-01-21 04:24:55', '2021-01-21 04:24:55'),
(1351, 226, 1, 'The personality of the criminal committing computer crimes', 1, 3, 'The personality of the criminal committing computer crimes.pdf', '2021-01-21 04:26:48', '2021-01-21 04:26:48'),
(1352, 226, 1, 'Современные вопросы развития института пробации в уголовном законадательстве Республики Узбекистан', 2, 2, 'Современные вопросы развития института пробации в уголовном законадательстве Республики Узбекистан.pdf', '2021-01-21 07:02:25', '2021-01-21 07:02:25'),
(1353, 226, 1, 'Институт уголовных проступков зарубежный опыт и возможности их применения в законодательстве Республики Узбекистан', 2, 2, 'Институт уголовных проступков зарубежный опыт и возможности их применения в законадательстве Республики Узбекистан.pdf', '2021-01-21 07:03:56', '2021-01-21 07:03:56'),
(1354, 226, 2, 'Криминологическая характеристика преступлений в сфере информационных (компьютерных) преступлений', 1, 5, 'Криминологическая характеристика преступлений в сфере информационных (компьютерных) преступлений.pdf', '2021-01-21 07:04:55', '2021-01-21 07:04:55'),
(1355, 226, 1, 'Уголовно-правовое обеспечение информационной безопасности в сети Интернет', 1, 3, 'Уголовно-правовое обеспечение информационной безопасности в сети Интернет.pdf', '2021-01-21 07:06:38', '2021-01-21 07:06:38'),
(1356, 226, 2, 'Актуальные проблемы борьбы с преступлениями в сфере информационных технологий и безопасности', 2, 5, 'Актуальные проблемы борьбы с преступлениями в сфере информационных технологий и безопасности.pdf', '2021-01-21 07:07:54', '2021-01-21 07:07:54'),
(1357, 226, 2, 'Маъмурий ҳуқуқбузарликлар тўғрисидаги ишларни юритишда далиллар ва уларга баҳо беришни такомиллаштириш', 1, 5, 'Маъмурий ҳуқуқбузарликлар тўғрисидаги ишларни юритишда далиллар ва уларга баҳо беришни такомиллаштириш.pdf', '2021-01-21 07:08:30', '2021-01-21 07:08:30'),
(1358, 216, 1, 'Ichki ishlar organlari hodimlarini jismoniy tayyorgarlik motivassiyasi', 1, 3, '2021 1.1.pdf', '2021-01-21 10:11:45', '2021-01-21 10:11:45'),
(1359, 209, 2, 'вояга етмагларининг жис-ахлоқ-маъ саломатлигини нормал ривожнинг конс-вий кафолати', 1, 4, 'вояга етмагларининг жис-ахлоқ-маъ саломатлигини нормал ривожнинг конс-вий кафолати.pdf', '2021-01-22 05:21:20', '2021-01-22 05:21:20'),
(1360, 209, 2, 'дав орг коррупция қар кур иштироки ва аҳамияти', 1, 0, 'дав орг коррупция қар кур иштироки ва аҳамияти.pdf', '2021-01-22 05:22:56', '2021-01-22 05:22:56'),
(1361, 209, 2, 'дав орг коррупция қар кур иштироки ва аҳамияти', 1, 5, 'дав орг коррупция қар кур иштироки ва аҳамияти.pdf', '2021-01-22 05:24:58', '2021-01-22 05:24:58'),
(1362, 209, 2, 'долзарб муаммолар', 1, 5, 'долзарб муаммолар .pdf', '2021-01-22 05:25:54', '2021-01-22 05:25:54'),
(1363, 209, 2, 'Оилада вое етма  маън шакл таъ-тар  аҳам', 1, 5, 'Оилада вое етма  маън шакл таъ-тар ўрни 2.  .pdf', '2021-01-22 05:27:18', '2021-01-22 05:27:18'),
(1364, 209, 2, 'фоҳ сақ ва қўш қил жиноятининг объект белгилари', 1, 5, 'фоҳ сақ ва қўш қил жиноятининг объект белгилари.pdf', '2021-01-22 05:28:08', '2021-01-22 05:28:08'),
(1365, 209, 2, 'Фоҳшахона сақлаш ёки қўшмач қил-транцмиллий жиноятларнинг бир тури сифатида', 1, 5, 'Фоҳшахона сақлаш ёки қўшмач қил-транцмиллий жиноятларнинг бир тури сифатида.pdf', '2021-01-22 05:28:49', '2021-01-22 05:28:49'),
(1366, 204, 2, 'Commerce security: legal and policy aspects of technology solutions in Uzbekistan (Proceedings of Globol Technovation 2 nd International Multidisciplinary Scientific conference) Hosted from London, U.K. December 28 th, 2020  –– Б. 153-155.;', 2, 4, '471-Article Text-1880-1-10-20201228.pdf', '2021-01-23 05:28:39', '2021-01-23 05:28:39'),
(1367, 317, 1, 'Терговга қадар текширув инситутининг хусусиятлари ва уни янада такомиллаштириш истиқболлари', 1, 3, 'Сканировать4.PDF', '2021-01-23 07:30:52', '2021-01-23 07:30:52'),
(1368, 317, 2, 'Следственно-оперативная группа как эффективная форма взаимодействия дознавателя и следователя сорганами, осуществляющими доследственную проверку', 1, 4, 'Сканировать40003.PDF', '2021-01-23 07:32:06', '2021-01-23 07:32:06'),
(1369, 174, 2, 'Ўзбекистонда «Хавфсиз шаҳар» комплекс дастурий таъминоти доирасида ҳаракат хавфсизлигини таъминлаш масалалари', 1, 5, 'макола ражабов.docx', '2021-01-25 04:45:18', '2021-01-25 04:45:18'),
(1370, 309, 1, 'Sharxlash', 1, 3, 'Axb.maqola.pdf', '2021-01-25 10:41:04', '2021-01-25 10:41:04'),
(1371, 309, 1, 'XMQO', 1, 3, 'Axb-maq.TDYI.pdf', '2021-01-25 10:42:14', '2021-01-25 10:42:14'),
(1372, 309, 1, 'Sharxlash kateg.', 1, 3, 'Axb-maqola2.pdf', '2021-01-25 10:43:35', '2021-01-25 10:43:35'),
(1373, 309, 0, 'HvaB', 1, 0, 'Huq va burch-Jurnal.pdf', '2021-01-25 10:46:34', '2021-01-25 10:46:34'),
(1374, 309, 1, 'HvaB', 1, 3, 'Huq va burch-Jurnal.pdf', '2021-01-25 10:47:16', '2021-01-25 10:47:16'),
(1375, 309, 2, 'Xuq.fuq-jam', 1, 5, 'Ilm.maqola XDM.pdf', '2021-01-25 10:49:26', '2021-01-25 10:49:26'),
(1376, 309, 1, 'Dav.hok', 1, 7, 'Ilm-maq Dav,hok dem.pdf', '2021-01-25 10:51:10', '2021-01-25 10:51:10'),
(1377, 309, 1, 'Shar[lashning xuq.jar', 1, 3, 'Ilm-maq Dav,hok dem.pdf', '2021-01-25 10:53:16', '2021-01-25 10:53:16'),
(1378, 309, 2, 'Kons.inson', 1, 5, 'Ilm-maq-Isl.univer.pdf', '2021-01-25 10:54:47', '2021-01-25 10:54:47'),
(1379, 309, 2, 'Ins-fuq', 1, 6, 'KX-maqola Isl.univ.pdf', '2021-01-25 10:56:03', '2021-01-25 10:56:03'),
(1380, 309, 2, 'Konstitusiya taraqqiyot', 1, 5, 'Res.maq kons.pdf', '2021-01-25 11:04:57', '2021-01-25 11:04:57'),
(1381, 309, 1, 'Sharxlash', 1, 2, 'chet maqola-Jurnal.pdf', '2021-01-25 11:06:41', '2021-01-25 11:06:41'),
(1382, 309, 1, 'Osobennosti tolkovaniya', 1, 2, 'Xalqaro maqola.pdf', '2021-01-25 11:09:09', '2021-01-25 11:09:09'),
(1383, 309, 2, 'jamoanch.nazorati', 1, 5, 'res.maq-JN.pdf', '2021-01-25 11:12:41', '2021-01-25 11:12:41'),
(1384, 309, 0, 'Sharxlash ayrim usul', 1, 0, 'Res.maq.Sharx,us.pdf', '2021-01-25 11:15:29', '2021-01-25 11:15:29'),
(1385, 309, 2, 'Sharxlash ayrim usul', 1, 5, 'Res.maq.Sharx,us.pdf', '2021-01-25 12:46:05', '2021-01-25 12:46:05'),
(1386, 309, 2, 'Mamlakatimizda inson xoquqlarini', 1, 5, 'Ilmiy-maqola.pdf', '2021-01-26 06:40:59', '2021-01-26 06:40:59'),
(1387, 171, 2, 'НЕКОТОРЫЕ ОТЗЫВЫ ПО ВОПРОСАМ КОРРУПЦИИ И ЕЕ ПРЕДУПРЕЖДЕНИЯ', 2, 4, 'Аброр мақола.pdf', '2021-01-28 04:22:20', '2021-01-28 04:22:20'),
(1388, 204, 2, 'ПРОБЛЕМЫ ВИКТИМОЛОГИЧЕСКИХ ПРОФИЛАТИКИ КОРРУПЦИОННЫХ ПРАВОНАРУШЕНИЙ А ТАКЖЕ ВОПРОСЫ ИХ УСТРАНЕНИЙ', 1, 4, 'Райимов.pdf', '2021-01-28 04:39:54', '2021-01-28 04:39:54'),
(1389, 226, 2, 'Современные вопросы применения цифровых технологий в противодействии коррупции', 1, 4, 'А.К. Расулев коррупция.pdf', '2021-01-28 05:02:59', '2021-01-28 05:02:59'),
(1390, 202, 2, 'Организационные меры по противодействию коррупции в Республике Узбекистан', 1, 4, 'Г.А.Саъдуллаев коррупция.pdf', '2021-01-28 05:05:43', '2021-01-28 05:05:43'),
(1391, 111, 1, 'Adolat kuychisi', 1, 7, 'photo_2021-01-28_16-01-44.jpg', '2021-01-28 11:02:11', '2021-01-28 11:02:11'),
(1392, 111, 2, 'Adolat kuychisi', 1, 6, 'photo_2021-01-28_16-01-44.jpg', '2021-01-28 11:05:01', '2021-01-28 11:05:01'),
(1393, 100, 2, 'COMPETENT APPROACH AS THE TERM OF COMPREHENSIVE  DEVELOPMENT OF A PERSONALITY DURING STUDYING A  FOREIGN LANGUAGE', 1, 5, '2018 Миллий гвардияда макола 1.pdf', '2021-01-28 11:08:55', '2021-01-28 11:08:55'),
(1394, 100, 2, 'Free work of students at learning  foreign  language', 1, 5, '2018 Миллий гвардияда макола 2.pdf', '2021-01-28 11:10:17', '2021-01-28 11:10:17'),
(1395, 100, 2, 'Some thoughts on the issues of developing reading skills and critical thinking of b1 level learners', 1, 5, '2020 Жиззах Пединститут Филология масалалари 2.pdf', '2021-01-28 11:35:05', '2021-01-28 11:35:05'),
(1396, 100, 2, 'COMPREHENSIVE DEVELOPMENT OF THE PERSONALITY IN TEACHING  FOREIGN LANGUAGES AT NON-LINGUISTIC FACULTIES', 1, 5, '2017 проф ПДФ 2.pdf', '2021-01-28 11:39:24', '2021-01-28 11:39:24'),
(1397, 222, 1, 'UNCONTROLLED CRIMINE PREVENTION', 1, 0, 'Халкаро макола 2.pdf', '2021-01-28 12:10:52', '2021-01-28 12:10:52'),
(1398, 255, 2, 'Туризм хавфсизлигини таъминлаш тўғрисидаги норматив-ҳуқуқий ҳужжатларнинг ички ишлар органларидаги ижроси хусусида', 1, 5, 'макола 1.pdf', '2021-01-29 04:43:57', '2021-01-29 04:43:57'),
(1399, 255, 2, 'Туризм хавфсизлигининг конституциявий-ҳуқуқий асослари', 1, 5, 'макола 2.pdf', '2021-01-29 04:47:09', '2021-01-29 04:47:09'),
(1400, 255, 2, 'Ички ишлар органларининг хвфсиз туризмни таъминлаш соҳасидаги маъмурий-ҳуқуқий ислоҳотлар', 1, 5, 'макола 3.pdf', '2021-01-29 04:48:30', '2021-01-29 04:48:30'),
(1401, 226, 2, 'Обеспечение прав и законных интересов личности при производстве выемки и обыска', 2, 5, 'Обеспечение прав и законных интересов личности при производстве выемки и обыска.pdf', '2021-01-30 05:49:39', '2021-01-30 05:49:39'),
(1402, 226, 1, 'Развитие системы международных стандартов и законодательных основ зарубежных стран в сфере защиты лиц, сообщающих о коррупционных правонарушениях', 2, 2, 'Development of the system ...pdf', '2021-01-30 05:50:47', '2021-01-30 05:50:47'),
(1403, 290, 2, 'Жиноят ҳуқуқида қасддан жиноят содир этиш босқичлари', 2, 5, 'Документ Microsoft Office Word.docx', '2021-01-30 08:51:12', '2021-01-30 08:51:12'),
(1404, 309, 2, 'Parlament nazoratining kons.asoslari', 1, 5, 'Kons.davlat va jamiyat taraq-muhim poydevori.pdf', '2021-02-01 05:20:19', '2021-02-01 05:20:19'),
(1405, 309, 2, 'Talim tarbiyada huquq normalarini sharhlash', 1, 5, 'Huquq.tal tarb huquq tartib.pdf', '2021-02-01 05:22:56', '2021-02-01 05:22:56'),
(1406, 52, 2, 'Коррупцияга оид ҳуқуқбузарликлар профилактикаси самарадорлигини ошириш тўғрисида айрим мулоҳазалар', 2, 4, 'А.С.Турсунов, С.Б.Хўжақулов.pdf', '2021-02-01 05:36:15', '2021-02-01 05:36:15'),
(1407, 52, 2, 'НЕКОТОРЫЕ ОТЗЫВЫ ПО ВОПРОСАМ КОРРУПЦИИ И ЕЕ ПРЕДУПРЕЖДЕНИЯ', 2, 4, 'А.С.Турсунов, А.Ҳ.Мухиддинов.pdf', '2021-02-01 05:38:17', '2021-02-01 05:38:17'),
(1408, 52, 1, 'Янги Ўзбекистонда миллий параментни янада ривожлантириш имтиқболлари', 2, 3, 'А.С.Турсунов, С.Қ.Валиев.pdf', '2021-02-01 05:40:05', '2021-02-01 05:40:05'),
(1409, 165, 2, 'Тадбиркорлик фаолияти соҳасидаги коррупцион омилларнинг оммавий-ҳуқуқий жиҳатлари', 2, 4, '1 МАҚОЛА.pdf', '2021-02-01 11:13:22', '2021-02-01 11:13:22'),
(1410, 165, 2, 'Коррупцияни вужудга келтирувчи омиллар ва унга қарши курашишнинг айрим масалалари', 2, 4, '2 МАҚОЛА.pdf', '2021-02-01 11:14:12', '2021-02-01 11:14:12'),
(1411, 104, 2, 'Учение Матуриди - бесценное наследие', 1, 5, 'Учение Матуриди.doc', '2021-02-03 06:21:02', '2021-02-03 06:21:02'),
(1412, 104, 2, '\"Темур тузуклари\"да адолат ғоясининг янада ривожлантирилиши', 1, 5, 'Screenshot_2021-01-23-14-50-20-074_com.google.android.apps.docs.jpg', '2021-02-03 06:26:51', '2021-02-03 06:26:51'),
(1413, 100, 2, 'Чет тилларини ўқитишда замонавий техник воситаларнинг ўрни ва аҳамияти', 1, 5, '2015 Чет тилларини укитишда замонавий техник воситаларнинг урни ва аҳамияти.pdf', '2021-02-03 09:18:55', '2021-02-03 09:18:55'),
(1414, 227, 1, 'Ҳуқуқий тарбия - қонунийлик принципини таъминлаш гарови', 1, 3, 'МГ 2020.jpg', '2021-02-03 11:07:15', '2021-02-03 11:07:15'),
(1415, 165, 0, 'Ахборот хавфсизлигини таъминлашнинг меъёрий-ҳуқуқий асослари (Электрон тижорат мисолида)', 2, 0, '+sertifikat.pdf', '2021-02-06 13:06:38', '2021-02-06 13:06:38'),
(1416, 165, 0, 'Ахборот хавфсизлигини таъминлашнинг меъёрий-ҳуқуқий асослари (Электрон тижорат мисолида)', 2, 0, 'sertifikat.pdf', '2021-02-06 13:07:36', '2021-02-06 13:07:36'),
(1417, 165, 2, 'Ахборот хавфсизлигини таъминлашнинг меъёрий-ҳуқуқий асослари (Электрон тижорат мисолида)', 2, 4, 'sertifikat.pdf', '2021-02-06 13:08:26', '2021-02-06 13:08:26'),
(1418, 165, 2, 'ПОЧТА АЛОҚАСИ ХИЗМАТЛАРИДА АВТОМАТЛАШТИРИЛГАН МОБИЛ ДАСТУРИНИНГ АҲАМИЯТИ.', 2, 4, '560-Article Text-2066-1-10-20210129.pdf', '2021-02-06 13:09:39', '2021-02-06 13:09:39'),
(1419, 165, 2, 'ЖАМИЯТ РИВОЖИДА МАҲАЛЛАНИНГ ЎРНИ ВА УНИНГ БУГУНГИ КУНДАГИ МУАММОЛАРИ', 2, 4, '576-Article Text-2101-1-10-20210131.pdf', '2021-02-06 13:11:39', '2021-02-06 13:11:39'),
(1420, 236, 1, 'Жисмоний тарбия ва спортнинг мақсад ва вазифалари', 1, 3, 'макола.jpg', '2021-02-10 05:58:57', '2021-02-10 05:58:57'),
(1421, 163, 1, 'ЖИСМОНИЙ ТАРБИЯ ВА СПОРТ ЖАРАЁНЛАРИНИНГ АМАЛИЙ ВА НАЗАРИЙ ВОСИТАЛАРИ', 1, 3, 'IJTIMOIY GUMANITAR FANLAR 2-QISM.pdf', '2021-02-11 04:55:12', '2021-02-11 04:55:12'),
(1422, 233, 1, 'Жисмоний машқлар-касалликлардан ҳимоя қилишнинг муҳум воситасидир', 1, 3, 'IJTIMOIY GUMANITAR FANLAR 2-QISM.pdf', '2021-02-11 11:11:52', '2021-02-11 11:11:52'),
(1423, 233, 1, 'СОҒЛОМ ТУРМУШ ТАРЗИ ТАЛАБЛАРИ ВА КАСАЛЛИКЛАРНИНГ ОЛДИНИ ОЛИШ', 1, 3, 'IJTIMOIY GUMANITAR FANLAR 2-QISM.pdf', '2021-02-11 11:14:19', '2021-02-11 11:14:19'),
(1424, 134, 1, 'Transport vositalari va ulardan foydalanish qoidalarini buzish uchun javobgarlik', 1, 3, 'Тўплам Конференция 2020 24-25.pdf', '2021-02-12 07:11:33', '2021-02-12 07:11:33'),
(1425, 134, 1, 'Ehtiyotsizlik orqasida sodir etilgan jinoyatlarning kriminologik tavsifi va oldini olish', 1, 3, 'Эхтиётсизлик макола сканер.pdf', '2021-02-12 07:16:53', '2021-02-12 07:16:53'),
(1426, 134, 2, 'Ichki ishlar organlari profilaktika xizmatlari tizimida amalga oshirilgan islohotlarning ahamiyati', 2, 5, 'ИИО да проф макола сканер.pdf', '2021-02-12 08:12:58', '2021-02-12 08:12:58'),
(1427, 134, 1, 'Yashash huquqi insonning tabiiy huquqidir', 1, 3, 'Axborotnoma-2019-3.pdf', '2021-02-12 08:14:12', '2021-02-12 08:14:12'),
(1428, 319, 1, 'Sud huquq tizimida amalga oshirilayotgan islohotlarning konstitusiyaviy huquqiy mexanizmlari', 1, 3, 'Axborotnoma-2019-1.pdf', '2021-02-12 08:46:19', '2021-02-12 08:46:19'),
(1429, 211, 1, 'Юридик фанлар бўйича илмий тадқиқотларнинг ҳолати ва муаллифлик ҳуқуқларининг муҳофазаси ҳақида', 1, 3, 'Axborotnoma-2020-3.pdf.pdf', '2021-02-12 09:34:18', '2021-02-12 09:34:18'),
(1430, 211, 1, 'Конституция — ҳуқуқ ва эркинликларимиз кафолати', 2, 3, 'Qonunchilik-1-2021- Қисқа.pdf', '2021-02-12 10:06:08', '2021-02-12 10:06:08'),
(1431, 275, 1, 'Роль образованности женщины в воспитании молодого поколения', 1, 3, 'Тўплам Конференция 2020.pdf', '2021-02-12 10:28:20', '2021-02-12 10:28:20'),
(1432, 52, 1, 'Ички ишлар органлари тизимида фундаментал ва амалиётга йўналтирилган илмий тадқиқотлар самарадорлигини ошириш', 1, 3, 'сканирование0033.jpg', '2021-02-13 05:33:01', '2021-02-13 05:33:01'),
(1433, 275, 1, 'Коррупцияга қарши курашиш ва комлпаенс назорат тизимини жорий этиш истиқболлари', 1, 3, 'Тўплам 2020 Таҳрир қилингани 20.pdf', '2021-02-13 07:16:09', '2021-02-13 07:16:09'),
(1434, 275, 1, 'Коррупцияга қарши курашиш ва комлпаенс назорат тизимини жорий этиш истиқболлари', 1, 3, 'Тўплам 2020 Таҳрир қилингани 20.pdf', '2021-02-13 07:16:34', '2021-02-13 07:16:34'),
(1435, 178, 1, 'Коррупцияга қарши курашиш ва комлпаенс назорат тизимини жорий этиш истиқболлари', 1, 3, 'коррупция макола.pdf', '2021-02-13 09:55:58', '2021-02-13 09:55:58'),
(1436, 178, 1, 'XXI АСР ИЛМ-ФАНИ: МУАММО ВА ИСТИҚБОЛЛ', 2, 3, 'расул ака 21 аср.pdf', '2021-02-13 10:40:00', '2021-02-13 10:40:00'),
(1437, 320, 1, 'ҚАДИМГИ ХИНДИСТОНДА СУД ЖАРАЁНИНИНГ ҲУҚУҚИЙ МАНБАЛАРИ', 1, 3, '3 LEGAL SOURCES OF ANCIENT INDIA’S LEGAL PROCEEDINGS.pdf', '2021-02-13 10:46:04', '2021-02-13 10:46:04'),
(1438, 320, 1, 'Уголовно‐процессуальный	закон	как	социально‐ функциональная	ценность', 1, 3, '14. Мухитдинов Ф.М..pdf', '2021-02-13 10:53:30', '2021-02-13 10:53:30'),
(1439, 174, 1, 'Ўзбекистонда хавфсиз йўл дастурий таъминотини ишлаб чиқишга доир мулоҳазалар', 1, 1, 'макола ражабов.docx', '2021-02-15 12:35:03', '2021-02-15 12:35:03'),
(1440, 111, 1, 'Ўзбекистонда давлат тилининг қўлланишига оид баъзи масалалар', 1, 3, '2021-02-11-Вазин ИИВ.pdf', '2021-02-16 06:25:33', '2021-02-16 06:25:33'),
(1441, 84, 2, 'Йўл-транспорт ҳодисалари кўп содир бўладиган жойларни камайтиришнинг замонавий усуллари', 2, 5, '9. Мақола.pdf', '2021-02-17 11:42:49', '2021-02-17 11:42:49'),
(1442, 84, 2, 'Аҳоли пунктларида пиёдаларнинг хавфсиз ҳаракатланишини ташкил этиш', 2, 5, '10. Мақола.pdf', '2021-02-17 11:44:22', '2021-02-17 11:44:22'),
(1443, 287, 2, 'Diniy ekstremizmning fuqarolar tinchligi va xavfsizligiga tahdidi', 2, 4, 'Новый документ 2021-02-17 (1) (2).pdf', '2021-02-17 13:15:23', '2021-02-17 13:15:23'),
(1444, 287, 1, 'diniy ekstremistik oqimlar. Mohiyat. Mazmun', 1, 7, 'Новый документ 2021-02-17 (1).pdf', '2021-02-17 13:28:54', '2021-02-17 13:28:54'),
(1445, 287, 2, 'diniy ekstremistik oqimlar. Mohiyat. Mazmun', 1, 5, 'Новый документ 2021-02-17 (1).pdf', '2021-02-17 13:30:23', '2021-02-17 13:30:23'),
(1446, 323, 2, 'Экстремизм ва терроризмга қарши курашиш марказий осиё минтақасидаги тинчлик ва ҳавфсизлик гарови', 1, 5, 'макола.pdf', '2021-02-18 07:23:45', '2021-02-18 07:23:45'),
(1447, 323, 2, 'Коррупцияни олдини олишнинг асосий йўналишлари', 2, 5, 'Мақола1.pdf', '2021-02-19 06:02:27', '2021-02-19 06:02:27'),
(1448, 323, 2, 'Коррупцияга қарши ахлоқий фазилатларни ички ишлар органлари ходимларида шакиллантиришнинг ўрни ва аҳамияти', 2, 5, 'маққола 2.pdf', '2021-02-19 06:16:28', '2021-02-19 06:16:28'),
(1449, 323, 2, 'Мулкка қарши ҳуқуқбузарликлар профилактикасининг ўзига хос хусусияти', 2, 5, 'Мақола 4.pdf', '2021-02-19 06:57:25', '2021-02-19 06:57:25'),
(1450, 323, 1, 'Ёшларни экстремистик ғоялар таъсирига тушиб қолишини олдини олишнинг муҳим аҳамияти', 1, 3, 'Мақола 5.pdf', '2021-02-19 07:17:45', '2021-02-19 07:17:45'),
(1451, 323, 1, 'Экстремизм ва терроризм профилактикасини такомиллаштириш масаслалари', 1, 3, 'Мақола 5.pdf', '2021-02-19 07:49:29', '2021-02-19 07:49:29'),
(1452, 99, 1, 'маиший-турмуш соҳасидаги жиноятлардан жабирланган шахсларни ҳимоя қилиш масалалари', 1, 2, 'Jumaev Farrux Farmonovich.pdf', '2021-02-22 06:29:20', '2021-02-22 06:29:20'),
(1453, 226, 1, 'DISTINCTIVE FEATURES OF DIGITAL EVIDENCE', 0, 2, 'Science of the 21st century.pdf', '2021-02-22 10:02:34', '2021-02-22 10:02:34'),
(1454, 226, 2, 'Общественно-политические аспекты борьбы с терроризмом', 1, 4, 'Doc3.pdf', '2021-02-22 11:09:49', '2021-02-22 11:09:49'),
(1455, 226, 2, 'Международно-правовые проблемы борьбы с компьютерным терроризмом', 2, 4, 'Doc5.pdf', '2021-02-22 11:10:50', '2021-02-22 11:10:50'),
(1456, 83, 1, 'СОҒЛОМ ТУРМУШ ТАРЗИДА ЭКОЛОГИЯНИНГ АҲАМИЯТИ', 1, 7, 'IJTIMOIY GUMANITAR FANLAR 2-QISM.pdf', '2021-02-24 05:01:51', '2021-02-24 05:01:51'),
(1457, 83, 1, 'СОҒЛОМ ТУРМУШ ТАРЗИДА ЭКОЛОГИЯНИНГ АҲАМИЯТИ', 1, 7, 'photo_2021-02-24_10-14-53.jpg', '2021-02-24 05:12:31', '2021-02-24 05:12:31'),
(1458, 83, 2, 'СОҒЛОМ ТУРМУШ ТАРЗИДА ЭКОЛОГИЯНИНГ АҲАМИЯТИ', 1, 5, 'photo_2021-02-24_10-14-53.jpg', '2021-02-24 05:13:54', '2021-02-24 05:13:54'),
(1459, 99, 1, 'Оила-турмуш доирасидаги ҳуқуқбузарликлар профлактикасининг ташкил этиш масалалари', 1, 1, 'photo_2021-03-01_09-15-20.jpg', '2021-03-01 04:31:17', '2021-03-01 04:31:17'),
(1460, 226, 2, 'Кибержиноятчиликка қарши курашиш бу борада кадрлар тайёрлашнинг муҳим масалалари', 2, 5, 'на посту.pdf', '2021-03-01 13:56:55', '2021-03-01 13:56:55'),
(1461, 52, 2, 'Кибержиноятчиликка қарши курашиш бу борада кадрлар тайёрлашнинг муҳим масалалари', 2, 5, 'на посту.pdf', '2021-03-02 04:54:29', '2021-03-02 04:54:29'),
(1462, 226, 1, 'Training_Of_Personnel_In_The_Field_Of_Countering_Cybercrime_The', 2, 1, 'Training_Of_Personnel_In_The_Field_Of_Countering_Cybercrime_The.pdf', '2021-03-04 08:31:11', '2021-03-04 08:31:11'),
(1463, 202, 1, 'Training_Of_Personnel_In_The_Field_Of_Countering_Cybercrime_The', 2, 1, 'Training_Of_Personnel_In_The_Field_Of_Countering_Cybercrime_The.pdf', '2021-03-04 08:34:28', '2021-03-04 08:34:28'),
(1464, 226, 1, 'The concept of a dysfunctional family and its social danger', 2, 3, 'The concept of a dysfunctional family and its social danger.pdf', '2021-03-05 06:49:14', '2021-03-05 06:49:14'),
(1465, 111, 2, '“БОБУРНОМА” –ТАРИХИЙ, МАЗМУНАН РАНГ-БАРАНГ, ТИЛ ВА УСЛУБИ ГЎЗАЛ АСАР', 1, 4, 'МГИ халкаро.pdf', '2021-03-05 10:30:17', '2021-03-05 10:30:17'),
(1466, 299, 1, 'Ички ишлар идоралари хизмат фаолиятида юзага келадиган стресс', 1, 7, 'IIB KONFERENSIYA.pdf', '2021-03-10 06:29:21', '2021-03-10 06:29:21'),
(1467, 299, 2, 'Ички ишлар идоралари хизмат фаолиятида юзага келадиган стресс', 1, 5, 'IIB KONFERENSIYA.pdf', '2021-03-10 06:31:57', '2021-03-10 06:31:57'),
(1468, 172, 2, 'IIOlari tezkor apparatlarining tog\'li hududlarda giyohvandlikka qarshi kurashishning bugungi holati', 1, 5, '8-мақола ёпиқ тўплам тқф.docx', '2021-03-11 05:30:49', '2021-03-11 05:30:49'),
(1469, 325, 1, 'SPECIFIC FEATURES OF THE USE OF UZBEK MARTY ART METHODS AND METHODS IN PHYSICAL EDUCATION CLASSES OF HIGHER EDUCATIONAL INSTITUTIONS', 2, 1, 'certificate импакт фактор.pdf', '2021-03-15 07:45:13', '2021-03-15 07:45:13'),
(1470, 325, 1, 'Analysis of attitudes of female students to healthy lifestyle in highter education', 1, 2, 'ҳалқаро 2019 мақола.pdf', '2021-03-15 07:50:02', '2021-03-15 07:50:02'),
(1471, 325, 1, 'Олий ўқув юртида талаба қизларнинг жисмоний тайёргарлигини таҳлил қилиш', 1, 3, 'ФАН Спортга 4.pdf', '2021-03-15 07:56:50', '2021-03-15 07:56:50'),
(1472, 325, 1, 'Олий ўқув юртида талаба қизларнинг жисмоний ривожланганлиги ва кўрсаткичларини таҳлил қилиш', 1, 3, 'Ҳабарши 2019.pdf', '2021-03-15 07:58:41', '2021-03-15 07:58:41'),
(1473, 325, 1, 'Методика физической подготовки студенток  высших образовательных учреждений на основе использования комплексов «Узбек жанг санъати»', 2, 3, 'Фан спорга 2020-3 усти.pdf', '2021-03-15 08:00:35', '2021-03-15 08:00:35'),
(1474, 325, 1, 'Олий таълим муассасаларининг жисмоний тарбия дарсларида қўллаш учун ўзбек жанг санъати спорт турининг комплекс машқларини табақалаштириш ва таснифлаш', 1, 3, '2020-6.pdf', '2021-03-15 08:06:33', '2021-03-15 08:06:33'),
(1475, 325, 2, 'Ўзбек жанг санъатини қўллаган ҳолда олий таълим талаба қизларининг жисмоний тайёргарлигини ривожлантириш', 1, 4, '2019 МОК.pdf', '2021-03-15 08:23:50', '2021-03-15 08:23:50'),
(1476, 325, 2, 'Спортга йўналтирилган жисмоний тарбия соғлом турмуш тарзини ривожлантириш омили сифатида', 2, 4, 'МОК 2020 усти.pdf', '2021-03-15 08:26:11', '2021-03-15 08:26:11'),
(1477, 325, 2, 'Методика физической подготовки студенток  высших образовательных учреждений на основе использования комплексов «Узбек жанг санъати»', 2, 4, 'тезис Бухоро ҳалқаро 2020.pdf', '2021-03-15 08:27:28', '2021-03-15 08:27:28'),
(1478, 325, 2, 'Талаба қизларнинг жисмоний тайёргарлигини оширишда спортга йўналтирилган жисмоний тарбиянинг самарадорлиги', 1, 4, 'тезис Ҳалқаро 2020 ЎзДЖТСУ.pdf', '2021-03-15 08:29:06', '2021-03-15 08:29:06'),
(1479, 325, 2, 'биринчи босқич талаба қизларининг жисмоний тайёргарлиги ва уни тузатиш зарурияти', 1, 4, 'ҳалқаро 2019 тезис ЎзДЖТСУ.pdf', '2021-03-15 08:30:34', '2021-03-15 08:30:34'),
(1480, 325, 2, 'Болалар спортини ривожланишида ўзбек жанг санъатининг ўрни', 1, 5, 'тезис 2017.pdf', '2021-03-15 08:34:30', '2021-03-15 08:34:30'),
(1481, 325, 2, 'Спортда бошланғич танлов муаммоси бўйича мураббийларнинг педагогик ёндошувлари', 1, 5, 'тезис 2018.pdf', '2021-03-15 08:35:50', '2021-03-15 08:35:50'),
(1482, 325, 2, 'Олий ўқув юртларининг жисмоний тарбия ва спортида инновацион восита ва усулларнинг аҳамияти', 2, 5, 'ЎзДЖТСУ 2020 тезис.pdf', '2021-03-15 08:37:11', '2021-03-15 08:37:11'),
(1483, 325, 2, 'Таэквон-до (ИТФ)да мураббийлар фаолияти', 2, 5, 'соғлом авлод 2007 тезис ичи.jpg', '2021-03-15 08:43:57', '2021-03-15 08:43:57'),
(1484, 325, 2, 'III-IV синф ўқувчиларининг жисмоний сифатларини ривожлантириш муаммолари', 2, 5, 'тезис рес ичи.jpg', '2021-03-15 08:46:15', '2021-03-15 08:46:15'),
(1485, 325, 2, 'Мактаб ёшидаги болаларни таэквон-до (ИТФ) спорт турига қизиқишини шакллантириш йўллари', 2, 5, 'тезис 2007 ичи.jpg', '2021-03-15 08:48:08', '2021-03-15 08:48:08'),
(1486, 325, 2, 'Аёл ва эркак мураббийлар ўтувчи дарсларда қизларнинг жисмоний тарбияга бўлган муносабатлари', 2, 5, 'баркамол авлод тезис рес 2.jpg', '2021-03-15 08:50:04', '2021-03-15 08:50:04'),
(1487, 325, 2, 'Хотин-қизлар спортини ривожлантиришда аёл мураббийларнинг тутган ўрни', 2, 5, 'тезис рес2.jpg', '2021-03-15 08:52:20', '2021-03-15 08:52:20'),
(1488, 266, 1, 'К ВОПРОСУ ЗАКОНОДАТЕЛЬСТВА РЕГУЛИРУЮЩЕГО  БОРЬБУ С ТЕРРОРИЗМОМ', 1, 7, '1-Терроризм-отк-ХолМ-18.doc', '2021-04-02 05:41:15', '2021-04-02 05:41:15'),
(1489, 266, 1, 'К вопросу правовой регламентации миграции', 1, 7, '2-Миграции-ОРД-ХолМ-19.doc', '2021-04-02 05:43:07', '2021-04-02 05:43:07'),
(1490, 266, 1, 'К ВОПРОСУ О ПОНЯТИИ «ОПЕРАТИВНОЕ ВНЕДРЕНИЕ» В ТЕОРИИ ОПЕРАТИВНО-РОЗЫСКНОГО ПРАВА', 1, 7, '3-Внед-туплам-ХолМ-18.doc', '2021-04-02 05:44:27', '2021-04-02 05:44:27'),
(1491, 266, 1, 'ОПЕРАТИВНО-РОЗЫСКНАЯ ПРОФИЛАКТИКА ТЕРРОРИЗМА', 2, 7, '4-ХолМ+ХасР-19.doc', '2021-04-02 05:45:12', '2021-04-02 05:45:12'),
(1492, 266, 1, 'К ВОПРОСУ О НОРМАХ РЕГЛАМЕНТИРУЮЩИХ ОПЕРАТИВНО-РОЗЫСКНУЮ ДЕЯТЕЛЬНОСТЬ  В КОНСТИТУЦИЯХ ЗАРУБЕЖНЫХ СТРАН', 1, 7, '5-Заруб-ОРД-конф-ХолМ-2020.doc', '2021-04-02 05:46:03', '2021-04-02 05:46:03'),
(1493, 266, 1, 'Новое в законодательстве об административном надзоре органов внутренних дел за лицами, освобожденными из учреждений по исполнению   наказания', 1, 3, '6-ADMnadz-ХолМ-2020.doc', '2021-04-02 06:04:43', '2021-04-02 06:04:43'),
(1494, 266, 1, 'К ПОНЯТИЮ ОПЕРАТИВНО-РОЗЫСКНОГО МЕРОПРИЯТИЯ «НАВЕДЕНИЕ СПРАВОК» В ТЕОРИИ ОПЕРАТИВНО-РОЗЫСКНОГО ПРАВА', 1, 3, '7-Справка-ХолМ-20.doc', '2021-04-02 06:07:12', '2021-04-02 06:07:12'),
(1495, 278, 2, 'Юнон-рим курашчиларини техник-тактик тайёргарлигини такомиллаштириш', 1, 5, 'макола.pdf', '2021-04-02 12:15:03', '2021-04-02 12:15:03'),
(1496, 278, 2, 'курашчиларга техник усулларни ургатиш', 1, 5, 'макола.pdf', '2021-04-02 12:17:37', '2021-04-02 12:17:37'),
(1497, 66, 1, 'ПЕДАГОГИЧЕСКИ ЗАПУЩЕННЫЕ (ТРУДНЫЕ) ПОДРОСТКИ И ОСНОВНЫЕ ПРИЧИНЫ ИХ ПОЯВЛЕНИЯ', 1, 3, 'сертификат тезис.jpg', '2021-04-03 11:11:55', '2021-04-03 11:11:55'),
(1498, 171, 1, 'ЎЗини ўзи ўлдириш даражасига етказишни тартибга солиш муаммолари', 1, 3, 'Мухиддинов Аброр.pdf', '2021-04-06 13:07:59', '2021-04-06 13:07:59'),
(1499, 171, 1, 'Ҳаётга қарши жиноятлар ўртасидаги чегара', 1, 3, 'Аброр.pdf', '2021-04-06 13:11:38', '2021-04-06 13:11:38'),
(1500, 202, 2, 'Теоретико-практические основы деятельности инспектора профилактики с лицами, подвергнутыми наказаниям, не связанные с лишением свободы', 2, 4, 'шухратов достон мақола.pdf', '2021-04-07 13:36:16', '2021-04-07 13:36:16'),
(1501, 202, 1, 'Countering cybercrime: modern approaches to training', 2, 1, 'Countering cybercrime modern approaches to training12.pdf', '2021-04-07 13:39:11', '2021-04-07 13:39:11'),
(1502, 202, 2, 'Актуальные проблемы борьбы с преступлениями в сфере информационных технологий и безопасности', 2, 5, 'Актуальные проблемы борьбы с преступлениями в сфере информационных технологий и безопасности.pdf', '2021-04-07 13:40:23', '2021-04-07 13:40:23'),
(1503, 202, 1, 'Ҳозирги босқичда Ўзбекистон Республикасида ахборот технологиялари ва хавфсизлиги соҳасидаги жиноятларга қарши курашиш', 2, 3, 'Ҳозирги босқичда Ўзбекистон Республикасида ахборот технологиялари ва хавфсизлиги соҳасидаги жиноятларга қарши курашиш12.pdf', '2021-04-07 13:41:18', '2021-04-07 13:41:18'),
(1504, 202, 2, 'Влияния интернета на поведение и интеллектуальное развитие молодёжи', 2, 4, 'Влияния интернета на поведение и интеллектуальное развитие молодёжи.pdf', '2021-04-07 13:42:15', '2021-04-07 13:42:15'),
(1505, 202, 1, 'Правовые меры реагирования по противодействию киберпреступлениям и подготовка кадров в сфере информационной безопасности', 2, 2, 'Правовые меры реагирования по противодействию киберпреступлениям и подготовка кадров в сфере информационной безопасности.pdf', '2021-04-07 13:43:09', '2021-04-07 13:43:09');
INSERT INTO `old_maqolas` (`id`, `user_id`, `turi`, `mavzu`, `mualliflik`, `miqyosi`, `ilova`, `created_at`, `updated_at`) VALUES
(1506, 202, 2, 'Некоторые вопросы развития института адвокатуры', 2, 4, 'Сарвар билан.pdf', '2021-04-07 13:51:54', '2021-04-07 13:51:54'),
(1507, 202, 2, 'Ахборот хавфсизлигини таъминлашнинг ҳуқуқий асослари (электрон тижорат мисолида)', 2, 4, 'хоким ака билан.pdf', '2021-04-07 14:09:55', '2021-04-07 14:09:55'),
(1508, 171, 2, 'Фирибгарликнинг тушунчаси ва унинг жиноий ҳуқуқий тавсифи ва криминологик тавсифи', 1, 4, 'сканирование0010.pdf', '2021-04-12 08:10:52', '2021-04-12 08:10:52'),
(1509, 309, 1, 'talim olish', 2, 7, 'Илмий-мақола21.pdf', '2021-04-21 09:17:21', '2021-04-21 09:17:21'),
(1510, 208, 2, 'Ички ишлар органларида қонунлар ижросини таъминлаш билан боғлиқ муаммолар ва уларинг ечимлари', 1, 5, 'Азизов 1.pdf', '2021-04-29 10:25:38', '2021-04-29 10:25:38'),
(1511, 208, 2, 'Ички ишлар органларининг ҳуқуқбузарликлар профилактикасини тубдан такомиллаштиришга қаратилган ислоҳотлар: янги босқич самараси', 2, 5, 'Азизов 2.pdf', '2021-04-29 10:32:03', '2021-04-29 10:32:03'),
(1512, 208, 2, 'Конституция - ички ишлар органларида қонунлар ижросини таъминлашнинг ҳуқуқий кафолати', 1, 5, 'Азизов 3.pdf', '2021-04-29 10:41:13', '2021-04-29 10:41:13'),
(1513, 208, 2, 'Ҳуқуқий ва қонунчилик тарғиботини ташкил этишда бошқарув қарорларининг аҳамияти', 2, 5, 'Азизов 1.pdf', '2021-04-29 11:34:01', '2021-04-29 11:34:01'),
(1514, 208, 2, 'Ички ишлар органларида жисмоний ва юридик шахсларни мурожаатлари билан ишлашни ташкил этиш тартиби', 1, 5, 'Азизов 1.pdf', '2021-04-29 11:40:08', '2021-04-29 11:40:08'),
(1515, 208, 2, 'Ички ишлар органлари фан ютуқлари, замонавий технологиялар ва ахборот тизимларидан фойдаланишнинг аҳамияти', 2, 5, 'Азизов 1.pdf', '2021-04-29 12:17:12', '2021-04-29 12:17:12'),
(1516, 208, 2, 'Ички ишлар органлари фаолиятининг асосий принциплари ва унга риоя этишни таъминлаш', 1, 5, 'Азизов 1.pdf', '2021-04-29 12:21:25', '2021-04-29 12:21:25'),
(1517, 208, 2, 'Ички ишлар органларида бошқарув қарорларини қабул қилишнинг Конституцивий асослари', 1, 5, 'Азизов 1.pdf', '2021-04-29 12:26:22', '2021-04-29 12:26:22'),
(1518, 208, 2, 'Ички ишлар органларида қонунлар ижросини амалга оширишда содир этиладиган ҳуқуқбузарликлар учун  жавобгарлик масалалари', 2, 5, 'Азизов 1.pdf', '2021-04-29 12:32:48', '2021-04-29 12:32:48'),
(1519, 325, 2, 'СОҒЛОМ ТУРМУШ ТАРЗИДАН СПОРТГА БИР ҚАДАМ', 1, 4, 'photo_2021-04-29_13-33-06.jpg', '2021-04-30 04:48:58', '2021-04-30 04:48:58'),
(1520, 66, 1, 'Методика развития специальной выносливости в подготовке высококвалифицированных футболистов', 1, 3, '2021-05-31 сертификат.jpg', '2021-05-31 09:51:22', '2021-05-31 09:51:22'),
(1521, 260, 1, 'dscvjhgASDVcv', 1, 1, 'Документ Microsoft Word.docx', '2021-06-23 05:08:34', '2021-06-23 05:08:34'),
(1522, 281, 1, 'ТЕРГОВЧИ НУТҚИДА ПАРАКИНЕТИК ВОСИТАЛАРНИНГ ИФОДАСИ', 1, 3, 'макола ОАК Cуз сан. 2021-1-86.pdf', '2021-06-24 05:39:30', '2021-06-24 05:39:30'),
(1523, 281, 1, 'БАДИИЙ АСАРЛАРДА ТЕРГОВЧИ НУТҚИНИНГ МИЛЛИЙ ВА МАДАНИЙ ЖИҲАТЛАРИНИНГ НАМОЁН БЎЛИШИ', 1, 3, 'макола ОАК УзМУ 2021.pdf', '2021-06-24 05:40:38', '2021-06-24 05:40:38'),
(1524, 281, 1, 'ИНГЛИЗ ВА ЎЗБЕК АЁЛ ТЕРГОВЧИЛАРИ НУТҚИГА ХОС ХУСУСИЯТЛАРНИНГ ҚИЁСИЙ ТАҲЛИЛИ', 1, 3, 'Тил Таълим Таржима 2021-2сон-1-117.pdf', '2021-06-24 05:42:48', '2021-06-24 05:42:48'),
(1525, 281, 2, 'ТЕРГОВЧИ НУТҚИДА САЛБИЙ МАЪНОГА ЭГА БЎЛГАН ЛИСОНИЙ ВОСИТАЛАРНИНГ ИФОДА ЭТИЛИШИ', 1, 4, 'макола-тезис халк. конф 2021.pdf', '2021-06-24 05:44:24', '2021-06-24 05:44:24'),
(1526, 265, 2, 'Қалбаки пул, акциз маркаси ёки қимматли қоғозлар ясаш ва уларни ўтказиш билан боғлиқ жиноятларни олдини олиш ва очишнинг ўзига хос хусусиятлари.', 1, 5, 'Қалбаки.docx', '2021-06-24 10:23:08', '2021-06-24 10:23:08'),
(1527, 265, 1, 'Ёпиқ мавзу', 1, 3, 'Т.Х.Й..docx', '2021-06-24 10:26:10', '2021-06-24 10:26:10'),
(1528, 265, 1, 'Ёпиқ мавзу', 1, 3, 'Ҳалқаро.docx', '2021-06-24 10:28:33', '2021-06-24 10:28:33');

-- --------------------------------------------------------

--
-- Table structure for table `old_users`
--

CREATE TABLE `old_users` (
  `id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kaf_id` int(11) NOT NULL,
  `lavozim` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `old_users`
--

INSERT INTO `old_users` (`id`, `name`, `login`, `email_verified_at`, `password`, `kaf_id`, `lavozim`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Administrator', 'Administrator', NULL, '$2y$10$qQkfMlOao.SqnGh0g2v6SeOGbctVniVS6srno0Mj/bgIXQIeGH.rW', 50, 'Administrator', NULL, '2020-09-02 04:10:07', '2020-09-02 04:10:07'),
(52, 'Tursunov Axtam Salomovich', 'h_profilaktika', NULL, '$2y$10$5EUeP6eRTcPB1TPgit3EeOYP3Yyvz7344qKBGORBiVW6vdlpNXOA6', 6, 'Kafedra boshlig\'i', NULL, '2020-10-24 06:51:59', '2020-10-24 06:51:59'),
(54, 'Murodov Alisher Sharofxonovich', 'М_Alisher', NULL, '$2y$10$Ck2yfdXV9V4/ia0AcgCO2.9DSaAZbWnMFAiYHx4m8caFLFBGcrfxe', 6, 'Kafedra boshlig\'i o\'rinbosari', NULL, '2020-10-29 05:00:22', '2020-10-29 05:00:22'),
(55, 'Ruziyev Izzanullo Nematulloevich', 'ROZIYEVI', NULL, '$2y$10$zu8Z7Skx2l0z6CxYGqFwv.1wGP1428k.fzbNJf31ARs9h2J.s0nva', 10, 'O\'qituvchi', NULL, '2020-10-29 12:56:44', '2020-10-29 12:56:44'),
(56, 'Koshkarov Janbolat Tashbulatovich', '998977561820', NULL, '$2y$10$Fg85xfRpW8sDaSQyJpJ/3O/4N05CkXbFrxmAeupo8zzd78vQLukYS', 9, 'Kabinet boshlig\'i', NULL, '2020-10-29 13:23:17', '2020-10-29 13:23:17'),
(57, 'Soloveva Tatyana Vladimirovna', 'SolovevaT', NULL, '$2y$10$UTbfvRB7M0Ra87w1KMQVBOJNUCiycLUR3dInBF.5DtAkq416uKmRC', 12, 'O\'qituvchi', NULL, '2020-10-30 09:04:36', '2020-10-30 09:04:36'),
(58, 'Abduqodirov Farhodjon Faxritdin o\'g\'li', '3334414', NULL, '$2y$10$mzMjgQQ4JR5FQgDk.qRlK.49D3A4FGzedUrfwnnniMloJGoKAEC9e', 10, 'O\'qituvchi', NULL, '2020-10-30 09:16:19', '2020-10-30 09:16:19'),
(60, 'Xudoyberdiyev Rahmatillo Fozilliddinovich', 'rfxudoyberdiyev', NULL, '$2y$10$k6xHWhZcm8IQRLYdD5MKUegbau1ipmNDfZ9uErfwi5LSkzLGMMFrm', 1, 'O\'qituvchi', NULL, '2020-10-30 09:28:44', '2020-10-30 09:28:44'),
(61, 'Jamoldinov Xumoyun Baxtiyorbek o`g`li', 'JamoldinovX', NULL, '$2y$10$D1TAzFgQWHdtS5ZTBkRQiurZ0ieONo/MRkvCxlqrSnruyrXDECZsO', 14, 'O\'qituvchi', NULL, '2020-10-30 09:35:54', '2020-10-30 09:35:54'),
(62, 'Karimov Sherali Ergashevich', 'karimov sh', NULL, '$2y$10$jTgPfiSMqaWjm0AqgGZnIOXjt1JJzu9kSZ4VHlj.YhOTUVIcl5NYu', 12, 'O\'qituvchi', NULL, '2020-10-30 09:55:39', '2020-10-30 09:55:39'),
(63, 'Nurumbetova Sadoqat Allayarovna', 'NurumbetovaS', NULL, '$2y$10$2m3DkGlDsAi2qRLsbM/4kudGo4ZBPUn7xKvNFUaJ4yWY3JxB1pX8e', 12, 'O\'qituvchi', NULL, '2020-10-30 09:58:52', '2020-10-30 09:58:52'),
(64, 'Zulfuqorov Abduvaxob Abdumalik', 'Zulfuqorov', NULL, '$2y$10$J.s5b4OfSsN.Ec7Z2XJNnuaHnbe08ZfClGdysopDONVK0oeyLBoku', 12, 'O\'qituvchi', NULL, '2020-10-30 10:08:48', '2020-10-30 10:08:48'),
(65, 'Darvishov Sarvarbek Rustamovich', 'Sarvarbek', NULL, '$2y$10$1PAAe3kkmfgVLL.xxrusQuDeUN07tYhpfaDfpdqLmmGPpPlfXfaCG', 7, 'Katta o\'qituvchi', NULL, '2020-10-30 10:54:43', '2020-10-30 10:54:43'),
(66, 'Дыров Александр Юрьевич', 'Дыров Александр Юрьевич', NULL, '$2y$10$4HFK5ZgD8gJG8oHFio2eiuAPZBlLLG.CHF2cevfqTd3pcsFkrs4.u', 9, 'Katta o\'qituvchi', NULL, '2020-10-30 12:13:12', '2020-10-30 12:13:12'),
(67, 'Turanov Keldiyor Irgashevich', 'TuranovK', NULL, '$2y$10$8anr0c88Yyj3ZTTsAfafqOYneEWTqLBMg5BUmjcuxsXE/adsH3QaW', 12, 'O\'qituvchi', NULL, '2020-10-31 04:10:36', '2020-10-31 04:10:36'),
(68, 'Xayarov Islomjon Maxmutali o\'g\'li', 'XaydarovI', NULL, '$2y$10$DIGKT3EG6UQqfsN0REsIiepjPW2zEudbSN1eVMMgo2BDfN5x1ETwK', 18, 'O\'qituvchi', NULL, '2020-10-31 04:26:51', '2020-10-31 04:26:51'),
(69, 'Artikov Bahadir Adilovich', '7665114', NULL, '$2y$10$oh4Ne5zI2Mt9XhP7EU16tubzl2BZIdXZcW4gFggxwf/6H7878UrPu', 4, 'O\'qituvchi', NULL, '2020-10-31 04:35:31', '2020-10-31 04:35:31'),
(70, 'Mamatqulov To\'lqin Boyxurozovich', 'MamatqulovT', NULL, '$2y$10$ijuL4.L7uKj7DQJxIPKSH.v4oopDvE90j5FGWg0OOAynouubTmrkq', 12, 'Kafedra boshlig\'i', NULL, '2020-10-31 05:16:00', '2020-10-31 05:16:00'),
(71, 'Саидов Миёнфарух Рабиуллаевич', 'АРКА 1981', NULL, '$2y$10$9Nlus1BHB97vOTRKQy9oMe8PC2muLbgPdkI6VQGI.zc6AsIW1ClcS', 15, 'Katta o\'qituvchi', NULL, '2020-10-31 06:36:06', '2020-10-31 06:36:06'),
(72, 'Xusanov Anvar Djumabayevich', 'XusanovA', NULL, '$2y$10$praoqoSbVtgARnxMEVCQEOS0SS9rjxq6vMLTh34KtHPy6y22NUC1u', 12, 'Kafedra boshlig\'i o\'rinbosari', NULL, '2020-10-31 06:43:44', '2020-10-31 06:43:44'),
(73, 'Azizov Nig\'monjon Pardayevich', 'dhuquqiy', NULL, '$2y$10$sFuGvRYQFo76t76zHjrZBeqlLKBsqW2vtCPTeIHc8N7Adq0qInM56', 3, 'Kafedra boshlig\'i', NULL, '2020-10-31 06:51:12', '2020-10-31 06:51:12'),
(74, 'Югай Людмила Юрьевна', 'krim_lyugay', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 12, 'Dotsent', NULL, '2020-10-31 07:51:03', '2020-10-31 07:51:03'),
(75, 'Kalauov Saydulla Aymaxanovich', 'Kalauov', NULL, '$2y$10$hleNZwuU27j2iEResAH6Ke0DJkEvWNtPDeTCtC0145swWlxVqr/Lu', 19, 'Kafedra boshlig\'i', NULL, '2020-10-31 08:55:48', '2020-10-31 08:55:48'),
(76, 'Kuldashev Nuriddin Abduganiyevich', 'nuriddin', NULL, '$2y$10$7SWQRjZE9BWJzPykObITkOUVI466Kcsyjp0HXz.LbJdcxI8fsSy96', 4, 'Kafedra boshlig\'i', NULL, '2020-10-31 10:56:03', '2020-10-31 10:56:03'),
(77, 'Qahharov Azamat Abdug\'ofurovich', 'lol-azam', NULL, '$2y$10$/x08YCPXbwCaHyFGwRHAqe/kgYtPiXW8ur2.hJuw9TiBmCvXkoyCK', 19, 'Kafedra boshlig\'i o\'rinbosari', NULL, '2020-10-31 11:22:54', '2020-10-31 11:22:54'),
(78, 'Saidov Miyonfarukh Rabiullaevich', 'ARKA 1981', NULL, '$2y$10$iTKENrZKRis0PzW7bI10yufEs8l/36K2qz2BW4tconvsa0dhevRuy', 15, 'Katta o\'qituvchi', NULL, '2020-11-02 02:29:13', '2020-11-02 02:29:13'),
(79, 'Adilov Olim Ibragimovich', 'Olim1984', NULL, '$2y$10$.R.VcMZe3FpKe/yFnAQ9L.2vt/RB4gzjIu2GOvfkFHJap02SAvRnK', 9, 'Katta o\'qituvchi', NULL, '2020-11-02 02:36:48', '2020-11-02 02:36:48'),
(80, 'Rustamov Shaxzod Maksudovich', 'Shaxrus', NULL, '$2y$10$oPRw7Th4KF6c/PDKa4t5d.lzGsFQj384L0r.oQXa0t57WziXrLc.i', 7, 'Katta o\'qituvchi', NULL, '2020-11-02 08:02:45', '2020-11-02 08:02:45'),
(81, 'Ibragimov Bekbergen Davronbekovich', 'IbragimovB', NULL, '$2y$10$N0E.rhX.IUXCxt453yWoQuurRuyvIERTsZRzKPglAiSSTAkTxmqO2', 19, 'O\'qituvchi', NULL, '2020-11-02 09:31:08', '2020-11-02 09:31:08'),
(82, 'Gayibnazarov Sardorbek Egamberdiyevich', 'sardorbek1212', NULL, '$2y$10$gLuB/7n.f8X8YQiBQ4jyM.SFBP1iv3WcR4ZbcYRAnXnEJMxVmhqRq', 19, 'O\'qituvchi', NULL, '2020-11-02 09:59:30', '2020-11-02 09:59:30'),
(83, 'A`zamov Ruhullo Mahmudjon o`g`li', 'azamovr', NULL, '$2y$10$gQz5NCd6DYxMosvHeViB8.ucytQpejbBg8VP7Os4kD8iM93y4c2JS', 9, 'O\'qituvchi', NULL, '2020-11-02 10:03:57', '2020-11-02 10:03:57'),
(84, 'Maxamadaliyev Zokirjon Turashbekovich', 'zokirjon75', NULL, '$2y$10$ERuhCiJoWB/FDXdiZlShPuCFVEMmDf6e3lNFDbo0e6h5FSKQBBDEa', 19, 'Katta o\'qituvchi', NULL, '2020-11-02 10:18:51', '2020-11-02 10:18:51'),
(85, 'Yusubov Davlet Abdusharipovich', 'Yusubov Davlet Abdusharipovich', NULL, '$2y$10$gd/Z0Qbtdudl/oTzLwIQi.w8ovGdkkAEYS2tAfrV/GWbBykblSp/a', 7, 'Kafedra boshlig\'i', NULL, '2020-11-02 10:24:46', '2020-11-02 10:24:46'),
(86, 'Mamaziyayev Farrux Renatullayevich', 'Farrux0525', NULL, '$2y$10$iNzdmCb8dOem1/WrJU8G.uKO7yyAAjN59zSr/zY6Z3vH7JzfzT9za', 19, 'O\'qituvchi', NULL, '2020-11-02 10:53:15', '2020-11-02 10:53:15'),
(87, 'Tallibayev Umidjon Shergaziyevich', 'TheFirst1996', NULL, '$2y$10$ZR4ciAIC11ysPrhTPebEsuUW.b0zpvpxeYBqcbTN.hy4jToqW.38u', 14, 'O\'qituvchi', NULL, '2020-11-02 16:08:00', '2020-11-02 16:08:00'),
(88, 'Xoldarov Fidokor Erkinboy o\'g\'li', 'fidokorh@gmail.com', NULL, '$2y$10$.8KQ7ueDQz2IyymI3fMO3uuk25XgTuI6gzaAFZIjsswN13NsN/c6m', 19, 'O\'qituvchi', NULL, '2020-11-03 02:42:00', '2020-11-03 02:42:00'),
(89, 'Батыров Умид Авазович', 'Умид', NULL, '$2y$10$zEXyXP8CUp8wZNvLtksupuz7TZcJc6FZH6yWaRcMmcGSaev2nCTe6', 5, 'Katta o\'qituvchi', NULL, '2020-11-03 04:04:42', '2020-11-03 04:04:42'),
(90, 'Saidov Miyonfarukh Rabiullaevich', 'АРКА', NULL, '$2y$10$aBo9Wbh/3DGFor.lRLAx0.LgoNz7aDbCrybfSmA5WQb28R6Fn7GYC', 15, 'Katta o\'qituvchi', NULL, '2020-11-03 04:12:31', '2020-11-03 04:12:31'),
(91, 'Селиманова Светлана Михайловна', 'SSM', NULL, '$2y$10$y4n5iCibrUTWDqdCweENse6H3p5/lqhUvH44TJ5jSNVrqCYSRaEgG', 14, 'Kafedra boshlig\'i', NULL, '2020-11-03 04:58:02', '2020-11-03 04:58:02'),
(92, 'Tursunova Sabina Ravshanovna', 'TSR', NULL, '$2y$10$xCeCFPcOq.nCIzB3bUdOpuc5.c9KZCF8mDK12ximhJ1GWehRQAFva', 14, 'O\'qituvchi', NULL, '2020-11-03 05:10:07', '2020-11-03 05:10:07'),
(94, 'Mavlonov Temur Anvar o\'g\'li', 'timati1221', NULL, '$2y$10$UDlYHpFjRRH7vlxqBkxXieoMUZ8rh6GYCPfsNUMByfEhelc3K9ujq', 11, 'O\'qituvchi', NULL, '2020-11-03 05:48:55', '2020-11-03 05:48:55'),
(95, 'Boysafarov Ravshanbek Baxtiyor o\'g\'li', 'RICH BROTHER', NULL, '$2y$10$iIdq/UMf9fOaF.bUu/Fvv.mqxRyUfvUBQkrw/UJzKkUTZvgbSqimW', 11, 'O\'qituvchi', NULL, '2020-11-03 06:05:49', '2020-11-03 06:05:49'),
(96, 'Salimov Sherzod Xusanovich', 'SalimovSh', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 9, 'Katta o\'qituvchi', NULL, '2020-11-03 06:19:24', '2020-11-03 06:19:24'),
(97, 'Mirsharapov Akmal Gayratovich', 'aki-1988', NULL, '$2y$10$tLILbGnQFsFQh2mBOfRCy.AH1R7J.IBxZ/w9zTsTFJ8guclYV90NW', 9, 'O\'qituvchi', NULL, '2020-11-03 07:29:44', '2020-11-03 07:29:44'),
(98, 'Rizaev Shuhratjon Shoirovich', 'Shrizaev@mail.ru', NULL, '$2y$10$9LZlsEjWdtQJGPuwKBhI/ef9r.jUmPfhrFbZhTgXJbuRliVlWJa.6', 19, 'Katta o\'qituvchi', NULL, '2020-11-03 07:54:37', '2020-11-03 07:54:37'),
(99, 'Jumaev Farrux Farmonovich', '998974320100', NULL, '$2y$10$lw2bczD5PdxURq.iWickleCdPdXZd.l8FqpNPz0J1SYuUYJZFO24e', 9, 'Katta o\'qituvchi', NULL, '2020-11-03 07:58:00', '2020-11-03 07:58:00'),
(100, 'Muzaffarov Sherozxon', 'scher1402', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'O\'qituvchi', NULL, '2020-11-03 08:05:30', '2020-11-03 08:05:30'),
(101, 'Муродов Жасурбек Истамович', 'Жасурбек', NULL, '$2y$10$2FdSB.G1nH/jv7IA8gkTduyj091KhclYxRWyqNuUKyAN3TSb7gcja', 5, 'O\'qituvchi', NULL, '2020-11-03 09:05:01', '2020-11-03 09:05:01'),
(102, 'Nikishin Gennadiy Fyodorovich', 'NikishinG', NULL, '$2y$10$sXAy7ggRVJqPXdgKDqnu7.7aNDYuGgQf4jVXp96gofTAFx6aKr8Eu', 12, 'Katta o\'qituvchi', NULL, '2020-11-03 09:25:05', '2020-11-03 09:25:05'),
(103, 'Hikmatov Shukur Anvar o\'g\'li', 'Shukur', NULL, '$2y$10$LgwssEdCKAlw8Dmex5TPuukrkjDu9Leh92Y6isMzxhF9p/UboWBV.', 21, 'O\'qituvchi', NULL, '2020-11-03 09:26:50', '2020-11-03 09:26:50'),
(104, 'Narbekov Abdikamil Vafaevich', 'Narbekov', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 7, 'Dotsent', NULL, '2020-11-03 09:29:04', '2020-11-03 09:29:04'),
(105, 'Kolmikov Petr Alekseevich', 'KolmikovP', NULL, '$2y$10$zA3HETCwySE9yYahOs8WaO8GXApavqAKaevoZne2KO/ueutgYyEa6', 12, 'Katta o\'qituvchi', NULL, '2020-11-03 09:35:59', '2020-11-03 09:35:59'),
(106, 'Polatov Baxodir Baxtiyorovich', 'baxodir.polatov', NULL, '$2y$10$H1KR87d4AsmuWLMCpkBNvuvxhCH1GXsZFUKHHlqe6UEMwOw.hl2JS', 19, 'O\'qituvchi', NULL, '2020-11-03 09:38:34', '2020-11-03 09:38:34'),
(107, 'Abduqaxxorov Sarvarbek Abdusamat o\'g\'li', 'AbduqaxxorovS', NULL, '$2y$10$6ZjSBpB17s1wgxWyMHMn9.U8Lu6nnjL6AoOcG.WZ2jyODkgPzGzWm', 12, 'O\'qituvchi', NULL, '2020-11-03 09:41:44', '2020-11-03 09:41:44'),
(108, 'Hasanov Sharofiddin Shamshurovich', 'Shaxobiddin', NULL, '$2y$10$ah1wxsA0IGYRWZ.rEKD2Su8UINYPPaEyeDYWHC.d6yYyKvNFoD/lO', 21, 'O\'qituvchi', NULL, '2020-11-03 09:56:21', '2020-11-03 09:56:21'),
(109, 'Yetmishboyev Muxtorjon Ma\'murjon o\'g\'li', 'Yetmishboyev M', NULL, '$2y$10$Z7NnESIc6YUfoQTZR04HLO8jSuyLCoJifl0HyZSmc9JSYSh0fLMKy', 9, 'O\'qituvchi', NULL, '2020-11-03 10:00:11', '2020-11-03 10:00:11'),
(110, 'Yuldashev Aziz Boynazarovich', 'Aziz1971', NULL, '$2y$10$glq3ocvGssZVTLqakNURH./ZR5ciiK16B.yVelt/hWZko2x4DwoT6', 19, 'Katta o\'qituvchi', NULL, '2020-11-03 11:15:37', '2020-11-03 11:15:37'),
(111, 'Xalikov Abduvahob Axatovich', 'aax261067', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'Dotsent', NULL, '2020-11-03 12:03:44', '2020-11-03 12:03:44'),
(112, 'Kurganov Anvarjon Muxtorovich', '19743112', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'Kafedra boshlig\'i o\'rinbosari', NULL, '2020-11-03 12:21:06', '2020-11-03 12:21:06'),
(113, 'Matchanov Alimjan Atabaevich', 'Matchanov Alimjan', NULL, '$2y$10$wKQhRCq9XaEazxz5sJRjKeFLtR2oGQ6JJrZ4BGF6wEm4wIZ2roz0i', 21, 'Professor', NULL, '2020-11-03 13:08:47', '2020-11-03 13:08:47'),
(115, 'Акбарходжаев Камол Абрал ўғли', 'Камол', NULL, '$2y$10$HofMrmXONJ0g/xVATQac/.zyz5Cg4argSlZnqmKDcoYM1GJJuoi52', 5, 'O\'qituvchi', NULL, '2020-11-04 03:38:34', '2020-11-04 03:38:34'),
(116, 'Қодиржонов Камолиддин Қахрамонович', 'Камолиддин', NULL, '$2y$10$MmQSgqvz37YMBfTc5/eIQOBMN5GVMJoJPAhevG/g814jiCWKWH6SO', 5, 'O\'qituvchi', NULL, '2020-11-04 03:41:19', '2020-11-04 03:41:19'),
(117, 'Салохиддинов Нуриддин Фахриддин ўғли', 'Нуриддин', NULL, '$2y$10$0Ekl4K28QS86V6T8CVdb3OdepJNz5enl0mazL930I4RSYz5wVFYYu', 5, 'O\'qituvchi', NULL, '2020-11-04 03:43:21', '2020-11-04 03:43:21'),
(119, 'Байдадаев Искандар Шукриллаевич', 'Искандар', NULL, '$2y$10$m2EZgOdtFMIjYJStj7.nh.eCa.Wa6Zz.itQIY.BoRT3j6JNRmvDBG', 5, 'Katta o\'qituvchi', NULL, '2020-11-04 03:49:50', '2020-11-04 03:49:50'),
(120, 'Hikmatov Shukur Anvar o\'g\'li', 'Hikmatov Shukur', NULL, '$2y$10$9/v2OyJjfxaj3Y6MO/Emce0nLS9w4kRZJX1jnHrEXC.x5pLXl.mQe', 21, 'O\'qituvchi', NULL, '2020-11-04 03:52:18', '2020-11-04 03:52:18'),
(121, 'Шерматов Адхам Фозилович', 'Адхам', NULL, '$2y$10$Eq4b0Ew2j74fv1JB917oUe2YwYZZxv76vTx0xzN5yGLq.SGTQN1Ye', 5, 'Katta o\'qituvchi', NULL, '2020-11-04 04:07:08', '2020-11-04 04:07:08'),
(122, 'Рустамов Махмуджон Турабжанович', 'Махмуд', NULL, '$2y$10$DbbqinX0jlVqbx6rh65q4OIHKx/sGBfq7dcLDfenxUCw8kHEH5Jf2', 5, 'Katta o\'qituvchi', NULL, '2020-11-04 04:14:03', '2020-11-04 04:14:03'),
(123, 'Djamatov Mustafa Xatamovich', 'djamatovM', NULL, '$2y$10$CLr3P9m6qRgbZH4WUgwCAehKXl0KmndEb46zoQWKRXmACg93ZIRIq', 1, 'Katta o\'qituvchi', NULL, '2020-11-04 04:18:41', '2020-11-04 04:18:41'),
(124, 'Лифанов Владимир Федотович', 'Директор', NULL, '$2y$10$fyp.vcIziFztrZeORZaU.OTRQdsmw0nu1ktgZdiKm4Y6HpYxmFv6S', 5, 'Katta o\'qituvchi', NULL, '2020-11-04 04:29:00', '2020-11-04 04:29:00'),
(125, 'Махмудов Иброхимжон Хакимжанович', 'Иброхим', NULL, '$2y$10$88r5mdg5WQt3kDjeMdltA.AX3AiGrMxMPvmAFTiW6gF26tyIeHErK', 5, 'Kafedra boshlig\'i o\'rinbosari', NULL, '2020-11-04 04:36:24', '2020-11-04 04:36:24'),
(126, 'Юлдашев Умид Шавкатович', 'Шавкатович', NULL, '$2y$10$SepjKi.17tNOv.FP08/lLeJ6Sr5TAhgg55P3xW3bJxaRNINJjt0li', 5, 'Katta o\'qituvchi', NULL, '2020-11-04 05:02:41', '2020-11-04 05:02:41'),
(127, 'Тиллаходжаев Баходир Абдуллаханович', 'Баха', NULL, '$2y$10$4ZP6I.txvZo8ycDx5JT7..tMtvrCIftj1fpwAtBO3L4oZ67ZG57Nu', 5, 'Katta o\'qituvchi', NULL, '2020-11-04 05:33:17', '2020-11-04 05:33:17'),
(128, 'Ашурходжаев Бехзод Хамидуллаевич', 'Бек', NULL, '$2y$10$YgiRa.JwgOGwU0zwZuw1Z.zFGPk3Zd6OeLCtXiJp4aNe9omk8k1jG', 5, 'O\'qituvchi', NULL, '2020-11-04 05:47:29', '2020-11-04 05:47:29'),
(129, 'Rustamov Sanjar Suxrobovich', 'RustamovS', NULL, '$2y$10$eRZGhbqxRTsM26LTas.po.CowNmcK9OpinGbp5EGOBralUBxBr2w6', 14, 'Katta o\'qituvchi', NULL, '2020-11-04 05:50:40', '2020-11-04 05:50:40'),
(130, 'Пардаев Хуршид Олимович', 'Хуршид84', NULL, '$2y$10$z8duVir53dRaX/7hwehUI.n627qAInieioCiK2A21p1lD2X4FrNGC', 5, 'O\'qituvchi', NULL, '2020-11-04 05:52:23', '2020-11-04 05:52:23'),
(131, 'Baxramov Xojiakbar Xusanovich', 'BaxramovX', NULL, '$2y$10$w1tRPjrxxfvVs50TY4k47uHViOBN085GXXYdAFmZqeV3aCOYjws1y', 14, 'Katta o\'qituvchi', NULL, '2020-11-04 06:10:23', '2020-11-04 06:10:23'),
(132, 'Masharipov Shokir Madiyorovich', 'MasharipovS', NULL, '$2y$10$ayPR12Ey/FVZjLiyLpWP9.ezY/a8KXLnNs1bEgM8fn.43CtoCyA0.', 14, 'Kabinet boshlig\'i', NULL, '2020-11-04 06:16:16', '2020-11-04 06:16:16'),
(133, 'Umirzakov Begzod Ataboevich', 'Umirzakov B.A.', NULL, '$2y$10$Y6yu4EwTwZzspVwQvvviI.kB31Lw/4u5WfKB0YzMTmqdC/WIMZ7S2', 13, 'Katta o\'qituvchi', NULL, '2020-11-04 06:18:01', '2020-11-04 06:18:01'),
(134, 'Rashidov Shavkatbek Ravshanbek o\'g\'li', 'Shavkatbek', NULL, '$2y$10$UmyF2NS.8EmkAk1B21uaHO3N4eRa5BngcGcjZiTE.2FwGSZspRCNK', 13, 'O\'qituvchi', NULL, '2020-11-04 06:38:57', '2020-11-04 06:38:57'),
(135, 'Yangibayev Aybek Kidirbayevich', 'YangibayevA', NULL, '$2y$10$IuVb2prPc6UKPpyNjeJTXubVuQhYWXEQ2O44YlKiI.ixZXIrryHG2', 14, 'Kafedra boshlig\'i o\'rinbosari', NULL, '2020-11-04 06:40:21', '2020-11-04 06:40:21'),
(136, 'Iminov Abdurasul Abdulatipovich', 'Abdurasul', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 1, 'Kafedra boshlig\'i', NULL, '2020-11-04 06:52:47', '2020-11-04 06:52:47'),
(137, 'Allanazarov Oybek Davronovich', '12345678', NULL, '$2y$10$D0IV/9EWWfpPd/kH5xwxRudBASqEkNcsCncJ9qwqiVDcTAVHhxsd.', 2, 'Kafedra boshlig\'i o\'rinbosari', NULL, '2020-11-04 06:57:44', '2020-11-04 06:57:44'),
(138, 'Uralov Sarvarjon Anvarjon o`g`li', 'SAUralov', NULL, '$2y$10$qQkfMlOao.SqnGh0g2v6SeOGbctVniVS6srno0Mj/bgIXQIeGH.rW', 2, 'O\'qituvchi', NULL, '2020-11-04 06:58:06', '2020-11-04 06:58:06'),
(139, 'Кочкаров Атабек Ахматвайевич', 'Атабек', NULL, '$2y$10$GVvjXLfasSbidn2Zs2.EUu6VKl4wrvG/veZf5LwHx7hMbCgLdDxpG', 5, 'Dotsent', NULL, '2020-11-04 08:56:00', '2020-11-04 08:56:00'),
(140, 'Umaraliev Vali Ergashevich', '07070707', NULL, '$2y$10$0smDl4SCEk8ADOfoNUbTYebJuIuJTvdpG5LDoi4eq6Ib/1l7DxL/6', 4, '0', NULL, '2020-11-04 09:02:08', '2020-11-04 09:02:08'),
(141, 'Аминжонов Шерзод Шухрат ўғли', 'шер4477', NULL, '$2y$10$naNcoeOuYzvHfAt3WJnOye6MUbBcSdwf2tAostwsDEFkDGUqfOhx2', 4, 'Kabinet boshlig\'i', NULL, '2020-11-04 09:11:46', '2020-11-04 09:11:46'),
(142, 'Кочкаров Атабек Ахматвайевич', 'Ахматвайевич', NULL, '$2y$10$nYj/eqqopeo02mZ/AMtHxOnQMwWj68vwyHg3FrzgKH6meMkpS1jcy', 5, 'Dotsent', NULL, '2020-11-04 10:08:20', '2020-11-04 10:08:20'),
(143, 'Bozorov Otabek Sadulloyevich', 'bozorov.otabek', NULL, '$2y$10$BdYrvjXkMD70JNUfjl6coOGhpwQYmyGr6ypBG7HcvNflILku68b3O', 11, 'Katta o\'qituvchi', NULL, '2020-11-04 10:17:06', '2020-11-04 10:17:06'),
(144, 'Raimov Doniyor Isakovich', 'raimovdoniyor', NULL, '$2y$10$aEdGd1Zmwd.eL/pSBvV0FOIgsXrK4Q8u0L/3zc7yPjSSB9E37BHX.', 11, 'Katta o\'qituvchi', NULL, '2020-11-04 10:26:23', '2020-11-04 10:26:23'),
(145, 'Xudoyberdiyev Abdurashid Abdirasulovich', 'XudoyberdiyevA', NULL, '$2y$10$FVpsqbBF4Pt9U4Vnu7rtIuC6.L5Iemmeai.VdH5lsGFrmQbfYUs6K', 14, 'Katta o\'qituvchi', NULL, '2020-11-04 11:44:57', '2020-11-04 11:44:57'),
(146, 'Ro\'ziyev Qahramon Absaatovich', '5131272', NULL, '$2y$10$8/5FvX0ViL574JDlD0i8uegvs/deWwWwd8tunQd004ge2FOr4X5U6', 10, 'O\'qituvchi', NULL, '2020-11-04 11:47:27', '2020-11-04 11:47:27'),
(147, 'Axmedova Soraxon Tolibjanovna', 'AxmedovaS', NULL, '$2y$10$enP8jaev.WB2n44O5RujfeZ2MwE3gbv5Pk4ecmzSuQpoxeHNzNM2i', 14, 'Professor', NULL, '2020-11-04 11:48:57', '2020-11-04 11:48:57'),
(148, 'Kushbakov Dilshod Musurmankulovich', 'KushbakovD', NULL, '$2y$10$2GJ8ZNceC6sL33RWm9qg1.C9yB/BiqtwXB3oP.ZvZZvj1CyUgc9V6', 14, 'Katta o\'qituvchi', NULL, '2020-11-04 11:51:28', '2020-11-04 11:51:28'),
(149, 'Tursunov Zokir Maxamadjanovich', 'zokirjon', NULL, '$2y$10$65AXid5r54oMcFVZmB1NfOkWDh7h1azHJ49CpL2p0DYWYp5LUGRNO', 4, 'Katta o\'qituvchi', NULL, '2020-11-04 11:55:20', '2020-11-04 11:55:20'),
(150, 'Toshtemirov Anvar Aliqulovich', 'anvarbek', NULL, '$2y$10$JZZQcs/NO59GRGUslNbNEuDA0j8/BPyTLo9b9cTwVXxlgBc8OSK6.', 15, 'Kafedra boshlig\'i o\'rinbosari', NULL, '2020-11-04 13:13:00', '2020-11-04 13:13:00'),
(151, 'Haqliyev Valijon Badalovich', 'haqliyev', NULL, '$2y$10$w6kI3E9wiWXQG4Szxg70Tu.70rrxgBEqjHBSvpBrMAjaI2siQLdZK', 7, 'Katta o\'qituvchi', NULL, '2020-11-05 02:36:31', '2020-11-05 02:36:31'),
(152, 'Шерматов Жасур Тохир ўғли', 'Манчестер', NULL, '$2y$10$9CFKZCLqgdw1SMcj8QITz.sgPc0zLZ7dj0oUoD2bjdtoe6dhBShBy', 15, 'O\'qituvchi', NULL, '2020-11-05 03:30:19', '2020-11-05 03:30:19'),
(153, 'Allayarov Nurmanbet Urazimbetovich', 'Nurmanbet175', NULL, '$2y$10$eCgNWU5jDS8Sr3.LhGYW2.5yxI32L8B2rvbz3DgSxzmW2105jYWT6', 19, 'Katta o\'qituvchi', NULL, '2020-11-05 04:03:41', '2020-11-05 04:03:41'),
(154, 'Mirsalixova Guzal Alautdinovna', 'ARMAN', NULL, '$2y$10$2UvImRV.NjcXaRn3Zrlr8eLjsRIbcXSRvv7woIq9Utckw5RnndHcK', 15, 'O\'qituvchi', NULL, '2020-11-05 04:12:16', '2020-11-05 04:12:16'),
(155, 'Davletova Nilufar Ruzmetovna', '998977551656', NULL, '$2y$10$GkkK5XFo26mWeYbBLEYx..uPt4xtG.AnQMadHWSx6NIKgSQZ2y.sC', 9, 'O\'qituvchi', NULL, '2020-11-05 04:21:46', '2020-11-05 04:21:46'),
(156, 'Turdiyev Laziz Zarifovich', 'turdiyev1985', NULL, '$2y$10$1ylBuIYUJqOz3QyL4h0vVuEKNrYG0ppbp9rTXm8Z13BYdok4h52Hq', 11, 'O\'qituvchi', NULL, '2020-11-05 04:25:17', '2020-11-05 04:25:17'),
(157, 'Qulmatov Sharof Asadovich', 'qulmatovsharof', NULL, '$2y$10$ubeNLvSgsNTfkGEFdumwu.6ZBMWplrz/apjj0zSt4lRlP6QdseLiC', 11, 'Kafedra boshlig\'i o\'rinbosari', NULL, '2020-11-05 05:06:07', '2020-11-05 05:06:07'),
(158, 'Rashidov Behzod Nurboevich', 'rashidovbehzod', NULL, '$2y$10$ivzaLoSJFEZOhVupNsnHuetRU2wDlDUM2AQhKxjdGC064H9EzRm6i', 11, 'Kafedra boshlig\'i', NULL, '2020-11-05 05:07:53', '2020-11-05 05:07:53'),
(159, 'Toshtemirov Norqul', 'toshtemirovnorqul', NULL, '$2y$10$c/jm5mrYOc8NltiKJ/8Mn.rGLY04Bz7g25XRAls.BJVYfr5GfdCSu', 11, 'Katta o\'qituvchi', NULL, '2020-11-05 05:10:09', '2020-11-05 05:10:09'),
(160, 'Akilov Olimjon', 'akilovolim', NULL, '$2y$10$YfnihXlO2jACp6/IEaSahekQ3okZSxq8YR5mstN4KkPOcnF9FCla.', 11, 'Dotsent', NULL, '2020-11-05 05:11:36', '2020-11-05 05:11:36'),
(161, 'Radjabova Mavjuda', 'radjabovamavjuda', NULL, '$2y$10$ikImpJuGOtjmQJeZBvbFPubFNoIf.Mk5i6sN0yVQD3LowB6aUIyFq', 11, 'Professor', NULL, '2020-11-05 05:14:15', '2020-11-05 05:14:15'),
(162, 'Алимов Мавлон Махаматходжаевич', 'Мавлон', NULL, '$2y$10$SYRkeyWBpYBa4U8AhGtRP.CA1qEZJVGoa3Ckr/2B3ISp/ijWhUJBO', 5, 'Katta o\'qituvchi', NULL, '2020-11-05 06:07:51', '2020-11-05 06:07:51'),
(163, 'Dustmurodov Umidxon Inatillaevich', '7291343', NULL, '$2y$10$ARaAaSh9KbDdpMFj/Jf/wufVSxLpuf4sOA0sZV9g083zW/x56EPlK', 9, 'Katta o\'qituvchi', NULL, '2020-11-05 06:09:40', '2020-11-05 06:09:40'),
(164, 'Парманов Фурқат Джумабаевич', 'Фурқат', NULL, '$2y$10$ZrSui3hx1QI.08i0USqIjO/qYybGoaFTpuxx3cM0VBJWZ3ekSgqv2', 5, 'O\'qituvchi', NULL, '2020-11-05 06:42:16', '2020-11-05 06:42:16'),
(165, 'Axmadbekov Xokimbek Xasan o\'gli', 'A_Xokim', NULL, '$2y$10$Rf8BAbWUPcHHuja5XaeDZeBK8rdXhzNV3/icm2guVdin7yH.EMol6', 6, 'Kabinet boshlig\'i', NULL, '2020-11-05 08:16:25', '2020-11-05 08:16:25'),
(166, 'Mallayev', 'r_mallayev', NULL, '$2y$10$yvXQWbxh6y6JEj60qdWNAeEpbET9oOWZS7gQslelX.9Eiow67TV9C', 1, 'O\'qituvchi', NULL, '2020-11-05 08:32:32', '2020-11-05 08:32:32'),
(167, 'Abdusalomov Firuz Abduxoliqovich', 'firuz', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'O\'qituvchi', NULL, '2020-11-05 08:40:14', '2020-11-05 08:40:14'),
(168, 'Закирова Дилдора Сабитовна', 'ЗакироваДС', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'Katta o\'qituvchi', NULL, '2020-11-05 09:27:48', '2020-11-05 09:27:48'),
(169, 'Shaumarov Ziyovuddin Shamsudinovich', 'Z_Shaumarov', NULL, '$2y$10$xrKkuBf5fMTFDROXhVQGiO8Jtp0ouLv3AL4inrxWF8gfxFwCE8qU.', 6, 'Katta o\'qituvchi', NULL, '2020-11-05 10:45:38', '2020-11-05 10:45:38'),
(170, 'Tursoatov Sodiq Xudoyorovich', 'SARDOR', NULL, '$2y$10$CQsNApSgb.HhhS26Ie/Q8u3Jq0QZm.Bdtf5ZHVk5DpTf5JhRH4JPi', 15, 'Katta o\'qituvchi', NULL, '2020-11-05 11:12:42', '2020-11-05 11:12:42'),
(171, 'Muhiddidnov Abror Hikmatovich', 'M_Abror', NULL, '$2y$10$v0KZUsEFJkrQi4SPK/o4H.Z8wkNFRm/4WjMXOdJ4inxB5D./GhRFG', 6, 'O\'qituvchi', NULL, '2020-11-05 11:25:45', '2020-11-05 11:25:45'),
(172, 'Saidov Miyonfarukh Rabiullaevich', 'ARKA', NULL, '$2y$10$u1RDH3JFxu5gPnrRm0bHS.ngregQ80wWqnB/8XFdlExXcLIkPZTuO', 15, 'Katta o\'qituvchi', NULL, '2020-11-05 11:29:05', '2020-11-05 11:29:05'),
(173, 'Primov Farxod Abdijabborovich', 'P_Farhod', NULL, '$2y$10$rii/0jgpVxT/SccCvzZLTecWXCgRXjO7O9aHBQP1XOx7SGwC9MKAO', 6, 'Katta o\'qituvchi', NULL, '2020-11-05 11:29:18', '2020-11-05 11:29:18'),
(174, 'Rajabov Baxtiyor Almaxmatovich', '8780987', NULL, '$2y$10$sLJgyAAwuXFxYDCgUBbuUeuVe8IEZUJPPKOLMdaHshsh9gGOMq9yC', 10, 'Kafedra boshlig\'i', NULL, '2020-11-05 13:14:15', '2020-11-05 13:14:15'),
(175, 'Ashirboyev Axrorjon Tirkash o\'g\'li', '9217004', NULL, '$2y$10$VY32sdVaquwnRvvJz/ARE.d8shj.8iOC7y0NzoRxx0BeWTbbX5BFu', 10, 'O\'qituvchi', NULL, '2020-11-06 04:07:07', '2020-11-06 04:07:07'),
(176, 'Turganov', 'Raxmidin', NULL, '$2y$10$qOlQt453J7GYSr2.V6OiGu1GPyve//jsYa.DlGQpLhCF.n/45b/ZW', 15, 'Katta o\'qituvchi', NULL, '2020-11-06 10:48:52', '2020-11-06 10:48:52'),
(178, 'Рахманов Расул Нарзуллаевич', 'RRN', NULL, '$2y$10$x3C9PIkCQaGWv1ojLzJAo.CVktqh0A1y02T3ohJX0KAuIxU7FkibW', 13, 'Katta o\'qituvchi', NULL, '2020-11-07 06:46:36', '2020-11-07 06:46:36'),
(179, 'Шарафутдинов Алишер Озадович', 'Шарафутдинов', NULL, '$2y$10$RrB4fi3QeVzk8N9LNv.QeO9CCT3GuJKi/xA8DRKyqLrnT/tQeTbx6', 2, 'Kafedra boshlig\'i', NULL, '2020-11-07 09:52:37', '2020-11-07 09:52:37'),
(180, 'Алланазаров Ойбек Давронович', 'Алланазаров', NULL, '$2y$10$m.NaEQh9lio.Lu1xoUPBvO0W/4v03b4aqNkHvCFzY4MqyGyNmGkkq', 2, 'Kafedra boshlig\'i o\'rinbosari', NULL, '2020-11-07 09:56:35', '2020-11-07 09:56:35'),
(181, 'Тураббаев Хусанбек Абдусаломович', 'Тураббаев', NULL, '$2y$10$5Ie4rgDNeaezIVIJq1XdFOLq9EsRviUbtmFX6Dr0eq4z/MuwQfoaq', 2, 'Dotsent', NULL, '2020-11-07 09:59:19', '2020-11-07 09:59:19'),
(182, 'Қўлдошев Мехриддин Ўринович', 'Қўлдошев', NULL, '$2y$10$Yai.MtfwXj5fCjtM8jrUiONcHcg9aNy3OrhOr4xCuA7XtnZj.x5dG', 2, 'Katta o\'qituvchi', NULL, '2020-11-07 10:01:16', '2020-11-07 10:01:16'),
(183, 'Джуманов Шухрат Тошматович', 'Джуманов', NULL, '$2y$10$888rkYabH3RVGs3Z/bGZ0OnNvFuGlHhekYf6MOEhcnG36IzvHVTDC', 2, 'Katta o\'qituvchi', NULL, '2020-11-07 10:02:56', '2020-11-07 10:02:56'),
(184, 'Низамов Санжар Мелсович', 'Низамов', NULL, '$2y$10$p5y4L5fQHfP2dDeDQuP0auzaiaQ2w63hT31eI80TEVhe1wQPAvyQW', 2, 'Katta o\'qituvchi', NULL, '2020-11-07 10:04:24', '2020-11-07 10:04:24'),
(185, 'Абдуҳамидов Бобур Абдуҳамидович', 'Абдуҳамидов', NULL, '$2y$10$88I5clrbJkdslJVGtaEbtehM7IV9ofJxomEk4XfubMWvGUXfn0fmm', 2, 'Katta o\'qituvchi', NULL, '2020-11-07 10:06:08', '2020-11-07 10:06:08'),
(186, 'Мажидов Жамшид Абдулла ўғли', 'Мажидов', NULL, '$2y$10$g2ck1.7LguO2H2oKm.d9RuzHevLjZZzKgvcfNgIYe.plQasroCifC', 2, 'O\'qituvchi', NULL, '2020-11-07 10:07:31', '2020-11-07 10:07:31'),
(187, 'Раззақов Сардор Ғуломжонович', 'Раззақов', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 2, 'O\'qituvchi', NULL, '2020-11-07 10:08:46', '2020-11-07 10:08:46'),
(188, 'Джураев Толиб Тохиржонович', 'Джураев', NULL, '$2y$10$ihGESAwhCytQGLAxiY4OwuxhvXyxtkJbaL6UtN3aDib31JYsJ3YCG', 2, 'O\'qituvchi', NULL, '2020-11-07 10:11:13', '2020-11-07 10:11:13'),
(189, 'Ubaydullayev Sherzodbek Ubaydullayevich', '8686', NULL, '$2y$10$LvbWk3W8/s81omj2/JP4fOfqWXYRtlXn95fnfWgdekgWOmFpqWwjm', 13, 'O\'qituvchi', NULL, '2020-11-07 10:11:29', '2020-11-07 10:11:29'),
(190, 'Аскарова Бахтигул Пўлатовна', 'Аскарова', NULL, '$2y$10$WhOPRUuUirkSDrEOYp8p2eyGstNKers/JHCasMlMMkPVG69uhoVHa', 2, 'O\'qituvchi', NULL, '2020-11-07 10:13:33', '2020-11-07 10:13:33'),
(191, 'Жўраев Фарходжон Махмуджон Ўғли', 'Жўраев', NULL, '$2y$10$hDGRsCCEd9POZVGLrzuVjuFt3Q5xvk8Fg6J4xMgiDn9jxCAFH41pm', 3, 'O\'qituvchi', NULL, '2020-11-07 10:15:05', '2020-11-07 10:15:05'),
(192, 'Абдуқодиров Тохир Собир ўғли', 'Абдуқодиров', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 2, 'O\'qituvchi', NULL, '2020-11-07 10:16:33', '2020-11-07 10:16:33'),
(193, 'Ахмедов Бунёд Бахтиёр ўғли', 'Ахмедов', NULL, '$2y$10$nlHhHuXjiTYtY/j11ULOqeQ41/aWsX08txtnVpI8gEji/20zPFbd2', 2, 'O\'qituvchi', NULL, '2020-11-07 10:18:02', '2020-11-07 10:18:02'),
(194, 'Мухторов Шохрух Баходир ўғли', 'Мухторов', NULL, '$2y$10$rG4mv5/skCoUkq9VRm8kTueguMkaqpWxKtzOktYFiA56FgUHomcZ2', 2, 'O\'qituvchi', NULL, '2020-11-07 10:32:59', '2020-11-07 10:32:59'),
(195, 'Zaynutdinov Sayfutdin Muhitdinovich', 'Zaynutdinov', NULL, '$2y$10$50cD1jY5jhPO3aPibFNymehwaQYTkuYMrPAezH/GB.W2vAGQ14eUq', 7, 'Professor', NULL, '2020-11-09 03:56:30', '2020-11-09 03:56:30'),
(196, 'Djavakova Karine Vladimirovna', 'Djavakova Karine', NULL, '$2y$10$Eaim4BWeYpGWUjApbGX0R.bTxJKqwgFsBVMokdgbm3NLH2FGs9fRC', 21, 'Kafedra boshlig\'i', NULL, '2020-11-10 04:24:09', '2020-11-10 04:24:09'),
(197, 'Saitxodjaev Xusan Bekjanovich', 'Saitxodjaev', NULL, '$2y$10$znBJQLix6.5G5NJpT/j/.O42aaPDtdTshsa4M94x79BUPKzTgpLte', 7, 'Dotsent', NULL, '2020-11-10 06:23:04', '2020-11-10 06:23:04'),
(198, 'Ernazarov Ravshan Ummatovich', 'Ernazarov', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 7, 'Kafedra boshlig\'i o\'rinbosari', NULL, '2020-11-10 06:50:56', '2020-11-10 06:50:56'),
(199, 'Radjabova Hafiza Shukrulloyevna', 'hafiza', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'O\'qituvchi', NULL, '2020-11-11 09:54:07', '2020-11-11 09:54:07'),
(200, 'Razakov Davron Xalikovich', 'Razakov', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 7, 'Dotsent', NULL, '2020-11-12 09:54:19', '2020-11-12 09:54:19'),
(201, 'Yuldashev Djaxongir Xayitovich', 'dj_yuldashev', NULL, '$2y$10$dSth/uHQnNa06zBIrjN0C.pMjonnRVQR3.KtAby1KCdycbLTqw3wS', 8, 'Kafedra boshlig\'i o\'rinbosari', NULL, '2020-11-14 06:27:09', '2020-11-14 06:27:09'),
(202, 'Sa\'dullayev G\'ayrat Abdujabbor o\'g\'li', 'S_G\'ayrat', NULL, '$2y$10$2GxijSbbjqxybBXUMqePUO.oDid8gTajQXl5OfrvcUHRizqeDRW/e', 6, 'O\'qituvchi', NULL, '2020-11-14 11:38:13', '2020-11-14 11:38:13'),
(203, 'Мирзакулов Акром Гафуржанович', 'Акромбек', NULL, '$2y$10$scUFiWmnE06jvHBBgSWYDOwAkOdz.7n8ZM.YKh/IVxnYI.RqyzbaK', 9, 'O\'qituvchi', NULL, '2020-11-16 08:29:09', '2020-11-16 08:29:09'),
(204, 'Rayimov Sherzod Tashtemirovich', 'R_Sherzod', NULL, '$2y$10$TLayhQJ2eIP1xhnhYlszIe8Bciovr8kM7fNL.icenmaUqX1c2B8WG', 6, 'O\'qituvchi', NULL, '2020-11-20 05:28:51', '2020-11-20 05:28:51'),
(205, 'Aimov Bahrom Fozilovich', 'A_Bahrom', NULL, '$2y$10$q/i0Di/ThitMptZXf6NFEuyMjg818sb0bHZNg/jLi5unGbbNxnfp6', 6, 'Katta o\'qituvchi', NULL, '2020-11-20 05:55:13', '2020-11-20 05:55:13'),
(206, 'Xoliqov Zayniddin Normamtovich', 'z_xoliqov', NULL, '$2y$10$QcfG8YJgMUMzmNDS.9SFuOs.WkXce8/1Kg1JRhxnL11ft2wasP7Xi', 8, 'O\'qituvchi', NULL, '2020-11-21 06:25:45', '2020-11-21 06:25:45'),
(207, 'Kamilov Muzaffar Baxtiyarovich', 'M.B.Kamilov', NULL, '$2y$10$W0x7lKzhodCoL0928QHHXeTmw8nE8TCTVU6T8XVngLpDfzP/EjeUq', 8, 'Katta o\'qituvchi', NULL, '2020-11-21 06:37:47', '2020-11-21 06:37:47'),
(208, 'Azizov Elbek Usmonjonovich', 'El_Azizov', NULL, '$2y$10$i1He7hYoyeopdPWgF6WvDexPjNY.C4hTDf3v/G.vFLRA9fzQhCani', 8, 'Katta o\'qituvchi', NULL, '2020-11-21 06:38:34', '2020-11-21 06:38:34'),
(209, 'Ummatov Mamarasul Tursunovich', 'M_Ummatov', NULL, '$2y$10$ChCl5SJuTvbIABoXu/jggeBAG/jyGliRBEHi/I78FV8C7wvFdpCG6', 8, 'O\'qituvchi', NULL, '2020-11-21 06:38:54', '2020-11-21 06:38:54'),
(210, 'Артиков Бахадир Адилович', 'Артиков445', NULL, '$2y$10$Rh3.PIOHLfA6fkevy3H/0exyds9E9Y8AUDEFLA928MIDGRQV9ZI7a', 4, 'O\'qituvchi', NULL, '2020-11-21 06:39:36', '2020-11-21 06:39:36'),
(211, 'Абдурасулова Қумриниса Раимқуловна', 'Маърифат', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 13, 'Kafedra boshlig\'i', NULL, '2020-11-23 05:01:40', '2020-11-23 05:01:40'),
(212, 'Qobilov Sharif Raximovich', 'sh_raximovich', NULL, '$2y$10$ZcCOcdDjnSZFv/.G7ddL3O5fxHddHHZTqjrr21IsUgFv3VqhDcXly', 13, 'Dotsent', NULL, '2020-11-23 07:08:12', '2020-11-23 07:08:12'),
(213, 'Dadajonov Vohid Mahmudjonovich', 'DadajonovV.', NULL, '$2y$10$fkDhO0zhie8YJefScvnxT.EcpUbquNgEvBsUCvG/HyyahO4M27ic.', 10, 'Katta o\'qituvchi', NULL, '2020-11-24 04:54:54', '2020-11-24 04:54:54'),
(214, 'axmedov ixtiyor baxtiyorovich', 'axmedov ixtiyor', NULL, '$2y$10$Ew1YXvAprrwsxf67HxwfEOj7vjvHBlNuuyfQOyDmQ0X2nxwsWFsoC', 10, 'Katta o\'qituvchi', NULL, '2020-11-24 04:55:25', '2020-11-24 04:55:25'),
(215, 'Turgunova Nasiba Tuychiyevna', 'TNT', NULL, '$2y$10$qKiYlWU6Bwl1hq0AuA1AzuNm9qIdDHjCuvRhqDT2mzN7GCm0RJQKe', 18, 'O\'qituvchi', NULL, '2020-11-24 07:44:59', '2020-11-24 07:44:59'),
(216, 'Haydarov Islomjon Mahmutali o\'g\'li', 'olmos92', NULL, '$2y$10$NbpALwpqROUjD.wAY6rROu/djkK9b3kZFqJT3FeSiXRRPsiNkIKEq', 18, 'O\'qituvchi', NULL, '2020-11-24 07:47:45', '2020-11-24 07:47:45'),
(217, 'Tursunova Ozoda Abdullayevna', 'ТОА', NULL, '$2y$10$FPY6dQrWHWsclMYLBmY6deDoMo32wjDYGGTod8MJ7Q7nuOHRdh/jW', 18, 'O\'qituvchi', NULL, '2020-11-24 09:19:30', '2020-11-24 09:19:30'),
(218, 'Закиров Бахтиёр Эргашевич', 'ЗАКИРОВ', NULL, '$2y$10$orKA96kU/MU6hdhty8RsJ.I.6vNnO.vUElVzhwNUyxA1/gbQpBu5a', 15, 'Kafedra boshlig\'i', NULL, '2020-11-24 10:40:47', '2020-11-24 10:40:47'),
(219, 'G\'ofurov Sherzod Raxmatullayevich', 'G_Sherzod', NULL, '$2y$10$ZkKEnDJtr2mwMqqDJswoouqXzOjdxxnBGEKqp0UiEs8qSB0zHBh5C', 6, 'Katta o\'qituvchi', NULL, '2020-11-24 11:29:40', '2020-11-24 11:29:40'),
(220, 'Асракулов Мирносир Мирсултонович', 'АСРАКУЛОВ', NULL, '$2y$10$BDpgzOfx/PhwWSltYQ7tW.IQ7EZuDDNsIA8p9xxUKzcPwwn6YqZ32', 15, 'Dotsent', NULL, '2020-11-24 11:49:52', '2020-11-24 11:49:52'),
(221, 'Тўраев Баходир Сулаймонович', 'ТЎРАЕВ', NULL, '$2y$10$/4hlSzSkkEjGcQtjBOysR.YXNd0TH3F60UfVVSEY3QIJYG9.yPkMC', 15, 'Katta o\'qituvchi', NULL, '2020-11-24 12:15:23', '2020-11-24 12:15:23'),
(222, 'Umirzakov Begzod Ataboevich', 'Бегзод', NULL, '$2y$10$FE8xKjyKhoOeNOzAsPO0p.xhghR801GCRU0RxDfSx0Tz8Ai4vWFCC', 13, 'Katta o\'qituvchi', NULL, '2020-11-25 11:08:48', '2020-11-25 11:08:48'),
(223, 'Tadjiev Azamat Alibaevich', 'Azamat', NULL, '$2y$10$TNg85rtYXrR3Xu50ZUUX..Du.O3Q0yCOcIXkA7BIGEUyWbXZ9FJ8q', 2, 'Katta o\'qituvchi', NULL, '2020-11-27 04:48:41', '2020-11-27 04:48:41'),
(224, 'Джуманов Шухрат  Тошматович', 'Азке', NULL, '$2y$10$qNIvVZYJop31iaS7H.MWDuQq97fDlRi5B/0KxjxBOwp6A5IFMdJIG', 2, 'Katta o\'qituvchi', NULL, '2020-11-27 06:28:41', '2020-11-27 06:28:41'),
(225, 'Джуманов  Шухрат Тошматович', 'Шухрат', NULL, '$2y$10$kQdt3n2bnXSHDYkr7clB1uCEmC9vRxKPUMVjylEnM3tcqLkqIkq8y', 2, 'Katta o\'qituvchi', NULL, '2020-11-28 04:11:44', '2020-11-28 04:11:44'),
(226, 'Rasulev Abdulaziz Karimovich', 'A_Rasulev', NULL, '$2y$10$SOwKLkGzNMptJTm0qsE7G.jldcTvEBnAABkPtOWWC2F67PF35TsMa', 6, 'Professor', NULL, '2020-11-30 07:19:25', '2020-11-30 07:19:25'),
(227, 'Ismailov Isamiddin', 'ismailov', NULL, '$2y$10$e.qYWbaV.b3gd4CXQ2ED/e33ZEpf9sb2HRhRIhC6j0iYSdgZtFxQO', 8, 'Kafedra boshlig\'i', NULL, '2020-11-30 08:53:09', '2020-11-30 08:53:09'),
(228, 'Ashurova Nargiza Azamovna', 'A_Nargiza', NULL, '$2y$10$ckCJj6dYFWbtTfizwU/GN.M0sVBW/9SDMdMQQFqHOvOvXo5WjTILe', 6, 'Dotsent', NULL, '2020-11-30 09:13:53', '2020-11-30 09:13:53'),
(229, 'Kuldashev Nuriddin Abduganiyevich', 'Nuriddin Kuldashev', NULL, '$2y$10$j7sUJ.q2nyNjVb7Njm1g/u3uqOstUHAvpg8z9Udi.xJzcsuCpRHde', 4, 'Kabinet boshlig\'i', NULL, '2020-11-30 10:08:21', '2020-11-30 10:08:21'),
(230, 'Artikov Bahadir Adilovich', 'Bahadir', NULL, '$2y$10$Y41KLiuW7J4wTehkoKp11uclgPDBmEb5NXnBTChosrXmeyYODZK/2', 4, 'O\'qituvchi', NULL, '2020-12-01 04:45:09', '2020-12-01 04:45:09'),
(231, 'Xolmuminov Oybek Jumayevich', '7710057', NULL, '$2y$10$JbIX8wT80sTxMgH5klTDx.cyi4A2qP65DsZW7rMlwiqpUfNwCc996', 4, 'Katta o\'qituvchi', NULL, '2020-12-01 05:24:15', '2020-12-01 05:24:15'),
(232, 'Нуримов Зафар Рахманбердыевич', '998903527963', NULL, '$2y$10$7.xcW2inlrwUnTB.MIHXTeBPISCiJx8ubPZje6BlObQrPMuzcX2lW', 9, 'Dotsent', NULL, '2020-12-02 04:21:20', '2020-12-02 04:21:20'),
(233, 'Миршарапов Акмал Ғайратович', 'аки-88', NULL, '$2y$10$S00bzl7uWYPNYLsAgnbBs.v9uszBOB3pHqG80JoVXFwRGznhcFqEe', 9, 'O\'qituvchi', NULL, '2020-12-02 05:53:16', '2020-12-02 05:53:16'),
(234, 'Kuldashev Nuriddin Abduganiyevich', 'Kuldashev Nuriddin Abduganiyevich', NULL, '$2y$10$iSksYss3fQhBdqfvMe7nvu6Y8gFhVxb69mVC46h387JTX4pmgouW6', 4, 'Kafedra boshlig\'i', NULL, '2020-12-02 06:32:30', '2020-12-02 06:32:30'),
(235, 'Джурабаев Рустам Тураббаевич', 'Рустам', NULL, '$2y$10$JH2hFkd7jo9346cBXCOdQe63xWzuerYbHz.d7uexr/F22CCOvT.gy', 5, 'O\'qituvchi', NULL, '2020-12-02 09:40:25', '2020-12-02 09:40:25'),
(236, 'Davletova Nilufar Ruzmetovna', '977551656', NULL, '$2y$10$ujHwH75VhTbhkcmdI5Le7ODDBnwCqUrqkaqrC0BpDzMdND.sd3Bdy', 9, 'O\'qituvchi', NULL, '2020-12-02 09:58:19', '2020-12-02 09:58:19'),
(237, 'Jabbarov Zokir Qodirjonovich', '1113', NULL, '$2y$10$8sDyvxl4//diLh4IukXqE.4UI5HJBoD2lPWiJmUhsN8b8W0/OmfpC', 20, 'Katta o\'qituvchi', NULL, '2020-12-02 10:23:08', '2020-12-02 10:23:08'),
(238, 'RAJABOV RINAT YOQUBOVICH', '903498200', NULL, '$2y$10$suheSEz.YtOF4WT7nCCX9uUfZZFqMiZ4qpmKxoHiQesLv12D2qxBe', 9, 'Katta o\'qituvchi', NULL, '2020-12-02 10:32:17', '2020-12-02 10:32:17'),
(239, 'Ubaydullayev Kamoliddin Nuriddinovich', 'KUbaydullayev', NULL, '$2y$10$jm1u8t8ofa.bXDIhz/a6UOAd.ilr.2f7l8fVjp62WTkewviMcIvpe', 16, 'Katta o\'qituvchi', NULL, '2020-12-02 10:41:15', '2020-12-02 10:41:15'),
(240, 'Payziyev Dilshat Yuldashbayevich', '5296500', NULL, '$2y$10$m5lIvyI4/mHJ6GNrv.Xp/u.0WKR3mgtCF2I.fbK3eVFUY6ENpibhO', 10, 'Katta o\'qituvchi', NULL, '2020-12-02 12:24:50', '2020-12-02 12:24:50'),
(241, 'Abdullayev Zohid Zokirjon O`g`li', 'Abdullayev ZZZ', NULL, '$2y$10$BhHV8fAARjl0.efv4jE1T.RVfox/1ymMYJ0av4wtw4VTiay5DQAxq', 9, 'O\'qituvchi', NULL, '2020-12-02 12:52:14', '2020-12-02 12:52:14'),
(242, 'Jalilov Azizjon Alimdjanovich', 'AJalilov', NULL, '$2y$10$s/ikuhGg07KUxCWWrJNqYuAEdEtaf2UtJaP5N0l8C4b8YS.PcRg0C', 16, 'O\'qituvchi', NULL, '2020-12-02 13:28:36', '2020-12-02 13:28:36'),
(243, 'Xakimova Iroda Muxammadjonovna', 'XIM', NULL, '$2y$10$kB2wr4VEXXKdQiVypQVNEektFoAvNR3uxFHE7mZwuuhD2l/CbcUby', 18, 'O\'qituvchi', NULL, '2020-12-03 03:24:26', '2020-12-03 03:24:26'),
(244, 'Umaraliev Valijon Ergashevich', 'Umaraliev', NULL, '$2y$10$YLphAP4LHAJzsmD29KjBm.cXrQA5vGHpbOpLlCEdnBypHssNCLniS', 4, 'Dotsent', NULL, '2020-12-03 08:31:17', '2020-12-03 08:31:17'),
(245, 'Turaev Ilxomjon Esanovich', 'Esanovich', NULL, '$2y$10$g76Cvl7sT4vGo1iFFV7K8OUFtUr.gl.ryqCTFg.5XtWBm4rwvSNFG', 7, 'Dotsent', NULL, '2020-12-03 09:41:15', '2020-12-03 09:41:15'),
(246, 'Risqiyev Muzaffar Rahmatullayevich', 'Rahmatullayevich', NULL, '$2y$10$naQGCsg2sjupeiBMvKnF6OeKB2FWzlMVdKLF0d8i0gI7AtCvOa8Za', 7, 'O\'qituvchi', NULL, '2020-12-03 10:07:10', '2020-12-03 10:07:10'),
(247, 'Nuraliyev Dilshod Abdullayevich', 'Abdullayevich', NULL, '$2y$10$lRP5rMu0i6zbMqddDWwPgOdrQd5ccKRpznqytJ8wfnukBZNy0883i', 7, 'Katta o\'qituvchi', NULL, '2020-12-03 10:12:28', '2020-12-03 10:12:28'),
(248, 'Uzbekov Alisher Anatoliyevich', 'Anatoliyevich', NULL, '$2y$10$IghiaJoyByD3Et1Gl2C5F.caccgRa5SJEHs12nbo9nRbPfrgsvLN.', 7, 'O\'qituvchi', NULL, '2020-12-03 10:19:40', '2020-12-03 10:19:40'),
(249, 'Хамдамов Абдували Ахмедович', 'Hamdamov', NULL, '$2y$10$dy7NlM3UAIzx3YXdlzcBQesEGu935wFjVw9syTqDKImMN1p0zVcOu', 16, 'Kafedra boshlig\'i', NULL, '2020-12-03 11:07:45', '2020-12-03 11:07:45'),
(250, 'Tojiboyev Rustamjon Normadovich', 'TojiboyevR', NULL, '$2y$10$65/nizmVOh8PHlt/LyoJq.xNgjJCmSX7yR96J8MuHKQgXOlp2AA3q', 18, 'O\'qituvchi', NULL, '2020-12-04 04:00:00', '2020-12-04 04:00:00'),
(251, 'Kalonov Ilhomali Xursanaliyevich', 'KalonovI', NULL, '$2y$10$U1TLPLLsGOPf7kfpyW5Ts.mQwnquLt7JMqQFNAwGWApN2fTUABary', 18, 'Katta o\'qituvchi', NULL, '2020-12-04 04:09:29', '2020-12-04 04:09:29'),
(252, 'Turabbaev Xusan Abdusalamovich', 'TXA', NULL, '$2y$10$4nbf8Tqgm4s/G/ks4njcceK2OBibH3baVzlB.PYghMCB9YeceI.He', 2, 'Dotsent', NULL, '2020-12-04 06:23:41', '2020-12-04 06:23:41'),
(253, 'Eshonqulov Farid Misirovich', 'EshonqulovF', NULL, '$2y$10$n8i8QBHz42hNmebemDvmFe1bKaRhlCS.8307/h/ggdMqXFdNVe7mW', 16, 'O\'qituvchi', NULL, '2020-12-04 11:02:41', '2020-12-04 11:02:41'),
(254, 'Nasilloev Abdullo Abror o\'g\'li', 'Abdullo', NULL, '$2y$10$dff3EFgh7JwuTzB5shf1kOv.1fd9NghJU7VfjvZwg7vBTAn1vNajG', 16, 'O\'qituvchi', NULL, '2020-12-04 11:10:33', '2020-12-04 11:10:33'),
(255, 'Xo\'jayarova Nilufar Nemat qizi', 'rafulin', NULL, '$2y$10$AO5Uup376CkwfyUJTlHriOV3BpNIfCVwvRgHWFQs2Jc1aJG.QoY2W', 8, 'O\'qituvchi', NULL, '2020-12-04 11:50:30', '2020-12-04 11:50:30'),
(256, 'Nishanov Akmal Voxid o\'g\'li', 'NishanovA', NULL, '$2y$10$8PyINZ7KCFz43EH47pYRm.vOc5cbTc/kmqpKazG0pRJENwly1luKO', 16, 'O\'qituvchi', NULL, '2020-12-04 12:15:30', '2020-12-04 12:15:30'),
(257, 'Bekmurodov Normurod Nekmurodovich', 'BekmurodovN', NULL, '$2y$10$uS0YaNjQ2sNbM9xvNPXcaOzda9ZInXBeY8DdYk8fOcKOeTtsFsV0S', 16, 'Katta o\'qituvchi', NULL, '2020-12-04 12:43:19', '2020-12-04 12:43:19'),
(258, 'Bobomorodov Farxod Boymurotovich', 'BobomorodovF', NULL, '$2y$10$mtR2k4jFYGjR5lsGwCgM1uOVkTUjHmVU4yZ0BJXwxMJAkj6biA8m2', 16, 'O\'qituvchi', NULL, '2020-12-04 14:34:06', '2020-12-04 14:34:06'),
(259, 'Sirliev Baxtiyor Nazarov', 'SirlievB', NULL, '$2y$10$z/4h4e0SrmrW8cyBbSGeoelBXVhQc3eJzhWUBhl/q5eAy8OKqVusm', 18, 'Kafedra boshlig\'i', NULL, '2020-12-05 03:44:27', '2020-12-05 03:44:27'),
(260, 'Tursunov Saidabrorxo\'ja Alisher o\'gli', 'TursunovS', NULL, '$2y$10$vwMiCC96y7aZxXAO1AXSo.Qys2tSjYGNjpvvzTbvkI5cmAWuAzNqq', 16, 'O\'qituvchi', NULL, '2020-12-05 03:52:58', '2020-12-05 03:52:58'),
(261, 'Shoimov Norqobil Bobomurodovich', 'Shoimov', NULL, '$2y$10$p8//ujS.Cvr0eoNubUPR7eKZuHrDEuH6LbWv6DBnmZO1LkHtQGVoO', 20, 'Dotsent', NULL, '2020-12-05 03:56:49', '2020-12-05 03:56:49'),
(262, 'Nazarov Zafarbek Zokirovich', 'NazarovZ', NULL, '$2y$10$Eq..Cs1FjIE7/H82Dh4FveD40C6xjVY/AVI0v96YZIGnePy3BKvm6', 16, 'O\'qituvchi', NULL, '2020-12-05 04:24:30', '2020-12-05 04:24:30'),
(263, 'Jabbarov Zokirjon Qodirjonovich', 'JabbarovZ', NULL, '$2y$10$xOli9L6o761hsqLuudHR2eiKihGXCRxcSmu.v/l8tgCT/tvOqF9gm', 20, 'Dotsent', NULL, '2020-12-05 04:35:37', '2020-12-05 04:35:37'),
(264, 'Saidov Shuhrat Yarmamat o\'g\'li', 'SaidovSH', NULL, '$2y$10$DsHRlUFEXiJBvaSEA3y3HuTLof15UUQLXS0W35KmipS3CqszD3V4u', 16, 'O\'qituvchi', NULL, '2020-12-05 05:58:36', '2020-12-05 05:58:36'),
(265, 'Karabayev Oybek Ravshanovich', 'KarabayevO', NULL, '$2y$10$Je/agYFnKzOwUphaKxS8TOnZXh.nUEEeB5y4BMwgYm.M7Vr3ofmE6', 16, 'Katta o\'qituvchi', NULL, '2020-12-05 06:02:04', '2020-12-05 06:02:04'),
(266, 'Xolxo\'jayev Muxtor Qo\'chqor o\'g\'li', 'XolxojayevM', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 16, 'Katta o\'qituvchi', NULL, '2020-12-05 06:04:23', '2020-12-05 06:04:23'),
(267, 'Matyozov Shodlik Ozodovich', 'MatyozovSh', NULL, '$2y$10$OO2wKbSYRY57h52A/0x2uukwh.JAaZ4vTdKHDNceNiov6MvDFbOY.', 16, 'O\'qituvchi', NULL, '2020-12-05 06:08:30', '2020-12-05 06:08:30'),
(268, 'Dusmurodov Ilxom Xusanovich', 'DusmurodovI', NULL, '$2y$10$u6p0DnWhQtr1W0kSsO4vk.a9L5BT1LvG0lZFExFjbcDEKXiqgg8K6', 16, 'Katta o\'qituvchi', NULL, '2020-12-05 06:31:19', '2020-12-05 06:31:19'),
(269, 'Саитбаев Тимур Ренатович', 'Саитбаев', NULL, '$2y$10$VfAKtKEe27bgk0GxuxDRrOOQxdLoGLSHcndVCqi3kZx/nca1Llr3C', 16, 'Professor', NULL, '2020-12-05 06:57:01', '2020-12-05 06:57:01'),
(270, 'Jalilov Azizjon Alimdjanovich', 'JalilovA', NULL, '$2y$10$ZfXSjBFK6iBOGS6tRhnK/uzgTr9QgFkB7Dgfq.oNJaeTQ9bUFDOUi', 16, 'O\'qituvchi', NULL, '2020-12-05 07:00:10', '2020-12-05 07:00:10'),
(271, 'Ибрагимов Аброр Алимович', 'Ибрагимов', NULL, '$2y$10$r8uyvq9BWfVhdmBv8KREEuJQI.8HHutQid4AXrr/BENBT5P9Rqcs6', 16, 'Katta o\'qituvchi', NULL, '2020-12-05 07:31:08', '2020-12-05 07:31:08'),
(272, 'Адилов Мирсамат', 'АдиловМ', NULL, '$2y$10$I0fCFlpyv6fjQy4maGSLFOTVht/QA3RMKs5DLYZC.jG8m3kiMjDGK', 16, 'Katta o\'qituvchi', NULL, '2020-12-05 07:59:59', '2020-12-05 07:59:59'),
(273, 'Usmonov Doniyor Maxmudovich', 'UsmonovD', NULL, '$2y$10$atveev9vTaDo/Ojif.Gq2upMVfUgAul3ZKaOhoSwmKESXkqzxfSCi', 20, 'Katta o\'qituvchi', NULL, '2020-12-05 09:49:44', '2020-12-05 09:49:44'),
(274, 'Abdullayev Zohid zokirjon O`g`li', '972509262', NULL, '$2y$10$UKs/9goRamU1tiIC/xBV6OXkvOoplfjjwTCIVvAuUkvo5VWqI/a2y', 9, 'O\'qituvchi', NULL, '2020-12-05 11:07:15', '2020-12-05 11:07:15'),
(275, 'Buranova Raziya Yermaxammed qizi', 'Raziya0906', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 13, 'O\'qituvchi', NULL, '2020-12-07 07:27:54', '2020-12-07 07:27:54'),
(276, 'ОЛИМОВ ОТАБЕК ЖУМАДУРДИЕВИЧ', '973433532', NULL, '$2y$10$x7ZGcH0jrj1tbYGeONfVBOr10aSJVUx5D41RT3rptYNykWdJbAj5C', 9, 'Katta o\'qituvchi', NULL, '2020-12-08 04:45:52', '2020-12-08 04:45:52'),
(277, 'АДИЛОВ ОЛИМ ИБРАГИМОВИЧ', '974037100', NULL, '$2y$10$mlfB6y2UJryGCcP7Bs8Y8ORaa0nWw4E.aa09NJcXrIibL5mER.bnm', 9, 'Katta o\'qituvchi', NULL, '2020-12-08 05:03:50', '2020-12-08 05:03:50'),
(278, 'Турсунов Шухрат Сабитжонович', 'Спорт кафедра', NULL, '$2y$10$k8prh1aKERxosm6x6FVlbuR1V8tZkXGoVYlH4u3E9W.oTIuP3MBwe', 9, 'Kafedra boshlig\'i', NULL, '2020-12-08 05:34:53', '2020-12-08 05:34:53'),
(279, 'Egamberdiyev Bexzod iskandarovich', 'JTHTBehzod', NULL, '$2y$10$QLzOiCJTMs5BZgqRNqwBIOQgswAaqW7yWUEF.A/MJXQhpMCy2T70W', 8, 'O\'qituvchi', NULL, '2020-12-08 06:21:35', '2020-12-08 06:21:35'),
(280, 'Komilov Muzaffar Baxtiyarovich', '5577', NULL, '$2y$10$xySU4abnfVNHZWLFQi9rIeR2FDhw7jVcv/ZDzYW6eZK8GV8SgH8GK', 8, 'Katta o\'qituvchi', NULL, '2020-12-09 06:31:46', '2020-12-09 06:31:46'),
(281, 'Абдуллаев Фарход Хабибуллаевич', 'fxa1982@gmail.com', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'O\'qituvchi', NULL, '2020-12-09 09:36:11', '2020-12-09 09:36:11'),
(282, 'anonim', 'kristopherr649@gmail.com', NULL, '$2y$10$Gleo0wpqXMogD4Vp2Esb/OPqzL6Ewzq4gsf62jWM9RcPxhWhhpr2m', 15, 'Administrator', NULL, '2020-12-09 13:01:36', '2020-12-09 13:01:36'),
(283, 'Sayidov Maxmud Xamidovish', 'Msayidov1818', NULL, '$2y$10$ZjFICDzwQZdcfPdJqx.EVucU6wpXRENFJXs5DnPQTdiQHgwjhUiT6', 19, 'O\'qituvchi', NULL, '2020-12-10 04:08:31', '2020-12-10 04:08:31'),
(284, 'Devyatov Anvar Kayumovich', '9999', NULL, '$2y$10$6NBwAvqVNQ6ZT8iCodLV1Ox/oSAE5YeV3dzp2xYmVHe0tBSent5ky', 8, 'Katta o\'qituvchi', NULL, '2020-12-10 05:59:17', '2020-12-10 05:59:17'),
(285, 'Turayev Akmal Panjiyevich', 'd_huquqiy', NULL, '$2y$10$m4Wfy3tU/Z0M2o/UYhbIKObUIFHzNk7AyOEo2q/pQzlrrSzAm1SEq', 3, 'Katta o\'qituvchi', NULL, '2020-12-14 04:16:46', '2020-12-14 04:16:46'),
(286, 'И', 'd_huquqiy1985', NULL, '$2y$10$EWQIHl8xxI4UwuPQ3horMeAkho4SxxaBrwy3.ddu0h3eLY.ZUMwYm', 3, 'Katta o\'qituvchi', NULL, '2020-12-14 07:09:56', '2020-12-14 07:09:56'),
(287, 'Тураев Муродхон Аюбхонович', 'dav_Turaev', NULL, '$2y$10$hCCXm./qVWEmf4w/E1JZnujOwo5PU0iteT35o7EUiNzLePPTXYnIW', 3, 'Katta o\'qituvchi', NULL, '2020-12-14 08:11:23', '2020-12-14 08:11:23'),
(288, 'Абдурашитова Нигора Бобокуловна', 'nigora1973', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'Katta o\'qituvchi', NULL, '2020-12-14 10:49:51', '2020-12-14 10:49:51'),
(289, 'Saitqulov Qodirali Abdisalimovich', 'S_Qodirali', NULL, '$2y$10$K7pm0vDOhAJj4Op1eOwFc.Xe607ik0dVSGYTrPYJ/IG2H725IHNw6', 6, 'Katta o\'qituvchi', NULL, '2020-12-15 06:37:47', '2020-12-15 06:37:47'),
(290, 'Yusubov Zokir Mamarajabovich', '1379509', NULL, '$2y$10$AZYQYEXis.jUa1zB1qSK5.mpgIC7vM0CGb3T5iPl932VqU5LwR8oi', 10, 'O\'qituvchi', NULL, '2020-12-17 12:18:01', '2020-12-17 12:18:01'),
(291, 'Авлияқулов Суннатулла Холмурод ўғли', 'dhfsunnatulla', NULL, '$2y$10$whhfkNHESqBGmjEkcrjyPeFi1xj2715VMrI7cv7iPpd0YfgjQtOr2', 3, 'O\'qituvchi', NULL, '2020-12-21 06:09:37', '2020-12-21 06:09:37'),
(292, 'Turayeva Dilnoza Rustamboyevna', '9025002', NULL, '$2y$10$HJQ9uJMVaXB6ANiK2L5YcuNKSbJOsaEp/flociBBfz5HySzplXyLy', 10, 'Katta o\'qituvchi', NULL, '2020-12-24 10:12:11', '2020-12-24 10:12:11'),
(293, 'Худойбердиев Ахрор Қосималиевич', 'dhfaxror', NULL, '$2y$10$HrzYAW8Cb0wqCB4s2ITpROthhPeky9FnVY3nYfEnDSeMNZczQfa9m', 3, 'Dotsent', NULL, '2020-12-28 11:10:40', '2020-12-28 11:10:40'),
(294, 'Shermatov Jasur Toxir o\'g\'li', 'Jasur', NULL, '$2y$10$rCB5KYnxTvyl20ldQxg0fePwRQxnkk7V2ejop3w9m1fSux6PbTh5.', 15, 'O\'qituvchi', NULL, '2021-01-02 05:16:07', '2021-01-02 05:16:07'),
(295, 'Алибеков Ботир Султанбекович', 'Амирбек', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'Katta o\'qituvchi', NULL, '2021-01-07 06:38:59', '2021-01-07 06:38:59'),
(296, 'Қаршиев Ғуломжон Сайфуллаевич', 'Шеф', NULL, '$2y$10$5aLIALxJe9QZ444iYxdH4eMpRYGBL.5Ahjl7LYbUJhY63WG9gvGDG', 13, 'Katta o\'qituvchi', NULL, '2021-01-07 12:15:42', '2021-01-07 12:15:42'),
(297, 'Mirzayev Farhod Davlatbekovich', 'farhady', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'O\'qituvchi', NULL, '2021-01-11 06:53:02', '2021-01-11 06:53:02'),
(298, 'Shermatova Nazokat Safarovna', 'ShermatovaN', NULL, '$2y$10$uoqUUL74OX9g7BjbV6zcPOOmtGujrOyYXonPIEqhvDxl.SOOusLdS', 18, 'O\'qituvchi', NULL, '2021-01-13 04:55:49', '2021-01-13 04:55:49'),
(299, 'Tursunoava Ozoda Abdullayevna', 'TursunovaO', NULL, '$2y$10$KRPuBGAjpUIG69i5V6vf4efXKsi4XKjwYNYrkTE88CC880.QRdBSW', 18, 'O\'qituvchi', NULL, '2021-01-13 05:24:09', '2021-01-13 05:24:09'),
(300, 'Bobomurodov Farxod Boymyrotovich', 'BobomurodovF', NULL, '$2y$10$eJWgth8Eu1WnTHQvqMlj5.z/o5Hhwhn1g4I/s.WpuBL8QDShvSDT2', 16, 'O\'qituvchi', NULL, '2021-01-14 12:32:32', '2021-01-14 12:32:32'),
(301, 'Turgunova Nasiba Tuychiyevna', 'Turgunova N', NULL, '$2y$10$S.s0aXyKOmj6g1BQrn4fqelMsiCiVMmjE8XsPmBwdr5O8sLB.2sTG', 18, 'O\'qituvchi', NULL, '2021-01-14 12:36:17', '2021-01-14 12:36:17'),
(302, 'Джузбаева Дамира Сергеевна', 'djuzbayevad', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'Katta o\'qituvchi', NULL, '2021-01-15 07:17:35', '2021-01-15 07:17:35'),
(304, 'Джузбаева Дамира Сергеевна', 'damirad', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'Katta o\'qituvchi', NULL, '2021-01-15 07:20:43', '2021-01-15 07:20:43'),
(305, 'Koveev Ruslan Rustamovich', 'Koveev', NULL, '$2y$10$mZUV/LF.i065LzsxK.qDuujmptvZOxa16eBotzTTuVd/h4tELPFyu', 18, 'O\'qituvchi', NULL, '2021-01-15 09:23:25', '2021-01-15 09:23:25'),
(306, 'Sultonov Abdulla Azamatovich', 'Abdulla', NULL, '$2y$10$5A4YgmN4RS/vxSwMYY6jE.kO6b9rz3iiqjpVD7B6/tyzOPhsowgtG', 2, 'Dotsent', NULL, '2021-01-16 05:35:28', '2021-01-16 05:35:28'),
(307, 'Uralov Sarvarjon Anvarjon o`g`li', 'S.A.Uralov', NULL, '$2y$10$qQkfMlOao.SqnGh0g2v6SeOGbctVniVS6srno0Mj/bgIXQIeGH.rW', 2, 'O\'qituvchi', NULL, '2021-01-16 06:06:24', '2021-01-16 06:06:24'),
(308, 'Mirzayev Farhod Davlatbekovich', 'farhady1985', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'O\'qituvchi', NULL, '2021-01-16 06:14:49', '2021-01-16 06:14:49'),
(309, 'Tastanbekova Gulchexra Sadanovna', 'DHFgulchehra', NULL, '$2y$10$lP.Znt8rtp/i.mQ3Q4mzCuP0TapnPRNqBOJz9DDDGkjnFxUmgeAGe', 3, 'Dotsent', NULL, '2021-01-16 10:06:41', '2021-01-16 10:06:41'),
(310, 'Abdurashitova Nigora Bobokulovna', 'nigora73', NULL, '$2y$10$8Y0DbEjAywDArmkCLgM3r.cNB0WIc43G4x01lKoewzG7HygZDR6Ue', 17, 'Katta o\'qituvchi', NULL, '2021-01-16 11:02:12', '2021-01-16 11:02:12'),
(311, 'Сарабеков Хасан Давронович', 'Сарабеков Х.Д.', NULL, '$2y$10$mj.LaGIgMBPNInlgZDxaFe80gMidGCOQEjnZwGj/KoyssDvEQnPta', 8, 'Dotsent', NULL, '2021-01-19 04:45:29', '2021-01-19 04:45:29'),
(312, 'Shukurov Farxodjon Norqulovich', 'Shukurov1983', NULL, '$2y$10$4TCbpMATbrzDQhbMSzrdrueC93jO8pgM8K8Nd7f1ev8drhvvGDFTS', 8, 'Katta o\'qituvchi', NULL, '2021-01-19 06:16:43', '2021-01-19 06:16:43');
INSERT INTO `old_users` (`id`, `name`, `login`, `email_verified_at`, `password`, `kaf_id`, `lavozim`, `remember_token`, `created_at`, `updated_at`) VALUES
(313, 'Нурмуҳамедов Тохир Анварович', 'нурмухамедов1234', NULL, '$2y$10$OI5QHKKoAgoO.SrMUVaf3ei0Xo7ubon.e1v1LjI/f3mkXplZPnjCG', 8, 'Katta o\'qituvchi', NULL, '2021-01-19 06:59:51', '2021-01-19 06:59:51'),
(314, 'Jamolov Bobur Ilhomjon o\'g\'li', 'JamolovB', NULL, '$2y$10$QTk.16zM.rj8VrIQ56//k.70RSizj2qevUacv6Q.DVb3l/fpbU.P.', 10, 'O\'qituvchi', NULL, '2021-01-21 04:30:35', '2021-01-21 04:30:35'),
(315, 'a', 'b', NULL, '$2y$10$1No431wZqCqvNpiO8T2elO4JbhK7VKZZJjsasmzRvG2F7IP247VAO', 50, 'Administrator', NULL, '2021-01-22 06:18:55', '2021-01-22 06:18:55'),
(316, 'TURSOATOV SODIQ XUDOYOR O\'G\'LI', 'UCHXOZ83', NULL, '$2y$10$bl6LWIIg0Ly5FxXNqeY19.H0Tqc1y0iV.hLhZuk5pi6BliqA1hYnq', 15, 'Katta o\'qituvchi', NULL, '2021-01-22 09:27:47', '2021-01-22 09:27:47'),
(317, 'Абдукодиров Тохир', 'тоха', NULL, '$2y$10$fL3mUgUc01XprpwhHg4lzels7Edkzjmq5ZzYrNnXJK3ZEcWkLcuu2', 2, 'O\'qituvchi', NULL, '2021-01-23 06:30:13', '2021-01-23 06:30:13'),
(318, 'Zakirov', 'Bahtiyor', NULL, '$2y$10$l0MxLOqQlrhNJwlKouFMc.RT2dBXLPKkGcohdYReUDvA7L1dvt0DK', 15, 'Dotsent', NULL, '2021-02-11 13:07:09', '2021-02-11 13:07:09'),
(319, 'Zakirova Adina Gulyamovna', 'Zakirova', NULL, '$2y$10$WOI3NwYAj1IRIQqOnGyzFO6UHRCAmFtPgoJy9hk3M0UzFxuIV57h.', 13, 'Professor', NULL, '2021-02-12 06:26:57', '2021-02-12 06:26:57'),
(320, 'Muhitdinov Faxriddin Muhitdinovich', 'Muhitdinov', NULL, '$2y$10$KAkalyCOiEqQtVxIwGJUGuS.VW0WhAFFbyl4DEgQrk.k0JLpwEOpG', 13, 'Professor', NULL, '2021-02-12 07:00:46', '2021-02-12 07:00:46'),
(321, 'Nishanov Akmal', 'Nishanov', NULL, '$2y$10$jg/aSTYiqigo.2m9d/KCPug254XQRCvFyQ875QNvt1zV4RybIl.8u', 16, 'O\'qituvchi', NULL, '2021-02-17 05:47:34', '2021-02-17 05:47:34'),
(322, 'Qarshiyev G\'ulomjon Sayfullayevich', 'Qarshiyev', NULL, '$2y$10$ioV8i1eT4z9peBEc0G0I9.ijOl3FjEwB8RMvbb6cYB.s1AB92FcK2', 13, 'Dotsent', NULL, '2021-02-17 07:03:30', '2021-02-17 07:03:30'),
(323, 'Ubaydullayev Sherzodbek Muzafarovich', 'UbaydullayevSh', NULL, '$2y$10$JvSbU0EZgoJbVbzPn1hEWOAk47kgWDrYwr1PR0.a1bX2nds..QDfu', 13, 'O\'qituvchi', NULL, '2021-02-17 11:15:02', '2021-02-17 11:15:02'),
(324, 'Турсоатов Содиқ Худоёр ўғли', 'Сардор', NULL, '$2y$10$MhecmMwgV7hmHI5POJ5PyezlP.9fGDqVFktwgS/4EJ250UF0S0oC.', 15, 'Katta o\'qituvchi', NULL, '2021-02-18 04:18:11', '2021-02-18 04:18:11'),
(325, 'Maxmudova Musharraf Mirraxmatovna', 'Maxmudova', NULL, '$2y$10$p/CJYuFyXFaobAGo7qQweeQnlD7Mty.OZxeo0TCaiP59k1xwXsxbO', 9, 'Katta o\'qituvchi', NULL, '2021-02-25 05:01:47', '2021-02-25 05:01:47'),
(326, 'asraqulov mirnosir mirsultonovich', 'azim', NULL, '$2y$10$8BRs27/0ZAoElwR/DbDwouixzuzy8y2rG.Zud55ETd3jt6nFW16Re', 15, 'Dotsent', NULL, '2021-03-11 06:15:38', '2021-03-11 06:15:38'),
(328, 'BEGZOD', 'BRULDEEBARS', NULL, '$2y$10$q.AtxhF.DYbjx5uuAeP5CuJZ2t7Npd25g31HDKZIXLtULtaQcSpKS', 1, 'O\'qituvchi', NULL, '2021-05-29 11:33:24', '2021-05-29 11:33:24'),
(329, 'Nasilloyev Abdullo Abror ugli', 'nasilloyev', NULL, '$2y$10$WnUahwUA/zl3rgzIl0flYOlpmTK/3pI4j9WiOv.F9PfUTH..dB4jW', 16, 'O\'qituvchi', NULL, '2021-06-23 06:06:06', '2021-06-23 06:06:06'),
(330, 'Majidov', 'Jamshid', NULL, '$2y$10$cB.jMEPTNsAhXqGf19dGZO12Bi8.GcklXrJV94JPDa/RsV1E88QBu', 2, 'O\'qituvchi', NULL, '2021-06-23 14:26:19', '2021-06-23 14:26:19'),
(331, 'Uralov Sarvarjon Anvarovich', 'sarvar', NULL, '$2y$10$qQkfMlOao.SqnGh0g2v6SeOGbctVniVS6srno0Mj/bgIXQIeGH.rW', 2, 'O\'qituvchi', NULL, '2021-06-23 14:27:19', '2021-06-23 14:27:19'),
(332, 'nuralievutkir', 'samarqand', NULL, '$2y$10$/YIcnB6KVoYRpuarr/sReO5ke4MU87eb2dF9Eg3bcGnQs9V7FAlqe', 17, 'O\'qituvchi', NULL, '2021-06-24 05:45:01', '2021-06-24 05:45:01'),
(333, 'Test Test', 'test2@mail.ru', NULL, '$2y$10$eEqW9X4mJyCP2bwKU56Y3O8xAAD1XZz33OKJF4NSP31i.GXDpExVy', 1, 'O\'qituvchi', NULL, '2021-08-10 10:09:27', '2021-08-10 10:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patents`
--

CREATE TABLE `patents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `miqyosi` int(11) NOT NULL,
  `nomi` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `raqami` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sana` date NOT NULL,
  `muallif` int(11) NOT NULL,
  `ilova` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ball` double DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patents`
--

INSERT INTO `patents` (`id`, `user_id`, `miqyosi`, `nomi`, `raqami`, `sana`, `muallif`, `ilova`, `ball`, `status`, `created_at`, `updated_at`) VALUES
(4, 31, 2, 'Yaratilgan dasturiy ta\'minot uchun ', 'DT001', '2021-10-06', 1, '1633950963_icons8-rocket-80.png', 7.5, '1', '2021-10-11 06:16:03', '2021-10-11 06:31:50'),
(5, 31, 1, 'P1', 'P12', '2021-10-07', 1, '1634032265_icons8-steps-128.png', 15, '1', '2021-10-12 04:51:05', '2021-10-12 04:51:25'),
(6, 39, 1, 'Mavzu1', 'R001', '2021-10-01', 1, '1634041757_icons8-teaching-64.png', 15, '1', '2021-10-12 07:29:17', '2021-10-12 07:29:37');

-- --------------------------------------------------------

--
-- Table structure for table `patent_turi`
--

CREATE TABLE `patent_turi` (
  `id` int(11) NOT NULL,
  `miqyosi` varchar(255) NOT NULL,
  `ball` double NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patent_turi`
--

INSERT INTO `patent_turi` (`id`, `miqyosi`, `ball`, `created_at`, `updated_at`) VALUES
(1, 'Xalqaro patent', 15, '2021-10-09 11:02:10', '2021-10-10 13:37:08'),
(2, 'Respublika patent', 7.5, '2021-10-09 11:02:10', '2021-10-10 13:37:13');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statusuroks`
--

CREATE TABLE `statusuroks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statusuroks`
--

INSERT INTO `statusuroks` (`id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Deactive', NULL, NULL),
(2, 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `study_year`
--

CREATE TABLE `study_year` (
  `id` int(11) NOT NULL,
  `year` varchar(12) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `study_year`
--

INSERT INTO `study_year` (`id`, `year`, `created_at`, `updated_at`) VALUES
(1, '2020-2021', '2021-10-10 11:16:35', '2021-10-10 11:16:35'),
(2, '2021-2022', '2021-10-10 11:17:54', '2021-10-10 11:17:54');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kafedra_id` bigint(20) UNSIGNED NOT NULL,
  `fannomi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `kafedra_id`, `fannomi`, `created_at`, `updated_at`) VALUES
(1, 1, 'Axborot xavfsizligi', NULL, NULL),
(2, 2, 'Dastlabki tergov', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tipuroks`
--

CREATE TABLE `tipuroks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ball` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tipuroks`
--

INSERT INTO `tipuroks` (`id`, `type`, `ball`, `created_at`, `updated_at`) VALUES
(1, 'Ochiq dars', 0, NULL, NULL),
(2, 'Maxorat darsi', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userimages`
--

CREATE TABLE `userimages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `profileimage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userimages`
--

INSERT INTO `userimages` (`id`, `user_id`, `profileimage`, `created_at`, `updated_at`) VALUES
(8, 31, '1633949608_Уринкулов О.jpg', '2021-10-11 05:53:28', '2021-10-11 05:53:28'),
(9, 32, '1633951368_XoldorovF.jpg', '2021-10-11 06:22:48', '2021-10-11 06:22:48'),
(12, 33, '1634036537_Greg-Emerson-edit-2.jpg', '2021-10-12 06:02:17', '2021-10-12 06:02:17'),
(13, 39, '1634038770_rasm.jpg', '2021-10-12 06:39:30', '2021-10-12 06:39:30'),
(14, 41, '1634797111_фото А.Султонов.jpg', '2021-10-21 01:18:31', '2021-10-21 01:18:31'),
(15, 42, '1637996087_XoldorovF.jpg', '2021-11-27 01:54:47', '2021-11-27 01:54:47');

-- --------------------------------------------------------

--
-- Table structure for table `userprofiles`
--

CREATE TABLE `userprofiles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `born` date NOT NULL,
  `malumot` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mutaxassislik` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iioq` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ait` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `userprofiles`
--

INSERT INTO `userprofiles` (`id`, `user_id`, `born`, `malumot`, `mutaxassislik`, `iioq`, `ait`, `pit`, `created_at`, `updated_at`) VALUES
(11, 31, '2021-10-24', '3', 'Axborot xavfsizligi, kriptografiya va kriptotaxlil', '2018', '3', '3', '2021-10-11 05:52:53', '2021-10-11 05:52:53'),
(12, 32, '1990-07-21', '3', 'Yerusti transport vositalari va tizimlari', '31.12.2017', '1', '3', '2021-10-11 06:22:09', '2021-10-11 06:22:09'),
(14, 39, '1954-12-01', '2', 'Huquqshunoslik', '30.03.2018', '51', '20', '2021-10-12 06:39:05', '2021-10-12 06:39:05'),
(15, 41, '1984-02-10', '2', 'Tergov faoliyati', '2002', '4', '8', '2021-10-21 01:15:19', '2021-10-21 01:15:19'),
(16, 42, '2021-11-27', '3', 'Yuridik', '1995', '10', '20', '2021-11-27 01:53:48', '2021-11-27 01:53:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `old_user_id` int(11) DEFAULT NULL,
  `kafid` int(11) DEFAULT NULL,
  `lavozimid` int(11) NOT NULL,
  `creatorid` int(11) NOT NULL,
  `creatorname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint(1) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `open_pas` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `old_user_id`, `kafid`, `lavozimid`, `creatorid`, `creatorname`, `name`, `email`, `role`, `email_verified_at`, `password`, `open_pas`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, NULL, NULL, 10, 0, '', 'Admin', 'admin@akadmvd.akd', 1, NULL, '$2y$10$hLFnKFn6To7x/igcb0IGp.u9/DE0BsELa0fV3GfOQnuRWQ/1e5Z06', NULL, NULL, '2021-09-30 06:49:22', '2021-09-30 06:49:22'),
(3, NULL, 1, 0, 1, 'O\'rinkulov Odiljon Naziraliyevich', 'Axborot tehnologiyalari kafedrasi', 'atk@akadmvd.akd', 3, NULL, '$2y$10$Jo/.7ug6NwbwVP8HbgI/qOhPJ9KSl7HfICsMab650QbJKROsAsiSq', NULL, NULL, '2021-10-02 04:40:07', '2021-10-02 04:40:07'),
(7, NULL, 2, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Datlabki tergov kafedrasi', 'dt@akadmvd.akd', 3, NULL, '$2y$10$X6X/K9qzKa.QRFqjOZ1g2eHNxXQgSkj6axs.kZSlH4uJNGaIVWada', NULL, NULL, '2021-10-02 05:36:00', '2021-10-02 05:36:00'),
(9, NULL, 3, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Davlat-huquqiy fanlar kafedrasi', 'dhf@akadmvd.akd', 3, NULL, '$2y$10$z73BlZxEseXGxwq0krv3JugiXp62/ybNke2R/55QHF8PT99r3CArO', NULL, NULL, '2021-10-02 06:02:45', '2021-10-02 06:02:45'),
(10, NULL, 4, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Fuqarolik-huquqiy fanlar kafedrasi', 'fhf@akadmvd.akd', 3, NULL, '$2y$10$7XCh.SAoa5e94fBreR.uJOiBlmd3GXj9F3JY4ldZtqkuCfGTpEAIi', NULL, NULL, '2021-10-02 06:03:16', '2021-10-02 06:03:16'),
(11, NULL, 5, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Harbiy tayyorgarlik kafedrasi', 'htk@akadmvd.akd', 3, NULL, '$2y$10$0f2fTyNAuU0t.QaA8dLVV.G9eKR1CVFCwjom5pRWi3DGlOdSSBw.G', NULL, NULL, '2021-10-02 06:03:43', '2021-10-02 06:03:43'),
(12, NULL, 6, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Huquqbuzarliklar profilaktikasi kafedrasi', 'hpk@akadmvd.akd', 3, NULL, '$2y$10$R7fsUqtPo6TL7857glwJaetnawegTNdyTSBE0igcWfi6rVwqw0//a', NULL, NULL, '2021-10-02 06:04:14', '2021-10-02 06:04:14'),
(13, NULL, 7, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Ijtimoiy-iqtisodiy fanlar kafedrasi', 'iifk@akadmvd.akd', 3, NULL, '$2y$10$2tBF9jiNfWZie5Ngy8QW3u7MSsavP25dhcHWiyI0/D/UaLAgehU52', NULL, NULL, '2021-10-02 06:04:46', '2021-10-02 06:04:46'),
(14, NULL, 8, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Jamoat tartibi va xavfsizligini ta\'minlash kafedrasi', 'jtxtk@akadmvd.akd', 3, NULL, '$2y$10$NSF7sbZUe.hH6Sedcom9seilwZ4txlj9z/JJnHHKmWlUQxD59NU3K', NULL, NULL, '2021-10-02 06:05:21', '2021-10-02 06:05:21'),
(15, NULL, 9, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Jangovar va jismoniy tayyorgarlik kafedrasi', 'jjtk@akadmvd.akd', 3, NULL, '$2y$10$tag1vWJjCntlwjaXrWU4ZO2jSbi31GX.oVlaf.DXQwruOg38xVUBG', NULL, NULL, '2021-10-02 06:05:52', '2021-10-02 06:05:52'),
(16, NULL, 10, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Jinoyat va jinoyat ijroiya huquqi kafedrasi', 'jjihk@akadmvd.akd', 3, NULL, '$2y$10$MVzohvJzPgmsJshKlR.S/OOyCOFqXAz0mjUFNns0QUFBMI0kpTSDK', NULL, NULL, '2021-10-02 06:06:23', '2021-10-02 06:06:23'),
(17, NULL, 11, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Jinoyat-protssesual huquqi kafedrasi', 'jphk@akadmvd.akd', 3, NULL, '$2y$10$a4CjbwZ0JwhdAr55WZriEOxGEHmPFLRPo3Hlq389gFurLEdIt8GVS', NULL, NULL, '2021-10-02 06:06:55', '2021-10-02 06:06:55'),
(18, NULL, 12, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Kriminalistik ekspertizalar kafedrasi', 'kek@akadmvd.akd', 3, NULL, '$2y$10$nNlHp93pn4n7miI56v2S5uIRJvZN1E749jJ79NJ9iDGeg4pvg9INW', NULL, NULL, '2021-10-02 06:07:26', '2021-10-02 06:07:26'),
(19, NULL, 13, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Kriminalogiya kafedrasi', 'kk@akadmvd.akd', 3, NULL, '$2y$10$nEUnSq7Q.wHfpYsjOJfPZO7a5ZrNkK.VA3Pu4IqnnBaFCNC9WaDRe', NULL, NULL, '2021-10-02 06:07:49', '2021-10-02 06:07:49'),
(20, NULL, 14, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Ma\'muriy huquq kafedrasi', 'mhk@akadmvd.akd', 3, NULL, '$2y$10$JJr2CFV0D9IEGyrXgb2LPOCrMhupiEcaTQT8SCLKx8bpiDxyb3/8O', NULL, NULL, '2021-10-02 06:08:13', '2021-10-02 06:08:13'),
(21, NULL, 15, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Terrorizm va odam savdosiga qarshi kurash kafedrasi', 'tosqkk@akadmvd.akd', 3, NULL, '$2y$10$VY/zFjlSaCgK.1G.gIttlO9HMm7btCl8W6Fqz7EAa.GHhtfMaJfHC', NULL, NULL, '2021-10-02 06:08:48', '2021-10-02 06:08:48'),
(22, NULL, 16, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Tezkor-qidiruv faoliyati kafedrasi', 'tqfk@akadmvd.akd', 3, NULL, '$2y$10$oc357qC0k.aPko9U4FcWH.8G4k1KkUyS.56J5nxDpPeZ6CvCKJLV6', NULL, NULL, '2021-10-02 06:09:20', '2021-10-02 06:09:20'),
(23, NULL, 17, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Tillarni o\'rganish kafedrasi', 'tok@akadmvd.akd', 3, NULL, '$2y$10$/O8q3BFu0Iz42apZJBkmQeGd3coPI5fszRy45L5cY5krcIS1gYf4m', NULL, NULL, '2021-10-02 06:09:45', '2021-10-02 06:09:45'),
(24, NULL, 18, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Xizmat faoliyati psixologiyasi kafedrasi', 'xfpk@akadmvd.akd', 3, NULL, '$2y$10$Ts9Pt67sxTKl55AKE8oSsOCqBhzJdF.venlGCGuEmhBGTrd6pLrfi', NULL, NULL, '2021-10-02 06:10:13', '2021-10-02 06:10:13'),
(25, NULL, 19, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Yo\'l harakati xavfsizligini ta\'minlash kafedrasi', 'yhxtk@akadmvd.akd', 3, NULL, '$2y$10$F9Nb1xdcn6dv0zgalogQ.e/WEkbsxQnZAFv0kpxZCCkvbLylaC/p.', NULL, NULL, '2021-10-02 06:10:48', '2021-10-02 06:10:48'),
(27, NULL, 18, 2, 24, 'Xizmat faoliyati psixologiyasi kafedrasi', 'Ilmiy bo\'lim', 'ilmiy@akadmvd.akd', 4, NULL, '$2y$10$Mna53oFKLS36ezC/wI6wd.SAvAW44HzLI31JZM.HlHKN58lkU1roi', NULL, NULL, '2021-10-06 04:51:14', '2021-10-06 04:51:14'),
(31, NULL, 1, 5, 3, 'Axborot tehnologiyalari kafedrasi', 'O\'rinkulov Odiljon Naziraliyevich', 'odil@mail.ru', 2, NULL, '$2y$10$i43IMR4vuMsGLEIPULUdGeZ3PKKu/lQsTLJGLmxVHmnJa.3FV5Jue', NULL, NULL, '2021-10-11 05:51:57', '2021-10-11 05:51:57'),
(32, NULL, 19, 5, 25, 'Yo\'l harakati xavfsizligini ta\'minlash kafedrasi', 'Xoldarov Fidokor Erkinboy o\'g\'li', 'fidokor@akadmvd.akd', 2, NULL, '$2y$10$TRsD0bOPVsH/Qs39UVPLIu19AjSojOe49CprinbaNw.9x/2Qk8MQi', NULL, NULL, '2021-10-11 06:21:16', '2021-10-11 06:21:16'),
(33, NULL, 1, 5, 3, 'Axborot tehnologiyalari kafedrasi', 'Abdullayev Murod', 'murod@akadmvd.akd', 2, NULL, '$2y$10$yqHD3.gAx9ZmZM3GpurTuuFRnHTHERH1fvErgaLc2M3QuBVFUtBEq', NULL, NULL, '2021-10-11 07:12:13', '2021-10-11 07:12:13'),
(39, 52, 10, 8, 16, 'Jinoyat va jinoyat ijroiya huquqi kafedrasi', 'Tursunov Axtam Salomovich', 'a.tursunov@akadmvd.akd', 2, NULL, '$2y$10$/OJFb2lzzdYUCZh/NR9mbORtRfU/xrBkCa6k9brb3iIvWAKiki6um', '123456789', NULL, '2021-10-12 06:37:40', '2021-10-12 06:37:40'),
(40, NULL, NULL, 0, 0, '', 'Iminov Abdurasul Abdulatipovich', 'iminovabdurasul19701029@gmail.com', 2, NULL, '$2y$10$s9U0BsAc9GRTZ9Xphm1LmuWJUSRn.Qnr0u0G.lzULDTegXiALmel6', NULL, NULL, '2021-10-13 02:26:31', '2021-10-13 02:26:31'),
(41, NULL, 11, 7, 17, 'Jinoyat-protssesual huquqi kafedrasi', 'Sultonov Abdulla Azamatovich', 'jphk_sultonov@akadmvd.akd', 2, NULL, '$2y$10$GpAqkPjx6BBIfEwaZkp8IOr4p0H.2t7sx.fP8abYK8iKa2UHjBVWe', '123456789', NULL, '2021-10-21 01:13:50', '2021-10-21 01:13:50'),
(42, NULL, 3, 5, 9, 'Davlat-huquqiy fanlar kafedrasi', 'Test test', 'test2@mail.ru', 2, NULL, '$2y$10$fWg8I6mNTKnBj7iKWa4OseqbbfEY1Q28eozVrZaQeJJOb6JT3OBaO', '123456789', NULL, '2021-11-27 01:52:20', '2021-11-27 01:52:20');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_dars`
-- (See below for the actual view)
--
CREATE TABLE `v_dars` (
`id` bigint(20) unsigned
,`user_id` bigint(20) unsigned
,`kid` int(11)
,`subject_id` bigint(20) unsigned
,`tipurok_id` bigint(20) unsigned
,`name` varchar(191)
,`kafName` varchar(255)
,`fannomi` varchar(255)
,`type` varchar(25)
,`mavzu` varchar(191)
,`guruh` varchar(191)
,`sana` date
,`ilova` varchar(191)
,`ball` double(8,1)
,`statusurok_id` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_dars_reyting`
-- (See below for the actual view)
--
CREATE TABLE `v_dars_reyting` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`ball` double(18,1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_dars_soni`
-- (See below for the actual view)
--
CREATE TABLE `v_dars_soni` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafname` varchar(255)
,`dars_soni` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_dissertats`
-- (See below for the actual view)
--
CREATE TABLE `v_dissertats` (
`id` bigint(20) unsigned
,`user_id` bigint(20)
,`name` varchar(191)
,`mavzu` varchar(255)
,`diss_maqomi_id` varchar(50)
,`maqomi` varchar(25)
,`shifr` varchar(25)
,`nomi` varchar(255)
,`fan` varchar(50)
,`tsana` date
,`ysana` date
,`dalolatnoma` varchar(255)
,`ball` double
,`status` varchar(191)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_diss_reyting`
-- (See below for the actual view)
--
CREATE TABLE `v_diss_reyting` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`ball` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_diss_soni`
-- (See below for the actual view)
--
CREATE TABLE `v_diss_soni` (
`user_id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafName` varchar(255)
,`soni` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_dotsents`
-- (See below for the actual view)
--
CREATE TABLE `v_dotsents` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafName` varchar(255)
,`lavozimid` int(11)
,`lavozim` varchar(191)
,`profile_id` bigint(20) unsigned
,`iioq` varchar(191)
,`ait` varchar(191)
,`pit` varchar(191)
,`ilmiy_daraja_id` bigint(20) unsigned
,`ilmiy_daraja` varchar(191)
,`ilmiyDarajalova` varchar(191)
,`ilmiy_unvon_id` bigint(20) unsigned
,`ilmiy_unvon` varchar(25)
,`profileimage` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_dsc`
-- (See below for the actual view)
--
CREATE TABLE `v_dsc` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafName` varchar(255)
,`lavozimid` int(11)
,`lavozim` varchar(191)
,`profile_id` bigint(20) unsigned
,`iioq` varchar(191)
,`ait` varchar(191)
,`pit` varchar(191)
,`ilmiy_daraja_id` bigint(20) unsigned
,`ilmiy_daraja` varchar(191)
,`ilmiyDarajalova` varchar(191)
,`ilmiy_unvon_id` bigint(20) unsigned
,`ilmiy_unvon` varchar(25)
,`profileimage` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_ilmiydaraja`
-- (See below for the actual view)
--
CREATE TABLE `v_ilmiydaraja` (
`id` bigint(20) unsigned
,`user_id` bigint(20) unsigned
,`name` varchar(191)
,`ilmiydaraja` varchar(191)
,`ilmiyDarajalova` varchar(191)
,`creator` varchar(191)
,`status` varchar(191)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_ilmiydaraja_ilmiyunvon_me`
-- (See below for the actual view)
--
CREATE TABLE `v_ilmiydaraja_ilmiyunvon_me` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafName` varchar(255)
,`lavozimid` int(11)
,`lavozim` varchar(191)
,`profile_id` bigint(20) unsigned
,`iioq` varchar(191)
,`ait` varchar(191)
,`pit` varchar(191)
,`ilmiy_daraja_id` bigint(20) unsigned
,`ilmiy_daraja` varchar(191)
,`ilmiyDarajalova` varchar(191)
,`ilmiy_unvon_id` bigint(20) unsigned
,`ilmiy_unvon` varchar(25)
,`profileimage` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_ilmiyunvo`
-- (See below for the actual view)
--
CREATE TABLE `v_ilmiyunvo` (
`id` bigint(20) unsigned
,`user_id` bigint(20)
,`name` varchar(191)
,`ilmiyunvon` varchar(25)
,`iui` varchar(191)
,`status` tinyint(1)
,`ball` double
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kafedra_bosh`
-- (See below for the actual view)
--
CREATE TABLE `v_kafedra_bosh` (
`id` bigint(20) unsigned
,`kafid` int(11)
,`lavozimid` int(11)
,`creatorid` int(11)
,`creatorname` varchar(191)
,`name` varchar(191)
,`email` varchar(191)
,`role` tinyint(1)
,`email_verified_at` timestamp
,`password` varchar(191)
,`remember_token` varchar(100)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kafedra_bosh_light`
-- (See below for the actual view)
--
CREATE TABLE `v_kafedra_bosh_light` (
`id` bigint(20) unsigned
,`kafName` varchar(255)
,`email` varchar(191)
,`user_id` bigint(20) unsigned
,`name` varchar(191)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kafedra_reyting`
-- (See below for the actual view)
--
CREATE TABLE `v_kafedra_reyting` (
`id` bigint(20) unsigned
,`kafName` varchar(255)
,`ball` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kafedra_role`
-- (See below for the actual view)
--
CREATE TABLE `v_kafedra_role` (
`id` bigint(20) unsigned
,`kafid` int(11)
,`lavozimid` int(11)
,`creatorid` int(11)
,`creatorname` varchar(191)
,`name` varchar(191)
,`email` varchar(191)
,`role` tinyint(1)
,`email_verified_at` timestamp
,`password` varchar(191)
,`open_pas` varchar(255)
,`remember_token` varchar(100)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kafedra_teachers`
-- (See below for the actual view)
--
CREATE TABLE `v_kafedra_teachers` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafName` varchar(255)
,`kafid` int(11)
,`lavozim` varchar(191)
,`lavozimid` int(11)
,`email` varchar(191)
,`role` tinyint(1)
,`open_pas` varchar(255)
,`creatorname` varchar(191)
,`creatorid` int(11)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kurs`
-- (See below for the actual view)
--
CREATE TABLE `v_kurs` (
`id` bigint(20) unsigned
,`user_id` int(11)
,`name` varchar(191)
,`kafid` int(11)
,`kt_id` int(11)
,`turi` varchar(255)
,`nomi` varchar(255)
,`sid` int(11)
,`year` varchar(12)
,`ball` double
,`ilova` varchar(100)
,`status` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kurs_reyting`
-- (See below for the actual view)
--
CREATE TABLE `v_kurs_reyting` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`ball` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_kurs_soni`
-- (See below for the actual view)
--
CREATE TABLE `v_kurs_soni` (
`user_id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafName` varchar(255)
,`soni` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_langs`
-- (See below for the actual view)
--
CREATE TABLE `v_langs` (
`id` bigint(20) unsigned
,`user_id` bigint(20)
,`name` varchar(191)
,`langname_id` int(11)
,`lang_name` varchar(50)
,`langtype_id` int(11)
,`lang_type` varchar(50)
,`ball` varchar(191)
,`status` varchar(191)
,`ilova` varchar(252)
,`bsana` date
,`ysana` date
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_lang_reyting`
-- (See below for the actual view)
--
CREATE TABLE `v_lang_reyting` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`ball` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_lang_soni`
-- (See below for the actual view)
--
CREATE TABLE `v_lang_soni` (
`user_id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafName` varchar(255)
,`soni` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_loyihas`
-- (See below for the actual view)
--
CREATE TABLE `v_loyihas` (
`id` bigint(20) unsigned
,`user_id` bigint(20)
,`name` varchar(191)
,`lm_id` int(11)
,`miqyosi` varchar(191)
,`mavzu` text
,`raqami` varchar(25)
,`bsana` date
,`ysana` date
,`buyruq` varchar(50)
,`ilova` varchar(255)
,`ball` double
,`status` varchar(191)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_loyiha_reyting`
-- (See below for the actual view)
--
CREATE TABLE `v_loyiha_reyting` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`ball` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_loyiha_soni`
-- (See below for the actual view)
--
CREATE TABLE `v_loyiha_soni` (
`user_id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafName` varchar(255)
,`soni` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_malaka_reyting`
-- (See below for the actual view)
--
CREATE TABLE `v_malaka_reyting` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`ball` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_malaka_soni`
-- (See below for the actual view)
--
CREATE TABLE `v_malaka_soni` (
`user_id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafName` varchar(255)
,`soni` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_malaks`
-- (See below for the actual view)
--
CREATE TABLE `v_malaks` (
`id` bigint(20) unsigned
,`user_id` bigint(20)
,`name` varchar(191)
,`kafid` int(11)
,`mid` int(11)
,`turi` varchar(50)
,`sid` int(11)
,`year` varchar(12)
,`mavzu` text
,`kun` int(11)
,`ball` double
,`status` varchar(191)
,`ilova` varchar(191)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_maqolas`
-- (See below for the actual view)
--
CREATE TABLE `v_maqolas` (
`id` bigint(20) unsigned
,`user_id` int(11)
,`name` varchar(191)
,`kafid` int(11)
,`maqola_turi_id` int(11)
,`turi` varchar(255)
,`maqola_miqyosi_id` int(11)
,`miqyosi` varchar(255)
,`mavzu` varchar(255)
,`mualliflik` int(11)
,`ilova` varchar(255)
,`ball` double
,`status` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_maqola_count`
-- (See below for the actual view)
--
CREATE TABLE `v_maqola_count` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafname` varchar(255)
,`maqola_soni` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_maqola_reyting`
-- (See below for the actual view)
--
CREATE TABLE `v_maqola_reyting` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`ball` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_materials`
-- (See below for the actual view)
--
CREATE TABLE `v_materials` (
`id` bigint(20) unsigned
,`user_id` int(11)
,`name` varchar(191)
,`kafid` int(11)
,`mtid` int(11)
,`turi` varchar(50)
,`nomi` varchar(255)
,`taboq` double
,`muallif` int(11)
,`sana` date
,`ball` double
,`status` varchar(191)
,`ilova` varchar(255)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_materialsoni`
-- (See below for the actual view)
--
CREATE TABLE `v_materialsoni` (
`user_id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafName` varchar(255)
,`soni` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_material_reyting`
-- (See below for the actual view)
--
CREATE TABLE `v_material_reyting` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`ball` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_old_maqolas`
-- (See below for the actual view)
--
CREATE TABLE `v_old_maqolas` (
`id` bigint(20) unsigned
,`old_user_id` int(11)
,`kafid` int(11)
,`mavzu` varchar(255)
,`mualliflik` int(11)
,`ilova` varchar(255)
,`miqyosi` varchar(255)
,`turi` varchar(255)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_patents`
-- (See below for the actual view)
--
CREATE TABLE `v_patents` (
`id` bigint(20) unsigned
,`user_id` int(11)
,`name` varchar(191)
,`kafid` int(11)
,`pm_id` int(11)
,`miqyosi` varchar(255)
,`nomi` text
,`raqami` varchar(255)
,`sana` date
,`muallif` int(11)
,`ilova` varchar(255)
,`ball` double
,`status` varchar(255)
,`created_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_patent_reyting`
-- (See below for the actual view)
--
CREATE TABLE `v_patent_reyting` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`ball` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_patent_soni`
-- (See below for the actual view)
--
CREATE TABLE `v_patent_soni` (
`user_id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafName` varchar(255)
,`soni` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_phd`
-- (See below for the actual view)
--
CREATE TABLE `v_phd` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafName` varchar(255)
,`lavozimid` int(11)
,`lavozim` varchar(191)
,`profile_id` bigint(20) unsigned
,`iioq` varchar(191)
,`ait` varchar(191)
,`pit` varchar(191)
,`ilmiy_daraja_id` bigint(20) unsigned
,`ilmiy_daraja` varchar(191)
,`ilmiyDarajalova` varchar(191)
,`ilmiy_unvon_id` bigint(20) unsigned
,`ilmiy_unvon` varchar(25)
,`profileimage` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_professors`
-- (See below for the actual view)
--
CREATE TABLE `v_professors` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`kafName` varchar(255)
,`lavozimid` int(11)
,`lavozim` varchar(191)
,`profile_id` bigint(20) unsigned
,`iioq` varchar(191)
,`ait` varchar(191)
,`pit` varchar(191)
,`ilmiy_daraja_id` bigint(20) unsigned
,`ilmiy_daraja` varchar(191)
,`ilmiyDarajalova` varchar(191)
,`ilmiy_unvon_id` bigint(20) unsigned
,`ilmiy_unvon` varchar(25)
,`profileimage` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_subjecttokafedra`
-- (See below for the actual view)
--
CREATE TABLE `v_subjecttokafedra` (
`id` bigint(20) unsigned
,`kafedra_id` bigint(20) unsigned
,`fannomi` varchar(255)
,`kafName` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_teachers`
-- (See below for the actual view)
--
CREATE TABLE `v_teachers` (
`id` bigint(20) unsigned
,`kafid` int(11)
,`lavozimid` int(11)
,`lavozim` varchar(191)
,`creatorid` int(11)
,`creatorname` varchar(191)
,`name` varchar(191)
,`email` varchar(191)
,`role` tinyint(1)
,`profileimage` varchar(255)
,`email_verified_at` timestamp
,`password` varchar(191)
,`remember_token` varchar(100)
,`created_at` timestamp
,`updated_at` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_teachers_all_soni`
-- (See below for the actual view)
--
CREATE TABLE `v_teachers_all_soni` (
`id` bigint(20) unsigned
,`name` varchar(191)
,`kafid` int(11)
,`maqola_soni` bigint(21)
,`dars_soni` bigint(21)
,`diss_soni` bigint(21)
,`mater_soni` bigint(21)
,`patent_soni` bigint(21)
,`kurs_soni` bigint(21)
,`loyiha_soni` bigint(21)
,`lang_soni` bigint(21)
,`malaka_soni` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_teachers_reyting`
-- (See below for the actual view)
--
CREATE TABLE `v_teachers_reyting` (
`id` bigint(20) unsigned
,`kafid` int(11)
,`name` varchar(191)
,`profileimage` varchar(255)
,`ball` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_teachers_reyting_with_kaf_name`
-- (See below for the actual view)
--
CREATE TABLE `v_teachers_reyting_with_kaf_name` (
`id` bigint(20) unsigned
,`kafid` int(11)
,`kafName` varchar(255)
,`name` varchar(191)
,`lavozim` varchar(191)
,`profileimage` varchar(255)
,`ball` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_userprofile`
-- (See below for the actual view)
--
CREATE TABLE `v_userprofile` (
`id` bigint(20) unsigned
,`kafid` int(11)
,`kafName` varchar(255)
,`lavozimid` int(11)
,`lavozim` varchar(191)
,`name` varchar(191)
,`email` varchar(191)
,`role` tinyint(1)
,`aspid` bigint(20) unsigned
,`born` date
,`malumot` varchar(191)
,`mutaxassislik` varchar(191)
,`iioq` varchar(191)
,`ait` varchar(191)
,`pit` varchar(191)
,`iid` bigint(20) unsigned
,`iu` varchar(191)
,`iui` varchar(191)
,`ilmiyunvonstatus` tinyint(1)
,`ilmiydaraja_id` bigint(20) unsigned
,`ilmiyDaraja` varchar(191)
,`ilmiyDarajalova` varchar(191)
,`ilmiydarajastatus` varchar(191)
,`rid` bigint(20) unsigned
,`profileimage` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `v_dars`
--
DROP TABLE IF EXISTS `v_dars`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dars`  AS SELECT `d`.`id` AS `id`, `d`.`user_id` AS `user_id`, `d`.`kid` AS `kid`, `d`.`subject_id` AS `subject_id`, `d`.`tipurok_id` AS `tipurok_id`, `u`.`name` AS `name`, `k`.`kafName` AS `kafName`, `s`.`fannomi` AS `fannomi`, `t`.`type` AS `type`, `d`.`mavzu` AS `mavzu`, `d`.`guruh` AS `guruh`, `d`.`sana` AS `sana`, `d`.`ilova` AS `ilova`, `d`.`ball` AS `ball`, `d`.`statusurok_id` AS `statusurok_id` FROM ((((`dars` `d` left join `subjects` `s` on(`d`.`subject_id` = `s`.`id`)) left join `tipuroks` `t` on(`d`.`tipurok_id` = `t`.`id`)) left join `users` `u` on(`d`.`user_id` = `u`.`id`)) left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) WHERE `u`.`role` = 2 ORDER BY `d`.`id` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_dars_reyting`
--
DROP TABLE IF EXISTS `v_dars_reyting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dars_reyting`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, sum(`d`.`ball`) AS `ball` FROM (`v_teachers` `u` left join `dars` `d` on(`u`.`id` = `d`.`user_id`)) GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid` ORDER BY sum(`d`.`ball`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_dars_soni`
--
DROP TABLE IF EXISTS `v_dars_soni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dars_soni`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafname`, count(`d`.`id`) AS `dars_soni` FROM ((`v_dars` `d` left join `users` `u` on(`u`.`id` = `d`.`user_id`)) left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) WHERE `d`.`statusurok_id` = 2 GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid`, `k`.`kafName` ORDER BY `d`.`id` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_dissertats`
--
DROP TABLE IF EXISTS `v_dissertats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dissertats`  AS SELECT `d`.`id` AS `id`, `d`.`user_id` AS `user_id`, `u`.`name` AS `name`, `d`.`mavzu` AS `mavzu`, `d`.`maqomi` AS `diss_maqomi_id`, `dm`.`maqomi` AS `maqomi`, `d`.`shifr` AS `shifr`, `d`.`nomi` AS `nomi`, `d`.`fan` AS `fan`, `d`.`tsana` AS `tsana`, `d`.`ysana` AS `ysana`, `d`.`dalolatnoma` AS `dalolatnoma`, `d`.`ball` AS `ball`, `d`.`status` AS `status`, `d`.`created_at` AS `created_at` FROM ((`dissertats` `d` left join `diss_maqomi` `dm` on(`d`.`maqomi` = `dm`.`id`)) left join `users` `u` on(`u`.`id` = `d`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_diss_reyting`
--
DROP TABLE IF EXISTS `v_diss_reyting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_diss_reyting`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, sum(`d`.`ball`) AS `ball` FROM (`v_teachers` `u` left join `dissertats` `d` on(`u`.`id` = `d`.`user_id`)) GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid` ORDER BY sum(`d`.`ball`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_diss_soni`
--
DROP TABLE IF EXISTS `v_diss_soni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_diss_soni`  AS SELECT `u`.`id` AS `user_id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, count(`d`.`id`) AS `soni` FROM ((`v_dissertats` `d` left join `users` `u` on(`u`.`id` = `d`.`user_id`)) left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) WHERE `d`.`status` = 1 GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid`, `k`.`kafName` ORDER BY count(`d`.`id`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_dotsents`
--
DROP TABLE IF EXISTS `v_dotsents`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dotsents`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, `u`.`lavozimid` AS `lavozimid`, `l`.`lavozim` AS `lavozim`, `p`.`id` AS `profile_id`, `p`.`iioq` AS `iioq`, `p`.`ait` AS `ait`, `p`.`pit` AS `pit`, `id`.`id` AS `ilmiy_daraja_id`, `ilmiyd`.`ilmiydaraja` AS `ilmiy_daraja`, `id`.`ilmiyDarajalova` AS `ilmiyDarajalova`, `ip`.`id` AS `ilmiy_unvon_id`, `ilmiy`.`name` AS `ilmiy_unvon`, `img`.`profileimage` AS `profileimage` FROM ((((((((`users` `u` left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) left join `lavozims` `l` on(`u`.`lavozimid` = `l`.`id`)) left join `userprofiles` `p` on(`p`.`user_id` = `u`.`id`)) left join `ilmiy_darajas` `id` on(`u`.`id` = `id`.`user_id`)) left join `ilmiyd` on(`id`.`ilmiyDaraja` = `ilmiyd`.`id`)) left join `ilmprofiles` `ip` on(`ip`.`user_id` = `u`.`id`)) left join `ilmiy` on(`ip`.`iu` = `ilmiy`.`id`)) left join `userimages` `img` on(`u`.`id` = `img`.`user_id`)) WHERE `u`.`role` = 2 AND `ip`.`iu` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `v_dsc`
--
DROP TABLE IF EXISTS `v_dsc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_dsc`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, `u`.`lavozimid` AS `lavozimid`, `l`.`lavozim` AS `lavozim`, `p`.`id` AS `profile_id`, `p`.`iioq` AS `iioq`, `p`.`ait` AS `ait`, `p`.`pit` AS `pit`, `id`.`id` AS `ilmiy_daraja_id`, `ilmiyd`.`ilmiydaraja` AS `ilmiy_daraja`, `id`.`ilmiyDarajalova` AS `ilmiyDarajalova`, `ip`.`id` AS `ilmiy_unvon_id`, `ilmiy`.`name` AS `ilmiy_unvon`, `img`.`profileimage` AS `profileimage` FROM ((((((((`users` `u` left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) left join `lavozims` `l` on(`u`.`lavozimid` = `l`.`id`)) left join `userprofiles` `p` on(`p`.`user_id` = `u`.`id`)) left join `ilmiy_darajas` `id` on(`u`.`id` = `id`.`user_id`)) left join `ilmiyd` on(`id`.`ilmiyDaraja` = `ilmiyd`.`id`)) left join `ilmprofiles` `ip` on(`ip`.`user_id` = `u`.`id`)) left join `ilmiy` on(`ip`.`iu` = `ilmiy`.`id`)) left join `userimages` `img` on(`u`.`id` = `img`.`user_id`)) WHERE `u`.`role` = 2 AND `id`.`ilmiyDaraja` = 2 ;

-- --------------------------------------------------------

--
-- Structure for view `v_ilmiydaraja`
--
DROP TABLE IF EXISTS `v_ilmiydaraja`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ilmiydaraja`  AS SELECT `id`.`id` AS `id`, `id`.`user_id` AS `user_id`, `u`.`name` AS `name`, `i`.`ilmiydaraja` AS `ilmiydaraja`, `id`.`ilmiyDarajalova` AS `ilmiyDarajalova`, `id`.`creator` AS `creator`, `id`.`status` AS `status`, `id`.`created_at` AS `created_at` FROM ((`ilmiy_darajas` `id` left join `users` `u` on(`id`.`user_id` = `u`.`id`)) left join `ilmiyd` `i` on(`i`.`id` = `id`.`ilmiyDaraja`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_ilmiydaraja_ilmiyunvon_me`
--
DROP TABLE IF EXISTS `v_ilmiydaraja_ilmiyunvon_me`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ilmiydaraja_ilmiyunvon_me`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, `u`.`lavozimid` AS `lavozimid`, `l`.`lavozim` AS `lavozim`, `p`.`id` AS `profile_id`, `p`.`iioq` AS `iioq`, `p`.`ait` AS `ait`, `p`.`pit` AS `pit`, `id`.`id` AS `ilmiy_daraja_id`, `ilmiyd`.`ilmiydaraja` AS `ilmiy_daraja`, `id`.`ilmiyDarajalova` AS `ilmiyDarajalova`, `ip`.`id` AS `ilmiy_unvon_id`, `ilmiy`.`name` AS `ilmiy_unvon`, `img`.`profileimage` AS `profileimage` FROM ((((((((`users` `u` left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) left join `lavozims` `l` on(`u`.`lavozimid` = `l`.`id`)) left join `userprofiles` `p` on(`p`.`user_id` = `u`.`id`)) left join `ilmiy_darajas` `id` on(`u`.`id` = `id`.`user_id`)) left join `ilmiyd` on(`id`.`ilmiyDaraja` = `ilmiyd`.`id`)) left join `ilmprofiles` `ip` on(`ip`.`user_id` = `u`.`id`)) left join `ilmiy` on(`ip`.`iu` = `ilmiy`.`id`)) left join `userimages` `img` on(`img`.`user_id` = `u`.`id`)) WHERE `u`.`role` = 2 AND `ilmiyd`.`id` = 3 AND `ilmiy`.`id` = 5 ;

-- --------------------------------------------------------

--
-- Structure for view `v_ilmiyunvo`
--
DROP TABLE IF EXISTS `v_ilmiyunvo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ilmiyunvo`  AS SELECT `iu`.`id` AS `id`, `iu`.`user_id` AS `user_id`, `u`.`name` AS `name`, `i`.`name` AS `ilmiyunvon`, `iu`.`iui` AS `iui`, `iu`.`status` AS `status`, `iu`.`ball` AS `ball`, `iu`.`created_at` AS `created_at` FROM ((`ilmprofiles` `iu` left join `users` `u` on(`iu`.`user_id` = `u`.`id`)) left join `ilmiy` `i` on(`i`.`id` = `iu`.`iu`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_kafedra_bosh`
--
DROP TABLE IF EXISTS `v_kafedra_bosh`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kafedra_bosh`  AS SELECT `users`.`id` AS `id`, `users`.`kafid` AS `kafid`, `users`.`lavozimid` AS `lavozimid`, `users`.`creatorid` AS `creatorid`, `users`.`creatorname` AS `creatorname`, `users`.`name` AS `name`, `users`.`email` AS `email`, `users`.`role` AS `role`, `users`.`email_verified_at` AS `email_verified_at`, `users`.`password` AS `password`, `users`.`remember_token` AS `remember_token`, `users`.`created_at` AS `created_at`, `users`.`updated_at` AS `updated_at` FROM `users` WHERE `users`.`role` = 3 ;

-- --------------------------------------------------------

--
-- Structure for view `v_kafedra_bosh_light`
--
DROP TABLE IF EXISTS `v_kafedra_bosh_light`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kafedra_bosh_light`  AS SELECT `k`.`id` AS `id`, `k`.`kafName` AS `kafName`, `kr`.`email` AS `email`, `kb`.`id` AS `user_id`, `kb`.`name` AS `name` FROM ((`kafedras` `k` left join `v_kafedra_role` `kr` on(`k`.`id` = `kr`.`kafid`)) left join (select `u`.`id` AS `id`,`u`.`name` AS `name`,`u`.`kafid` AS `kafid` from `users` `u` where `u`.`lavozimid` = 3) `kb` on(`kb`.`kafid` = `k`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_kafedra_reyting`
--
DROP TABLE IF EXISTS `v_kafedra_reyting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kafedra_reyting`  AS SELECT `k`.`id` AS `id`, `k`.`kafName` AS `kafName`, sum(`tr`.`ball`) AS `ball` FROM (`v_teachers_reyting` `tr` left join `kafedras` `k` on(`k`.`id` = `tr`.`kafid`)) GROUP BY `k`.`id`, `k`.`kafName` ORDER BY sum(`tr`.`ball`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_kafedra_role`
--
DROP TABLE IF EXISTS `v_kafedra_role`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kafedra_role`  AS SELECT `users`.`id` AS `id`, `users`.`kafid` AS `kafid`, `users`.`lavozimid` AS `lavozimid`, `users`.`creatorid` AS `creatorid`, `users`.`creatorname` AS `creatorname`, `users`.`name` AS `name`, `users`.`email` AS `email`, `users`.`role` AS `role`, `users`.`email_verified_at` AS `email_verified_at`, `users`.`password` AS `password`, `users`.`open_pas` AS `open_pas`, `users`.`remember_token` AS `remember_token`, `users`.`created_at` AS `created_at`, `users`.`updated_at` AS `updated_at` FROM `users` WHERE `users`.`role` = 3 ;

-- --------------------------------------------------------

--
-- Structure for view `v_kafedra_teachers`
--
DROP TABLE IF EXISTS `v_kafedra_teachers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kafedra_teachers`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `k`.`kafName` AS `kafName`, `u`.`kafid` AS `kafid`, `l`.`lavozim` AS `lavozim`, `u`.`lavozimid` AS `lavozimid`, `u`.`email` AS `email`, `u`.`role` AS `role`, `u`.`open_pas` AS `open_pas`, `u`.`creatorname` AS `creatorname`, `u`.`creatorid` AS `creatorid`, `u`.`created_at` AS `created_at` FROM ((`users` `u` left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) left join `lavozims` `l` on(`u`.`lavozimid` = `l`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_kurs`
--
DROP TABLE IF EXISTS `v_kurs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kurs`  AS SELECT `k`.`id` AS `id`, `k`.`user_id` AS `user_id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`turi` AS `kt_id`, `kt`.`turi` AS `turi`, `k`.`nomi` AS `nomi`, `k`.`sana` AS `sid`, `s`.`year` AS `year`, `k`.`ball` AS `ball`, `k`.`ilova` AS `ilova`, `k`.`status` AS `status` FROM (((`kurs` `k` left join `kurs_turi` `kt` on(`k`.`turi` = `kt`.`id`)) left join `users` `u` on(`k`.`user_id` = `u`.`id`)) left join `study_year` `s` on(`k`.`sana` = `s`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_kurs_reyting`
--
DROP TABLE IF EXISTS `v_kurs_reyting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kurs_reyting`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, sum(`k`.`ball`) AS `ball` FROM (`v_teachers` `u` left join `kurs` `k` on(`u`.`id` = `k`.`user_id`)) GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid` ORDER BY sum(`k`.`ball`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_kurs_soni`
--
DROP TABLE IF EXISTS `v_kurs_soni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kurs_soni`  AS SELECT `u`.`id` AS `user_id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, count(`ku`.`id`) AS `soni` FROM ((`v_kurs` `ku` left join `users` `u` on(`u`.`id` = `ku`.`user_id`)) left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) WHERE `ku`.`status` = 1 GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid`, `k`.`kafName` ORDER BY count(`ku`.`id`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_langs`
--
DROP TABLE IF EXISTS `v_langs`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_langs`  AS SELECT `l`.`id` AS `id`, `l`.`user_id` AS `user_id`, `u`.`name` AS `name`, `l`.`langname_id` AS `langname_id`, `ln`.`lang_name` AS `lang_name`, `l`.`langtype_id` AS `langtype_id`, `lt`.`lang_type` AS `lang_type`, `l`.`ball` AS `ball`, `l`.`status` AS `status`, `l`.`ilova` AS `ilova`, `l`.`bsana` AS `bsana`, `l`.`ysana` AS `ysana`, `l`.`created_at` AS `created_at` FROM (((`langs` `l` left join `lang_name` `ln` on(`l`.`langname_id` = `ln`.`id`)) left join `lang_type` `lt` on(`l`.`langtype_id` = `lt`.`id`)) left join `users` `u` on(`l`.`user_id` = `u`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_lang_reyting`
--
DROP TABLE IF EXISTS `v_lang_reyting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_lang_reyting`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, sum(`l`.`ball`) AS `ball` FROM (`v_teachers` `u` left join `langs` `l` on(`u`.`id` = `l`.`user_id`)) GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid` ORDER BY sum(`l`.`ball`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_lang_soni`
--
DROP TABLE IF EXISTS `v_lang_soni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_lang_soni`  AS SELECT `u`.`id` AS `user_id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, count(`l`.`id`) AS `soni` FROM ((`v_langs` `l` left join `users` `u` on(`u`.`id` = `l`.`user_id`)) left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) WHERE `l`.`status` = 1 GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid`, `k`.`kafName` ORDER BY count(`l`.`id`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_loyihas`
--
DROP TABLE IF EXISTS `v_loyihas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_loyihas`  AS SELECT `l`.`id` AS `id`, `l`.`user_id` AS `user_id`, `u`.`name` AS `name`, `l`.`miqyosi` AS `lm_id`, `lt`.`miqyosi` AS `miqyosi`, `l`.`mavzu` AS `mavzu`, `l`.`raqami` AS `raqami`, `l`.`bsana` AS `bsana`, `l`.`ysana` AS `ysana`, `l`.`buyruq` AS `buyruq`, `l`.`ilova` AS `ilova`, `l`.`ball` AS `ball`, `l`.`status` AS `status`, `l`.`created_at` AS `created_at` FROM ((`loyihas` `l` left join `users` `u` on(`l`.`user_id` = `u`.`id`)) left join `loyiha_turi` `lt` on(`l`.`miqyosi` = `lt`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_loyiha_reyting`
--
DROP TABLE IF EXISTS `v_loyiha_reyting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_loyiha_reyting`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, sum(`l`.`ball`) AS `ball` FROM (`v_teachers` `u` left join `loyihas` `l` on(`u`.`id` = `l`.`user_id`)) GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid` ORDER BY sum(`l`.`ball`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_loyiha_soni`
--
DROP TABLE IF EXISTS `v_loyiha_soni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_loyiha_soni`  AS SELECT `u`.`id` AS `user_id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, count(`l`.`id`) AS `soni` FROM ((`v_loyihas` `l` left join `users` `u` on(`u`.`id` = `l`.`user_id`)) left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) WHERE `l`.`status` = 1 GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid`, `k`.`kafName` ORDER BY count(`l`.`id`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_malaka_reyting`
--
DROP TABLE IF EXISTS `v_malaka_reyting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_malaka_reyting`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, sum(`m`.`ball`) AS `ball` FROM (`v_teachers` `u` left join `malakas` `m` on(`u`.`id` = `m`.`user_id`)) GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid` ORDER BY sum(`m`.`ball`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_malaka_soni`
--
DROP TABLE IF EXISTS `v_malaka_soni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_malaka_soni`  AS SELECT `u`.`id` AS `user_id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, count(`m`.`id`) AS `soni` FROM ((`v_malaks` `m` left join `users` `u` on(`u`.`id` = `m`.`user_id`)) left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) WHERE `m`.`status` = 1 GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid`, `k`.`kafName` ORDER BY count(`m`.`id`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_malaks`
--
DROP TABLE IF EXISTS `v_malaks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_malaks`  AS SELECT `m`.`id` AS `id`, `m`.`user_id` AS `user_id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `m`.`turi` AS `mid`, `mt`.`turi` AS `turi`, `m`.`sana` AS `sid`, `s`.`year` AS `year`, `m`.`mavzu` AS `mavzu`, `m`.`kun` AS `kun`, `m`.`ball` AS `ball`, `m`.`status` AS `status`, `m`.`ilova` AS `ilova`, `m`.`created_at` AS `created_at` FROM (((`malakas` `m` left join `malaka_turi` `mt` on(`m`.`turi` = `mt`.`id`)) left join `users` `u` on(`u`.`id` = `m`.`user_id`)) left join `study_year` `s` on(`m`.`sana` = `s`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_maqolas`
--
DROP TABLE IF EXISTS `v_maqolas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_maqolas`  AS SELECT `m`.`id` AS `id`, `m`.`user_id` AS `user_id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `mt`.`id` AS `maqola_turi_id`, `mt`.`turi` AS `turi`, `mm`.`id` AS `maqola_miqyosi_id`, `mm`.`miqyosi` AS `miqyosi`, `m`.`mavzu` AS `mavzu`, `m`.`mualliflik` AS `mualliflik`, `m`.`ilova` AS `ilova`, `m`.`ball` AS `ball`, `m`.`status` AS `status` FROM (((`maqolas` `m` left join `maqola_turi` `mt` on(`m`.`turi` = `mt`.`id`)) left join `maqola_miqyosi` `mm` on(`m`.`miqyosi` = `mm`.`id`)) left join `users` `u` on(`u`.`id` = `m`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_maqola_count`
--
DROP TABLE IF EXISTS `v_maqola_count`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_maqola_count`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafname`, count(`m`.`id`) AS `maqola_soni` FROM ((`v_maqolas` `m` left join `users` `u` on(`u`.`id` = `m`.`user_id`)) left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) WHERE `m`.`status` = 1 GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid`, `k`.`kafName` ORDER BY `m`.`id` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_maqola_reyting`
--
DROP TABLE IF EXISTS `v_maqola_reyting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_maqola_reyting`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, sum(`m`.`ball`) AS `ball` FROM (`v_teachers` `u` left join `maqolas` `m` on(`u`.`id` = `m`.`user_id`)) GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid` ORDER BY sum(`m`.`ball`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_materials`
--
DROP TABLE IF EXISTS `v_materials`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_materials`  AS SELECT `m`.`id` AS `id`, `m`.`user_id` AS `user_id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `m`.`turi` AS `mtid`, `mt`.`turi` AS `turi`, `m`.`nomi` AS `nomi`, `m`.`taboq` AS `taboq`, `m`.`muallif` AS `muallif`, `m`.`sana` AS `sana`, `m`.`ball` AS `ball`, `m`.`status` AS `status`, `m`.`ilova` AS `ilova`, `m`.`created_at` AS `created_at` FROM ((`materials` `m` left join `material_turi` `mt` on(`m`.`turi` = `mt`.`id`)) left join `users` `u` on(`u`.`id` = `m`.`user_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_materialsoni`
--
DROP TABLE IF EXISTS `v_materialsoni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_materialsoni`  AS SELECT `u`.`id` AS `user_id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, count(`m`.`id`) AS `soni` FROM ((`v_materials` `m` left join `users` `u` on(`u`.`id` = `m`.`user_id`)) left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) WHERE `m`.`status` = 1 GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid`, `k`.`kafName` ORDER BY count(`m`.`id`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_material_reyting`
--
DROP TABLE IF EXISTS `v_material_reyting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_material_reyting`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, sum(`m`.`ball`) AS `ball` FROM (`v_teachers` `u` left join `materials` `m` on(`u`.`id` = `m`.`user_id`)) GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid` ORDER BY sum(`m`.`ball`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_old_maqolas`
--
DROP TABLE IF EXISTS `v_old_maqolas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_old_maqolas`  AS SELECT `u`.`id` AS `id`, `u`.`old_user_id` AS `old_user_id`, `u`.`kafid` AS `kafid`, `old_m`.`mavzu` AS `mavzu`, `old_m`.`mualliflik` AS `mualliflik`, `old_m`.`ilova` AS `ilova`, `mm`.`miqyosi` AS `miqyosi`, `mt`.`turi` AS `turi`, `old_m`.`created_at` AS `created_at` FROM (((`old_maqolas` `old_m` left join `users` `u` on(`u`.`old_user_id` = `old_m`.`user_id`)) left join `maqola_miqyosi` `mm` on(`old_m`.`miqyosi` = `mm`.`id`)) left join `maqola_turi` `mt` on(`old_m`.`turi` = `mt`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_patents`
--
DROP TABLE IF EXISTS `v_patents`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_patents`  AS SELECT `p`.`id` AS `id`, `p`.`user_id` AS `user_id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `p`.`miqyosi` AS `pm_id`, `pt`.`miqyosi` AS `miqyosi`, `p`.`nomi` AS `nomi`, `p`.`raqami` AS `raqami`, `p`.`sana` AS `sana`, `p`.`muallif` AS `muallif`, `p`.`ilova` AS `ilova`, `p`.`ball` AS `ball`, `p`.`status` AS `status`, `p`.`created_at` AS `created_at` FROM ((`patents` `p` left join `users` `u` on(`u`.`id` = `p`.`user_id`)) left join `patent_turi` `pt` on(`p`.`miqyosi` = `pt`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_patent_reyting`
--
DROP TABLE IF EXISTS `v_patent_reyting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_patent_reyting`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, sum(`p`.`ball`) AS `ball` FROM (`v_teachers` `u` left join `patents` `p` on(`u`.`id` = `p`.`user_id`)) GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid` ORDER BY sum(`p`.`ball`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_patent_soni`
--
DROP TABLE IF EXISTS `v_patent_soni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_patent_soni`  AS SELECT `u`.`id` AS `user_id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, count(`p`.`id`) AS `soni` FROM ((`v_patents` `p` left join `users` `u` on(`u`.`id` = `p`.`user_id`)) left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) WHERE `p`.`status` = 1 GROUP BY `u`.`id`, `u`.`name`, `u`.`kafid`, `k`.`kafName` ORDER BY count(`p`.`id`) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_phd`
--
DROP TABLE IF EXISTS `v_phd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_phd`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, `u`.`lavozimid` AS `lavozimid`, `l`.`lavozim` AS `lavozim`, `p`.`id` AS `profile_id`, `p`.`iioq` AS `iioq`, `p`.`ait` AS `ait`, `p`.`pit` AS `pit`, `id`.`id` AS `ilmiy_daraja_id`, `ilmiyd`.`ilmiydaraja` AS `ilmiy_daraja`, `id`.`ilmiyDarajalova` AS `ilmiyDarajalova`, `ip`.`id` AS `ilmiy_unvon_id`, `ilmiy`.`name` AS `ilmiy_unvon`, `img`.`profileimage` AS `profileimage` FROM ((((((((`users` `u` left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) left join `lavozims` `l` on(`u`.`lavozimid` = `l`.`id`)) left join `userprofiles` `p` on(`p`.`user_id` = `u`.`id`)) left join `ilmiy_darajas` `id` on(`u`.`id` = `id`.`user_id`)) left join `ilmiyd` on(`id`.`ilmiyDaraja` = `ilmiyd`.`id`)) left join `ilmprofiles` `ip` on(`ip`.`user_id` = `u`.`id`)) left join `ilmiy` on(`ip`.`iu` = `ilmiy`.`id`)) left join `userimages` `img` on(`u`.`id` = `img`.`user_id`)) WHERE `u`.`role` = 2 AND `id`.`ilmiyDaraja` = 1 ;

-- --------------------------------------------------------

--
-- Structure for view `v_professors`
--
DROP TABLE IF EXISTS `v_professors`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_professors`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, `u`.`lavozimid` AS `lavozimid`, `l`.`lavozim` AS `lavozim`, `p`.`id` AS `profile_id`, `p`.`iioq` AS `iioq`, `p`.`ait` AS `ait`, `p`.`pit` AS `pit`, `id`.`id` AS `ilmiy_daraja_id`, `ilmiyd`.`ilmiydaraja` AS `ilmiy_daraja`, `id`.`ilmiyDarajalova` AS `ilmiyDarajalova`, `ip`.`id` AS `ilmiy_unvon_id`, `ilmiy`.`name` AS `ilmiy_unvon`, `img`.`profileimage` AS `profileimage` FROM ((((((((`users` `u` left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) left join `lavozims` `l` on(`u`.`lavozimid` = `l`.`id`)) left join `userprofiles` `p` on(`p`.`user_id` = `u`.`id`)) left join `ilmiy_darajas` `id` on(`u`.`id` = `id`.`user_id`)) left join `ilmiyd` on(`id`.`ilmiyDaraja` = `ilmiyd`.`id`)) left join `ilmprofiles` `ip` on(`ip`.`user_id` = `u`.`id`)) left join `ilmiy` on(`ip`.`iu` = `ilmiy`.`id`)) left join `userimages` `img` on(`img`.`user_id` = `u`.`id`)) WHERE `u`.`role` = 2 AND `ip`.`iu` = 2 ;

-- --------------------------------------------------------

--
-- Structure for view `v_subjecttokafedra`
--
DROP TABLE IF EXISTS `v_subjecttokafedra`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_subjecttokafedra`  AS SELECT `s`.`id` AS `id`, `s`.`kafedra_id` AS `kafedra_id`, `s`.`fannomi` AS `fannomi`, `k`.`kafName` AS `kafName` FROM (`subjects` `s` left join `kafedras` `k` on(`s`.`kafedra_id` = `k`.`id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `v_teachers`
--
DROP TABLE IF EXISTS `v_teachers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_teachers`  AS SELECT `users`.`id` AS `id`, `users`.`kafid` AS `kafid`, `users`.`lavozimid` AS `lavozimid`, `l`.`lavozim` AS `lavozim`, `users`.`creatorid` AS `creatorid`, `users`.`creatorname` AS `creatorname`, `users`.`name` AS `name`, `users`.`email` AS `email`, `users`.`role` AS `role`, `i`.`profileimage` AS `profileimage`, `users`.`email_verified_at` AS `email_verified_at`, `users`.`password` AS `password`, `users`.`remember_token` AS `remember_token`, `users`.`created_at` AS `created_at`, `users`.`updated_at` AS `updated_at` FROM ((`users` left join `lavozims` `l` on(`users`.`lavozimid` = `l`.`id`)) left join `userimages` `i` on(`users`.`id` = `i`.`user_id`)) WHERE `users`.`role` = 2 ;

-- --------------------------------------------------------

--
-- Structure for view `v_teachers_all_soni`
--
DROP TABLE IF EXISTS `v_teachers_all_soni`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_teachers_all_soni`  AS SELECT `u`.`id` AS `id`, `u`.`name` AS `name`, `u`.`kafid` AS `kafid`, ifnull(`maqola`.`maqola_soni`,0) AS `maqola_soni`, ifnull(`d`.`dars_soni`,0) AS `dars_soni`, ifnull(`ds`.`soni`,0) AS `diss_soni`, ifnull(`ms`.`soni`,0) AS `mater_soni`, ifnull(`p`.`soni`,0) AS `patent_soni`, ifnull(`k`.`soni`,0) AS `kurs_soni`, ifnull(`l`.`soni`,0) AS `loyiha_soni`, ifnull(`lang`.`soni`,0) AS `lang_soni`, ifnull(`malaka`.`soni`,0) AS `malaka_soni` FROM ((((((((((`v_teachers` `u` left join `v_maqola_count` `maqola` on(`maqola`.`id` = `u`.`id`)) left join `v_dars_soni` `d` on(`d`.`id` = `u`.`id`)) left join `v_diss_soni` `ds` on(`ds`.`user_id` = `u`.`id`)) left join `v_materialsoni` `ms` on(`ms`.`user_id` = `u`.`id`)) left join `v_patent_soni` `p` on(`p`.`user_id` = `u`.`id`)) left join `v_kurs_soni` `k` on(`k`.`user_id` = `u`.`id`)) left join `v_loyiha_soni` `l` on(`l`.`user_id` = `u`.`id`)) left join `v_lang_soni` `lang` on(`lang`.`user_id` = `u`.`id`)) left join `v_malaka_soni` `malaka` on(`malaka`.`user_id` = `u`.`id`)) left join `kafedras` `kaf` on(`kaf`.`id` = `u`.`kafid`)) GROUP BY `u`.`id`, `u`.`name` ORDER BY `u`.`id` ASC ;

-- --------------------------------------------------------

--
-- Structure for view `v_teachers_reyting`
--
DROP TABLE IF EXISTS `v_teachers_reyting`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_teachers_reyting`  AS SELECT `u`.`id` AS `id`, `u`.`kafid` AS `kafid`, `u`.`name` AS `name`, `u`.`profileimage` AS `profileimage`, ifnull(`dr`.`ball`,0) + ifnull(`darsr`.`ball`,0) + ifnull(`kurs`.`ball`,0) + ifnull(`lang`.`ball`,0) + ifnull(`loyiha`.`ball`,0) + ifnull(`malaka`.`ball`,0) + ifnull(`maqola`.`ball`,0) + ifnull(`material`.`ball`,0) + ifnull(`patent`.`ball`,0) AS `ball` FROM (((((((((`v_teachers` `u` left join `v_diss_reyting` `dr` on(`u`.`id` = `dr`.`id`)) left join `v_dars_reyting` `darsr` on(`darsr`.`id` = `u`.`id`)) left join `v_kurs_reyting` `kurs` on(`kurs`.`id` = `u`.`id`)) left join `v_lang_reyting` `lang` on(`lang`.`id` = `u`.`id`)) left join `v_loyiha_reyting` `loyiha` on(`loyiha`.`id` = `u`.`id`)) left join `v_malaka_reyting` `malaka` on(`malaka`.`id` = `u`.`id`)) left join `v_maqola_reyting` `maqola` on(`maqola`.`id` = `u`.`id`)) left join `v_material_reyting` `material` on(`material`.`id` = `u`.`id`)) left join `v_patent_reyting` `patent` on(`patent`.`id` = `u`.`id`)) GROUP BY `u`.`id`, `u`.`kafid`, `u`.`name`, `u`.`profileimage` ORDER BY ifnull(`dr`.`ball`,0) + ifnull(`darsr`.`ball`,0) + ifnull(`kurs`.`ball`,0) + ifnull(`lang`.`ball`,0) + ifnull(`loyiha`.`ball`,0) + ifnull(`malaka`.`ball`,0) + ifnull(`maqola`.`ball`,0) + ifnull(`material`.`ball`,0) + ifnull(`patent`.`ball`,0) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_teachers_reyting_with_kaf_name`
--
DROP TABLE IF EXISTS `v_teachers_reyting_with_kaf_name`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_teachers_reyting_with_kaf_name`  AS SELECT `u`.`id` AS `id`, `u`.`kafid` AS `kafid`, `kaf`.`kafName` AS `kafName`, `u`.`name` AS `name`, `lavozim`.`lavozim` AS `lavozim`, `u`.`profileimage` AS `profileimage`, ifnull(`dr`.`ball`,0) + ifnull(`darsr`.`ball`,0) + ifnull(`kurs`.`ball`,0) + ifnull(`lang`.`ball`,0) + ifnull(`loyiha`.`ball`,0) + ifnull(`malaka`.`ball`,0) + ifnull(`maqola`.`ball`,0) + ifnull(`material`.`ball`,0) + ifnull(`patent`.`ball`,0) AS `ball` FROM (((((((((((`v_teachers` `u` left join `v_diss_reyting` `dr` on(`u`.`id` = `dr`.`id`)) left join `v_dars_reyting` `darsr` on(`darsr`.`id` = `u`.`id`)) left join `v_kurs_reyting` `kurs` on(`kurs`.`id` = `u`.`id`)) left join `v_lang_reyting` `lang` on(`lang`.`id` = `u`.`id`)) left join `v_loyiha_reyting` `loyiha` on(`loyiha`.`id` = `u`.`id`)) left join `v_malaka_reyting` `malaka` on(`malaka`.`id` = `u`.`id`)) left join `v_maqola_reyting` `maqola` on(`maqola`.`id` = `u`.`id`)) left join `v_material_reyting` `material` on(`material`.`id` = `u`.`id`)) left join `v_patent_reyting` `patent` on(`patent`.`id` = `u`.`id`)) left join `kafedras` `kaf` on(`kaf`.`id` = `u`.`kafid`)) left join `lavozims` `lavozim` on(`lavozim`.`id` = `u`.`lavozimid`)) GROUP BY `u`.`id`, `u`.`kafid`, `u`.`name`, `kaf`.`kafName`, `lavozim`.`lavozim`, `u`.`profileimage` ORDER BY ifnull(`dr`.`ball`,0) + ifnull(`darsr`.`ball`,0) + ifnull(`kurs`.`ball`,0) + ifnull(`lang`.`ball`,0) + ifnull(`loyiha`.`ball`,0) + ifnull(`malaka`.`ball`,0) + ifnull(`maqola`.`ball`,0) + ifnull(`material`.`ball`,0) + ifnull(`patent`.`ball`,0) DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_userprofile`
--
DROP TABLE IF EXISTS `v_userprofile`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_userprofile`  AS SELECT `u`.`id` AS `id`, `u`.`kafid` AS `kafid`, `k`.`kafName` AS `kafName`, `u`.`lavozimid` AS `lavozimid`, `l`.`lavozim` AS `lavozim`, `u`.`name` AS `name`, `u`.`email` AS `email`, `u`.`role` AS `role`, `p`.`id` AS `aspid`, `p`.`born` AS `born`, `p`.`malumot` AS `malumot`, `p`.`mutaxassislik` AS `mutaxassislik`, `p`.`iioq` AS `iioq`, `p`.`ait` AS `ait`, `p`.`pit` AS `pit`, `i`.`id` AS `iid`, `i`.`iu` AS `iu`, `i`.`iui` AS `iui`, `i`.`status` AS `ilmiyunvonstatus`, `id`.`id` AS `ilmiydaraja_id`, `id`.`ilmiyDaraja` AS `ilmiyDaraja`, `id`.`ilmiyDarajalova` AS `ilmiyDarajalova`, `id`.`status` AS `ilmiydarajastatus`, `r`.`id` AS `rid`, `r`.`profileimage` AS `profileimage` FROM ((((((`users` `u` left join `userprofiles` `p` on(`u`.`id` = `p`.`user_id`)) left join `ilmprofiles` `i` on(`u`.`id` = `i`.`user_id`)) left join `ilmiy_darajas` `id` on(`u`.`id` = `id`.`user_id`)) left join `userimages` `r` on(`u`.`id` = `r`.`user_id`)) left join `kafedras` `k` on(`u`.`kafid` = `k`.`id`)) left join `lavozims` `l` on(`l`.`id` = `u`.`lavozimid`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dars`
--
ALTER TABLE `dars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dars_user_id_foreign` (`user_id`),
  ADD KEY `dars_subject_id_foreign` (`subject_id`),
  ADD KEY `dars_tipurok_id_foreign` (`tipurok_id`),
  ADD KEY `dars_statusurok_id_foreign` (`statusurok_id`);

--
-- Indexes for table `dissertats`
--
ALTER TABLE `dissertats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diss_maqomi`
--
ALTER TABLE `diss_maqomi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `ilmiy`
--
ALTER TABLE `ilmiy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ilmiyd`
--
ALTER TABLE `ilmiyd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ilmiy_darajas`
--
ALTER TABLE `ilmiy_darajas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ilmprofiles`
--
ALTER TABLE `ilmprofiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kafedras`
--
ALTER TABLE `kafedras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kurs`
--
ALTER TABLE `kurs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kurs_turi`
--
ALTER TABLE `kurs_turi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `langs`
--
ALTER TABLE `langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lang_name`
--
ALTER TABLE `lang_name`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lang_type`
--
ALTER TABLE `lang_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lavozims`
--
ALTER TABLE `lavozims`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyihas`
--
ALTER TABLE `loyihas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loyiha_turi`
--
ALTER TABLE `loyiha_turi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `malakas`
--
ALTER TABLE `malakas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `malaka_turi`
--
ALTER TABLE `malaka_turi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maqolas`
--
ALTER TABLE `maqolas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maqola_miqyosi`
--
ALTER TABLE `maqola_miqyosi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maqola_turi`
--
ALTER TABLE `maqola_turi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `material_turi`
--
ALTER TABLE `material_turi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patents`
--
ALTER TABLE `patents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patent_turi`
--
ALTER TABLE `patent_turi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `statusuroks`
--
ALTER TABLE `statusuroks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `statusuroks_status_unique` (`status`);

--
-- Indexes for table `study_year`
--
ALTER TABLE `study_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_kafedra_id_foreign` (`kafedra_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipuroks`
--
ALTER TABLE `tipuroks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipuroks_type_unique` (`type`);

--
-- Indexes for table `userimages`
--
ALTER TABLE `userimages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userprofiles`
--
ALTER TABLE `userprofiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dars`
--
ALTER TABLE `dars`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `dissertats`
--
ALTER TABLE `dissertats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `diss_maqomi`
--
ALTER TABLE `diss_maqomi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ilmiy`
--
ALTER TABLE `ilmiy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ilmiyd`
--
ALTER TABLE `ilmiyd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ilmiy_darajas`
--
ALTER TABLE `ilmiy_darajas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ilmprofiles`
--
ALTER TABLE `ilmprofiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `kafedras`
--
ALTER TABLE `kafedras`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kurs`
--
ALTER TABLE `kurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kurs_turi`
--
ALTER TABLE `kurs_turi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `langs`
--
ALTER TABLE `langs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lang_name`
--
ALTER TABLE `lang_name`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `lang_type`
--
ALTER TABLE `lang_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lavozims`
--
ALTER TABLE `lavozims`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `loyihas`
--
ALTER TABLE `loyihas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `loyiha_turi`
--
ALTER TABLE `loyiha_turi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `malakas`
--
ALTER TABLE `malakas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `malaka_turi`
--
ALTER TABLE `malaka_turi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `maqolas`
--
ALTER TABLE `maqolas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `maqola_miqyosi`
--
ALTER TABLE `maqola_miqyosi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `maqola_turi`
--
ALTER TABLE `maqola_turi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `material_turi`
--
ALTER TABLE `material_turi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `patents`
--
ALTER TABLE `patents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patent_turi`
--
ALTER TABLE `patent_turi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `statusuroks`
--
ALTER TABLE `statusuroks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `study_year`
--
ALTER TABLE `study_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipuroks`
--
ALTER TABLE `tipuroks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userimages`
--
ALTER TABLE `userimages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `userprofiles`
--
ALTER TABLE `userprofiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dars`
--
ALTER TABLE `dars`
  ADD CONSTRAINT `dars_statusurok_id_foreign` FOREIGN KEY (`statusurok_id`) REFERENCES `statusuroks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dars_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dars_tipurok_id_foreign` FOREIGN KEY (`tipurok_id`) REFERENCES `tipuroks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dars_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_kafedra_id_foreign` FOREIGN KEY (`kafedra_id`) REFERENCES `kafedras` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
