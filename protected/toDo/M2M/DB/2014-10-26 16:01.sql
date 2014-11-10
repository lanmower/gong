-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 26, 2014 at 04:53 PM
-- Server version: 5.5.38
-- PHP Version: 5.4.4-14+deb7u14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `peter_m2m`
--

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL,
  `fields` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `m2m_account`
--

CREATE TABLE IF NOT EXISTS `m2m_account` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `size` bigint(40) NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `m2m_account`
--

INSERT INTO `m2m_account` (`id`, `size`, `userId`, `created`, `modified`) VALUES
(1, 188169948, 1, '0000-00-00 00:00:00', '2014-10-26 16:27:13'),
(2, 32354677, 36, '0000-00-00 00:00:00', '2014-04-12 00:35:50'),
(3, 8260697, 2, '2014-03-14 13:53:52', '2014-03-14 13:54:16');

-- --------------------------------------------------------

--
-- Table structure for table `m2m_action`
--

CREATE TABLE IF NOT EXISTS `m2m_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `comment` text,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `m2m_action`
--

INSERT INTO `m2m_action` (`id`, `title`, `comment`, `subject`) VALUES
(28, 'GUserUpdate', NULL, NULL),
(29, 'GInvoiceUpdate', NULL, NULL),
(30, 'GAccountUpdate', NULL, NULL),
(31, 'GTranslationUpdate', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_custom_url`
--

CREATE TABLE IF NOT EXISTS `m2m_custom_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(256) NOT NULL,
  `url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `m2m_custom_url`
--

INSERT INTO `m2m_custom_url` (`id`, `path`, `url`) VALUES
(1, '/page/post/admin', '/newspaper');

-- --------------------------------------------------------

--
-- Table structure for table `m2m_file`
--

CREATE TABLE IF NOT EXISTS `m2m_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `filename` varchar(1024) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `mime` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `view` varchar(255) NOT NULL DEFAULT 'P',
  `edit` varchar(255) NOT NULL DEFAULT 'P',
  `delete` varchar(255) NOT NULL DEFAULT 'P',
  `userId` int(10) DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `processed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=893 ;

--
-- Dumping data for table `m2m_file`
--

INSERT INTO `m2m_file` (`id`, `type`, `filename`, `mime`, `created`, `modified`, `weight`, `view`, `edit`, `delete`, `userId`, `size`, `processed`) VALUES
(790, 'audio', '02-bombay_dub_orchestra_-_journey-ncr.mp3', '', '2014-10-17 09:46:16', '2014-10-17 09:46:52', NULL, 'P', 'P', 'P', 1, NULL, 1),
(791, 'audio', '06 Ez On.mp3', '', '2014-10-20 06:05:39', '2014-10-20 06:06:14', NULL, 'P', 'P', 'P', 1, NULL, 1),
(855, 'audio', 'mpthreetest.mp3', '', '2014-10-21 12:27:32', '2014-10-21 12:28:02', NULL, 'P', 'P', 'P', 1, NULL, 1),
(856, 'data', 'rhyme1', '', '2014-10-21 12:27:32', NULL, NULL, 'P', 'P', 'P', 1, NULL, 0),
(857, 'video', 'snapshot1.png', '', '2014-10-21 12:27:40', '2014-10-21 12:28:02', NULL, 'P', 'P', 'P', 1, NULL, 1),
(858, 'data', 'study', '', '2014-10-21 12:27:40', NULL, NULL, 'P', 'P', 'P', 1, NULL, 0),
(859, 'image', 'IMG_3116.JPG', '', '2014-10-21 12:28:49', '2014-10-21 12:29:04', NULL, 'P', 'P', 'P', 1, NULL, 1),
(860, 'image', 'AlbumArt_{02A3CC58-58EA-48D5-99E7-20882CF94F2E}_Large.jpg', '', '2014-10-26 15:59:04', '2014-10-26 16:00:02', NULL, 'P', 'P', 'P', 1, NULL, 1),
(861, 'image', 'AlbumArt_{02A3CC58-58EA-48D5-99E7-20882CF94F2E}_Small.jpg', '', '2014-10-26 15:59:05', '2014-10-26 16:00:03', NULL, 'P', 'P', 'P', 1, NULL, 1),
(862, 'image', 'AlbumArt_{08736D06-5791-4AD6-AADB-AF25B123F075}_Large.jpg', '', '2014-10-26 15:59:07', '2014-10-26 16:00:03', NULL, 'P', 'P', 'P', 1, NULL, 1),
(863, 'image', 'AlbumArt_{08736D06-5791-4AD6-AADB-AF25B123F075}_Small.jpg', '', '2014-10-26 15:59:07', '2014-10-26 16:00:03', NULL, 'P', 'P', 'P', 1, NULL, 1),
(864, 'image', 'AlbumArt_{8E5848F9-5BB6-4FF5-A7D2-65FBCEBE1D59}_Large.jpg', '', '2014-10-26 15:59:08', '2014-10-26 16:00:03', NULL, 'P', 'P', 'P', 1, NULL, 1),
(865, 'image', 'AlbumArt_{8E5848F9-5BB6-4FF5-A7D2-65FBCEBE1D59}_Small.jpg', '', '2014-10-26 15:59:08', '2014-10-26 16:00:03', NULL, 'P', 'P', 'P', 1, NULL, 1),
(866, 'image', 'AlbumArt_{8FED2B74-9B52-46A4-BD59-89F02E36E56A}_Large.jpg', '', '2014-10-26 15:59:09', '2014-10-26 16:00:03', NULL, 'P', 'P', 'P', 1, NULL, 1),
(867, 'image', 'AlbumArt_{8FED2B74-9B52-46A4-BD59-89F02E36E56A}_Small.jpg', '', '2014-10-26 15:59:09', '2014-10-26 16:00:03', NULL, 'P', 'P', 'P', 1, NULL, 1),
(868, 'image', 'AlbumArt_{49F52575-522F-471B-9505-999E80C0C83A}_Large.jpg', '', '2014-10-26 15:59:10', '2014-10-26 16:00:04', NULL, 'P', 'P', 'P', 1, NULL, 1),
(869, 'image', 'AlbumArt_{49F52575-522F-471B-9505-999E80C0C83A}_Small.jpg', '', '2014-10-26 15:59:11', '2014-10-26 16:00:04', NULL, 'P', 'P', 'P', 1, NULL, 1),
(870, 'image', 'AlbumArt_{56A05D15-6DA5-4343-AB52-FD47EEDB1C07}_Large.jpg', '', '2014-10-26 15:59:13', '2014-10-26 16:00:04', NULL, 'P', 'P', 'P', 1, NULL, 1),
(871, 'image', 'AlbumArt_{56A05D15-6DA5-4343-AB52-FD47EEDB1C07}_Small.jpg', '', '2014-10-26 15:59:13', '2014-10-26 16:00:04', NULL, 'P', 'P', 'P', 1, NULL, 1),
(872, 'image', 'AlbumArt_{223A857C-FFCB-43AB-8FC3-2D5517D28738}_Large.jpg', '', '2014-10-26 15:59:14', '2014-10-26 16:00:04', NULL, 'P', 'P', 'P', 1, NULL, 1),
(873, 'image', 'AlbumArt_{223A857C-FFCB-43AB-8FC3-2D5517D28738}_Small.jpg', '', '2014-10-26 15:59:15', '2014-10-26 16:00:04', NULL, 'P', 'P', 'P', 1, NULL, 1),
(874, 'image', 'AlbumArt_{5225426F-984C-45AA-9328-B9F3C2B7AB3A}_Large.jpg', '', '2014-10-26 15:59:16', '2014-10-26 16:00:04', NULL, 'P', 'P', 'P', 1, NULL, 1),
(875, 'image', 'AlbumArt_{5225426F-984C-45AA-9328-B9F3C2B7AB3A}_Small.jpg', '', '2014-10-26 15:59:16', '2014-10-26 16:00:05', NULL, 'P', 'P', 'P', 1, NULL, 1),
(876, 'image', 'AlbumArt_{B1D386F2-ED4E-438B-AD3C-611B162A12B1}_Large.jpg', '', '2014-10-26 15:59:17', '2014-10-26 16:00:05', NULL, 'P', 'P', 'P', 1, NULL, 1),
(877, 'image', 'AlbumArt_{B1D386F2-ED4E-438B-AD3C-611B162A12B1}_Small.jpg', '', '2014-10-26 15:59:18', '2014-10-26 16:00:05', NULL, 'P', 'P', 'P', 1, NULL, 1),
(878, 'image', 'AlbumArt_{D1AE3BE5-29EC-4A55-ABC7-08E92175AECE}_Large.jpg', '', '2014-10-26 15:59:19', '2014-10-26 16:00:05', NULL, 'P', 'P', 'P', 1, NULL, 1),
(879, 'image', 'AlbumArt_{D1AE3BE5-29EC-4A55-ABC7-08E92175AECE}_Small.jpg', '', '2014-10-26 15:59:19', '2014-10-26 16:00:05', NULL, 'P', 'P', 'P', 1, NULL, 1),
(880, 'image', 'AlbumArt_{D9A7F917-F387-4A9A-99FE-CAA65D5CD543}_Large.jpg', '', '2014-10-26 15:59:20', '2014-10-26 16:00:05', NULL, 'P', 'P', 'P', 1, NULL, 1),
(881, 'image', 'AlbumArt_{D9A7F917-F387-4A9A-99FE-CAA65D5CD543}_Small.jpg', '', '2014-10-26 15:59:21', '2014-10-26 16:00:05', NULL, 'P', 'P', 'P', 1, NULL, 1),
(882, 'image', 'AlbumArt_{F35D90D5-2ED1-4DBB-B1F0-75D4130F4A39}_Large.jpg', '', '2014-10-26 15:59:21', '2014-10-26 16:00:05', NULL, 'P', 'P', 'P', 1, NULL, 1),
(883, 'image', 'AlbumArt_{F35D90D5-2ED1-4DBB-B1F0-75D4130F4A39}_Small.jpg', '', '2014-10-26 15:59:22', '2014-10-26 16:00:06', NULL, 'P', 'P', 'P', 1, NULL, 1),
(854, 'data', 'Bhavesh number', '', '2014-10-21 12:27:29', NULL, NULL, 'P', 'P', 'P', 1, NULL, 0),
(886, 'audio', 'Bee Gees - To Love Somebody.mp3', '', '2014-10-26 16:03:49', '2014-10-26 16:04:14', NULL, 'P', 'P', 'P', 1, NULL, 1),
(887, 'audio', 'Billy Joel - Just the Way You Are.mp3', '', '2014-10-26 16:08:19', '2014-10-26 16:09:13', NULL, 'P', 'P', 'P', 1, NULL, 1),
(888, 'data', 'Bob Marley & The Wailers - No Woman No Cry.mp3', '', '2014-10-26 16:13:49', NULL, NULL, 'P', 'P', 'P', 1, NULL, 0),
(889, 'audio', 'mpthreetest.mp3', '', '2014-10-26 17:57:50', '2014-10-26 18:00:07', NULL, 'P', 'P', 'P', 1, NULL, 1),
(890, 'audio', 'mpthreetest.mp3', '', '2014-10-26 17:58:23', '2014-10-26 18:00:07', NULL, 'P', 'P', 'P', 1, NULL, 1),
(891, 'video', 'snapshot1.png', '', '2014-10-26 18:30:34', '2014-10-26 18:31:02', NULL, 'P', 'P', 'P', 1, NULL, 1),
(892, 'audio', 'Creedence Clearwater Revival - Proud Mary.mp3', '', '2014-10-26 18:48:20', '2014-10-26 18:49:10', NULL, 'P', 'P', 'P', 1, NULL, 1),
(885, 'data', 'America - A Horse With No Name.mp3', '', '2014-10-26 16:02:16', NULL, NULL, 'P', 'P', 'P', 1, NULL, 0),
(884, 'image', 'AlbumArtSmall.jpg', '', '2014-10-26 15:59:23', '2014-10-26 16:00:06', NULL, 'P', 'P', 'P', 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_file_audio`
--

CREATE TABLE IF NOT EXISTS `m2m_file_audio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8_swedish_ci NOT NULL,
  `artist` text COLLATE utf8_swedish_ci,
  `album` text COLLATE utf8_swedish_ci,
  `year` text COLLATE utf8_swedish_ci,
  `comment` text COLLATE utf8_swedish_ci,
  `track` text COLLATE utf8_swedish_ci,
  `genre` text COLLATE utf8_swedish_ci,
  `fileId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `postFileId` (`fileId`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `artist` (`artist`),
  FULLTEXT KEY `year` (`year`),
  FULLTEXT KEY `comment` (`comment`),
  FULLTEXT KEY `track` (`track`),
  FULLTEXT KEY `genre` (`genre`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=228 ;

--
-- Dumping data for table `m2m_file_audio`
--

INSERT INTO `m2m_file_audio` (`id`, `title`, `artist`, `album`, `year`, `comment`, `track`, `genre`, `fileId`) VALUES
(204, '02-bombay_dub_orchestra_-_journey-ncr.mp3', 'Unknown Artist', 'Unknown Album', '2008', '..:: N.C.R 2008 ::..', '2', 'Ambient', 790),
(205, '06 Ez On.mp3', 'Unknown Artist', 'Unknown Album', '2003', '00000445 00000225 00002049 0000208C 000184FA 00034BFA 00004F21 00005012 0003887D 00026972', '6', 'Other', 791),
(222, 'mpthreetest.mp3', 'Unknown Artist', 'Unknown Album', '2006', 'test', '1', 'Other', 855),
(223, 'Bee Gees - To Love Somebody.mp3', 'Unknown Artist', 'Unknown Album', '1990', 'ergosteur', '2', 'Other', 886),
(224, 'Billy Joel - Just the Way You Are.mp3', 'Unknown Artist', 'Unknown Album', '1977', NULL, '3', 'Rock', 887),
(225, 'mpthreetest.mp3', 'Unknown Artist', 'Unknown Album', '2006', 'test', '1', 'Other', 889),
(226, 'mpthreetest.mp3', 'Unknown Artist', 'Unknown Album', '2006', 'test', '1', 'Other', 890),
(227, 'Creedence Clearwater Revival - Proud Mary.mp3', 'Unknown Artist', 'Unknown Album', '1969', '000004C9 00000200 00004DC5 00001EE4 0001D4AC 0002143E 000062CF 00005945 00007800 00011D1A', NULL, 'Rock', 892);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_file_image`
--

CREATE TABLE IF NOT EXISTS `m2m_file_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `alt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=172 ;

--
-- Dumping data for table `m2m_file_image`
--

INSERT INTO `m2m_file_image` (`id`, `fileId`, `width`, `height`, `type`, `alt`) VALUES
(126, 869, 600, 600, 'l', ''),
(125, 869, 300, 300, 'm', ''),
(124, 869, 128, 128, 's', ''),
(111, 864, 600, 600, 'l', ''),
(110, 864, 300, 300, 'm', ''),
(109, 864, 128, 128, 's', ''),
(96, 859, 600, 600, 'l', ''),
(95, 859, 300, 300, 'm', ''),
(94, 859, 128, 128, 's', ''),
(165, 882, 600, 600, 'l', ''),
(164, 882, 300, 300, 'm', ''),
(163, 882, 128, 128, 's', ''),
(153, 878, 600, 600, 'l', ''),
(152, 878, 300, 300, 'm', ''),
(151, 878, 128, 128, 's', ''),
(141, 874, 600, 600, 'l', ''),
(140, 874, 300, 300, 'm', ''),
(139, 874, 128, 128, 's', ''),
(129, 870, 600, 600, 'l', ''),
(128, 870, 300, 300, 'm', ''),
(127, 870, 128, 128, 's', ''),
(114, 865, 600, 600, 'l', ''),
(113, 865, 300, 300, 'm', ''),
(112, 865, 128, 128, 's', ''),
(99, 860, 600, 600, 'l', ''),
(98, 860, 300, 300, 'm', ''),
(97, 860, 128, 128, 's', ''),
(168, 883, 600, 600, 'l', ''),
(167, 883, 300, 300, 'm', ''),
(166, 883, 128, 128, 's', ''),
(156, 879, 600, 600, 'l', ''),
(155, 879, 300, 300, 'm', ''),
(154, 879, 128, 128, 's', ''),
(144, 875, 600, 600, 'l', ''),
(143, 875, 300, 300, 'm', ''),
(142, 875, 128, 128, 's', ''),
(132, 871, 600, 600, 'l', ''),
(131, 871, 300, 300, 'm', ''),
(130, 871, 128, 128, 's', ''),
(117, 866, 600, 600, 'l', ''),
(116, 866, 300, 300, 'm', ''),
(115, 866, 128, 128, 's', ''),
(102, 861, 600, 600, 'l', ''),
(101, 861, 300, 300, 'm', ''),
(100, 861, 128, 128, 's', ''),
(171, 884, 600, 600, 'l', ''),
(170, 884, 300, 300, 'm', ''),
(169, 884, 128, 128, 's', ''),
(159, 880, 600, 600, 'l', ''),
(158, 880, 300, 300, 'm', ''),
(157, 880, 128, 128, 's', ''),
(147, 876, 600, 600, 'l', ''),
(146, 876, 300, 300, 'm', ''),
(145, 876, 128, 128, 's', ''),
(135, 872, 600, 600, 'l', ''),
(134, 872, 300, 300, 'm', ''),
(133, 872, 128, 128, 's', ''),
(120, 867, 600, 600, 'l', ''),
(119, 867, 300, 300, 'm', ''),
(118, 867, 128, 128, 's', ''),
(105, 862, 600, 600, 'l', ''),
(104, 862, 300, 300, 'm', ''),
(103, 862, 128, 128, 's', ''),
(162, 881, 600, 600, 'l', ''),
(161, 881, 300, 300, 'm', ''),
(160, 881, 128, 128, 's', ''),
(150, 877, 600, 600, 'l', ''),
(149, 877, 300, 300, 'm', ''),
(148, 877, 128, 128, 's', ''),
(138, 873, 600, 600, 'l', ''),
(137, 873, 300, 300, 'm', ''),
(136, 873, 128, 128, 's', ''),
(123, 868, 600, 600, 'l', ''),
(122, 868, 300, 300, 'm', ''),
(121, 868, 128, 128, 's', ''),
(108, 863, 600, 600, 'l', ''),
(107, 863, 300, 300, 'm', ''),
(106, 863, 128, 128, 's', '');

-- --------------------------------------------------------

--
-- Table structure for table `m2m_file_video`
--

CREATE TABLE IF NOT EXISTS `m2m_file_video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `m2m_file_video`
--

INSERT INTO `m2m_file_video` (`id`, `fileId`) VALUES
(1, 636),
(2, 842),
(3, 846),
(4, 852),
(5, 857),
(6, 891);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_form`
--

CREATE TABLE IF NOT EXISTS `m2m_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `m2m_form`
--

INSERT INTO `m2m_form` (`id`, `name`, `created`, `modified`, `elementId`) VALUES
(1, 'registration', '2013-11-20', '2014-03-02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_friendship`
--

CREATE TABLE IF NOT EXISTS `m2m_friendship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inviterId` int(11) NOT NULL,
  `friendId` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `m2m_friendship`
--

INSERT INTO `m2m_friendship` (`id`, `inviterId`, `friendId`, `status`, `modified`, `created`, `message`) VALUES
(7, 35, 36, 2, NULL, '2014-03-04 00:24:42', ''),
(8, 1, 36, 1, NULL, '2014-06-29 16:16:02', ''),
(9, 1, 35, 1, NULL, '2014-07-01 11:00:59', '');

-- --------------------------------------------------------

--
-- Table structure for table `m2m_invoice`
--

CREATE TABLE IF NOT EXISTS `m2m_invoice` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `size` bigint(40) NOT NULL,
  `rate` bigint(40) NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `m2m_invoice`
--

INSERT INTO `m2m_invoice` (`id`, `size`, `rate`, `userId`, `created`, `sent`, `paid`) VALUES
(4, 3074048, 2, 1, '0000-00-00 00:00:00', 0, 0),
(5, 239554107, 23, 1, '2014-06-29 16:15:33', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_membership`
--

CREATE TABLE IF NOT EXISTS `m2m_membership` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `order_date` int(11) NOT NULL,
  `end_date` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `payment_date` int(11) DEFAULT NULL,
  `subscribed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `m2m_membership`
--

INSERT INTO `m2m_membership` (`id`, `roleId`, `userId`, `payment_id`, `order_date`, `end_date`, `name`, `street`, `zipcode`, `city`, `payment_date`, `subscribed`) VALUES
(9, 12, 35, 1, 1392452436, 2147483647, NULL, NULL, NULL, NULL, NULL, 0),
(12, 11, 36, 1, 1392452436, 2147483647, NULL, NULL, NULL, NULL, NULL, 0),
(13, 12, 38, 1, 1394197780, 2147483647, NULL, NULL, NULL, NULL, NULL, 0),
(14, 11, 38, 1, 1395058062, 2147483647, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_message`
--

CREATE TABLE IF NOT EXISTS `m2m_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `fromUserId` int(10) unsigned NOT NULL,
  `toUserId` int(10) unsigned NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `answered` tinyint(1) NOT NULL DEFAULT '0',
  `draft` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `m2m_message`
--

INSERT INTO `m2m_message` (`id`, `created`, `modified`, `fromUserId`, `toUserId`, `subject`, `message`, `read`, `answered`, `draft`) VALUES
(9, '2014-03-04 10:02:25', '2014-03-07 12:37:59', 35, 36, 'test', '321', 1, 0, 0),
(12, '2014-06-30 16:30:28', '2014-06-30 16:31:40', 35, 36, 'asdf', 'asdf', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_payment`
--

CREATE TABLE IF NOT EXISTS `m2m_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `m2m_payment`
--

INSERT INTO `m2m_payment` (`id`, `title`, `text`) VALUES
(1, 'Prepayment', NULL),
(2, 'Paypal', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_permission`
--

CREATE TABLE IF NOT EXISTS `m2m_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `actionId` int(11) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `m2m_permission`
--

INSERT INTO `m2m_permission` (`id`, `roleId`, `actionId`, `description`) VALUES
(1, 13, 28, NULL),
(2, 14, 30, NULL),
(3, 15, 29, NULL),
(4, 16, 31, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_post`
--

CREATE TABLE IF NOT EXISTS `m2m_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8 COLLATE utf8_swedish_ci,
  `summary` text CHARACTER SET utf8 COLLATE utf8_swedish_ci,
  `content` text CHARACTER SET utf8 COLLATE utf8_swedish_ci,
  `view` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'P',
  `edit` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'P',
  `delete` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'P',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `coverId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `title` (`title`),
  FULLTEXT KEY `summary` (`summary`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci AUTO_INCREMENT=186 ;

--
-- Dumping data for table `m2m_post`
--

INSERT INTO `m2m_post` (`id`, `title`, `summary`, `content`, `view`, `edit`, `delete`, `created`, `modified`, `coverId`, `userId`) VALUES
(146, 'Title', 'Biatch', NULL, 'P', 'P', '*', '2014-03-14 13:53:21', '2014-03-14 13:53:35', NULL, 2),
(154, 'Click here to enter a titleasdf', 'Click here enter a brief summaryasdf', 'fasdClick here enter a post content', 'P', 'P', '*', '2014-04-11 16:50:59', '2014-06-30 16:32:03', NULL, 36),
(184, '', NULL, NULL, 'P', 'P', 'P', '2014-10-17 02:24:32', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_post_file`
--

CREATE TABLE IF NOT EXISTS `m2m_post_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `postId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1797 ;

--
-- Dumping data for table `m2m_post_file`
--

INSERT INTO `m2m_post_file` (`id`, `type`, `postId`, `fileId`, `weight`) VALUES
(975, 'data', 174, 70, NULL),
(976, 'audio', 174, 71, NULL),
(977, 'image', 174, 72, NULL),
(978, 'audio', 154, 73, NULL),
(979, 'audio', 154, 74, NULL),
(980, 'audio', 154, 75, NULL),
(981, 'audio', 154, 76, NULL),
(982, 'audio', 154, 77, NULL),
(983, 'image', 154, 78, NULL),
(984, 'image', 154, 79, NULL),
(987, 'image', 154, 82, NULL),
(989, 'image', 154, 84, NULL),
(990, 'image', 154, 85, NULL),
(991, 'image', 154, 86, NULL),
(993, 'audio', 154, 88, NULL),
(994, 'audio', 154, 89, NULL),
(995, 'audio', 154, 90, NULL),
(996, 'audio', 154, 91, NULL),
(997, 'image', 154, 93, NULL),
(998, 'audio', 154, 94, NULL),
(999, 'audio', 154, 95, NULL),
(1000, 'image', 154, 96, NULL),
(1001, 'audio', 154, 97, NULL),
(1002, 'audio', 154, 98, NULL),
(1018, 'image', 178, 114, NULL),
(1019, 'image', 178, 115, NULL),
(1022, 'audio', 178, 118, NULL),
(1023, 'audio', 178, 119, NULL),
(1024, 'audio', 178, 120, NULL),
(1025, 'image', 178, 121, NULL),
(1026, 'image', 178, 122, NULL),
(1027, 'image', 178, 123, NULL),
(1028, 'image', 178, 124, NULL),
(1029, 'image', 178, 125, NULL),
(1030, 'image', 178, 126, NULL),
(1031, 'image', 178, 127, NULL),
(1032, 'image', 178, 128, NULL),
(1033, 'image', 178, 129, NULL),
(1034, 'image', 178, 130, NULL),
(1035, 'image', 178, 131, NULL),
(1036, 'image', 178, 132, NULL),
(1037, 'image', 178, 133, NULL),
(1038, 'image', 178, 134, NULL),
(1039, 'image', 178, 135, NULL),
(1040, 'image', 178, 136, NULL),
(1041, 'image', 178, 137, NULL),
(1042, 'image', 178, 138, NULL),
(1043, 'image', 178, 139, NULL),
(1044, 'image', 178, 140, NULL),
(1045, 'image', 178, 141, NULL),
(1046, 'image', 178, 142, NULL),
(1047, 'image', 178, 143, NULL),
(1048, 'image', 178, 144, NULL),
(1049, 'image', 178, 145, NULL),
(1050, 'image', 178, 146, NULL),
(1051, 'image', 178, 147, NULL),
(1052, 'image', 178, 148, NULL),
(1053, 'image', 178, 149, NULL),
(1054, 'audio', 178, 150, NULL),
(1055, 'audio', 178, 151, NULL),
(1056, 'audio', 178, 152, NULL),
(1057, 'audio', 178, 153, NULL),
(1058, 'audio', 178, 154, NULL),
(1059, 'audio', 178, 155, NULL),
(1060, 'audio', 178, 156, NULL),
(1061, 'audio', 178, 157, NULL),
(1062, 'audio', 178, 158, NULL),
(1063, 'image', 178, 159, NULL),
(1064, 'image', 178, 160, NULL),
(1065, 'image', 178, 161, NULL),
(1066, 'image', 178, 162, NULL),
(1067, 'image', 178, 163, NULL),
(1068, 'image', 178, 164, NULL),
(1069, 'image', 178, 165, NULL),
(1070, 'image', 178, 166, NULL),
(1071, 'image', 178, 167, NULL),
(1072, 'image', 178, 168, NULL),
(1073, 'image', 178, 169, NULL),
(1074, 'image', 178, 170, NULL),
(1075, 'image', 178, 171, NULL),
(1076, 'image', 178, 172, NULL),
(1077, 'image', 178, 173, NULL),
(1078, 'image', 178, 174, NULL),
(1079, 'image', 178, 175, NULL),
(1080, 'image', 178, 176, NULL),
(1081, 'image', 178, 177, NULL),
(1082, 'image', 178, 178, NULL),
(1083, 'image', 178, 179, NULL),
(1084, 'image', 178, 180, NULL),
(1085, 'image', 178, 181, NULL),
(1086, 'image', 178, 182, NULL),
(1087, 'image', 178, 183, NULL),
(1088, 'image', 178, 184, NULL),
(1089, 'image', 178, 185, NULL),
(1090, 'image', 178, 186, NULL),
(1091, 'image', 178, 187, NULL),
(1092, 'audio', 178, 188, NULL),
(1093, 'audio', 178, 189, NULL),
(1094, 'audio', 178, 190, NULL),
(1095, 'audio', 178, 191, NULL),
(1096, 'audio', 178, 192, NULL),
(1097, 'audio', 178, 193, NULL),
(1098, 'audio', 178, 194, NULL),
(1099, 'audio', 178, 195, NULL),
(1100, 'audio', 178, 196, NULL),
(1101, 'audio', 178, 197, NULL),
(1102, 'audio', 178, 198, NULL),
(1103, 'audio', 178, 199, NULL),
(1104, 'audio', 178, 200, NULL),
(1105, 'audio', 178, 201, NULL),
(1106, 'data', 178, 202, NULL),
(1107, 'data', 178, 203, NULL),
(1108, 'audio', 178, 204, NULL),
(1109, 'audio', 178, 205, NULL),
(1110, 'audio', 178, 206, NULL),
(1111, 'image', 178, 207, NULL),
(1112, 'audio', 178, 208, NULL),
(1113, 'audio', 178, 209, NULL),
(1114, 'audio', 178, 210, NULL),
(1115, 'audio', 178, 211, NULL),
(1116, 'audio', 178, 212, NULL),
(1117, 'audio', 178, 213, NULL),
(1118, 'audio', 178, 214, NULL),
(1119, 'audio', 178, 215, NULL),
(1120, 'audio', 178, 216, NULL),
(1121, 'audio', 178, 217, NULL),
(1122, 'audio', 178, 218, NULL),
(1123, 'audio', 178, 219, NULL),
(1124, 'audio', 178, 220, NULL),
(1125, 'audio', 178, 221, NULL),
(1126, 'audio', 178, 222, NULL),
(1127, 'audio', 178, 223, NULL),
(1128, 'data', 178, 224, NULL),
(1129, 'data', 178, 225, NULL),
(1130, 'audio', 179, 226, NULL),
(1131, 'audio', 179, 227, NULL),
(1132, 'image', 179, 228, NULL),
(1133, 'image', 179, 229, NULL),
(1134, 'image', 179, 230, NULL),
(1135, 'image', 179, 231, NULL),
(1136, 'image', 179, 232, NULL),
(1137, 'image', 179, 233, NULL),
(1138, 'image', 179, 234, NULL),
(1139, 'image', 179, 235, NULL),
(1140, 'image', 179, 236, NULL),
(1141, 'image', 179, 237, NULL),
(1142, 'image', 179, 238, NULL),
(1143, 'image', 179, 239, NULL),
(1144, 'image', 179, 240, NULL),
(1145, 'image', 179, 241, NULL),
(1146, 'image', 179, 243, NULL),
(1147, 'image', 179, 242, NULL),
(1148, 'image', 179, 244, NULL),
(1149, 'image', 179, 245, NULL),
(1150, 'image', 179, 246, NULL),
(1151, 'image', 179, 247, NULL),
(1152, 'image', 179, 250, NULL),
(1153, 'image', 179, 248, NULL),
(1154, 'image', 179, 249, NULL),
(1155, 'image', 179, 251, NULL),
(1156, 'image', 179, 252, NULL),
(1157, 'image', 179, 255, NULL),
(1158, 'image', 179, 253, NULL),
(1159, 'image', 179, 254, NULL),
(1160, 'image', 179, 256, NULL),
(1161, 'image', 179, 257, NULL),
(1162, 'image', 179, 258, NULL),
(1163, 'image', 179, 259, NULL),
(1164, 'image', 179, 260, NULL),
(1165, 'image', 179, 261, NULL),
(1166, 'image', 179, 262, NULL),
(1167, 'image', 179, 263, NULL),
(1168, 'image', 179, 265, NULL),
(1169, 'image', 179, 267, NULL),
(1170, 'image', 179, 264, NULL),
(1171, 'image', 179, 266, NULL),
(1172, 'image', 179, 268, NULL),
(1173, 'image', 179, 269, NULL),
(1174, 'image', 179, 270, NULL),
(1175, 'image', 179, 271, NULL),
(1176, 'image', 179, 272, NULL),
(1177, 'image', 179, 273, NULL),
(1178, 'image', 179, 275, NULL),
(1179, 'image', 179, 276, NULL),
(1180, 'image', 179, 274, NULL),
(1181, 'image', 179, 277, NULL),
(1182, 'image', 179, 278, NULL),
(1183, 'image', 179, 279, NULL),
(1184, 'image', 179, 280, NULL),
(1185, 'image', 179, 281, NULL),
(1186, 'image', 179, 283, NULL),
(1187, 'image', 179, 282, NULL),
(1188, 'image', 179, 284, NULL),
(1189, 'image', 179, 285, NULL),
(1190, 'image', 179, 286, NULL),
(1191, 'image', 179, 288, NULL),
(1192, 'image', 179, 287, NULL),
(1193, 'image', 179, 289, NULL),
(1194, 'image', 179, 290, NULL),
(1195, 'image', 179, 292, NULL),
(1196, 'image', 179, 291, NULL),
(1197, 'image', 179, 293, NULL),
(1198, 'image', 179, 295, NULL),
(1199, 'image', 179, 294, NULL),
(1200, 'image', 179, 297, NULL),
(1201, 'image', 179, 296, NULL),
(1202, 'image', 179, 298, NULL),
(1203, 'image', 179, 299, NULL),
(1204, 'image', 179, 300, NULL),
(1205, 'image', 179, 301, NULL),
(1206, 'image', 179, 302, NULL),
(1207, 'image', 179, 303, NULL),
(1208, 'image', 179, 305, NULL),
(1209, 'image', 179, 307, NULL),
(1210, 'image', 179, 304, NULL),
(1211, 'image', 179, 306, NULL),
(1212, 'image', 179, 309, NULL),
(1213, 'image', 179, 310, NULL),
(1214, 'image', 179, 308, NULL),
(1215, 'image', 179, 313, NULL),
(1216, 'image', 179, 311, NULL),
(1217, 'image', 179, 312, NULL),
(1218, 'image', 179, 315, NULL),
(1219, 'image', 179, 316, NULL),
(1220, 'image', 179, 317, NULL),
(1221, 'image', 179, 314, NULL),
(1222, 'image', 179, 318, NULL),
(1223, 'image', 179, 319, NULL),
(1224, 'image', 179, 320, NULL),
(1225, 'image', 179, 323, NULL),
(1226, 'image', 179, 322, NULL),
(1227, 'image', 179, 324, NULL),
(1228, 'image', 179, 321, NULL),
(1229, 'image', 179, 325, NULL),
(1230, 'image', 179, 327, NULL),
(1231, 'image', 179, 326, NULL),
(1232, 'image', 179, 328, NULL),
(1233, 'image', 179, 329, NULL),
(1234, 'image', 179, 330, NULL),
(1235, 'image', 179, 331, NULL),
(1236, 'image', 179, 332, NULL),
(1237, 'image', 179, 333, NULL),
(1238, 'image', 179, 334, NULL),
(1239, 'image', 179, 335, NULL),
(1240, 'image', 179, 336, NULL),
(1241, 'image', 179, 337, NULL),
(1242, 'image', 179, 338, NULL),
(1243, 'image', 179, 339, NULL),
(1244, 'image', 179, 340, NULL),
(1245, 'image', 179, 341, NULL),
(1246, 'image', 179, 342, NULL),
(1247, 'image', 179, 343, NULL),
(1248, 'audio', 179, 344, NULL),
(1249, 'audio', 179, 345, NULL),
(1250, 'audio', 179, 346, NULL),
(1251, 'audio', 179, 347, NULL),
(1252, 'audio', 179, 348, NULL),
(1253, 'audio', 179, 349, NULL),
(1254, 'audio', 179, 350, NULL),
(1255, 'audio', 179, 351, NULL),
(1256, 'audio', 179, 352, NULL),
(1257, 'audio', 179, 353, NULL),
(1258, 'audio', 179, 354, NULL),
(1259, 'audio', 179, 355, NULL),
(1260, 'audio', 179, 356, NULL),
(1261, 'audio', 179, 357, NULL),
(1262, 'audio', 179, 358, NULL),
(1263, 'audio', 179, 359, NULL),
(1264, 'audio', 179, 360, NULL),
(1265, 'audio', 179, 361, NULL),
(1266, 'audio', 179, 362, NULL),
(1267, 'audio', 179, 363, NULL),
(1268, 'audio', 179, 364, NULL),
(1269, 'data', 179, 365, NULL),
(1270, 'audio', 179, 366, NULL),
(1271, 'audio', 179, 367, NULL),
(1272, 'audio', 179, 368, NULL),
(1273, 'audio', 179, 369, NULL),
(1274, 'audio', 179, 370, NULL),
(1275, 'audio', 179, 371, NULL),
(1276, 'audio', 179, 372, NULL),
(1277, 'audio', 179, 373, NULL),
(1278, 'audio', 179, 374, NULL),
(1279, 'audio', 179, 375, NULL),
(1280, 'data', 179, 376, NULL),
(1281, 'audio', 179, 377, NULL),
(1282, 'audio', 179, 378, NULL),
(1283, 'audio', 179, 379, NULL),
(1284, 'audio', 179, 380, NULL),
(1285, 'audio', 179, 381, NULL),
(1286, 'audio', 179, 382, NULL),
(1287, 'data', 179, 383, NULL),
(1288, 'audio', 179, 384, NULL),
(1289, 'audio', 179, 385, NULL),
(1290, 'audio', 179, 386, NULL),
(1291, 'audio', 179, 387, NULL),
(1292, 'audio', 179, 388, NULL),
(1293, 'audio', 179, 389, NULL),
(1294, 'audio', 179, 390, NULL),
(1295, 'audio', 179, 391, NULL),
(1296, 'audio', 179, 392, NULL),
(1297, 'audio', 179, 393, NULL),
(1298, 'audio', 179, 394, NULL),
(1299, 'audio', 179, 395, NULL),
(1300, 'audio', 179, 396, NULL),
(1301, 'audio', 179, 397, NULL),
(1302, 'audio', 179, 398, NULL),
(1303, 'image', 179, 399, NULL),
(1304, 'audio', 179, 400, NULL),
(1305, 'audio', 179, 401, NULL),
(1306, 'audio', 179, 402, NULL),
(1307, 'audio', 179, 403, NULL),
(1308, 'audio', 179, 404, NULL),
(1309, 'audio', 179, 405, NULL),
(1310, 'audio', 179, 406, NULL),
(1311, 'audio', 179, 407, NULL),
(1312, 'audio', 179, 408, NULL),
(1313, 'audio', 179, 409, NULL),
(1314, 'audio', 179, 410, NULL),
(1315, 'audio', 179, 411, NULL),
(1316, 'audio', 179, 412, NULL),
(1317, 'audio', 179, 413, NULL),
(1318, 'audio', 179, 414, NULL),
(1319, 'audio', 179, 415, NULL),
(1320, 'audio', 179, 416, NULL),
(1321, 'audio', 179, 417, NULL),
(1322, 'audio', 179, 418, NULL),
(1323, 'audio', 179, 419, NULL),
(1324, 'audio', 179, 420, NULL),
(1325, 'audio', 179, 421, NULL),
(1326, 'audio', 179, 422, NULL),
(1327, 'audio', 179, 423, NULL),
(1328, 'audio', 179, 424, NULL),
(1329, 'audio', 179, 425, NULL),
(1330, 'data', 179, 426, NULL),
(1331, 'audio', 179, 427, NULL),
(1332, 'audio', 179, 428, NULL),
(1333, 'audio', 179, 429, NULL),
(1334, 'audio', 179, 430, NULL),
(1335, 'audio', 179, 431, NULL),
(1336, 'audio', 179, 432, NULL),
(1337, 'audio', 179, 433, NULL),
(1338, 'audio', 179, 434, NULL),
(1339, 'audio', 179, 435, NULL),
(1340, 'audio', 179, 436, NULL),
(1341, 'audio', 179, 437, NULL),
(1342, 'audio', 179, 438, NULL),
(1343, 'audio', 179, 439, NULL),
(1344, 'audio', 179, 440, NULL),
(1345, 'audio', 179, 441, NULL),
(1346, 'audio', 179, 442, NULL),
(1347, 'audio', 179, 443, NULL),
(1348, 'audio', 179, 444, NULL),
(1349, 'audio', 179, 445, NULL),
(1350, 'audio', 179, 446, NULL),
(1351, 'audio', 179, 447, NULL),
(1352, 'audio', 179, 448, NULL),
(1353, 'audio', 179, 449, NULL),
(1354, 'audio', 180, 450, NULL),
(1355, 'audio', 180, 451, NULL),
(1356, 'audio', 180, 452, NULL),
(1357, 'audio', 180, 453, NULL),
(1358, 'audio', 180, 454, NULL),
(1359, 'audio', 180, 455, NULL),
(1360, 'audio', 180, 456, NULL),
(1361, 'audio', 180, 457, NULL),
(1362, 'audio', 180, 458, NULL),
(1363, 'audio', 180, 459, NULL),
(1364, 'audio', 181, 460, NULL),
(1365, 'audio', 181, 461, NULL),
(1366, 'audio', 181, 462, NULL),
(1367, 'audio', 181, 463, NULL),
(1368, 'audio', 181, 464, NULL),
(1369, 'audio', 181, 465, NULL),
(1370, 'audio', 181, 466, NULL),
(1371, 'audio', 181, 467, NULL),
(1372, 'audio', 181, 468, NULL),
(1373, 'audio', 181, 469, NULL),
(1374, 'audio', 181, 470, NULL),
(1375, 'audio', 181, 471, NULL),
(1376, 'audio', 181, 472, NULL),
(1377, 'audio', 181, 473, NULL),
(1378, 'audio', 181, 474, NULL),
(1379, 'audio', 181, 475, NULL),
(1380, 'audio', 181, 476, NULL),
(1381, 'audio', 181, 477, NULL),
(1382, 'audio', 181, 478, NULL),
(1383, 'audio', 181, 479, NULL),
(1384, 'audio', 181, 480, NULL),
(1385, 'audio', 181, 481, NULL),
(1386, 'audio', 181, 482, NULL),
(1387, 'audio', 181, 483, NULL),
(1388, 'audio', 181, 484, NULL),
(1389, 'audio', 181, 485, NULL),
(1390, 'image', 181, 486, NULL),
(1391, 'image', 181, 487, NULL),
(1392, 'image', 181, 488, NULL),
(1393, 'image', 181, 489, NULL),
(1394, 'image', 181, 490, NULL),
(1395, 'image', 181, 491, NULL),
(1396, 'image', 181, 492, NULL),
(1397, 'image', 181, 493, NULL),
(1398, 'image', 181, 494, NULL),
(1399, 'image', 181, 495, NULL),
(1400, 'image', 181, 496, NULL),
(1401, 'image', 181, 497, NULL),
(1402, 'image', 181, 498, NULL),
(1403, 'image', 181, 499, NULL),
(1404, 'image', 181, 500, NULL),
(1405, 'image', 181, 501, NULL),
(1406, 'image', 181, 502, NULL),
(1407, 'image', 181, 503, NULL),
(1408, 'image', 181, 504, NULL),
(1409, 'image', 181, 505, NULL),
(1410, 'image', 181, 506, NULL),
(1411, 'image', 181, 507, NULL),
(1412, 'image', 181, 508, NULL),
(1413, 'image', 181, 509, NULL),
(1414, 'image', 181, 510, NULL),
(1415, 'image', 181, 511, NULL),
(1416, 'image', 181, 512, NULL),
(1417, 'image', 181, 513, NULL),
(1418, 'image', 181, 514, NULL),
(1419, 'image', 181, 515, NULL),
(1420, 'image', 181, 516, NULL),
(1421, 'image', 181, 517, NULL),
(1422, 'image', 181, 518, NULL),
(1423, 'image', 181, 519, NULL),
(1424, 'image', 181, 520, NULL),
(1425, 'image', 181, 521, NULL),
(1426, 'image', 181, 522, NULL),
(1427, 'image', 181, 523, NULL),
(1428, 'image', 181, 524, NULL),
(1429, 'image', 181, 525, NULL),
(1430, 'image', 181, 526, NULL),
(1431, 'image', 181, 527, NULL),
(1432, 'image', 181, 528, NULL),
(1433, 'image', 181, 529, NULL),
(1434, 'image', 181, 530, NULL),
(1435, 'image', 181, 531, NULL),
(1436, 'image', 181, 532, NULL),
(1437, 'image', 181, 533, NULL),
(1438, 'image', 181, 534, NULL),
(1439, 'image', 181, 535, NULL),
(1440, 'image', 181, 536, NULL),
(1441, 'image', 181, 537, NULL),
(1442, 'image', 181, 538, NULL),
(1443, 'image', 181, 539, NULL),
(1444, 'audio', 181, 540, NULL),
(1445, 'audio', 181, 541, NULL),
(1446, 'image', 181, 542, NULL),
(1447, 'image', 181, 543, NULL),
(1448, 'image', 181, 544, NULL),
(1449, 'image', 181, 545, NULL),
(1450, 'image', 181, 546, NULL),
(1451, 'image', 181, 547, NULL),
(1452, 'image', 181, 548, NULL),
(1453, 'image', 181, 549, NULL),
(1454, 'image', 181, 550, NULL),
(1455, 'image', 181, 551, NULL),
(1456, 'image', 181, 552, NULL),
(1457, 'image', 181, 553, NULL),
(1458, 'image', 181, 554, NULL),
(1459, 'image', 181, 555, NULL),
(1460, 'image', 181, 556, NULL),
(1461, 'image', 181, 557, NULL),
(1462, 'image', 181, 558, NULL),
(1463, 'image', 181, 559, NULL),
(1464, 'image', 181, 560, NULL),
(1465, 'image', 181, 561, NULL),
(1466, 'image', 181, 562, NULL),
(1467, 'image', 181, 563, NULL),
(1468, 'image', 181, 564, NULL),
(1469, 'image', 181, 565, NULL),
(1470, 'image', 181, 566, NULL),
(1471, 'image', 181, 567, NULL),
(1472, 'image', 181, 568, NULL),
(1473, 'image', 181, 569, NULL),
(1474, 'image', 181, 570, NULL),
(1475, 'image', 181, 571, NULL),
(1476, 'image', 181, 572, NULL),
(1477, 'image', 181, 573, NULL),
(1478, 'image', 181, 574, NULL),
(1479, 'image', 181, 575, NULL),
(1480, 'image', 181, 576, NULL),
(1481, 'image', 181, 577, NULL),
(1482, 'image', 181, 578, NULL),
(1483, 'image', 181, 579, NULL),
(1484, 'image', 181, 580, NULL),
(1485, 'image', 181, 581, NULL),
(1486, 'image', 181, 582, NULL),
(1487, 'image', 181, 583, NULL),
(1488, 'image', 181, 584, NULL),
(1489, 'image', 181, 585, NULL),
(1490, 'image', 181, 586, NULL),
(1491, 'image', 181, 587, NULL),
(1492, 'image', 181, 588, NULL),
(1493, 'image', 181, 589, NULL),
(1494, 'image', 181, 590, NULL),
(1495, 'image', 181, 591, NULL),
(1496, 'image', 181, 592, NULL),
(1497, 'image', 181, 593, NULL),
(1498, 'image', 181, 594, NULL),
(1499, 'image', 181, 595, NULL),
(1500, 'image', 181, 596, NULL),
(1501, 'image', 181, 597, NULL),
(1502, 'image', 181, 598, NULL),
(1503, 'image', 181, 599, NULL),
(1504, 'image', 181, 600, NULL),
(1505, 'image', 181, 601, NULL),
(1506, 'image', 181, 602, NULL),
(1507, 'image', 181, 603, NULL),
(1508, 'image', 181, 604, NULL),
(1509, 'image', 181, 605, NULL),
(1510, 'image', 181, 606, NULL),
(1511, 'image', 181, 607, NULL),
(1512, 'image', 181, 608, NULL),
(1513, 'image', 181, 609, NULL),
(1514, 'image', 181, 610, NULL),
(1515, 'image', 181, 611, NULL),
(1516, 'image', 181, 612, NULL),
(1517, 'image', 181, 613, NULL),
(1518, 'image', 181, 614, NULL),
(1519, 'image', 181, 615, NULL),
(1520, 'image', 181, 616, NULL),
(1521, 'image', 181, 617, NULL),
(1522, 'image', 181, 618, NULL),
(1523, 'image', 181, 619, NULL),
(1524, 'image', 181, 620, NULL),
(1525, 'image', 181, 621, NULL),
(1526, 'image', 181, 622, NULL),
(1527, 'image', 181, 623, NULL),
(1528, 'image', 181, 624, NULL),
(1529, 'image', 181, 625, NULL),
(1530, 'image', 181, 626, NULL),
(1531, 'image', 181, 627, NULL),
(1532, 'image', 181, 628, NULL),
(1533, 'image', 181, 629, NULL),
(1534, 'video', 182, 630, NULL),
(1535, 'video', 182, 631, NULL),
(1536, 'video', 182, 632, NULL),
(1537, 'video', 182, 633, NULL),
(1538, 'video', 182, 634, NULL),
(1539, 'video', 183, 635, NULL),
(1540, 'video', 183, 636, NULL),
(1544, 'audio', 183, 640, NULL),
(1545, 'audio', 183, 641, NULL),
(1546, 'audio', 183, 642, NULL),
(1547, 'audio', 183, 643, NULL),
(1548, 'audio', 183, 644, NULL),
(1549, 'audio', 183, 645, NULL),
(1550, 'audio', 183, 646, NULL),
(1551, 'audio', 183, 647, NULL),
(1552, 'audio', 183, 648, NULL),
(1553, 'audio', 183, 649, NULL),
(1554, 'data', 183, 650, NULL),
(1555, 'audio', 183, 651, NULL),
(1556, 'data', 183, 652, NULL),
(1557, 'data', 183, 653, NULL),
(1558, 'data', 183, 654, NULL),
(1559, 'data', 183, 655, NULL),
(1560, 'data', 183, 656, NULL),
(1561, 'data', 183, 657, NULL),
(1562, 'data', 183, 658, NULL),
(1563, 'data', 183, 659, NULL),
(1564, 'data', 183, 660, NULL),
(1565, 'data', 183, 661, NULL),
(1566, 'data', 183, 662, NULL),
(1567, 'data', 183, 663, NULL),
(1568, 'data', 183, 664, NULL),
(1569, 'data', 183, 665, NULL),
(1570, 'data', 183, 666, NULL),
(1571, 'data', 183, 667, NULL),
(1572, 'data', 183, 668, NULL),
(1573, 'data', 183, 669, NULL),
(1574, 'data', 183, 670, NULL),
(1575, 'data', 183, 671, NULL),
(1576, 'data', 183, 672, NULL),
(1577, 'data', 183, 673, NULL),
(1578, 'data', 183, 674, NULL),
(1579, 'data', 183, 675, NULL),
(1580, 'data', 183, 676, NULL),
(1581, 'data', 183, 677, NULL),
(1582, 'data', 183, 678, NULL),
(1583, 'data', 183, 679, NULL),
(1584, 'data', 183, 680, NULL),
(1585, 'data', 183, 681, NULL),
(1586, 'data', 183, 682, NULL),
(1587, 'data', 183, 683, NULL),
(1588, 'data', 183, 684, NULL),
(1589, 'data', 183, 685, NULL),
(1590, 'data', 183, 686, NULL),
(1591, 'data', 183, 687, NULL),
(1592, 'data', 183, 688, NULL),
(1593, 'data', 183, 689, NULL),
(1594, 'data', 183, 690, NULL),
(1595, 'data', 183, 691, NULL),
(1596, 'data', 183, 692, NULL),
(1597, 'data', 183, 693, NULL),
(1598, 'data', 183, 694, NULL),
(1599, 'data', 183, 695, NULL),
(1600, 'data', 183, 696, NULL),
(1601, 'data', 183, 697, NULL),
(1602, 'data', 183, 698, NULL),
(1603, 'data', 183, 699, NULL),
(1604, 'data', 183, 700, NULL),
(1605, 'data', 183, 701, NULL),
(1606, 'data', 183, 702, NULL),
(1607, 'data', 183, 703, NULL),
(1608, 'data', 183, 704, NULL),
(1609, 'data', 183, 705, NULL),
(1610, 'data', 183, 706, NULL),
(1611, 'data', 183, 707, NULL),
(1612, 'data', 183, 708, NULL),
(1613, 'data', 183, 709, NULL),
(1614, 'data', 183, 710, NULL),
(1615, 'data', 183, 711, NULL),
(1616, 'data', 183, 712, NULL),
(1617, 'data', 183, 713, NULL),
(1618, 'data', 183, 714, NULL),
(1619, 'data', 183, 715, NULL),
(1620, 'data', 183, 716, NULL),
(1621, 'data', 183, 717, NULL),
(1622, 'data', 183, 718, NULL),
(1623, 'data', 183, 719, NULL),
(1624, 'data', 183, 720, NULL),
(1625, 'data', 183, 721, NULL),
(1626, 'data', 183, 722, NULL),
(1627, 'data', 183, 723, NULL),
(1628, 'data', 183, 724, NULL),
(1629, 'data', 183, 725, NULL),
(1630, 'data', 183, 726, NULL),
(1631, 'data', 183, 727, NULL),
(1632, 'data', 183, 728, NULL),
(1633, 'data', 183, 729, NULL),
(1634, 'data', 183, 730, NULL),
(1635, 'data', 183, 731, NULL),
(1636, 'data', 183, 732, NULL),
(1637, 'data', 183, 733, NULL),
(1638, 'data', 183, 734, NULL),
(1639, 'data', 183, 735, NULL),
(1640, 'data', 183, 736, NULL),
(1641, 'data', 183, 737, NULL),
(1642, 'data', 183, 738, NULL),
(1643, 'data', 183, 739, NULL),
(1644, 'data', 183, 740, NULL),
(1645, 'data', 183, 741, NULL),
(1646, 'data', 183, 742, NULL),
(1647, 'data', 183, 743, NULL),
(1648, 'data', 183, 744, NULL),
(1649, 'data', 183, 745, NULL),
(1650, 'data', 183, 746, NULL),
(1651, 'data', 183, 747, NULL),
(1652, 'data', 183, 748, NULL),
(1653, 'data', 183, 749, NULL),
(1654, 'data', 183, 750, NULL),
(1655, 'data', 183, 751, NULL),
(1656, 'data', 183, 752, NULL),
(1657, 'data', 183, 753, NULL),
(1658, 'data', 183, 754, NULL),
(1659, 'data', 183, 755, NULL),
(1660, 'data', 183, 756, NULL),
(1661, 'data', 183, 757, NULL),
(1662, 'data', 183, 758, NULL),
(1663, 'data', 183, 759, NULL),
(1664, 'data', 183, 760, NULL),
(1665, 'data', 183, 761, NULL),
(1666, 'data', 183, 762, NULL),
(1667, 'data', 183, 763, NULL),
(1668, 'data', 183, 764, NULL),
(1669, 'data', 183, 765, NULL),
(1670, 'data', 183, 766, NULL),
(1671, 'data', 183, 767, NULL),
(1672, 'data', 183, 768, NULL),
(1673, 'data', 183, 769, NULL),
(1674, 'data', 183, 770, NULL),
(1675, 'data', 183, 771, NULL),
(1676, 'data', 183, 772, NULL),
(1677, 'data', 183, 773, NULL),
(1678, 'data', 183, 774, NULL),
(1679, 'data', 183, 775, NULL),
(1680, 'data', 183, 776, NULL),
(1681, 'data', 183, 777, NULL),
(1682, 'data', 183, 778, NULL),
(1683, 'data', 183, 779, NULL),
(1684, 'data', 183, 780, NULL),
(1685, 'data', 183, 781, NULL),
(1686, 'data', 183, 782, NULL),
(1687, 'data', 183, 783, NULL),
(1688, 'data', 183, 784, NULL),
(1689, 'data', 183, 785, NULL),
(1690, 'data', 183, 786, NULL),
(1691, 'data', 183, 787, NULL),
(1692, 'data', 183, 788, NULL),
(1693, 'data', 183, 789, NULL),
(1694, 'audio', 184, 790, NULL),
(1695, 'audio', 184, 791, NULL),
(1696, 'audio', 185, 792, NULL),
(1697, 'image', 185, 793, NULL),
(1698, 'image', 185, 794, NULL),
(1699, 'image', 185, 795, NULL),
(1700, 'image', 185, 796, NULL),
(1701, 'image', 185, 797, NULL),
(1702, 'image', 185, 798, NULL),
(1703, 'image', 185, 799, NULL),
(1704, 'image', 185, 800, NULL),
(1705, 'image', 185, 801, NULL),
(1706, 'image', 185, 802, NULL),
(1707, 'image', 185, 803, NULL),
(1708, 'image', 185, 804, NULL),
(1709, 'image', 185, 805, NULL),
(1710, 'image', 185, 806, NULL),
(1711, 'image', 185, 807, NULL),
(1712, 'image', 185, 808, NULL),
(1713, 'image', 185, 809, NULL),
(1714, 'image', 185, 810, NULL),
(1715, 'image', 185, 811, NULL),
(1716, 'image', 185, 812, NULL),
(1717, 'image', 185, 813, NULL),
(1718, 'image', 185, 814, NULL),
(1719, 'image', 185, 815, NULL),
(1720, 'image', 185, 816, NULL),
(1721, 'image', 185, 817, NULL),
(1722, 'image', 185, 818, NULL),
(1723, 'image', 185, 819, NULL),
(1724, 'image', 185, 820, NULL),
(1725, 'image', 185, 821, NULL),
(1726, 'image', 185, 822, NULL),
(1727, 'image', 185, 823, NULL),
(1728, 'data', 185, 824, NULL),
(1729, 'audio', 185, 825, NULL),
(1730, 'audio', 185, 826, NULL),
(1731, 'audio', 185, 827, NULL),
(1732, 'audio', 185, 828, NULL),
(1733, 'audio', 185, 829, NULL),
(1734, 'audio', 185, 830, NULL),
(1735, 'audio', 185, 831, NULL),
(1736, 'audio', 185, 832, NULL),
(1737, 'audio', 185, 833, NULL),
(1738, 'audio', 185, 834, NULL),
(1739, 'data', 185, 835, NULL),
(1740, 'audio', 185, 836, NULL),
(1741, 'audio', 185, 837, NULL),
(1742, 'data', 185, 838, NULL),
(1743, 'data', 185, 839, NULL),
(1744, 'audio', 185, 840, NULL),
(1745, 'data', 185, 841, NULL),
(1746, 'video', 185, 842, NULL),
(1747, 'data', 185, 843, NULL),
(1748, 'audio', 185, 844, NULL),
(1749, 'data', 185, 845, NULL),
(1750, 'video', 185, 846, NULL),
(1751, 'data', 185, 847, NULL),
(1752, 'data', 185, 848, NULL),
(1753, 'data', 185, 849, NULL),
(1754, 'audio', 185, 850, NULL),
(1755, 'data', 185, 851, NULL),
(1756, 'video', 185, 852, NULL),
(1757, 'data', 185, 853, NULL),
(1758, 'data', 184, 854, NULL),
(1759, 'audio', 184, 855, NULL),
(1760, 'data', 184, 856, NULL),
(1761, 'video', 184, 857, NULL),
(1762, 'data', 184, 858, NULL),
(1763, 'image', 184, 859, NULL),
(1764, 'image', 184, 860, NULL),
(1765, 'image', 184, 861, NULL),
(1766, 'image', 184, 862, NULL),
(1767, 'image', 184, 863, NULL),
(1768, 'image', 184, 864, NULL),
(1769, 'image', 184, 865, NULL),
(1770, 'image', 184, 866, NULL),
(1771, 'image', 184, 867, NULL),
(1772, 'image', 184, 868, NULL),
(1773, 'image', 184, 869, NULL),
(1774, 'image', 184, 870, NULL),
(1775, 'image', 184, 871, NULL),
(1776, 'image', 184, 872, NULL),
(1777, 'image', 184, 873, NULL),
(1778, 'image', 184, 874, NULL),
(1779, 'image', 184, 875, NULL),
(1780, 'image', 184, 876, NULL),
(1781, 'image', 184, 877, NULL),
(1782, 'image', 184, 878, NULL),
(1783, 'image', 184, 879, NULL),
(1784, 'image', 184, 880, NULL),
(1785, 'image', 184, 881, NULL),
(1786, 'image', 184, 882, NULL),
(1787, 'image', 184, 883, NULL),
(1788, 'image', 184, 884, NULL),
(1789, 'data', 184, 885, NULL),
(1790, 'audio', 184, 886, NULL),
(1791, 'audio', 184, 887, NULL),
(1792, 'data', 184, 888, NULL),
(1793, 'audio', 184, 889, NULL),
(1794, 'audio', 184, 890, NULL),
(1795, 'video', 184, 891, NULL),
(1796, 'audio', 184, 892, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_privacysetting`
--

CREATE TABLE IF NOT EXISTS `m2m_privacysetting` (
  `userId` int(10) unsigned NOT NULL,
  `message_new_friendship` tinyint(1) NOT NULL DEFAULT '1',
  `message_new_message` tinyint(1) NOT NULL DEFAULT '1',
  `message_new_profilecomment` tinyint(1) NOT NULL DEFAULT '1',
  `appear_in_search` tinyint(1) NOT NULL DEFAULT '1',
  `show_online_status` tinyint(1) NOT NULL DEFAULT '1',
  `log_profile_visits` tinyint(1) NOT NULL DEFAULT '1',
  `ignore_users` varchar(255) DEFAULT NULL,
  `public_profile_fields` bigint(15) unsigned DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `m2m_privacysetting`
--

INSERT INTO `m2m_privacysetting` (`userId`, `message_new_friendship`, `message_new_message`, `message_new_profilecomment`, `appear_in_search`, `show_online_status`, `log_profile_visits`, `ignore_users`, `public_profile_fields`) VALUES
(1, 1, 1, 1, 1, 1, 1, '', NULL),
(2, 1, 1, 1, 1, 1, 1, '', NULL),
(6, 1, 1, 1, 1, 1, 1, '', NULL),
(7, 1, 1, 1, 1, 1, 1, '', NULL),
(8, 1, 1, 1, 1, 1, 1, '', NULL),
(9, 1, 1, 1, 1, 1, 1, '', NULL),
(10, 1, 1, 1, 1, 1, 1, '', NULL),
(11, 1, 1, 1, 1, 1, 1, '', NULL),
(12, 1, 1, 1, 1, 1, 1, '', NULL),
(13, 1, 1, 1, 1, 1, 1, '', NULL),
(14, 1, 1, 1, 1, 1, 1, '', NULL),
(15, 1, 1, 1, 1, 1, 1, '', NULL),
(16, 1, 1, 1, 1, 1, 1, '', NULL),
(17, 1, 1, 1, 1, 1, 1, '', NULL),
(18, 1, 1, 1, 1, 1, 1, '', NULL),
(19, 1, 1, 1, 1, 1, 1, '', NULL),
(20, 1, 1, 1, 1, 1, 1, '', NULL),
(21, 1, 1, 1, 1, 1, 1, '', NULL),
(22, 1, 1, 1, 1, 1, 1, '', NULL),
(23, 1, 1, 1, 1, 1, 1, '', NULL),
(24, 1, 1, 1, 1, 1, 1, '', NULL),
(25, 1, 1, 1, 1, 1, 1, '', NULL),
(26, 1, 1, 1, 1, 1, 1, '', NULL),
(27, 1, 1, 1, 1, 1, 1, '', NULL),
(28, 1, 1, 1, 1, 1, 1, '', NULL),
(29, 1, 1, 1, 1, 1, 1, '', NULL),
(30, 1, 1, 1, 1, 1, 1, '', NULL),
(31, 1, 1, 1, 1, 1, 1, '', NULL),
(32, 1, 1, 1, 1, 1, 1, '', NULL),
(33, 1, 1, 1, 1, 1, 1, '', NULL),
(34, 1, 1, 1, 1, 1, 1, '', NULL),
(35, 1, 1, 1, 1, 1, 1, '', NULL),
(36, 1, 1, 1, 1, 1, 1, '', NULL),
(37, 1, 1, 1, 1, 1, 1, '', NULL),
(38, 1, 1, 1, 1, 1, 1, '', NULL),
(39, 1, 1, 1, 1, 1, 1, '', NULL),
(40, 1, 1, 1, 1, 1, 1, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_profile`
--

CREATE TABLE IF NOT EXISTS `m2m_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `privacy` enum('protected','private','public') NOT NULL,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  `show_friends` tinyint(1) DEFAULT '1',
  `allow_comments` tinyint(1) DEFAULT '1',
  `email` varchar(255) NOT NULL DEFAULT '',
  `company` varchar(255) NOT NULL DEFAULT '',
  `telephone` varchar(13) NOT NULL DEFAULT '',
  `address` varchar(4096) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(25) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- Dumping data for table `m2m_profile`
--

INSERT INTO `m2m_profile` (`id`, `userId`, `timestamp`, `privacy`, `lastname`, `firstname`, `show_friends`, `allow_comments`, `email`, `company`, `telephone`, `address`, `city`, `state`, `zip`, `country`) VALUES
(1, 1, '2014-06-30 11:28:55', 'protected', 'admin', 'admin123asfasdfassssfd', 1, 1, 'a@a.c', 'Almagest Fraternite', '1111111111111', 'Ghost Street', 'Durban', 'KZNasdf', 4000, 'ds'),
(2, 2, '2013-02-18 00:06:30', 'protected', 'Nel', 'Alistair', 1, 1, 'alistair@blahblahblah.co.za', 'test', '27393192111', 'test', 'test', 'KZN', 4000, 'ZA'),
(35, 35, '2014-06-30 14:31:03', 'protected', 'James', 'Reporter', 1, 1, 'r@r.com', 'Almagest Fraternite', '0723557267', 'P.O. Box 1008', 'Belfast', 'Kwazulu Natal', 1100, 'ZA'),
(36, 36, '2014-06-30 11:28:44', 'protected', 'Vos', 'Producer', 1, 1, 'almagestfraternite@gmail.com', 'Production Company', '0723557267', 'P.O. Box 1008', 'Middelburg', 'Mpumalanga', 1100, 'US'),
(37, 37, '0000-00-00 00:00:00', 'protected', '', '', 1, 1, 'jvos@lando.co.za', '', '', '', '', '', 0, ''),
(38, 38, '2014-03-10 09:38:12', 'protected', '', '', 1, 1, 'a@gmail.com', '', '', '', '', '', 0, ''),
(39, 38, '0000-00-00 00:00:00', 'protected', '', '', 1, 1, 'alistair@searchfusion.co.za', '', '', '', '', '', 0, ''),
(40, 39, '0000-00-00 00:00:00', 'protected', 'test', 'test', 1, 1, 't@t.c', 'test', '0123456789', 'asdf', 'Belfast', 'asdf', 234, 'asd'),
(41, 39, '0000-00-00 00:00:00', 'protected', '', '', 1, 1, '', '', '', '', '', '', 0, ''),
(42, 40, '0000-00-00 00:00:00', 'protected', '', '', 1, 1, '', '', '', '', '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `m2m_profile_comment`
--

CREATE TABLE IF NOT EXISTS `m2m_profile_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `m2m_profile_field`
--

CREATE TABLE IF NOT EXISTS `m2m_profile_field` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `varname` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `hint` text NOT NULL,
  `field_type` varchar(50) NOT NULL DEFAULT '',
  `field_size` int(3) NOT NULL DEFAULT '0',
  `field_size_min` int(3) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `match` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `other_validator` varchar(255) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `position` int(3) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  `related_field_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `varname` (`varname`,`visible`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `m2m_profile_field`
--

INSERT INTO `m2m_profile_field` (`id`, `varname`, `title`, `hint`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `position`, `visible`, `related_field_name`) VALUES
(1, 'email', 'E-Mail', '', 'VARCHAR', 255, 0, 1, '', '', '', 'CEmailValidator', '', 0, 2, ''),
(2, 'firstname', 'First name', '', 'VARCHAR', 255, 0, 1, '', '', '', '', '', 0, 3, ''),
(3, 'lastname', 'Last name', '', 'VARCHAR', 255, 0, 1, '', '', '', '', '', 0, 3, ''),
(9, 'telephone', 'Contact Number', '', 'VARCHAR', 13, 10, 1, '', '', '', '', '', 0, 4, ''),
(14, 'company', 'Company', '', 'VARCHAR', 255, 0, 1, '', '', '', '', '', 0, 4, ''),
(15, 'address', 'Address', '', 'VARCHAR', 255, 0, 1, '', '', '', '', '', 0, 4, ''),
(18, 'zip', 'Zip/Postal Code', '', 'VARCHAR', 28, 2, 1, '', '', '', '', '', 0, 4, ''),
(20, 'country', 'Country Code (eg. ZA)', '', 'VARCHAR', 3, 2, 1, '', '', '', '', '', 0, 4, ''),
(21, 'city', 'City', 'Your city of origin.', 'VARCHAR', 255, 4, 1, '', '', '', '', '', 0, 4, ''),
(22, 'state', 'Province/State', 'Province or state of origin.', 'VARCHAR', 255, 3, 1, '', '', '', '', '', 0, 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `m2m_profile_visit`
--

CREATE TABLE IF NOT EXISTS `m2m_profile_visit` (
  `visitor_id` int(11) NOT NULL,
  `visited_id` int(11) NOT NULL,
  `timestamp_first_visit` int(11) NOT NULL,
  `timestamp_last_visit` int(11) NOT NULL,
  `num_of_visits` int(11) NOT NULL,
  PRIMARY KEY (`visitor_id`,`visited_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `m2m_profile_visit`
--

INSERT INTO `m2m_profile_visit` (`visitor_id`, `visited_id`, `timestamp_first_visit`, `timestamp_last_visit`, `num_of_visits`) VALUES
(1, 2, 1335171800, 1337652058, 11),
(1, 3, 1335179541, 1337135324, 41),
(1, 4, 1337132241, 1337646718, 22),
(2, 1, 1336575805, 1336576270, 4),
(4, 1, 1336661711, 1337148523, 8),
(4, 2, 1336661708, 1337146605, 2);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_role`
--

CREATE TABLE IF NOT EXISTS `m2m_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double NOT NULL COMMENT 'Price (when using membership module)',
  `duration` int(11) NOT NULL COMMENT 'How long a membership is valid',
  `registration` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `m2m_role`
--

INSERT INTO `m2m_role` (`id`, `title`, `description`, `price`, `duration`, `registration`) VALUES
(11, 'Producer', 'null', 123, 321, 1),
(12, 'Reporter', 'null', 321, 321, 1),
(13, 'UserManager', '', 1, 365, 0),
(14, 'AccountManager', NULL, 0, 0, 0),
(15, 'InvoiceManager', NULL, 0, 0, 0),
(16, 'SiteManager', NULL, 0, 0, 0),
(17, 'ElementManager', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_site_page`
--

CREATE TABLE IF NOT EXISTS `m2m_site_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `view` varchar(255) DEFAULT '*',
  `edit` varchar(255) DEFAULT NULL,
  `delete` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `m2m_site_page`
--

INSERT INTO `m2m_site_page` (`id`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`) VALUES
(5, 'upload', '@', '', '', '2013-02-17 00:00:00', '2014-06-05 16:59:03', 0, 1),
(11, 'about_us', '*', 'null', 'null', '2013-08-31 17:47:59', '2014-06-05 16:59:03', 2, 1),
(12, 'landing', '*', 'null', 'null', '2014-02-26 14:07:41', '2014-06-05 16:59:03', 1, 1),
(14, 'profile', '*', NULL, NULL, '2014-06-05 14:50:22', '2014-06-05 16:59:03', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_site_page_element`
--

CREATE TABLE IF NOT EXISTS `m2m_site_page_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` int(11) DEFAULT '1',
  `className` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `prefixContent` text,
  `suffixContent` text,
  `fields` text,
  `userAgentExclude` varchar(255) DEFAULT NULL,
  `userAgentInclude` varchar(255) DEFAULT NULL,
  `view` varchar(255) NOT NULL DEFAULT '*',
  `edit` varchar(255) NOT NULL DEFAULT 'SUPER',
  `delete` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=156 ;

--
-- Dumping data for table `m2m_site_page_element`
--

INSERT INTO `m2m_site_page_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
(1, 1, 'GUserField', 'HASH', '', '', '{"htmlOptions":{"style":"font-size: large;"},"edit":false}', NULL, NULL, '*', 'SUPER', '', '2013-02-17 00:00:00', '2014-03-17 14:48:27', 2, 1, 1),
(45, 1, 'GUserProfileField', 'FIRSTNAME', '', '', '{"field":"firstname","label":"First Name"}', NULL, NULL, '*', 'SUPER', '', '2013-08-28 21:56:14', '2014-03-17 14:48:27', 3, 1, 1),
(46, 1, 'GUserProfileField', 'LASTNAME', '', '', '{"field":"lastname","label":"Last Name"}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-28 22:03:03', '2014-03-17 14:48:27', 4, 1, 1),
(47, 1, 'GUserProfileField', 'EMAIL', '', '', '{"field":"email","label":"Email"}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-28 22:04:34', '2014-03-17 14:48:27', 5, 1, 1),
(48, 1, 'GUserProfileField', 'COMPANY', '', '', '{"field":"company","label":"Company"}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-28 22:05:07', '2014-03-17 14:48:27', 6, 1, 1),
(49, 1, 'GUserProfileField', 'CONTACTNUMBER', '', '', '{"field":"telephone","label":"Contact Number"}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-28 22:05:47', '2014-03-17 14:48:27', 7, 1, 1),
(50, 1, 'GUserProfileField', 'ADDRESS', '', '', '{"field":"address","label":"Address"}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-28 22:05:54', '2014-03-17 14:48:27', 12, 1, 1),
(51, 1, 'GUserProfileField', 'CITY', '', '', '{"field":"city","label":"City"}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-28 22:06:00', '2014-03-17 14:48:27', 10, 1, 1),
(52, 1, 'GUserProfileField', 'STATE', '', '', '{"field":"state","label":"Province"}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-28 22:06:04', '2014-03-17 14:48:27', 9, 1, 1),
(53, 1, 'GUserProfileField', 'ZIP', '', '', '{"field":"zip","label":"Postal Code"}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-28 22:06:09', '2014-03-17 14:48:27', 11, 1, 1),
(54, 1, 'GUserProfileField', 'COUNTRY', '', '', '{"field":"country","label":"Country"}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-28 22:06:15', '2014-03-17 14:48:27', 8, 1, 1),
(62, 1, 'GTag', 'aboutHeader', 'About', '', '{"tag":"h2"}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-31 17:52:18', '2014-05-22 23:24:39', 0, 11, 1),
(66, 1, 'GTag', 'aboutParagraph', '<p>Music2Media serves as an online intermediary between members of the press and the music industry.</p>In addition to opening up the channels of communication, Music2Media also allows for the streaming of new releases (and access to supplementary video, text and images) for potential review in publications.<p>The digital nature of our platform means quicker turnaround times, lower running costs and greater reach.</p> ', '', '{"tag":"p"}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-31 18:19:08', '2014-05-22 23:24:39', 1, 11, 1),
(67, 2, 'GFolder', 'aboutTermsFolder', '', '', '{"title":"Terms and conditions","hideContent":true,"htmlOptions":{"class":"termsAndConditions"}}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-31 18:27:47', '2014-05-22 23:24:39', 3, 11, 1),
(68, 1, 'GTag', 'aboutTerms', '', '', '{"text":"translate:Terms And Conditions"}', NULL, NULL, '*', 'ElementManager', 'null', '2013-08-31 18:36:47', '2014-05-22 23:28:48', 4, 11, 1),
(69, 3, NULL, 'aboutTermsFolderClose', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, NULL, '2014-05-22 23:24:39', 5, 11, 1),
(70, 1, 'GImage', 'aboutHeadphonesImage', '', '', '{"htmlOptions":{"class":"pull-right"},"src":"\\/themes\\/m2m\\/images\\/about_headphones.png"}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-31 18:50:05', '2014-05-22 23:24:39', 2, 11, 1),
(75, 1, 'GImage', 'profile_image', '', '', '{"htmlOptions":{"class":"pull-left"},"src":"\\/themes\\/m2m\\/images\\/profile_reporter.png"}', NULL, NULL, '*', 'SUPER', 'null', '2013-09-01 14:44:02', '2014-04-29 00:00:14', 0, 1, 1),
(79, 1, 'GPublishButton', 'profile_publish', '', '', '{}', NULL, NULL, '*', 'SUPER', 'null', '2013-09-01 16:50:01', '2014-03-17 14:49:06', 1, 1, 1),
(84, 1, 'GPostSearch', 'search_uploads_list', '', '', '{"action":"/gong/post/post/searchUploads","htmlOptions":{"class":"SearchUploads"}}', NULL, NULL, '*', 'SUPER', 'null', '2013-09-03 13:39:01', '2013-12-20 00:57:34', 1, 5, 1),
(88, 2, 'GTag', 'search_uploads', '', '', '[]', NULL, NULL, '*', 'SUPER', 'null', '2013-10-21 17:52:37', '2013-12-20 00:55:45', 2, 5, 1),
(89, 3, 'GTag', '', '', '', '[]', NULL, NULL, '*', 'SUPER', 'null', '2013-10-21 17:52:52', '2013-12-20 00:55:45', 3, 5, 1),
(94, 1, 'GTag', 'WelcomeGuestHeading', '', 'Welcome to music2media', '{"tag":"h2"}', NULL, NULL, 'g', 'SUPER', 'null', '2014-02-26 14:08:02', '2014-03-17 12:50:24', 0, 12, 1),
(99, 1, 'GTag', 'WelcomeGuestParagraph', '', 'click on the power icon to the left to sign up or login.', '{"tag":"p"}', NULL, NULL, 'g', 'SUPER', 'null', '2014-02-26 15:00:14', '2014-03-17 12:50:24', 1, 12, 1),
(103, 1, 'GUserWidget', 'Site', '', '', '[]', NULL, NULL, 'SiteManager', 'SUPER', 'null', '2014-03-02 11:36:32', '2014-03-17 12:50:24', 3, 12, 1),
(105, 1, 'GUserField', 'UserHash', '', '', '{"htmlOptions":{"class":"inline alert alert-info"},"edit":false,"tag":"h2"}', NULL, NULL, 'Producer, Reporter', 'SUPER', NULL, '2014-03-03 07:44:45', '2014-03-17 12:50:24', 7, 12, 1),
(108, 1, 'GFriendshipWidget', 'FriendshipNotification', '', '', '[]', NULL, NULL, 'Producer, Reporter', 'SUPER', NULL, '2014-03-03 22:44:31', '2014-03-17 12:50:24', 4, 12, 1),
(115, 1, 'GMessageWidget', 'UnreadMessages', '', '', '[]', NULL, NULL, '@', 'SUPER', NULL, '2014-03-04 02:09:04', '2014-03-17 12:50:24', 5, 12, 1),
(137, 1, 'GPostSearch', 'postSearch', '', '', '{"publishedPosts":true}', NULL, NULL, 'Reporter, Producer', 'SUPER', NULL, '2014-03-12 19:18:15', '2014-03-17 12:50:24', 8, 12, 1),
(138, 2, 'GTag', 'controlGroup', '', '', '{"htmlOptions":{"style":"text-align:center"}}', NULL, NULL, '*', 'SUPER', NULL, '2014-03-17 12:49:20', '2014-03-17 12:53:09', 2, 12, 1),
(139, 3, 'GTag', '', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-03-17 12:50:16', '2014-05-19 00:18:56', 6, 12, 1),
(143, 2, 'GTag', 'GTag', '', '', '{"htmlOptions":{"class":"inline"}}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 19:17:02', '2014-06-05 19:44:46', 0, 14, 1),
(144, 1, 'GUserProfileField', 'First Name', '', '', '{"label":"First Name","htmlOptions":{"class":"inline"},"field":"firstname"}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 19:18:21', '2014-06-05 19:44:46', 1, 14, 1),
(145, 3, 'GTag', 'Close', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 19:27:43', '2014-06-05 19:44:46', 10, 14, 1),
(146, 1, 'GUserProfileField', 'Last Name', '', '', '{"label":"Last Name","field":"lastname"}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 19:29:49', '2014-06-05 19:44:46', 2, 14, 1),
(147, 1, 'GUserProfileField', 'Email', '', '', '{"label":"Email","field":"email"}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 19:32:12', '2014-06-05 19:44:46', 3, 14, 1),
(148, 1, 'GUserProfileField', 'Company', '', '', '{"label":"Company","field":"company"}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 19:33:05', '2014-06-05 19:44:46', 4, 14, 1),
(149, 1, 'GUserProfileField', 'Telephone', '', '', '{"label":"Telephone","field":"telephone"}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 19:36:38', '2014-06-05 19:44:46', 5, 14, 1),
(150, 1, 'GUserProfileField', 'Address', '', '', '{"label":"Address","field":"address"}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 19:41:38', '2014-06-05 19:44:46', 6, 14, 1),
(151, 1, 'GUserProfileField', 'City', '', '', '{"label":"City","field":"city"}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 19:42:47', '2014-06-05 19:44:46', 7, 14, 1),
(152, 1, 'GUserProfileField', 'State', '', '', '{"label":"State","field":"state"}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 19:43:51', '2014-06-05 19:44:46', 8, 14, 1),
(153, 1, 'GUserProfileField', 'Zip', '', '', '{"field":"zip","label":"Zip"}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 19:44:41', '2014-06-05 19:45:04', 9, 14, 1),
(154, 1, 'GImage', 'Producer Graphic', '', '', '{"htmlOptions":{"class":"pull-left"},"src":"/themes/m2m/images/profile_producer.png"}', NULL, NULL, 'producer', 'SUPER', NULL, '2014-06-05 19:45:22', '2014-06-05 19:48:08', NULL, 14, 1),
(155, 1, 'GImage', 'Reporter Graphic', '', '', '{"htmlOptions":{"class":"pull-left"},"src":"/themes/m2m/images/profile_reporter.png"}', NULL, NULL, 'reporter', 'SUPER', NULL, '2014-06-05 19:46:14', '2014-06-05 19:48:29', NULL, 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_site_template`
--

CREATE TABLE IF NOT EXISTS `m2m_site_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `view` varchar(255) DEFAULT '*',
  `edit` varchar(255) DEFAULT NULL,
  `delete` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `m2m_site_template`
--

INSERT INTO `m2m_site_template` (`id`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`) VALUES
(2, 'template', '*', '', '', '2013-02-17 00:00:00', '2014-04-28 03:26:24', 1, 1),
(9, 'printTemplate', 'none', '', '', '2013-07-11 00:00:00', '2014-03-07 00:15:44', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_site_template_element`
--

CREATE TABLE IF NOT EXISTS `m2m_site_template_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` int(11) DEFAULT '1',
  `className` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `prefixContent` text,
  `suffixContent` text,
  `fields` text,
  `userAgentExclude` varchar(255) DEFAULT NULL,
  `userAgentInclude` varchar(255) DEFAULT NULL,
  `view` varchar(255) NOT NULL DEFAULT '*',
  `edit` varchar(255) NOT NULL DEFAULT 'SUPER',
  `delete` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=154 ;

--
-- Dumping data for table `m2m_site_template_element`
--

INSERT INTO `m2m_site_template_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
(3, 2, 'GHeader', 'header', '', '', '{"tag":"div"}', NULL, NULL, '*', 'SUPER', '', '2013-02-17 00:00:00', '2014-06-29 15:49:35', 0, 2, 1),
(4, 1, 'GImage', 'logoImage', '', '', '{"alt":"Music2Media Logo","htmlOptions":{"class":"logo"},"src":"\\/themes\\/m2m\\/images\\/music2media_logo.png"}', NULL, NULL, '*', 'SUPER', '', '2013-08-12 00:00:00', '2014-06-29 15:49:35', 1, 2, 1),
(5, 1, 'GTag', 'logoText', 'music<span class="logospan">2</span>media.net', '', '{"htmlOptions":{"class":"SiteTitle"},"tag":"h1"}', NULL, NULL, '*', 'SUPER', '', '2013-08-12 00:00:00', '2014-06-29 15:49:35', 2, 2, 1),
(12, 3, 'GHeader', 'headerEnd', '', '', '[]', NULL, NULL, '*', 'SUPER', 'null', '2013-06-27 00:00:00', '2014-06-29 15:49:35', 5, 2, 1),
(13, 1, 'GBusyPrompt', 'loading', '', '', '{"loadingImage":"\\/themes\\/m2m\\/images\\/ajax-loader.gif","loadingText":"","savingImage":"\\/themes\\/m2m\\/images\\/ajax-loader.gif","savingText":""}', NULL, NULL, '*', 'SUPER', '', '2013-07-10 00:00:00', '2014-06-29 15:49:35', 8, 2, 1),
(14, 1, 'GBrowserWarning', 'browserNotification', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2013-07-10 00:00:00', '2014-06-29 15:49:35', 11, 2, 1),
(15, 1, 'GTag', 'loadingShadow', '', '', '{"htmlOptions":{"class":"fullscreen saving loading\\u00a0browserNotification"}}', NULL, NULL, '*', 'SUPER', '', '2013-07-10 00:00:00', '2014-06-29 15:49:35', 10, 2, 1),
(17, 1, 'GTabs', 'tabs', '', '', '{"items":[{"linkOptions":{"class":"searchTab"},"icon":"glyphicon glyphicon-headphones glyphicon-2x","url":"\\/index.php","view":"*"},{"icon":"glyphicon glyphicon-user glyphicon-2x","url":"\\/gong\\/user\\/profile\\/update","view":"@"},{"linkOptions":{"class":"uploadTab"},"icon":"glyphicon glyphicon-upload glyphicon-2x","url":"\\/page\\/upload","view":"Producer"},{"icon":"glyphicon glyphicon-info-sign glyphicon-2x","url":"\\/page\\/about_us"},{"icon":"glyphicon glyphicon-envelope glyphicon-2x","view":"g","url":"\\/site\\/contact"},{"type":"login","icon":"glyphicon glyphicon-off glyphicon-2x"}],"tabsOptions":{"placement":"left"}}', NULL, NULL, '*', 'SUPER', '', '2013-02-17 00:00:00', '2014-06-29 15:49:35', 6, 2, 1),
(44, 1, 'GTag', 'footer', 'music2media ™', '', '{"htmlOptions":{"class":"Footer"}}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-27 17:15:11', '2014-07-26 15:29:48', 9, 2, 1),
(91, 1, 'GPlayer', 'player', '', '', '[]', NULL, NULL, 'Reporter, Producer', 'SUPER', 'null', '2014-02-18 01:52:04', '2014-06-29 15:49:35', 3, 2, 1),
(93, 1, 'GTag', 'footerGraphic', '', '<img class="footerGraphic" src="/themes/m2m/images/footerBars.png" alt="footerBars.png" />', '[]', NULL, NULL, '*', 'SUPER', 'null', '2014-02-21 00:04:13', '2014-06-29 15:49:35', 12, 2, 1),
(145, NULL, 'GTag', 'test', '', '', NULL, NULL, NULL, '*', 'SUPER', '', '2014-04-28 22:04:18', NULL, NULL, 0, 1),
(146, NULL, 'GTag', 'test', '', '', NULL, NULL, NULL, '*', 'SUPER', '', '2014-04-28 22:06:29', NULL, NULL, 0, 1),
(147, NULL, 'GTag', 'test', '', '', NULL, NULL, NULL, '*', 'SUPER', '', '2014-04-28 22:08:20', NULL, NULL, 0, 1),
(148, NULL, 'GTag', 'test', '', '', NULL, NULL, NULL, '*', 'SUPER', '', '2014-04-28 22:10:00', NULL, NULL, 0, 1),
(149, NULL, 'GTag', 'test', '', '', NULL, NULL, NULL, '*', 'SUPER', '', '2014-04-28 22:14:51', NULL, NULL, 0, 1),
(152, 1, 'GArticle', 'content', '', '', '{"htmlOptions":{"class":"tab-content"}}', NULL, NULL, '*', 'SUPER', '', '2014-04-28 22:55:30', '2014-06-29 15:49:35', 7, 2, 1),
(153, 1, 'GFileUploader', 'uploader', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-06-29 15:49:20', '2014-06-29 15:50:11', 13, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_site_view`
--

CREATE TABLE IF NOT EXISTS `m2m_site_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `view` varchar(255) DEFAULT '*',
  `edit` varchar(255) DEFAULT NULL,
  `delete` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=243 ;

--
-- Dumping data for table `m2m_site_view`
--

INSERT INTO `m2m_site_view` (`id`, `module`, `controller`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`, `parentId`) VALUES
(47, 'site', 'element', 'create', '*', '', '', '2014-05-07 20:33:28', '2014-05-12 23:26:18', NULL, 1, 16),
(58, 'site', 'model', 'update', '*', '', '', '2014-05-07 22:46:59', '2014-05-10 16:23:42', NULL, 1, 16),
(59, 'site', 'model', 'updateDone', '*', '', '', '2014-05-07 23:08:18', '2014-05-11 02:28:27', NULL, 1, 16),
(210, 'site', 'view', 'create', '*', '', '', '2014-05-10 05:11:08', '2014-06-02 20:31:04', NULL, 1, 1),
(211, 'site', 'model', 'view', '*', '', '', '2014-05-10 05:11:08', '2014-05-12 23:10:42', NULL, 1, 1),
(212, 'site', 'model', 'delete', '*', '', '', '2014-05-10 05:11:08', '2014-05-12 23:10:48', NULL, 1, 1),
(213, 'site', 'model', 'createDone', '*', '', '', '2014-05-10 05:11:08', '2014-05-12 23:10:51', NULL, 1, 1),
(214, 'site', 'model', 'list', '*', '', '', '2014-05-10 05:11:08', '2014-05-12 23:10:54', NULL, 1, 1),
(228, 'user', 'auth', 'login', '*', '', '', '2014-05-13 03:10:06', '2014-05-22 18:00:19', NULL, 1, NULL),
(229, 'site', 'model', 'reorderDone', '*', '', '', '2014-05-16 02:16:19', '2014-05-22 18:20:11', NULL, 1, NULL),
(230, 'site', 'view', 'view', '*', '', '', '2014-05-19 00:33:18', '2014-05-19 00:50:03', NULL, 1, NULL),
(231, 'user', 'registration', 'registration', '*', '', '', '2014-05-19 01:31:46', '2014-05-22 22:45:32', NULL, 1, NULL),
(234, 'site', 'viewMap', 'create', '*', '', '', '2014-05-22 18:09:10', '2014-05-22 18:12:14', NULL, 1, NULL),
(235, 'user', 'profile', 'update', '*', '', '', '2014-05-22 22:46:52', '2014-05-22 22:46:59', NULL, 1, NULL),
(236, 'post', 'post', 'createDone', '*', '', '', '2014-06-02 20:22:18', '2014-06-02 20:23:09', NULL, 1, NULL),
(237, 'site', 'page', 'create', '*', '', '', '2014-06-02 20:31:22', '2014-06-02 20:31:30', NULL, 1, NULL),
(238, 'site', 'pageElement', 'create', '*', '', '', '2014-06-05 16:49:50', '2014-06-05 16:51:34', NULL, 1, NULL),
(239, 'user', 'invoice', 'view', '*', NULL, NULL, '2014-06-09 11:46:34', NULL, NULL, 1, NULL),
(240, 'site', 'template', 'create', '*', '', '', '2014-06-29 15:23:41', '2014-06-29 15:24:38', NULL, 1, NULL),
(241, 'site', 'templateElement', 'create', '*', '', '', '2014-06-29 15:36:12', '2014-06-29 15:36:36', NULL, 1, NULL),
(242, 'user', 'registration', 'recoveryMail', '*', NULL, NULL, '2014-06-30 13:34:21', NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_site_view_element`
--

CREATE TABLE IF NOT EXISTS `m2m_site_view_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` int(11) DEFAULT '1',
  `className` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `prefixContent` text,
  `suffixContent` text,
  `fields` text,
  `userAgentExclude` varchar(255) DEFAULT NULL,
  `userAgentInclude` varchar(255) DEFAULT NULL,
  `view` varchar(255) NOT NULL DEFAULT '*',
  `edit` varchar(255) NOT NULL DEFAULT 'SUPER',
  `delete` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=787 ;

--
-- Dumping data for table `m2m_site_view_element`
--

INSERT INTO `m2m_site_view_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
(145, 1, 'GTable', 'list', '', '', '{"controllerUrl":"\\/gong\\/site\\/{var:model.childType}","view":false,"fields":"*","data":"var:model.children","columns":[{"id":"mode","editor":"textarea"},{"id":"id","display":false},{"id":"name","editor":"textarea"},{"id":"className","editor":"textarea"},{"id":"view","editor":"textarea"},{"id":"edit","editor":"textarea"},{"id":"delete","editor":"textarea"},{"id":"weight","editor":"textarea"},{"id":"created"},{"id":"modified"},{"id":"actions","field":"id","formatter":"Actions"}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-01 22:15:32', '2014-05-10 05:10:44', 6, 195, 1),
(178, 1, 'GTextField', 'name', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-04 15:46:43', '2014-05-11 14:24:15', 3, 47, 1),
(179, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-07 00:48:34', '2014-05-11 14:24:15', 1, 47, 1),
(180, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-07 00:48:55', '2014-05-11 14:24:15', 20, 47, 1),
(181, 1, 'GSubmitButton', 'submit', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-07 00:51:05', '2014-05-11 14:24:15', 19, 47, 1),
(182, 1, 'GHiddenField', 'parentId', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-07 20:23:22', '2014-05-11 14:24:15', 18, 47, 1),
(183, 1, 'GTextField', 'mode', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-07 20:43:55', '2014-05-11 14:24:15', 2, 47, 1),
(184, 1, 'GTextField', 'weight', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-07 20:58:47', '2014-05-11 14:24:15', 5, 47, 1),
(185, 1, 'GTextField', 'className', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-07 21:05:01', '2014-05-11 14:24:15', 4, 47, 1),
(197, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-07 22:47:32', '2014-05-07 22:48:14', 1, 58, 1),
(198, 3, 'GFormWidget', 'formEnd', '', '', NULL, NULL, NULL, '*', 'SUPER', NULL, '2014-05-07 22:48:04', NULL, 10, 58, 1),
(199, 1, 'GJsonEditor', 'fields', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-07 22:48:36', '2014-05-07 22:49:41', 2, 58, 1),
(201, 1, 'GViewDom', 'children', '', '', '{"url":"dom\\/import\\/type\\/view\\/id\\/{var:model.hash}"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-07 23:20:14', '2014-05-10 05:10:44', 4, 195, 1),
(244, 1, 'GRedirect', 'redirect', '', '', '{"url":"var:model.updateRedirect"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-08 02:29:06', '2014-05-12 23:06:44', NULL, 59, 1),
(245, 1, 'GMenu', 'menu', '', '', '{"items":[{"label":"View parent","url":{"0":"{var:model.parent.controllerId}/view","id":"var:model.parent.hash"}}]}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-08 02:31:11', '2014-05-12 23:01:05', 1, 58, 1),
(522, 1, 'GRedirect', 'redirect', '', '', '{"params":{"id":"var:model.parent.hash"},"url":"{var:model.parentType}/view"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-08 16:23:28', '2014-05-10 04:27:47', NULL, 175, 1),
(523, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-08 16:23:28', NULL, 1, 176, 1),
(524, 1, 'GMenu', 'menu', '', '', '{"items":[{"label":"View parent","url":{"0":"{var:model.parentType}/view","id":"var:model.parent.hash"}}]}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-08 16:23:28', '2014-05-10 04:54:35', 1, 176, 1),
(525, 1, 'GJsonEditor', 'fields', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-08 16:23:28', NULL, 2, 176, 1),
(526, 3, 'GFormWidget', 'formEnd', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-08 16:23:28', NULL, 10, 176, 1),
(527, 1, 'GRedirect', 'redirect', '', '', '{"params":{"id":"var:model.parent.hash"},"url":"{var:model.parentType}/view"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-08 16:23:28', '2014-05-10 04:27:59', NULL, 177, 1),
(528, 1, 'GRedirect', 'redirect', '', '', '{"params":{"id":"var:model.parent.hash"},"url":"{var:model.parentType}/view"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-08 16:23:28', '2014-05-10 04:28:09', NULL, 178, 1),
(539, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 02:55:11', '2014-05-10 05:10:43', 1, 194, 1),
(540, 1, 'GTextField', 'name', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 02:55:11', '2014-05-10 05:10:43', 3, 194, 1),
(541, 1, 'GHiddenField', 'parentId', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 02:55:11', '2014-05-10 05:10:43', 8, 194, 1),
(542, 1, 'GSubmitButton', 'submit', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 02:55:11', '2014-05-10 05:10:43', 9, 194, 1),
(543, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 02:55:11', '2014-05-10 05:10:43', 10, 194, 1),
(544, 1, 'GTag', 'name', '', '', '{"text":"Page<\\/h1>Name: {var:model.name}<\\/h2>","tag":"span"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 02:55:11', '2014-05-10 05:10:43', 1, 195, 1),
(545, 1, 'GMenu', 'menu', '', '', '{"items":[{"label":"List pages","url":["page\\/list"]},{"label":"Create view element","url":{"0":"pageElement\\/create","parentId":"var:model.hash"}}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 02:55:11', '2014-05-10 05:10:44', 2, 195, 1),
(548, 1, 'GRedirect', 'redirect', '', '', '{"url":"page\\/list"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 02:55:12', '2014-05-10 05:10:44', NULL, 196, 1),
(549, 1, 'GRedirect', 'redirect', '', '', '{"params":{"id":"var:model.hash"},"url":"view"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 02:55:12', '2014-05-10 05:10:44', NULL, 197, 1),
(572, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 03:04:56', NULL, 1, 194, 1),
(573, 1, 'GTextField', 'name', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 03:04:56', NULL, 3, 194, 1),
(574, 1, 'GHiddenField', 'parentId', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 03:04:56', NULL, 8, 194, 1),
(575, 1, 'GSubmitButton', 'submit', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 03:04:56', NULL, 9, 194, 1),
(576, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 03:04:56', NULL, 10, 194, 1),
(577, 1, 'GTag', 'name', '', '', '{"text":"Page</h1>Name: {var:model.name}</h2>","tag":"span"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 03:04:56', '2014-05-10 04:03:32', 1, 195, 1),
(578, 1, 'GMenu', 'menu', '', '', '{"items":[{"label":"List pages","url":{"0":"page/list"}},{"label":"Create view element","url":{"0":"pageElement/create","parentId":"var:model.hash"}}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 03:04:56', '2014-05-10 04:04:39', 2, 195, 1),
(579, 1, 'GViewDom', 'children', '', '', '{"url":"dom\\/import\\/type\\/view\\/id\\/{var:model.hash}"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 03:04:56', NULL, 4, 195, 1),
(580, 1, 'GTable', 'list', '', '', '{"controllerUrl":"/gong/site/{var:model.childType}","view":false,"fields":"*","data":"var:model.children","columns":[{"id":"mode","editor":"textarea"},{"id":"id","display":false},{"id":"name","editor":"textarea"},{"id":"className","editor":"textarea"},{"id":"view","editor":"textarea"},{"id":"edit","editor":"textarea"},{"id":"delete","editor":"textarea"},{"id":"weight","editor":"textarea"},{"id":"created"},{"id":"modified"},{"id":"actions","field":"id","formatter":"Actions"}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 03:04:56', '2014-05-10 04:14:07', 6, 195, 1),
(581, 1, 'GRedirect', 'redirect', '', '', '{"url":"page/list"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 03:04:56', '2014-05-10 04:05:47', NULL, 196, 1),
(582, 1, 'GRedirect', 'redirect', '', '', '{"params":{"id":"var:model.hash"},"url":"view"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 03:04:56', NULL, NULL, 197, 1),
(583, 1, 'GTag', 'name', '', '', '{"tag":"h1","text":"Pages:"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 03:05:51', '2014-05-10 03:06:43', 1, 198, 1),
(584, 1, 'GMenu', 'menu', '', '', '{"items":[{"url":["create"],"label":"Create Page"}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 03:05:51', '2014-05-10 04:03:07', 2, 198, 1),
(585, 1, 'GTable', 'list', '', '', '{"controllerUrl":"/gong/site/{var:controller.id}","columns":[{"id":"id","display":false},{"id":"name","editor":"textarea"},{"field":"id","id":"actions","formatter":"Actions"}],"data":"var:data"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 03:05:51', '2014-05-10 04:09:11', 3, 198, 1),
(586, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:56:41', NULL, 1, 199, 1),
(587, 1, 'GTextField', 'name', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:56:41', NULL, 3, 199, 1),
(588, 1, 'GHiddenField', 'parentId', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:56:41', NULL, 8, 199, 1),
(589, 1, 'GSubmitButton', 'submit', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:56:41', NULL, 9, 199, 1),
(590, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:56:41', NULL, 10, 199, 1),
(591, 1, 'GTag', 'name', '', '', '{"text":"Page<\\/h1>Name: {var:model.name}<\\/h2>","tag":"span"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:56:41', NULL, 1, 200, 1),
(592, 1, 'GMenu', 'menu', '', '', '{"items":[{"label":"List pages","url":["page\\/list"]},{"label":"Create view element","url":{"0":"pageElement\\/create","parentId":"var:model.hash"}}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:56:41', NULL, 2, 200, 1),
(593, 1, 'GViewDom', 'children', '', '', '{"url":"dom\\/import\\/type\\/view\\/id\\/{var:model.hash}"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:56:41', NULL, 4, 200, 1),
(594, 1, 'GTable', 'list', '', '', '{"controllerUrl":"\\/gong\\/site\\/{var:model.childType}","view":false,"fields":"*","data":"var:model.children","columns":[{"id":"mode","editor":"textarea"},{"id":"id","display":false},{"id":"name","editor":"textarea"},{"id":"className","editor":"textarea"},{"id":"view","editor":"textarea"},{"id":"edit","editor":"textarea"},{"id":"delete","editor":"textarea"},{"id":"weight","editor":"textarea"},{"id":"created"},{"id":"modified"},{"id":"actions","field":"id","formatter":"Actions"}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:56:41', NULL, 6, 200, 1),
(595, 1, 'GRedirect', 'redirect', '', '', '{"url":"page\\/list"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:56:41', NULL, NULL, 201, 1),
(596, 1, 'GRedirect', 'redirect', '', '', '{"params":{"id":"var:model.hash"},"url":"view"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:56:41', NULL, NULL, 202, 1),
(597, 1, 'GTag', 'name', '', '', '{"tag":"h1","text":"Pages:"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:56:41', NULL, 1, 203, 1),
(598, 1, 'GMenu', 'menu', '', '', '{"items":[{"url":["create"],"label":"Create Page"}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:56:41', NULL, 2, 203, 1),
(599, 1, 'GTable', 'list', '', '', '{"controllerUrl":"\\/gong\\/site\\/{var:controller.id}","columns":[{"id":"id","display":false},{"id":"name","editor":"textarea"},{"field":"id","id":"actions","formatter":"Actions"}],"data":"var:data"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:56:41', NULL, 3, 203, 1),
(600, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:58:37', NULL, 1, 204, 1),
(601, 1, 'GTextField', 'mode', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:58:37', NULL, 2, 204, 1),
(602, 1, 'GTextField', 'name', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:58:37', NULL, 3, 204, 1),
(603, 1, 'GTextField', 'className', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:58:37', NULL, 4, 204, 1),
(604, 1, 'GTextField', 'weight', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:58:37', NULL, 5, 204, 1),
(605, 1, 'GHiddenField', 'parentId', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:58:37', NULL, 18, 204, 1),
(606, 1, 'GSubmitButton', 'submit', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:58:37', NULL, 19, 204, 1),
(607, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 04:58:37', NULL, 20, 204, 1),
(608, 1, 'GRedirect', 'redirect', '', '', '{"params":{"id":"var:model.parent.hash"},"url":"{var:model.parentType}\\/view"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:58:37', NULL, NULL, 205, 1),
(609, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:58:37', NULL, 1, 206, 1),
(610, 1, 'GMenu', 'menu', '', '', '{"items":[{"label":"View parent","url":{"0":"{var:model.parentType}\\/view","id":"var:model.parent.hash"}}]}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:58:37', NULL, 1, 206, 1),
(611, 1, 'GJsonEditor', 'fields', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:58:37', NULL, 2, 206, 1),
(612, 3, 'GFormWidget', 'formEnd', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:58:37', NULL, 10, 206, 1),
(613, 1, 'GRedirect', 'redirect', '', '', '{"params":{"id":"var:model.parent.hash"},"url":"{var:model.parentType}\\/view"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:58:37', NULL, NULL, 207, 1),
(614, 1, 'GRedirect', 'redirect', '', '', '{"params":{"id":"var:model.parent.hash"},"url":"{var:model.parentType}\\/view"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 04:58:37', NULL, NULL, 208, 1),
(618, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-05-22 18:16:38', 0, 210, 1),
(619, 1, 'GTextField', 'name', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-05-22 18:16:38', 3, 210, 1),
(621, 1, 'GSubmitButton', 'submit', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-05-22 18:16:38', 4, 210, 1),
(622, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-05-22 18:16:38', 5, 210, 1),
(623, 1, 'GTag', 'name', '', '', '{"text":"Model:<h1>{var:model.modelLabel}</h1><h2>Name: {var:model.name}</h2>","tag":"span"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-05-22 17:55:59', 0, 211, 1),
(624, 1, 'GMenu', 'menu', '', '', '{"items":[{"label":"List {var:model.controllerId}s","url":["list"]},{"label":"Create {var:model.childModel.controllerId}","url":{"0":"{var:model.childModel.controllerId}\\/create","parentId":"var:model.hash"}}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-05-16 02:39:29', 1, 211, 1),
(625, 1, 'GViewDom', 'children', '', '', '{"importUrl":"dom/batchImport/type/page/id/{var:model.hash}","exportUrl":"dom/batchExport/type/page/id/{var:model.hash}"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 05:11:08', '2014-05-19 01:27:53', 2, 211, 1),
(627, 1, 'GRedirect', 'redirect', '', '', '{"url":"var:model.deleteRedirect"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 05:11:08', '2014-05-12 21:52:21', NULL, 212, 1),
(628, 1, 'GRedirect', 'redirect', '', '', '{"url":"var:model.createRedirect"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 05:11:08', '2014-05-12 23:39:07', NULL, 213, 1),
(629, 1, 'GTag', 'name', '', '', '{"tag":"h1","text":"{var:model.modelLabel}s:"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-05-22 17:53:50', 1, 214, 1),
(630, 1, 'GMenu', 'menu', '', '', '{"items":[{"url":["create"],"label":"Create {var:model.modelLabel}"}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-05-22 17:57:48', 2, 214, 1),
(632, 1, 'GTextField', 'controller', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 06:17:55', '2014-05-22 18:16:38', 2, 210, 1),
(633, 1, 'GTextField', 'module', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 06:18:20', '2014-05-22 18:16:38', 1, 210, 1),
(643, 1, 'GTag', 'name', '', '', '{"tag":"h1","text":"{var:controller.label}s:"}', NULL, NULL, '*', 'SUPER', '', '2014-05-11 15:25:08', NULL, 1, 216, 1),
(644, 1, 'GMenu', 'menu', '', '', '{"items":[{"url":["create"],"label":"Create {var:controller.label}"}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-11 15:25:08', NULL, 2, 216, 1),
(645, 1, 'GTable', 'list', '', '', '{"actions":["<a href=\\"\\/gong\\/site\\/{var:model.childType}\\/update\\/id\\/{child:view.hash}\\"><i class=\\\\''glyphicon glyphicon-search\\\\''><\\/i><\\/a>"],"controllerUrl":"\\/gong\\/site\\/{var:model.childType}","columns":[{"id":"id","display":false},{"id":"module","editor":"textarea"},{"id":"controller","editor":"textarea"},{"id":"name","editor":"textarea"},{"field":"view.name","id":"Parent"},{"field":"id","id":"actions","formatter":"Actions"}],"options":{"bFilter":true},"data":"var:data"}', NULL, NULL, 'disabled', 'SUPER', '', '2014-05-11 15:25:09', '2014-05-12 15:12:29', 3, 216, 1),
(646, 1, 'GGridView', 'grid', '', '', '{"columns":"var:model.gridColumns","itemsCssClass":"table","ajaxUpdate":false,"dataProvider":"var:dataProvider"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-11 23:07:30', '2014-05-12 20:37:38', 3, 216, 1),
(648, 1, 'GGridView', 'grid', '', '', '{"columns":"var:model.gridColumns","itemsCssClass":"table table-striped table-hover","ajaxUpdate":false,"dataProvider":"var:dataProvider"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-12 17:37:17', '2014-05-22 18:32:55', 4, 214, 1),
(649, 1, 'GGridView', 'grid', '', '', '{"columns":"var:model.childModel.gridColumns","itemsCssClass":"table table-striped","sortUrl":"{var:model.childModel.controllerId}/reorder","sort":true,"dataProvider":"var:dataProvider"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-12 18:46:23', '2014-05-19 00:38:40', 3, 211, 1),
(650, 2, 'GFormWidget', 'SignIn', '', '', '{"htmlOptions":{"class":"nohijack"}}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-13 03:13:20', '2014-06-02 20:36:34', 0, 228, 1),
(651, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-13 03:13:48', '2014-05-16 03:09:42', 15, 228, 1),
(652, 1, 'GTextField', 'username', '', '', '{"fieldOptions":{"class":"form-control input-large"}}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-13 03:17:07', '2014-05-16 03:09:41', 2, 228, 1),
(653, 1, 'GPasswordField', 'password', '', '', '{"fieldOptions":{"class":"form-control input-large"}}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-13 03:18:25', '2014-05-16 03:09:41', 5, 228, 1),
(654, 1, 'GSubmitButton', 'Submit', '', '', '{"buttonLabel":"translate:Login","buttonOptions":{"class":"btn btn-large btn-info"}}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-15 14:27:18', '2014-05-16 03:09:42', 9, 228, 1),
(655, 1, 'GButton', 'rememberMe', '', '', '{"buttonLabel":"Stay signed in","buttonOptions":{"class":"btn-large","color":"danger","toggle":"checkbox"}}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-15 14:45:45', '2014-05-16 03:09:42', 13, 228, 1),
(656, 1, 'GLink', 'signup', '', '', '{"htmlOptions":{"class":"btn btn-large btn-success"},"text":"Sign Up","url":"\\/gong\\/user\\/registration\\/registration"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 00:04:40', '2014-05-16 03:09:42', 10, 228, 1),
(657, 1, 'GLink', 'recovery', '', '', '{"htmlOptions":{"class":"btn btn-large btn-danger"},"text":"Lost password","url":"\\/gong\\/user\\/registration\\/recovery"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 00:05:29', '2014-05-16 03:09:42', 14, 228, 1),
(659, 1, 'GRedirect', 'redirect', '', '', '{"url":"var:model.updateRedirect"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 02:18:05', NULL, NULL, 229, 1),
(660, 2, 'GTag', 'Inline', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 02:42:44', '2014-05-16 03:09:41', 1, 228, 1),
(661, 3, 'GTag', 'InlineClose', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 02:43:25', '2014-05-16 03:09:41', 3, 228, 1),
(662, 2, 'GTag', 'Inline', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 02:44:58', '2014-05-16 03:09:41', 4, 228, 1),
(663, 3, 'GTag', 'InlineClose', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 02:45:08', '2014-05-16 03:09:42', 17, 228, 1),
(665, 3, 'GTag', 'InlineClose', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 02:54:17', '2014-05-16 03:09:41', 6, 228, 1),
(666, 2, 'GTag', 'Inline', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 02:55:16', '2014-05-16 03:09:42', 8, 228, 1),
(667, 3, 'GTag', 'InlineClose', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 03:03:43', '2014-05-16 03:09:42', 11, 228, 1),
(668, 2, 'GTag', 'Inline', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 03:05:02', '2014-05-16 03:09:42', 12, 228, 1),
(670, 3, 'GTag', 'buttonsClose', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 03:07:16', '2014-06-02 20:35:51', 16, 228, 1),
(671, 2, 'GTag', 'buttons', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-16 03:07:21', '2014-06-02 20:35:43', 7, 228, 1),
(672, 1, 'GTag', 'name', '', '', '{"text":"View<h1>{var:model.modelLabel}</h1><h2>Name: {var:model.name}</h2>","tag":"span"}', NULL, NULL, '*', 'SUPER', '', '2014-05-19 00:33:36', '2014-05-22 17:57:12', 0, 230, 1),
(673, 1, 'GMenu', 'menu', '', '', '{"items":[{"label":"List {var:model.controllerId}s","url":["list"]},{"label":"Create {var:model.childModel.controllerId}","url":{"0":"{var:model.childModel.controllerId}\\/create","parentId":"var:model.hash"}}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-19 00:33:36', NULL, 1, 230, 1),
(674, 1, 'GViewDom', 'children', '', '', '{"importUrl":"dom/batchImport/type/view/module/{var:model.module}/controller/{var:model.controller}/name/{var:model.name}","exportUrl":"dom/batchExport/type/view/module/{var:model.module}/controller/{var:model.controller}/name/{var:model.name}"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 00:33:36', '2014-05-19 01:23:04', 2, 230, 1),
(675, 1, 'GGridView', 'grid', '', '', '{"columns":"var:model.childModel.gridColumns","itemsCssClass":"table table-striped table-hover","sortUrl":"{var:model.childModel.controllerId}/reorder","sort":true,"dataProvider":"var:dataProvider"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 00:33:36', '2014-05-22 18:32:27', 3, 230, 1),
(676, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-19 01:33:27', '2014-06-23 12:50:35', 1, 231, 1),
(677, 1, 'GTextField', 'username', '', '', '{"submission":"var:form"}', NULL, NULL, '*', 'SUPER', '', '2014-05-19 01:33:27', '2014-06-23 12:50:36', 3, 231, 1),
(678, 1, 'GPasswordField', 'password', '', '', '{"submission":"var:form"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:33:27', '2014-06-23 12:50:36', 4, 231, 1),
(680, 1, 'GSubmitButton', 'submit', '', '', '{}', NULL, NULL, '*', 'SUPER', '', '2014-05-19 01:33:27', '2014-07-26 14:02:04', 20, 231, 1),
(681, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-19 01:33:27', '2014-06-23 12:50:37', 21, 231, 1),
(682, 1, 'GTextField', 'firstname', '', '', '{"label":"First Name"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-07-26 13:14:00', 6, 231, 1),
(683, 1, 'GTextField', 'lastname', '', '', '{"label":"Last Name"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-07-26 13:14:19', 7, 231, 1),
(684, 1, 'GEmailField', 'email', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-07-26 13:11:11', 8, 231, 1),
(685, 1, 'GTextField', 'company', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 15, 231, 1),
(686, 1, 'GTextField', 'telephone', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 16, 231, 1),
(687, 1, 'GTextField', 'address', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 18, 231, 1),
(688, 1, 'GTextField', 'city', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-07-26 13:11:28', 13, 231, 1),
(689, 1, 'GTextField', 'state', '', '', '{"label":"Province"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-07-26 13:21:11', 12, 231, 1),
(690, 1, 'GTextField', 'zip', '', '', '{"label":"Area Code"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-07-26 13:22:08', 14, 231, 1),
(691, 1, 'GTextField', 'country', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-07-26 13:11:19', 11, 231, 1),
(700, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 18:09:23', '2014-05-22 18:15:14', 0, 234, 1),
(701, 1, 'GTextField', 'module', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 18:09:23', '2014-05-22 18:15:14', 1, 234, 1),
(702, 1, 'GTextField', 'controller', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 18:09:23', '2014-05-22 18:15:14', 2, 234, 1),
(703, 1, 'GTextField', 'name', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 18:09:23', '2014-05-22 18:15:14', 3, 234, 1),
(704, 1, 'GTextField', 'parentModule', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 18:09:23', '2014-05-22 18:15:14', 4, 234, 1),
(705, 1, 'GTextField', 'parentName', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 18:09:23', '2014-05-22 18:15:14', 6, 234, 1),
(706, 1, 'GSubmitButton', 'submit', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 18:09:23', '2014-05-22 18:15:14', 7, 234, 1),
(707, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 18:09:23', '2014-05-22 18:15:14', 8, 234, 1),
(708, 1, 'GTextField', 'parentController', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 18:13:53', '2014-05-22 18:15:14', 5, 234, 1),
(709, 1, 'GCaptcha', 'verifyCode', '', '', '{"required":false,"submission":"var:form"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:32:00', '2014-07-26 13:40:42', 19, 231, 1),
(710, 1, 'GPasswordField', 'verifyPassword', '', '', '{"submission":"var:form"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:36:07', '2014-06-23 12:50:36', 5, 231, 1),
(711, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 22:46:59', NULL, 0, 235, 1),
(715, 1, 'GTextField', 'firstname', '', '', '{"label":"First Name"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', '2014-07-26 15:35:04', 4, 235, 1),
(716, 1, 'GTextField', 'lastname', '', '', '{"label":"Last Name"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', '2014-07-26 15:37:02', 5, 235, 1),
(717, 1, 'GEmailField', 'email', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 6, 235, 1),
(718, 1, 'GTextField', 'company', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 7, 235, 1),
(719, 1, 'GTextField', 'telephone', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 8, 235, 1),
(720, 1, 'GTextField', 'address', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 9, 235, 1),
(721, 1, 'GTextField', 'city', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 10, 235, 1),
(722, 1, 'GTextField', 'state', '', '', '{"label":"Province"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', '2014-07-26 15:37:36', 11, 235, 1),
(723, 1, 'GTextField', 'zip', '', '', '{"label":"Area Code"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', '2014-07-26 15:38:00', 12, 235, 1),
(724, 1, 'GTextField', 'country', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 13, 235, 1),
(726, 1, 'GSubmitButton', 'submit', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 22:47:00', NULL, 15, 235, 1),
(727, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 22:47:00', NULL, 16, 235, 1),
(728, 1, 'GRedirect', 'redirect', '', '', '{"url":"/page/upload"}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-02 20:23:10', '2014-06-02 20:25:36', NULL, 236, 1),
(729, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-02 20:31:30', NULL, 0, 237, 1),
(732, 1, 'GTextField', 'name', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-06-02 20:31:30', NULL, 3, 237, 1),
(733, 1, 'GSubmitButton', 'submit', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-06-02 20:31:30', NULL, 4, 237, 1),
(734, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-02 20:31:30', NULL, 5, 237, 1),
(735, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-05 16:51:34', NULL, 1, 238, 1),
(736, 1, 'GTextField', 'mode', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 16:51:34', NULL, 2, 238, 1),
(737, 1, 'GTextField', 'name', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-05 16:51:34', NULL, 3, 238, 1),
(738, 1, 'GTextField', 'className', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 16:51:34', NULL, 4, 238, 1),
(739, 1, 'GTextField', 'weight', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-06-05 16:51:35', NULL, 5, 238, 1),
(740, 1, 'GHiddenField', 'parentId', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-05 16:51:35', NULL, 18, 238, 1),
(741, 1, 'GSubmitButton', 'submit', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-05 16:51:35', NULL, 19, 238, 1),
(742, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-05 16:51:35', NULL, 20, 238, 1),
(743, 1, 'GTag', 'Registeration', 'Registeration', '', '{"tag":"h2"}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-20 14:56:02', '2014-06-23 12:50:35', 0, 231, 1),
(744, 1, 'GTag', 'H2', 'Profile', '', '{"tag":"h2"}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-20 15:12:56', '2014-06-20 15:14:17', NULL, 235, 1),
(745, 1, 'GImage', 'Producer Image', '', '', '{"src":"\\/themes\\/m2m\\/images\\/profile_producer.png","htmlOptions":{"class":"pull-left"}}', NULL, NULL, 'Producer', 'SUPER', NULL, '2014-06-20 16:58:35', '2014-07-01 10:17:58', NULL, 235, 1),
(746, 1, 'GImage', 'Reporter Image', '', '', '{"htmlOptions":{"class":"pull-left"},"src":"\\/themes\\/m2m\\/images\\/profile_reporter.png"}', NULL, NULL, 'Reporter', 'SUPER', NULL, '2014-06-20 17:00:55', '2014-07-01 10:16:16', NULL, 235, 1),
(747, 2, 'GTag', 'GTag Inline', '', '', '{"htmlOptions":{"class":"inline"}}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-23 12:44:23', '2014-06-23 12:50:36', 2, 231, 1),
(748, 3, 'GTag', 'GTag Inline', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-06-23 12:44:37', '2014-06-23 12:50:36', 9, 231, 1),
(749, 2, 'GTag', 'Inline', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-06-23 12:48:16', '2014-06-23 12:50:36', 10, 231, 1),
(750, 3, 'GTag', 'GTag inline', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-06-23 12:48:57', '2014-06-23 12:50:36', 17, 231, 1),
(751, 1, 'GTag', 'invoiceHeader', 'Tax Invoice', '', '{"tag":"h2"}', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 16:09:33', '2014-03-05 22:42:36', 0, 13, 1),
(752, 2, 'GTag', 'invoiceRecipient', '', '', '{"htmlOptions":{"style":"float:right","class":"well"}}', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 16:11:38', '2014-03-06 00:12:09', 10, 239, 1),
(753, 3, 'GTag', 'invoiceRecipientClose', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 16:12:00', '2014-03-05 22:42:36', 18, 239, 1),
(754, 1, 'GVar', 'invoiceRecipientCompany', '', '', '{"key":"invoice.user.profile.company"}', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 16:13:52', '2014-03-05 22:42:36', 13, 239, 1),
(755, 1, 'GTag', 'invoiceRecipientHeader', 'To:', '', '{"tag":"h4"}', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 16:33:23', '2014-03-05 22:42:36', 11, 239, 1),
(756, 1, 'GVar', 'invoiceRecipientAddress', '', '', '{"key":"invoice.user.profile.address"}', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 16:34:54', '2014-03-05 22:42:36', 15, 239, 1),
(757, 1, 'GTag', 'invoiceRecipientCompanyLabel', 'Company:', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 16:38:42', '2014-03-05 22:42:36', 12, 239, 1),
(758, 1, 'GTag', 'invoiceRecipientAddressLabel', 'Address:', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 16:39:37', '2014-03-05 22:42:36', 14, 239, 1),
(759, 1, 'GTag', 'invoiceRecipientEmailLabel', 'E-Mail:', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 16:40:41', '2014-03-05 22:42:36', 16, 239, 1),
(760, 1, 'GVar', 'invoiceRecipientEmail', '', '', '{"key":"invoice.user.profile.email"}', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 16:40:55', '2014-03-05 22:42:36', 17, 239, 1),
(761, 2, 'GTag', 'invoiceSender', '', '', '{"htmlOptions":{"style":"float:left","class":"well"}}', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 17:02:22', '2014-03-06 00:11:46', 1, 239, 1),
(762, 3, 'GTag', 'invoiceSenderClose', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 17:02:37', '2014-03-05 22:42:36', 9, 239, 1),
(763, 1, 'GTag', 'invoiceSenderHeader', 'From:', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 17:03:13', '2014-03-05 22:42:36', 2, 239, 1),
(764, 1, 'GTag', 'invoiceSenderCompanyLabel', 'Company:', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 17:04:01', '2014-03-05 22:42:36', 3, 239, 1),
(765, 1, 'GVar', 'invoiceSenderCompany', '', '', '{"key":"user.profile.company"}', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 17:04:13', '2014-03-05 22:42:36', 4, 239, 1),
(766, 1, 'GTag', 'invoiceSenderAddressLabel', 'Address:', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 17:17:29', '2014-03-05 22:42:36', 5, 239, 1),
(767, 1, 'GVar', 'invoiceSenderAddress', '', '', '{"key":"user.profile.company"}', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 17:17:36', '2014-03-05 22:42:36', 6, 239, 1),
(768, 1, 'GTag', 'invoiceSenderEmailLabel', 'E-Mail:', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 17:18:51', '2014-03-05 22:42:36', 7, 239, 1),
(769, 1, 'GVar', 'invoiceSenderEmail', '', '', '{"key":"user.profile.email"}', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 17:18:58', '2014-03-05 22:42:36', 8, 239, 1),
(770, 1, 'GTable', 'invoice', '', '', '{"columns":[{"id":1,"name":"Item","field":"item"},{"id":2,"name":"Price","field":"price"}],"data":"var:invoice-data"}', NULL, NULL, '*', 'SUPER', NULL, '2014-03-05 22:42:24', '2014-06-29 21:41:31', 19, 239, 1),
(772, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-29 15:24:38', NULL, 0, 240, 1),
(775, 1, 'GTextField', 'name', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-06-29 15:24:38', NULL, 3, 240, 1),
(776, 1, 'GSubmitButton', 'submit', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-06-29 15:24:38', NULL, 4, 240, 1),
(777, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-29 15:24:38', NULL, 5, 240, 1),
(778, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-29 15:36:36', NULL, 1, 241, 1),
(779, 1, 'GTextField', 'mode', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-06-29 15:36:36', NULL, 2, 241, 1),
(780, 1, 'GTextField', 'name', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-29 15:36:36', NULL, 3, 241, 1),
(781, 1, 'GTextField', 'className', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-06-29 15:36:36', NULL, 4, 241, 1),
(782, 1, 'GTextField', 'weight', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-06-29 15:36:36', NULL, 5, 241, 1),
(783, 1, 'GHiddenField', 'parentId', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-29 15:36:36', NULL, 18, 241, 1),
(784, 1, 'GSubmitButton', 'submit', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-29 15:36:37', NULL, 19, 241, 1),
(785, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-06-29 15:36:37', NULL, 20, 241, 1),
(786, 1, 'GTag', '', '', '', '{"text":"Hello {var:username}<br>Please click on the following link: <a href=''{var:recovery_url}''></a> to change your password."}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-30 13:36:21', '2014-06-30 13:47:56', NULL, 242, 1);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_site_view_map`
--

CREATE TABLE IF NOT EXISTS `m2m_site_view_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL DEFAULT '*',
  `controller` varchar(255) NOT NULL DEFAULT '*',
  `name` varchar(255) NOT NULL DEFAULT '*',
  `parentModule` varchar(255) NOT NULL DEFAULT '*',
  `parentController` varchar(255) NOT NULL DEFAULT '*',
  `parentName` varchar(255) NOT NULL DEFAULT '*',
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=123 ;

--
-- Dumping data for table `m2m_site_view_map`
--

INSERT INTO `m2m_site_view_map` (`id`, `module`, `controller`, `name`, `parentModule`, `parentController`, `parentName`, `priority`) VALUES
(97, 'site', '*', '*', 'site', 'model', '*', 999),
(121, '*', 'view', 'create', '*', 'elementCollection', '*', 1),
(122, '*', 'viewElement', 'create', '*', 'element', '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_textsettings`
--

CREATE TABLE IF NOT EXISTS `m2m_textsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` enum('en_us','de','fr','pl','ru','es','ro') NOT NULL DEFAULT 'en_us',
  `text_email_registration` text,
  `subject_email_registration` text,
  `text_email_recovery` text,
  `text_email_activation` text,
  `text_friendship_new` text,
  `text_friendship_confirmed` text,
  `text_profilecomment_new` text,
  `text_message_new` text,
  `text_membership_ordered` text,
  `text_payment_arrived` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `m2m_textsettings`
--

INSERT INTO `m2m_textsettings` (`id`, `language`, `text_email_registration`, `subject_email_registration`, `text_email_recovery`, `text_email_activation`, `text_friendship_new`, `text_friendship_confirmed`, `text_profilecomment_new`, `text_message_new`, `text_membership_ordered`, `text_payment_arrived`) VALUES
(1, 'en_us', 'Thank you for registering with IPP-Renewables the Bid Windows 3, 4 and 5 is open. After validating your details please kindly sign in and provide your project information. You can do this by clicking the following link:\n{activation_url}', 'IPP-Renewables User Registration', 'You have requested a new Password. To set your new Password,\n										please go to {recovery_url}', 'Your account has been activated. Thank you for registering. Please sign in to fill in Bid Window 3, 4 and 5.', 'New friendship Request from {username}: {message}. To accept or ignore this request, go to your friendship page: {link_friends} or go to your profile: {link_profile}', 'The User {username} has accepted your friendship request', 'You have a new profile comment from {username}: {message} visit your profile: {link_profile}', 'You have received a new message from {username}: {message}', 'Your order of membership {membership} on {order_date} has been taken. Your order \r\nNumber is {id}. You have choosen the payment style {payment}.', 'Your payment has been received on {payment_date} and your Membership {id} is now active'),
(2, 'de', 'Sie haben sich fÃÂÃÂÃÂÃÂ¼r unsere Applikation registriert. Bitte bestÃÂÃÂÃÂÃÂ¤tigen Sie ihre E-Mail adresse mit diesem Link: {activation_url}', 'Sie haben sich fÃÂÃÂÃÂÃÂ¼r eine Applikation registriert.', 'Sie haben ein neues Passwort angefordert. Bitte klicken Sie diesen link: {activation_url}', 'Ihr Konto wurde freigeschaltet.', 'Der Benutzer {username} hat Ihnen eine Freundschaftsanfrage gesendet. \n\n							 Nachricht: {message}\n\n							 Klicken sie <a href="{link_friends}">hier</a>, um diese Anfrage zu bestÃÂÃÂÃÂÃÂ¤tigen oder zu ignorieren. Alternativ kÃÂÃÂÃÂÃÂ¶nnen sie <a href="{link_profile}">hier</a> auf ihre Profilseite zugreifen.', 'Der Benutzer {username} hat ihre Freundschaftsanfrage bestÃÂÃÂÃÂÃÂ¤tigt.', '\n							 Benutzer {username} hat Ihnen eine Nachricht auf Ihrer Pinnwand hinterlassen: \n\n							 {message}\n\n							 <a href="{link}">hier</a> geht es direkt zu Ihrer Pinnwand!', 'Sie haben eine neue Nachricht von {username} bekommen: {\r\nmessage}', 'Ihre Bestellung der Mitgliedschaft {membership} wurde am {order_date} entgegen genommen. Die gewÃÂÃÂÃÂÃÂ¤hlte Zahlungsart ist {payment}. Die Auftragsnummer lautet {id}.', 'Ihre Zahlung wurde am {payment_date} entgegen genommen. Ihre Mitgliedschaft mit der Nummer {id} ist nun Aktiv.'),
(3, 'es', 'Te has registrado en esta aplicaciÃÂÃÂÃÂÃÂ³n. Para confirmar tu direcciÃÂÃÂÃÂÃÂ³n de correo electrÃÂÃÂÃÂÃÂ³nico, por favor, visita {activation_url}.', 'Te has registrado en esta aplicaciÃÂÃÂÃÂÃÂ³n.', 'Has solicitado una nueva contraseÃÂÃÂÃÂÃÂ±a. Para establecer una nueva contraseÃÂÃÂÃÂÃÂ±a, por favor ve a {activation_url}', 'Tu cuenta ha sido activada. Gracias por registrarte.', 'Has recibido una nueva solicitud de amistad de {user_from}: {message} Ve a tus contactos: {link}', 'Tienes un nuevo comentario en tu perfil de {username}: {message} visita tu perfil: {link}', 'Please translatore thisse hiere toh tha espagnola langsch {username}', 'Has recibido un mensaje de {username}: {message}', 'Tu orden de membresÃÂÃÂÃÂÃÂ­a {membership} de fecha {order_date} fuÃÂÃÂÃÂÃÂ© tomada. Tu nÃÂÃÂÃÂÃÂºmero de orden es {id}. Escogiste como modo de pago {payment}.', 'Tu pago fuÃÂÃÂÃÂÃÂ© recibido en fecha {payment_date}. Ahora tu MembresÃÂÃÂÃÂÃÂ­a {id} ya estÃÂÃÂÃÂÃÂ¡ activa'),
(4, 'fr', '', '', '', '', '', '', '', '', '', ''),
(5, 'ro', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `m2m_translation`
--

CREATE TABLE IF NOT EXISTS `m2m_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'gong',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `translation` text CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `language` varchar(5) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `m2m_translation`
--

INSERT INTO `m2m_translation` (`id`, `category`, `message`, `translation`, `language`) VALUES
(6, 'gong', 'Terms And Conditions', 'Website Terms and Conditions of Use:       These Terms and Conditions (“the Terms and Conditions”) govern your  (“the User”) use of the MUSIC2EDIA (“Provider”) website located at the domain  name <a target="_blank" rel="nofollow" href="http://www.music2media.net">www.music2media.net</a> (“the Website”).      By accessing and using the Website, the User agrees to be bound by  the Terms and Conditions set out in this legal notice. If the User does not  wish to be bound by these Terms and Conditions, the User may not access,  display, use, download, and/or otherwise copy or distribute Content obtained at  the Website.     Updating of these Terms  and Conditions:       Provider reserves the rights to change, modify, add to or remove  from portions or the whole of these Terms and Conditions from time to time.  Changes to these Terms and Conditions will become effective upon such changes  being posted to this Website. It is the User’s obligation to periodically check  these Terms and Conditions at the Website for changes or updates. The User’s  continued use of this Website following the posting of changes or updates will  be considered notice of the User’s acceptance to abide by and be bound by these  Terms and Conditions, including such changes or updates.     <span>Supplier of services  details:  <br><br>In accordance with the disclosure requirements of  the Electronic Communications and Transactions Act (“ECTA”), Act No 25 of 2005,  the supplier of goods and/or services offered for sale, hire or exchange by way  of an electronic transaction, makes the following information available to  consumers:</span>     <ul><li>Supplier is Music2Media CC (hereinafter referred to as “Supplier”),  a close corporation duly registered and existing under the laws of South Africa  with registration number: 2010/088984/23, with its physical address at No. 43  Pebble Lake, Florin Road, Wilgeheuwel. Supplier’s place of registration is No.  43 Pebble Lake, Florin Road, Wilgeheuwel and Supplier will accept legal service  at this given address. Supplier’s main member is: Mr. P Piegl. The main  business of Supplier is to facilitate the sharing of music-related content for  a closed group of subscribers and falls within the companies group of  Recreational, Cultural and Sporting Activities;</li>     </ul><ul><li>Supplier’s website is <a target="_blank" rel="nofollow" href="http://www.music2.media.net">www.music2.media.net</a> and its contact details  are located on the above mentioned website.</li>     </ul><ul><li>Goods and/or Services: The main business of Supplier is to  facilitate the sharing of music-related content for a closed group of  subscribers.</li>     </ul><ul><li>Terms and conditions of download: The Consumer or User will be  liable for the full price or fees where applicable including transport costs,  taxes and any other fees or costs, guarantees, and where guarantees can be  accessed and downloaded by consumers where such tariffs, fees and or prices  will be specified on the website in relation to the goods and services  provided. Goods and services offered through this website by Supplier are  strictly on an “as is” basis for a price, fee and or tariff as shall be  indicated. Warranties and representations are hereby expressly excluded.  Downloaded files cannot be returned. In case of defect, User may notify  Supplier within 24 hours of becoming aware of defect by email to the following  address: peterpiegl@me.com. User’s cooling-off rights under s 44 of ECTA  do not apply in terms of s 42 of ECTA, due to downloads being audio, or video  recordings, or software or newspapers, periodicals, magazines or books. </li>     </ul><ul><li>Payment:  Payment may be made  online by credit card through a sufficiently secure payment system, or in the  case of Registered Users (corporate users only), by virtue of a monthly debit  order that can be arranged by calling the following number +2782 411 7430. The  payment system allows for review, corrections and withdrawal by User prior to  placing a final order.</li>     </ul><ul><li>Complaints and disputes:  Supplier offers Users to file complaints via the contacting the supplier on the  following email address peterpiegl@me.com. Currently, Supplier does not  subscribe to any alternative dispute resolution code or mechanism. </li>     </ul>Copyright and Intellectual  Property Rights:       Provider provides certain information at the Website. Content  currently or anticipated to be displayed at this Website is provided by  Provider, its affiliates and/or subsidiary, or any other third party owners of  such content, and includes but is not limited to Literary Works, Musical Works,  Artistic Works, Sound Recordings, Cinematograph Films, Sound and Television  Broadcasts, Program-Carrying Signals, Published Editions and Computer Programs  (“the Content”). All such proprietary works, and the compilation of the proprietary  works, belong to the Provider, its affiliates or subsidiary, or any third party  owners of such rights (“the Owners”), and the Content protected by South  African and International copyright laws. The Providers reserve the right to  make any changes to the Website, the Content, or to products and/or services  offered through the Website at any times and without notice. All rights in and  to the Content is reserved and retained by the Owners. Except as specified in  these Terms and Conditions, the User is not granted a license or any other  right including without limitation under Copyright, Trademark, Patent or other  Intellectual Property Rights in or to the Content.     Limited License to General  Users:     <ul><li>Provider grants to the User,  subject to the further terms of these Terms and Conditions, a non-exclusive,  non-transferable, limited and revocable right to access, display, use, download  and otherwise copy the current and future Content for personal, non-commercial  and information purposes only. </li>     </ul><ul><li>This Website and the Content  may not be reproduced, duplicated, copied, resold, visited or otherwise  exploited for any commercial purpose without the express prior written consent  of Provider/Supplier.</li>     </ul><ul><li>The license does not allow the  User to collect product or service listings, descriptions or other information  displayed here, and does not allow any derivative use of this Website or the  Content for the benefit of another merchant.</li>     </ul><ul><li>The User may not frame nor use  framing technologies to enclose the Provider Website or the Content nor any  part thereof without the express written consent of Provider.</li>     </ul><ul><li>Provider and the Owners do not  offer products or services to minors. If you are under the age of 18, you may  not respond to or otherwise accept or act upon any offers in the Website. </li>     </ul><ul><li>Provider and the Owners, their  affiliates or subsidiary reserve the right to refuse service, terminate  accounts, remove or edit content, or cancel orders in their sole discretion.</li>     </ul><ul><li>Any unauthorised use terminates  this license.</li>     </ul>Limited License to  Registered Users:     Provider allows and processes the  registration of certain corporate users (“the Registered User”) at the Website.  If you believe that you are entitled to registration, please contact  peter@music2mendia.net     <ul><li>Subject to the further terms of  these Terms and Conditions, a non-exclusive, non-transferable, limited and  revocable right is granted to Registered Users to access, display, use,  download and otherwise copy the current and future Content for the purposes  agreed to by the Registered User and Provider in their respective agreements.</li>     </ul><ul><li>This Website and the Content  may only be reproduced, duplicated, copied, resold, visited or otherwise  exploited for the specific purposes set out in that agreement.</li>     </ul><ul><li>The license does not allow the Registered  User to collect product or service listings, descriptions or other information  displayed here, and does not allow any derivative use of this Website or the  Content for the benefit of another merchant.</li>     </ul><ul><li>The Registered User may not  frame nor use framing technologies to enclose the Provider Website or the  Content nor any part thereof without the express written consent of Provider.</li>     </ul><ul><li>Provider and the Owners, their  affiliates or subsidiary reserve the right in their sole discretion to refuse  service, terminate accounts, remove or edit content, or cancel orders in their  sole discretion.</li>     </ul><ul><li>Any unauthorised use terminates  this license.</li>     </ul>Limitation of liability:       Subject to sub-sections 43(5) and 43 (6) of ECTA, if applicable, and  to the extent permitted by law, the Website and all Content on the Website,  including any current or future offer of products or services, are provided on  an “as is” basis, and may include inaccuracies or typographical errors and  Provider, Owners, suppliers, employees, directors partners, affiliates and  agents shall not be liable for any damage, or loss or liability of any nature  incurred by whoever as a result of any action or omission.<br>The Owners make no  warranty or representation as to the availability, accuracy or completeness of  the Content, or any third-party content accessible via an Internet link.  Neither Provider nor any holding company, affiliate or subsidiary of Provider  or Owners, shall be held responsible for any direct or indirect special,  consequential or other damage of any kind whatsoever suffered or incurred,  related to the use of, or the inability to access or use the Content or the  Website or any functionality thereof, or of any linked website, even if  Provider is expressly advised thereof.<br>Privacy, access to and use  of information:       <span>Provider allows you  to visit this website without telling the Provider who you are or revealing any  personal information about yourself, the User. However, you, the User, should  be aware that anonymous visitor information such as your IP address, browser  type, referring pages and pages visited on the website may be automatically  collected for statistical analysis of web traffic patterns.<br></span>     Provider receives various types of information (“the Information”)  from Users who access the Website, including personal information as detailed  in the Promotion of Access to Information Act (“PAIA”), Act 2 of 2000, and as  detailed in s 1 of ECTA (hereinafter referred to “Personal Information”).<br>Provider may electronically collect, store and use Personal Information,  including such information as your IP address, browser type, referring pages and  pages visited on the website for statistical analysis of web traffic patterns.      Provider voluntarily subscribes to s 51 of ECTA and endeavours to  treat Personal Information received by Provider accordingly. Whenever User is  of the opinion that Provider fails to comply with s 51 of ECTA, User shall  contact Provider by sending an email to peter@music2mendia.net.<br>Provider will  review User’s representations made by email and, if within Provider’s sole and  absolute discretion advisable, take corrective action and in any event within  30 days respond to User, informing User about corrective actions taken, if any.      Despite such undertaking, it is possible for Internet-based  communications to be intercepted. Without the use of encryption, the Internet  is not a secure medium and privacy cannot be ensured. Internet e-mail is  vulnerable to interception and forging.<br>The Owners will not be responsible for  any damages you or any third party may suffer as a result of the transmission  of confidential or disclosed information that you make to the Owners and/or  Provider through the Internet, or that you expressly or implicitly authorise  the Owners to make, or for any errors or any changes made to any transmitted  information. To ensure acquaintance with and awareness of the privacy measures  and policies of Provider, the User is urged to take care to read and understand  the underlying privacy clauses incorporated in these Terms and Conditions:     Privacy:  casual  surfing     The User may visit the Website without providing any personal  information. The User accordingly hereby grants express written permission for  the Website servers in such instances collecting the IP address of the User  computer, but not the email address or any other distinguishing information.<br>This information is aggregated to measure the number of visits, average time  spent at the Website, pages viewed, etc. Provider uses this information to  determine use of the Website, and to improve content thereon. Provider assumes  no obligation to protect this information, and may copy, distribute or otherwise  use such information without limitation     Privacy:  unsolicited  information      If the User posts unsolicited content or other information (“the  Information”) to the Website, and unless otherwise indicated, then the User  grants to the Owners a non-exclusive, royalty-free, perpetual, irrevocable, and  fully sub-licensable right to use, reproduce, modify, adapt, publish, translate,  create derivative works from, distribute, and display such Information  throughout the world in any media.<br>The User grants to the Owners the right to  use the name that the User submits in connection with such Information, if they  choose. The User warrants that the User owns or otherwise controls all of the  rights to the Information that the User posts; that the Information is  accurate; that by the supply of the Information to Provider, the User does not  violate this Policy and does not infringe the rights of any person or entity;  and that the User indemnifies the Owners for all claims resulting from the  receipt by Provider of the Information the User supplies to it. Provider  reserves the right but not the obligation to monitor and edit or remove any  Information, where posted to public pages.<br>Provider takes no responsibility,  and assumes no liability for any Information posted by the User or any third  party.     Privacy:  solicited  information the User gives to Provider     Provider requires certain Personal Information necessary to process  transactions if the User requires any of Provider’s products or services.<br>Provider receives and stores all Information, including Personal Information  which the User enters on the Website or gives to Provider, in any other way. The  User may choose not to provide certain Personal Information, but that may limit  the services or products that the User may wish to obtain from this Provider.<br>Provider provides its products and services in conjunction with its affiliates  and subsidiaries. In this regard and unless specifically restricted by the User  from the license below, the User hereby and when entering into the specific  transactions in question expressly grants in writing to the Owners and the  Provider a non-exclusive, royalty-free, perpetual, irrevocable, and fully  sub-licensable right to use, reproduce, modify, adapt, publish, translate,  create derivative works from, distribute, and display such Information  throughout the world in any media for any purpose whatsoever, including without  limitation for example transactions with user, registration of user, etc. The  User’s Information that is required by affiliates and subsidiaries to give  effect to transactions that the User chooses to enter into is shared with those  entities.<br>Privacy:  promotional  information     Provider aspires to provide first-class  service to its customers, which necessitates Provider providing information to  the User regarding new services or special offers. In each instance, the User  is provided an opportunity to opt-out of such information circulars. For more  information send an email to   peter@music2mendia.net<br>Privacy:  business  transfers     Provider may enter into business arrangements whereby its customer  base is one of the more valued assets. In such an event, customer Information  will be one of the transferable assets.     Privacy:  lawful  purposes     When the Provider is served with due legal process requiring the  delivery of Personal Information, it has the legal duty to abide by that  demand, and will do so.<br>Provider may also impart Personal Information if  permitted or required to do so by law.     Privacy:  surveys  and statistical profiles     Provider understands that efficiency and customer care translates to  good service.<br>Provider may periodically conduct online customer care surveys to  facilitate the updating of service standards. When it conducts a survey,  Provider will inform the User how the information gathered will be used, and  will provide the User with the opportunity to opt-out from such surveys.<br>Notwithstanding the foregoing, Provider may chose to use Personal Information  to compile profiles for statistical purposes and may chose to trade with such  profiles and statistical data, as long as the profiles or statistical data  cannot be linked to any specific data subject, including the User, by a third  party.     Privacy:  storage     Personal Information will be stored for as long as it is used and  for a period of one year (twelve months) thereafter, together with a record of  the Personal Information and the specific purposes it was collected for.  Personal Information will be first be anonymized and then destroyed once it has  become obsolete.<br>Privacy:  interception     Subject to the Regulation of Interception of Communications Act  (“RICA”), Act no 70 of 2002, User agrees that Provider may intercept, block,  read, delete, disclose and use all communications sent or otherwise  communicated to Provider, its employees, directors and agents. User agrees that  his or her consent satisfies the requirements of ECTA and RICA for consent in  “writing” as defined.     Choice of Law:       This Website is controlled, operated and administered by Provider  from its offices as set out below within the Republic of South Africa. The  Providers make no representation that the Content is appropriate or available  for use in other locations or countries other than the Republic of South  Africa. Access to the Website from territories or countries where the Content  is illegal is prohibited. The User may not use this Website in violation of  South African export laws and regulations. If the User accesses this Website  from locations outside of South Africa, that User is responsible for compliance  with all local laws. These Terms and Conditions shall be governed by the laws  of the Republic of South Africa, and the User consents to the jurisdiction of  the appropriate court within the Republic of South Africa in the event of any  dispute. If any of the provisions of these Terms and Conditions are found by a  court of competent jurisdiction to be invalid or unenforceable, that provision  shall be enforced to the maximum extent permissible so as to give effect to the  intent of these Terms and Conditions, and the remainder of these Terms and  Conditions shall continue in full force and effect.<br><br>These Terms and Conditions  constitute the entire agreement between the Provider and the User with regard  to the use of the Content and this Website.     Contact  Details:       In the event that you need to contact Provider/Supplier for purposes  related to these Terms and Conditions, please use the following:     <br><br>Email: peterpiegl@me.com     <span>Physical Address:<br>43 Pebble  Lake, Florin Road, Wilgeheuwel,</span>     <span>Postal Address:<br>P O Box  1445, Wilgeheuwel, 1735</span>     © MUSIC2MEDIA (2010)<br>', 'en'),
(7, 'gong', 'test', 'asdf123', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `m2m_user`
--

CREATE TABLE IF NOT EXISTS `m2m_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `activationKey` varchar(128) NOT NULL DEFAULT '',
  `createtime` int(10) NOT NULL DEFAULT '0',
  `lastvisit` int(10) NOT NULL DEFAULT '0',
  `lastaction` int(10) NOT NULL DEFAULT '0',
  `lastpasswordchange` int(10) NOT NULL DEFAULT '0',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `approved` int(1) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  `notifyType` enum('None','Digest','Instant','Threshold') DEFAULT 'Instant',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `status` (`status`),
  KEY `superuser` (`superuser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `m2m_user`
--

INSERT INTO `m2m_user` (`id`, `username`, `password`, `salt`, `activationKey`, `createtime`, `lastvisit`, `lastaction`, `lastpasswordchange`, `superuser`, `status`, `approved`, `published`, `avatar`, `notifyType`) VALUES
(1, 'admin', '2d92aead1ecbd68b81e67844abcbea02325dc4c760e9afb155ac9560e96a24008597014acfbc179e4e43a9cb63dee64d33ff6ff795f9f5f7337027eb19bae8e4', '1cKpqyPTh3pnytonuQzaxIomnzuLwDVN/rhfCtF78pmyPlB7oSwV2SVvI0pjsuXdsIkrUM+4xcwi4oM8BZG+wg==', 'edbd335ae87994b37ed2a9211183a4425c20d186f66ec3ac060f914778c6544eb0da45c783ec68587720148f7c7d2beba2ffb1e40843624146cce5370f0e24f5', 1335171345, 1414339003, 1414342360, 0, 1, 1, 0, 1, '', 'Instant'),
(2, 'peter', '2b7d157bdf6b0968c69695d8d1d3eb95a495bbd98d1bbe3da52167ae0689cbdce8d1fb32102052632bf1a4b6f2547d715fbf48b4701df42d0ed7d9b43604576b', 'iVz0Sl+EWFq+KjhL6cHIS+pYMIcZtBdiaFgqTvOFzfkGymGpod65wQCQNJzWsL5jOQ2C1SVCHWpdHYf9wn8H+g==', '1', 1394197762, 1395658986, 0, 1394197762, 0, 1, 1, 1, NULL, 'Instant'),
(35, 'r', '6a25e7028a5c8e7e110c8190c9fabfc0d29620427a0970d1497ca8f914de75241e9ca5cb3e83b0976f488753206ad160122db612bf2a9a96507914407d77ea14', '26JlJs3mfteUkKoGPymmgbeW7Tt28DHeoZKHZhrWrbFx/FfOkLn4pzZKceSilyUUADFNuWu4ALxdx7ugMrXrUA==', 'e1ab0195322bfbf6a3b6c09bd91c8255b76582cace6e3ac3eb25d2d4c29c546dd209b3039cd90e853fb6e9d731a35a99865d7e73dcd8430807d6feaefa9a3608', 1392452435, 1404202698, 1404202704, 1392452435, 0, 1, 1, 1, NULL, 'Instant'),
(36, 'p', '3194f54fe3645c63c9a2d9429031ee0db7133cf9bdd02d0c6652915fd08e0c690e5e49df70457a84c083ea342e8380f40c9d9b1d560f9032e167dc4431258a1a', 'THfa/Demy74kFNr8yip8lTH6ATWAIIVUNT/cgtLJSA+3uUEq8tkHEUtrnQRw1QXy6jvlr9n/3qzZV3W1CatdHA==', 'f1474bf56f49fc02a2eaf0a1de3c6129b3e33823d71d5335b8d6d15b559db4448f3c2953246cd25a1a6f848bffc820bc8d752f750f1f8f4a82631fc336f700a0', 1392647405, 1406381995, 1406382588, 1392647405, 0, 1, 1, 1, NULL, 'Instant'),
(37, 'test', '7e7db0d285a87ce52d73306f7c5b807bdf0398f3f731d1781972d8e8bbf2658b7e0687c934c9283cb6d86bc8a91147f8500dee1b0787c90bab5cfd4b938adb51', 'J/0VSG62r4ZFj1V9WM6pGW9O4Pr/4hC+22M8FwbA/TaY2ZaMu3OJAz/GUggEPVT1FIpy05VIf1cpB6N3AEsqqg==', '4b698363769798c95be6bd798c61f2a7699400ce36d86086c53ed5435c45e1f1a526a0184309a14993a0fd0323ac9b96ea8a7b83730117618b52da2209811113', 1392783259, 0, 0, 1392783259, 0, 1, 1, 1, NULL, 'Instant'),
(38, 'djAllie', '2d92aead1ecbd68b81e67844abcbea02325dc4c760e9afb155ac9560e96a24008597014acfbc179e4e43a9cb63dee64d33ff6ff795f9f5f7337027eb19bae8e4', '1cKpqyPTh3pnytonuQzaxIomnzuLwDVN/rhfCtF78pmyPlB7oSwV2SVvI0pjsuXdsIkrUM+4xcwi4oM8BZG+wg==', 'c46ded904d927ceaf95b464a40c4b3e855716f98fa826f60008104b08dac3f2d6502e52b3bb5cd70c1d8ae2915df6ad4eeebdd0e886c25cb63dc8e1a690c2a98', 1395058060, 0, 1395058497, 1395058060, 0, 1, 1, 1, NULL, 'Instant'),
(39, 'test2', '266fb21b1f4323771b3eac8d8ae7865d37b6b084250a523539c0c07ab53c421c78bb806c97347c5e9378700928dbc84f9370f8bee33f2aab94c5bc05f6ad1735', '8bpnJXzfNpwFbfbGA9JjGwcWpak1OU/IuX/SYLs04zeYIoAd9WnHf0ct6vPMWU2H3T93i21C7DEg8jCWpyU9fg==', 'a584bab6da4f01d1adfd8c5cd3967fde14882f538030ecd2be50870672c3935eccad5a0e744dcb45ab4821556cb0370f173f5fdf5351e7833badfec69613e5a9', 1406375830, 0, 0, 1406375830, 0, 0, 0, 0, NULL, 'Instant'),
(40, 'test3', '761a82444c4ac1bca3cbac1bebd791b55392736e2d8edbd5717917bfda320f991280929d8c764b81b071c327ab3f538a4209e9dfe27454173976fcc9c93d721b', 'Ja33BseKO7JuREjUk7Rwl8MF3+UPOwRqxNB2TH8WN3m19XFGyNkMbycxHBY458M6XnlzQ6sfXrY8utAKTTsUfw==', '6cf39ffd81d72c2c6197540a149f24838426e8fded9d10ca58dfb075abfae1d4bb3fdcf975581d40078951c94b464606260d45fbf16cab52d0799be298e38a70', 1406375860, 0, 0, 1406375860, 0, 0, 0, 0, NULL, 'Instant');

-- --------------------------------------------------------

--
-- Table structure for table `m2m_userTest`
--

CREATE TABLE IF NOT EXISTS `m2m_userTest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  `userId` int(11) unsigned NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `retypePassword` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `capatcha` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `termsAndConditions` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `m2m_userTest`
--

INSERT INTO `m2m_userTest` (`id`, `created`, `modified`, `userId`, `username`, `email`, `password`, `retypePassword`, `role`, `capatcha`, `termsAndConditions`) VALUES
(1, '2014-03-07', '0000-00-00', 0, 'peter', 'almagestfraternite@gmail.com', 'almagest', 'almagest', 'reporter', 'fiwiyu', '1'),
(2, '2014-03-07', '0000-00-00', 0, 'peter', 'almagestfraternite@gmail.com', 'almagest', 'almagest', 'reporter', 'fiwiyu', '1'),
(3, '2014-03-17', '0000-00-00', 0, 'DJ Allie', 'alistair@searchfusion.co.za', '123!Slam', '123!Slam', 'producer', 'fizexo', '1'),
(4, '2014-03-17', '0000-00-00', 0, 'DJ Allie', 'alistair@searchfusion.co.za', '123!slam', '123!slam', 'producer', 'fff', '0'),
(5, '2014-03-17', '0000-00-00', 0, 'DJ ALlie', 'alistair@searchfusion.co.za', '123!Slam', '123!slam', 'producer', 'asdasd', '0'),
(6, '2014-03-17', '0000-00-00', 0, 'djAllie', 'alistair@searchfusion.co.za', '123!Slam', '123!Slam', 'producer', 'fizexo', '1'),
(7, '2014-03-17', '0000-00-00', 0, 'djAllie', 'alistair@searchfusion.co.za', '123!Slam', '12312313', 'producer', 'fizexo', '1');

-- --------------------------------------------------------

--
-- Table structure for table `m2m_user_group`
--

CREATE TABLE IF NOT EXISTS `m2m_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `participants` text,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `m2m_user_group_message`
--

CREATE TABLE IF NOT EXISTS `m2m_user_group_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `m2m_user_role`
--

CREATE TABLE IF NOT EXISTS `m2m_user_role` (
  `userId` int(10) unsigned NOT NULL,
  `roleId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `m2m_user_role`
--

INSERT INTO `m2m_user_role` (`userId`, `roleId`) VALUES
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17);

-- --------------------------------------------------------

--
-- Table structure for table `m2m_visit`
--

CREATE TABLE IF NOT EXISTS `m2m_visit` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (userId) REFERENCES m2m_user(id)',
  `postId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (postId) REFERENCES m2m_item(id)',
  `type` varchar(16) NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `postId` (`postId`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `m2m_vote`
--

CREATE TABLE IF NOT EXISTS `m2m_vote` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (postId) REFERENCES m2m_item(id)',
  `userId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (userId) REFERENCES m2m_user(id)',
  `approve` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `m2m_vote`
--

INSERT INTO `m2m_vote` (`id`, `fileId`, `userId`, `approve`) VALUES
(1, 53, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migration`
--

CREATE TABLE IF NOT EXISTS `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_migration`
--

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1377335738),
('m130801_123544_drawing_refactor', 1377605385),
('m130830_083838_pagedescription', 1377852134),
('m130830_084322_post_tables', 1377852628),
('m130830_092934_remove_garticle', 1377855245),
('m130830_094328_add_fontawesome', 1377855972),
('m130830_104518_add_garticle', 1377859991),
('m130830_124807_remove_friend', 1377866940);

-- --------------------------------------------------------

--
-- Table structure for table `YiiSession`
--

CREATE TABLE IF NOT EXISTS `YiiSession` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `YiiSession`
--

INSERT INTO `YiiSession` (`id`, `expire`, `data`) VALUES
('456knk3tqmc4kh1vtr3sb0bb47', 1414342480, 0x66346639616564323339343238386532353639646330363461313566633636635f5f69647c733a313a2231223b66346639616564323339343238386532353639646330363461313566633636635f5f6e616d657c733a353a2261646d696e223b663466396165643233393432383865323536396463303634613135666336366369647c733a313a2231223b66346639616564323339343238386532353639646330363461313566633636635f5f7374617465737c613a313a7b733a323a226964223b623a313b7d726566726573687c623a313b),
('q169def4puh51uu9fl47k29uu2', 1414345960, 0x66346639616564323339343238386532353639646330363461313566633636635f5f69647c733a313a2231223b66346639616564323339343238386532353639646330363461313566633636635f5f6e616d657c733a353a2261646d696e223b663466396165643233393432383865323536396463303634613135666336366369647c733a313a2231223b66346639616564323339343238386532353639646330363461313566633636635f5f7374617465737c613a313a7b733a323a226964223b623a313b7d726566726573687c623a313b),
('uk60ffsfmngb5014scte9pv5s2', 1414344635, 0x66346639616564323339343238386532353639646330363461313566633636635f5f69647c733a313a2231223b66346639616564323339343238386532353639646330363461313566633636635f5f6e616d657c733a353a2261646d696e223b663466396165643233393432383865323536396463303634613135666336366369647c733a313a2231223b66346639616564323339343238386532353639646330363461313566633636635f5f7374617465737c613a313a7b733a323a226964223b623a313b7d726566726573687c623a313b);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
