-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 12, 2021 at 06:49 AM
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
(15, 31, 1, 1, 1, 2, 'Kriptografiya', '101-21', '2021-10-14', '1633950819_0000test1409.png', 10.0, '2021-10-11 06:13:39', '2021-10-11 06:26:23');

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
(6, 31, '3', '1633949597_icons8-contract-160.png', '31', '1', '2021-10-11 05:53:17', '2021-10-12 04:15:42'),
(7, 32, '3', '1633951345_icons8-rocket-80.png', '32', '1', '2021-10-11 06:22:25', '2021-10-12 04:15:45'),
(8, 38, '1', '1634041617_icons8-rocket-80.png', '38', '1', '2021-10-12 07:26:57', '2021-10-12 07:28:13');

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
(11, 31, NULL, NULL, '5', '1633949591_icons8-contract-160.png', 1, NULL, '2021-10-11 05:53:11', '2021-10-12 04:15:35'),
(12, 32, NULL, NULL, '5', '1633951339_icons8-new-job-200.png', 1, NULL, '2021-10-11 06:22:19', '2021-10-12 04:15:31'),
(13, 38, NULL, NULL, '1', '1634041611_icons8-new-job-200.png', 1, NULL, '2021-10-12 07:26:51', '2021-10-12 07:28:22');

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
(7, 31, 1, 2, '2021-10-01', '2022-05-11', 'icons8-contract-160.png', '7.5', '1', '2021-10-11 06:17:16', '2021-10-11 06:32:09'),
(8, 38, 1, 3, '2021-10-01', '2021-10-31', 'icons8-teaching-64.png', '10', '1', '2021-10-12 07:27:19', '2021-10-12 07:27:34');

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
(8, 32, 2, 'OTM maqola', 1, 6, 1, '1634013446_icons8-handshake-128.png', '1', '2021-10-11 23:37:26', '2021-10-11 23:38:31');

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
(32, '2021_10_10_122532_create_malakas_table', 19);

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
  `nomi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
(5, 31, 1, 'P1', 'P12', '2021-10-07', 1, '1634032265_icons8-steps-128.png', 15, '1', '2021-10-12 04:51:05', '2021-10-12 04:51:25');

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
(10, 34, '1634027911_tr_kursant.png', '2021-10-12 03:38:31', '2021-10-12 03:38:31'),
(11, 38, '1634035964_icons8-expert-128.png', '2021-10-12 05:52:44', '2021-10-12 05:52:44'),
(12, 33, '1634036537_Greg-Emerson-edit-2.jpg', '2021-10-12 06:02:17', '2021-10-12 06:02:17');

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
(12, 32, '1990-07-21', '3', 'Yerusti transport vositalari va tizimlari', '31.12.2017', '1', '3', '2021-10-11 06:22:09', '2021-10-11 06:22:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
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

INSERT INTO `users` (`id`, `kafid`, `lavozimid`, `creatorid`, `creatorname`, `name`, `email`, `role`, `email_verified_at`, `password`, `open_pas`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, NULL, 10, 0, '', 'Admin', 'admin@akadmvd.akd', 1, NULL, '$2y$10$hLFnKFn6To7x/igcb0IGp.u9/DE0BsELa0fV3GfOQnuRWQ/1e5Z06', NULL, NULL, '2021-09-30 06:49:22', '2021-09-30 06:49:22'),
(3, 1, 0, 1, 'O\'rinkulov Odiljon Naziraliyevich', 'Axborot tehnologiyalari kafedrasi', 'atk@akadmvd.akd', 3, NULL, '$2y$10$Jo/.7ug6NwbwVP8HbgI/qOhPJ9KSl7HfICsMab650QbJKROsAsiSq', NULL, NULL, '2021-10-02 04:40:07', '2021-10-02 04:40:07'),
(7, 2, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Datlabki tergov kafedrasi', 'dt@akadmvd.akd', 3, NULL, '$2y$10$X6X/K9qzKa.QRFqjOZ1g2eHNxXQgSkj6axs.kZSlH4uJNGaIVWada', NULL, NULL, '2021-10-02 05:36:00', '2021-10-02 05:36:00'),
(9, 3, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Davlat-huquqiy fanlar kafedrasi', 'dhf@akadmvd.akd', 3, NULL, '$2y$10$z73BlZxEseXGxwq0krv3JugiXp62/ybNke2R/55QHF8PT99r3CArO', NULL, NULL, '2021-10-02 06:02:45', '2021-10-02 06:02:45'),
(10, 4, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Fuqarolik-huquqiy fanlar kafedrasi', 'fhf@akadmvd.akd', 3, NULL, '$2y$10$7XCh.SAoa5e94fBreR.uJOiBlmd3GXj9F3JY4ldZtqkuCfGTpEAIi', NULL, NULL, '2021-10-02 06:03:16', '2021-10-02 06:03:16'),
(11, 5, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Harbiy tayyorgarlik kafedrasi', 'htk@akadmvd.akd', 3, NULL, '$2y$10$0f2fTyNAuU0t.QaA8dLVV.G9eKR1CVFCwjom5pRWi3DGlOdSSBw.G', NULL, NULL, '2021-10-02 06:03:43', '2021-10-02 06:03:43'),
(12, 6, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Huquqbuzarliklar profilaktikasi kafedrasi', 'hpk@akadmvd.akd', 3, NULL, '$2y$10$R7fsUqtPo6TL7857glwJaetnawegTNdyTSBE0igcWfi6rVwqw0//a', NULL, NULL, '2021-10-02 06:04:14', '2021-10-02 06:04:14'),
(13, 7, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Ijtimoiy-iqtisodiy fanlar kafedrasi', 'iifk@akadmvd.akd', 3, NULL, '$2y$10$2tBF9jiNfWZie5Ngy8QW3u7MSsavP25dhcHWiyI0/D/UaLAgehU52', NULL, NULL, '2021-10-02 06:04:46', '2021-10-02 06:04:46'),
(14, 8, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Jamoat tartibi va xavfsizligini ta\'minlash kafedrasi', 'jtxtk@akadmvd.akd', 3, NULL, '$2y$10$NSF7sbZUe.hH6Sedcom9seilwZ4txlj9z/JJnHHKmWlUQxD59NU3K', NULL, NULL, '2021-10-02 06:05:21', '2021-10-02 06:05:21'),
(15, 9, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Jangovar va jismoniy tayyorgarlik kafedrasi', 'jjtk@akadmvd.akd', 3, NULL, '$2y$10$tag1vWJjCntlwjaXrWU4ZO2jSbi31GX.oVlaf.DXQwruOg38xVUBG', NULL, NULL, '2021-10-02 06:05:52', '2021-10-02 06:05:52'),
(16, 10, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Jinoyat va jinoyat ijroiya huquqi kafedrasi', 'jjihk@akadmvd.akd', 3, NULL, '$2y$10$MVzohvJzPgmsJshKlR.S/OOyCOFqXAz0mjUFNns0QUFBMI0kpTSDK', NULL, NULL, '2021-10-02 06:06:23', '2021-10-02 06:06:23'),
(17, 11, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Jinoyat-protssesual huquqi kafedrasi', 'jphk@akadmvd.akd', 3, NULL, '$2y$10$a4CjbwZ0JwhdAr55WZriEOxGEHmPFLRPo3Hlq389gFurLEdIt8GVS', NULL, NULL, '2021-10-02 06:06:55', '2021-10-02 06:06:55'),
(18, 12, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Kriminalistik ekspertizalar kafedrasi', 'kek@akadmvd.akd', 3, NULL, '$2y$10$nNlHp93pn4n7miI56v2S5uIRJvZN1E749jJ79NJ9iDGeg4pvg9INW', NULL, NULL, '2021-10-02 06:07:26', '2021-10-02 06:07:26'),
(19, 13, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Kriminalogiya kafedrasi', 'kk@akadmvd.akd', 3, NULL, '$2y$10$nEUnSq7Q.wHfpYsjOJfPZO7a5ZrNkK.VA3Pu4IqnnBaFCNC9WaDRe', NULL, NULL, '2021-10-02 06:07:49', '2021-10-02 06:07:49'),
(20, 14, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Ma\'muriy huquq kafedrasi', 'mhk@akadmvd.akd', 3, NULL, '$2y$10$JJr2CFV0D9IEGyrXgb2LPOCrMhupiEcaTQT8SCLKx8bpiDxyb3/8O', NULL, NULL, '2021-10-02 06:08:13', '2021-10-02 06:08:13'),
(21, 15, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Terrorizm va odam savdosiga qarshi kurash kafedrasi', 'tosqkk@akadmvd.akd', 3, NULL, '$2y$10$VY/zFjlSaCgK.1G.gIttlO9HMm7btCl8W6Fqz7EAa.GHhtfMaJfHC', NULL, NULL, '2021-10-02 06:08:48', '2021-10-02 06:08:48'),
(22, 16, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Tezkor-qidiruv faoliyati kafedrasi', 'tqfk@akadmvd.akd', 3, NULL, '$2y$10$oc357qC0k.aPko9U4FcWH.8G4k1KkUyS.56J5nxDpPeZ6CvCKJLV6', NULL, NULL, '2021-10-02 06:09:20', '2021-10-02 06:09:20'),
(23, 17, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Tillarni o\'rganish kafedrasi', 'tok@akadmvd.akd', 3, NULL, '$2y$10$/O8q3BFu0Iz42apZJBkmQeGd3coPI5fszRy45L5cY5krcIS1gYf4m', NULL, NULL, '2021-10-02 06:09:45', '2021-10-02 06:09:45'),
(24, 18, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Xizmat faoliyati psixologiyasi kafedrasi', 'xfpk@akadmvd.akd', 3, NULL, '$2y$10$Ts9Pt67sxTKl55AKE8oSsOCqBhzJdF.venlGCGuEmhBGTrd6pLrfi', NULL, NULL, '2021-10-02 06:10:13', '2021-10-02 06:10:13'),
(25, 19, 0, 3, 'Axborot tehnologiyalari kafedrasi', 'Yo\'l harakati xavfsizligini ta\'minlash kafedrasi', 'yhxtk@akadmvd.akd', 3, NULL, '$2y$10$F9Nb1xdcn6dv0zgalogQ.e/WEkbsxQnZAFv0kpxZCCkvbLylaC/p.', NULL, NULL, '2021-10-02 06:10:48', '2021-10-02 06:10:48'),
(27, 18, 2, 24, 'Xizmat faoliyati psixologiyasi kafedrasi', 'Ilmiy bo\'lim', 'ilmiy@akadmvd.akd', 4, NULL, '$2y$10$Mna53oFKLS36ezC/wI6wd.SAvAW44HzLI31JZM.HlHKN58lkU1roi', NULL, NULL, '2021-10-06 04:51:14', '2021-10-06 04:51:14'),
(31, 1, 5, 3, 'Axborot tehnologiyalari kafedrasi', 'O\'rinkulov Odiljon Naziraliyevich', 'odil@mail.ru', 2, NULL, '$2y$10$i43IMR4vuMsGLEIPULUdGeZ3PKKu/lQsTLJGLmxVHmnJa.3FV5Jue', NULL, NULL, '2021-10-11 05:51:57', '2021-10-11 05:51:57'),
(32, 19, 5, 25, 'Yo\'l harakati xavfsizligini ta\'minlash kafedrasi', 'Xoldarov Fidokor Erkinboy o\'g\'li', 'fidokor@akadmvd.akd', 2, NULL, '$2y$10$TRsD0bOPVsH/Qs39UVPLIu19AjSojOe49CprinbaNw.9x/2Qk8MQi', NULL, NULL, '2021-10-11 06:21:16', '2021-10-11 06:21:16'),
(33, 1, 3, 3, 'Axborot tehnologiyalari kafedrasi', 'Abdullayev Murod', 'murod@akadmvd.akd', 2, NULL, '$2y$10$yqHD3.gAx9ZmZM3GpurTuuFRnHTHERH1fvErgaLc2M3QuBVFUtBEq', NULL, NULL, '2021-10-11 07:12:13', '2021-10-11 07:12:13'),
(34, 1, 6, 3, 'Axborot tehnologiyalari kafedrasi', 'ivanov Ivan Ivanovich', 'ivan@akadmvd.akd', 2, NULL, '$2y$10$1.LteNCLGNsS9z2/TlvyZOosRJ9M0D8z4e7khBoURNnqEYTgpOhOm', NULL, NULL, '2021-10-12 03:37:45', '2021-10-12 03:37:45'),
(38, 3, 3, 9, 'Davlat-huquqiy fanlar kafedrasi', 'dhf_teacher1', 'dhf_teacher1@akadmvd.akd', 2, NULL, '$2y$10$Z4.Db3denf0URolMcls5bO8rnhwO2RQzRLGR4mkvbvNz2m1//gKIG', '123456789', NULL, '2021-10-12 07:26:26', '2021-10-12 07:26:26');

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
-- Stand-in structure for view `v_patents`
-- (See below for the actual view)
--
CREATE TABLE `v_patents` (
`id` bigint(20) unsigned
,`user_id` int(11)
,`name` varchar(191)
,`pm_id` int(11)
,`miqyosi` varchar(255)
,`nomi` varchar(255)
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_kurs`  AS SELECT `k`.`id` AS `id`, `k`.`user_id` AS `user_id`, `u`.`name` AS `name`, `k`.`turi` AS `kt_id`, `kt`.`turi` AS `turi`, `k`.`nomi` AS `nomi`, `k`.`sana` AS `sid`, `s`.`year` AS `year`, `k`.`ball` AS `ball`, `k`.`ilova` AS `ilova`, `k`.`status` AS `status` FROM (((`kurs` `k` left join `kurs_turi` `kt` on(`k`.`turi` = `kt`.`id`)) left join `users` `u` on(`k`.`user_id` = `u`.`id`)) left join `study_year` `s` on(`k`.`sana` = `s`.`id`)) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_malaks`  AS SELECT `m`.`id` AS `id`, `m`.`user_id` AS `user_id`, `u`.`name` AS `name`, `m`.`turi` AS `mid`, `mt`.`turi` AS `turi`, `m`.`sana` AS `sid`, `s`.`year` AS `year`, `m`.`mavzu` AS `mavzu`, `m`.`kun` AS `kun`, `m`.`ball` AS `ball`, `m`.`status` AS `status`, `m`.`ilova` AS `ilova`, `m`.`created_at` AS `created_at` FROM (((`malakas` `m` left join `malaka_turi` `mt` on(`m`.`turi` = `mt`.`id`)) left join `users` `u` on(`u`.`id` = `m`.`user_id`)) left join `study_year` `s` on(`m`.`sana` = `s`.`id`)) ;

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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_materials`  AS SELECT `m`.`id` AS `id`, `m`.`user_id` AS `user_id`, `u`.`name` AS `name`, `m`.`turi` AS `mtid`, `mt`.`turi` AS `turi`, `m`.`nomi` AS `nomi`, `m`.`taboq` AS `taboq`, `m`.`muallif` AS `muallif`, `m`.`sana` AS `sana`, `m`.`ball` AS `ball`, `m`.`status` AS `status`, `m`.`ilova` AS `ilova`, `m`.`created_at` AS `created_at` FROM ((`materials` `m` left join `material_turi` `mt` on(`m`.`turi` = `mt`.`id`)) left join `users` `u` on(`u`.`id` = `m`.`user_id`)) ;

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
-- Structure for view `v_patents`
--
DROP TABLE IF EXISTS `v_patents`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_patents`  AS SELECT `p`.`id` AS `id`, `p`.`user_id` AS `user_id`, `u`.`name` AS `name`, `p`.`miqyosi` AS `pm_id`, `pt`.`miqyosi` AS `miqyosi`, `p`.`nomi` AS `nomi`, `p`.`raqami` AS `raqami`, `p`.`sana` AS `sana`, `p`.`muallif` AS `muallif`, `p`.`ilova` AS `ilova`, `p`.`ball` AS `ball`, `p`.`status` AS `status`, `p`.`created_at` AS `created_at` FROM ((`patents` `p` left join `users` `u` on(`u`.`id` = `p`.`user_id`)) left join `patent_turi` `pt` on(`p`.`miqyosi` = `pt`.`id`)) ;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ilmprofiles`
--
ALTER TABLE `ilmprofiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `patents`
--
ALTER TABLE `patents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `userprofiles`
--
ALTER TABLE `userprofiles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
