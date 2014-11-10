-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 26, 2014 at 04:01 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `m2m`
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
-- Table structure for table `copy_config`
--

CREATE TABLE IF NOT EXISTS `copy_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL,
  `fields` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_account`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_account` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `size` bigint(40) NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `copy_m2m_account`
--

INSERT INTO `copy_m2m_account` (`id`, `size`, `userId`, `created`, `modified`) VALUES
(1, 5189288, 1, '0000-00-00 00:00:00', '2014-06-30 23:52:47'),
(2, 32354677, 36, '0000-00-00 00:00:00', '2014-04-12 00:35:50'),
(3, 8260697, 2, '2014-03-14 13:53:52', '2014-03-14 13:54:16');

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_action`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `comment` text,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `copy_m2m_action`
--

INSERT INTO `copy_m2m_action` (`id`, `title`, `comment`, `subject`) VALUES
(28, 'GUserUpdate', NULL, NULL),
(29, 'GInvoiceUpdate', NULL, NULL),
(30, 'GAccountUpdate', NULL, NULL),
(31, 'GTranslationUpdate', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_custom_url`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_custom_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(256) NOT NULL,
  `url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `copy_m2m_custom_url`
--

INSERT INTO `copy_m2m_custom_url` (`id`, `path`, `url`) VALUES
(1, '/page/post/admin', '/newspaper');

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_file`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_file` (
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
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=158 ;

--
-- Dumping data for table `copy_m2m_file`
--

INSERT INTO `copy_m2m_file` (`id`, `type`, `filename`, `mime`, `created`, `modified`, `weight`, `view`, `edit`, `delete`, `userId`) VALUES
(115, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 18:29:54', '2014-06-30 18:29:54', NULL, 'P', 'P', 'P', 1),
(79, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:28:13', '2014-06-30 17:28:13', NULL, 'P', 'P', 'P', 36),
(78, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:28:07', '2014-06-30 17:28:08', NULL, 'P', 'P', 'P', 36),
(77, 'audio', '07. Illegal Substances And Enarxis - Way Home.mp3', '', '2014-06-30 17:26:44', NULL, NULL, 'P', 'P', 'P', 36),
(76, 'audio', '08. Illegal Substances - The Quack.mp3', '', '2014-06-30 17:25:55', NULL, NULL, 'P', 'P', 'P', 36),
(75, 'audio', '06. Enarxis - Transilence Thought Unifier (Illegal Substances rmx).mp3', '', '2014-06-30 17:22:12', NULL, NULL, 'P', 'P', 'P', 36),
(74, 'audio', '04. Illegal Substances - Matter of time.mp3', '', '2014-06-30 17:21:40', NULL, NULL, 'P', 'P', 'P', 36),
(73, 'audio', '09. Illegal Substances - Tradition (Chapter II).mp3', '', '2014-06-30 17:16:00', NULL, NULL, 'P', 'P', 'P', 36),
(82, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:29:39', '2014-06-30 17:29:39', NULL, 'P', 'P', 'P', 36),
(84, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:30:30', '2014-06-30 17:30:30', NULL, 'P', 'P', 'P', 36),
(85, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:30:47', '2014-06-30 17:30:48', NULL, 'P', 'P', 'P', 36),
(86, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:32:05', '2014-06-30 17:32:05', NULL, 'P', 'P', 'P', 36),
(88, 'audio', '05. Illegal Substances - Loud.mp3', '', '2014-06-30 17:32:21', NULL, NULL, 'P', 'P', 'P', 36),
(89, 'audio', '06. Enarxis - Transilence Thought Unifier (Illegal Substances rmx).mp3', '', '2014-06-30 17:32:25', NULL, NULL, 'P', 'P', 'P', 36),
(90, 'audio', '07. Illegal Substances And Enarxis - Way Home.mp3', '', '2014-06-30 17:32:29', NULL, NULL, 'P', 'P', 'P', 36),
(91, 'audio', '08. Illegal Substances - The Quack.mp3', '', '2014-06-30 17:32:34', NULL, NULL, 'P', 'P', 'P', 36),
(92, 'audio', '09. Illegal Substances - Tradition (Chapter II).mp3', '', '2014-06-30 17:32:36', NULL, NULL, 'P', 'P', 'P', 36),
(93, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:34:27', '2014-06-30 17:34:28', NULL, 'P', 'P', 'P', 36),
(94, 'audio', '06. Enarxis - Transilence Thought Unifier (Illegal Substances rmx).mp3', '', '2014-06-30 17:35:04', NULL, NULL, 'P', 'P', 'P', 36),
(95, 'audio', '07. Illegal Substances And Enarxis - Way Home.mp3', '', '2014-06-30 17:35:30', NULL, NULL, 'P', 'P', 'P', 36),
(96, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:36:05', '2014-06-30 17:36:05', NULL, 'P', 'P', 'P', 36),
(97, 'audio', '06. Enarxis - Transilence Thought Unifier (Illegal Substances rmx).mp3', '', '2014-06-30 17:36:12', NULL, NULL, 'P', 'P', 'P', 36),
(98, 'audio', '03. Illegal Substances And Argonnight - Night Substances.mp3', '', '2014-06-30 17:36:20', NULL, NULL, 'P', 'P', 'P', 36),
(114, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 18:28:47', '2014-06-30 18:28:47', NULL, 'P', 'P', 'P', 1),
(118, 'audio', 'Benny Benassi - Satisfaction.mp3', '', '2014-06-30 23:31:59', NULL, NULL, 'P', 'P', 'P', 1),
(119, 'audio', 'Brooklyn Bounce - Get Ready to Bounce.mp3', '', '2014-06-30 23:59:06', NULL, NULL, 'P', 'P', 'P', 1),
(120, 'audio', '4 Clubbers - Children (club radio edit).mp3', '', '2014-07-01 00:01:22', NULL, NULL, 'P', 'P', 'P', 1),
(121, 'image', 'AlbumArt_{3A9C8532-FF1C-4C5A-9A86-B97373764685}_Large.jpg', 'image/jpg', '2014-07-01 00:01:24', '2014-07-01 00:01:24', NULL, 'P', 'P', 'P', 1),
(122, 'image', 'AlbumArt_{3A9C8532-FF1C-4C5A-9A86-B97373764685}_Small.jpg', 'image/jpg', '2014-07-01 00:01:25', '2014-07-01 00:01:25', NULL, 'P', 'P', 'P', 1),
(123, 'image', 'AlbumArt_{5AC78F81-8873-4D9F-ADFF-B2D4002B9797}_Large.jpg', 'image/jpg', '2014-07-01 00:01:26', '2014-07-01 00:01:27', NULL, 'P', 'P', 'P', 1),
(124, 'image', 'AlbumArt_{5AC78F81-8873-4D9F-ADFF-B2D4002B9797}_Small.jpg', 'image/jpg', '2014-07-01 00:01:27', '2014-07-01 00:01:27', NULL, 'P', 'P', 'P', 1),
(125, 'image', 'AlbumArt_{36DCCA19-BBBF-401B-99EB-BD80B9C927F7}_Large.jpg', 'image/jpg', '2014-07-01 00:01:28', '2014-07-01 00:01:28', NULL, 'P', 'P', 'P', 1),
(126, 'image', 'AlbumArt_{36DCCA19-BBBF-401B-99EB-BD80B9C927F7}_Small.jpg', 'image/jpg', '2014-07-01 00:01:29', '2014-07-01 00:01:29', NULL, 'P', 'P', 'P', 1),
(127, 'image', 'AlbumArt_{72DDF99C-F7D8-4176-BE36-B9B312E5E1CF}_Large.jpg', 'image/jpg', '2014-07-01 00:01:30', '2014-07-01 00:01:30', NULL, 'P', 'P', 'P', 1),
(128, 'image', 'AlbumArt_{72DDF99C-F7D8-4176-BE36-B9B312E5E1CF}_Small.jpg', 'image/jpg', '2014-07-01 00:01:31', '2014-07-01 00:01:31', NULL, 'P', 'P', 'P', 1),
(129, 'image', 'AlbumArt_{316BF3D9-9CEA-418A-AE26-2607680B4D3B}_Large.jpg', 'image/jpg', '2014-07-01 00:01:32', '2014-07-01 00:01:32', NULL, 'P', 'P', 'P', 1),
(130, 'image', 'AlbumArt_{316BF3D9-9CEA-418A-AE26-2607680B4D3B}_Small.jpg', 'image/jpg', '2014-07-01 00:01:33', '2014-07-01 00:01:33', NULL, 'P', 'P', 'P', 1),
(131, 'image', 'AlbumArt_{744A574E-9047-4BBA-8E37-A0D1B8DEAAAA}_Large.jpg', 'image/jpg', '2014-07-01 00:01:34', '2014-07-01 00:01:34', NULL, 'P', 'P', 'P', 1),
(132, 'image', 'AlbumArt_{744A574E-9047-4BBA-8E37-A0D1B8DEAAAA}_Small.jpg', 'image/jpg', '2014-07-01 00:01:34', '2014-07-01 00:01:34', NULL, 'P', 'P', 'P', 1),
(133, 'image', 'AlbumArt_{1066D0E4-5EEC-4ED7-B0B1-457531E9187E}_Large.jpg', 'image/jpg', '2014-07-01 00:01:35', '2014-07-01 00:01:35', NULL, 'P', 'P', 'P', 1),
(134, 'image', 'AlbumArt_{1066D0E4-5EEC-4ED7-B0B1-457531E9187E}_Small.jpg', 'image/jpg', '2014-07-01 00:01:36', '2014-07-01 00:01:36', NULL, 'P', 'P', 'P', 1),
(135, 'image', 'AlbumArt_{53589FE2-C5C4-4B01-A146-801AAA342CDE}_Large.jpg', 'image/jpg', '2014-07-01 00:01:37', '2014-07-01 00:01:37', NULL, 'P', 'P', 'P', 1),
(136, 'image', 'AlbumArt_{53589FE2-C5C4-4B01-A146-801AAA342CDE}_Small.jpg', 'image/jpg', '2014-07-01 00:01:37', '2014-07-01 00:01:37', NULL, 'P', 'P', 'P', 1),
(137, 'image', 'AlbumArt_{B89C4B11-7C10-47EF-B0B4-65C45E62F0AE}_Large.jpg', 'image/jpg', '2014-07-01 00:01:39', '2014-07-01 00:01:39', NULL, 'P', 'P', 'P', 1),
(138, 'image', 'AlbumArt_{B89C4B11-7C10-47EF-B0B4-65C45E62F0AE}_Small.jpg', 'image/jpg', '2014-07-01 00:01:40', '2014-07-01 00:01:40', NULL, 'P', 'P', 'P', 1),
(139, 'image', 'AlbumArt_{BA8BB327-D877-4A40-B556-ABCC9E2F30D2}_Large.jpg', 'image/jpg', '2014-07-01 00:01:42', '2014-07-01 00:01:42', NULL, 'P', 'P', 'P', 1),
(140, 'image', 'AlbumArt_{BA8BB327-D877-4A40-B556-ABCC9E2F30D2}_Small.jpg', 'image/jpg', '2014-07-01 00:01:42', '2014-07-01 00:01:43', NULL, 'P', 'P', 'P', 1),
(141, 'image', 'AlbumArt_{CE913839-FD33-41C6-8E58-0502032794F3}_Large.jpg', 'image/jpg', '2014-07-01 00:01:43', '2014-07-01 00:01:44', NULL, 'P', 'P', 'P', 1),
(142, 'image', 'AlbumArt_{CE913839-FD33-41C6-8E58-0502032794F3}_Small.jpg', 'image/jpg', '2014-07-01 00:01:44', '2014-07-01 00:01:44', NULL, 'P', 'P', 'P', 1),
(143, 'image', 'AlbumArt_{D3990C71-842C-436F-A32D-F82C3DCD9550}_Large.jpg', 'image/jpg', '2014-07-01 00:01:45', '2014-07-01 00:01:45', NULL, 'P', 'P', 'P', 1),
(144, 'image', 'AlbumArt_{D3990C71-842C-436F-A32D-F82C3DCD9550}_Small.jpg', 'image/jpg', '2014-07-01 00:01:46', '2014-07-01 00:01:46', NULL, 'P', 'P', 'P', 1),
(145, 'image', 'AlbumArt_{E7BBB74A-B3FB-4EE6-B007-9E6BCE36BFA8}_Large.jpg', 'image/jpg', '2014-07-01 00:01:47', '2014-07-01 00:01:47', NULL, 'P', 'P', 'P', 1),
(146, 'image', 'AlbumArt_{E7BBB74A-B3FB-4EE6-B007-9E6BCE36BFA8}_Small.jpg', 'image/jpg', '2014-07-01 00:01:47', '2014-07-01 00:01:48', NULL, 'P', 'P', 'P', 1),
(147, 'image', 'AlbumArt_{F50E5C54-492D-49FF-A958-0068547F2726}_Large.jpg', 'image/jpg', '2014-07-01 00:01:48', '2014-07-01 00:01:49', NULL, 'P', 'P', 'P', 1),
(148, 'image', 'AlbumArt_{F50E5C54-492D-49FF-A958-0068547F2726}_Small.jpg', 'image/jpg', '2014-07-01 00:01:49', '2014-07-01 00:01:49', NULL, 'P', 'P', 'P', 1),
(149, 'image', 'AlbumArtSmall.jpg', 'image/jpg', '2014-07-01 00:01:50', '2014-07-01 00:01:50', NULL, 'P', 'P', 'P', 1),
(150, 'audio', 'Alex Gaudino%20 Example%20 Divine Inspiration - I''m In Love%20 Kickstarts%20 The Way (Put Your Hand In My Hand).mp3', '', '2014-07-01 00:01:51', NULL, NULL, 'P', 'P', 'P', 1),
(151, 'audio', 'Aqua - My Oh My.mp3', '', '2014-07-01 00:03:40', NULL, NULL, 'P', 'P', 'P', 1),
(152, 'audio', 'ATB - Don''t Stop.mp3', '', '2014-07-01 00:04:20', NULL, NULL, 'P', 'P', 'P', 1),
(153, 'audio', 'Avicii - Levels (radio edit).mp3', '', '2014-07-01 00:07:51', NULL, NULL, 'P', 'P', 'P', 1),
(154, 'audio', 'Benny Benassi - Satisfaction.mp3', '', '2014-07-01 00:08:39', NULL, NULL, 'P', 'P', 'P', 1),
(155, 'audio', 'Bingo Players - Cry (Just a Little) (original mix).mp3', '', '2014-07-01 00:14:08', NULL, NULL, 'P', 'P', 'P', 1),
(156, 'audio', 'Brooklyn Bounce - Bass, Beats & Melody (Pulsedriver remix).mp3', '', '2014-07-01 00:19:58', NULL, NULL, 'P', 'P', 'P', 1),
(157, 'audio', 'Brooklyn Bounce - Bass, Beats and Melody.mp3', '', '2014-07-01 00:22:05', NULL, NULL, 'P', 'P', 'P', 1);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_file_audio`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_file_audio` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=31 ;

--
-- Dumping data for table `copy_m2m_file_audio`
--

INSERT INTO `copy_m2m_file_audio` (`id`, `title`, `artist`, `album`, `year`, `comment`, `track`, `genre`, `fileId`) VALUES
(1, 'Could you be loved', 'Bob Marley', 'Unknown Album', NULL, NULL, NULL, 'Other', 39),
(2, 'Test of MP3 File', 'Me', 'Me', '2006', 'test', '1', 'Other', 43),
(3, 'Test of MP3 File', 'Me', 'Me', '2006', 'test', '1', 'Other', 44),
(4, 'Test of MP3 File', 'Me', 'Me', '2006', 'test', '1', 'Other', 48),
(5, 'Test of MP3 File', 'Me', 'Me', '2006', 'test', '1', 'Other', 62),
(7, 'Tradition (Chapter II)', 'Illegal Substances', 'Tradition', '2013', NULL, '9', 'Psychedelic', 73),
(8, 'Matter Of Time', 'Illegal Substances', 'Tradition', '2013', NULL, '4', 'Psychedelic', 74),
(9, 'Transilence Thought Unifier (Illegal Substances Rmx)', 'Enarxis', 'Tradition', '2013', NULL, '6', 'Psychedelic', 75),
(10, 'The Quack', 'Illegal Substances', 'Tradition', '2013', NULL, '8', 'Psychedelic', 76),
(11, 'Way Home', 'Illegal Substances And Enarxis', 'Tradition', '2013', NULL, '7', 'Psychedelic', 77),
(12, 'Loud', 'Illegal Substances', 'Tradition', '2013', NULL, '5', 'Psychedelic', 88),
(13, 'Transilence Thought Unifier (Illegal Substances Rmx)', 'Enarxis', 'Tradition', '2013', NULL, '6', 'Psychedelic', 89),
(14, 'Way Home', 'Illegal Substances And Enarxis', 'Tradition', '2013', NULL, '7', 'Psychedelic', 90),
(15, 'The Quack', 'Illegal Substances', 'Tradition', '2013', NULL, NULL, 'Psychedelic', 91),
(16, 'Transilence Thought Unifier (Illegal Substances Rmx)', 'Enarxis', 'Tradition', '2013', NULL, '6', 'Psychedelic', 94),
(17, 'Way Home', 'Illegal Substances And Enarxis', 'Tradition', '2013', NULL, '7', 'Psychedelic', 95),
(18, 'Transilence Thought Unifier (Illegal Substances Rmx)', 'Enarxis', 'Tradition', '2013', NULL, '6', 'Psychedelic', 97),
(19, 'Night Substances', 'Illegal Substances And Argonnight', 'Tradition', '2013', NULL, '3', 'Psychedelic', 98),
(20, 'Benny Benassi - Satisfaction.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 118),
(21, 'Get Ready To Bounce', 'Brooklyn Bounce', 'Unknown Album', NULL, NULL, NULL, 'Club', 119),
(22, 'Children (Club Radio Edit)', '4 Clubbers', 'Children', '2001', 'Amazon.com Song ID: 215055176', '1', 'Other', 120),
(23, 'Alex Gaudino%20 Example%20 Divine Inspiration - I''m In Love%20 Kickstarts%20 The Way (Put Your Hand In My Hand).mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 150),
(24, 'My Oh My', 'Aqua', 'Aquarium', '1997', NULL, '2', 'Pop', 151),
(25, 'ATB - Don''t Stop.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 152),
(26, 'Avicii - Levels / ID (Radio Edit)', 'Unknown Artist', 'Unknown Album', '2011', 'www.dvdvideosoft.com', '1', NULL, 153),
(27, 'Benny Benassi - Satisfaction.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 154),
(28, 'Cry (Just A Little) (Original Mix)', 'Bingo Players', 'Cry (Just A Little)', '2011', NULL, '2', 'Other', 155),
(29, 'Bass, Beats &amp; Melody (Pulsedriver Remix)', 'Brooklyn Bounce', 'Bass, Beats &amp; Melody CDS', '2000', '::xMS::', '4', 'Techno', 156),
(30, 'Bass, Beats and Melody', 'Brooklyn Bounce', 'Total Groove 2: The Best in R&amp;B (disc 2)', '2008', 'www.piratebay.org', '4', 'Other', 157);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_file_image`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_file_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `alt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=184 ;

--
-- Dumping data for table `copy_m2m_file_image`
--

INSERT INTO `copy_m2m_file_image` (`id`, `fileId`, `width`, `height`, `type`, `alt`) VALUES
(4, 78, 128, 128, 's', ''),
(5, 78, 300, 300, 'm', ''),
(6, 78, 600, 600, 'l', ''),
(7, 79, 128, 128, 's', ''),
(8, 79, 300, 300, 'm', ''),
(9, 79, 600, 600, 'l', ''),
(90, 115, 600, 600, 'l', ''),
(89, 115, 300, 300, 'm', ''),
(88, 115, 128, 128, 's', ''),
(16, 82, 128, 128, 's', ''),
(17, 82, 300, 300, 'm', ''),
(18, 82, 600, 600, 'l', ''),
(22, 84, 128, 128, 's', ''),
(23, 84, 300, 300, 'm', ''),
(24, 84, 600, 600, 'l', ''),
(25, 85, 128, 128, 's', ''),
(26, 85, 300, 300, 'm', ''),
(27, 85, 600, 600, 'l', ''),
(28, 86, 128, 128, 's', ''),
(29, 86, 300, 300, 'm', ''),
(30, 86, 600, 600, 'l', ''),
(34, 93, 128, 128, 's', ''),
(35, 93, 300, 300, 'm', ''),
(36, 93, 600, 600, 'l', ''),
(37, 96, 128, 128, 's', ''),
(38, 96, 300, 300, 'm', ''),
(39, 96, 600, 600, 'l', ''),
(85, 114, 128, 128, 's', ''),
(86, 114, 300, 300, 'm', ''),
(87, 114, 600, 600, 'l', ''),
(99, 121, 600, 600, 'l', ''),
(98, 121, 300, 300, 'm', ''),
(97, 121, 128, 128, 's', ''),
(101, 122, 300, 300, 'm', ''),
(100, 122, 128, 128, 's', ''),
(102, 122, 600, 600, 'l', ''),
(103, 123, 128, 128, 's', ''),
(104, 123, 300, 300, 'm', ''),
(105, 123, 600, 600, 'l', ''),
(106, 124, 128, 128, 's', ''),
(107, 124, 300, 300, 'm', ''),
(108, 124, 600, 600, 'l', ''),
(109, 125, 128, 128, 's', ''),
(110, 125, 300, 300, 'm', ''),
(111, 125, 600, 600, 'l', ''),
(112, 126, 128, 128, 's', ''),
(113, 126, 300, 300, 'm', ''),
(114, 126, 600, 600, 'l', ''),
(115, 127, 128, 128, 's', ''),
(116, 127, 300, 300, 'm', ''),
(117, 127, 600, 600, 'l', ''),
(118, 128, 128, 128, 's', ''),
(119, 128, 300, 300, 'm', ''),
(120, 128, 600, 600, 'l', ''),
(121, 129, 128, 128, 's', ''),
(122, 129, 300, 300, 'm', ''),
(123, 129, 600, 600, 'l', ''),
(124, 130, 128, 128, 's', ''),
(125, 130, 300, 300, 'm', ''),
(126, 130, 600, 600, 'l', ''),
(127, 131, 128, 128, 's', ''),
(128, 131, 300, 300, 'm', ''),
(129, 131, 600, 600, 'l', ''),
(130, 132, 128, 128, 's', ''),
(131, 132, 300, 300, 'm', ''),
(132, 132, 600, 600, 'l', ''),
(133, 133, 128, 128, 's', ''),
(134, 133, 300, 300, 'm', ''),
(135, 133, 600, 600, 'l', ''),
(136, 134, 128, 128, 's', ''),
(137, 134, 300, 300, 'm', ''),
(138, 134, 600, 600, 'l', ''),
(139, 135, 128, 128, 's', ''),
(140, 135, 300, 300, 'm', ''),
(141, 135, 600, 600, 'l', ''),
(142, 136, 128, 128, 's', ''),
(143, 136, 300, 300, 'm', ''),
(144, 136, 600, 600, 'l', ''),
(145, 137, 128, 128, 's', ''),
(146, 137, 300, 300, 'm', ''),
(147, 137, 600, 600, 'l', ''),
(148, 138, 128, 128, 's', ''),
(149, 138, 300, 300, 'm', ''),
(150, 138, 600, 600, 'l', ''),
(151, 139, 128, 128, 's', ''),
(152, 139, 300, 300, 'm', ''),
(153, 139, 600, 600, 'l', ''),
(154, 140, 128, 128, 's', ''),
(155, 140, 300, 300, 'm', ''),
(156, 140, 600, 600, 'l', ''),
(157, 141, 128, 128, 's', ''),
(158, 141, 300, 300, 'm', ''),
(159, 141, 600, 600, 'l', ''),
(160, 142, 128, 128, 's', ''),
(161, 142, 300, 300, 'm', ''),
(162, 142, 600, 600, 'l', ''),
(163, 143, 128, 128, 's', ''),
(164, 143, 300, 300, 'm', ''),
(165, 143, 600, 600, 'l', ''),
(166, 144, 128, 128, 's', ''),
(167, 144, 300, 300, 'm', ''),
(168, 144, 600, 600, 'l', ''),
(169, 145, 128, 128, 's', ''),
(170, 145, 300, 300, 'm', ''),
(171, 145, 600, 600, 'l', ''),
(172, 146, 128, 128, 's', ''),
(173, 146, 300, 300, 'm', ''),
(174, 146, 600, 600, 'l', ''),
(175, 147, 128, 128, 's', ''),
(176, 147, 300, 300, 'm', ''),
(177, 147, 600, 600, 'l', ''),
(178, 148, 128, 128, 's', ''),
(179, 148, 300, 300, 'm', ''),
(180, 148, 600, 600, 'l', ''),
(181, 149, 128, 128, 's', ''),
(182, 149, 300, 300, 'm', ''),
(183, 149, 600, 600, 'l', '');

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_form`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `copy_m2m_form`
--

INSERT INTO `copy_m2m_form` (`id`, `name`, `created`, `modified`, `elementId`) VALUES
(1, 'registration', '2013-11-20', '2014-03-02', 0);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_friendship`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_friendship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inviterId` int(11) NOT NULL,
  `friendId` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `copy_m2m_friendship`
--

INSERT INTO `copy_m2m_friendship` (`id`, `inviterId`, `friendId`, `status`, `modified`, `created`, `message`) VALUES
(7, 35, 36, 2, NULL, '2014-03-04 00:24:42', ''),
(8, 1, 36, 1, NULL, '2014-06-29 16:16:02', '');

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_invoice`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_invoice` (
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
-- Dumping data for table `copy_m2m_invoice`
--

INSERT INTO `copy_m2m_invoice` (`id`, `size`, `rate`, `userId`, `created`, `sent`, `paid`) VALUES
(4, 3074048, 2, 1, '0000-00-00 00:00:00', 0, 0),
(5, 239554107, 23, 1, '2014-06-29 16:15:33', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_membership`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_membership` (
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
-- Dumping data for table `copy_m2m_membership`
--

INSERT INTO `copy_m2m_membership` (`id`, `roleId`, `userId`, `payment_id`, `order_date`, `end_date`, `name`, `street`, `zipcode`, `city`, `payment_date`, `subscribed`) VALUES
(9, 12, 35, 1, 1392452436, 2147483647, NULL, NULL, NULL, NULL, NULL, 0),
(12, 11, 36, 1, 1392452436, 2147483647, NULL, NULL, NULL, NULL, NULL, 0),
(13, 12, 38, 1, 1394197780, 2147483647, NULL, NULL, NULL, NULL, NULL, 0),
(14, 11, 38, 1, 1395058062, 2147483647, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_message`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_message` (
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
-- Dumping data for table `copy_m2m_message`
--

INSERT INTO `copy_m2m_message` (`id`, `created`, `modified`, `fromUserId`, `toUserId`, `subject`, `message`, `read`, `answered`, `draft`) VALUES
(9, '2014-03-04 10:02:25', '2014-03-07 12:37:59', 35, 36, 'test', '321', 1, 0, 0),
(11, '2014-06-30 10:50:49', '0000-00-00 00:00:00', 1, 1, 'sdfg', 'asdf', 0, 0, 0),
(12, '2014-06-30 16:30:28', '2014-06-30 16:31:40', 35, 36, 'asdf', 'asdf', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_payment`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `copy_m2m_payment`
--

INSERT INTO `copy_m2m_payment` (`id`, `title`, `text`) VALUES
(1, 'Prepayment', NULL),
(2, 'Paypal', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_permission`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `actionId` int(11) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `copy_m2m_permission`
--

INSERT INTO `copy_m2m_permission` (`id`, `roleId`, `actionId`, `description`) VALUES
(1, 13, 28, NULL),
(2, 14, 30, NULL),
(3, 15, 29, NULL),
(4, 16, 31, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_post`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_post` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci AUTO_INCREMENT=179 ;

--
-- Dumping data for table `copy_m2m_post`
--

INSERT INTO `copy_m2m_post` (`id`, `title`, `summary`, `content`, `view`, `edit`, `delete`, `created`, `modified`, `coverId`, `userId`) VALUES
(146, 'Title', 'Biatch', NULL, 'P', 'P', '*', '2014-03-14 13:53:21', '2014-03-14 13:53:35', NULL, 2),
(154, 'Click here to enter a titleasdf', 'Click here enter a brief summaryasdf', 'fasdClick here enter a post content', 'P', 'P', '*', '2014-04-11 16:50:59', '2014-06-30 16:32:03', NULL, 36),
(178, '', NULL, NULL, 'P', 'P', 'P', '2014-06-30 09:52:50', '2014-06-30 23:30:35', 115, 1);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_post_file`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_post_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `postId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1062 ;

--
-- Dumping data for table `copy_m2m_post_file`
--

INSERT INTO `copy_m2m_post_file` (`id`, `type`, `postId`, `fileId`, `weight`) VALUES
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
(1061, 'audio', 178, 157, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_privacysetting`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_privacysetting` (
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
-- Dumping data for table `copy_m2m_privacysetting`
--

INSERT INTO `copy_m2m_privacysetting` (`userId`, `message_new_friendship`, `message_new_message`, `message_new_profilecomment`, `appear_in_search`, `show_online_status`, `log_profile_visits`, `ignore_users`, `public_profile_fields`) VALUES
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
(39, 1, 1, 1, 1, 1, 1, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_profile`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_profile` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `copy_m2m_profile`
--

INSERT INTO `copy_m2m_profile` (`id`, `userId`, `timestamp`, `privacy`, `lastname`, `firstname`, `show_friends`, `allow_comments`, `email`, `company`, `telephone`, `address`, `city`, `state`, `zip`, `country`) VALUES
(1, 1, '2014-06-30 11:28:55', 'protected', 'admin', 'admin123asfasdfassssfd', 1, 1, 'a@a.c', 'Almagest Fraternite', '1111111111111', 'Ghost Street', 'Durban', 'KZNasdf', 4000, 'ds'),
(2, 2, '2013-02-18 00:06:30', 'protected', 'Nel', 'Alistair', 1, 1, 'alistair@blahblahblah.co.za', 'test', '27393192111', 'test', 'test', 'KZN', 4000, 'ZA'),
(35, 35, '2014-06-30 14:31:03', 'protected', 'James', 'Reporter', 1, 1, 'r@r.com', 'Almagest Fraternite', '0723557267', 'P.O. Box 1008', 'Belfast', 'Kwazulu Natal', 1100, 'ZA'),
(36, 36, '2014-06-30 11:28:44', 'protected', 'Vos', 'Producer', 1, 1, 'almagestfraternite@gmail.com', 'Production Company', '0723557267', 'P.O. Box 1008', 'Middelburg', 'Mpumalanga', 1100, 'US'),
(37, 37, '0000-00-00 00:00:00', 'protected', '', '', 1, 1, 'jvos@lando.co.za', '', '', '', '', '', 0, ''),
(38, 38, '2014-03-10 09:38:12', 'protected', '', '', 1, 1, 'a@gmail.com', '', '', '', '', '', 0, ''),
(39, 38, '0000-00-00 00:00:00', 'protected', '', '', 1, 1, 'alistair@searchfusion.co.za', '', '', '', '', '', 0, ''),
(40, 39, '0000-00-00 00:00:00', 'protected', 'test', 'test', 1, 1, 't@t.c', 'test', '0123456789', 'asdf', 'Belfast', 'asdf', 234, 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_profile_comment`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_profile_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_profile_field`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_profile_field` (
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
-- Dumping data for table `copy_m2m_profile_field`
--

INSERT INTO `copy_m2m_profile_field` (`id`, `varname`, `title`, `hint`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `position`, `visible`, `related_field_name`) VALUES
(1, 'email', 'E-Mail', '', 'VARCHAR', 255, 0, 0, '', '', '', 'CEmailValidator', '', 0, 2, ''),
(2, 'firstname', 'First name', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 3, ''),
(3, 'lastname', 'Last name', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 3, ''),
(9, 'telephone', 'Contact Number', '', 'VARCHAR', 13, 10, 0, '', '', '', '', '', 0, 4, ''),
(14, 'company', 'Company', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 4, ''),
(15, 'address', 'Address', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 4, ''),
(18, 'zip', 'Zip/Postal Code', '', 'VARCHAR', 28, 2, 0, '', '', '', '', '', 0, 4, ''),
(20, 'country', 'Country Code (eg. ZA)', '', 'VARCHAR', 3, 2, 0, '', '', '', '', '', 0, 4, ''),
(21, 'city', 'City', 'Your city of origin.', 'VARCHAR', 255, 4, 0, '', '', '', '', '', 0, 4, ''),
(22, 'state', 'Province/State', 'Province or state of origin.', 'VARCHAR', 255, 3, 0, '', '', '', '', '', 0, 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_profile_visit`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_profile_visit` (
  `visitor_id` int(11) NOT NULL,
  `visited_id` int(11) NOT NULL,
  `timestamp_first_visit` int(11) NOT NULL,
  `timestamp_last_visit` int(11) NOT NULL,
  `num_of_visits` int(11) NOT NULL,
  PRIMARY KEY (`visitor_id`,`visited_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `copy_m2m_profile_visit`
--

INSERT INTO `copy_m2m_profile_visit` (`visitor_id`, `visited_id`, `timestamp_first_visit`, `timestamp_last_visit`, `num_of_visits`) VALUES
(1, 2, 1335171800, 1337652058, 11),
(1, 3, 1335179541, 1337135324, 41),
(1, 4, 1337132241, 1337646718, 22),
(2, 1, 1336575805, 1336576270, 4),
(4, 1, 1336661711, 1337148523, 8),
(4, 2, 1336661708, 1337146605, 2);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_role`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double NOT NULL COMMENT 'Price (when using membership module)',
  `duration` int(11) NOT NULL COMMENT 'How long a membership is valid',
  `registration` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `copy_m2m_role`
--

INSERT INTO `copy_m2m_role` (`id`, `title`, `description`, `price`, `duration`, `registration`) VALUES
(11, 'Producer', 'null', 123, 321, 1),
(12, 'Reporter', 'null', 321, 321, 1),
(13, 'UserManager', '', 1, 365, 0),
(14, 'AccountManager', NULL, 0, 0, 0),
(15, 'InvoiceManager', NULL, 0, 0, 0),
(16, 'SiteManager', NULL, 0, 0, 0),
(17, 'ElementManager', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_site_page`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_site_page` (
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
-- Dumping data for table `copy_m2m_site_page`
--

INSERT INTO `copy_m2m_site_page` (`id`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`) VALUES
(5, 'upload', '@', '', '', '2013-02-17 00:00:00', '2014-06-05 16:59:03', 0, 1),
(11, 'about_us', '*', 'null', 'null', '2013-08-31 17:47:59', '2014-06-05 16:59:03', 2, 1),
(12, 'landing', '*', 'null', 'null', '2014-02-26 14:07:41', '2014-06-05 16:59:03', 1, 1),
(14, 'profile', '*', NULL, NULL, '2014-06-05 14:50:22', '2014-06-05 16:59:03', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_site_page_element`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_site_page_element` (
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
-- Dumping data for table `copy_m2m_site_page_element`
--

INSERT INTO `copy_m2m_site_page_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
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
-- Table structure for table `copy_m2m_site_template`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_site_template` (
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
-- Dumping data for table `copy_m2m_site_template`
--

INSERT INTO `copy_m2m_site_template` (`id`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`) VALUES
(2, 'template', '*', '', '', '2013-02-17 00:00:00', '2014-04-28 03:26:24', 1, 1),
(9, 'printTemplate', 'none', '', '', '2013-07-11 00:00:00', '2014-03-07 00:15:44', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_site_template_element`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_site_template_element` (
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
-- Dumping data for table `copy_m2m_site_template_element`
--

INSERT INTO `copy_m2m_site_template_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
(3, 2, 'GHeader', 'header', '', '', '{"tag":"div"}', NULL, NULL, '*', 'SUPER', '', '2013-02-17 00:00:00', '2014-06-29 15:49:35', 0, 2, 1),
(4, 1, 'GImage', 'logoImage', '', '', '{"alt":"Music2Media Logo","htmlOptions":{"class":"logo"},"src":"\\/themes\\/m2m\\/images\\/music2media_logo.png"}', NULL, NULL, '*', 'SUPER', '', '2013-08-12 00:00:00', '2014-06-29 15:49:35', 1, 2, 1),
(5, 1, 'GTag', 'logoText', 'music<span class="logospan">2</span>media.net', '', '{"htmlOptions":{"class":"SiteTitle"},"tag":"h1"}', NULL, NULL, '*', 'SUPER', '', '2013-08-12 00:00:00', '2014-06-29 15:49:35', 2, 2, 1),
(12, 3, 'GHeader', 'headerEnd', '', '', '[]', NULL, NULL, '*', 'SUPER', 'null', '2013-06-27 00:00:00', '2014-06-29 15:49:35', 5, 2, 1),
(13, 1, 'GBusyPrompt', 'loading', '', '', '{"loadingImage":"\\/themes\\/m2m\\/images\\/ajax-loader.gif","loadingText":"","savingImage":"\\/themes\\/m2m\\/images\\/ajax-loader.gif","savingText":""}', NULL, NULL, '*', 'SUPER', '', '2013-07-10 00:00:00', '2014-06-29 15:49:35', 8, 2, 1),
(14, 1, 'GBrowserWarning', 'browserNotification', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2013-07-10 00:00:00', '2014-06-29 15:49:35', 11, 2, 1),
(15, 1, 'GTag', 'loadingShadow', '', '', '{"htmlOptions":{"class":"fullscreen saving loading\\u00a0browserNotification"}}', NULL, NULL, '*', 'SUPER', '', '2013-07-10 00:00:00', '2014-06-29 15:49:35', 10, 2, 1),
(17, 1, 'GTabs', 'tabs', '', '', '{"items":[{"linkOptions":{"class":"searchTab"},"icon":"glyphicon glyphicon-headphones glyphicon-2x","url":"\\/index.php","view":"*"},{"icon":"glyphicon glyphicon-user glyphicon-2x","url":"\\/gong\\/user\\/profile\\/update","view":"@"},{"linkOptions":{"class":"uploadTab"},"icon":"glyphicon glyphicon-upload glyphicon-2x","url":"\\/page\\/upload","view":"Producer"},{"icon":"glyphicon glyphicon-info-sign glyphicon-2x","url":"\\/page\\/about_us"},{"icon":"glyphicon glyphicon-envelope glyphicon-2x","view":"g","url":"\\/site\\/contact"},{"type":"login","icon":"glyphicon glyphicon-off glyphicon-2x"}],"tabsOptions":{"placement":"left"}}', NULL, NULL, '*', 'SUPER', '', '2013-02-17 00:00:00', '2014-06-29 15:49:35', 6, 2, 1),
(44, 1, 'GTag', 'footer', 'music2media.net  ™', '', '{"htmlOptions":{"class":"Footer"}}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-27 17:15:11', '2014-06-29 15:49:35', 9, 2, 1),
(58, 1, 'GLink', 'inspectorLink', '<i class="glyphicon glyphicon-wrench glyphicon-2x"></i>', '', '{"htmlOptions":{"class":"InspectorLink"},"url":"\\/gong\\/site\\/template\\/list"}', NULL, NULL, 'SUPER', 'SUPER', 'null', '2013-08-31 13:18:57', '2014-06-29 15:49:35', 4, 2, 32),
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
-- Table structure for table `copy_m2m_site_view`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_site_view` (
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
-- Dumping data for table `copy_m2m_site_view`
--

INSERT INTO `copy_m2m_site_view` (`id`, `module`, `controller`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`, `parentId`) VALUES
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
-- Table structure for table `copy_m2m_site_view_element`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_site_view_element` (
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
-- Dumping data for table `copy_m2m_site_view_element`
--

INSERT INTO `copy_m2m_site_view_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
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
(680, 1, 'GSubmitButton', 'submit', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-19 01:33:27', '2014-06-23 12:50:36', 20, 231, 1),
(681, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-19 01:33:27', '2014-06-23 12:50:37', 21, 231, 1),
(682, 1, 'GTextField', 'firstname', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 6, 231, 1),
(683, 1, 'GTextField', 'lastname', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 7, 231, 1),
(684, 1, 'GEmailField', 'email', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 8, 231, 1),
(685, 1, 'GTextField', 'company', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 15, 231, 1),
(686, 1, 'GTextField', 'telephone', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 16, 231, 1),
(687, 1, 'GTextField', 'address', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 18, 231, 1),
(688, 1, 'GTextField', 'city', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 13, 231, 1),
(689, 1, 'GTextField', 'state', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 12, 231, 1),
(690, 1, 'GTextField', 'zip', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 14, 231, 1),
(691, 1, 'GTextField', 'country', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-19 01:44:03', '2014-06-23 12:50:36', 11, 231, 1),
(700, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 18:09:23', '2014-05-22 18:15:14', 0, 234, 1),
(701, 1, 'GTextField', 'module', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 18:09:23', '2014-05-22 18:15:14', 1, 234, 1),
(702, 1, 'GTextField', 'controller', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 18:09:23', '2014-05-22 18:15:14', 2, 234, 1),
(703, 1, 'GTextField', 'name', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 18:09:23', '2014-05-22 18:15:14', 3, 234, 1),
(704, 1, 'GTextField', 'parentModule', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 18:09:23', '2014-05-22 18:15:14', 4, 234, 1),
(705, 1, 'GTextField', 'parentName', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 18:09:23', '2014-05-22 18:15:14', 6, 234, 1),
(706, 1, 'GSubmitButton', 'submit', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 18:09:23', '2014-05-22 18:15:14', 7, 234, 1),
(707, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 18:09:23', '2014-05-22 18:15:14', 8, 234, 1),
(708, 1, 'GTextField', 'parentController', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 18:13:53', '2014-05-22 18:15:14', 5, 234, 1),
(709, 1, 'GCaptcha', 'verifyCode', '', '', '{"submission":"var:form"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:32:00', '2014-06-23 12:50:36', 19, 231, 1),
(710, 1, 'GPasswordField', 'verifyPassword', '', '', '{"submission":"var:form"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:36:07', '2014-06-23 12:50:36', 5, 231, 1),
(711, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-22 22:46:59', NULL, 0, 235, 1),
(715, 1, 'GTextField', 'firstname', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 4, 235, 1),
(716, 1, 'GTextField', 'lastname', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 5, 235, 1),
(717, 1, 'GEmailField', 'email', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 6, 235, 1),
(718, 1, 'GTextField', 'company', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 7, 235, 1),
(719, 1, 'GTextField', 'telephone', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 8, 235, 1),
(720, 1, 'GTextField', 'address', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 9, 235, 1),
(721, 1, 'GTextField', 'city', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 10, 235, 1),
(722, 1, 'GTextField', 'state', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 11, 235, 1),
(723, 1, 'GTextField', 'zip', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-22 22:46:59', NULL, 12, 235, 1),
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
(745, 1, 'GImage', 'Producer Image', '', '', '{"src":"/themes/m2m/images/profile_producer.png","htmlOptions":{"class":"pull-left"}}', NULL, NULL, 'producer', 'SUPER', NULL, '2014-06-20 16:58:35', '2014-06-20 17:02:50', NULL, 235, 1),
(746, 1, 'GImage', 'Reporter Image', '', '', '{"htmlOptions":{"class":"pull-left"},"src":"/themes/m2m/images/profile_reporter.png"}', NULL, NULL, 'reporter', 'SUPER', NULL, '2014-06-20 17:00:55', '2014-06-20 17:02:14', NULL, 235, 1),
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
-- Table structure for table `copy_m2m_site_view_map`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_site_view_map` (
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
-- Dumping data for table `copy_m2m_site_view_map`
--

INSERT INTO `copy_m2m_site_view_map` (`id`, `module`, `controller`, `name`, `parentModule`, `parentController`, `parentName`, `priority`) VALUES
(97, 'site', '*', '*', 'site', 'model', '*', 999),
(121, '*', 'view', 'create', '*', 'elementCollection', '*', 1),
(122, '*', 'viewElement', 'create', '*', 'element', '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_textsettings`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_textsettings` (
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
-- Dumping data for table `copy_m2m_textsettings`
--

INSERT INTO `copy_m2m_textsettings` (`id`, `language`, `text_email_registration`, `subject_email_registration`, `text_email_recovery`, `text_email_activation`, `text_friendship_new`, `text_friendship_confirmed`, `text_profilecomment_new`, `text_message_new`, `text_membership_ordered`, `text_payment_arrived`) VALUES
(1, 'en_us', 'Thank you for registering with IPP-Renewables the Bid Windows 3, 4 and 5 is open. After validating your details please kindly sign in and provide your project information. You can do this by clicking the following link:\n{activation_url}', 'IPP-Renewables User Registration', 'You have requested a new Password. To set your new Password,\n										please go to {recovery_url}', 'Your account has been activated. Thank you for registering. Please sign in to fill in Bid Window 3, 4 and 5.', 'New friendship Request from {username}: {message}. To accept or ignore this request, go to your friendship page: {link_friends} or go to your profile: {link_profile}', 'The User {username} has accepted your friendship request', 'You have a new profile comment from {username}: {message} visit your profile: {link_profile}', 'You have received a new message from {username}: {message}', 'Your order of membership {membership} on {order_date} has been taken. Your order \r\nNumber is {id}. You have choosen the payment style {payment}.', 'Your payment has been received on {payment_date} and your Membership {id} is now active'),
(2, 'de', 'Sie haben sich fÃÂÃÂÃÂÃÂ¼r unsere Applikation registriert. Bitte bestÃÂÃÂÃÂÃÂ¤tigen Sie ihre E-Mail adresse mit diesem Link: {activation_url}', 'Sie haben sich fÃÂÃÂÃÂÃÂ¼r eine Applikation registriert.', 'Sie haben ein neues Passwort angefordert. Bitte klicken Sie diesen link: {activation_url}', 'Ihr Konto wurde freigeschaltet.', 'Der Benutzer {username} hat Ihnen eine Freundschaftsanfrage gesendet. \n\n							 Nachricht: {message}\n\n							 Klicken sie <a href="{link_friends}">hier</a>, um diese Anfrage zu bestÃÂÃÂÃÂÃÂ¤tigen oder zu ignorieren. Alternativ kÃÂÃÂÃÂÃÂ¶nnen sie <a href="{link_profile}">hier</a> auf ihre Profilseite zugreifen.', 'Der Benutzer {username} hat ihre Freundschaftsanfrage bestÃÂÃÂÃÂÃÂ¤tigt.', '\n							 Benutzer {username} hat Ihnen eine Nachricht auf Ihrer Pinnwand hinterlassen: \n\n							 {message}\n\n							 <a href="{link}">hier</a> geht es direkt zu Ihrer Pinnwand!', 'Sie haben eine neue Nachricht von {username} bekommen: {\r\nmessage}', 'Ihre Bestellung der Mitgliedschaft {membership} wurde am {order_date} entgegen genommen. Die gewÃÂÃÂÃÂÃÂ¤hlte Zahlungsart ist {payment}. Die Auftragsnummer lautet {id}.', 'Ihre Zahlung wurde am {payment_date} entgegen genommen. Ihre Mitgliedschaft mit der Nummer {id} ist nun Aktiv.'),
(3, 'es', 'Te has registrado en esta aplicaciÃÂÃÂÃÂÃÂ³n. Para confirmar tu direcciÃÂÃÂÃÂÃÂ³n de correo electrÃÂÃÂÃÂÃÂ³nico, por favor, visita {activation_url}.', 'Te has registrado en esta aplicaciÃÂÃÂÃÂÃÂ³n.', 'Has solicitado una nueva contraseÃÂÃÂÃÂÃÂ±a. Para establecer una nueva contraseÃÂÃÂÃÂÃÂ±a, por favor ve a {activation_url}', 'Tu cuenta ha sido activada. Gracias por registrarte.', 'Has recibido una nueva solicitud de amistad de {user_from}: {message} Ve a tus contactos: {link}', 'Tienes un nuevo comentario en tu perfil de {username}: {message} visita tu perfil: {link}', 'Please translatore thisse hiere toh tha espagnola langsch {username}', 'Has recibido un mensaje de {username}: {message}', 'Tu orden de membresÃÂÃÂÃÂÃÂ­a {membership} de fecha {order_date} fuÃÂÃÂÃÂÃÂ© tomada. Tu nÃÂÃÂÃÂÃÂºmero de orden es {id}. Escogiste como modo de pago {payment}.', 'Tu pago fuÃÂÃÂÃÂÃÂ© recibido en fecha {payment_date}. Ahora tu MembresÃÂÃÂÃÂÃÂ­a {id} ya estÃÂÃÂÃÂÃÂ¡ activa'),
(4, 'fr', '', '', '', '', '', '', '', '', '', ''),
(5, 'ro', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_translation`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'gong',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `translation` text CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `language` varchar(5) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `copy_m2m_translation`
--

INSERT INTO `copy_m2m_translation` (`id`, `category`, `message`, `translation`, `language`) VALUES
(6, 'gong', 'Terms And Conditions', 'Website Terms and Conditions of Use:       These Terms and Conditions (“the Terms and Conditions”) govern your  (“the User”) use of the MUSIC2EDIA (“Provider”) website located at the domain  name <a target="_blank" rel="nofollow" href="http://www.music2media.net">www.music2media.net</a> (“the Website”).      By accessing and using the Website, the User agrees to be bound by  the Terms and Conditions set out in this legal notice. If the User does not  wish to be bound by these Terms and Conditions, the User may not access,  display, use, download, and/or otherwise copy or distribute Content obtained at  the Website.     Updating of these Terms  and Conditions:       Provider reserves the rights to change, modify, add to or remove  from portions or the whole of these Terms and Conditions from time to time.  Changes to these Terms and Conditions will become effective upon such changes  being posted to this Website. It is the User’s obligation to periodically check  these Terms and Conditions at the Website for changes or updates. The User’s  continued use of this Website following the posting of changes or updates will  be considered notice of the User’s acceptance to abide by and be bound by these  Terms and Conditions, including such changes or updates.     <span>Supplier of services  details:  <br><br>In accordance with the disclosure requirements of  the Electronic Communications and Transactions Act (“ECTA”), Act No 25 of 2005,  the supplier of goods and/or services offered for sale, hire or exchange by way  of an electronic transaction, makes the following information available to  consumers:</span>     <ul><li>Supplier is Music2Media CC (hereinafter referred to as “Supplier”),  a close corporation duly registered and existing under the laws of South Africa  with registration number: 2010/088984/23, with its physical address at No. 43  Pebble Lake, Florin Road, Wilgeheuwel. Supplier’s place of registration is No.  43 Pebble Lake, Florin Road, Wilgeheuwel and Supplier will accept legal service  at this given address. Supplier’s main member is: Mr. P Piegl. The main  business of Supplier is to facilitate the sharing of music-related content for  a closed group of subscribers and falls within the companies group of  Recreational, Cultural and Sporting Activities;</li>     </ul><ul><li>Supplier’s website is <a target="_blank" rel="nofollow" href="http://www.music2.media.net">www.music2.media.net</a> and its contact details  are located on the above mentioned website.</li>     </ul><ul><li>Goods and/or Services: The main business of Supplier is to  facilitate the sharing of music-related content for a closed group of  subscribers.</li>     </ul><ul><li>Terms and conditions of download: The Consumer or User will be  liable for the full price or fees where applicable including transport costs,  taxes and any other fees or costs, guarantees, and where guarantees can be  accessed and downloaded by consumers where such tariffs, fees and or prices  will be specified on the website in relation to the goods and services  provided. Goods and services offered through this website by Supplier are  strictly on an “as is” basis for a price, fee and or tariff as shall be  indicated. Warranties and representations are hereby expressly excluded.  Downloaded files cannot be returned. In case of defect, User may notify  Supplier within 24 hours of becoming aware of defect by email to the following  address: peterpiegl@me.com. User’s cooling-off rights under s 44 of ECTA  do not apply in terms of s 42 of ECTA, due to downloads being audio, or video  recordings, or software or newspapers, periodicals, magazines or books. </li>     </ul><ul><li>Payment:  Payment may be made  online by credit card through a sufficiently secure payment system, or in the  case of Registered Users (corporate users only), by virtue of a monthly debit  order that can be arranged by calling the following number +2782 411 7430. The  payment system allows for review, corrections and withdrawal by User prior to  placing a final order.</li>     </ul><ul><li>Complaints and disputes:  Supplier offers Users to file complaints via the contacting the supplier on the  following email address peterpiegl@me.com. Currently, Supplier does not  subscribe to any alternative dispute resolution code or mechanism. </li>     </ul>Copyright and Intellectual  Property Rights:       Provider provides certain information at the Website. Content  currently or anticipated to be displayed at this Website is provided by  Provider, its affiliates and/or subsidiary, or any other third party owners of  such content, and includes but is not limited to Literary Works, Musical Works,  Artistic Works, Sound Recordings, Cinematograph Films, Sound and Television  Broadcasts, Program-Carrying Signals, Published Editions and Computer Programs  (“the Content”). All such proprietary works, and the compilation of the proprietary  works, belong to the Provider, its affiliates or subsidiary, or any third party  owners of such rights (“the Owners”), and the Content protected by South  African and International copyright laws. The Providers reserve the right to  make any changes to the Website, the Content, or to products and/or services  offered through the Website at any times and without notice. All rights in and  to the Content is reserved and retained by the Owners. Except as specified in  these Terms and Conditions, the User is not granted a license or any other  right including without limitation under Copyright, Trademark, Patent or other  Intellectual Property Rights in or to the Content.     Limited License to General  Users:     <ul><li>Provider grants to the User,  subject to the further terms of these Terms and Conditions, a non-exclusive,  non-transferable, limited and revocable right to access, display, use, download  and otherwise copy the current and future Content for personal, non-commercial  and information purposes only. </li>     </ul><ul><li>This Website and the Content  may not be reproduced, duplicated, copied, resold, visited or otherwise  exploited for any commercial purpose without the express prior written consent  of Provider/Supplier.</li>     </ul><ul><li>The license does not allow the  User to collect product or service listings, descriptions or other information  displayed here, and does not allow any derivative use of this Website or the  Content for the benefit of another merchant.</li>     </ul><ul><li>The User may not frame nor use  framing technologies to enclose the Provider Website or the Content nor any  part thereof without the express written consent of Provider.</li>     </ul><ul><li>Provider and the Owners do not  offer products or services to minors. If you are under the age of 18, you may  not respond to or otherwise accept or act upon any offers in the Website. </li>     </ul><ul><li>Provider and the Owners, their  affiliates or subsidiary reserve the right to refuse service, terminate  accounts, remove or edit content, or cancel orders in their sole discretion.</li>     </ul><ul><li>Any unauthorised use terminates  this license.</li>     </ul>Limited License to  Registered Users:     Provider allows and processes the  registration of certain corporate users (“the Registered User”) at the Website.  If you believe that you are entitled to registration, please contact  peter@music2mendia.net     <ul><li>Subject to the further terms of  these Terms and Conditions, a non-exclusive, non-transferable, limited and  revocable right is granted to Registered Users to access, display, use,  download and otherwise copy the current and future Content for the purposes  agreed to by the Registered User and Provider in their respective agreements.</li>     </ul><ul><li>This Website and the Content  may only be reproduced, duplicated, copied, resold, visited or otherwise  exploited for the specific purposes set out in that agreement.</li>     </ul><ul><li>The license does not allow the Registered  User to collect product or service listings, descriptions or other information  displayed here, and does not allow any derivative use of this Website or the  Content for the benefit of another merchant.</li>     </ul><ul><li>The Registered User may not  frame nor use framing technologies to enclose the Provider Website or the  Content nor any part thereof without the express written consent of Provider.</li>     </ul><ul><li>Provider and the Owners, their  affiliates or subsidiary reserve the right in their sole discretion to refuse  service, terminate accounts, remove or edit content, or cancel orders in their  sole discretion.</li>     </ul><ul><li>Any unauthorised use terminates  this license.</li>     </ul>Limitation of liability:       Subject to sub-sections 43(5) and 43 (6) of ECTA, if applicable, and  to the extent permitted by law, the Website and all Content on the Website,  including any current or future offer of products or services, are provided on  an “as is” basis, and may include inaccuracies or typographical errors and  Provider, Owners, suppliers, employees, directors partners, affiliates and  agents shall not be liable for any damage, or loss or liability of any nature  incurred by whoever as a result of any action or omission.<br>The Owners make no  warranty or representation as to the availability, accuracy or completeness of  the Content, or any third-party content accessible via an Internet link.  Neither Provider nor any holding company, affiliate or subsidiary of Provider  or Owners, shall be held responsible for any direct or indirect special,  consequential or other damage of any kind whatsoever suffered or incurred,  related to the use of, or the inability to access or use the Content or the  Website or any functionality thereof, or of any linked website, even if  Provider is expressly advised thereof.<br>Privacy, access to and use  of information:       <span>Provider allows you  to visit this website without telling the Provider who you are or revealing any  personal information about yourself, the User. However, you, the User, should  be aware that anonymous visitor information such as your IP address, browser  type, referring pages and pages visited on the website may be automatically  collected for statistical analysis of web traffic patterns.<br></span>     Provider receives various types of information (“the Information”)  from Users who access the Website, including personal information as detailed  in the Promotion of Access to Information Act (“PAIA”), Act 2 of 2000, and as  detailed in s 1 of ECTA (hereinafter referred to “Personal Information”).<br>Provider may electronically collect, store and use Personal Information,  including such information as your IP address, browser type, referring pages and  pages visited on the website for statistical analysis of web traffic patterns.      Provider voluntarily subscribes to s 51 of ECTA and endeavours to  treat Personal Information received by Provider accordingly. Whenever User is  of the opinion that Provider fails to comply with s 51 of ECTA, User shall  contact Provider by sending an email to peter@music2mendia.net.<br>Provider will  review User’s representations made by email and, if within Provider’s sole and  absolute discretion advisable, take corrective action and in any event within  30 days respond to User, informing User about corrective actions taken, if any.      Despite such undertaking, it is possible for Internet-based  communications to be intercepted. Without the use of encryption, the Internet  is not a secure medium and privacy cannot be ensured. Internet e-mail is  vulnerable to interception and forging.<br>The Owners will not be responsible for  any damages you or any third party may suffer as a result of the transmission  of confidential or disclosed information that you make to the Owners and/or  Provider through the Internet, or that you expressly or implicitly authorise  the Owners to make, or for any errors or any changes made to any transmitted  information. To ensure acquaintance with and awareness of the privacy measures  and policies of Provider, the User is urged to take care to read and understand  the underlying privacy clauses incorporated in these Terms and Conditions:     Privacy:  casual  surfing     The User may visit the Website without providing any personal  information. The User accordingly hereby grants express written permission for  the Website servers in such instances collecting the IP address of the User  computer, but not the email address or any other distinguishing information.<br>This information is aggregated to measure the number of visits, average time  spent at the Website, pages viewed, etc. Provider uses this information to  determine use of the Website, and to improve content thereon. Provider assumes  no obligation to protect this information, and may copy, distribute or otherwise  use such information without limitation     Privacy:  unsolicited  information      If the User posts unsolicited content or other information (“the  Information”) to the Website, and unless otherwise indicated, then the User  grants to the Owners a non-exclusive, royalty-free, perpetual, irrevocable, and  fully sub-licensable right to use, reproduce, modify, adapt, publish, translate,  create derivative works from, distribute, and display such Information  throughout the world in any media.<br>The User grants to the Owners the right to  use the name that the User submits in connection with such Information, if they  choose. The User warrants that the User owns or otherwise controls all of the  rights to the Information that the User posts; that the Information is  accurate; that by the supply of the Information to Provider, the User does not  violate this Policy and does not infringe the rights of any person or entity;  and that the User indemnifies the Owners for all claims resulting from the  receipt by Provider of the Information the User supplies to it. Provider  reserves the right but not the obligation to monitor and edit or remove any  Information, where posted to public pages.<br>Provider takes no responsibility,  and assumes no liability for any Information posted by the User or any third  party.     Privacy:  solicited  information the User gives to Provider     Provider requires certain Personal Information necessary to process  transactions if the User requires any of Provider’s products or services.<br>Provider receives and stores all Information, including Personal Information  which the User enters on the Website or gives to Provider, in any other way. The  User may choose not to provide certain Personal Information, but that may limit  the services or products that the User may wish to obtain from this Provider.<br>Provider provides its products and services in conjunction with its affiliates  and subsidiaries. In this regard and unless specifically restricted by the User  from the license below, the User hereby and when entering into the specific  transactions in question expressly grants in writing to the Owners and the  Provider a non-exclusive, royalty-free, perpetual, irrevocable, and fully  sub-licensable right to use, reproduce, modify, adapt, publish, translate,  create derivative works from, distribute, and display such Information  throughout the world in any media for any purpose whatsoever, including without  limitation for example transactions with user, registration of user, etc. The  User’s Information that is required by affiliates and subsidiaries to give  effect to transactions that the User chooses to enter into is shared with those  entities.<br>Privacy:  promotional  information     Provider aspires to provide first-class  service to its customers, which necessitates Provider providing information to  the User regarding new services or special offers. In each instance, the User  is provided an opportunity to opt-out of such information circulars. For more  information send an email to   peter@music2mendia.net<br>Privacy:  business  transfers     Provider may enter into business arrangements whereby its customer  base is one of the more valued assets. In such an event, customer Information  will be one of the transferable assets.     Privacy:  lawful  purposes     When the Provider is served with due legal process requiring the  delivery of Personal Information, it has the legal duty to abide by that  demand, and will do so.<br>Provider may also impart Personal Information if  permitted or required to do so by law.     Privacy:  surveys  and statistical profiles     Provider understands that efficiency and customer care translates to  good service.<br>Provider may periodically conduct online customer care surveys to  facilitate the updating of service standards. When it conducts a survey,  Provider will inform the User how the information gathered will be used, and  will provide the User with the opportunity to opt-out from such surveys.<br>Notwithstanding the foregoing, Provider may chose to use Personal Information  to compile profiles for statistical purposes and may chose to trade with such  profiles and statistical data, as long as the profiles or statistical data  cannot be linked to any specific data subject, including the User, by a third  party.     Privacy:  storage     Personal Information will be stored for as long as it is used and  for a period of one year (twelve months) thereafter, together with a record of  the Personal Information and the specific purposes it was collected for.  Personal Information will be first be anonymized and then destroyed once it has  become obsolete.<br>Privacy:  interception     Subject to the Regulation of Interception of Communications Act  (“RICA”), Act no 70 of 2002, User agrees that Provider may intercept, block,  read, delete, disclose and use all communications sent or otherwise  communicated to Provider, its employees, directors and agents. User agrees that  his or her consent satisfies the requirements of ECTA and RICA for consent in  “writing” as defined.     Choice of Law:       This Website is controlled, operated and administered by Provider  from its offices as set out below within the Republic of South Africa. The  Providers make no representation that the Content is appropriate or available  for use in other locations or countries other than the Republic of South  Africa. Access to the Website from territories or countries where the Content  is illegal is prohibited. The User may not use this Website in violation of  South African export laws and regulations. If the User accesses this Website  from locations outside of South Africa, that User is responsible for compliance  with all local laws. These Terms and Conditions shall be governed by the laws  of the Republic of South Africa, and the User consents to the jurisdiction of  the appropriate court within the Republic of South Africa in the event of any  dispute. If any of the provisions of these Terms and Conditions are found by a  court of competent jurisdiction to be invalid or unenforceable, that provision  shall be enforced to the maximum extent permissible so as to give effect to the  intent of these Terms and Conditions, and the remainder of these Terms and  Conditions shall continue in full force and effect.<br><br>These Terms and Conditions  constitute the entire agreement between the Provider and the User with regard  to the use of the Content and this Website.     Contact  Details:       In the event that you need to contact Provider/Supplier for purposes  related to these Terms and Conditions, please use the following:     <br><br>Email: peterpiegl@me.com     <span>Physical Address:<br>43 Pebble  Lake, Florin Road, Wilgeheuwel,</span>     <span>Postal Address:<br>P O Box  1445, Wilgeheuwel, 1735</span>     © MUSIC2MEDIA (2010)<br>', 'en'),
(7, 'gong', 'test', 'asdf123', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_user`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_user` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `copy_m2m_user`
--

INSERT INTO `copy_m2m_user` (`id`, `username`, `password`, `salt`, `activationKey`, `createtime`, `lastvisit`, `lastaction`, `lastpasswordchange`, `superuser`, `status`, `approved`, `published`, `avatar`, `notifyType`) VALUES
(1, 'admin', '2d92aead1ecbd68b81e67844abcbea02325dc4c760e9afb155ac9560e96a24008597014acfbc179e4e43a9cb63dee64d33ff6ff795f9f5f7337027eb19bae8e4', '1cKpqyPTh3pnytonuQzaxIomnzuLwDVN/rhfCtF78pmyPlB7oSwV2SVvI0pjsuXdsIkrUM+4xcwi4oM8BZG+wg==', 'edbd335ae87994b37ed2a9211183a4425c20d186f66ec3ac060f914778c6544eb0da45c783ec68587720148f7c7d2beba2ffb1e40843624146cce5370f0e24f5', 1335171345, 1404164582, 1404166990, 0, 1, 1, 0, 1, '', 'Instant'),
(2, 'peter', '2b7d157bdf6b0968c69695d8d1d3eb95a495bbd98d1bbe3da52167ae0689cbdce8d1fb32102052632bf1a4b6f2547d715fbf48b4701df42d0ed7d9b43604576b', 'iVz0Sl+EWFq+KjhL6cHIS+pYMIcZtBdiaFgqTvOFzfkGymGpod65wQCQNJzWsL5jOQ2C1SVCHWpdHYf9wn8H+g==', '1', 1394197762, 1395658986, 0, 1394197762, 0, 1, 1, 1, NULL, 'Instant'),
(35, 'r', '6a25e7028a5c8e7e110c8190c9fabfc0d29620427a0970d1497ca8f914de75241e9ca5cb3e83b0976f488753206ad160122db612bf2a9a96507914407d77ea14', '26JlJs3mfteUkKoGPymmgbeW7Tt28DHeoZKHZhrWrbFx/FfOkLn4pzZKceSilyUUADFNuWu4ALxdx7ugMrXrUA==', 'e1ab0195322bfbf6a3b6c09bd91c8255b76582cace6e3ac3eb25d2d4c29c546dd209b3039cd90e853fb6e9d731a35a99865d7e73dcd8430807d6feaefa9a3608', 1392452435, 1404145180, 1404145183, 1392452435, 0, 1, 1, 1, NULL, 'Instant'),
(36, 'p', '3194f54fe3645c63c9a2d9429031ee0db7133cf9bdd02d0c6652915fd08e0c690e5e49df70457a84c083ea342e8380f40c9d9b1d560f9032e167dc4431258a1a', 'THfa/Demy74kFNr8yip8lTH6ATWAIIVUNT/cgtLJSA+3uUEq8tkHEUtrnQRw1QXy6jvlr9n/3qzZV3W1CatdHA==', 'f1474bf56f49fc02a2eaf0a1de3c6129b3e33823d71d5335b8d6d15b559db4448f3c2953246cd25a1a6f848bffc820bc8d752f750f1f8f4a82631fc336f700a0', 1392647405, 1404145174, 1404145177, 1392647405, 0, 1, 1, 1, NULL, 'Instant'),
(37, 'test', '7e7db0d285a87ce52d73306f7c5b807bdf0398f3f731d1781972d8e8bbf2658b7e0687c934c9283cb6d86bc8a91147f8500dee1b0787c90bab5cfd4b938adb51', 'J/0VSG62r4ZFj1V9WM6pGW9O4Pr/4hC+22M8FwbA/TaY2ZaMu3OJAz/GUggEPVT1FIpy05VIf1cpB6N3AEsqqg==', '4b698363769798c95be6bd798c61f2a7699400ce36d86086c53ed5435c45e1f1a526a0184309a14993a0fd0323ac9b96ea8a7b83730117618b52da2209811113', 1392783259, 0, 0, 1392783259, 0, 1, 1, 1, NULL, 'Instant'),
(38, 'djAllie', '2d92aead1ecbd68b81e67844abcbea02325dc4c760e9afb155ac9560e96a24008597014acfbc179e4e43a9cb63dee64d33ff6ff795f9f5f7337027eb19bae8e4', '1cKpqyPTh3pnytonuQzaxIomnzuLwDVN/rhfCtF78pmyPlB7oSwV2SVvI0pjsuXdsIkrUM+4xcwi4oM8BZG+wg==', 'c46ded904d927ceaf95b464a40c4b3e855716f98fa826f60008104b08dac3f2d6502e52b3bb5cd70c1d8ae2915df6ad4eeebdd0e886c25cb63dc8e1a690c2a98', 1395058060, 0, 1395058497, 1395058060, 0, 1, 1, 1, NULL, 'Instant');

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_userTest`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_userTest` (
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
-- Dumping data for table `copy_m2m_userTest`
--

INSERT INTO `copy_m2m_userTest` (`id`, `created`, `modified`, `userId`, `username`, `email`, `password`, `retypePassword`, `role`, `capatcha`, `termsAndConditions`) VALUES
(1, '2014-03-07', '0000-00-00', 0, 'peter', 'almagestfraternite@gmail.com', 'almagest', 'almagest', 'reporter', 'fiwiyu', '1'),
(2, '2014-03-07', '0000-00-00', 0, 'peter', 'almagestfraternite@gmail.com', 'almagest', 'almagest', 'reporter', 'fiwiyu', '1'),
(3, '2014-03-17', '0000-00-00', 0, 'DJ Allie', 'alistair@searchfusion.co.za', '123!Slam', '123!Slam', 'producer', 'fizexo', '1'),
(4, '2014-03-17', '0000-00-00', 0, 'DJ Allie', 'alistair@searchfusion.co.za', '123!slam', '123!slam', 'producer', 'fff', '0'),
(5, '2014-03-17', '0000-00-00', 0, 'DJ ALlie', 'alistair@searchfusion.co.za', '123!Slam', '123!slam', 'producer', 'asdasd', '0'),
(6, '2014-03-17', '0000-00-00', 0, 'djAllie', 'alistair@searchfusion.co.za', '123!Slam', '123!Slam', 'producer', 'fizexo', '1'),
(7, '2014-03-17', '0000-00-00', 0, 'djAllie', 'alistair@searchfusion.co.za', '123!Slam', '12312313', 'producer', 'fizexo', '1');

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_user_group`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `participants` text,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_user_group_message`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_user_group_message` (
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
-- Table structure for table `copy_m2m_user_role`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_user_role` (
  `userId` int(10) unsigned NOT NULL,
  `roleId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `copy_m2m_user_role`
--

INSERT INTO `copy_m2m_user_role` (`userId`, `roleId`) VALUES
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17);

-- --------------------------------------------------------

--
-- Table structure for table `copy_m2m_visit`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_visit` (
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
-- Table structure for table `copy_m2m_vote`
--

CREATE TABLE IF NOT EXISTS `copy_m2m_vote` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (postId) REFERENCES m2m_item(id)',
  `userId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (userId) REFERENCES m2m_user(id)',
  `approve` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `copy_m2m_vote`
--

INSERT INTO `copy_m2m_vote` (`id`, `fileId`, `userId`, `approve`) VALUES
(1, 53, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `copy_tbl_migration`
--

CREATE TABLE IF NOT EXISTS `copy_tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `copy_tbl_migration`
--

INSERT INTO `copy_tbl_migration` (`version`, `apply_time`) VALUES
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
-- Table structure for table `copy_YiiSession`
--

CREATE TABLE IF NOT EXISTS `copy_YiiSession` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `copy_YiiSession`
--

INSERT INTO `copy_YiiSession` (`id`, `expire`, `data`) VALUES
('9sko3dl0vmnt817dm92hqav054', 1404170590, 0x31346230656338333561326633343431663964313031373535633364633536625f5f69647c733a313a2231223b31346230656338333561326633343431663964313031373535633364633536625f5f6e616d657c733a353a2261646d696e223b313462306563383335613266333434316639643130313735356333646335366269647c733a313a2231223b31346230656338333561326633343431663964313031373535633364633536625f5f7374617465737c613a313a7b733a323a226964223b623a313b7d726566726573687c623a313b),
('f28hc7qlvt1mmm6fqd320f4ec7', 1404168807, 0x5969692e4343617074636861416374696f6e2e35616637613362382e736974652e636170746368617c733a373a22776f6e70737567223b5969692e4343617074636861416374696f6e2e35616637613362382e736974652e63617074636861636f756e747c693a313b31346230656338333561326633343431663964313031373535633364633536625f5f69647c733a313a2231223b31346230656338333561326633343431663964313031373535633364633536625f5f6e616d657c733a353a2261646d696e223b313462306563383335613266333434316639643130313735356333646335366269647c733a313a2231223b31346230656338333561326633343431663964313031373535633364633536625f5f7374617465737c613a313a7b733a323a226964223b623a313b7d726566726573687c623a313b),
('kqnb35t6fs6icjia59k0jlo4i1', 1404168261, 0x5969692e4343617074636861416374696f6e2e35616637613362382e736974652e636170746368617c733a373a226b6f6c6174636d223b5969692e4343617074636861416374696f6e2e35616637613362382e736974652e63617074636861636f756e747c693a313b31346230656338333561326633343431663964313031373535633364633536625f5f69647c733a313a2231223b31346230656338333561326633343431663964313031373535633364633536625f5f6e616d657c733a353a2261646d696e223b313462306563383335613266333434316639643130313735356333646335366269647c733a313a2231223b31346230656338333561326633343431663964313031373535633364633536625f5f7374617465737c613a313a7b733a323a226964223b623a313b7d726566726573687c623a313b31346230656338333561326633343431663964313031373535633364633536625969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d);

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
(1, 188169948, 1, '0000-00-00 00:00:00', '2014-07-26 15:26:53'),
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
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=630 ;

--
-- Dumping data for table `m2m_file`
--

INSERT INTO `m2m_file` (`id`, `type`, `filename`, `mime`, `created`, `modified`, `weight`, `view`, `edit`, `delete`, `userId`) VALUES
(115, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 18:29:54', '2014-06-30 18:29:54', NULL, 'P', 'P', 'P', 1),
(79, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:28:13', '2014-06-30 17:28:13', NULL, 'P', 'P', 'P', 36),
(78, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:28:07', '2014-06-30 17:28:08', NULL, 'P', 'P', 'P', 36),
(77, 'audio', '07. Illegal Substances And Enarxis - Way Home.mp3', '', '2014-06-30 17:26:44', NULL, NULL, 'P', 'P', 'P', 36),
(76, 'audio', '08. Illegal Substances - The Quack.mp3', '', '2014-06-30 17:25:55', NULL, NULL, 'P', 'P', 'P', 36),
(75, 'audio', '06. Enarxis - Transilence Thought Unifier (Illegal Substances rmx).mp3', '', '2014-06-30 17:22:12', NULL, NULL, 'P', 'P', 'P', 36),
(74, 'audio', '04. Illegal Substances - Matter of time.mp3', '', '2014-06-30 17:21:40', NULL, NULL, 'P', 'P', 'P', 36),
(73, 'audio', '09. Illegal Substances - Tradition (Chapter II).mp3', '', '2014-06-30 17:16:00', NULL, NULL, 'P', 'P', 'P', 36),
(82, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:29:39', '2014-06-30 17:29:39', NULL, 'P', 'P', 'P', 36),
(84, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:30:30', '2014-06-30 17:30:30', NULL, 'P', 'P', 'P', 36),
(85, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:30:47', '2014-06-30 17:30:48', NULL, 'P', 'P', 'P', 36),
(86, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:32:05', '2014-06-30 17:32:05', NULL, 'P', 'P', 'P', 36),
(88, 'audio', '05. Illegal Substances - Loud.mp3', '', '2014-06-30 17:32:21', NULL, NULL, 'P', 'P', 'P', 36),
(89, 'audio', '06. Enarxis - Transilence Thought Unifier (Illegal Substances rmx).mp3', '', '2014-06-30 17:32:25', NULL, NULL, 'P', 'P', 'P', 36),
(90, 'audio', '07. Illegal Substances And Enarxis - Way Home.mp3', '', '2014-06-30 17:32:29', NULL, NULL, 'P', 'P', 'P', 36),
(91, 'audio', '08. Illegal Substances - The Quack.mp3', '', '2014-06-30 17:32:34', NULL, NULL, 'P', 'P', 'P', 36),
(92, 'audio', '09. Illegal Substances - Tradition (Chapter II).mp3', '', '2014-06-30 17:32:36', NULL, NULL, 'P', 'P', 'P', 36),
(93, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:34:27', '2014-06-30 17:34:28', NULL, 'P', 'P', 'P', 36),
(94, 'audio', '06. Enarxis - Transilence Thought Unifier (Illegal Substances rmx).mp3', '', '2014-06-30 17:35:04', NULL, NULL, 'P', 'P', 'P', 36),
(95, 'audio', '07. Illegal Substances And Enarxis - Way Home.mp3', '', '2014-06-30 17:35:30', NULL, NULL, 'P', 'P', 'P', 36),
(96, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 17:36:05', '2014-06-30 17:36:05', NULL, 'P', 'P', 'P', 36),
(97, 'audio', '06. Enarxis - Transilence Thought Unifier (Illegal Substances rmx).mp3', '', '2014-06-30 17:36:12', NULL, NULL, 'P', 'P', 'P', 36),
(98, 'audio', '03. Illegal Substances And Argonnight - Night Substances.mp3', '', '2014-06-30 17:36:20', NULL, NULL, 'P', 'P', 'P', 36),
(114, 'image', 'Cover.jpg', 'image/jpg', '2014-06-30 18:28:47', '2014-06-30 18:28:47', NULL, 'P', 'P', 'P', 1),
(118, 'audio', 'Benny Benassi - Satisfaction.mp3', '', '2014-06-30 23:31:59', NULL, NULL, 'P', 'P', 'P', 1),
(119, 'audio', 'Brooklyn Bounce - Get Ready to Bounce.mp3', '', '2014-06-30 23:59:06', NULL, NULL, 'P', 'P', 'P', 1),
(120, 'audio', '4 Clubbers - Children (club radio edit).mp3', '', '2014-07-01 00:01:22', NULL, NULL, 'P', 'P', 'P', 1),
(121, 'image', 'AlbumArt_{3A9C8532-FF1C-4C5A-9A86-B97373764685}_Large.jpg', 'image/jpg', '2014-07-01 00:01:24', '2014-07-01 00:01:24', NULL, 'P', 'P', 'P', 1),
(122, 'image', 'AlbumArt_{3A9C8532-FF1C-4C5A-9A86-B97373764685}_Small.jpg', 'image/jpg', '2014-07-01 00:01:25', '2014-07-01 00:01:25', NULL, 'P', 'P', 'P', 1),
(123, 'image', 'AlbumArt_{5AC78F81-8873-4D9F-ADFF-B2D4002B9797}_Large.jpg', 'image/jpg', '2014-07-01 00:01:26', '2014-07-01 00:01:27', NULL, 'P', 'P', 'P', 1),
(124, 'image', 'AlbumArt_{5AC78F81-8873-4D9F-ADFF-B2D4002B9797}_Small.jpg', 'image/jpg', '2014-07-01 00:01:27', '2014-07-01 00:01:27', NULL, 'P', 'P', 'P', 1),
(125, 'image', 'AlbumArt_{36DCCA19-BBBF-401B-99EB-BD80B9C927F7}_Large.jpg', 'image/jpg', '2014-07-01 00:01:28', '2014-07-01 00:01:28', NULL, 'P', 'P', 'P', 1),
(126, 'image', 'AlbumArt_{36DCCA19-BBBF-401B-99EB-BD80B9C927F7}_Small.jpg', 'image/jpg', '2014-07-01 00:01:29', '2014-07-01 00:01:29', NULL, 'P', 'P', 'P', 1),
(127, 'image', 'AlbumArt_{72DDF99C-F7D8-4176-BE36-B9B312E5E1CF}_Large.jpg', 'image/jpg', '2014-07-01 00:01:30', '2014-07-01 00:01:30', NULL, 'P', 'P', 'P', 1),
(128, 'image', 'AlbumArt_{72DDF99C-F7D8-4176-BE36-B9B312E5E1CF}_Small.jpg', 'image/jpg', '2014-07-01 00:01:31', '2014-07-01 00:01:31', NULL, 'P', 'P', 'P', 1),
(129, 'image', 'AlbumArt_{316BF3D9-9CEA-418A-AE26-2607680B4D3B}_Large.jpg', 'image/jpg', '2014-07-01 00:01:32', '2014-07-01 00:01:32', NULL, 'P', 'P', 'P', 1),
(130, 'image', 'AlbumArt_{316BF3D9-9CEA-418A-AE26-2607680B4D3B}_Small.jpg', 'image/jpg', '2014-07-01 00:01:33', '2014-07-01 00:01:33', NULL, 'P', 'P', 'P', 1),
(131, 'image', 'AlbumArt_{744A574E-9047-4BBA-8E37-A0D1B8DEAAAA}_Large.jpg', 'image/jpg', '2014-07-01 00:01:34', '2014-07-01 00:01:34', NULL, 'P', 'P', 'P', 1),
(132, 'image', 'AlbumArt_{744A574E-9047-4BBA-8E37-A0D1B8DEAAAA}_Small.jpg', 'image/jpg', '2014-07-01 00:01:34', '2014-07-01 00:01:34', NULL, 'P', 'P', 'P', 1),
(133, 'image', 'AlbumArt_{1066D0E4-5EEC-4ED7-B0B1-457531E9187E}_Large.jpg', 'image/jpg', '2014-07-01 00:01:35', '2014-07-01 00:01:35', NULL, 'P', 'P', 'P', 1),
(134, 'image', 'AlbumArt_{1066D0E4-5EEC-4ED7-B0B1-457531E9187E}_Small.jpg', 'image/jpg', '2014-07-01 00:01:36', '2014-07-01 00:01:36', NULL, 'P', 'P', 'P', 1),
(135, 'image', 'AlbumArt_{53589FE2-C5C4-4B01-A146-801AAA342CDE}_Large.jpg', 'image/jpg', '2014-07-01 00:01:37', '2014-07-01 00:01:37', NULL, 'P', 'P', 'P', 1),
(136, 'image', 'AlbumArt_{53589FE2-C5C4-4B01-A146-801AAA342CDE}_Small.jpg', 'image/jpg', '2014-07-01 00:01:37', '2014-07-01 00:01:37', NULL, 'P', 'P', 'P', 1),
(137, 'image', 'AlbumArt_{B89C4B11-7C10-47EF-B0B4-65C45E62F0AE}_Large.jpg', 'image/jpg', '2014-07-01 00:01:39', '2014-07-01 00:01:39', NULL, 'P', 'P', 'P', 1),
(138, 'image', 'AlbumArt_{B89C4B11-7C10-47EF-B0B4-65C45E62F0AE}_Small.jpg', 'image/jpg', '2014-07-01 00:01:40', '2014-07-01 00:01:40', NULL, 'P', 'P', 'P', 1),
(139, 'image', 'AlbumArt_{BA8BB327-D877-4A40-B556-ABCC9E2F30D2}_Large.jpg', 'image/jpg', '2014-07-01 00:01:42', '2014-07-01 00:01:42', NULL, 'P', 'P', 'P', 1),
(140, 'image', 'AlbumArt_{BA8BB327-D877-4A40-B556-ABCC9E2F30D2}_Small.jpg', 'image/jpg', '2014-07-01 00:01:42', '2014-07-01 00:01:43', NULL, 'P', 'P', 'P', 1),
(141, 'image', 'AlbumArt_{CE913839-FD33-41C6-8E58-0502032794F3}_Large.jpg', 'image/jpg', '2014-07-01 00:01:43', '2014-07-01 00:01:44', NULL, 'P', 'P', 'P', 1),
(142, 'image', 'AlbumArt_{CE913839-FD33-41C6-8E58-0502032794F3}_Small.jpg', 'image/jpg', '2014-07-01 00:01:44', '2014-07-01 00:01:44', NULL, 'P', 'P', 'P', 1),
(143, 'image', 'AlbumArt_{D3990C71-842C-436F-A32D-F82C3DCD9550}_Large.jpg', 'image/jpg', '2014-07-01 00:01:45', '2014-07-01 00:01:45', NULL, 'P', 'P', 'P', 1),
(144, 'image', 'AlbumArt_{D3990C71-842C-436F-A32D-F82C3DCD9550}_Small.jpg', 'image/jpg', '2014-07-01 00:01:46', '2014-07-01 00:01:46', NULL, 'P', 'P', 'P', 1),
(145, 'image', 'AlbumArt_{E7BBB74A-B3FB-4EE6-B007-9E6BCE36BFA8}_Large.jpg', 'image/jpg', '2014-07-01 00:01:47', '2014-07-01 00:01:47', NULL, 'P', 'P', 'P', 1),
(146, 'image', 'AlbumArt_{E7BBB74A-B3FB-4EE6-B007-9E6BCE36BFA8}_Small.jpg', 'image/jpg', '2014-07-01 00:01:47', '2014-07-01 00:01:48', NULL, 'P', 'P', 'P', 1),
(147, 'image', 'AlbumArt_{F50E5C54-492D-49FF-A958-0068547F2726}_Large.jpg', 'image/jpg', '2014-07-01 00:01:48', '2014-07-01 00:01:49', NULL, 'P', 'P', 'P', 1),
(148, 'image', 'AlbumArt_{F50E5C54-492D-49FF-A958-0068547F2726}_Small.jpg', 'image/jpg', '2014-07-01 00:01:49', '2014-07-01 00:01:49', NULL, 'P', 'P', 'P', 1),
(149, 'image', 'AlbumArtSmall.jpg', 'image/jpg', '2014-07-01 00:01:50', '2014-07-01 00:01:50', NULL, 'P', 'P', 'P', 1),
(150, 'audio', 'Alex Gaudino%20 Example%20 Divine Inspiration - I''m In Love%20 Kickstarts%20 The Way (Put Your Hand In My Hand).mp3', '', '2014-07-01 00:01:51', NULL, NULL, 'P', 'P', 'P', 1),
(151, 'audio', 'Aqua - My Oh My.mp3', '', '2014-07-01 00:03:40', NULL, NULL, 'P', 'P', 'P', 1),
(152, 'audio', 'ATB - Don''t Stop.mp3', '', '2014-07-01 00:04:20', NULL, NULL, 'P', 'P', 'P', 1),
(153, 'audio', 'Avicii - Levels (radio edit).mp3', '', '2014-07-01 00:07:51', NULL, NULL, 'P', 'P', 'P', 1),
(154, 'audio', 'Benny Benassi - Satisfaction.mp3', '', '2014-07-01 00:08:39', NULL, NULL, 'P', 'P', 'P', 1),
(155, 'audio', 'Bingo Players - Cry (Just a Little) (original mix).mp3', '', '2014-07-01 00:14:08', NULL, NULL, 'P', 'P', 'P', 1),
(156, 'audio', 'Brooklyn Bounce - Bass, Beats & Melody (Pulsedriver remix).mp3', '', '2014-07-01 00:19:58', NULL, NULL, 'P', 'P', 'P', 1),
(157, 'audio', 'Brooklyn Bounce - Bass, Beats and Melody.mp3', '', '2014-07-01 00:22:05', NULL, NULL, 'P', 'P', 'P', 1),
(158, 'audio', '4 Clubbers - Children (club radio edit).mp3', '', '2014-07-01 10:14:53', NULL, NULL, 'P', 'P', 'P', 1),
(159, 'image', 'AlbumArt_{3A9C8532-FF1C-4C5A-9A86-B97373764685}_Large.jpg', 'image/jpg', '2014-07-01 10:14:54', '2014-07-01 10:14:54', NULL, 'P', 'P', 'P', 1),
(160, 'image', 'AlbumArt_{3A9C8532-FF1C-4C5A-9A86-B97373764685}_Small.jpg', 'image/jpg', '2014-07-01 10:14:55', '2014-07-01 10:14:55', NULL, 'P', 'P', 'P', 1),
(161, 'image', 'AlbumArt_{5AC78F81-8873-4D9F-ADFF-B2D4002B9797}_Large.jpg', 'image/jpg', '2014-07-01 10:14:57', '2014-07-01 10:14:57', NULL, 'P', 'P', 'P', 1),
(162, 'image', 'AlbumArt_{5AC78F81-8873-4D9F-ADFF-B2D4002B9797}_Small.jpg', 'image/jpg', '2014-07-01 10:14:58', '2014-07-01 10:14:58', NULL, 'P', 'P', 'P', 1),
(163, 'image', 'AlbumArt_{36DCCA19-BBBF-401B-99EB-BD80B9C927F7}_Large.jpg', 'image/jpg', '2014-07-01 10:14:59', '2014-07-01 10:14:59', NULL, 'P', 'P', 'P', 1),
(164, 'image', 'AlbumArt_{36DCCA19-BBBF-401B-99EB-BD80B9C927F7}_Small.jpg', 'image/jpg', '2014-07-01 10:15:00', '2014-07-01 10:15:00', NULL, 'P', 'P', 'P', 1),
(165, 'image', 'AlbumArt_{72DDF99C-F7D8-4176-BE36-B9B312E5E1CF}_Large.jpg', 'image/jpg', '2014-07-01 10:15:01', '2014-07-01 10:15:01', NULL, 'P', 'P', 'P', 1),
(166, 'image', 'AlbumArt_{72DDF99C-F7D8-4176-BE36-B9B312E5E1CF}_Small.jpg', 'image/jpg', '2014-07-01 10:15:02', '2014-07-01 10:15:02', NULL, 'P', 'P', 'P', 1),
(167, 'image', 'AlbumArt_{316BF3D9-9CEA-418A-AE26-2607680B4D3B}_Large.jpg', 'image/jpg', '2014-07-01 10:15:03', '2014-07-01 10:15:03', NULL, 'P', 'P', 'P', 1),
(168, 'image', 'AlbumArt_{316BF3D9-9CEA-418A-AE26-2607680B4D3B}_Small.jpg', 'image/jpg', '2014-07-01 10:15:04', '2014-07-01 10:15:04', NULL, 'P', 'P', 'P', 1),
(169, 'image', 'AlbumArt_{744A574E-9047-4BBA-8E37-A0D1B8DEAAAA}_Large.jpg', 'image/jpg', '2014-07-01 10:15:05', '2014-07-01 10:15:05', NULL, 'P', 'P', 'P', 1),
(170, 'image', 'AlbumArt_{744A574E-9047-4BBA-8E37-A0D1B8DEAAAA}_Small.jpg', 'image/jpg', '2014-07-01 10:15:06', '2014-07-01 10:15:06', NULL, 'P', 'P', 'P', 1),
(171, 'image', 'AlbumArt_{1066D0E4-5EEC-4ED7-B0B1-457531E9187E}_Large.jpg', 'image/jpg', '2014-07-01 10:15:07', '2014-07-01 10:15:07', NULL, 'P', 'P', 'P', 1),
(172, 'image', 'AlbumArt_{1066D0E4-5EEC-4ED7-B0B1-457531E9187E}_Small.jpg', 'image/jpg', '2014-07-01 10:15:08', '2014-07-01 10:15:08', NULL, 'P', 'P', 'P', 1),
(173, 'image', 'AlbumArt_{53589FE2-C5C4-4B01-A146-801AAA342CDE}_Large.jpg', 'image/jpg', '2014-07-01 10:15:09', '2014-07-01 10:15:09', NULL, 'P', 'P', 'P', 1),
(174, 'image', 'AlbumArt_{53589FE2-C5C4-4B01-A146-801AAA342CDE}_Small.jpg', 'image/jpg', '2014-07-01 10:15:10', '2014-07-01 10:15:10', NULL, 'P', 'P', 'P', 1),
(175, 'image', 'AlbumArt_{B89C4B11-7C10-47EF-B0B4-65C45E62F0AE}_Large.jpg', 'image/jpg', '2014-07-01 10:15:11', '2014-07-01 10:15:11', NULL, 'P', 'P', 'P', 1),
(176, 'image', 'AlbumArt_{B89C4B11-7C10-47EF-B0B4-65C45E62F0AE}_Small.jpg', 'image/jpg', '2014-07-01 10:15:12', '2014-07-01 10:15:13', NULL, 'P', 'P', 'P', 1),
(177, 'image', 'AlbumArt_{BA8BB327-D877-4A40-B556-ABCC9E2F30D2}_Large.jpg', 'image/jpg', '2014-07-01 10:15:14', '2014-07-01 10:15:14', NULL, 'P', 'P', 'P', 1),
(178, 'image', 'AlbumArt_{BA8BB327-D877-4A40-B556-ABCC9E2F30D2}_Small.jpg', 'image/jpg', '2014-07-01 10:15:15', '2014-07-01 10:15:15', NULL, 'P', 'P', 'P', 1),
(179, 'image', 'AlbumArt_{CE913839-FD33-41C6-8E58-0502032794F3}_Large.jpg', 'image/jpg', '2014-07-01 10:15:17', '2014-07-01 10:15:17', NULL, 'P', 'P', 'P', 1),
(180, 'image', 'AlbumArt_{CE913839-FD33-41C6-8E58-0502032794F3}_Small.jpg', 'image/jpg', '2014-07-01 10:15:18', '2014-07-01 10:15:18', NULL, 'P', 'P', 'P', 1),
(181, 'image', 'AlbumArt_{D3990C71-842C-436F-A32D-F82C3DCD9550}_Large.jpg', 'image/jpg', '2014-07-01 10:15:19', '2014-07-01 10:15:19', NULL, 'P', 'P', 'P', 1),
(182, 'image', 'AlbumArt_{D3990C71-842C-436F-A32D-F82C3DCD9550}_Small.jpg', 'image/jpg', '2014-07-01 10:15:20', '2014-07-01 10:15:20', NULL, 'P', 'P', 'P', 1),
(183, 'image', 'AlbumArt_{E7BBB74A-B3FB-4EE6-B007-9E6BCE36BFA8}_Large.jpg', 'image/jpg', '2014-07-01 10:15:22', '2014-07-01 10:15:22', NULL, 'P', 'P', 'P', 1),
(184, 'image', 'AlbumArt_{E7BBB74A-B3FB-4EE6-B007-9E6BCE36BFA8}_Small.jpg', 'image/jpg', '2014-07-01 10:15:23', '2014-07-01 10:15:23', NULL, 'P', 'P', 'P', 1),
(185, 'image', 'AlbumArt_{F50E5C54-492D-49FF-A958-0068547F2726}_Large.jpg', 'image/jpg', '2014-07-01 10:15:24', '2014-07-01 10:15:25', NULL, 'P', 'P', 'P', 1),
(186, 'image', 'AlbumArt_{F50E5C54-492D-49FF-A958-0068547F2726}_Small.jpg', 'image/jpg', '2014-07-01 10:15:27', '2014-07-01 10:15:27', NULL, 'P', 'P', 'P', 1),
(187, 'image', 'AlbumArtSmall.jpg', 'image/jpg', '2014-07-01 10:15:29', '2014-07-01 10:15:29', NULL, 'P', 'P', 'P', 1),
(188, 'audio', 'Alex Gaudino%20 Example%20 Divine Inspiration - I''m In Love%20 Kickstarts%20 The Way (Put Your Hand In My Hand).mp3', '', '2014-07-01 10:15:30', NULL, NULL, 'P', 'P', 'P', 1),
(189, 'audio', 'Aqua - My Oh My.mp3', '', '2014-07-01 10:15:32', NULL, NULL, 'P', 'P', 'P', 1),
(190, 'audio', 'ATB - Don''t Stop.mp3', '', '2014-07-01 10:15:33', NULL, NULL, 'P', 'P', 'P', 1),
(191, 'audio', 'Avicii - Levels (radio edit).mp3', '', '2014-07-01 10:15:35', NULL, NULL, 'P', 'P', 'P', 1),
(192, 'audio', 'Benny Benassi - Satisfaction.mp3', '', '2014-07-01 10:15:36', NULL, NULL, 'P', 'P', 'P', 1),
(193, 'audio', 'Bingo Players - Cry (Just a Little) (original mix).mp3', '', '2014-07-01 10:15:37', NULL, NULL, 'P', 'P', 'P', 1),
(194, 'audio', 'Brooklyn Bounce - Bass, Beats & Melody (Pulsedriver remix).mp3', '', '2014-07-01 10:15:39', NULL, NULL, 'P', 'P', 'P', 1),
(195, 'audio', 'Brooklyn Bounce - Bass, Beats and Melody.mp3', '', '2014-07-01 10:15:41', NULL, NULL, 'P', 'P', 'P', 1),
(196, 'audio', 'Brooklyn Bounce - Get Ready to Bounce.mp3', '', '2014-07-01 10:15:42', NULL, NULL, 'P', 'P', 'P', 1),
(197, 'audio', 'Crookers - Knobbers.mp3', '', '2014-07-01 10:15:44', NULL, NULL, 'P', 'P', 'P', 1),
(198, 'audio', 'Daft Punk - Around The World.mp3', '', '2014-07-01 10:15:45', NULL, NULL, 'P', 'P', 'P', 1),
(199, 'audio', 'Daft Punk - Human After All%20 Burnin%20 Too Long.mp3', '', '2014-07-01 10:15:46', NULL, NULL, 'P', 'P', 'P', 1),
(200, 'audio', 'deadmau5 - Dr. Funkenstein.mp3', '', '2014-07-01 10:15:48', NULL, NULL, 'P', 'P', 'P', 1),
(201, 'audio', 'deadmau5 featuring Rob Swire - Ghosts ''n'' Stuff (feat. Rob Swire).mp3', '', '2014-07-01 10:15:49', NULL, NULL, 'P', 'P', 'P', 1),
(202, 'data', 'desktop.ini', '', '2014-07-01 10:15:50', NULL, NULL, 'P', 'P', 'P', 1),
(203, 'data', 'Dj Bene - Electro House Mix 07.mp3.tmp', '', '2014-07-01 10:15:52', NULL, NULL, 'P', 'P', 'P', 1),
(204, 'audio', 'Dj Mangoo - Faster.mp3', '', '2014-07-01 10:15:53', NULL, NULL, 'P', 'P', 'P', 1),
(205, 'audio', 'DJ Splash - The Miracle Maker.mp3', '', '2014-07-01 10:15:55', NULL, NULL, 'P', 'P', 'P', 1),
(206, 'audio', 'Flight Facilities - Crave You (Adventure Club Remix).mp3', '', '2014-07-01 10:15:56', NULL, NULL, 'P', 'P', 'P', 1),
(207, 'image', 'Folder.jpg', 'image/jpg', '2014-07-01 10:15:57', '2014-07-01 10:15:58', NULL, 'P', 'P', 'P', 1),
(208, 'audio', 'Fukkk Offf - More Than Friends (Markus Lange & Sterofunk Remix).mp3', '', '2014-07-01 10:15:59', NULL, NULL, 'P', 'P', 'P', 1),
(209, 'audio', 'Gorillaz - Dirty Harry.mp3', '', '2014-07-01 10:16:01', NULL, NULL, 'P', 'P', 'P', 1),
(210, 'audio', 'Gorillaz - Feel Good Inc.mp3', '', '2014-07-01 10:16:02', NULL, NULL, 'P', 'P', 'P', 1),
(211, 'audio', 'Gorillaz - On Melancholy Hill.mp3', '', '2014-07-01 10:16:03', NULL, NULL, 'P', 'P', 'P', 1),
(212, 'audio', 'Gorillaz - Superfast Jellyfish.mp3', '', '2014-07-01 10:16:04', NULL, NULL, 'P', 'P', 'P', 1),
(213, 'audio', 'Hardrox - Feel the Hard Rock (Heiko & Maiko Mix).mp3', '', '2014-07-01 10:16:06', NULL, NULL, 'P', 'P', 'P', 1),
(214, 'audio', 'Knife Party - Bonfire.mp3', '', '2014-07-01 10:16:07', NULL, NULL, 'P', 'P', 'P', 1),
(215, 'audio', 'Lab 4 - The NRG.mp3', '', '2014-07-01 10:16:08', NULL, NULL, 'P', 'P', 'P', 1),
(216, 'audio', 'Pendulum - Blood Sugar 2007.mp3', '', '2014-07-01 10:16:10', NULL, NULL, 'P', 'P', 'P', 1),
(217, 'audio', 'Plump DJs - SNAFU.mp3', '', '2014-07-01 10:16:11', NULL, NULL, 'P', 'P', 'P', 1),
(218, 'audio', 'Rave Allstars - Hardcore Vibez.mp3', '', '2014-07-01 10:16:13', NULL, NULL, 'P', 'P', 'P', 1),
(219, 'audio', 'Rave Allstars - Raving With The Best.mp3', '', '2014-07-01 10:16:14', NULL, NULL, 'P', 'P', 'P', 1),
(220, 'audio', 'Rave Allstars - The Logical Song (Rave club mix).mp3', '', '2014-07-01 10:16:16', NULL, NULL, 'P', 'P', 'P', 1),
(221, 'audio', 'Rave Techno House - Rave Techno House.mp3', '', '2014-07-01 10:16:17', NULL, NULL, 'P', 'P', 'P', 1),
(222, 'audio', 'Sebastian Ingrosso & Alesso%20 - Calling (Original Instrumental Mix).mp3', '', '2014-07-01 10:16:18', NULL, NULL, 'P', 'P', 'P', 1),
(223, 'audio', 'Swedish House Mafia - One (Cledy West & Saix Dj Boot.mp3', '', '2014-07-01 10:16:19', NULL, NULL, 'P', 'P', 'P', 1),
(224, 'data', 'Thumbs.db', '', '2014-07-01 10:16:20', NULL, NULL, 'P', 'P', 'P', 1),
(225, 'data', 'desktop.ini', '', '2014-07-01 10:16:21', NULL, NULL, 'P', 'P', 'P', 1),
(226, 'audio', '3 Doors Down - Kryptonite.mp3', '', '2014-07-26 14:54:22', NULL, NULL, 'P', 'P', 'P', 1),
(227, 'audio', 'ACDC - Thunderstruck.mp3', '', '2014-07-26 14:54:24', NULL, NULL, 'P', 'P', 'P', 1),
(228, 'image', 'AlbumArt_{00000000-0000-0000-0000-000000000000}_Large.jpg', 'image/jpg', '2014-07-26 14:54:24', '2014-07-26 14:54:24', NULL, 'P', 'P', 'P', 1),
(229, 'image', 'AlbumArt_{00000000-0000-0000-0000-000000000000}_Small.jpg', 'image/jpg', '2014-07-26 14:54:25', '2014-07-26 14:54:25', NULL, 'P', 'P', 'P', 1),
(230, 'image', 'AlbumArt_{04939267-EC6B-4A31-87B1-B6C1562C829C}_Large.jpg', 'image/jpg', '2014-07-26 14:54:25', '2014-07-26 14:54:25', NULL, 'P', 'P', 'P', 1),
(231, 'image', 'AlbumArt_{04939267-EC6B-4A31-87B1-B6C1562C829C}_Small.jpg', 'image/jpg', '2014-07-26 14:54:26', '2014-07-26 14:54:26', NULL, 'P', 'P', 'P', 1),
(232, 'image', 'AlbumArt_{07362AA2-3501-42D2-B27E-4D0E630F3883}_Large.jpg', 'image/jpg', '2014-07-26 14:54:26', '2014-07-26 14:54:27', NULL, 'P', 'P', 'P', 1),
(233, 'image', 'AlbumArt_{07362AA2-3501-42D2-B27E-4D0E630F3883}_Small.jpg', 'image/jpg', '2014-07-26 14:54:27', '2014-07-26 14:54:27', NULL, 'P', 'P', 'P', 1),
(234, 'image', 'AlbumArt_{0E48572C-0E08-451F-A76C-4B6F211CC8DB}_Large.jpg', 'image/jpg', '2014-07-26 14:54:28', '2014-07-26 14:54:28', NULL, 'P', 'P', 'P', 1),
(235, 'image', 'AlbumArt_{0E48572C-0E08-451F-A76C-4B6F211CC8DB}_Small.jpg', 'image/jpg', '2014-07-26 14:54:28', '2014-07-26 14:54:29', NULL, 'P', 'P', 'P', 1),
(236, 'image', 'AlbumArt_{1ECF378A-9C52-49C4-9AB7-D2A07057FE5B}_Large.jpg', 'image/jpg', '2014-07-26 14:54:30', '2014-07-26 14:54:30', NULL, 'P', 'P', 'P', 1),
(237, 'image', 'AlbumArt_{1ECF378A-9C52-49C4-9AB7-D2A07057FE5B}_Small.jpg', 'image/jpg', '2014-07-26 14:54:30', '2014-07-26 14:54:31', NULL, 'P', 'P', 'P', 1),
(238, 'image', 'AlbumArt_{1FFF09BC-974F-43F5-A209-532B159ABA62}_Large.jpg', 'image/jpg', '2014-07-26 14:54:31', '2014-07-26 14:54:31', NULL, 'P', 'P', 'P', 1),
(239, 'image', 'AlbumArt_{1FFF09BC-974F-43F5-A209-532B159ABA62}_Small.jpg', 'image/jpg', '2014-07-26 14:54:31', '2014-07-26 14:54:31', NULL, 'P', 'P', 'P', 1),
(240, 'image', 'AlbumArt_{2C37F23F-6CEA-4CBC-B2F9-BE20D211E5EC}_Large.jpg', 'image/jpg', '2014-07-26 14:54:31', '2014-07-26 14:54:31', NULL, 'P', 'P', 'P', 1),
(241, 'image', 'AlbumArt_{2C37F23F-6CEA-4CBC-B2F9-BE20D211E5EC}_Small.jpg', 'image/jpg', '2014-07-26 14:54:32', '2014-07-26 14:54:32', NULL, 'P', 'P', 'P', 1),
(242, 'image', 'AlbumArt_{2C1479D0-314B-4657-A6E0-6E29BE5799DA}_Large.jpg', 'image/jpg', '2014-07-26 14:54:32', '2014-07-26 14:54:32', NULL, 'P', 'P', 'P', 1),
(243, 'image', 'AlbumArt_{2C1479D0-314B-4657-A6E0-6E29BE5799DA}_Small.jpg', 'image/jpg', '2014-07-26 14:54:32', '2014-07-26 14:54:32', NULL, 'P', 'P', 'P', 1),
(244, 'image', 'AlbumArt_{2D899952-7A87-4826-B29B-1FAB7BCB0DFE}_Large.jpg', 'image/jpg', '2014-07-26 14:54:32', '2014-07-26 14:54:32', NULL, 'P', 'P', 'P', 1),
(245, 'image', 'AlbumArt_{3A49969E-D4B3-4157-B00D-A4051BB443C2}_Large.jpg', 'image/jpg', '2014-07-26 14:54:33', '2014-07-26 14:54:33', NULL, 'P', 'P', 'P', 1),
(246, 'image', 'AlbumArt_{2EFF78DF-4DFB-43E0-A82A-E6ECC51A1DD8}_Small.jpg', 'image/jpg', '2014-07-26 14:54:33', '2014-07-26 14:54:33', NULL, 'P', 'P', 'P', 1),
(247, 'image', 'AlbumArt_{2EFF78DF-4DFB-43E0-A82A-E6ECC51A1DD8}_Large.jpg', 'image/jpg', '2014-07-26 14:54:33', '2014-07-26 14:54:33', NULL, 'P', 'P', 'P', 1),
(248, 'image', 'AlbumArt_{2EA67A22-2D46-4688-BE53-19FAD042B98D}_Small.jpg', 'image/jpg', '2014-07-26 14:54:33', '2014-07-26 14:54:34', NULL, 'P', 'P', 'P', 1),
(249, 'image', 'AlbumArt_{2EA67A22-2D46-4688-BE53-19FAD042B98D}_Large.jpg', 'image/jpg', '2014-07-26 14:54:33', '2014-07-26 14:54:34', NULL, 'P', 'P', 'P', 1),
(250, 'image', 'AlbumArt_{2D899952-7A87-4826-B29B-1FAB7BCB0DFE}_Small.jpg', 'image/jpg', '2014-07-26 14:54:33', '2014-07-26 14:54:34', NULL, 'P', 'P', 'P', 1),
(251, 'image', 'AlbumArt_{3A49969E-D4B3-4157-B00D-A4051BB443C2}_Small.jpg', 'image/jpg', '2014-07-26 14:54:34', '2014-07-26 14:54:34', NULL, 'P', 'P', 'P', 1),
(252, 'image', 'AlbumArt_{3C2DAF84-4CDF-4EC7-B221-FDDA0BBFA4C3}_Large.jpg', 'image/jpg', '2014-07-26 14:54:34', '2014-07-26 14:54:34', NULL, 'P', 'P', 'P', 1),
(253, 'image', 'AlbumArt_{3E792CE4-6590-42FA-A957-EA26C3B1B197}_Large.jpg', 'image/jpg', '2014-07-26 14:54:34', '2014-07-26 14:54:34', NULL, 'P', 'P', 'P', 1),
(254, 'image', 'AlbumArt_{3C2DAF84-4CDF-4EC7-B221-FDDA0BBFA4C3}_Small.jpg', 'image/jpg', '2014-07-26 14:54:34', '2014-07-26 14:54:34', NULL, 'P', 'P', 'P', 1),
(255, 'image', 'AlbumArt_{3E792CE4-6590-42FA-A957-EA26C3B1B197}_Small.jpg', 'image/jpg', '2014-07-26 14:54:34', '2014-07-26 14:54:34', NULL, 'P', 'P', 'P', 1),
(256, 'image', 'AlbumArt_{4B01FDCA-DFB5-4022-A7D2-765ED95974FF}_Large.jpg', 'image/jpg', '2014-07-26 14:54:34', '2014-07-26 14:54:35', NULL, 'P', 'P', 'P', 1),
(257, 'image', 'AlbumArt_{4BE98DF1-87AD-42E1-8364-1BA4E01129CC}_Large.jpg', 'image/jpg', '2014-07-26 14:54:34', '2014-07-26 14:54:35', NULL, 'P', 'P', 'P', 1),
(258, 'image', 'AlbumArt_{4B01FDCA-DFB5-4022-A7D2-765ED95974FF}_Small.jpg', 'image/jpg', '2014-07-26 14:54:35', '2014-07-26 14:54:35', NULL, 'P', 'P', 'P', 1),
(259, 'image', 'AlbumArt_{4BE98DF1-87AD-42E1-8364-1BA4E01129CC}_Small.jpg', 'image/jpg', '2014-07-26 14:54:35', '2014-07-26 14:54:35', NULL, 'P', 'P', 'P', 1),
(260, 'image', 'AlbumArt_{4C8EB604-6CC0-44D9-BC5A-B6CD25A468BD}_Large.jpg', 'image/jpg', '2014-07-26 14:54:35', '2014-07-26 14:54:35', NULL, 'P', 'P', 'P', 1),
(261, 'image', 'AlbumArt_{4C8EB604-6CC0-44D9-BC5A-B6CD25A468BD}_Small.jpg', 'image/jpg', '2014-07-26 14:54:35', '2014-07-26 14:54:35', NULL, 'P', 'P', 'P', 1),
(262, 'image', 'AlbumArt_{4D34F359-9A41-47B5-9530-4080F8F539BB}_Large.jpg', 'image/jpg', '2014-07-26 14:54:35', '2014-07-26 14:54:35', NULL, 'P', 'P', 'P', 1),
(263, 'image', 'AlbumArt_{4D34F359-9A41-47B5-9530-4080F8F539BB}_Small.jpg', 'image/jpg', '2014-07-26 14:54:35', '2014-07-26 14:54:36', NULL, 'P', 'P', 'P', 1),
(264, 'image', 'AlbumArt_{5CF855DB-24FC-421B-AE49-74BFF4A696E6}_Large.jpg', 'image/jpg', '2014-07-26 14:54:36', '2014-07-26 14:54:36', NULL, 'P', 'P', 'P', 1),
(265, 'image', 'AlbumArt_{5CF855DB-24FC-421B-AE49-74BFF4A696E6}_Small.jpg', 'image/jpg', '2014-07-26 14:54:36', '2014-07-26 14:54:36', NULL, 'P', 'P', 'P', 1),
(266, 'image', 'AlbumArt_{5D7495BC-8E8B-4EF3-9DD5-FF6CA4F95EC9}_Large.jpg', 'image/jpg', '2014-07-26 14:54:36', '2014-07-26 14:54:36', NULL, 'P', 'P', 'P', 1),
(267, 'image', 'AlbumArt_{5D7495BC-8E8B-4EF3-9DD5-FF6CA4F95EC9}_Small.jpg', 'image/jpg', '2014-07-26 14:54:36', '2014-07-26 14:54:36', NULL, 'P', 'P', 'P', 1),
(268, 'image', 'AlbumArt_{5ED6F754-C11B-4040-8BDA-59361F4FD633}_Large.jpg', 'image/jpg', '2014-07-26 14:54:36', '2014-07-26 14:54:37', NULL, 'P', 'P', 'P', 1),
(269, 'image', 'AlbumArt_{5ED6F754-C11B-4040-8BDA-59361F4FD633}_Small.jpg', 'image/jpg', '2014-07-26 14:54:36', '2014-07-26 14:54:37', NULL, 'P', 'P', 'P', 1),
(270, 'image', 'AlbumArt_{8C194B39-A10C-4BB6-95E2-A142FCAE7AD5}_Large.jpg', 'image/jpg', '2014-07-26 14:54:36', '2014-07-26 14:54:37', NULL, 'P', 'P', 'P', 1),
(271, 'image', 'AlbumArt_{8C194B39-A10C-4BB6-95E2-A142FCAE7AD5}_Small.jpg', 'image/jpg', '2014-07-26 14:54:37', '2014-07-26 14:54:37', NULL, 'P', 'P', 'P', 1),
(272, 'image', 'AlbumArt_{8CC6D02F-7D72-487E-A929-EB1F6A7F3A3C}_Large.jpg', 'image/jpg', '2014-07-26 14:54:37', '2014-07-26 14:54:38', NULL, 'P', 'P', 'P', 1),
(273, 'image', 'AlbumArt_{8CC6D02F-7D72-487E-A929-EB1F6A7F3A3C}_Small.jpg', 'image/jpg', '2014-07-26 14:54:37', '2014-07-26 14:54:38', NULL, 'P', 'P', 'P', 1),
(274, 'image', 'AlbumArt_{8CE31495-5AFD-4138-812A-7AA36D55CF00}_Large.jpg', 'image/jpg', '2014-07-26 14:54:37', '2014-07-26 14:54:38', NULL, 'P', 'P', 'P', 1),
(275, 'image', 'AlbumArt_{8CE31495-5AFD-4138-812A-7AA36D55CF00}_Small.jpg', 'image/jpg', '2014-07-26 14:54:37', '2014-07-26 14:54:38', NULL, 'P', 'P', 'P', 1),
(276, 'image', 'AlbumArt_{8CF261FD-54AF-438B-BCEF-07CC6846BA69}_Large.jpg', 'image/jpg', '2014-07-26 14:54:38', '2014-07-26 14:54:38', NULL, 'P', 'P', 'P', 1),
(277, 'image', 'AlbumArt_{8CF261FD-54AF-438B-BCEF-07CC6846BA69}_Small.jpg', 'image/jpg', '2014-07-26 14:54:38', '2014-07-26 14:54:38', NULL, 'P', 'P', 'P', 1),
(278, 'image', 'AlbumArt_{8DE1BB63-9D94-4D23-A3B9-FD453B0BE142}_Small.jpg', 'image/jpg', '2014-07-26 14:54:38', '2014-07-26 14:54:39', NULL, 'P', 'P', 'P', 1),
(279, 'image', 'AlbumArt_{8DE1BB63-9D94-4D23-A3B9-FD453B0BE142}_Large.jpg', 'image/jpg', '2014-07-26 14:54:38', '2014-07-26 14:54:39', NULL, 'P', 'P', 'P', 1),
(280, 'image', 'AlbumArt_{8E6D4DC1-D9B1-4902-93DA-73304C1AC434}_Large.jpg', 'image/jpg', '2014-07-26 14:54:38', '2014-07-26 14:54:39', NULL, 'P', 'P', 'P', 1),
(281, 'image', 'AlbumArt_{8E6D4DC1-D9B1-4902-93DA-73304C1AC434}_Small.jpg', 'image/jpg', '2014-07-26 14:54:39', '2014-07-26 14:54:39', NULL, 'P', 'P', 'P', 1),
(282, 'image', 'AlbumArt_{9A9E9A94-C9B2-40C7-A478-1843A06536CE}_Large.jpg', 'image/jpg', '2014-07-26 14:54:39', '2014-07-26 14:54:40', NULL, 'P', 'P', 'P', 1),
(283, 'image', 'AlbumArt_{9A9E9A94-C9B2-40C7-A478-1843A06536CE}_Small.jpg', 'image/jpg', '2014-07-26 14:54:39', '2014-07-26 14:54:40', NULL, 'P', 'P', 'P', 1),
(284, 'image', 'AlbumArt_{9E0033EB-DEDB-4BA5-BD4B-171F47D635B1}_Large.jpg', 'image/jpg', '2014-07-26 14:54:39', '2014-07-26 14:54:40', NULL, 'P', 'P', 'P', 1),
(285, 'image', 'AlbumArt_{9E0033EB-DEDB-4BA5-BD4B-171F47D635B1}_Small.jpg', 'image/jpg', '2014-07-26 14:54:39', '2014-07-26 14:54:40', NULL, 'P', 'P', 'P', 1),
(286, 'image', 'AlbumArt_{14D01E1F-D0FA-4745-8D31-FE3A75827BDC}_Large.jpg', 'image/jpg', '2014-07-26 14:54:40', '2014-07-26 14:54:40', NULL, 'P', 'P', 'P', 1),
(287, 'image', 'AlbumArt_{26DE6AEC-984D-4D45-A6FE-DC6FAA198BAD}_Large.jpg', 'image/jpg', '2014-07-26 14:54:40', '2014-07-26 14:54:41', NULL, 'P', 'P', 'P', 1),
(288, 'image', 'AlbumArt_{14D01E1F-D0FA-4745-8D31-FE3A75827BDC}_Small.jpg', 'image/jpg', '2014-07-26 14:54:40', '2014-07-26 14:54:41', NULL, 'P', 'P', 'P', 1),
(289, 'image', 'AlbumArt_{26DE6AEC-984D-4D45-A6FE-DC6FAA198BAD}_Small.jpg', 'image/jpg', '2014-07-26 14:54:40', '2014-07-26 14:54:41', NULL, 'P', 'P', 'P', 1),
(290, 'image', 'AlbumArt_{38F3700B-ABE6-48BE-AA80-5996F47D8496}_Large.jpg', 'image/jpg', '2014-07-26 14:54:40', '2014-07-26 14:54:41', NULL, 'P', 'P', 'P', 1),
(291, 'image', 'AlbumArt_{38F3700B-ABE6-48BE-AA80-5996F47D8496}_Small.jpg', 'image/jpg', '2014-07-26 14:54:41', '2014-07-26 14:54:41', NULL, 'P', 'P', 'P', 1),
(292, 'image', 'AlbumArt_{63F6051E-0C74-41DB-A3DC-911C803E4FDE}_Small.jpg', 'image/jpg', '2014-07-26 14:54:41', '2014-07-26 14:54:41', NULL, 'P', 'P', 'P', 1),
(293, 'image', 'AlbumArt_{63F6051E-0C74-41DB-A3DC-911C803E4FDE}_Large.jpg', 'image/jpg', '2014-07-26 14:54:41', '2014-07-26 14:54:42', NULL, 'P', 'P', 'P', 1),
(294, 'image', 'AlbumArt_{67AC618B-4202-44CE-B8C8-4CB93293B745}_Large.jpg', 'image/jpg', '2014-07-26 14:54:41', '2014-07-26 14:54:42', NULL, 'P', 'P', 'P', 1),
(295, 'image', 'AlbumArt_{67AC618B-4202-44CE-B8C8-4CB93293B745}_Small.jpg', 'image/jpg', '2014-07-26 14:54:41', '2014-07-26 14:54:42', NULL, 'P', 'P', 'P', 1),
(296, 'image', 'AlbumArt_{71C8AA8A-0843-4D43-BE56-4B852AAA5F60}_Large.jpg', 'image/jpg', '2014-07-26 14:54:41', '2014-07-26 14:54:42', NULL, 'P', 'P', 'P', 1),
(297, 'image', 'AlbumArt_{71C8AA8A-0843-4D43-BE56-4B852AAA5F60}_Small.jpg', 'image/jpg', '2014-07-26 14:54:41', '2014-07-26 14:54:42', NULL, 'P', 'P', 'P', 1),
(298, 'image', 'AlbumArt_{74A41D62-75D3-4FE6-8008-0065DB2D5E09}_Large.jpg', 'image/jpg', '2014-07-26 14:54:42', '2014-07-26 14:54:43', NULL, 'P', 'P', 'P', 1),
(299, 'image', 'AlbumArt_{74A41D62-75D3-4FE6-8008-0065DB2D5E09}_Small.jpg', 'image/jpg', '2014-07-26 14:54:42', '2014-07-26 14:54:43', NULL, 'P', 'P', 'P', 1),
(300, 'image', 'AlbumArt_{181BDA4C-FBAA-4506-99DA-8A74D7C23C36}_Small.jpg', 'image/jpg', '2014-07-26 14:54:42', '2014-07-26 14:54:43', NULL, 'P', 'P', 'P', 1),
(301, 'image', 'AlbumArt_{181BDA4C-FBAA-4506-99DA-8A74D7C23C36}_Large.jpg', 'image/jpg', '2014-07-26 14:54:42', '2014-07-26 14:54:43', NULL, 'P', 'P', 'P', 1),
(302, 'image', 'AlbumArt_{316BF3D9-9CEA-418A-AE26-2607680B4D3B}_Large.jpg', 'image/jpg', '2014-07-26 14:54:42', '2014-07-26 14:54:44', NULL, 'P', 'P', 'P', 1),
(303, 'image', 'AlbumArt_{316BF3D9-9CEA-418A-AE26-2607680B4D3B}_Small.jpg', 'image/jpg', '2014-07-26 14:54:43', '2014-07-26 14:54:44', NULL, 'P', 'P', 'P', 1),
(304, 'image', 'AlbumArt_{341D9DCE-750D-4DCC-BDB3-805B51487DFD}_Large.jpg', 'image/jpg', '2014-07-26 14:54:43', '2014-07-26 14:54:45', NULL, 'P', 'P', 'P', 1),
(305, 'image', 'AlbumArt_{353DB83D-619C-49D3-9DCA-113983D4611A}_Small.jpg', 'image/jpg', '2014-07-26 14:54:44', '2014-07-26 14:54:45', NULL, 'P', 'P', 'P', 1),
(306, 'image', 'AlbumArt_{345ACDEF-241B-4D67-B0F4-01BA2770DCC0}_Large.jpg', 'image/jpg', '2014-07-26 14:54:44', '2014-07-26 14:54:45', NULL, 'P', 'P', 'P', 1),
(307, 'image', 'AlbumArt_{341D9DCE-750D-4DCC-BDB3-805B51487DFD}_Small.jpg', 'image/jpg', '2014-07-26 14:54:44', '2014-07-26 14:54:45', NULL, 'P', 'P', 'P', 1),
(308, 'image', 'AlbumArt_{353DB83D-619C-49D3-9DCA-113983D4611A}_Large.jpg', 'image/jpg', '2014-07-26 14:54:44', '2014-07-26 14:54:45', NULL, 'P', 'P', 'P', 1),
(309, 'image', 'AlbumArt_{412E1AA0-71D8-4CF2-B7A0-E3034E07EF91}_Small.jpg', 'image/jpg', '2014-07-26 14:54:44', '2014-07-26 14:54:45', NULL, 'P', 'P', 'P', 1),
(310, 'image', 'AlbumArt_{345ACDEF-241B-4D67-B0F4-01BA2770DCC0}_Small.jpg', 'image/jpg', '2014-07-26 14:54:44', '2014-07-26 14:54:45', NULL, 'P', 'P', 'P', 1),
(311, 'image', 'AlbumArt_{412E1AA0-71D8-4CF2-B7A0-E3034E07EF91}_Large.jpg', 'image/jpg', '2014-07-26 14:54:44', '2014-07-26 14:54:46', NULL, 'P', 'P', 'P', 1),
(312, 'image', 'AlbumArt_{456DF009-67E9-42B9-AD83-9EAF515A41AA}_Small.jpg', 'image/jpg', '2014-07-26 14:54:44', '2014-07-26 14:54:46', NULL, 'P', 'P', 'P', 1),
(313, 'image', 'AlbumArt_{844E2FDF-7009-4CBD-896C-6EFF74D743FC}_Small.jpg', 'image/jpg', '2014-07-26 14:54:45', '2014-07-26 14:54:46', NULL, 'P', 'P', 'P', 1),
(314, 'image', 'AlbumArt_{456DF009-67E9-42B9-AD83-9EAF515A41AA}_Large.jpg', 'image/jpg', '2014-07-26 14:54:45', '2014-07-26 14:54:47', NULL, 'P', 'P', 'P', 1),
(315, 'image', 'AlbumArt_{844E2FDF-7009-4CBD-896C-6EFF74D743FC}_Large.jpg', 'image/jpg', '2014-07-26 14:54:45', '2014-07-26 14:54:46', NULL, 'P', 'P', 'P', 1),
(316, 'image', 'AlbumArt_{972DE6D4-E26B-44A1-8741-A295719D1DE4}_Large.jpg', 'image/jpg', '2014-07-26 14:54:45', '2014-07-26 14:54:46', NULL, 'P', 'P', 'P', 1),
(317, 'image', 'AlbumArt_{972DE6D4-E26B-44A1-8741-A295719D1DE4}_Small.jpg', 'image/jpg', '2014-07-26 14:54:45', '2014-07-26 14:54:46', NULL, 'P', 'P', 'P', 1),
(318, 'image', 'AlbumArt_{1493E789-FB10-400E-9923-CA4BE9A9AF1A}_Small.jpg', 'image/jpg', '2014-07-26 14:54:46', '2014-07-26 14:54:47', NULL, 'P', 'P', 'P', 1),
(319, 'image', 'AlbumArt_{1493E789-FB10-400E-9923-CA4BE9A9AF1A}_Large.jpg', 'image/jpg', '2014-07-26 14:54:46', '2014-07-26 14:54:47', NULL, 'P', 'P', 'P', 1),
(320, 'image', 'AlbumArt_{7030BF8D-A507-4D72-9265-0849AFE084F0}_Small.jpg', 'image/jpg', '2014-07-26 14:54:46', '2014-07-26 14:54:48', NULL, 'P', 'P', 'P', 1),
(321, 'image', 'AlbumArt_{2699B21C-A3FE-4B45-869E-01CB184136BA}_Large.jpg', 'image/jpg', '2014-07-26 14:54:47', '2014-07-26 14:54:49', NULL, 'P', 'P', 'P', 1),
(322, 'image', 'AlbumArt_{7030BF8D-A507-4D72-9265-0849AFE084F0}_Large.jpg', 'image/jpg', '2014-07-26 14:54:47', '2014-07-26 14:54:49', NULL, 'P', 'P', 'P', 1),
(323, 'image', 'AlbumArt_{9244B63A-E2CF-4464-A4F2-5E47E5FA1429}_Small.jpg', 'image/jpg', '2014-07-26 14:54:47', '2014-07-26 14:54:48', NULL, 'P', 'P', 'P', 1),
(324, 'image', 'AlbumArt_{2699B21C-A3FE-4B45-869E-01CB184136BA}_Small.jpg', 'image/jpg', '2014-07-26 14:54:47', '2014-07-26 14:54:49', NULL, 'P', 'P', 'P', 1),
(325, 'image', 'AlbumArt_{75999A87-2BFC-4DD1-975E-C2F427363586}_Large.jpg', 'image/jpg', '2014-07-26 14:54:48', '2014-07-26 14:54:49', NULL, 'P', 'P', 'P', 1),
(326, 'image', 'AlbumArt_{91627DC8-2112-445E-B3A1-5B4B1D3DE7BB}_Large.jpg', 'image/jpg', '2014-07-26 14:54:48', '2014-07-26 14:54:49', NULL, 'P', 'P', 'P', 1),
(327, 'image', 'AlbumArt_{91627DC8-2112-445E-B3A1-5B4B1D3DE7BB}_Small.jpg', 'image/jpg', '2014-07-26 14:54:48', '2014-07-26 14:54:49', NULL, 'P', 'P', 'P', 1),
(328, 'image', 'AlbumArt_{75999A87-2BFC-4DD1-975E-C2F427363586}_Small.jpg', 'image/jpg', '2014-07-26 14:54:48', '2014-07-26 14:54:49', NULL, 'P', 'P', 'P', 1),
(329, 'image', 'AlbumArt_{72902BA5-19E9-451A-9AAB-CBB8C6E6BCC2}_Small.jpg', 'image/jpg', '2014-07-26 14:54:48', '2014-07-26 14:54:49', NULL, 'P', 'P', 'P', 1),
(330, 'image', 'AlbumArt_{9244B63A-E2CF-4464-A4F2-5E47E5FA1429}_Large.jpg', 'image/jpg', '2014-07-26 14:54:49', '2014-07-26 14:54:50', NULL, 'P', 'P', 'P', 1),
(331, 'image', 'AlbumArt_{72902BA5-19E9-451A-9AAB-CBB8C6E6BCC2}_Large.jpg', 'image/jpg', '2014-07-26 14:54:49', '2014-07-26 14:54:50', NULL, 'P', 'P', 'P', 1),
(332, 'image', 'AlbumArt_{C03B257A-11B7-4E53-8564-B1EBB8EC9DEF}_Small.jpg', 'image/jpg', '2014-07-26 14:54:52', '2014-07-26 14:54:52', NULL, 'P', 'P', 'P', 1),
(333, 'image', 'AlbumArt_{CB0F802C-C5E6-4238-91FA-509A7FA280BA}_Small.jpg', 'image/jpg', '2014-07-26 14:54:53', '2014-07-26 14:54:53', NULL, 'P', 'P', 'P', 1),
(334, 'image', 'AlbumArt_{CC0EA966-6E07-4D41-AE53-F855DB8E46BB}_Large.jpg', 'image/jpg', '2014-07-26 14:54:55', '2014-07-26 14:54:55', NULL, 'P', 'P', 'P', 1),
(335, 'image', 'AlbumArt_{D82F902E-D492-4130-8A15-2F572E5FFCC6}_Large.jpg', 'image/jpg', '2014-07-26 14:54:57', '2014-07-26 14:54:57', NULL, 'P', 'P', 'P', 1),
(336, 'image', 'AlbumArt_{DEB01734-C213-4F07-B41F-1179B1FF2231}_Small.jpg', 'image/jpg', '2014-07-26 14:54:58', '2014-07-26 14:54:58', NULL, 'P', 'P', 'P', 1),
(337, 'image', 'AlbumArt_{DFDECF57-6188-442F-BA0D-AC62735E0DFE}_Large.jpg', 'image/jpg', '2014-07-26 14:55:00', '2014-07-26 14:55:00', NULL, 'P', 'P', 'P', 1),
(338, 'image', 'AlbumArt_{DFDECF57-6188-442F-BA0D-AC62735E0DFE}_Small.jpg', 'image/jpg', '2014-07-26 14:55:01', '2014-07-26 14:55:02', NULL, 'P', 'P', 'P', 1),
(339, 'image', 'AlbumArt_{E3A1F66D-705B-4BD1-87E9-9A69ADD99206}_Large.jpg', 'image/jpg', '2014-07-26 14:55:03', '2014-07-26 14:55:03', NULL, 'P', 'P', 'P', 1),
(340, 'image', 'AlbumArt_{E3A1F66D-705B-4BD1-87E9-9A69ADD99206}_Small.jpg', 'image/jpg', '2014-07-26 14:55:04', '2014-07-26 14:55:05', NULL, 'P', 'P', 'P', 1),
(341, 'image', 'AlbumArt_{E4A861FE-07A1-4890-9A2A-2B91DF48E62D}_Large.jpg', 'image/jpg', '2014-07-26 14:55:06', '2014-07-26 14:55:07', NULL, 'P', 'P', 'P', 1),
(342, 'image', 'AlbumArt_{E4A861FE-07A1-4890-9A2A-2B91DF48E62D}_Small.jpg', 'image/jpg', '2014-07-26 14:55:08', '2014-07-26 14:55:08', NULL, 'P', 'P', 'P', 1),
(343, 'image', 'AlbumArt_{F7E0780B-6967-4EEC-A16C-BA9113F18730}_Large.jpg', 'image/jpg', '2014-07-26 14:55:09', '2014-07-26 14:55:10', NULL, 'P', 'P', 'P', 1),
(344, 'audio', 'Arctic Monkeys - Fluorescent Adolescent.mp3', '', '2014-07-26 14:55:11', NULL, NULL, 'P', 'P', 'P', 1),
(345, 'audio', 'Avicci - Wake Me Up.mp3', '', '2014-07-26 14:55:12', NULL, NULL, 'P', 'P', 'P', 1),
(346, 'audio', 'Avicii - Addicted to You.mp3', '', '2014-07-26 14:55:14', NULL, NULL, 'P', 'P', 'P', 1),
(347, 'audio', 'Avicii - Levels.mp3', '', '2014-07-26 14:55:15', NULL, NULL, 'P', 'P', 'P', 1),
(348, 'audio', 'Avicii - You Make Me.mp3', '', '2014-07-26 14:55:17', NULL, NULL, 'P', 'P', 'P', 1),
(349, 'audio', 'AWOLNATION - Guilty Filthy Soul.mp3', '', '2014-07-26 14:55:21', NULL, NULL, 'P', 'P', 'P', 1),
(350, 'audio', 'AWOLNATION - Sail.mp3', '', '2014-07-26 14:55:23', NULL, NULL, 'P', 'P', 'P', 1),
(351, 'audio', 'B.o.B - Magic.mp3', '', '2014-07-26 14:55:25', NULL, NULL, 'P', 'P', 'P', 1),
(352, 'audio', 'B.O.B feat. Hayley Williams of Paramore - Airplanes.mp3', '', '2014-07-26 14:55:27', NULL, NULL, 'P', 'P', 'P', 1),
(353, 'audio', 'Bastille - Pompeii.mp3', '', '2014-07-26 14:55:29', NULL, NULL, 'P', 'P', 'P', 1),
(354, 'audio', 'Billy Ocean - Caribbean Queen.mp3', '', '2014-07-26 14:55:31', NULL, NULL, 'P', 'P', 'P', 1),
(355, 'audio', 'Bob Marley - Is This Love.mp3', '', '2014-07-26 14:55:33', NULL, NULL, 'P', 'P', 'P', 1),
(356, 'audio', 'Bob Marley - Jamming.mp3', '', '2014-07-26 14:55:35', NULL, NULL, 'P', 'P', 'P', 1),
(357, 'audio', 'Bon Jovi - Its My Life.mp3', '', '2014-07-26 14:55:36', NULL, NULL, 'P', 'P', 'P', 1),
(358, 'audio', 'Britney Spears - Rock Me In.mp3', '', '2014-07-26 14:55:39', NULL, NULL, 'P', 'P', 'P', 1),
(359, 'audio', 'Bruno Mars - Count on Me.mp3', '', '2014-07-26 14:55:41', NULL, NULL, 'P', 'P', 'P', 1),
(360, 'audio', 'Bruno Mars - Just the Way You Are.mp3', '', '2014-07-26 14:55:43', NULL, NULL, 'P', 'P', 'P', 1),
(361, 'audio', 'Bruno Mars - The Lazy Song.mp3', '', '2014-07-26 14:55:45', NULL, NULL, 'P', 'P', 'P', 1),
(362, 'audio', 'Bruno Mars - Treasure.mp3', '', '2014-07-26 14:55:47', NULL, NULL, 'P', 'P', 'P', 1),
(363, 'audio', 'Bryan Adams - Summer of 69.mp3', '', '2014-07-26 14:55:49', NULL, NULL, 'P', 'P', 'P', 1),
(364, 'audio', 'Calvin Harris - Flashback.mp3', '', '2014-07-26 14:55:51', NULL, NULL, 'P', 'P', 'P', 1),
(365, 'data', 'Calvin Harris - Summer.mp3.tmp', '', '2014-07-26 14:55:53', NULL, NULL, 'P', 'P', 'P', 1),
(366, 'audio', 'Capital Cities - Safe and Sound.mp3', '', '2014-07-26 14:55:55', NULL, NULL, 'P', 'P', 'P', 1),
(367, 'audio', 'Chromeo - Don''t Turn the Lights On (Aeroplane remix).mp3', '', '2014-07-26 14:55:56', NULL, NULL, 'P', 'P', 'P', 1),
(368, 'audio', 'Chromeo - Sexy Socialite.mp3', '', '2014-07-26 14:55:58', NULL, NULL, 'P', 'P', 'P', 1),
(369, 'audio', 'Cold Play - A Sky Full Of Stars.mp3', '', '2014-07-26 14:56:00', NULL, NULL, 'P', 'P', 'P', 1),
(370, 'audio', 'Coldplay - A Sky Full of Stars.mp3', '', '2014-07-26 14:56:03', NULL, NULL, 'P', 'P', 'P', 1),
(371, 'audio', 'Coldplay - paradise.mp3', '', '2014-07-26 14:56:07', NULL, NULL, 'P', 'P', 'P', 1),
(372, 'audio', 'Coldplay - The Scientist.mp3', '', '2014-07-26 14:56:09', NULL, NULL, 'P', 'P', 'P', 1),
(373, 'audio', 'Counting Crows - Mr. Jones.mp3', '', '2014-07-26 14:56:11', NULL, NULL, 'P', 'P', 'P', 1),
(374, 'audio', 'Crash Test Dummies - Just Shoot Me, Baby.mp3', '', '2014-07-26 14:56:13', NULL, NULL, 'P', 'P', 'P', 1),
(375, 'audio', 'Crash Test Dummies - Mmmm Mmmm Mmmm Mmmm.mp3', '', '2014-07-26 14:56:15', NULL, NULL, 'P', 'P', 'P', 1),
(376, 'data', 'Cro - Traum.mp3.tmp', '', '2014-07-26 14:56:16', NULL, NULL, 'P', 'P', 'P', 1),
(377, 'audio', 'Daft Punk - Get Lucky (feat. Pharrell Williams).mp3', '', '2014-07-26 14:56:19', NULL, NULL, 'P', 'P', 'P', 1),
(378, 'audio', 'Daft Punk - One More Time.mp3', '', '2014-07-26 14:56:21', NULL, NULL, 'P', 'P', 'P', 1),
(379, 'audio', 'David Guetta - Memories.mp3', '', '2014-07-26 14:56:24', NULL, NULL, 'P', 'P', 'P', 1),
(380, 'audio', 'Demi Lovato - Give Your Heart a Break.mp3', '', '2014-07-26 14:56:25', NULL, NULL, 'P', 'P', 'P', 1),
(381, 'audio', 'Demi Lovato - Heart Attack.mp3', '', '2014-07-26 14:56:27', NULL, NULL, 'P', 'P', 'P', 1),
(382, 'audio', 'Demi Lovato - Neon Lights.mp3', '', '2014-07-26 14:56:30', NULL, NULL, 'P', 'P', 'P', 1),
(383, 'data', 'desktop.ini', '', '2014-07-26 14:56:32', NULL, NULL, 'P', 'P', 'P', 1),
(384, 'audio', 'Diddy - Dirty Money - Coming Home (Ft. Skylar Grey).mp3', '', '2014-07-26 14:56:34', NULL, NULL, 'P', 'P', 'P', 1),
(385, 'audio', 'Dire Straits - Sultans of Swing.mp3', '', '2014-07-26 14:56:36', NULL, NULL, 'P', 'P', 'P', 1),
(386, 'audio', 'Duck Sauce - Barbara Streisand.mp3', '', '2014-07-26 14:56:39', NULL, NULL, 'P', 'P', 'P', 1),
(387, 'audio', 'Ed Sheeran%20 - Lego House.mp3', '', '2014-07-26 14:56:41', NULL, NULL, 'P', 'P', 'P', 1),
(388, 'audio', 'Edward Sharpe & The Magnetic Zeros - Home.mp3', '', '2014-07-26 14:56:43', NULL, NULL, 'P', 'P', 'P', 1),
(389, 'audio', 'Ellie Gouding - Burn.mp3', '', '2014-07-26 14:56:45', NULL, NULL, 'P', 'P', 'P', 1),
(390, 'audio', 'Ellie Goulding - Lights.mp3', '', '2014-07-26 14:56:48', NULL, NULL, 'P', 'P', 'P', 1),
(391, 'audio', 'Eminem & Rihanna - Monster.mp3', '', '2014-07-26 14:56:50', NULL, NULL, 'P', 'P', 'P', 1),
(392, 'audio', 'Eminem - Lose Yourself.mp3', '', '2014-07-26 14:56:53', NULL, NULL, 'P', 'P', 'P', 1),
(393, 'audio', 'Eminem - Not Afraid.mp3', '', '2014-07-26 14:56:55', NULL, NULL, 'P', 'P', 'P', 1),
(394, 'audio', 'Example - Kickstarts Radio Edit.mp3', '', '2014-07-26 14:56:58', NULL, NULL, 'P', 'P', 'P', 1),
(395, 'audio', 'Fleetwood Mac - Everywhere.mp3', '', '2014-07-26 14:57:00', NULL, NULL, 'P', 'P', 'P', 1),
(396, 'audio', 'Flo Rida - Whistle.mp3', '', '2014-07-26 14:57:03', NULL, NULL, 'P', 'P', 'P', 1),
(397, 'audio', 'Flo-rida - Wild Ones.mp3', '', '2014-07-26 14:57:05', NULL, NULL, 'P', 'P', 'P', 1),
(398, 'audio', 'Florence and The Machine - You''ve Got The Love.mp3', '', '2014-07-26 14:57:07', NULL, NULL, 'P', 'P', 'P', 1),
(399, 'image', 'Folder.jpg', 'image/jpg', '2014-07-26 14:57:09', '2014-07-26 14:57:09', NULL, 'P', 'P', 'P', 1),
(400, 'audio', 'Foo Fighters - The Best Of U.mp3', '', '2014-07-26 14:57:11', NULL, NULL, 'P', 'P', 'P', 1),
(401, 'audio', 'Foster The People - Houdini.mp3', '', '2014-07-26 14:57:14', NULL, NULL, 'P', 'P', 'P', 1),
(402, 'audio', 'Foster The People - Pumped Up Kicks.mp3', '', '2014-07-26 14:57:17', NULL, NULL, 'P', 'P', 'P', 1),
(403, 'audio', 'Franz Ferdinand - Take Me Out.mp3', '', '2014-07-26 14:57:19', NULL, NULL, 'P', 'P', 'P', 1),
(404, 'audio', 'George Ezra - Budapest.mp3', '', '2014-07-26 14:57:21', NULL, NULL, 'P', 'P', 'P', 1),
(405, 'audio', 'Gorillaz - Clint Eastwood.mp3', '', '2014-07-26 14:57:23', NULL, NULL, 'P', 'P', 'P', 1),
(406, 'audio', 'Gorillaz - Feel Good Inc..mp3', '', '2014-07-26 14:57:26', NULL, NULL, 'P', 'P', 'P', 1),
(407, 'audio', 'Green Day - Boulevard of Broken Dreams.mp3', '', '2014-07-26 14:57:29', NULL, NULL, 'P', 'P', 'P', 1),
(408, 'audio', 'Gym Class Heroes [Ft. Adam Levine] - Stereo Hearts.mp3', '', '2014-07-26 14:57:29', NULL, NULL, 'P', 'P', 'P', 1),
(409, 'audio', 'Jason Mraz - I''m Yours.mp3', '', '2014-07-26 14:57:32', NULL, NULL, 'P', 'P', 'P', 1),
(410, 'audio', 'Jessie J - Price Tag.mp3', '', '2014-07-26 14:57:32', NULL, NULL, 'P', 'P', 'P', 1),
(411, 'audio', 'Keane - Somewhere Only We Know.mp3', '', '2014-07-26 14:57:33', NULL, NULL, 'P', 'P', 'P', 1),
(412, 'audio', 'Luke Bryan - Play It Again.mp3', '', '2014-07-26 14:57:35', NULL, NULL, 'P', 'P', 'P', 1),
(413, 'audio', 'Macklemore & Ryan Lewis - Can''t Hold Us Ft. Ray Dalton.mp3', '', '2014-07-26 14:57:36', NULL, NULL, 'P', 'P', 'P', 1),
(414, 'audio', 'Maroon 5 - Love Somebody.mp3', '', '2014-07-26 14:57:36', NULL, NULL, 'P', 'P', 'P', 1),
(415, 'audio', 'Michael Jackson - Black Or White.mp3', '', '2014-07-26 14:57:37', NULL, NULL, 'P', 'P', 'P', 1),
(416, 'audio', 'Miley Cyrus - We Can''t Stop.mp3', '', '2014-07-26 14:57:38', NULL, NULL, 'P', 'P', 'P', 1),
(417, 'audio', 'Miley Cirus - Wrecking ball.mp3', '', '2014-07-26 14:57:38', NULL, NULL, 'P', 'P', 'P', 1),
(418, 'audio', 'New Radicals - You Get What You Give.mp3', '', '2014-07-26 14:57:39', NULL, NULL, 'P', 'P', 'P', 1),
(419, 'audio', 'Nickelback - If Today Was Your Last Day.mp3', '', '2014-07-26 14:57:41', NULL, NULL, 'P', 'P', 'P', 1),
(420, 'audio', 'Nico and Vinz - Am I Wrong.mp3', '', '2014-07-26 14:57:41', NULL, NULL, 'P', 'P', 'P', 1),
(421, 'audio', 'One Republic - Counting Stars.mp3', '', '2014-07-26 14:57:43', NULL, NULL, 'P', 'P', 'P', 1),
(422, 'audio', 'Panic! At the Disco - I Write Sins Not Tragedies.mp3', '', '2014-07-26 14:57:45', NULL, NULL, 'P', 'P', 'P', 1),
(423, 'audio', 'Phantom Planet - Crashing Your Party.mp3', '', '2014-07-26 14:57:47', NULL, NULL, 'P', 'P', 'P', 1),
(424, 'audio', 'Pink - So What.mp3', '', '2014-07-26 14:57:50', NULL, NULL, 'P', 'P', 'P', 1),
(425, 'audio', 'Pitbull - Mr. Right Now (Feat. Akon).mp3', '', '2014-07-26 14:57:52', NULL, NULL, 'P', 'P', 'P', 1),
(426, 'data', 'Pitbull ft. Jennifer Lopez & Claudia Liette - We Are One (Ole Ola).mp3.tmp', '', '2014-07-26 14:57:55', NULL, NULL, 'P', 'P', 'P', 1),
(427, 'audio', 'Queen - Dont Stop Me Now.mp3', '', '2014-07-26 14:57:57', NULL, NULL, 'P', 'P', 'P', 1),
(428, 'audio', 'Queen - I Want to Break Free.mp3', '', '2014-07-26 14:57:59', NULL, NULL, 'P', 'P', 'P', 1),
(429, 'audio', 'Rage Against the Machine - Killing in the Name.mp3', '', '2014-07-26 14:58:01', NULL, NULL, 'P', 'P', 'P', 1),
(430, 'audio', 'Red Hot Chili Peppers - By the Way.mp3', '', '2014-07-26 14:58:03', NULL, NULL, 'P', 'P', 'P', 1),
(431, 'audio', 'Red Hot Chili Peppers - Californication.mp3', '', '2014-07-26 14:58:05', NULL, NULL, 'P', 'P', 'P', 1),
(432, 'audio', 'Red Hot Chili Peppers - Can''t Stop.mp3', '', '2014-07-26 14:58:07', NULL, NULL, 'P', 'P', 'P', 1),
(433, 'audio', 'Red Hot Chili Peppers - Dani California.mp3', '', '2014-07-26 14:58:09', NULL, NULL, 'P', 'P', 'P', 1),
(434, 'audio', 'Red Hot Chili Peppers - Give It Away.mp3', '', '2014-07-26 14:58:12', NULL, NULL, 'P', 'P', 'P', 1),
(435, 'audio', 'Red Hot Chili Peppers - Otherside.mp3', '', '2014-07-26 14:58:13', NULL, NULL, 'P', 'P', 'P', 1),
(436, 'audio', 'Red Hot Chili Peppers - The Zephyr Song.mp3', '', '2014-07-26 14:58:15', NULL, NULL, 'P', 'P', 'P', 1),
(437, 'audio', 'Red Hot Chili Peppers - Under the Bridge.mp3', '', '2014-07-26 14:58:17', NULL, NULL, 'P', 'P', 'P', 1),
(438, 'audio', 'Rihanna - Don''t Stop the Music.mp3', '', '2014-07-26 14:58:19', NULL, NULL, 'P', 'P', 'P', 1),
(439, 'audio', 'Rihanna - Stay (feat. Mikky Ekko).mp3', '', '2014-07-26 14:58:19', NULL, NULL, 'P', 'P', 'P', 1),
(440, 'audio', 'Soundgarden - Black Hole Sun.mp3', '', '2014-07-26 14:58:20', NULL, NULL, 'P', 'P', 'P', 1),
(441, 'audio', 'The Farm - All Together Now.mp3', '', '2014-07-26 14:58:21', NULL, NULL, 'P', 'P', 'P', 1),
(442, 'audio', 'The Offspring - The Kids Aren''t Alright.mp3', '', '2014-07-26 14:58:22', NULL, NULL, 'P', 'P', 'P', 1),
(443, 'audio', 'The Police - Every Breath You Take.mp3', '', '2014-07-26 14:58:22', NULL, NULL, 'P', 'P', 'P', 1),
(444, 'audio', 'The Script - Hall of Fame (feat. will.i.am).mp3', '', '2014-07-26 14:58:23', NULL, NULL, 'P', 'P', 'P', 1),
(445, 'audio', 'The Verve - Bitter Sweet Symphony.mp3', '', '2014-07-26 14:58:23', NULL, NULL, 'P', 'P', 'P', 1),
(446, 'audio', 'The Ziggens - Junipero Serra.mp3', '', '2014-07-26 14:58:24', NULL, NULL, 'P', 'P', 'P', 1),
(447, 'audio', 'Tiga - (Far From) Home (Bascombe radio mix).mp3', '', '2014-07-26 14:58:24', NULL, NULL, 'P', 'P', 'P', 1),
(448, 'audio', 'Train - Drops of Jupiter.mp3', '', '2014-07-26 14:58:25', NULL, NULL, 'P', 'P', 'P', 1),
(449, 'audio', 'Various Artists - All Star - Smash Mouth.mp3', '', '2014-07-26 14:58:25', NULL, NULL, 'P', 'P', 'P', 1),
(450, 'audio', 'B.O.B feat. Hayley Williams of Paramore - Airplanes.mp3', '', '2014-07-26 14:58:59', NULL, NULL, 'P', 'P', 'P', 1),
(451, 'audio', 'Bastille - Pompeii.mp3', '', '2014-07-26 14:59:00', NULL, NULL, 'P', 'P', 'P', 1),
(452, 'audio', 'Billy Ocean - Caribbean Queen.mp3', '', '2014-07-26 14:59:01', NULL, NULL, 'P', 'P', 'P', 1),
(453, 'audio', 'Bob Marley - Jamming.mp3', '', '2014-07-26 14:59:02', NULL, NULL, 'P', 'P', 'P', 1),
(454, 'audio', 'Bob Marley - Is This Love.mp3', '', '2014-07-26 14:59:02', NULL, NULL, 'P', 'P', 'P', 1),
(455, 'audio', 'New Radicals - You Get What You Give.mp3', '', '2014-07-26 14:59:03', NULL, NULL, 'P', 'P', 'P', 1),
(456, 'audio', 'Nickelback - How You Remind Me.mp3', '', '2014-07-26 14:59:04', NULL, NULL, 'P', 'P', 'P', 1),
(457, 'audio', 'Nickelback - If Today Was Your Last Day.mp3', '', '2014-07-26 14:59:04', NULL, NULL, 'P', 'P', 'P', 1),
(458, 'audio', 'Mr. Probz - Waves.mp3', '', '2014-07-26 14:59:05', NULL, NULL, 'P', 'P', 'P', 1),
(459, 'audio', 'Muse - Starlight.mp3', '', '2014-07-26 14:59:06', NULL, NULL, 'P', 'P', 'P', 1),
(460, 'audio', 'Two Door Cinema Club - Undercover Martyn.mp3', '', '2014-07-26 15:00:22', NULL, NULL, 'P', 'P', 'P', 1),
(461, 'audio', 'U2 - With Or Whitout You.mp3', '', '2014-07-26 15:00:23', NULL, NULL, 'P', 'P', 'P', 1),
(462, 'audio', 'Va - www.musicasparabaixar.org - black and yellow.mp3', '', '2014-07-26 15:00:24', NULL, NULL, 'P', 'P', 'P', 1),
(463, 'audio', 'Va - www.musicasparabaixar.org - Hey Brother.mp3', '', '2014-07-26 15:00:24', NULL, NULL, 'P', 'P', 'P', 1),
(464, 'audio', 'Vampire Weekend - A-Punk.mp3', '', '2014-07-26 15:00:25', NULL, NULL, 'P', 'P', 'P', 1),
(465, 'audio', 'Various Artists - All Star - Smash Mouth.mp3', '', '2014-07-26 15:00:26', NULL, NULL, 'P', 'P', 'P', 1),
(466, 'audio', 'Weezer - Island in the Sun.mp3', '', '2014-07-26 15:00:27', NULL, NULL, 'P', 'P', 'P', 1),
(467, 'audio', 'Zedd - Clarity (feat. Foxes).mp3', '', '2014-07-26 15:00:27', NULL, NULL, 'P', 'P', 'P', 1);
INSERT INTO `m2m_file` (`id`, `type`, `filename`, `mime`, `created`, `modified`, `weight`, `view`, `edit`, `delete`, `userId`) VALUES
(468, 'audio', 'Two Door Cinema Club - Undercover Martyn.mp3', '', '2014-07-26 15:01:37', NULL, NULL, 'P', 'P', 'P', 1),
(469, 'audio', 'U2 - With Or Whitout You.mp3', '', '2014-07-26 15:01:38', NULL, NULL, 'P', 'P', 'P', 1),
(470, 'audio', 'Va - www.musicasparabaixar.org - black and yellow.mp3', '', '2014-07-26 15:01:38', NULL, NULL, 'P', 'P', 'P', 1),
(471, 'audio', 'Va - www.musicasparabaixar.org - Hey Brother.mp3', '', '2014-07-26 15:01:39', NULL, NULL, 'P', 'P', 'P', 1),
(472, 'audio', 'Vampire Weekend - A-Punk.mp3', '', '2014-07-26 15:01:40', NULL, NULL, 'P', 'P', 'P', 1),
(473, 'audio', 'Various Artists - All Star - Smash Mouth.mp3', '', '2014-07-26 15:01:41', NULL, NULL, 'P', 'P', 'P', 1),
(474, 'audio', 'Weezer - Island in the Sun.mp3', '', '2014-07-26 15:01:42', NULL, NULL, 'P', 'P', 'P', 1),
(475, 'audio', 'Zedd - Clarity (feat. Foxes).mp3', '', '2014-07-26 15:01:42', NULL, NULL, 'P', 'P', 'P', 1),
(476, 'audio', 'Two Door Cinema Club - Undercover Martyn.mp3', '', '2014-07-26 15:02:18', NULL, NULL, 'P', 'P', 'P', 1),
(477, 'audio', 'U2 - With Or Whitout You.mp3', '', '2014-07-26 15:02:19', NULL, NULL, 'P', 'P', 'P', 1),
(478, 'audio', 'Va - www.musicasparabaixar.org - black and yellow.mp3', '', '2014-07-26 15:02:20', NULL, NULL, 'P', 'P', 'P', 1),
(479, 'audio', 'Va - www.musicasparabaixar.org - Hey Brother.mp3', '', '2014-07-26 15:02:21', NULL, NULL, 'P', 'P', 'P', 1),
(480, 'audio', 'Vampire Weekend - A-Punk.mp3', '', '2014-07-26 15:02:21', NULL, NULL, 'P', 'P', 'P', 1),
(481, 'audio', 'Various Artists - All Star - Smash Mouth.mp3', '', '2014-07-26 15:02:22', NULL, NULL, 'P', 'P', 'P', 1),
(482, 'audio', 'Weezer - Island in the Sun.mp3', '', '2014-07-26 15:02:23', NULL, NULL, 'P', 'P', 'P', 1),
(483, 'audio', 'Zedd - Clarity (feat. Foxes).mp3', '', '2014-07-26 15:02:24', NULL, NULL, 'P', 'P', 'P', 1),
(484, 'audio', '3 Doors Down - Kryptonite.mp3', '', '2014-07-26 15:02:33', NULL, NULL, 'P', 'P', 'P', 1),
(485, 'audio', 'ACDC - Thunderstruck.mp3', '', '2014-07-26 15:02:34', NULL, NULL, 'P', 'P', 'P', 1),
(486, 'image', 'AlbumArt_{00000000-0000-0000-0000-000000000000}_Large.jpg', 'image/jpg', '2014-07-26 15:02:35', '2014-07-26 15:02:35', NULL, 'P', 'P', 'P', 1),
(487, 'image', 'AlbumArt_{00000000-0000-0000-0000-000000000000}_Small.jpg', 'image/jpg', '2014-07-26 15:02:36', '2014-07-26 15:02:36', NULL, 'P', 'P', 'P', 1),
(488, 'image', 'AlbumArt_{04939267-EC6B-4A31-87B1-B6C1562C829C}_Large.jpg', 'image/jpg', '2014-07-26 15:02:36', '2014-07-26 15:02:37', NULL, 'P', 'P', 'P', 1),
(489, 'image', 'AlbumArt_{04939267-EC6B-4A31-87B1-B6C1562C829C}_Small.jpg', 'image/jpg', '2014-07-26 15:02:37', '2014-07-26 15:02:37', NULL, 'P', 'P', 'P', 1),
(490, 'image', 'AlbumArt_{07362AA2-3501-42D2-B27E-4D0E630F3883}_Large.jpg', 'image/jpg', '2014-07-26 15:02:38', '2014-07-26 15:02:38', NULL, 'P', 'P', 'P', 1),
(491, 'image', 'AlbumArt_{07362AA2-3501-42D2-B27E-4D0E630F3883}_Small.jpg', 'image/jpg', '2014-07-26 15:02:39', '2014-07-26 15:02:39', NULL, 'P', 'P', 'P', 1),
(492, 'image', 'AlbumArt_{0E48572C-0E08-451F-A76C-4B6F211CC8DB}_Large.jpg', 'image/jpg', '2014-07-26 15:02:40', '2014-07-26 15:02:40', NULL, 'P', 'P', 'P', 1),
(493, 'image', 'AlbumArt_{0E48572C-0E08-451F-A76C-4B6F211CC8DB}_Small.jpg', 'image/jpg', '2014-07-26 15:02:42', '2014-07-26 15:02:43', NULL, 'P', 'P', 'P', 1),
(494, 'image', 'AlbumArt_{1ECF378A-9C52-49C4-9AB7-D2A07057FE5B}_Large.jpg', 'image/jpg', '2014-07-26 15:02:44', '2014-07-26 15:02:44', NULL, 'P', 'P', 'P', 1),
(495, 'image', 'AlbumArt_{1ECF378A-9C52-49C4-9AB7-D2A07057FE5B}_Small.jpg', 'image/jpg', '2014-07-26 15:02:45', '2014-07-26 15:02:45', NULL, 'P', 'P', 'P', 1),
(496, 'image', 'AlbumArt_{1FFF09BC-974F-43F5-A209-532B159ABA62}_Large.jpg', 'image/jpg', '2014-07-26 15:02:46', '2014-07-26 15:02:46', NULL, 'P', 'P', 'P', 1),
(497, 'image', 'AlbumArt_{1FFF09BC-974F-43F5-A209-532B159ABA62}_Small.jpg', 'image/jpg', '2014-07-26 15:02:47', '2014-07-26 15:02:47', NULL, 'P', 'P', 'P', 1),
(498, 'image', 'AlbumArt_{2C37F23F-6CEA-4CBC-B2F9-BE20D211E5EC}_Large.jpg', 'image/jpg', '2014-07-26 15:02:48', '2014-07-26 15:02:49', NULL, 'P', 'P', 'P', 1),
(499, 'image', 'AlbumArt_{2C37F23F-6CEA-4CBC-B2F9-BE20D211E5EC}_Small.jpg', 'image/jpg', '2014-07-26 15:02:50', '2014-07-26 15:02:50', NULL, 'P', 'P', 'P', 1),
(500, 'image', 'AlbumArt_{2C1479D0-314B-4657-A6E0-6E29BE5799DA}_Large.jpg', 'image/jpg', '2014-07-26 15:02:51', '2014-07-26 15:02:51', NULL, 'P', 'P', 'P', 1),
(501, 'image', 'AlbumArt_{2C1479D0-314B-4657-A6E0-6E29BE5799DA}_Small.jpg', 'image/jpg', '2014-07-26 15:02:52', '2014-07-26 15:02:52', NULL, 'P', 'P', 'P', 1),
(502, 'image', 'AlbumArt_{2D899952-7A87-4826-B29B-1FAB7BCB0DFE}_Large.jpg', 'image/jpg', '2014-07-26 15:02:53', '2014-07-26 15:02:53', NULL, 'P', 'P', 'P', 1),
(503, 'image', 'AlbumArt_{2D899952-7A87-4826-B29B-1FAB7BCB0DFE}_Small.jpg', 'image/jpg', '2014-07-26 15:02:54', '2014-07-26 15:02:55', NULL, 'P', 'P', 'P', 1),
(504, 'image', 'AlbumArt_{2EA67A22-2D46-4688-BE53-19FAD042B98D}_Large.jpg', 'image/jpg', '2014-07-26 15:02:56', '2014-07-26 15:02:56', NULL, 'P', 'P', 'P', 1),
(505, 'image', 'AlbumArt_{2EA67A22-2D46-4688-BE53-19FAD042B98D}_Small.jpg', 'image/jpg', '2014-07-26 15:02:57', '2014-07-26 15:02:58', NULL, 'P', 'P', 'P', 1),
(506, 'image', 'AlbumArt_{2EFF78DF-4DFB-43E0-A82A-E6ECC51A1DD8}_Large.jpg', 'image/jpg', '2014-07-26 15:02:59', '2014-07-26 15:02:59', NULL, 'P', 'P', 'P', 1),
(507, 'image', 'AlbumArt_{2EFF78DF-4DFB-43E0-A82A-E6ECC51A1DD8}_Small.jpg', 'image/jpg', '2014-07-26 15:03:00', '2014-07-26 15:03:01', NULL, 'P', 'P', 'P', 1),
(508, 'image', 'AlbumArt_{3A49969E-D4B3-4157-B00D-A4051BB443C2}_Large.jpg', 'image/jpg', '2014-07-26 15:03:02', '2014-07-26 15:03:02', NULL, 'P', 'P', 'P', 1),
(509, 'image', 'AlbumArt_{3A49969E-D4B3-4157-B00D-A4051BB443C2}_Small.jpg', 'image/jpg', '2014-07-26 15:03:03', '2014-07-26 15:03:03', NULL, 'P', 'P', 'P', 1),
(510, 'image', 'AlbumArt_{3C2DAF84-4CDF-4EC7-B221-FDDA0BBFA4C3}_Large.jpg', 'image/jpg', '2014-07-26 15:03:05', '2014-07-26 15:03:05', NULL, 'P', 'P', 'P', 1),
(511, 'image', 'AlbumArt_{3C2DAF84-4CDF-4EC7-B221-FDDA0BBFA4C3}_Small.jpg', 'image/jpg', '2014-07-26 15:03:07', '2014-07-26 15:03:07', NULL, 'P', 'P', 'P', 1),
(512, 'image', 'AlbumArt_{3E792CE4-6590-42FA-A957-EA26C3B1B197}_Large.jpg', 'image/jpg', '2014-07-26 15:03:08', '2014-07-26 15:03:08', NULL, 'P', 'P', 'P', 1),
(513, 'image', 'AlbumArt_{3E792CE4-6590-42FA-A957-EA26C3B1B197}_Small.jpg', 'image/jpg', '2014-07-26 15:03:10', '2014-07-26 15:03:10', NULL, 'P', 'P', 'P', 1),
(514, 'image', 'AlbumArt_{4B01FDCA-DFB5-4022-A7D2-765ED95974FF}_Large.jpg', 'image/jpg', '2014-07-26 15:03:11', '2014-07-26 15:03:11', NULL, 'P', 'P', 'P', 1),
(515, 'image', 'AlbumArt_{4B01FDCA-DFB5-4022-A7D2-765ED95974FF}_Small.jpg', 'image/jpg', '2014-07-26 15:03:13', '2014-07-26 15:03:13', NULL, 'P', 'P', 'P', 1),
(516, 'image', 'AlbumArt_{4BE98DF1-87AD-42E1-8364-1BA4E01129CC}_Large.jpg', 'image/jpg', '2014-07-26 15:03:14', '2014-07-26 15:03:14', NULL, 'P', 'P', 'P', 1),
(517, 'image', 'AlbumArt_{4BE98DF1-87AD-42E1-8364-1BA4E01129CC}_Small.jpg', 'image/jpg', '2014-07-26 15:03:15', '2014-07-26 15:03:16', NULL, 'P', 'P', 'P', 1),
(518, 'image', 'AlbumArt_{4C8EB604-6CC0-44D9-BC5A-B6CD25A468BD}_Large.jpg', 'image/jpg', '2014-07-26 15:03:17', '2014-07-26 15:03:17', NULL, 'P', 'P', 'P', 1),
(519, 'image', 'AlbumArt_{4C8EB604-6CC0-44D9-BC5A-B6CD25A468BD}_Small.jpg', 'image/jpg', '2014-07-26 15:03:19', '2014-07-26 15:03:19', NULL, 'P', 'P', 'P', 1),
(520, 'image', 'AlbumArt_{4D34F359-9A41-47B5-9530-4080F8F539BB}_Large.jpg', 'image/jpg', '2014-07-26 15:03:20', '2014-07-26 15:03:20', NULL, 'P', 'P', 'P', 1),
(521, 'image', 'AlbumArt_{4D34F359-9A41-47B5-9530-4080F8F539BB}_Small.jpg', 'image/jpg', '2014-07-26 15:03:22', '2014-07-26 15:03:22', NULL, 'P', 'P', 'P', 1),
(522, 'image', 'AlbumArt_{5CF855DB-24FC-421B-AE49-74BFF4A696E6}_Large.jpg', 'image/jpg', '2014-07-26 15:03:23', '2014-07-26 15:03:23', NULL, 'P', 'P', 'P', 1),
(523, 'image', 'AlbumArt_{5CF855DB-24FC-421B-AE49-74BFF4A696E6}_Small.jpg', 'image/jpg', '2014-07-26 15:03:25', '2014-07-26 15:03:25', NULL, 'P', 'P', 'P', 1),
(524, 'image', 'AlbumArt_{5D7495BC-8E8B-4EF3-9DD5-FF6CA4F95EC9}_Large.jpg', 'image/jpg', '2014-07-26 15:03:27', '2014-07-26 15:03:27', NULL, 'P', 'P', 'P', 1),
(525, 'image', 'AlbumArt_{5D7495BC-8E8B-4EF3-9DD5-FF6CA4F95EC9}_Small.jpg', 'image/jpg', '2014-07-26 15:03:29', '2014-07-26 15:03:29', NULL, 'P', 'P', 'P', 1),
(526, 'image', 'AlbumArt_{5ED6F754-C11B-4040-8BDA-59361F4FD633}_Large.jpg', 'image/jpg', '2014-07-26 15:03:30', '2014-07-26 15:03:30', NULL, 'P', 'P', 'P', 1),
(527, 'image', 'AlbumArt_{5ED6F754-C11B-4040-8BDA-59361F4FD633}_Small.jpg', 'image/jpg', '2014-07-26 15:03:32', '2014-07-26 15:03:32', NULL, 'P', 'P', 'P', 1),
(528, 'image', 'AlbumArt_{8C194B39-A10C-4BB6-95E2-A142FCAE7AD5}_Large.jpg', 'image/jpg', '2014-07-26 15:03:33', '2014-07-26 15:03:33', NULL, 'P', 'P', 'P', 1),
(529, 'image', 'AlbumArt_{8C194B39-A10C-4BB6-95E2-A142FCAE7AD5}_Small.jpg', 'image/jpg', '2014-07-26 15:03:35', '2014-07-26 15:03:35', NULL, 'P', 'P', 'P', 1),
(530, 'image', 'AlbumArt_{8CC6D02F-7D72-487E-A929-EB1F6A7F3A3C}_Large.jpg', 'image/jpg', '2014-07-26 15:03:36', '2014-07-26 15:03:36', NULL, 'P', 'P', 'P', 1),
(531, 'image', 'AlbumArt_{8CC6D02F-7D72-487E-A929-EB1F6A7F3A3C}_Small.jpg', 'image/jpg', '2014-07-26 15:03:38', '2014-07-26 15:03:38', NULL, 'P', 'P', 'P', 1),
(532, 'image', 'AlbumArt_{8CE31495-5AFD-4138-812A-7AA36D55CF00}_Large.jpg', 'image/jpg', '2014-07-26 15:03:39', '2014-07-26 15:03:39', NULL, 'P', 'P', 'P', 1),
(533, 'image', 'AlbumArt_{8CE31495-5AFD-4138-812A-7AA36D55CF00}_Small.jpg', 'image/jpg', '2014-07-26 15:03:41', '2014-07-26 15:03:41', NULL, 'P', 'P', 'P', 1),
(534, 'image', 'AlbumArt_{8CF261FD-54AF-438B-BCEF-07CC6846BA69}_Large.jpg', 'image/jpg', '2014-07-26 15:03:43', '2014-07-26 15:03:43', NULL, 'P', 'P', 'P', 1),
(535, 'image', 'AlbumArt_{8CF261FD-54AF-438B-BCEF-07CC6846BA69}_Small.jpg', 'image/jpg', '2014-07-26 15:03:44', '2014-07-26 15:03:45', NULL, 'P', 'P', 'P', 1),
(536, 'image', 'AlbumArt_{8DE1BB63-9D94-4D23-A3B9-FD453B0BE142}_Large.jpg', 'image/jpg', '2014-07-26 15:03:46', '2014-07-26 15:03:46', NULL, 'P', 'P', 'P', 1),
(537, 'image', 'AlbumArt_{8DE1BB63-9D94-4D23-A3B9-FD453B0BE142}_Small.jpg', 'image/jpg', '2014-07-26 15:03:48', '2014-07-26 15:03:48', NULL, 'P', 'P', 'P', 1),
(538, 'image', 'AlbumArt_{8E6D4DC1-D9B1-4902-93DA-73304C1AC434}_Large.jpg', 'image/jpg', '2014-07-26 15:03:49', '2014-07-26 15:03:50', NULL, 'P', 'P', 'P', 1),
(539, 'image', 'AlbumArt_{8E6D4DC1-D9B1-4902-93DA-73304C1AC434}_Small.jpg', 'image/jpg', '2014-07-26 15:03:52', '2014-07-26 15:03:52', NULL, 'P', 'P', 'P', 1),
(540, 'audio', '3 Doors Down - Kryptonite.mp3', '', '2014-07-26 15:04:06', NULL, NULL, 'P', 'P', 'P', 1),
(541, 'audio', 'ACDC - Thunderstruck.mp3', '', '2014-07-26 15:04:08', NULL, NULL, 'P', 'P', 'P', 1),
(542, 'image', 'AlbumArt_{00000000-0000-0000-0000-000000000000}_Large.jpg', 'image/jpg', '2014-07-26 15:04:09', '2014-07-26 15:04:10', NULL, 'P', 'P', 'P', 1),
(543, 'image', 'AlbumArt_{00000000-0000-0000-0000-000000000000}_Small.jpg', 'image/jpg', '2014-07-26 15:04:11', '2014-07-26 15:04:11', NULL, 'P', 'P', 'P', 1),
(544, 'image', 'AlbumArt_{04939267-EC6B-4A31-87B1-B6C1562C829C}_Large.jpg', 'image/jpg', '2014-07-26 15:04:12', '2014-07-26 15:04:13', NULL, 'P', 'P', 'P', 1),
(545, 'image', 'AlbumArt_{04939267-EC6B-4A31-87B1-B6C1562C829C}_Small.jpg', 'image/jpg', '2014-07-26 15:04:14', '2014-07-26 15:04:14', NULL, 'P', 'P', 'P', 1),
(546, 'image', 'AlbumArt_{07362AA2-3501-42D2-B27E-4D0E630F3883}_Large.jpg', 'image/jpg', '2014-07-26 15:04:16', '2014-07-26 15:04:16', NULL, 'P', 'P', 'P', 1),
(547, 'image', 'AlbumArt_{07362AA2-3501-42D2-B27E-4D0E630F3883}_Small.jpg', 'image/jpg', '2014-07-26 15:04:18', '2014-07-26 15:04:18', NULL, 'P', 'P', 'P', 1),
(548, 'image', 'AlbumArt_{0E48572C-0E08-451F-A76C-4B6F211CC8DB}_Large.jpg', 'image/jpg', '2014-07-26 15:04:20', '2014-07-26 15:04:20', NULL, 'P', 'P', 'P', 1),
(549, 'image', 'AlbumArt_{0E48572C-0E08-451F-A76C-4B6F211CC8DB}_Small.jpg', 'image/jpg', '2014-07-26 15:04:22', '2014-07-26 15:04:22', NULL, 'P', 'P', 'P', 1),
(550, 'image', 'AlbumArt_{1ECF378A-9C52-49C4-9AB7-D2A07057FE5B}_Large.jpg', 'image/jpg', '2014-07-26 15:04:23', '2014-07-26 15:04:24', NULL, 'P', 'P', 'P', 1),
(551, 'image', 'AlbumArt_{1ECF378A-9C52-49C4-9AB7-D2A07057FE5B}_Small.jpg', 'image/jpg', '2014-07-26 15:04:25', '2014-07-26 15:04:25', NULL, 'P', 'P', 'P', 1),
(552, 'image', 'AlbumArt_{1FFF09BC-974F-43F5-A209-532B159ABA62}_Large.jpg', 'image/jpg', '2014-07-26 15:04:27', '2014-07-26 15:04:27', NULL, 'P', 'P', 'P', 1),
(553, 'image', 'AlbumArt_{1FFF09BC-974F-43F5-A209-532B159ABA62}_Small.jpg', 'image/jpg', '2014-07-26 15:04:29', '2014-07-26 15:04:29', NULL, 'P', 'P', 'P', 1),
(554, 'image', 'AlbumArt_{2C37F23F-6CEA-4CBC-B2F9-BE20D211E5EC}_Large.jpg', 'image/jpg', '2014-07-26 15:04:31', '2014-07-26 15:04:31', NULL, 'P', 'P', 'P', 1),
(555, 'image', 'AlbumArt_{2C37F23F-6CEA-4CBC-B2F9-BE20D211E5EC}_Small.jpg', 'image/jpg', '2014-07-26 15:04:33', '2014-07-26 15:04:33', NULL, 'P', 'P', 'P', 1),
(556, 'image', 'AlbumArt_{2C1479D0-314B-4657-A6E0-6E29BE5799DA}_Large.jpg', 'image/jpg', '2014-07-26 15:04:34', '2014-07-26 15:04:34', NULL, 'P', 'P', 'P', 1),
(557, 'image', 'AlbumArt_{2C1479D0-314B-4657-A6E0-6E29BE5799DA}_Small.jpg', 'image/jpg', '2014-07-26 15:04:36', '2014-07-26 15:04:36', NULL, 'P', 'P', 'P', 1),
(558, 'image', 'AlbumArt_{2D899952-7A87-4826-B29B-1FAB7BCB0DFE}_Large.jpg', 'image/jpg', '2014-07-26 15:04:38', '2014-07-26 15:04:38', NULL, 'P', 'P', 'P', 1),
(559, 'image', 'AlbumArt_{2D899952-7A87-4826-B29B-1FAB7BCB0DFE}_Small.jpg', 'image/jpg', '2014-07-26 15:04:40', '2014-07-26 15:04:40', NULL, 'P', 'P', 'P', 1),
(560, 'image', 'AlbumArt_{2EA67A22-2D46-4688-BE53-19FAD042B98D}_Large.jpg', 'image/jpg', '2014-07-26 15:04:41', '2014-07-26 15:04:42', NULL, 'P', 'P', 'P', 1),
(561, 'image', 'AlbumArt_{2EA67A22-2D46-4688-BE53-19FAD042B98D}_Small.jpg', 'image/jpg', '2014-07-26 15:04:43', '2014-07-26 15:04:43', NULL, 'P', 'P', 'P', 1),
(562, 'image', 'AlbumArt_{2EFF78DF-4DFB-43E0-A82A-E6ECC51A1DD8}_Large.jpg', 'image/jpg', '2014-07-26 15:04:45', '2014-07-26 15:04:46', NULL, 'P', 'P', 'P', 1),
(563, 'image', 'AlbumArt_{2EFF78DF-4DFB-43E0-A82A-E6ECC51A1DD8}_Small.jpg', 'image/jpg', '2014-07-26 15:04:47', '2014-07-26 15:04:47', NULL, 'P', 'P', 'P', 1),
(564, 'image', 'AlbumArt_{3A49969E-D4B3-4157-B00D-A4051BB443C2}_Large.jpg', 'image/jpg', '2014-07-26 15:04:49', '2014-07-26 15:04:49', NULL, 'P', 'P', 'P', 1),
(565, 'image', 'AlbumArt_{3A49969E-D4B3-4157-B00D-A4051BB443C2}_Small.jpg', 'image/jpg', '2014-07-26 15:04:51', '2014-07-26 15:04:52', NULL, 'P', 'P', 'P', 1),
(566, 'image', 'AlbumArt_{3C2DAF84-4CDF-4EC7-B221-FDDA0BBFA4C3}_Large.jpg', 'image/jpg', '2014-07-26 15:04:54', '2014-07-26 15:04:54', NULL, 'P', 'P', 'P', 1),
(567, 'image', 'AlbumArt_{3C2DAF84-4CDF-4EC7-B221-FDDA0BBFA4C3}_Small.jpg', 'image/jpg', '2014-07-26 15:04:56', '2014-07-26 15:04:56', NULL, 'P', 'P', 'P', 1),
(568, 'image', 'AlbumArt_{3E792CE4-6590-42FA-A957-EA26C3B1B197}_Large.jpg', 'image/jpg', '2014-07-26 15:04:58', '2014-07-26 15:04:58', NULL, 'P', 'P', 'P', 1),
(569, 'image', 'AlbumArt_{3E792CE4-6590-42FA-A957-EA26C3B1B197}_Small.jpg', 'image/jpg', '2014-07-26 15:04:59', '2014-07-26 15:05:00', NULL, 'P', 'P', 'P', 1),
(570, 'image', 'AlbumArt_{4B01FDCA-DFB5-4022-A7D2-765ED95974FF}_Large.jpg', 'image/jpg', '2014-07-26 15:05:01', '2014-07-26 15:05:01', NULL, 'P', 'P', 'P', 1),
(571, 'image', 'AlbumArt_{4B01FDCA-DFB5-4022-A7D2-765ED95974FF}_Small.jpg', 'image/jpg', '2014-07-26 15:05:03', '2014-07-26 15:05:04', NULL, 'P', 'P', 'P', 1),
(572, 'image', 'AlbumArt_{4BE98DF1-87AD-42E1-8364-1BA4E01129CC}_Large.jpg', 'image/jpg', '2014-07-26 15:05:05', '2014-07-26 15:05:06', NULL, 'P', 'P', 'P', 1),
(573, 'image', 'AlbumArt_{4BE98DF1-87AD-42E1-8364-1BA4E01129CC}_Small.jpg', 'image/jpg', '2014-07-26 15:05:08', '2014-07-26 15:05:08', NULL, 'P', 'P', 'P', 1),
(574, 'image', 'AlbumArt_{4C8EB604-6CC0-44D9-BC5A-B6CD25A468BD}_Large.jpg', 'image/jpg', '2014-07-26 15:05:10', '2014-07-26 15:05:10', NULL, 'P', 'P', 'P', 1),
(575, 'image', 'AlbumArt_{4C8EB604-6CC0-44D9-BC5A-B6CD25A468BD}_Small.jpg', 'image/jpg', '2014-07-26 15:05:11', '2014-07-26 15:05:12', NULL, 'P', 'P', 'P', 1),
(576, 'image', 'AlbumArt_{4D34F359-9A41-47B5-9530-4080F8F539BB}_Large.jpg', 'image/jpg', '2014-07-26 15:05:13', '2014-07-26 15:05:14', NULL, 'P', 'P', 'P', 1),
(577, 'image', 'AlbumArt_{4D34F359-9A41-47B5-9530-4080F8F539BB}_Small.jpg', 'image/jpg', '2014-07-26 15:05:15', '2014-07-26 15:05:16', NULL, 'P', 'P', 'P', 1),
(578, 'image', 'AlbumArt_{5CF855DB-24FC-421B-AE49-74BFF4A696E6}_Large.jpg', 'image/jpg', '2014-07-26 15:05:18', '2014-07-26 15:05:18', NULL, 'P', 'P', 'P', 1),
(579, 'image', 'AlbumArt_{5CF855DB-24FC-421B-AE49-74BFF4A696E6}_Small.jpg', 'image/jpg', '2014-07-26 15:05:20', '2014-07-26 15:05:20', NULL, 'P', 'P', 'P', 1),
(580, 'image', 'AlbumArt_{5D7495BC-8E8B-4EF3-9DD5-FF6CA4F95EC9}_Large.jpg', 'image/jpg', '2014-07-26 15:05:22', '2014-07-26 15:05:22', NULL, 'P', 'P', 'P', 1),
(581, 'image', 'AlbumArt_{5D7495BC-8E8B-4EF3-9DD5-FF6CA4F95EC9}_Small.jpg', 'image/jpg', '2014-07-26 15:05:24', '2014-07-26 15:05:25', NULL, 'P', 'P', 'P', 1),
(582, 'image', 'AlbumArt_{5ED6F754-C11B-4040-8BDA-59361F4FD633}_Large.jpg', 'image/jpg', '2014-07-26 15:05:27', '2014-07-26 15:05:27', NULL, 'P', 'P', 'P', 1),
(583, 'image', 'AlbumArt_{5ED6F754-C11B-4040-8BDA-59361F4FD633}_Small.jpg', 'image/jpg', '2014-07-26 15:05:29', '2014-07-26 15:05:29', NULL, 'P', 'P', 'P', 1),
(584, 'image', 'AlbumArt_{8C194B39-A10C-4BB6-95E2-A142FCAE7AD5}_Large.jpg', 'image/jpg', '2014-07-26 15:05:31', '2014-07-26 15:05:31', NULL, 'P', 'P', 'P', 1),
(585, 'image', 'AlbumArt_{8C194B39-A10C-4BB6-95E2-A142FCAE7AD5}_Small.jpg', 'image/jpg', '2014-07-26 15:05:33', '2014-07-26 15:05:33', NULL, 'P', 'P', 'P', 1),
(586, 'image', 'AlbumArt_{8CC6D02F-7D72-487E-A929-EB1F6A7F3A3C}_Large.jpg', 'image/jpg', '2014-07-26 15:05:35', '2014-07-26 15:05:36', NULL, 'P', 'P', 'P', 1),
(587, 'image', 'AlbumArt_{8CC6D02F-7D72-487E-A929-EB1F6A7F3A3C}_Small.jpg', 'image/jpg', '2014-07-26 15:05:37', '2014-07-26 15:05:37', NULL, 'P', 'P', 'P', 1),
(588, 'image', 'AlbumArt_{8CE31495-5AFD-4138-812A-7AA36D55CF00}_Large.jpg', 'image/jpg', '2014-07-26 15:05:39', '2014-07-26 15:05:39', NULL, 'P', 'P', 'P', 1),
(589, 'image', 'AlbumArt_{8CE31495-5AFD-4138-812A-7AA36D55CF00}_Small.jpg', 'image/jpg', '2014-07-26 15:05:41', '2014-07-26 15:05:41', NULL, 'P', 'P', 'P', 1),
(590, 'image', 'AlbumArt_{8CF261FD-54AF-438B-BCEF-07CC6846BA69}_Large.jpg', 'image/jpg', '2014-07-26 15:05:43', '2014-07-26 15:05:43', NULL, 'P', 'P', 'P', 1),
(591, 'image', 'AlbumArt_{8CF261FD-54AF-438B-BCEF-07CC6846BA69}_Small.jpg', 'image/jpg', '2014-07-26 15:05:45', '2014-07-26 15:05:45', NULL, 'P', 'P', 'P', 1),
(592, 'image', 'AlbumArt_{8DE1BB63-9D94-4D23-A3B9-FD453B0BE142}_Large.jpg', 'image/jpg', '2014-07-26 15:05:47', '2014-07-26 15:05:48', NULL, 'P', 'P', 'P', 1),
(593, 'image', 'AlbumArt_{8DE1BB63-9D94-4D23-A3B9-FD453B0BE142}_Small.jpg', 'image/jpg', '2014-07-26 15:05:49', '2014-07-26 15:05:50', NULL, 'P', 'P', 'P', 1),
(594, 'image', 'AlbumArt_{8E6D4DC1-D9B1-4902-93DA-73304C1AC434}_Large.jpg', 'image/jpg', '2014-07-26 15:05:51', '2014-07-26 15:05:52', NULL, 'P', 'P', 'P', 1),
(595, 'image', 'AlbumArt_{8E6D4DC1-D9B1-4902-93DA-73304C1AC434}_Small.jpg', 'image/jpg', '2014-07-26 15:05:54', '2014-07-26 15:05:54', NULL, 'P', 'P', 'P', 1),
(596, 'image', 'AlbumArt_{9A9E9A94-C9B2-40C7-A478-1843A06536CE}_Large.jpg', 'image/jpg', '2014-07-26 15:05:56', '2014-07-26 15:05:56', NULL, 'P', 'P', 'P', 1),
(597, 'image', 'AlbumArt_{9A9E9A94-C9B2-40C7-A478-1843A06536CE}_Small.jpg', 'image/jpg', '2014-07-26 15:05:58', '2014-07-26 15:05:58', NULL, 'P', 'P', 'P', 1),
(598, 'image', 'AlbumArt_{9E0033EB-DEDB-4BA5-BD4B-171F47D635B1}_Large.jpg', 'image/jpg', '2014-07-26 15:06:00', '2014-07-26 15:06:00', NULL, 'P', 'P', 'P', 1),
(599, 'image', 'AlbumArt_{9E0033EB-DEDB-4BA5-BD4B-171F47D635B1}_Small.jpg', 'image/jpg', '2014-07-26 15:06:03', '2014-07-26 15:06:03', NULL, 'P', 'P', 'P', 1),
(600, 'image', 'AlbumArt_{14D01E1F-D0FA-4745-8D31-FE3A75827BDC}_Large.jpg', 'image/jpg', '2014-07-26 15:06:05', '2014-07-26 15:06:05', NULL, 'P', 'P', 'P', 1),
(601, 'image', 'AlbumArt_{14D01E1F-D0FA-4745-8D31-FE3A75827BDC}_Small.jpg', 'image/jpg', '2014-07-26 15:06:07', '2014-07-26 15:06:07', NULL, 'P', 'P', 'P', 1),
(602, 'image', 'AlbumArt_{26DE6AEC-984D-4D45-A6FE-DC6FAA198BAD}_Large.jpg', 'image/jpg', '2014-07-26 15:06:09', '2014-07-26 15:06:09', NULL, 'P', 'P', 'P', 1),
(603, 'image', 'AlbumArt_{26DE6AEC-984D-4D45-A6FE-DC6FAA198BAD}_Small.jpg', 'image/jpg', '2014-07-26 15:06:11', '2014-07-26 15:06:11', NULL, 'P', 'P', 'P', 1),
(604, 'image', 'AlbumArt_{38F3700B-ABE6-48BE-AA80-5996F47D8496}_Large.jpg', 'image/jpg', '2014-07-26 15:06:13', '2014-07-26 15:06:13', NULL, 'P', 'P', 'P', 1),
(605, 'image', 'AlbumArt_{38F3700B-ABE6-48BE-AA80-5996F47D8496}_Small.jpg', 'image/jpg', '2014-07-26 15:06:15', '2014-07-26 15:06:15', NULL, 'P', 'P', 'P', 1),
(606, 'image', 'AlbumArt_{63F6051E-0C74-41DB-A3DC-911C803E4FDE}_Large.jpg', 'image/jpg', '2014-07-26 15:06:17', '2014-07-26 15:06:18', NULL, 'P', 'P', 'P', 1),
(607, 'image', 'AlbumArt_{63F6051E-0C74-41DB-A3DC-911C803E4FDE}_Small.jpg', 'image/jpg', '2014-07-26 15:06:20', '2014-07-26 15:06:20', NULL, 'P', 'P', 'P', 1),
(608, 'image', 'AlbumArt_{67AC618B-4202-44CE-B8C8-4CB93293B745}_Large.jpg', 'image/jpg', '2014-07-26 15:06:23', '2014-07-26 15:06:23', NULL, 'P', 'P', 'P', 1),
(609, 'image', 'AlbumArt_{67AC618B-4202-44CE-B8C8-4CB93293B745}_Small.jpg', 'image/jpg', '2014-07-26 15:06:26', '2014-07-26 15:06:26', NULL, 'P', 'P', 'P', 1),
(610, 'image', 'AlbumArt_{71C8AA8A-0843-4D43-BE56-4B852AAA5F60}_Large.jpg', 'image/jpg', '2014-07-26 15:06:28', '2014-07-26 15:06:28', NULL, 'P', 'P', 'P', 1),
(611, 'image', 'AlbumArt_{71C8AA8A-0843-4D43-BE56-4B852AAA5F60}_Small.jpg', 'image/jpg', '2014-07-26 15:06:31', '2014-07-26 15:06:31', NULL, 'P', 'P', 'P', 1),
(612, 'image', 'AlbumArt_{74A41D62-75D3-4FE6-8008-0065DB2D5E09}_Large.jpg', 'image/jpg', '2014-07-26 15:06:33', '2014-07-26 15:06:34', NULL, 'P', 'P', 'P', 1),
(613, 'image', 'AlbumArt_{74A41D62-75D3-4FE6-8008-0065DB2D5E09}_Small.jpg', 'image/jpg', '2014-07-26 15:06:36', '2014-07-26 15:06:36', NULL, 'P', 'P', 'P', 1),
(614, 'image', 'AlbumArt_{181BDA4C-FBAA-4506-99DA-8A74D7C23C36}_Large.jpg', 'image/jpg', '2014-07-26 15:06:38', '2014-07-26 15:06:39', NULL, 'P', 'P', 'P', 1),
(615, 'image', 'AlbumArt_{181BDA4C-FBAA-4506-99DA-8A74D7C23C36}_Small.jpg', 'image/jpg', '2014-07-26 15:06:41', '2014-07-26 15:06:41', NULL, 'P', 'P', 'P', 1),
(616, 'image', 'AlbumArt_{316BF3D9-9CEA-418A-AE26-2607680B4D3B}_Large.jpg', 'image/jpg', '2014-07-26 15:06:43', '2014-07-26 15:06:43', NULL, 'P', 'P', 'P', 1),
(617, 'image', 'AlbumArt_{316BF3D9-9CEA-418A-AE26-2607680B4D3B}_Small.jpg', 'image/jpg', '2014-07-26 15:06:45', '2014-07-26 15:06:45', NULL, 'P', 'P', 'P', 1),
(618, 'image', 'AlbumArt_{341D9DCE-750D-4DCC-BDB3-805B51487DFD}_Large.jpg', 'image/jpg', '2014-07-26 15:06:47', '2014-07-26 15:06:47', NULL, 'P', 'P', 'P', 1),
(619, 'image', 'AlbumArt_{341D9DCE-750D-4DCC-BDB3-805B51487DFD}_Small.jpg', 'image/jpg', '2014-07-26 15:06:50', '2014-07-26 15:06:50', NULL, 'P', 'P', 'P', 1),
(620, 'image', 'AlbumArt_{345ACDEF-241B-4D67-B0F4-01BA2770DCC0}_Large.jpg', 'image/jpg', '2014-07-26 15:06:52', '2014-07-26 15:06:52', NULL, 'P', 'P', 'P', 1),
(621, 'image', 'AlbumArt_{345ACDEF-241B-4D67-B0F4-01BA2770DCC0}_Small.jpg', 'image/jpg', '2014-07-26 15:06:54', '2014-07-26 15:06:54', NULL, 'P', 'P', 'P', 1),
(622, 'image', 'AlbumArt_{353DB83D-619C-49D3-9DCA-113983D4611A}_Large.jpg', 'image/jpg', '2014-07-26 15:06:56', '2014-07-26 15:06:57', NULL, 'P', 'P', 'P', 1),
(623, 'image', 'AlbumArt_{353DB83D-619C-49D3-9DCA-113983D4611A}_Small.jpg', 'image/jpg', '2014-07-26 15:06:59', '2014-07-26 15:06:59', NULL, 'P', 'P', 'P', 1),
(624, 'image', 'AlbumArt_{412E1AA0-71D8-4CF2-B7A0-E3034E07EF91}_Large.jpg', 'image/jpg', '2014-07-26 15:07:03', '2014-07-26 15:07:03', NULL, 'P', 'P', 'P', 1),
(625, 'image', 'AlbumArt_{412E1AA0-71D8-4CF2-B7A0-E3034E07EF91}_Small.jpg', 'image/jpg', '2014-07-26 15:07:06', '2014-07-26 15:07:06', NULL, 'P', 'P', 'P', 1),
(626, 'image', 'AlbumArt_{456DF009-67E9-42B9-AD83-9EAF515A41AA}_Large.jpg', 'image/jpg', '2014-07-26 15:07:08', '2014-07-26 15:07:08', NULL, 'P', 'P', 'P', 1),
(627, 'image', 'AlbumArt_{456DF009-67E9-42B9-AD83-9EAF515A41AA}_Small.jpg', 'image/jpg', '2014-07-26 15:07:10', '2014-07-26 15:07:10', NULL, 'P', 'P', 'P', 1),
(628, 'image', 'AlbumArt_{844E2FDF-7009-4CBD-896C-6EFF74D743FC}_Large.jpg', 'image/jpg', '2014-07-26 15:07:12', '2014-07-26 15:07:13', NULL, 'P', 'P', 'P', 1),
(629, 'image', 'AlbumArt_{844E2FDF-7009-4CBD-896C-6EFF74D743FC}_Small.jpg', 'image/jpg', '2014-07-26 15:07:15', '2014-07-26 15:07:15', NULL, 'P', 'P', 'P', 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=204 ;

--
-- Dumping data for table `m2m_file_audio`
--

INSERT INTO `m2m_file_audio` (`id`, `title`, `artist`, `album`, `year`, `comment`, `track`, `genre`, `fileId`) VALUES
(1, 'Could you be loved', 'Bob Marley', 'Unknown Album', NULL, NULL, NULL, 'Other', 39),
(2, 'Test of MP3 File', 'Me', 'Me', '2006', 'test', '1', 'Other', 43),
(3, 'Test of MP3 File', 'Me', 'Me', '2006', 'test', '1', 'Other', 44),
(4, 'Test of MP3 File', 'Me', 'Me', '2006', 'test', '1', 'Other', 48),
(5, 'Test of MP3 File', 'Me', 'Me', '2006', 'test', '1', 'Other', 62),
(7, 'Tradition (Chapter II)', 'Illegal Substances', 'Tradition', '2013', NULL, '9', 'Psychedelic', 73),
(8, 'Matter Of Time', 'Illegal Substances', 'Tradition', '2013', NULL, '4', 'Psychedelic', 74),
(9, 'Transilence Thought Unifier (Illegal Substances Rmx)', 'Enarxis', 'Tradition', '2013', NULL, '6', 'Psychedelic', 75),
(10, 'The Quack', 'Illegal Substances', 'Tradition', '2013', NULL, '8', 'Psychedelic', 76),
(11, 'Way Home', 'Illegal Substances And Enarxis', 'Tradition', '2013', NULL, '7', 'Psychedelic', 77),
(12, 'Loud', 'Illegal Substances', 'Tradition', '2013', NULL, '5', 'Psychedelic', 88),
(13, 'Transilence Thought Unifier (Illegal Substances Rmx)', 'Enarxis', 'Tradition', '2013', NULL, '6', 'Psychedelic', 89),
(14, 'Way Home', 'Illegal Substances And Enarxis', 'Tradition', '2013', NULL, '7', 'Psychedelic', 90),
(15, 'The Quack', 'Illegal Substances', 'Tradition', '2013', NULL, NULL, 'Psychedelic', 91),
(16, 'Transilence Thought Unifier (Illegal Substances Rmx)', 'Enarxis', 'Tradition', '2013', NULL, '6', 'Psychedelic', 94),
(17, 'Way Home', 'Illegal Substances And Enarxis', 'Tradition', '2013', NULL, '7', 'Psychedelic', 95),
(18, 'Transilence Thought Unifier (Illegal Substances Rmx)', 'Enarxis', 'Tradition', '2013', NULL, '6', 'Psychedelic', 97),
(19, 'Night Substances', 'Illegal Substances And Argonnight', 'Tradition', '2013', NULL, '3', 'Psychedelic', 98),
(20, 'Benny Benassi - Satisfaction.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 118),
(21, 'Get Ready To Bounce', 'Brooklyn Bounce', 'Unknown Album', NULL, NULL, NULL, 'Club', 119),
(22, 'Children (Club Radio Edit)', '4 Clubbers', 'Children', '2001', 'Amazon.com Song ID: 215055176', '1', 'Other', 120),
(23, 'Alex Gaudino%20 Example%20 Divine Inspiration - I''m In Love%20 Kickstarts%20 The Way (Put Your Hand In My Hand).mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 150),
(24, 'My Oh My', 'Aqua', 'Aquarium', '1997', NULL, '2', 'Pop', 151),
(25, 'ATB - Don''t Stop.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 152),
(26, 'Avicii - Levels / ID (Radio Edit)', 'Unknown Artist', 'Unknown Album', '2011', 'www.dvdvideosoft.com', '1', NULL, 153),
(27, 'Benny Benassi - Satisfaction.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 154),
(28, 'Cry (Just A Little) (Original Mix)', 'Bingo Players', 'Cry (Just A Little)', '2011', NULL, '2', 'Other', 155),
(29, 'Bass, Beats &amp; Melody (Pulsedriver Remix)', 'Brooklyn Bounce', 'Bass, Beats &amp; Melody CDS', '2000', '::xMS::', '4', 'Techno', 156),
(30, 'Bass, Beats and Melody', 'Brooklyn Bounce', 'Total Groove 2: The Best in R&amp;B (disc 2)', '2008', 'www.piratebay.org', '4', 'Other', 157),
(31, 'Children (Club Radio Edit)', '4 Clubbers', 'Children', '2001', 'Amazon.com Song ID: 215055176', '1', 'Other', 158),
(32, 'Alex Gaudino%20 Example%20 Divine Inspiration - I''m In Love%20 Kickstarts%20 The Way (Put Your Hand In My Hand).mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 188),
(33, 'My Oh My', 'Aqua', 'Aquarium', '1997', NULL, '2', 'Pop', 189),
(34, 'ATB - Don''t Stop.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 190),
(35, 'Avicii - Levels / ID (Radio Edit)', 'Unknown Artist', 'Unknown Album', '2011', 'www.dvdvideosoft.com', '1', NULL, 191),
(36, 'Benny Benassi - Satisfaction.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 192),
(37, 'Cry (Just A Little) (Original Mix)', 'Bingo Players', 'Cry (Just A Little)', '2011', NULL, '2', 'Other', 193),
(38, 'Bass, Beats &amp; Melody (Pulsedriver Remix)', 'Brooklyn Bounce', 'Bass, Beats &amp; Melody CDS', '2000', '::xMS::', '4', 'Techno', 194),
(39, 'Bass, Beats and Melody', 'Brooklyn Bounce', 'Total Groove 2: The Best in R&amp;B (disc 2)', '2008', 'www.piratebay.org', '4', 'Other', 195),
(40, 'Get Ready To Bounce', 'Brooklyn Bounce', 'Unknown Album', NULL, NULL, NULL, 'Club', 196),
(41, 'Crookers - Knobbers.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 197),
(42, 'Around The World', 'Daft Punk', 'Discovery', '1997', '00000B99 00000B64 00003C18 000036F5 000138AE 0002E65E 00008000 00008000 00009C40 0000273E', '1', 'Other', 198),
(43, 'Daft Punk - Human After All%20 Burnin%20 Too Long.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 199),
(44, 'Drfunkenstein', 'Deadmau5', 'Vexillology', '2006', NULL, '3', 'Other', 200),
(45, 'Ghosts N Stuff (ft. Rob Swire)', 'Deadmau5', 'For Lack of a Better Name', '2009', 'In less than two years this Canadian-based whiz kid has gone from near obscurity to receiving numerous accolades. This Grammy-nominated, Juno award-winning electronic music sensation debuted as #11 of the top 100 DJ''s in the world! Now he''s about to unleash &quot;For Lack of A Better Name&quot;, the follow-up to his critically acclaimed 2008 debut &quot;Random Album Title&quot;. Here DEADMAU5 takes a different turn by incorporating various styles of music into multi-blocks of songs. The surefire hit from the number one-selling artist on Beatport and the most in-demand producer in electronic music today!', '3', 'Other', 201),
(46, 'FasTEr', 'DJ Mangoo', 'Mangoo Mix', NULL, '0000087A 00000916 00001A6A 000021CA 0001D505 0001D505 000070F7 00007BD8 00029810 00029810', NULL, 'Techno', 204),
(47, 'DJ Splash - The Miracle Maker.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 205),
(48, 'Flight Facilities - Crave You (Adventure Club Remix).mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 206),
(49, 'More Than Friends (Markus Lange &amp; Sterofunk Remix)', 'Fukkk Offf', 'Remix Is King', '2010', NULL, '11', NULL, 208),
(50, 'Dirty Harry', 'Gorillaz', 'Demon Days (Deluxe)', '2005', NULL, '5', 'Other', 209),
(51, 'Feel Good Inc', 'Gorillaz', 'Greatest Hits', '2010', '0000087D 0000087A 00006A80 000054F3 000092D9 0002D2E7 00007381 000073B7 0002ACCE 00017A80', '4', 'Alternative', 210),
(52, 'On Melancholy Hill', 'Gorillaz', 'Plastic Beach', '2010', 'What U Think All The Gunz Is', '10', 'Hip-Hop', 211),
(53, 'Superfast Jellyfish', 'Gorillaz/Gorillaz Feat. Gruff Rhys &amp; De La Soul', 'Plastic Beach', '2010', '000013F2 000017AA 00010BD1 00016D5F 000137F0 000137F0 000095D0 000097B6 0001C387 00022100', NULL, 'Indie Rock', 212),
(54, 'Feel the Hard Rock (Heiko &amp; Maiko Mix)', 'Hardrox', 'House Passion 6 (ATL3382)', '2008', 'HFT', '15', 'House', 213),
(55, 'Bonfire', 'Knife Party', 'Rage Valley EP', '2012', 'Sent by Infectious PR. This track is watermarked, please do not share.', NULL, 'Dubstep', 214),
(56, 'The NRG', 'Lab 4', 'The Worlds Greatest Trance', '2007', NULL, '15', 'Other', 215),
(57, 'Blood Sugar 2007', 'Pendulum', 'Breakbeat Kaos (BBK020)', '2007', 'www.slsknet.org', NULL, 'Drum &amp; Bass', 216),
(58, 'Snafu', 'Plump DJs', 'Headthrash', '2008', NULL, '8', 'Other', 217),
(59, 'Hardcore Vibez', 'Rave Allstars', 'Hardcore Vibes  Satt Vinyl', '2005', 'FMC2oo5', '1', 'Trance', 218),
(60, 'Raving With The Best', 'Rave Allstars', 'Hard Dance Mania Vol. 11 (CD 2)', '2007', NULL, '15', 'Other', 219),
(61, 'The Logical Song (Rave Club Mix)', 'Rave Allstars', 'Tunnel Trance Force Vol. 42 / CD 1 - Time Tunnel Mix', '2007', 'www.utorrent.lt', '3', 'Other', 220),
(62, 'Rave Techno House - Rave Techno House.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 221),
(63, 'Sebastian Ingrosso & Alesso%20 - Calling (Original Instrumental Mix).mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 222),
(64, 'One (Cledy West &amp; Saix Dj Boot', 'Swedish House Mafia', 'Electro House Pack Vol.22', '2011', NULL, '33', 'House', 223),
(65, '3 Doors Down - Kryptonite.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 226),
(66, 'ACDC - Thunderstruck.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 227),
(67, 'Arctic Monkeys - Fluorescent Adolescent.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 344),
(68, 'Wake Me Up', 'Avicci', 'True', NULL, NULL, NULL, NULL, 345),
(69, 'Addicted To You', 'Avicii', 'True', '2013', 'From - www.trillz.us', '4', 'House', 346),
(70, 'Levels', 'Avicii', 'Millennium The Netx Generation Vol 14', '2012', ':::&#169; CENSORED 2012:::', '1', 'Other', 347),
(71, 'Avicii - You Make Me.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 348),
(72, 'Guilty Filthy Soul', 'AWOLNATION', 'Back From Earth', '2010', 'Amazon.com Song ID: 216369215', '2', 'Alternative Rock', 349),
(73, 'Sail', 'AWOLNATION', 'Back From Earth', '2010', 'Amazon.com Song ID: 216369211', '3', 'Alternative Rock', 350),
(74, 'Magic', 'B.o.B', 'B.o.B Presents: The Adventures of Bobby Ray', '2010', NULL, '9', 'Other', 351),
(75, 'Airplanes - radio clean (mastered)', 'B.O.B feat. Hayley Williams of Paramore', 'Unknown Album', NULL, '00001968 00001A0C 00008969 000090D5 00027F2F 000256C6 00008C79 00008E4C 00005724 0002193E', NULL, NULL, 352),
(76, 'Pompeii', 'Bastille', 'Bastille', NULL, NULL, NULL, NULL, 353),
(77, 'Billy Ocean - Carribean Queen', 'Billy Ocean', 'Greatest Hits [Jive]', '1989', NULL, NULL, 'Other', 354),
(78, 'Is this love', 'Bob Marley', 'Legend: The best of Bob Marley and the Wailers', '1984', 'Track 1', '1', 'Other', 355),
(79, 'Jamming', 'Bob Marley', 'Legend: The best of Bob Marley and the Wailers', '1984', 'Track 14', '14', 'Other', 356),
(80, 'It''s My Life', 'Bon Jovi', 'Burning For Rock', '2008', '00001BCD 00001A97 0000B08C 00007D6E 00030D40 00027117 00008000 00008000 00007547 0001ADC7', '4', 'Other', 357),
(81, 'Rock Me In', 'Britney Spears', 'Circus (Deluxe Edition) Bonus Tracks READ NFO', '2008', NULL, '14', 'Pop', 358),
(82, 'Count On Me', 'Bruno Mars', 'Doo-wops &amp; Hooligans', '2010', 'http://bubanee.blogspot.com/', NULL, 'R&amp;B', 359),
(83, 'Just The Way You Are', 'Bruno Mars', 'Doo-Wops &amp; Hooligans', '2010', NULL, '2', 'Other', 360),
(84, 'The Lazy Song', 'Bruno Mars', 'Doo-Wops &amp; Hooligans', '2010', NULL, '5', 'Other', 361),
(85, 'Treasure', 'Bruno Mars', 'Treasure - Single', '2013', NULL, NULL, 'Pop', 362),
(86, 'Bryan Adams - Summer of 69.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 363),
(87, 'flashback', 'calvin harris&#2;', 'Ready For The Weekend', '2009', NULL, '7', 'Other', 364),
(88, 'Capital Cities - Safe and Sound.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 366),
(89, 'Don''t Turn The Lights On (Aeroplane Remix)', 'Chromeo', 'Don''t Turn The Lights On', '2010', 'Indie Dance / Nu Disco - Nu Di', '1', 'Other', 367),
(90, 'Sexy Socialite', 'Chromeo', 'Sexy Socialite', '2013', NULL, NULL, NULL, 368),
(91, 'Cold Play - A Sky Full Of Stars.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 369),
(92, 'A Sky Full Of Stars', 'Coldplay', 'Ghost Stories', '2014', NULL, '8', 'Other', 370),
(93, 'Coldplay - paradise.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 371),
(94, 'The Scientist', 'Coldplay', 'The Best Chillout Ever [Disc 1]', '2003', 'Dj Clinto &#255;elease', NULL, 'Rock', 372),
(95, 'Counting Crows - Mr. Jones.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 373),
(96, 'Just Shoot Me, Baby', 'Crash Test Dummies', 'Give Yourself a Hand', '1999', NULL, '8', 'Pop', 374),
(97, 'Mmmm Mmmm Mmmm Mmmm', 'Crash Test Dummies', 'God Shuffled His Feet', '1993', NULL, '3', 'Top 250', 375),
(98, 'Get Lucky (feat. Pharrell Williams)', 'Daft Punk', 'Random Access Memories', '2013', NULL, NULL, 'Electronic, House, Disco', 377),
(99, 'One More Time', 'Daft Punk', 'Discovery', '2001', 'The French twosome behind Daft Punk, Thomas Bangalter and Guy-Manuel De Homem-Christo, get away with an awful lot. They go around impersonating aliens and robots in their interviews, they put records out only once every three years, and they make music that evokes a million other artists--while not really sounding like any of them. The keyboard noodlings of Jean-Michel Jarre are in there somewhere, along with the otherworldly imagery and giant hooks of ''70s rock icons like Boston or even Electric Light Orchestra. There are dashes of 1999-era Prince and oodles of new wave and disco cheese, from Harold Faltermeyer and Gary Numan to the Bee Gees, all set off with efficient house beats. So how have they managed to position themselves as electronic music''s next great crossover artists? On  Discovery, the follow-up to the 1998 worldwide smash Homework, the answer is obvious: they have no shame, and they know how to make us dance.  Starting off with the irresistibly hummable &quot;One More Time,&quot; the record blows through a head-spinning array of styles and samples, creating a pop-culture stew of funky loops and dance-floor anthems. &quot;Aerodynamic&quot; eschews breakbeats for an Yngwie Malmsteen-ish guitar interlude that somehow ends up meshing in a crazy blend of stomping bass lines and hyped-up harmonics. &quot;Digital Love&quot; starts off silly and gets sillier, but the monosyllabic lyrics lull the senses just right, allowing the song''s summery groove to grab hold with authority. &quot;Harder, Better, Faster, Stronger&quot; is a resounding standout amidst the retro/Vocoder deluge that transpired after Cher''s Believe turned the kitchy disco device into a worldwide pop music trend, spinning a clever groove around an ever-escalating string of computerized seduction. Everywhere on the record, gigantic beats are dropped with pinpoint precision, giving songs a momentum that transforms repetitive melodies into sudden revelations. The record''s only misstep, the aptly named &quot;Short Circuit&quot; utilizes a keyboard riff that is nails-on-a-chalkboard awful, but it can''t keep this from being one of the best records of 2001. --Matthew Cooke', '1', 'Other', 378),
(100, 'Memories', 'David Guetta', 'Now, Vol. 36', '2010', 'g.ortha.ii@ferialaw.com', '9', 'Pop', 379),
(101, 'Give Your Heart a Break', 'Demi Lovato', 'Unbroken', '2011', NULL, '10', 'Other', 380),
(102, 'Demi Lovato - Heart Attack.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 381),
(103, 'Neon Lights', 'Demi Lovato', 'Demi [Bonus CD-R Track]', '2013', NULL, '4', 'Other', 382),
(104, 'Coming Home (Ft. Skylar Grey)', 'Diddy-Dirty Money', 'Coming Home', '2011', 'g.ortha.ii@ferialaw.com', NULL, 'Other', 384),
(105, 'Sultans of Swing', 'Dire Straits', 'Sultans of Swing: The Very Bes', '1998', 'Cleaned by TuneUp!', '1', 'Rock cl&#225;sico orientado a adultos', 385),
(106, 'Barbara Streisand', 'Duck Sauce', 'Barbara Streisand', '2010', 'fre:ac - free audio converter &lt;http://www.freac.org/&gt;', '1', NULL, 386),
(107, 'Ed Sheeran%20 - Lego House.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 387),
(108, 'Home', 'Edward Sharpe &amp; The Magnetic Zeros', 'Up from Below (Bonus Track Version)', '2009', '00000F91 000010FC 00007D2C 0000762C 00022C87 0001A99C 0000881B 00008611 0000EF63 00000A1A', NULL, 'Alternative', 388),
(109, 'Ellie Gouding - Burn.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 389),
(110, 'Lights', 'Ellie Goulding', 'Lights', '2011', NULL, NULL, 'Synthpop', 390),
(111, 'Eminem & Rihanna - Monster.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 391),
(112, 'Eminem - Lose Yourself.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 392),
(113, 'Not Afraid', 'Eminem', 'Not Afraid', NULL, NULL, '1', NULL, 393),
(114, 'Kickstarts Radio Edit', 'Example', 'Kickstarts Remixes CDM', '2010', 'http://0daymusic.org/ftp.php', '1', 'Electronic', 394),
(115, 'Everywhere', 'Fleetwood Mac', 'The Very Best of Fleetwood Mac', '2002', 'Single disc version not avai', '5', 'Vocal', 395),
(116, 'Flo Rida - Whistle.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 396),
(117, 'Flo-rida - Wild Ones.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 397),
(118, 'You''ve Got The Love', 'Florence + The Machine', 'Lungs', '2009', '00001AEC 00001548 00007F0C 00007233 0001F650 00022790 00008000 00008000 000044EF 000044EF', NULL, 'Alternative', 398),
(119, 'The Best Of U', 'Foo Fighters', 'Foo Fighters', '2006', NULL, '9', 'Rock', 400),
(120, 'Houdini', 'Foster The People', 'Torches', '2011', NULL, '7', 'Other', 401),
(121, 'Pumped Up Kicks', 'Foster the People', 'Torches [Best Buy Exclusive]', '2011', 'www.MusciRadio.TV', '02', 'Indie', 402),
(122, 'Take Me Out', 'Franz Ferdinand', 'Tonight: Franz Ferdinand', '2004', '0000099D 00000A85 0000175F', '3', 'Other', 403),
(123, 'George Ezra - Budapest.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 404),
(124, 'Clint Eastwood', 'Gorrilaz', 'Clint Eastwood', '2011', 'www.dvdvideosoft.com', '1', 'Other', 405),
(125, 'Feel Good Inc.', 'Gorillaz', 'Demon Days (Deluxe)', '2005', NULL, '6', 'Other', 406),
(126, 'Green Day - Boulevard of Broken Dreams.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 407),
(127, 'Stereo Hearts', 'Gym Class Heroes [Ft. Adam Levine]', 'GoodMusicAllDay.com Presents The Best Of June 5 - 10, 2011', '2011', '00001D97 00001C8C 0000DE31 0000BE57 0002F3EB 00011ED6 0000911C 000090FE 00011263 0001C4C1', NULL, 'GoodMusicAllDay.com', 408),
(128, 'I''m Yours', 'Jason Mraz', 'We Sing, We Dance, We Steal Things', '2008', '/', '2', 'Rock', 409),
(129, 'Somewhere Only We Know', 'Keane', 'Somewhere Only We Know', '2004', NULL, '1', 'Other', 411),
(130, 'Luke Bryan - Play It Again.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 412),
(131, 'Can''t Hold Us Ft. Ray Dalton', 'Macklemore &amp; Ryan Lewis', 'The Heist', '2012', 'FTD', '2', 'Hip-Hop', 413),
(132, 'Maroon 5 - Love Somebody.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 414),
(133, 'Black or White', 'Michael Jackson', 'Greatest Hits: HIStory, Vol. 1', '2001', '00000ABC 00000AC8 000091D8 0000A414 0002399D 0002399D 00008000 00008000 0001182E 00011C43', '3', 'Other', 415),
(134, 'We Can''t Stop', 'Miley Cyrus', 'We Can''t Stop - Single', NULL, NULL, NULL, NULL, 416),
(135, 'Miley Cirus - Wrecking ball.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 417),
(136, 'You Get What You Give', 'New Radicals', 'You Get What You Give', '2004', NULL, '1', 'Other', 418),
(137, 'If Today Was Your Last Day', 'Nickleback', 'Dark Horse', '2008', NULL, '10', 'Rock', 419),
(138, 'Am I Wrong', 'Nico and Vinz', 'German TOP100 Single Charts', '2014', NULL, '5', 'Other', 420),
(139, 'Counting Stars', 'One Republic', 'I Love Pop', '2013', 'scorpiaa', '12', 'Pop', 421),
(140, 'I Write Sins Not Tragedies', 'Panic at the Disco', 'A Fever You Can''t Sweat Out', '2005', '000018DB 00000827 00009459 00004548 00023582 0000BB3E 00007B9B 00007AA6 0000FFB6 000157FA', '10', 'Other', 422),
(141, 'Crashing Your Party', 'Phantom Planet', 'Negatives', '2006', '00000696 00000695 0000799C 00007994 00014D83 00014D83 00008000 00008000 00003111 00003111', '2', 'Rock', 423),
(142, 'So What', 'Pink', 'Greatest Hits... So Far!!!', '2010', 'TeaM CaHeSo', '12', 'Pop', 424),
(143, 'Pitbull - Mr. Right Now (Feat. Akon).mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 425),
(144, 'Don''t Stop Me Now', 'Queen', 'Greatest Hits - Special Edition', '2002', NULL, '7', 'Other', 427),
(145, 'Queen - I Want to Break Free.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 428),
(146, 'Killing in the Name', 'Rage Against the Machine', 'Rage Against the Machine', '1992', NULL, NULL, 'Rock', 429),
(147, 'Red Hot Chili Peppers - By the Way.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 430),
(148, 'Californication', 'Red Hot Chili Peppers', 'Californication', '1999', NULL, '6', 'Other', 431),
(149, 'Can''t Stop', 'Red Hot Chili Peppers', 'Hot', '1999', NULL, '1', 'Alternative', 432),
(150, 'Dani California', 'Red Hot Chili Peppers', 'Stadium Arcadium (Disc 1: Jupiter)', '2006', NULL, NULL, 'Alternative rock', 433),
(151, 'Give it Away', 'Red Hot Chili Peppers', 'Blood Sugar Sex Magik', '1991', 'by anGell_hDzz', '9', 'Other', 434),
(152, '04-OTHERSIDE', 'Red Hot Chili Peppers', 'Californication', '2000', NULL, '4', 'Other', 435),
(153, 'Red Hot Chili Peppers - The Zephyr Song.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 436),
(154, 'Under the Bridge', 'Red Hot Chili Peppers', 'Blood Sugar Sex Magik', '2002', NULL, '11', 'Rock', 437),
(155, 'Don''t Stop The Music', 'Rihanna', 'Good Girl Gone Bad', '2007', 'www.legalsounds.com', NULL, 'R&amp;B', 438),
(156, 'Soundgarden - Black Hole Sun.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 440),
(157, 'All Together Now', 'The Farm', 'Sorted!: 40 Madchester Baggy Anthems [Disc 1]', '1991', NULL, '4', 'Other', 441),
(158, 'The Kids Aren''t Alright', 'Offspring', 'Americana', '1998', NULL, NULL, 'Alternative', 442),
(159, 'Every Breath You Take', 'The Police', 'Their Greatest Hits', '1990', NULL, '11', 'Other', 443),
(160, 'Hall of Fame ft. will.i.am', 'The Script', '#3', '2012', NULL, NULL, 'Rock', 444),
(161, 'Bittersweet Symphony', 'The Verve', 'Urban Hymns', '1997', '00000F8B 00000F21 00004D0E 00006734 00051AF0 0002BF4F 00008000 00008000 0000B397 0001283C', '1', 'Rock', 445),
(162, 'Junipero Serra', 'The Ziggens', 'Live: Tickets Still Available', '2000', NULL, '10', 'Alternative', 446),
(163, '(Far From) Home (Bascombe Radio Mix)', 'TIGA', '(Far From) Home', '2006', '451.1048.716', NULL, 'Dance', 447),
(164, 'Train - Drops of Jupiter.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 448),
(165, 'All Star - Smash Mouth', 'Various Artists', 'Big Shiny Tunes 4', '1999', NULL, '9', 'Other', 449),
(166, 'Airplanes - radio clean (mastered)', 'B.O.B feat. Hayley Williams of Paramore', 'Unknown Album', NULL, '00001968 00001A0C 00008969 000090D5 00027F2F 000256C6 00008C79 00008E4C 00005724 0002193E', NULL, NULL, 450),
(167, 'Pompeii', 'Bastille', 'Bastille', NULL, NULL, NULL, NULL, 451),
(168, 'Billy Ocean - Carribean Queen', 'Billy Ocean', 'Greatest Hits [Jive]', '1989', NULL, NULL, 'Other', 452),
(169, 'Jamming', 'Bob Marley', 'Legend: The best of Bob Marley and the Wailers', '1984', 'Track 14', '14', 'Other', 453),
(170, 'Is this love', 'Bob Marley', 'Legend: The best of Bob Marley and the Wailers', '1984', 'Track 1', '1', 'Other', 454),
(171, 'You Get What You Give', 'New Radicals', 'You Get What You Give', '2004', NULL, '1', 'Other', 455),
(172, '02 How You Remind Me', 'NICKELBACK', 'Silver Side Up', '2001', NULL, '2', 'Alternative', 456),
(173, 'If Today Was Your Last Day', 'Nickleback', 'Dark Horse', '2008', NULL, '10', 'Rock', 457),
(174, 'Mr. Probz - Waves.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 458),
(175, 'Starlight', 'Muse', 'Black Holes &amp; Revelations', '2006', '11+AC00D8B9A6CC84A431BF49A842042443+7630898', '2', 'Other', 459),
(176, 'Undercover Martyn', 'Two Door Cinema Club', 'Tourist History (Deluxe Edition)', '2010', NULL, NULL, 'Indie', 460),
(177, 'With Or Whitout You', 'U2', 'Joshua Tree', '1994', NULL, '3', 'Other', 461),
(178, 'black and yellow', 'Va - www.musicasparabaixar.org', 'Now Thats What I Call R And B - www.musicasparabaixar.org', '2011', 'www.musicasparabaixar.org', '14', 'Other', 462),
(179, 'Hey Brother', 'Va - www.musicasparabaixar.org', 'The Official Uk Top 40 Singles Chart 24-11-2013 - www.musicasparabaixar.org', '2013', 'www.musicasparabaixar.org', '27', 'Other', 463),
(180, 'Vampire Weekend - A-Punk.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 464),
(181, 'All Star - Smash Mouth', 'Various Artists', 'Big Shiny Tunes 4', '1999', NULL, '9', 'Other', 465),
(182, 'Weezer - Island in the Sun.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 466),
(183, 'Clarity (feat. Foxes)', 'Zedd', 'Billboard Hot 100', '2013', NULL, '14', 'Pop', 467),
(184, 'Undercover Martyn', 'Two Door Cinema Club', 'Tourist History (Deluxe Edition)', '2010', NULL, NULL, 'Indie', 468),
(185, 'With Or Whitout You', 'U2', 'Joshua Tree', '1994', NULL, '3', 'Other', 469),
(186, 'black and yellow', 'Va - www.musicasparabaixar.org', 'Now Thats What I Call R And B - www.musicasparabaixar.org', '2011', 'www.musicasparabaixar.org', '14', 'Other', 470),
(187, 'Hey Brother', 'Va - www.musicasparabaixar.org', 'The Official Uk Top 40 Singles Chart 24-11-2013 - www.musicasparabaixar.org', '2013', 'www.musicasparabaixar.org', '27', 'Other', 471),
(188, 'Vampire Weekend - A-Punk.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 472),
(189, 'All Star - Smash Mouth', 'Various Artists', 'Big Shiny Tunes 4', '1999', NULL, '9', 'Other', 473),
(190, 'Weezer - Island in the Sun.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 474),
(191, 'Clarity (feat. Foxes)', 'Zedd', 'Billboard Hot 100', '2013', NULL, '14', 'Pop', 475),
(192, 'Undercover Martyn', 'Two Door Cinema Club', 'Tourist History (Deluxe Edition)', '2010', NULL, NULL, 'Indie', 476),
(193, 'With Or Whitout You', 'U2', 'Joshua Tree', '1994', NULL, '3', 'Other', 477),
(194, 'black and yellow', 'Va - www.musicasparabaixar.org', 'Now Thats What I Call R And B - www.musicasparabaixar.org', '2011', 'www.musicasparabaixar.org', '14', 'Other', 478),
(195, 'Hey Brother', 'Va - www.musicasparabaixar.org', 'The Official Uk Top 40 Singles Chart 24-11-2013 - www.musicasparabaixar.org', '2013', 'www.musicasparabaixar.org', '27', 'Other', 479),
(196, 'Vampire Weekend - A-Punk.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 480),
(197, 'All Star - Smash Mouth', 'Various Artists', 'Big Shiny Tunes 4', '1999', NULL, '9', 'Other', 481),
(198, 'Weezer - Island in the Sun.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 482),
(199, 'Clarity (feat. Foxes)', 'Zedd', 'Billboard Hot 100', '2013', NULL, '14', 'Pop', 483),
(200, '3 Doors Down - Kryptonite.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 484),
(201, 'ACDC - Thunderstruck.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 485),
(202, '3 Doors Down - Kryptonite.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 540),
(203, 'ACDC - Thunderstruck.mp3', 'Unknown Artist', 'Unknown Album', NULL, NULL, NULL, NULL, 541);

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1051 ;

--
-- Dumping data for table `m2m_file_image`
--

INSERT INTO `m2m_file_image` (`id`, `fileId`, `width`, `height`, `type`, `alt`) VALUES
(4, 78, 128, 128, 's', ''),
(5, 78, 300, 300, 'm', ''),
(6, 78, 600, 600, 'l', ''),
(7, 79, 128, 128, 's', ''),
(8, 79, 300, 300, 'm', ''),
(9, 79, 600, 600, 'l', ''),
(90, 115, 600, 600, 'l', ''),
(89, 115, 300, 300, 'm', ''),
(88, 115, 128, 128, 's', ''),
(16, 82, 128, 128, 's', ''),
(17, 82, 300, 300, 'm', ''),
(18, 82, 600, 600, 'l', ''),
(22, 84, 128, 128, 's', ''),
(23, 84, 300, 300, 'm', ''),
(24, 84, 600, 600, 'l', ''),
(25, 85, 128, 128, 's', ''),
(26, 85, 300, 300, 'm', ''),
(27, 85, 600, 600, 'l', ''),
(28, 86, 128, 128, 's', ''),
(29, 86, 300, 300, 'm', ''),
(30, 86, 600, 600, 'l', ''),
(34, 93, 128, 128, 's', ''),
(35, 93, 300, 300, 'm', ''),
(36, 93, 600, 600, 'l', ''),
(37, 96, 128, 128, 's', ''),
(38, 96, 300, 300, 'm', ''),
(39, 96, 600, 600, 'l', ''),
(85, 114, 128, 128, 's', ''),
(86, 114, 300, 300, 'm', ''),
(87, 114, 600, 600, 'l', ''),
(99, 121, 600, 600, 'l', ''),
(98, 121, 300, 300, 'm', ''),
(97, 121, 128, 128, 's', ''),
(101, 122, 300, 300, 'm', ''),
(100, 122, 128, 128, 's', ''),
(102, 122, 600, 600, 'l', ''),
(103, 123, 128, 128, 's', ''),
(104, 123, 300, 300, 'm', ''),
(105, 123, 600, 600, 'l', ''),
(106, 124, 128, 128, 's', ''),
(107, 124, 300, 300, 'm', ''),
(108, 124, 600, 600, 'l', ''),
(109, 125, 128, 128, 's', ''),
(110, 125, 300, 300, 'm', ''),
(111, 125, 600, 600, 'l', ''),
(112, 126, 128, 128, 's', ''),
(113, 126, 300, 300, 'm', ''),
(114, 126, 600, 600, 'l', ''),
(115, 127, 128, 128, 's', ''),
(116, 127, 300, 300, 'm', ''),
(117, 127, 600, 600, 'l', ''),
(118, 128, 128, 128, 's', ''),
(119, 128, 300, 300, 'm', ''),
(120, 128, 600, 600, 'l', ''),
(121, 129, 128, 128, 's', ''),
(122, 129, 300, 300, 'm', ''),
(123, 129, 600, 600, 'l', ''),
(124, 130, 128, 128, 's', ''),
(125, 130, 300, 300, 'm', ''),
(126, 130, 600, 600, 'l', ''),
(127, 131, 128, 128, 's', ''),
(128, 131, 300, 300, 'm', ''),
(129, 131, 600, 600, 'l', ''),
(130, 132, 128, 128, 's', ''),
(131, 132, 300, 300, 'm', ''),
(132, 132, 600, 600, 'l', ''),
(133, 133, 128, 128, 's', ''),
(134, 133, 300, 300, 'm', ''),
(135, 133, 600, 600, 'l', ''),
(136, 134, 128, 128, 's', ''),
(137, 134, 300, 300, 'm', ''),
(138, 134, 600, 600, 'l', ''),
(139, 135, 128, 128, 's', ''),
(140, 135, 300, 300, 'm', ''),
(141, 135, 600, 600, 'l', ''),
(142, 136, 128, 128, 's', ''),
(143, 136, 300, 300, 'm', ''),
(144, 136, 600, 600, 'l', ''),
(145, 137, 128, 128, 's', ''),
(146, 137, 300, 300, 'm', ''),
(147, 137, 600, 600, 'l', ''),
(148, 138, 128, 128, 's', ''),
(149, 138, 300, 300, 'm', ''),
(150, 138, 600, 600, 'l', ''),
(151, 139, 128, 128, 's', ''),
(152, 139, 300, 300, 'm', ''),
(153, 139, 600, 600, 'l', ''),
(154, 140, 128, 128, 's', ''),
(155, 140, 300, 300, 'm', ''),
(156, 140, 600, 600, 'l', ''),
(157, 141, 128, 128, 's', ''),
(158, 141, 300, 300, 'm', ''),
(159, 141, 600, 600, 'l', ''),
(160, 142, 128, 128, 's', ''),
(161, 142, 300, 300, 'm', ''),
(162, 142, 600, 600, 'l', ''),
(163, 143, 128, 128, 's', ''),
(164, 143, 300, 300, 'm', ''),
(165, 143, 600, 600, 'l', ''),
(166, 144, 128, 128, 's', ''),
(167, 144, 300, 300, 'm', ''),
(168, 144, 600, 600, 'l', ''),
(169, 145, 128, 128, 's', ''),
(170, 145, 300, 300, 'm', ''),
(171, 145, 600, 600, 'l', ''),
(172, 146, 128, 128, 's', ''),
(173, 146, 300, 300, 'm', ''),
(174, 146, 600, 600, 'l', ''),
(175, 147, 128, 128, 's', ''),
(176, 147, 300, 300, 'm', ''),
(177, 147, 600, 600, 'l', ''),
(178, 148, 128, 128, 's', ''),
(179, 148, 300, 300, 'm', ''),
(180, 148, 600, 600, 'l', ''),
(181, 149, 128, 128, 's', ''),
(182, 149, 300, 300, 'm', ''),
(183, 149, 600, 600, 'l', ''),
(184, 159, 128, 128, 's', ''),
(185, 159, 300, 300, 'm', ''),
(186, 159, 600, 600, 'l', ''),
(187, 160, 128, 128, 's', ''),
(188, 160, 300, 300, 'm', ''),
(189, 160, 600, 600, 'l', ''),
(190, 161, 128, 128, 's', ''),
(191, 161, 300, 300, 'm', ''),
(192, 161, 600, 600, 'l', ''),
(193, 162, 128, 128, 's', ''),
(194, 162, 300, 300, 'm', ''),
(195, 162, 600, 600, 'l', ''),
(196, 163, 128, 128, 's', ''),
(197, 163, 300, 300, 'm', ''),
(198, 163, 600, 600, 'l', ''),
(199, 164, 128, 128, 's', ''),
(200, 164, 300, 300, 'm', ''),
(201, 164, 600, 600, 'l', ''),
(202, 165, 128, 128, 's', ''),
(203, 165, 300, 300, 'm', ''),
(204, 165, 600, 600, 'l', ''),
(205, 166, 128, 128, 's', ''),
(206, 166, 300, 300, 'm', ''),
(207, 166, 600, 600, 'l', ''),
(208, 167, 128, 128, 's', ''),
(209, 167, 300, 300, 'm', ''),
(210, 167, 600, 600, 'l', ''),
(211, 168, 128, 128, 's', ''),
(212, 168, 300, 300, 'm', ''),
(213, 168, 600, 600, 'l', ''),
(214, 169, 128, 128, 's', ''),
(215, 169, 300, 300, 'm', ''),
(216, 169, 600, 600, 'l', ''),
(217, 170, 128, 128, 's', ''),
(218, 170, 300, 300, 'm', ''),
(219, 170, 600, 600, 'l', ''),
(220, 171, 128, 128, 's', ''),
(221, 171, 300, 300, 'm', ''),
(222, 171, 600, 600, 'l', ''),
(223, 172, 128, 128, 's', ''),
(224, 172, 300, 300, 'm', ''),
(225, 172, 600, 600, 'l', ''),
(226, 173, 128, 128, 's', ''),
(227, 173, 300, 300, 'm', ''),
(228, 173, 600, 600, 'l', ''),
(229, 174, 128, 128, 's', ''),
(230, 174, 300, 300, 'm', ''),
(231, 174, 600, 600, 'l', ''),
(232, 175, 128, 128, 's', ''),
(233, 175, 300, 300, 'm', ''),
(234, 175, 600, 600, 'l', ''),
(235, 176, 128, 128, 's', ''),
(236, 176, 300, 300, 'm', ''),
(237, 176, 600, 600, 'l', ''),
(238, 177, 128, 128, 's', ''),
(239, 177, 300, 300, 'm', ''),
(240, 177, 600, 600, 'l', ''),
(241, 178, 128, 128, 's', ''),
(242, 178, 300, 300, 'm', ''),
(243, 178, 600, 600, 'l', ''),
(244, 179, 128, 128, 's', ''),
(245, 179, 300, 300, 'm', ''),
(246, 179, 600, 600, 'l', ''),
(247, 180, 128, 128, 's', ''),
(248, 180, 300, 300, 'm', ''),
(249, 180, 600, 600, 'l', ''),
(250, 181, 128, 128, 's', ''),
(251, 181, 300, 300, 'm', ''),
(252, 181, 600, 600, 'l', ''),
(253, 182, 128, 128, 's', ''),
(254, 182, 300, 300, 'm', ''),
(255, 182, 600, 600, 'l', ''),
(256, 183, 128, 128, 's', ''),
(257, 183, 300, 300, 'm', ''),
(258, 183, 600, 600, 'l', ''),
(259, 184, 128, 128, 's', ''),
(260, 184, 300, 300, 'm', ''),
(261, 184, 600, 600, 'l', ''),
(262, 185, 128, 128, 's', ''),
(263, 185, 300, 300, 'm', ''),
(264, 185, 600, 600, 'l', ''),
(265, 186, 128, 128, 's', ''),
(266, 186, 300, 300, 'm', ''),
(267, 186, 600, 600, 'l', ''),
(268, 187, 128, 128, 's', ''),
(269, 187, 300, 300, 'm', ''),
(270, 187, 600, 600, 'l', ''),
(271, 207, 128, 128, 's', ''),
(272, 207, 300, 300, 'm', ''),
(273, 207, 600, 600, 'l', ''),
(274, 228, 128, 128, 's', ''),
(275, 228, 300, 300, 'm', ''),
(276, 228, 600, 600, 'l', ''),
(277, 229, 128, 128, 's', ''),
(278, 229, 300, 300, 'm', ''),
(279, 229, 600, 600, 'l', ''),
(280, 230, 128, 128, 's', ''),
(281, 230, 300, 300, 'm', ''),
(282, 230, 600, 600, 'l', ''),
(283, 231, 128, 128, 's', ''),
(284, 231, 300, 300, 'm', ''),
(285, 231, 600, 600, 'l', ''),
(286, 232, 128, 128, 's', ''),
(287, 232, 300, 300, 'm', ''),
(288, 232, 600, 600, 'l', ''),
(289, 233, 128, 128, 's', ''),
(290, 233, 300, 300, 'm', ''),
(291, 233, 600, 600, 'l', ''),
(292, 234, 128, 128, 's', ''),
(293, 234, 300, 300, 'm', ''),
(294, 234, 600, 600, 'l', ''),
(295, 235, 128, 128, 's', ''),
(296, 235, 300, 300, 'm', ''),
(297, 235, 600, 600, 'l', ''),
(298, 236, 128, 128, 's', ''),
(299, 236, 300, 300, 'm', ''),
(300, 236, 600, 600, 'l', ''),
(301, 237, 128, 128, 's', ''),
(302, 237, 300, 300, 'm', ''),
(303, 237, 600, 600, 'l', ''),
(304, 238, 128, 128, 's', ''),
(305, 238, 300, 300, 'm', ''),
(306, 238, 600, 600, 'l', ''),
(307, 239, 128, 128, 's', ''),
(308, 239, 300, 300, 'm', ''),
(309, 239, 600, 600, 'l', ''),
(310, 240, 128, 128, 's', ''),
(311, 240, 300, 300, 'm', ''),
(312, 240, 600, 600, 'l', ''),
(313, 241, 128, 128, 's', ''),
(314, 241, 300, 300, 'm', ''),
(315, 241, 600, 600, 'l', ''),
(316, 242, 128, 128, 's', ''),
(317, 243, 128, 128, 's', ''),
(318, 242, 300, 300, 'm', ''),
(319, 243, 300, 300, 'm', ''),
(320, 243, 600, 600, 'l', ''),
(321, 242, 600, 600, 'l', ''),
(322, 244, 128, 128, 's', ''),
(323, 244, 300, 300, 'm', ''),
(324, 244, 600, 600, 'l', ''),
(325, 245, 128, 128, 's', ''),
(326, 246, 128, 128, 's', ''),
(327, 247, 128, 128, 's', ''),
(328, 245, 300, 300, 'm', ''),
(329, 246, 300, 300, 'm', ''),
(330, 247, 300, 300, 'm', ''),
(331, 245, 600, 600, 'l', ''),
(332, 246, 600, 600, 'l', ''),
(333, 247, 600, 600, 'l', ''),
(334, 248, 128, 128, 's', ''),
(335, 249, 128, 128, 's', ''),
(336, 250, 128, 128, 's', ''),
(337, 248, 300, 300, 'm', ''),
(338, 250, 300, 300, 'm', ''),
(339, 249, 300, 300, 'm', ''),
(340, 248, 600, 600, 'l', ''),
(341, 250, 600, 600, 'l', ''),
(342, 249, 600, 600, 'l', ''),
(343, 251, 128, 128, 's', ''),
(344, 251, 300, 300, 'm', ''),
(345, 251, 600, 600, 'l', ''),
(346, 252, 128, 128, 's', ''),
(347, 252, 300, 300, 'm', ''),
(348, 254, 128, 128, 's', ''),
(349, 253, 128, 128, 's', ''),
(350, 254, 300, 300, 'm', ''),
(351, 253, 300, 300, 'm', ''),
(352, 252, 600, 600, 'l', ''),
(353, 255, 128, 128, 's', ''),
(354, 254, 600, 600, 'l', ''),
(355, 255, 300, 300, 'm', ''),
(356, 253, 600, 600, 'l', ''),
(357, 255, 600, 600, 'l', ''),
(358, 256, 128, 128, 's', ''),
(359, 256, 300, 300, 'm', ''),
(360, 257, 128, 128, 's', ''),
(361, 257, 300, 300, 'm', ''),
(362, 258, 128, 128, 's', ''),
(363, 256, 600, 600, 'l', ''),
(364, 258, 300, 300, 'm', ''),
(365, 257, 600, 600, 'l', ''),
(366, 258, 600, 600, 'l', ''),
(367, 259, 128, 128, 's', ''),
(368, 259, 300, 300, 'm', ''),
(369, 260, 128, 128, 's', ''),
(370, 259, 600, 600, 'l', ''),
(371, 260, 300, 300, 'm', ''),
(372, 260, 600, 600, 'l', ''),
(373, 261, 128, 128, 's', ''),
(374, 261, 300, 300, 'm', ''),
(375, 262, 128, 128, 's', ''),
(376, 262, 300, 300, 'm', ''),
(377, 261, 600, 600, 'l', ''),
(378, 262, 600, 600, 'l', ''),
(379, 263, 128, 128, 's', ''),
(380, 263, 300, 300, 'm', ''),
(381, 263, 600, 600, 'l', ''),
(382, 264, 128, 128, 's', ''),
(383, 264, 300, 300, 'm', ''),
(384, 265, 128, 128, 's', ''),
(385, 265, 300, 300, 'm', ''),
(386, 266, 128, 128, 's', ''),
(387, 265, 600, 600, 'l', ''),
(388, 264, 600, 600, 'l', ''),
(389, 267, 128, 128, 's', ''),
(390, 266, 300, 300, 'm', ''),
(391, 267, 300, 300, 'm', ''),
(392, 267, 600, 600, 'l', ''),
(393, 266, 600, 600, 'l', ''),
(394, 268, 128, 128, 's', ''),
(395, 268, 300, 300, 'm', ''),
(396, 268, 600, 600, 'l', ''),
(397, 269, 128, 128, 's', ''),
(398, 269, 300, 300, 'm', ''),
(399, 269, 600, 600, 'l', ''),
(400, 270, 128, 128, 's', ''),
(401, 270, 300, 300, 'm', ''),
(402, 270, 600, 600, 'l', ''),
(403, 271, 128, 128, 's', ''),
(404, 271, 300, 300, 'm', ''),
(405, 272, 128, 128, 's', ''),
(406, 272, 300, 300, 'm', ''),
(407, 271, 600, 600, 'l', ''),
(408, 273, 128, 128, 's', ''),
(409, 273, 300, 300, 'm', ''),
(410, 272, 600, 600, 'l', ''),
(411, 273, 600, 600, 'l', ''),
(412, 274, 128, 128, 's', ''),
(413, 274, 300, 300, 'm', ''),
(414, 275, 128, 128, 's', ''),
(415, 275, 300, 300, 'm', ''),
(416, 274, 600, 600, 'l', ''),
(417, 276, 128, 128, 's', ''),
(418, 276, 300, 300, 'm', ''),
(419, 275, 600, 600, 'l', ''),
(420, 276, 600, 600, 'l', ''),
(421, 277, 128, 128, 's', ''),
(422, 277, 300, 300, 'm', ''),
(423, 277, 600, 600, 'l', ''),
(424, 279, 128, 128, 's', ''),
(425, 278, 128, 128, 's', ''),
(426, 278, 300, 300, 'm', ''),
(427, 279, 300, 300, 'm', ''),
(428, 278, 600, 600, 'l', ''),
(429, 280, 128, 128, 's', ''),
(430, 280, 300, 300, 'm', ''),
(431, 279, 600, 600, 'l', ''),
(432, 280, 600, 600, 'l', ''),
(433, 281, 128, 128, 's', ''),
(434, 282, 128, 128, 's', ''),
(435, 281, 300, 300, 'm', ''),
(436, 282, 300, 300, 'm', ''),
(437, 283, 128, 128, 's', ''),
(438, 283, 300, 300, 'm', ''),
(439, 281, 600, 600, 'l', ''),
(440, 284, 128, 128, 's', ''),
(441, 282, 600, 600, 'l', ''),
(442, 283, 600, 600, 'l', ''),
(443, 284, 300, 300, 'm', ''),
(444, 285, 128, 128, 's', ''),
(445, 284, 600, 600, 'l', ''),
(446, 285, 300, 300, 'm', ''),
(447, 285, 600, 600, 'l', ''),
(448, 286, 128, 128, 's', ''),
(449, 286, 300, 300, 'm', ''),
(450, 287, 128, 128, 's', ''),
(451, 288, 128, 128, 's', ''),
(452, 288, 300, 300, 'm', ''),
(453, 286, 600, 600, 'l', ''),
(454, 287, 300, 300, 'm', ''),
(455, 288, 600, 600, 'l', ''),
(456, 287, 600, 600, 'l', ''),
(457, 289, 128, 128, 's', ''),
(458, 290, 128, 128, 's', ''),
(459, 289, 300, 300, 'm', ''),
(460, 290, 300, 300, 'm', ''),
(461, 289, 600, 600, 'l', ''),
(462, 290, 600, 600, 'l', ''),
(463, 291, 128, 128, 's', ''),
(464, 291, 300, 300, 'm', ''),
(465, 292, 128, 128, 's', ''),
(466, 292, 300, 300, 'm', ''),
(467, 293, 128, 128, 's', ''),
(468, 291, 600, 600, 'l', ''),
(469, 294, 128, 128, 's', ''),
(470, 293, 300, 300, 'm', ''),
(471, 292, 600, 600, 'l', ''),
(472, 294, 300, 300, 'm', ''),
(473, 295, 128, 128, 's', ''),
(474, 295, 300, 300, 'm', ''),
(475, 293, 600, 600, 'l', ''),
(476, 294, 600, 600, 'l', ''),
(477, 295, 600, 600, 'l', ''),
(478, 296, 128, 128, 's', ''),
(479, 297, 128, 128, 's', ''),
(480, 296, 300, 300, 'm', ''),
(481, 297, 300, 300, 'm', ''),
(482, 297, 600, 600, 'l', ''),
(483, 296, 600, 600, 'l', ''),
(484, 298, 128, 128, 's', ''),
(485, 298, 300, 300, 'm', ''),
(486, 299, 128, 128, 's', ''),
(487, 301, 128, 128, 's', ''),
(488, 299, 300, 300, 'm', ''),
(489, 300, 128, 128, 's', ''),
(490, 298, 600, 600, 'l', ''),
(491, 300, 300, 300, 'm', ''),
(492, 301, 300, 300, 'm', ''),
(493, 299, 600, 600, 'l', ''),
(494, 302, 128, 128, 's', ''),
(495, 300, 600, 600, 'l', ''),
(496, 301, 600, 600, 'l', ''),
(497, 302, 300, 300, 'm', ''),
(498, 302, 600, 600, 'l', ''),
(499, 303, 128, 128, 's', ''),
(500, 303, 300, 300, 'm', ''),
(501, 303, 600, 600, 'l', ''),
(502, 304, 128, 128, 's', ''),
(503, 304, 300, 300, 'm', ''),
(504, 305, 128, 128, 's', ''),
(505, 305, 300, 300, 'm', ''),
(506, 306, 128, 128, 's', ''),
(507, 304, 600, 600, 'l', ''),
(508, 307, 128, 128, 's', ''),
(509, 308, 128, 128, 's', ''),
(510, 306, 300, 300, 'm', ''),
(511, 307, 300, 300, 'm', ''),
(512, 308, 300, 300, 'm', ''),
(513, 305, 600, 600, 'l', ''),
(514, 309, 128, 128, 's', ''),
(515, 309, 300, 300, 'm', ''),
(516, 307, 600, 600, 'l', ''),
(517, 306, 600, 600, 'l', ''),
(518, 309, 600, 600, 'l', ''),
(519, 310, 128, 128, 's', ''),
(520, 308, 600, 600, 'l', ''),
(521, 310, 300, 300, 'm', ''),
(522, 311, 128, 128, 's', ''),
(523, 312, 128, 128, 's', ''),
(524, 310, 600, 600, 'l', ''),
(525, 311, 300, 300, 'm', ''),
(526, 312, 300, 300, 'm', ''),
(527, 313, 128, 128, 's', ''),
(528, 314, 128, 128, 's', ''),
(529, 315, 128, 128, 's', ''),
(530, 313, 300, 300, 'm', ''),
(531, 314, 300, 300, 'm', ''),
(532, 315, 300, 300, 'm', ''),
(533, 316, 128, 128, 's', ''),
(534, 311, 600, 600, 'l', ''),
(535, 312, 600, 600, 'l', ''),
(536, 316, 300, 300, 'm', ''),
(537, 313, 600, 600, 'l', ''),
(538, 315, 600, 600, 'l', ''),
(539, 316, 600, 600, 'l', ''),
(540, 314, 600, 600, 'l', ''),
(541, 317, 128, 128, 's', ''),
(542, 317, 300, 300, 'm', ''),
(543, 317, 600, 600, 'l', ''),
(544, 318, 128, 128, 's', ''),
(545, 319, 128, 128, 's', ''),
(546, 318, 300, 300, 'm', ''),
(547, 319, 300, 300, 'm', ''),
(548, 318, 600, 600, 'l', ''),
(549, 319, 600, 600, 'l', ''),
(550, 320, 128, 128, 's', ''),
(551, 320, 300, 300, 'm', ''),
(552, 322, 128, 128, 's', ''),
(553, 321, 128, 128, 's', ''),
(554, 320, 600, 600, 'l', ''),
(555, 322, 300, 300, 'm', ''),
(556, 321, 300, 300, 'm', ''),
(557, 323, 128, 128, 's', ''),
(558, 323, 300, 300, 'm', ''),
(559, 322, 600, 600, 'l', ''),
(560, 324, 128, 128, 's', ''),
(561, 324, 300, 300, 'm', ''),
(562, 323, 600, 600, 'l', ''),
(563, 321, 600, 600, 'l', ''),
(564, 324, 600, 600, 'l', ''),
(565, 325, 128, 128, 's', ''),
(566, 325, 300, 300, 'm', ''),
(567, 325, 600, 600, 'l', ''),
(568, 326, 128, 128, 's', ''),
(569, 327, 128, 128, 's', ''),
(570, 328, 128, 128, 's', ''),
(571, 329, 128, 128, 's', ''),
(572, 327, 300, 300, 'm', ''),
(573, 326, 300, 300, 'm', ''),
(574, 329, 300, 300, 'm', ''),
(575, 328, 300, 300, 'm', ''),
(576, 326, 600, 600, 'l', ''),
(577, 327, 600, 600, 'l', ''),
(578, 328, 600, 600, 'l', ''),
(579, 329, 600, 600, 'l', ''),
(580, 331, 128, 128, 's', ''),
(581, 330, 128, 128, 's', ''),
(582, 330, 300, 300, 'm', ''),
(583, 331, 300, 300, 'm', ''),
(584, 330, 600, 600, 'l', ''),
(585, 331, 600, 600, 'l', ''),
(586, 332, 128, 128, 's', ''),
(587, 332, 300, 300, 'm', ''),
(588, 332, 600, 600, 'l', ''),
(589, 333, 128, 128, 's', ''),
(590, 333, 300, 300, 'm', ''),
(591, 333, 600, 600, 'l', ''),
(592, 334, 128, 128, 's', ''),
(593, 334, 300, 300, 'm', ''),
(594, 334, 600, 600, 'l', ''),
(595, 335, 128, 128, 's', ''),
(596, 335, 300, 300, 'm', ''),
(597, 335, 600, 600, 'l', ''),
(598, 336, 128, 128, 's', ''),
(599, 336, 300, 300, 'm', ''),
(600, 336, 600, 600, 'l', ''),
(601, 337, 128, 128, 's', ''),
(602, 337, 300, 300, 'm', ''),
(603, 337, 600, 600, 'l', ''),
(604, 338, 128, 128, 's', ''),
(605, 338, 300, 300, 'm', ''),
(606, 338, 600, 600, 'l', ''),
(607, 339, 128, 128, 's', ''),
(608, 339, 300, 300, 'm', ''),
(609, 339, 600, 600, 'l', ''),
(610, 340, 128, 128, 's', ''),
(611, 340, 300, 300, 'm', ''),
(612, 340, 600, 600, 'l', ''),
(613, 341, 128, 128, 's', ''),
(614, 341, 300, 300, 'm', ''),
(615, 341, 600, 600, 'l', ''),
(616, 342, 128, 128, 's', ''),
(617, 342, 300, 300, 'm', ''),
(618, 342, 600, 600, 'l', ''),
(619, 343, 128, 128, 's', ''),
(620, 343, 300, 300, 'm', ''),
(621, 343, 600, 600, 'l', ''),
(622, 399, 128, 128, 's', ''),
(623, 399, 300, 300, 'm', ''),
(624, 399, 600, 600, 'l', ''),
(625, 486, 128, 128, 's', ''),
(626, 486, 300, 300, 'm', ''),
(627, 486, 600, 600, 'l', ''),
(628, 487, 128, 128, 's', ''),
(629, 487, 300, 300, 'm', ''),
(630, 487, 600, 600, 'l', ''),
(631, 488, 128, 128, 's', ''),
(632, 488, 300, 300, 'm', ''),
(633, 488, 600, 600, 'l', ''),
(634, 489, 128, 128, 's', ''),
(635, 489, 300, 300, 'm', ''),
(636, 489, 600, 600, 'l', ''),
(637, 490, 128, 128, 's', ''),
(638, 490, 300, 300, 'm', ''),
(639, 490, 600, 600, 'l', ''),
(640, 491, 128, 128, 's', ''),
(641, 491, 300, 300, 'm', ''),
(642, 491, 600, 600, 'l', ''),
(643, 492, 128, 128, 's', ''),
(644, 492, 300, 300, 'm', ''),
(645, 492, 600, 600, 'l', ''),
(646, 493, 128, 128, 's', ''),
(647, 493, 300, 300, 'm', ''),
(648, 493, 600, 600, 'l', ''),
(649, 494, 128, 128, 's', ''),
(650, 494, 300, 300, 'm', ''),
(651, 494, 600, 600, 'l', ''),
(652, 495, 128, 128, 's', ''),
(653, 495, 300, 300, 'm', ''),
(654, 495, 600, 600, 'l', ''),
(655, 496, 128, 128, 's', ''),
(656, 496, 300, 300, 'm', ''),
(657, 496, 600, 600, 'l', ''),
(658, 497, 128, 128, 's', ''),
(659, 497, 300, 300, 'm', ''),
(660, 497, 600, 600, 'l', ''),
(661, 498, 128, 128, 's', ''),
(662, 498, 300, 300, 'm', ''),
(663, 498, 600, 600, 'l', ''),
(664, 499, 128, 128, 's', ''),
(665, 499, 300, 300, 'm', ''),
(666, 499, 600, 600, 'l', ''),
(667, 500, 128, 128, 's', ''),
(668, 500, 300, 300, 'm', ''),
(669, 500, 600, 600, 'l', ''),
(670, 501, 128, 128, 's', ''),
(671, 501, 300, 300, 'm', ''),
(672, 501, 600, 600, 'l', ''),
(673, 502, 128, 128, 's', ''),
(674, 502, 300, 300, 'm', ''),
(675, 502, 600, 600, 'l', ''),
(676, 503, 128, 128, 's', ''),
(677, 503, 300, 300, 'm', ''),
(678, 503, 600, 600, 'l', ''),
(679, 504, 128, 128, 's', ''),
(680, 504, 300, 300, 'm', ''),
(681, 504, 600, 600, 'l', ''),
(682, 505, 128, 128, 's', ''),
(683, 505, 300, 300, 'm', ''),
(684, 505, 600, 600, 'l', ''),
(685, 506, 128, 128, 's', ''),
(686, 506, 300, 300, 'm', ''),
(687, 506, 600, 600, 'l', ''),
(688, 507, 128, 128, 's', ''),
(689, 507, 300, 300, 'm', ''),
(690, 507, 600, 600, 'l', ''),
(691, 508, 128, 128, 's', ''),
(692, 508, 300, 300, 'm', ''),
(693, 508, 600, 600, 'l', ''),
(694, 509, 128, 128, 's', ''),
(695, 509, 300, 300, 'm', ''),
(696, 509, 600, 600, 'l', ''),
(697, 510, 128, 128, 's', ''),
(698, 510, 300, 300, 'm', ''),
(699, 510, 600, 600, 'l', ''),
(700, 511, 128, 128, 's', ''),
(701, 511, 300, 300, 'm', ''),
(702, 511, 600, 600, 'l', ''),
(703, 512, 128, 128, 's', ''),
(704, 512, 300, 300, 'm', ''),
(705, 512, 600, 600, 'l', ''),
(706, 513, 128, 128, 's', ''),
(707, 513, 300, 300, 'm', ''),
(708, 513, 600, 600, 'l', ''),
(709, 514, 128, 128, 's', ''),
(710, 514, 300, 300, 'm', ''),
(711, 514, 600, 600, 'l', ''),
(712, 515, 128, 128, 's', ''),
(713, 515, 300, 300, 'm', ''),
(714, 515, 600, 600, 'l', ''),
(715, 516, 128, 128, 's', ''),
(716, 516, 300, 300, 'm', ''),
(717, 516, 600, 600, 'l', ''),
(718, 517, 128, 128, 's', ''),
(719, 517, 300, 300, 'm', ''),
(720, 517, 600, 600, 'l', ''),
(721, 518, 128, 128, 's', ''),
(722, 518, 300, 300, 'm', ''),
(723, 518, 600, 600, 'l', ''),
(724, 519, 128, 128, 's', ''),
(725, 519, 300, 300, 'm', ''),
(726, 519, 600, 600, 'l', ''),
(727, 520, 128, 128, 's', ''),
(728, 520, 300, 300, 'm', ''),
(729, 520, 600, 600, 'l', ''),
(730, 521, 128, 128, 's', ''),
(731, 521, 300, 300, 'm', ''),
(732, 521, 600, 600, 'l', ''),
(733, 522, 128, 128, 's', ''),
(734, 522, 300, 300, 'm', ''),
(735, 522, 600, 600, 'l', ''),
(736, 523, 128, 128, 's', ''),
(737, 523, 300, 300, 'm', ''),
(738, 523, 600, 600, 'l', ''),
(739, 524, 128, 128, 's', ''),
(740, 524, 300, 300, 'm', ''),
(741, 524, 600, 600, 'l', ''),
(742, 525, 128, 128, 's', ''),
(743, 525, 300, 300, 'm', ''),
(744, 525, 600, 600, 'l', ''),
(745, 526, 128, 128, 's', ''),
(746, 526, 300, 300, 'm', ''),
(747, 526, 600, 600, 'l', ''),
(748, 527, 128, 128, 's', ''),
(749, 527, 300, 300, 'm', ''),
(750, 527, 600, 600, 'l', ''),
(751, 528, 128, 128, 's', ''),
(752, 528, 300, 300, 'm', ''),
(753, 528, 600, 600, 'l', ''),
(754, 529, 128, 128, 's', ''),
(755, 529, 300, 300, 'm', ''),
(756, 529, 600, 600, 'l', ''),
(757, 530, 128, 128, 's', ''),
(758, 530, 300, 300, 'm', ''),
(759, 530, 600, 600, 'l', ''),
(760, 531, 128, 128, 's', ''),
(761, 531, 300, 300, 'm', ''),
(762, 531, 600, 600, 'l', ''),
(763, 532, 128, 128, 's', ''),
(764, 532, 300, 300, 'm', ''),
(765, 532, 600, 600, 'l', ''),
(766, 533, 128, 128, 's', ''),
(767, 533, 300, 300, 'm', ''),
(768, 533, 600, 600, 'l', ''),
(769, 534, 128, 128, 's', ''),
(770, 534, 300, 300, 'm', ''),
(771, 534, 600, 600, 'l', ''),
(772, 535, 128, 128, 's', ''),
(773, 535, 300, 300, 'm', ''),
(774, 535, 600, 600, 'l', ''),
(775, 536, 128, 128, 's', ''),
(776, 536, 300, 300, 'm', ''),
(777, 536, 600, 600, 'l', ''),
(778, 537, 128, 128, 's', ''),
(779, 537, 300, 300, 'm', ''),
(780, 537, 600, 600, 'l', ''),
(781, 538, 128, 128, 's', ''),
(782, 538, 300, 300, 'm', ''),
(783, 538, 600, 600, 'l', ''),
(784, 539, 128, 128, 's', ''),
(785, 539, 300, 300, 'm', ''),
(786, 539, 600, 600, 'l', ''),
(787, 542, 128, 128, 's', ''),
(788, 542, 300, 300, 'm', ''),
(789, 542, 600, 600, 'l', ''),
(790, 543, 128, 128, 's', ''),
(791, 543, 300, 300, 'm', ''),
(792, 543, 600, 600, 'l', ''),
(793, 544, 128, 128, 's', ''),
(794, 544, 300, 300, 'm', ''),
(795, 544, 600, 600, 'l', ''),
(796, 545, 128, 128, 's', ''),
(797, 545, 300, 300, 'm', ''),
(798, 545, 600, 600, 'l', ''),
(799, 546, 128, 128, 's', ''),
(800, 546, 300, 300, 'm', ''),
(801, 546, 600, 600, 'l', ''),
(802, 547, 128, 128, 's', ''),
(803, 547, 300, 300, 'm', ''),
(804, 547, 600, 600, 'l', ''),
(805, 548, 128, 128, 's', ''),
(806, 548, 300, 300, 'm', ''),
(807, 548, 600, 600, 'l', ''),
(808, 549, 128, 128, 's', ''),
(809, 549, 300, 300, 'm', ''),
(810, 549, 600, 600, 'l', ''),
(811, 550, 128, 128, 's', ''),
(812, 550, 300, 300, 'm', ''),
(813, 550, 600, 600, 'l', ''),
(814, 551, 128, 128, 's', ''),
(815, 551, 300, 300, 'm', ''),
(816, 551, 600, 600, 'l', ''),
(817, 552, 128, 128, 's', ''),
(818, 552, 300, 300, 'm', ''),
(819, 552, 600, 600, 'l', ''),
(820, 553, 128, 128, 's', ''),
(821, 553, 300, 300, 'm', ''),
(822, 553, 600, 600, 'l', ''),
(823, 554, 128, 128, 's', ''),
(824, 554, 300, 300, 'm', ''),
(825, 554, 600, 600, 'l', ''),
(826, 555, 128, 128, 's', ''),
(827, 555, 300, 300, 'm', ''),
(828, 555, 600, 600, 'l', ''),
(829, 556, 128, 128, 's', ''),
(830, 556, 300, 300, 'm', ''),
(831, 556, 600, 600, 'l', ''),
(832, 557, 128, 128, 's', ''),
(833, 557, 300, 300, 'm', ''),
(834, 557, 600, 600, 'l', ''),
(835, 558, 128, 128, 's', ''),
(836, 558, 300, 300, 'm', ''),
(837, 558, 600, 600, 'l', ''),
(838, 559, 128, 128, 's', ''),
(839, 559, 300, 300, 'm', ''),
(840, 559, 600, 600, 'l', ''),
(841, 560, 128, 128, 's', ''),
(842, 560, 300, 300, 'm', ''),
(843, 560, 600, 600, 'l', ''),
(844, 561, 128, 128, 's', ''),
(845, 561, 300, 300, 'm', ''),
(846, 561, 600, 600, 'l', ''),
(847, 562, 128, 128, 's', ''),
(848, 562, 300, 300, 'm', ''),
(849, 562, 600, 600, 'l', ''),
(850, 563, 128, 128, 's', ''),
(851, 563, 300, 300, 'm', ''),
(852, 563, 600, 600, 'l', ''),
(853, 564, 128, 128, 's', ''),
(854, 564, 300, 300, 'm', ''),
(855, 564, 600, 600, 'l', ''),
(856, 565, 128, 128, 's', ''),
(857, 565, 300, 300, 'm', ''),
(858, 565, 600, 600, 'l', ''),
(859, 566, 128, 128, 's', ''),
(860, 566, 300, 300, 'm', ''),
(861, 566, 600, 600, 'l', ''),
(862, 567, 128, 128, 's', ''),
(863, 567, 300, 300, 'm', ''),
(864, 567, 600, 600, 'l', ''),
(865, 568, 128, 128, 's', ''),
(866, 568, 300, 300, 'm', ''),
(867, 568, 600, 600, 'l', ''),
(868, 569, 128, 128, 's', ''),
(869, 569, 300, 300, 'm', ''),
(870, 569, 600, 600, 'l', ''),
(871, 570, 128, 128, 's', ''),
(872, 570, 300, 300, 'm', ''),
(873, 570, 600, 600, 'l', ''),
(874, 571, 128, 128, 's', ''),
(875, 571, 300, 300, 'm', ''),
(876, 571, 600, 600, 'l', ''),
(877, 572, 128, 128, 's', ''),
(878, 572, 300, 300, 'm', ''),
(879, 572, 600, 600, 'l', ''),
(880, 573, 128, 128, 's', ''),
(881, 573, 300, 300, 'm', ''),
(882, 573, 600, 600, 'l', ''),
(883, 574, 128, 128, 's', ''),
(884, 574, 300, 300, 'm', ''),
(885, 574, 600, 600, 'l', ''),
(886, 575, 128, 128, 's', ''),
(887, 575, 300, 300, 'm', ''),
(888, 575, 600, 600, 'l', ''),
(889, 576, 128, 128, 's', ''),
(890, 576, 300, 300, 'm', ''),
(891, 576, 600, 600, 'l', ''),
(892, 577, 128, 128, 's', ''),
(893, 577, 300, 300, 'm', ''),
(894, 577, 600, 600, 'l', ''),
(895, 578, 128, 128, 's', ''),
(896, 578, 300, 300, 'm', ''),
(897, 578, 600, 600, 'l', ''),
(898, 579, 128, 128, 's', ''),
(899, 579, 300, 300, 'm', ''),
(900, 579, 600, 600, 'l', ''),
(901, 580, 128, 128, 's', ''),
(902, 580, 300, 300, 'm', ''),
(903, 580, 600, 600, 'l', ''),
(904, 581, 128, 128, 's', ''),
(905, 581, 300, 300, 'm', ''),
(906, 581, 600, 600, 'l', ''),
(907, 582, 128, 128, 's', ''),
(908, 582, 300, 300, 'm', ''),
(909, 582, 600, 600, 'l', ''),
(910, 583, 128, 128, 's', ''),
(911, 583, 300, 300, 'm', ''),
(912, 583, 600, 600, 'l', ''),
(913, 584, 128, 128, 's', ''),
(914, 584, 300, 300, 'm', ''),
(915, 584, 600, 600, 'l', ''),
(916, 585, 128, 128, 's', ''),
(917, 585, 300, 300, 'm', ''),
(918, 585, 600, 600, 'l', ''),
(919, 586, 128, 128, 's', ''),
(920, 586, 300, 300, 'm', ''),
(921, 586, 600, 600, 'l', ''),
(922, 587, 128, 128, 's', ''),
(923, 587, 300, 300, 'm', ''),
(924, 587, 600, 600, 'l', ''),
(925, 588, 128, 128, 's', ''),
(926, 588, 300, 300, 'm', ''),
(927, 588, 600, 600, 'l', ''),
(928, 589, 128, 128, 's', ''),
(929, 589, 300, 300, 'm', ''),
(930, 589, 600, 600, 'l', ''),
(931, 590, 128, 128, 's', ''),
(932, 590, 300, 300, 'm', ''),
(933, 590, 600, 600, 'l', ''),
(934, 591, 128, 128, 's', ''),
(935, 591, 300, 300, 'm', ''),
(936, 591, 600, 600, 'l', ''),
(937, 592, 128, 128, 's', ''),
(938, 592, 300, 300, 'm', ''),
(939, 592, 600, 600, 'l', ''),
(940, 593, 128, 128, 's', ''),
(941, 593, 300, 300, 'm', ''),
(942, 593, 600, 600, 'l', ''),
(943, 594, 128, 128, 's', ''),
(944, 594, 300, 300, 'm', ''),
(945, 594, 600, 600, 'l', ''),
(946, 595, 128, 128, 's', ''),
(947, 595, 300, 300, 'm', ''),
(948, 595, 600, 600, 'l', ''),
(949, 596, 128, 128, 's', ''),
(950, 596, 300, 300, 'm', ''),
(951, 596, 600, 600, 'l', ''),
(952, 597, 128, 128, 's', ''),
(953, 597, 300, 300, 'm', ''),
(954, 597, 600, 600, 'l', ''),
(955, 598, 128, 128, 's', ''),
(956, 598, 300, 300, 'm', ''),
(957, 598, 600, 600, 'l', ''),
(958, 599, 128, 128, 's', ''),
(959, 599, 300, 300, 'm', ''),
(960, 599, 600, 600, 'l', ''),
(961, 600, 128, 128, 's', ''),
(962, 600, 300, 300, 'm', ''),
(963, 600, 600, 600, 'l', ''),
(964, 601, 128, 128, 's', ''),
(965, 601, 300, 300, 'm', ''),
(966, 601, 600, 600, 'l', ''),
(967, 602, 128, 128, 's', ''),
(968, 602, 300, 300, 'm', ''),
(969, 602, 600, 600, 'l', ''),
(970, 603, 128, 128, 's', ''),
(971, 603, 300, 300, 'm', ''),
(972, 603, 600, 600, 'l', ''),
(973, 604, 128, 128, 's', ''),
(974, 604, 300, 300, 'm', ''),
(975, 604, 600, 600, 'l', ''),
(976, 605, 128, 128, 's', ''),
(977, 605, 300, 300, 'm', ''),
(978, 605, 600, 600, 'l', ''),
(979, 606, 128, 128, 's', ''),
(980, 606, 300, 300, 'm', ''),
(981, 606, 600, 600, 'l', ''),
(982, 607, 128, 128, 's', ''),
(983, 607, 300, 300, 'm', ''),
(984, 607, 600, 600, 'l', ''),
(985, 608, 128, 128, 's', ''),
(986, 608, 300, 300, 'm', ''),
(987, 608, 600, 600, 'l', ''),
(988, 609, 128, 128, 's', ''),
(989, 609, 300, 300, 'm', ''),
(990, 609, 600, 600, 'l', ''),
(991, 610, 128, 128, 's', ''),
(992, 610, 300, 300, 'm', ''),
(993, 610, 600, 600, 'l', ''),
(994, 611, 128, 128, 's', ''),
(995, 611, 300, 300, 'm', ''),
(996, 611, 600, 600, 'l', ''),
(997, 612, 128, 128, 's', ''),
(998, 612, 300, 300, 'm', ''),
(999, 612, 600, 600, 'l', ''),
(1000, 613, 128, 128, 's', ''),
(1001, 613, 300, 300, 'm', ''),
(1002, 613, 600, 600, 'l', ''),
(1003, 614, 128, 128, 's', ''),
(1004, 614, 300, 300, 'm', ''),
(1005, 614, 600, 600, 'l', ''),
(1006, 615, 128, 128, 's', ''),
(1007, 615, 300, 300, 'm', ''),
(1008, 615, 600, 600, 'l', ''),
(1009, 616, 128, 128, 's', ''),
(1010, 616, 300, 300, 'm', ''),
(1011, 616, 600, 600, 'l', ''),
(1012, 617, 128, 128, 's', ''),
(1013, 617, 300, 300, 'm', ''),
(1014, 617, 600, 600, 'l', ''),
(1015, 618, 128, 128, 's', ''),
(1016, 618, 300, 300, 'm', ''),
(1017, 618, 600, 600, 'l', ''),
(1018, 619, 128, 128, 's', ''),
(1019, 619, 300, 300, 'm', ''),
(1020, 619, 600, 600, 'l', ''),
(1021, 620, 128, 128, 's', ''),
(1022, 620, 300, 300, 'm', ''),
(1023, 620, 600, 600, 'l', ''),
(1024, 621, 128, 128, 's', ''),
(1025, 621, 300, 300, 'm', ''),
(1026, 621, 600, 600, 'l', ''),
(1027, 622, 128, 128, 's', ''),
(1028, 622, 300, 300, 'm', ''),
(1029, 622, 600, 600, 'l', ''),
(1030, 623, 128, 128, 's', ''),
(1031, 623, 300, 300, 'm', ''),
(1032, 623, 600, 600, 'l', ''),
(1033, 624, 128, 128, 's', ''),
(1034, 624, 300, 300, 'm', ''),
(1035, 624, 600, 600, 'l', ''),
(1036, 625, 128, 128, 's', ''),
(1037, 625, 300, 300, 'm', ''),
(1038, 625, 600, 600, 'l', ''),
(1039, 626, 128, 128, 's', ''),
(1040, 626, 300, 300, 'm', ''),
(1041, 626, 600, 600, 'l', ''),
(1042, 627, 128, 128, 's', ''),
(1043, 627, 300, 300, 'm', ''),
(1044, 627, 600, 600, 'l', ''),
(1045, 628, 128, 128, 's', ''),
(1046, 628, 300, 300, 'm', ''),
(1047, 628, 600, 600, 'l', ''),
(1048, 629, 128, 128, 's', ''),
(1049, 629, 300, 300, 'm', ''),
(1050, 629, 600, 600, 'l', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci AUTO_INCREMENT=182 ;

--
-- Dumping data for table `m2m_post`
--

INSERT INTO `m2m_post` (`id`, `title`, `summary`, `content`, `view`, `edit`, `delete`, `created`, `modified`, `coverId`, `userId`) VALUES
(146, 'Title', 'Biatch', NULL, 'P', 'P', '*', '2014-03-14 13:53:21', '2014-03-14 13:53:35', NULL, 2),
(154, 'Click here to enter a titleasdf', 'Click here enter a brief summaryasdf', 'fasdClick here enter a post content', 'P', 'P', '*', '2014-04-11 16:50:59', '2014-06-30 16:32:03', NULL, 36),
(178, '', NULL, NULL, 'P', 'P', 'P', '2014-06-30 09:52:50', '2014-06-30 23:30:35', 115, 1),
(179, '', NULL, NULL, 'P', 'P', 'P', '2014-07-26 14:53:36', NULL, NULL, 1),
(180, '', NULL, NULL, 'P', 'P', 'P', '2014-07-26 14:58:38', NULL, NULL, 1),
(181, '', NULL, NULL, 'P', 'P', 'P', '2014-07-26 15:00:12', '2014-07-26 15:06:36', NULL, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1534 ;

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
(1533, 'image', 181, 629, NULL);

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
(1, 'email', 'E-Mail', '', 'VARCHAR', 255, 0, 0, '', '', '', 'CEmailValidator', '', 0, 2, ''),
(2, 'firstname', 'First name', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 3, ''),
(3, 'lastname', 'Last name', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 3, ''),
(9, 'telephone', 'Contact Number', '', 'VARCHAR', 13, 10, 0, '', '', '', '', '', 0, 4, ''),
(14, 'company', 'Company', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 4, ''),
(15, 'address', 'Address', '', 'VARCHAR', 255, 0, 0, '', '', '', '', '', 0, 4, ''),
(18, 'zip', 'Zip/Postal Code', '', 'VARCHAR', 28, 2, 0, '', '', '', '', '', 0, 4, ''),
(20, 'country', 'Country Code (eg. ZA)', '', 'VARCHAR', 3, 2, 0, '', '', '', '', '', 0, 4, ''),
(21, 'city', 'City', 'Your city of origin.', 'VARCHAR', 255, 4, 0, '', '', '', '', '', 0, 4, ''),
(22, 'state', 'Province/State', 'Province or state of origin.', 'VARCHAR', 255, 3, 0, '', '', '', '', '', 0, 4, '');

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
(58, 1, 'GLink', 'inspectorLink', '<i class="glyphicon glyphicon-wrench glyphicon-2x"></i>', '', '{"htmlOptions":{"class":"InspectorLink"},"url":"\\/gong\\/site\\/template\\/list"}', NULL, NULL, 'SUPER', 'SUPER', 'null', '2013-08-31 13:18:57', '2014-06-29 15:49:35', 4, 2, 32),
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
(1, 'admin', '2d92aead1ecbd68b81e67844abcbea02325dc4c760e9afb155ac9560e96a24008597014acfbc179e4e43a9cb63dee64d33ff6ff795f9f5f7337027eb19bae8e4', '1cKpqyPTh3pnytonuQzaxIomnzuLwDVN/rhfCtF78pmyPlB7oSwV2SVvI0pjsuXdsIkrUM+4xcwi4oM8BZG+wg==', 'edbd335ae87994b37ed2a9211183a4425c20d186f66ec3ac060f914778c6544eb0da45c783ec68587720148f7c7d2beba2ffb1e40843624146cce5370f0e24f5', 1335171345, 1406371808, 1406382190, 0, 1, 1, 0, 1, '', 'Instant'),
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
('ffgpkmt1g5ufrcrskbe6n7k1n1', 1406385790, 0x37616438623935323738326637393432323064653833306534613464353537385f5f69647c733a313a2231223b37616438623935323738326637393432323064653833306534613464353537385f5f6e616d657c733a353a2261646d696e223b376164386239353237383266373934323230646538333065346134643535373869647c733a313a2231223b37616438623935323738326637393432323064653833306534613464353537385f5f7374617465737c613a313a7b733a323a226964223b623a313b7d726566726573687c623a313b37616438623935323738326637393432323064653833306534613464353537385969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
('j3j5id735vl3lgc9s3dce0d2p6', 1406386188, 0x5969692e4343617074636861416374696f6e2e31333930303534622e676f6e672f757365722f726567697374726174696f6e2e636170746368617c733a373a226a65736964796e223b5969692e4343617074636861416374696f6e2e31333930303534622e676f6e672f757365722f726567697374726174696f6e2e63617074636861636f756e747c693a313b37616438623935323738326637393432323064653833306534613464353537385f5f69647c733a323a223336223b37616438623935323738326637393432323064653833306534613464353537385f5f6e616d657c733a313a2270223b376164386239353237383266373934323230646538333065346134643535373869647c733a323a223336223b37616438623935323738326637393432323064653833306534613464353537385f5f7374617465737c613a313a7b733a323a226964223b623a313b7d726566726573687c623a313b37616438623935323738326637393432323064653833306534613464353537385969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
