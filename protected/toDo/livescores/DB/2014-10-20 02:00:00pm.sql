-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 20, 2014 at 02:42 PM
-- Server version: 5.5.38
-- PHP Version: 5.4.4-14+deb7u14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `flagship_livescores`
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
-- Table structure for table `livescores_account`
--

CREATE TABLE IF NOT EXISTS `livescores_account` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `size` bigint(40) NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `livescores_account`
--

INSERT INTO `livescores_account` (`id`, `size`, `userId`, `created`, `modified`) VALUES
(1, 2749642830, 1, '0000-00-00 00:00:00', '2014-09-08 13:49:31'),
(2, 32354677, 36, '0000-00-00 00:00:00', '2014-04-12 00:35:50'),
(3, 8260697, 2, '2014-03-14 13:53:52', '2014-03-14 13:54:16');

-- --------------------------------------------------------

--
-- Table structure for table `livescores_action`
--

CREATE TABLE IF NOT EXISTS `livescores_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `comment` text,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `livescores_action`
--

INSERT INTO `livescores_action` (`id`, `title`, `comment`, `subject`) VALUES
(28, 'GUserUpdate', NULL, NULL),
(29, 'GInvoiceUpdate', NULL, NULL),
(30, 'GAccountUpdate', NULL, NULL),
(31, 'GTranslationUpdate', NULL, NULL),
(32, 'GFormElementUpdate', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_custom_url`
--

CREATE TABLE IF NOT EXISTS `livescores_custom_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(256) NOT NULL,
  `url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `livescores_custom_url`
--

INSERT INTO `livescores_custom_url` (`id`, `path`, `url`) VALUES
(1, '/page/post/admin', '/newspaper');

-- --------------------------------------------------------

--
-- Table structure for table `livescores_file`
--

CREATE TABLE IF NOT EXISTS `livescores_file` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=318 ;

--
-- Dumping data for table `livescores_file`
--

INSERT INTO `livescores_file` (`id`, `type`, `filename`, `mime`, `created`, `modified`, `weight`, `view`, `edit`, `delete`, `userId`) VALUES
(195, 'video', 'final_2.mp4', '', '2014-08-15 19:41:59', NULL, NULL, 'P', 'P', 'P', 1),
(316, 'data', '', '', '2014-09-02 23:09:42', NULL, NULL, 'P', 'P', 'P', 1),
(317, 'video', 'TF2-In-10-Seconds-SFM---YouTube.mp4', '', '2014-09-03 07:26:35', NULL, NULL, 'P', 'P', 'P', 1);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_file_audio`
--

CREATE TABLE IF NOT EXISTS `livescores_file_audio` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `livescores_file_image`
--

CREATE TABLE IF NOT EXISTS `livescores_file_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `alt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `livescores_file_video`
--

CREATE TABLE IF NOT EXISTS `livescores_file_video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=78 ;

--
-- Dumping data for table `livescores_file_video`
--

INSERT INTO `livescores_file_video` (`id`, `fileId`) VALUES
(63, 288),
(62, 195),
(61, 194),
(60, 193),
(59, 192),
(58, 191),
(57, 190),
(56, 189),
(55, 187),
(54, 186),
(53, 185),
(31, 162),
(32, 163),
(33, 164),
(34, 165),
(35, 0),
(36, 167),
(37, 169),
(38, 170),
(39, 171),
(40, 172),
(41, 173),
(42, 174),
(43, 175),
(44, 176),
(45, 177),
(46, 178),
(47, 179),
(48, 180),
(49, 181),
(50, 182),
(51, 183),
(52, 184),
(64, 291),
(65, 292),
(66, 293),
(67, 294),
(68, 295),
(69, 296),
(70, 297),
(71, 298),
(72, 299),
(73, 300),
(74, 302),
(75, 303),
(76, 304),
(77, 317);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_form`
--

CREATE TABLE IF NOT EXISTS `livescores_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `table` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `livescores_form`
--

INSERT INTO `livescores_form` (`id`, `name`, `table`, `created`, `modified`, `elementId`) VALUES
(14, 'Player', 'scores_player', '2014-09-17', '0000-00-00', 0),
(15, 'Team', 'scores_team', '2014-09-21', '2014-09-21', 0),
(16, 'Score', 'scores_score', '2014-09-21', '2014-09-24', 0),
(17, 'Country', 'scores_country', '2014-09-22', '2014-10-15', 0),
(18, 'Group', 'scores_group', '2014-09-22', '2014-09-24', 0),
(19, 'Course', 'scores_course', '2014-09-24', '0000-00-00', 0),
(20, 'Flighting', 'scores_flighting', '2014-09-24', '2014-09-24', 0),
(21, 'Tournament', 'scores_tournament', '2014-09-24', '0000-00-00', 0),
(22, 'Par', 'scores_par', '2014-09-29', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_form_element`
--

CREATE TABLE IF NOT EXISTS `livescores_form_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` int(11) DEFAULT '1',
  `title` varchar(255) DEFAULT NULL,
  `className` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `livescores_form_element`
--

INSERT INTO `livescores_form_element` (`id`, `mode`, `title`, `className`, `name`, `description`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
(14, 1, NULL, 'GTextField', 'name', NULL, '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-17 14:54:03', '2014-09-24 21:09:38', 0, 14, 1),
(15, 1, NULL, 'GActiveDropDown', 'country', NULL, '', '', '{"displayFieldName":"name","tableName":"scores_country"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-17 15:20:57', '2014-09-24 21:09:38', 1, 14, 1),
(17, 1, NULL, 'GActiveDropDown', 'playerId', NULL, '', '', '{"displayFieldName":"name","tableName":"scores_player"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-21 21:45:29', '2014-09-24 19:34:59', NULL, 16, 1),
(18, 1, NULL, 'GTextField', 'name', NULL, '', '', NULL, NULL, NULL, '*', 'SUPER', NULL, '2014-09-22 09:57:15', NULL, NULL, 18, 1),
(19, 1, NULL, 'GTextField', 'css', NULL, '', '', NULL, NULL, NULL, '*', 'SUPER', NULL, '2014-09-22 09:58:00', NULL, NULL, 18, 1),
(20, 1, NULL, 'GTextField', 'name', NULL, '', '', NULL, NULL, NULL, '*', 'SUPER', NULL, '2014-09-22 11:17:18', NULL, NULL, 17, 1),
(21, 1, NULL, 'GTextField', 'name', NULL, '', '', NULL, NULL, NULL, '*', 'SUPER', NULL, '2014-09-22 12:11:38', NULL, NULL, 15, 1),
(24, 1, NULL, 'GFileField', 'flag', NULL, '', '', NULL, NULL, NULL, '*', 'SUPER', NULL, '2014-09-22 13:40:36', NULL, NULL, 17, 1),
(25, 1, NULL, 'GNumericField', 'score', NULL, '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-24 20:52:35', '2014-10-08 22:00:47', NULL, 16, 1),
(26, 1, NULL, 'GTextField', 'name', NULL, '', '', '{}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-24 21:00:14', '2014-10-13 12:10:14', NULL, 20, 1),
(27, 1, NULL, 'GTextField', 'name', NULL, '', '', NULL, NULL, NULL, '*', 'SUPER', NULL, '2014-09-24 21:03:20', NULL, NULL, 19, 1),
(29, 1, NULL, 'GActiveDropDown', 'team', NULL, '', '', '{"displayFieldName":"name","tableName":"scores_team"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-24 21:07:42', '2014-09-24 21:12:48', 2, 14, 1),
(35, 1, NULL, 'GNumericField', 'handicap', NULL, '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-24 21:17:09', '2014-09-24 21:37:09', 3, 14, 1),
(36, 1, NULL, 'GActiveDropDown', 'flighting', NULL, '', '', '{"displayFieldName":"name","tableName":"scores_flighting"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-24 21:37:51', '2014-09-24 21:42:33', 4, 14, 1),
(37, 1, NULL, 'GActiveDropDown', 'group', NULL, '', '', '{"displayFieldName":"name","tableName":"scores_group"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-24 21:39:05', '2014-09-24 21:41:31', 5, 14, 1),
(38, 1, NULL, 'GTextField', 'contactNumber', NULL, '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-24 21:40:12', '2014-09-24 21:40:30', 6, 14, 1),
(39, 1, NULL, 'GEmailField', 'email', NULL, '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-24 21:40:20', '2014-09-24 21:40:29', 7, 14, 1),
(40, 1, NULL, 'GActiveDropDown', 'course', NULL, '', '', '{"displayFieldName":"name","tableName":"scores_course"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-29 17:01:56', '2014-09-29 18:37:53', 0, 22, 1),
(44, 1, NULL, 'GNumericField', 'par', NULL, '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-29 18:36:15', '2014-09-29 18:37:53', 3, 22, 1),
(45, 1, NULL, 'GNumericField', 'hole', NULL, '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-29 18:37:40', '2014-10-15 17:45:29', 1, 22, 1),
(46, 1, NULL, 'GActiveDropDown', 'course', NULL, '', '', '{"displayFieldName":"name","tableName":"scores_course"}', NULL, NULL, '*', 'SUPER', NULL, '2014-10-20 11:58:26', '2014-10-20 11:58:57', NULL, 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_friendship`
--

CREATE TABLE IF NOT EXISTS `livescores_friendship` (
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
-- Dumping data for table `livescores_friendship`
--

INSERT INTO `livescores_friendship` (`id`, `inviterId`, `friendId`, `status`, `modified`, `created`, `message`) VALUES
(7, 35, 36, 2, NULL, '2014-03-04 00:24:42', ''),
(8, 1, 36, 1, NULL, '2014-06-29 16:16:02', '');

-- --------------------------------------------------------

--
-- Table structure for table `livescores_invoice`
--

CREATE TABLE IF NOT EXISTS `livescores_invoice` (
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
-- Dumping data for table `livescores_invoice`
--

INSERT INTO `livescores_invoice` (`id`, `size`, `rate`, `userId`, `created`, `sent`, `paid`) VALUES
(4, 3074048, 2, 1, '0000-00-00 00:00:00', 0, 0),
(5, 239554107, 23, 1, '2014-06-29 16:15:33', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_membership`
--

CREATE TABLE IF NOT EXISTS `livescores_membership` (
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
-- Dumping data for table `livescores_membership`
--

INSERT INTO `livescores_membership` (`id`, `roleId`, `userId`, `payment_id`, `order_date`, `end_date`, `name`, `street`, `zipcode`, `city`, `payment_date`, `subscribed`) VALUES
(9, 12, 35, 1, 1392452436, 2147483647, NULL, NULL, NULL, NULL, NULL, 0),
(12, 11, 36, 1, 1392452436, 2147483647, NULL, NULL, NULL, NULL, NULL, 0),
(13, 12, 38, 1, 1394197780, 2147483647, NULL, NULL, NULL, NULL, NULL, 0),
(14, 11, 38, 1, 1395058062, 2147483647, NULL, NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_message`
--

CREATE TABLE IF NOT EXISTS `livescores_message` (
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
-- Dumping data for table `livescores_message`
--

INSERT INTO `livescores_message` (`id`, `created`, `modified`, `fromUserId`, `toUserId`, `subject`, `message`, `read`, `answered`, `draft`) VALUES
(9, '2014-03-04 10:02:25', '2014-03-07 12:37:59', 35, 36, 'test', '321', 1, 0, 0),
(11, '2014-06-30 10:50:49', '0000-00-00 00:00:00', 1, 1, 'sdfg', 'asdf', 0, 0, 0),
(12, '2014-06-30 16:30:28', '2014-06-30 16:31:40', 35, 36, 'asdf', 'asdf', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_payment`
--

CREATE TABLE IF NOT EXISTS `livescores_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `livescores_payment`
--

INSERT INTO `livescores_payment` (`id`, `title`, `text`) VALUES
(1, 'Prepayment', NULL),
(2, 'Paypal', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_permission`
--

CREATE TABLE IF NOT EXISTS `livescores_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `actionId` int(11) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `livescores_permission`
--

INSERT INTO `livescores_permission` (`id`, `roleId`, `actionId`, `description`) VALUES
(1, 13, 28, NULL),
(2, 14, 30, NULL),
(3, 15, 29, NULL),
(4, 16, 31, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_post`
--

CREATE TABLE IF NOT EXISTS `livescores_post` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci AUTO_INCREMENT=185 ;

--
-- Dumping data for table `livescores_post`
--

INSERT INTO `livescores_post` (`id`, `title`, `summary`, `content`, `view`, `edit`, `delete`, `created`, `modified`, `coverId`, `userId`) VALUES
(146, 'Title', 'Biatch', NULL, 'P', 'P', '*', '2014-03-14 13:53:21', '2014-03-14 13:53:35', NULL, 2),
(154, 'Click here to enter a titleasdf', 'Click here enter a brief summaryasdf', 'fasdClick here enter a post content', 'P', 'P', '*', '2014-04-11 16:50:59', '2014-06-30 16:32:03', NULL, 36),
(184, '', NULL, NULL, 'P', 'P', 'P', '2014-09-02 23:09:19', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_post_file`
--

CREATE TABLE IF NOT EXISTS `livescores_post_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `postId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1215 ;

--
-- Dumping data for table `livescores_post_file`
--

INSERT INTO `livescores_post_file` (`id`, `type`, `postId`, `fileId`, `weight`) VALUES
(975, 'data', 174, 70, NULL),
(976, 'audio', 174, 71, NULL),
(977, 'image', 174, 72, NULL),
(1026, 'audio', 154, 122, NULL),
(1030, 'image', 178, 126, NULL),
(1031, 'image', 178, 127, NULL),
(1076, 'video', 179, 178, NULL),
(1080, 'video', 180, 182, NULL),
(1081, 'video', 180, 183, NULL),
(1082, 'video', 180, 184, NULL),
(1083, 'video', 180, 185, NULL),
(1084, 'video', 180, 186, NULL),
(1085, 'video', 180, 187, NULL),
(1086, 'data', 180, 188, NULL),
(1087, 'video', 180, 189, NULL),
(1088, 'video', 180, 190, NULL),
(1089, 'video', 180, 191, NULL),
(1090, 'video', 180, 192, NULL),
(1091, 'video', 180, 193, NULL),
(1092, 'video', 180, 194, NULL),
(1093, 'audio', 180, 196, NULL),
(1094, 'audio', 180, 197, NULL),
(1095, 'image', 180, 198, NULL),
(1096, 'image', 180, 199, NULL),
(1097, 'image', 180, 200, NULL),
(1098, 'image', 180, 201, NULL),
(1099, 'image', 180, 202, NULL),
(1100, 'image', 180, 203, NULL),
(1101, 'image', 180, 204, NULL),
(1102, 'audio', 180, 205, NULL),
(1103, 'audio', 180, 206, NULL),
(1104, 'audio', 180, 207, NULL),
(1105, 'audio', 180, 208, NULL),
(1106, 'audio', 180, 209, NULL),
(1107, 'audio', 180, 210, NULL),
(1108, 'data', 180, 211, NULL),
(1109, 'audio', 180, 212, NULL),
(1110, 'audio', 180, 213, NULL),
(1111, 'audio', 180, 214, NULL),
(1112, 'audio', 180, 215, NULL),
(1113, 'image', 180, 216, NULL),
(1114, 'audio', 180, 217, NULL),
(1115, 'audio', 180, 218, NULL),
(1116, 'audio', 180, 219, NULL),
(1117, 'audio', 180, 220, NULL),
(1118, 'audio', 180, 221, NULL),
(1119, 'audio', 180, 222, NULL),
(1120, 'audio', 180, 223, NULL),
(1121, 'audio', 180, 224, NULL),
(1122, 'audio', 180, 225, NULL),
(1123, 'audio', 180, 226, NULL),
(1124, 'audio', 180, 227, NULL),
(1125, 'audio', 180, 228, NULL),
(1126, 'audio', 180, 229, NULL),
(1127, 'audio', 180, 230, NULL),
(1128, 'audio', 180, 231, NULL),
(1129, 'audio', 180, 232, NULL),
(1130, 'audio', 180, 233, NULL),
(1131, 'audio', 180, 234, NULL),
(1132, 'audio', 180, 235, NULL),
(1133, 'audio', 180, 236, NULL),
(1134, 'data', 180, 237, NULL),
(1135, 'audio', 180, 238, NULL),
(1136, 'audio', 180, 239, NULL),
(1137, 'audio', 180, 240, NULL),
(1138, 'audio', 180, 241, NULL),
(1139, 'audio', 182, 242, NULL),
(1140, 'audio', 182, 243, NULL),
(1141, 'image', 182, 244, NULL),
(1142, 'image', 182, 245, NULL),
(1143, 'image', 182, 246, NULL),
(1144, 'image', 182, 247, NULL),
(1145, 'image', 182, 248, NULL),
(1146, 'image', 182, 249, NULL),
(1147, 'image', 182, 250, NULL),
(1148, 'audio', 182, 251, NULL),
(1149, 'audio', 182, 252, NULL),
(1150, 'audio', 182, 253, NULL),
(1151, 'audio', 182, 254, NULL),
(1152, 'audio', 182, 255, NULL),
(1153, 'audio', 182, 256, NULL),
(1154, 'data', 182, 257, NULL),
(1155, 'audio', 182, 258, NULL),
(1156, 'audio', 182, 259, NULL),
(1157, 'audio', 182, 260, NULL),
(1158, 'audio', 182, 261, NULL),
(1159, 'image', 182, 262, NULL),
(1160, 'audio', 182, 263, NULL),
(1161, 'audio', 182, 264, NULL),
(1162, 'audio', 182, 265, NULL),
(1163, 'audio', 182, 266, NULL),
(1164, 'audio', 182, 267, NULL),
(1165, 'audio', 182, 268, NULL),
(1166, 'audio', 182, 269, NULL),
(1167, 'audio', 182, 270, NULL),
(1168, 'audio', 182, 271, NULL),
(1169, 'audio', 182, 272, NULL),
(1170, 'audio', 182, 273, NULL),
(1171, 'audio', 182, 274, NULL),
(1172, 'audio', 182, 275, NULL),
(1173, 'audio', 182, 276, NULL),
(1174, 'audio', 182, 277, NULL),
(1175, 'audio', 182, 278, NULL),
(1176, 'audio', 182, 279, NULL),
(1177, 'audio', 182, 280, NULL),
(1178, 'audio', 182, 281, NULL),
(1179, 'audio', 182, 282, NULL),
(1180, 'data', 182, 283, NULL),
(1181, 'audio', 182, 284, NULL),
(1182, 'audio', 182, 285, NULL),
(1183, 'audio', 182, 286, NULL),
(1184, 'audio', 182, 287, NULL),
(1200, 'video', 183, 302, NULL),
(1201, 'video', 183, 303, NULL),
(1202, 'video', 183, 304, NULL),
(1203, 'data', 183, 306, NULL),
(1204, 'data', 183, 307, NULL),
(1205, 'data', 183, 308, NULL),
(1206, 'data', 183, 309, NULL),
(1207, 'data', 183, 310, NULL),
(1208, 'data', 183, 311, NULL),
(1209, 'data', 183, 312, NULL),
(1210, 'data', 183, 313, NULL),
(1211, 'data', 183, 314, NULL),
(1212, 'data', 183, 315, NULL),
(1213, 'data', 184, 316, NULL),
(1214, 'video', 184, 317, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_privacysetting`
--

CREATE TABLE IF NOT EXISTS `livescores_privacysetting` (
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
-- Dumping data for table `livescores_privacysetting`
--

INSERT INTO `livescores_privacysetting` (`userId`, `message_new_friendship`, `message_new_message`, `message_new_profilecomment`, `appear_in_search`, `show_online_status`, `log_profile_visits`, `ignore_users`, `public_profile_fields`) VALUES
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
-- Table structure for table `livescores_profile`
--

CREATE TABLE IF NOT EXISTS `livescores_profile` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Dumping data for table `livescores_profile`
--

INSERT INTO `livescores_profile` (`id`, `userId`, `timestamp`, `privacy`, `lastname`, `firstname`, `show_friends`, `allow_comments`, `email`, `company`, `telephone`, `address`, `city`, `state`, `zip`, `country`) VALUES
(1, 1, '2014-10-20 10:32:00', 'protected', 'admin', 'admin123asfasdfassssfd', 1, 1, 'alistairnel@gmail.com', 'Almagest Fraternite', '1111111111111', 'Ghost Street', 'Durban', 'KZNasdf', 4000, 'ds'),
(39, 36, '2014-10-20 10:31:55', 'protected', '', '', 1, 1, 'alistairnel2@gmail.com', '', '', '', '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `livescores_profile_comment`
--

CREATE TABLE IF NOT EXISTS `livescores_profile_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `livescores_profile_field`
--

CREATE TABLE IF NOT EXISTS `livescores_profile_field` (
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
-- Dumping data for table `livescores_profile_field`
--

INSERT INTO `livescores_profile_field` (`id`, `varname`, `title`, `hint`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `position`, `visible`, `related_field_name`) VALUES
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
-- Table structure for table `livescores_profile_visit`
--

CREATE TABLE IF NOT EXISTS `livescores_profile_visit` (
  `visitor_id` int(11) NOT NULL,
  `visited_id` int(11) NOT NULL,
  `timestamp_first_visit` int(11) NOT NULL,
  `timestamp_last_visit` int(11) NOT NULL,
  `num_of_visits` int(11) NOT NULL,
  PRIMARY KEY (`visitor_id`,`visited_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livescores_profile_visit`
--

INSERT INTO `livescores_profile_visit` (`visitor_id`, `visited_id`, `timestamp_first_visit`, `timestamp_last_visit`, `num_of_visits`) VALUES
(1, 2, 1335171800, 1337652058, 11),
(1, 3, 1335179541, 1337135324, 41),
(1, 4, 1337132241, 1337646718, 22),
(2, 1, 1336575805, 1336576270, 4),
(4, 1, 1336661711, 1337148523, 8),
(4, 2, 1336661708, 1337146605, 2);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_role`
--

CREATE TABLE IF NOT EXISTS `livescores_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double NOT NULL COMMENT 'Price (when using membership module)',
  `duration` int(11) NOT NULL COMMENT 'How long a membership is valid',
  `registration` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `livescores_role`
--

INSERT INTO `livescores_role` (`id`, `title`, `description`, `price`, `duration`, `registration`) VALUES
(11, 'Producer', 'null', 123, 321, 1),
(12, 'Reporter', 'null', 321, 321, 1),
(13, 'UserManager', '', 1, 365, 0),
(14, 'AccountManager', NULL, 0, 0, 0),
(15, 'InvoiceManager', NULL, 0, 0, 0),
(16, 'SiteManager', NULL, 0, 0, 0),
(17, 'ElementManager', NULL, 0, 0, 0),
(18, 'FormManager', NULL, 0, 0, 0),
(19, 'ScoreCreator', NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_site_page`
--

CREATE TABLE IF NOT EXISTS `livescores_site_page` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `livescores_site_page`
--

INSERT INTO `livescores_site_page` (`id`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`) VALUES
(5, 'upload', '@', 'admin', 'admin', '2013-02-17 00:00:00', '2014-09-08 15:34:45', 0, 1),
(11, 'about_us', '*', 'null', 'null', '2013-08-31 17:47:59', '2014-06-05 16:59:03', 2, 1),
(12, 'landing', '*', 'null', 'null', '2014-02-26 14:07:41', '2014-06-05 16:59:03', 1, 1),
(14, 'profile', '@', 'admin', 'admin', '2014-06-05 14:50:22', '2014-09-08 15:34:50', 4, 1),
(15, 'team', '*', NULL, NULL, '2014-10-12 20:20:16', NULL, NULL, 1),
(16, 'flightings', '*', NULL, NULL, '2014-10-13 11:52:21', '2014-10-13 12:00:49', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_site_page_element`
--

CREATE TABLE IF NOT EXISTS `livescores_site_page_element` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=147 ;

--
-- Dumping data for table `livescores_site_page_element`
--

INSERT INTO `livescores_site_page_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
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
(75, 1, 'GImage', 'profile_image', '', '', '{"htmlOptions":{"class":"pull-left"},"src":"\\/themes\\/video\\/images\\/profile_reporter.png"}', NULL, NULL, '*', 'SUPER', 'null', '2013-09-01 14:44:02', '2014-04-29 00:00:14', 0, 1, 1),
(79, 1, 'GPublishButton', 'profile_publish', '', '', '{}', NULL, NULL, '*', 'SUPER', 'null', '2013-09-01 16:50:01', '2014-03-17 14:49:06', 1, 1, 1),
(138, 1, 'GActiveDropDown', 'Course', '', '', '{"displayFieldName":"name","listOptions":{"onchange":"$(this.form).trigger(\\"submit\\")"},"tableName":"scores_course"}', NULL, NULL, '@', 'SUPER', NULL, '2014-10-07 21:29:23', '2014-10-16 11:50:07', 1, 12, 1),
(139, 2, 'GFormWidget', 'Open Form', '', '', '[]', NULL, NULL, '@', 'SUPER', NULL, '2014-10-07 22:06:17', '2014-10-12 20:19:16', 0, 12, 1),
(140, 3, 'GFormWidget', 'Close Form', '', '', '[]', NULL, NULL, '@', 'SUPER', NULL, '2014-10-07 22:06:46', '2014-10-12 20:19:43', 5, 12, 1),
(143, 1, 'GScoreForm', 'scoreform', '', '', '[]', NULL, NULL, '@', 'SUPER', NULL, '2014-10-08 13:42:42', '2014-10-12 20:19:37', 3, 12, 1),
(145, 1, 'GScoreRankingTeam', 'team', '<style>\r\n\r\nbody{\r\nbackground-image: url(''/themes/livescores/images/world-golfers-championship.jpg'');\r\n    background-repeat: no-repeat;\r\nbackground-attachment: fixed;\r\n}\r\n\r\n\r\n.GScoreRankingTeam {\r\ncolor: white;\r\nfont-size: 16px;\r\npadding-bottom: 100px;\r\n}\r\n\r\n.GScoreRankingFlighting h2 {\r\ncolor: white;\r\n}\r\n\r\n\r\n</style>', '', NULL, NULL, NULL, '*', 'SUPER', NULL, '2014-10-12 20:33:11', NULL, NULL, 15, 1),
(146, 1, 'GScoreRankingFlighting', 'flight', '<style>\r\n\r\nbody{\r\nbackground-image: url(''/themes/livescores/images/world-golfers-championship.jpg'');\r\n    background-repeat: no-repeat;\r\nbackground-attachment: fixed;\r\n}\r\n\r\n.GScoreRankingFlighting{\r\ncolor: white;\r\nfont-size: 16px;\r\npadding-bottom: 100px;\r\n}\r\n\r\n.GScoreRankingFlighting h2 {\r\ncolor: white;\r\n}\r\n</style>', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-10-13 12:00:08', '2014-10-13 12:02:06', NULL, 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_site_template`
--

CREATE TABLE IF NOT EXISTS `livescores_site_template` (
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
-- Dumping data for table `livescores_site_template`
--

INSERT INTO `livescores_site_template` (`id`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`) VALUES
(2, 'template', '*', 'admin', 'admin', '2013-02-17 00:00:00', '2014-09-08 15:37:45', 1, 1),
(9, 'printTemplate', 'none', 'admin', 'admin', '2013-07-11 00:00:00', '2014-09-08 15:37:47', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_site_template_element`
--

CREATE TABLE IF NOT EXISTS `livescores_site_template_element` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=161 ;

--
-- Dumping data for table `livescores_site_template_element`
--

INSERT INTO `livescores_site_template_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
(3, 2, 'GHeader', 'header', '', '', '{"tag":"div"}', NULL, NULL, '*', 'disabled', '', '2013-02-17 00:00:00', '2014-10-20 14:40:26', 5, 2, 1),
(4, 1, 'GImage', 'logoImage', '', '', '{"alt":"Coastal Accounting video exchange Logo","htmlOptions":{"class":"logo"},"src":"\\/themes\\/video\\/images\\/coastal-logo.png"}', NULL, NULL, 'disabled', 'disabled', '', '2013-08-12 00:00:00', '2014-10-20 14:40:27', 6, 2, 1),
(12, 3, 'GHeader', 'headerEnd', '', '', '[]', NULL, NULL, '*', 'disabled', 'null', '2013-06-27 00:00:00', '2014-10-20 14:40:27', 8, 2, 1),
(13, 1, 'GBusyPrompt', 'loading', '', '', '{"loadingImage":"\\/themes\\/video\\/images\\/ajax-loader.gif","loadingText":"","savingImage":"\\/themes\\/video\\/images\\/ajax-loader.gif","savingText":""}', NULL, NULL, '*', 'SUPER', '', '2013-07-10 00:00:00', '2014-10-20 14:40:27', 14, 2, 1),
(14, 1, 'GBrowserWarning', 'browserNotification', '', '', '[]', NULL, NULL, 'disabled', 'SUPER', '', '2013-07-10 00:00:00', '2014-10-20 14:40:27', 16, 2, 1),
(15, 1, 'GTag', 'loadingShadow', '', '', '{"htmlOptions":{"class":"fullscreen saving loading\\u00a0browserNotification"}}', NULL, NULL, '*', 'SUPER', '', '2013-07-10 00:00:00', '2014-10-20 14:40:27', 15, 2, 1),
(17, 1, 'GTabs', 'menu', '', '', '{"items":[{"linkOptions":{"class":"searchTab"},"icon":"glyphicon glyphicon-play glyphicon-2x","url":"/index.php"},{"linkOptions":{"class":"uploadTab"},"icon":"glyphicon glyphicon-upload glyphicon-2x","url":"/page/upload","view":"disabled"},{"linkOptions":{"class":"contactTab"},"icon":"glyphicon glyphicon-envelope glyphicon-2x","view":"disabled","url":"/site/contact"},{"linkOptions":{"class":"contactTab"},"icon":"glyphicon glyphicon-book glyphicon-2x","view":"admin","url":"/gong/site/page/list"},{"linkOptions":{"class":"contactTab"},"icon":"glyphicon glyphicon-th-large glyphicon-2x","view":"admin","url":"/gong/site/view/list"},{"icon":"glyphicon glyphicon-th glyphicon-2x","view":"admin","url":"/gong/site/template/list"},{"icon":"glyphicon glyphicon-th-list glyphicon-2x","view":"admin","url":"/gong/form/admin/list"},{"linkOptions":{"class":"loginTab"},"type":"login","icon":"glyphicon glyphicon-off glyphicon-2x"}],"tabsOptions":{"nplacement":"left"}}', NULL, NULL, '@', 'SUPER', '', '2013-02-17 00:00:00', '2014-10-20 16:41:24', 10, 2, 1),
(44, 1, 'GTag', 'footer', '', '', '{"htmlOptions":{"class":"Footer"}}', NULL, NULL, '*', 'SUPER', 'null', '2013-08-27 17:15:11', '2014-10-20 14:40:27', 13, 2, 1),
(91, 1, 'GPlayer', 'player', '', '', '[]', NULL, NULL, 'disabled', 'disabled', 'null', '2014-02-18 01:52:04', '2014-10-20 14:40:27', 7, 2, 1),
(145, NULL, 'GTag', 'test', '', '', NULL, NULL, NULL, '*', 'SUPER', '', '2014-04-28 22:04:18', NULL, NULL, 0, 1),
(146, NULL, 'GTag', 'test', '', '', NULL, NULL, NULL, '*', 'SUPER', '', '2014-04-28 22:06:29', NULL, NULL, 0, 1),
(147, NULL, 'GTag', 'test', '', '', NULL, NULL, NULL, '*', 'SUPER', '', '2014-04-28 22:08:20', NULL, NULL, 0, 1),
(148, NULL, 'GTag', 'test', '', '', NULL, NULL, NULL, '*', 'SUPER', '', '2014-04-28 22:10:00', NULL, NULL, 0, 1),
(149, NULL, 'GTag', 'test', '', '', NULL, NULL, NULL, '*', 'SUPER', '', '2014-04-28 22:14:51', NULL, NULL, 0, 1),
(152, 1, 'GArticle', 'content', '', '', '{"htmlOptions":{"class":"tab-content"}}', NULL, NULL, '*', 'SUPER', '', '2014-04-28 22:55:30', '2014-10-20 14:40:27', 11, 2, 1),
(153, 1, 'GFileUploader', 'uploader', '', '', '[]', NULL, NULL, 'disabled', 'SUPER', NULL, '2014-06-29 15:49:20', '2014-10-20 14:40:27', 17, 2, 1),
(154, 2, 'GTag', 'adminBackground', '', '', '[]', NULL, NULL, '@', 'SUPER', NULL, '2014-10-17 07:29:17', '2014-10-20 14:40:27', 9, 2, 1),
(155, 3, 'GTag', 'adminBackground', '', '', '[]', NULL, NULL, '@', 'SUPER', NULL, '2014-10-17 07:29:58', '2014-10-20 14:40:27', 12, 2, 1),
(156, 1, 'GImage', 'headerFlags', '', '', '{"htmlOptions":{"class":"logo"},"src":"\\/themes\\/livescores\\/images\\/headerFlags.png"}', NULL, NULL, '*', 'SUPER', NULL, '2014-10-17 07:52:27', '2014-10-20 14:40:26', 4, 2, 1),
(157, 1, 'GLink', 'loginBlindLink', '', '', '{"htmlOptions":{"class":"InspectorLink"},"url":"\\/gong\\/user\\/auth\\/login"}', NULL, NULL, '*', 'SUPER', NULL, '2014-10-20 11:08:03', '2014-10-20 14:40:26', 2, 2, 1),
(158, 1, 'GLink', 'flighting', '', '', '{"htmlOptions":{"class":"FlightingLink"},"url":"\\/page\\/flightings"}', NULL, NULL, '*', 'SUPER', NULL, '2014-10-20 11:16:49', '2014-10-20 14:40:26', 0, 2, 1),
(159, 1, 'GLink', 'teamLink', '', '', '{"url":"\\/page\\/team"}', NULL, NULL, '*', 'SUPER', NULL, '2014-10-20 11:17:24', '2014-10-20 14:40:26', 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_site_view`
--

CREATE TABLE IF NOT EXISTS `livescores_site_view` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=256 ;

--
-- Dumping data for table `livescores_site_view`
--

INSERT INTO `livescores_site_view` (`id`, `module`, `controller`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`, `parentId`) VALUES
(47, 'site', 'element', 'create', '*', 'admin', 'admin', '2014-05-07 20:33:28', '2014-09-08 15:37:53', NULL, 1, 16),
(58, 'site', 'model', 'update', '*', 'admin', 'admin', '2014-05-07 22:46:59', '2014-09-08 15:37:55', NULL, 1, 16),
(59, 'site', 'model', 'updateDone', '*', 'admin', 'admin', '2014-05-07 23:08:18', '2014-09-08 15:37:58', NULL, 1, 16),
(210, 'site', 'view', 'create', '*', 'admin', 'admin', '2014-05-10 05:11:08', '2014-09-08 15:38:00', NULL, 1, 1),
(211, 'site', 'model', 'view', '*', 'admin', 'admin', '2014-05-10 05:11:08', '2014-09-08 15:38:03', NULL, 1, 1),
(212, 'site', 'model', 'delete', '*', 'admin', 'admin', '2014-05-10 05:11:08', '2014-09-08 15:38:05', NULL, 1, 1),
(213, 'site', 'model', 'createDone', '*', 'admin', 'admin', '2014-05-10 05:11:08', '2014-09-08 15:38:07', NULL, 1, 1),
(214, 'site', 'model', 'list', '*', 'admin', 'admin', '2014-05-10 05:11:08', '2014-09-08 15:38:09', NULL, 1, 1),
(228, 'user', 'auth', 'login', '*', 'admin', 'admin', '2014-05-13 03:10:06', '2014-09-08 15:38:11', NULL, 1, NULL),
(229, 'site', 'model', 'reorderDone', '*', 'admin', 'admin', '2014-05-16 02:16:19', '2014-09-08 15:38:13', NULL, 1, NULL),
(230, 'site', 'view', 'view', '*', 'admin', 'admin', '2014-05-19 00:33:18', '2014-09-08 15:38:16', NULL, 1, NULL),
(231, 'user', 'registration', 'registration', '*', 'admin', 'admin', '2014-05-19 01:31:46', '2014-09-08 15:38:18', NULL, 1, NULL),
(234, 'site', 'viewMap', 'create', '*', 'admin', 'admin', '2014-05-22 18:09:10', '2014-09-08 15:38:23', NULL, 1, NULL),
(235, 'user', 'profile', 'update', '*', 'admin', 'admin', '2014-05-22 22:46:52', '2014-09-08 15:38:24', NULL, 1, NULL),
(236, 'post', 'post', 'createDone', '*', 'admin', 'admin', '2014-06-02 20:22:18', '2014-09-08 15:38:26', NULL, 1, NULL),
(237, 'site', 'page', 'create', '*', 'admin', 'admin', '2014-06-02 20:31:22', '2014-09-08 15:38:28', NULL, 1, NULL),
(238, 'site', 'pageElement', 'create', '*', 'admin', 'admin', '2014-06-05 16:49:50', '2014-09-08 15:38:30', NULL, 1, NULL),
(239, 'user', 'invoice', 'view', '*', 'admin', 'admin', '2014-06-09 11:46:34', '2014-09-08 15:38:32', NULL, 1, NULL),
(240, 'site', 'template', 'create', '*', 'admin', 'admin', '2014-06-29 15:23:41', '2014-09-08 15:38:34', NULL, 1, NULL),
(241, 'site', 'templateElement', 'create', '*', 'admin', 'admin', '2014-06-29 15:36:12', '2014-09-08 15:38:36', NULL, 1, NULL),
(242, 'user', 'registration', 'recoveryMail', '*', 'admin', 'admin', '2014-06-30 13:34:21', '2014-09-22 11:25:31', 0, 1, NULL),
(243, 'form', 'admin', 'list', 'admin', 'admin', 'admin', '2014-09-15 11:48:53', '2014-09-15 11:49:51', NULL, 1, NULL),
(244, 'form', 'admin', 'view', '*', 'admin', 'admin', '2014-09-15 11:59:50', '2014-09-15 12:00:40', NULL, 1, NULL),
(245, 'form', 'element', 'create', '*', 'admin', 'admin', '2014-09-15 21:19:41', '2014-09-15 21:19:54', NULL, 1, NULL),
(246, 'form', 'element', 'createDone', '*', 'admin', 'admin', '2014-09-15 22:08:28', '2014-09-15 22:08:42', NULL, 1, NULL),
(247, 'form', 'element', 'update', '*', 'admin', 'admin', '2014-09-15 22:38:49', '2014-09-17 15:24:20', NULL, 1, NULL),
(248, 'form', 'element', 'delete', '*', 'admin', 'admin', '2014-09-15 22:43:12', '2014-09-17 12:57:20', NULL, 1, NULL),
(249, 'form', 'admin', 'create', '*', 'admin', 'admin', '2014-09-17 12:02:48', '2014-09-17 12:03:41', NULL, 1, NULL),
(250, 'form', 'admin', 'createDone', '*', 'admin', 'admin', '2014-09-17 12:42:34', '2014-09-17 12:42:44', NULL, 1, NULL),
(251, 'form', 'admin', 'delete', '*', 'admin', 'admin', '2014-09-17 12:57:39', '2014-09-17 12:57:50', NULL, 1, NULL),
(252, 'form', 'element', 'updateDone', '*', 'admin', 'admin', '2014-09-17 15:43:51', '2014-09-17 15:44:22', NULL, 1, NULL),
(253, 'form', 'submission', 'form', '*', 'admin', 'admin', '2014-09-22 11:26:54', '2014-09-22 11:40:46', NULL, 1, NULL),
(254, 'form', 'submission', 'index', '*', 'admin', 'admin', '2014-09-22 23:23:54', '2014-09-22 23:25:01', NULL, 1, NULL),
(255, 'form', 'submission', 'updateDone', '*', 'admin', 'admin', '2014-10-16 11:44:37', '2014-10-16 11:44:52', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_site_view_element`
--

CREATE TABLE IF NOT EXISTS `livescores_site_view_element` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=838 ;

--
-- Dumping data for table `livescores_site_view_element`
--

INSERT INTO `livescores_site_view_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
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
(618, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-10-16 11:39:11', 0, 210, 1),
(619, 1, 'GTextField', 'name', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-10-16 11:39:11', 3, 210, 1),
(621, 1, 'GSubmitButton', 'submit', '', '', '{"submission":"var:model"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-10-16 11:39:11', 4, 210, 1),
(622, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-10-16 11:39:11', 5, 210, 1),
(623, 1, 'GTag', 'name', '', '', '{"text":"Model:<h1>{var:model.modelLabel}</h1><h2>Name: {var:model.name}</h2>","tag":"span"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-05-22 17:55:59', 0, 211, 1),
(624, 1, 'GMenu', 'menu', '', '', '{"items":[{"label":"List {var:model.controllerId}s","url":["list"]},{"label":"Create {var:model.childModel.controllerId}","url":{"0":"{var:model.childModel.controllerId}\\/create","parentId":"var:model.hash"}}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-05-16 02:39:29', 1, 211, 1),
(625, 1, 'GViewDom', 'children', '', '', '{"importUrl":"dom/batchImport/type/page/id/{var:model.hash}","exportUrl":"dom/batchExport/type/page/id/{var:model.hash}"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 05:11:08', '2014-05-19 01:27:53', 2, 211, 1),
(627, 1, 'GRedirect', 'redirect', '', '', '{"url":"var:model.deleteRedirect"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 05:11:08', '2014-05-12 21:52:21', NULL, 212, 1),
(628, 1, 'GRedirect', 'redirect', '', '', '{"url":"var:model.createRedirect"}', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 05:11:08', '2014-05-12 23:39:07', NULL, 213, 1),
(629, 1, 'GTag', 'name', '', '', '{"tag":"h1","text":"{var:model.modelLabel}s:"}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-05-22 17:53:50', 1, 214, 1),
(630, 1, 'GMenu', 'menu', '', '', '{"items":[{"url":["create"],"label":"Create {var:model.modelLabel}"}]}', NULL, NULL, '*', 'SUPER', '', '2014-05-10 05:11:08', '2014-05-22 17:57:48', 2, 214, 1),
(632, 1, 'GTextField', 'controller', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 06:17:55', '2014-10-16 11:39:11', 2, 210, 1),
(633, 1, 'GTextField', 'module', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-05-10 06:18:20', '2014-10-16 11:39:11', 1, 210, 1),
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
(745, 1, 'GImage', 'Producer Image', '', '', '{"src":"/themes/video/images/profile_producer.png","htmlOptions":{"class":"pull-left"}}', NULL, NULL, 'producer', 'SUPER', NULL, '2014-06-20 16:58:35', '2014-06-20 17:02:50', NULL, 235, 1),
(746, 1, 'GImage', 'Reporter Image', '', '', '{"htmlOptions":{"class":"pull-left"},"src":"/themes/video/images/profile_reporter.png"}', NULL, NULL, 'reporter', 'SUPER', NULL, '2014-06-20 17:00:55', '2014-06-20 17:02:14', NULL, 235, 1),
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
(786, 1, 'GTag', '', '', '', '{"text":"Hello {var:username}<br>Please click on the following link: <a href=''{var:recovery_url}''></a> to change your password."}', NULL, NULL, '*', 'SUPER', NULL, '2014-06-30 13:36:21', '2014-06-30 13:47:56', NULL, 242, 1),
(787, 1, 'GTag', 'name', '', '', '{"tag":"h1","text":"{var:model.modelLabel}s:"}', NULL, NULL, '*', 'SUPER', '', '2014-09-15 11:49:34', NULL, 1, 243, 1),
(788, 1, 'GMenu', 'menu', '', '', '{"items":[{"url":["create"],"label":"Create {var:model.modelLabel}"}]}', NULL, NULL, '*', 'SUPER', '', '2014-09-15 11:49:34', NULL, 2, 243, 1),
(789, 1, 'GGridView', 'grid', '', '', '{"columns":"var:model.gridColumns","itemsCssClass":"table table-striped table-hover","ajaxUpdate":false,"dataProvider":"var:dataProvider"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-15 11:49:34', NULL, 4, 243, 1),
(790, 1, 'GTag', 'name', '', '', '{"text":"Model:<h1>{var:model.modelLabel}<\\/h1><h2>Name: {var:model.name}<\\/h2>","tag":"span"}', NULL, NULL, '*', 'SUPER', '', '2014-09-15 12:00:40', NULL, 0, 244, 1),
(791, 1, 'GMenu', 'menu', '', '', '{"items":[{"label":"List forms","url":["list"]},{"label":"Create {var:model.childModel.controllerId}","url":{"0":"{var:model.childModel.controllerId}/create","parentId":"var:model.hash"}}]}', NULL, NULL, '*', 'SUPER', '', '2014-09-15 12:00:40', '2014-09-15 21:03:37', 1, 244, 1),
(792, 1, 'GViewDom', 'children', '', '', '{"importUrl":"dom\\/batchImport\\/type\\/page\\/id\\/{var:model.hash}","exportUrl":"dom\\/batchExport\\/type\\/page\\/id\\/{var:model.hash}"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-15 12:00:40', NULL, 2, 244, 1),
(793, 1, 'GGridView', 'grid', '', '', '{"columns":"var:model.childModel.gridColumns","itemsCssClass":"table table-striped","sortUrl":"{var:model.childModel.controllerId}\\/reorder","sort":true,"dataProvider":"var:dataProvider"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-15 12:00:40', NULL, 3, 244, 1),
(794, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-15 21:19:54', NULL, 1, 245, 1),
(795, 1, 'GTextField', 'mode', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-15 21:19:54', NULL, 2, 245, 1),
(796, 1, 'GTextField', 'name', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-15 21:19:54', NULL, 3, 245, 1),
(797, 1, 'GTextField', 'className', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-15 21:19:54', NULL, 4, 245, 1),
(798, 1, 'GTextField', 'weight', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-15 21:19:54', NULL, 5, 245, 1),
(799, 1, 'GHiddenField', 'parentId', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-15 21:19:54', NULL, 18, 245, 1),
(800, 1, 'GSubmitButton', 'submit', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-15 21:19:54', NULL, 19, 245, 1),
(801, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-15 21:19:54', NULL, 20, 245, 1),
(802, 1, 'GRedirect', 'redirect', '', '', '{"url":"var:model.createRedirect"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-15 22:08:42', NULL, NULL, 246, 1),
(803, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-15 22:39:11', '2014-09-17 15:25:33', 1, 247, 1),
(804, 1, 'GTextField', 'mode', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-15 22:39:11', '2014-09-17 15:25:33', 3, 247, 1),
(805, 1, 'GTextField', 'name', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-15 22:39:11', '2014-09-17 15:25:33', 4, 247, 1),
(806, 1, 'GTextField', 'className', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-15 22:39:11', '2014-09-17 15:25:33', 5, 247, 1),
(807, 1, 'GTextField', 'weight', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-15 22:39:11', '2014-09-17 15:25:33', 6, 247, 1),
(808, 1, 'GHiddenField', 'parentId', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-15 22:39:11', '2014-09-17 15:25:33', 7, 247, 1),
(809, 1, 'GSubmitButton', 'submit', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-15 22:39:11', '2014-09-17 15:25:33', 8, 247, 1),
(810, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-15 22:39:11', '2014-09-17 15:25:33', 9, 247, 1),
(811, 1, 'GRedirect', 'redirect', '', '', '{"url":"var:model.deleteRedirect"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-15 22:43:52', '2014-09-17 12:57:20', NULL, 248, 1),
(812, 2, 'GFormWidget', 'form', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-17 12:03:42', NULL, 1, 249, 1),
(813, 1, 'GTextField', 'table', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-17 12:03:42', '2014-09-17 12:05:33', 2, 249, 1),
(814, 1, 'GTextField', 'name', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-17 12:03:42', NULL, 3, 249, 1),
(818, 1, 'GSubmitButton', 'submit', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-17 12:03:42', NULL, 19, 249, 1),
(819, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-17 12:03:42', NULL, 20, 249, 1),
(820, 1, 'GRedirect', 'redirect', '', '', '{"url":"var:model.createRedirect"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-17 12:42:44', NULL, NULL, 250, 1),
(821, 1, 'GRedirect', 'redirect', '', '', '{"url":"var:model.deleteRedirect"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-17 12:57:51', NULL, NULL, 251, 1),
(822, 1, 'GMenu', 'menu', '', '', '{"items":[{"label":"View parent","url":{"0":"{var:model.parent.controllerId}\\/view","id":"var:model.parent.hash"}}]}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-17 15:24:20', '2014-09-17 15:25:33', 0, 247, 1),
(823, 1, 'GJsonEditor', 'fields', '', '', '[]', NULL, NULL, '*', 'SUPER', NULL, '2014-09-17 15:24:20', '2014-09-17 15:25:33', 2, 247, 1),
(825, 1, 'GRedirect', 'redirect', '', '', '{"url":"var:model.createRedirect"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-17 15:44:22', NULL, NULL, 252, 1),
(826, 2, 'GFormWidget', 'form', '', '', '{"htmlOptions":{"enctype":"multipart/form-data"}}', NULL, NULL, '*', 'SUPER', '', '2014-09-22 11:40:46', '2014-09-22 12:22:32', 1, 253, 1),
(832, 1, 'GSubmitButton', 'submit', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-22 11:40:46', NULL, 19, 253, 1),
(833, 3, 'GFormWidget', 'formClose', '', '', '[]', NULL, NULL, '*', 'SUPER', '', '2014-09-22 11:40:46', NULL, 20, 253, 1),
(834, 1, 'GTag', 'name', '', '', '{"tag":"h1","text":"{var:form.name}s:"}', NULL, NULL, '*', 'SUPER', '', '2014-09-22 23:25:02', '2014-09-23 00:08:49', 1, 254, 1),
(835, 1, 'GMenu', 'menu', '', '', '{"items":[{"url":{"0":"create","id":"{var:form.hash}"},"label":"Create {var:form.name}"}]}', NULL, NULL, '*', 'SUPER', '', '2014-09-22 23:25:02', '2014-10-15 17:38:30', 2, 254, 1),
(836, 1, 'GGridView', 'grid', '', '', '{"columns":"var:model.gridColumns","itemsCssClass":"table table-striped table-hover","ajaxUpdate":false,"dataProvider":"var:dataProvider"}', NULL, NULL, '*', 'SUPER', NULL, '2014-09-22 23:25:02', NULL, 4, 254, 1),
(837, 1, 'GRedirect', 'redirect', '', '', '{"url":"/gong/form/submission/index/id/{var:form.hash}"}', NULL, NULL, '*', 'SUPER', NULL, '2014-10-16 11:44:52', '2014-10-16 11:46:08', NULL, 255, 1);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_site_view_map`
--

CREATE TABLE IF NOT EXISTS `livescores_site_view_map` (
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
-- Dumping data for table `livescores_site_view_map`
--

INSERT INTO `livescores_site_view_map` (`id`, `module`, `controller`, `name`, `parentModule`, `parentController`, `parentName`, `priority`) VALUES
(97, 'site', '*', '*', 'site', 'model', '*', 999),
(121, '*', 'view', 'create', '*', 'elementCollection', '*', 1),
(122, '*', 'viewElement', 'create', '*', 'element', '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_textsettings`
--

CREATE TABLE IF NOT EXISTS `livescores_textsettings` (
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
-- Dumping data for table `livescores_textsettings`
--

INSERT INTO `livescores_textsettings` (`id`, `language`, `text_email_registration`, `subject_email_registration`, `text_email_recovery`, `text_email_activation`, `text_friendship_new`, `text_friendship_confirmed`, `text_profilecomment_new`, `text_message_new`, `text_membership_ordered`, `text_payment_arrived`) VALUES
(1, 'en_us', 'Thank you for registering with IPP-Renewables the Bid Windows 3, 4 and 5 is open. After validating your details please kindly sign in and provide your project information. You can do this by clicking the following link:\n{activation_url}', 'IPP-Renewables User Registration', 'You have requested a new Password. To set your new Password,\n										please go to {recovery_url}', 'Your account has been activated. Thank you for registering. Please sign in to fill in Bid Window 3, 4 and 5.', 'New friendship Request from {username}: {message}. To accept or ignore this request, go to your friendship page: {link_friends} or go to your profile: {link_profile}', 'The User {username} has accepted your friendship request', 'You have a new profile comment from {username}: {message} visit your profile: {link_profile}', 'You have received a new message from {username}: {message}', 'Your order of membership {membership} on {order_date} has been taken. Your order \r\nNumber is {id}. You have choosen the payment \nr\nnr\nnr\nstyle {payment}.', 'Your payment has been received on {payment_date} and your Membership {id} is now active'),
(2, 'de', 'Sie haben sich fÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃ\nÂÃÂÃÂÃÂÃÂÃÂÃÂ¼r unsere Applikation registriert. Bitte bestÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃ\r\nnÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤tigen Sie ihre E-Mail adresse mit diesem Link: {activation_url}', 'Sie haben sich fÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃ\nÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¼r eine Applikation registriert.', 'Sie haben ein neues Passwort angefordert. Bitte klicken Sie diesen \nlink: {activation_url}', 'Ihr Konto wurde freigeschaltet.', 'Der Benutzer {username} hat Ihnen eine Freundschaftsanfrage gesendet. \n\n							 Nachricht: {message}\n\n							 Klicken sie <a href="{link_friends}">hier</a>, um diese Anfrage zu \r\nbestÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤tigen \r\noder zu ignorieren. Alternativ kÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃ\nÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\r\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¶nnen sie <a href="{link_profile}">hier</a> auf ihre Profilseite zugreifen.', 'Der Benutzer {username} hat ihre Freundschaftsanfrage \nnbestÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤tigt.', '\n							 Benutzer {username} hat Ihnen eine Nachricht auf Ihrer Pinnwand hinterlassen: \n\n							 {message}\n\n							 <a href="{link}">hier</a> \r\ngeht es direkt zu Ihrer Pinnwand!', 'Sie haben eine neue Nachricht von {username} bekommen: {\r\nnmessage}', 'Ihre Bestellung der Mitgliedschaft {membership} wurde am {\r\norder_date} entgegen genommen. Die gewÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¤hlte Zahlungsart ist {payment}. Die Auftragsnummer lautet {id}.', 'Ihre Zahlung wurde am {payment_date} \r\nentgegen genommen. Ihre \nMitgliedschaft mit der Nummer {id} ist nun Aktiv.'),
(3, 'es', 'Te has registrado en esta aplicaciÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ³n. Para confirmar tu direcciÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃ\r\nnÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ³n de correo electrÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ³nico, por favor, visita {activation_url}.', 'Te has registrado en esta \naplicaciÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\r\nnÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ³n.', 'Has solicitado una nueva contraseÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ±a. Para establecer una nueva contraseÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\r\nnÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ±a, por \r\nfavor ve a {activation_url}', 'Tu cuenta ha sido activada. Gracias por registrarte.', 'Has recibido una nueva solicitud de amistad de {user_from}: {message} Ve \na tus contactos: {link}', 'Tienes un nuevo comentario en tu perfil de {username}: {message} visita tu perfil: {link}', 'Please translatore thisse hiere toh tha espagnola langsch {username}', 'Has recibido un mensaje de {\nusername}: {message}', 'Tu orden de \nmembresÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\r\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃ\nÂÃÂÃÂ­a {membership} de fecha {order_date} fuÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃ\nÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ© tomada. Tu nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\r\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂºmero de \r\norden es {id}. Escogiste como modo de pago {payment}.', 'Tu pago \r\nfuÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ© recibido en fecha {payment_date}. Ahora tu MembresÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\r\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃ\nÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ­a {id} ya estÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¡ activa'),
(4, 'fr', '', '', '', '', '', '', '', '', '', ''),
(5, 'ro', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `livescores_translation`
--

CREATE TABLE IF NOT EXISTS `livescores_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'gong',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `translation` text CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `language` varchar(5) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `livescores_translation`
--

INSERT INTO `livescores_translation` (`id`, `category`, `message`, `translation`, `language`) VALUES
(6, 'gong', 'Terms And Conditions', 'Website Terms and Conditions of Use:       These Terms and Conditions (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂthe Terms and ConditionsÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ) govern your  (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂthe UserÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ) use of the Coastal Accounting video exchange (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂProviderÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ) website located at the domain  name <a target="_blank" rel="nofollow" href="http://www.Coastal Accounting video exchange.net">www.Coastal Accounting video exchange.net</a> (\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂthe WebsiteÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ).      By accessing and using the Website, the User agrees to be bound by  the Terms and Conditions set out in this legal notice. If the User does not  wish to be bound by these Terms and Conditions, the User may not access,  display, use, \r\ndownload, and/or otherwise copy or distribute Content obtained at  the Website.     Updating of these Terms  and Conditions:       Provider reserves the rights to change, modify, add to or \nremove  from portions or the whole of these Terms and Conditions from time to time.  Changes to \r\nthese Terms and Conditions will become effective \nupon such changes  being \r\nposted to this Website. It is the UserÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂs obligation to periodically check  these Terms and Conditions at the \nWebsite for changes or updates. The UserÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂs  continued use of this Website following the posting of changes or updates will  be considered notice of the UserÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂs acceptance to abide by and be bound by these  Terms and Conditions, including such changes or updates.     <span>Supplier of services  details:  <br><br>In accordance with the disclosure requirements of  the Electronic Communications and \r\nTransactions Act (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂECTAÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ), Act No 25 of 2005,  the supplier of goods and/or services offered for sale, hire or exchange by way  of an electronic transaction, makes the following information available to  consumers:</span>  \n   \n<ul><li>Supplier is Coastal Accounting video exchange CC (hereinafter referred to as ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂSupplierÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ),  a close corporation duly registered \r\nand existing under the laws of South Africa  with registration number: 2010/088984/23, with \nits physical address at No. 43  Pebble Lake, \r\nFlorin Road, Wilgeheuwel. SupplierÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂs place of registration is No.  43 Pebble Lake, Florin Road, Wilgeheuwel and Supplier will accept legal service  at this given address. SupplierÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂs main member is: Mr. P Piegl. The main  business \r\nof Supplier is to facilitate the sharing of music-related content for  a closed group of subscribers and falls within the \ncompanies group of  Recreational, Cultural and Sporting Activities;</li>     </ul><ul><li>SupplierÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂs website is <a target="_blank" rel="nofollow" href="http://www.music2.media.net">www.music2.media.net</a> and its contact details  are located on the above mentioned \nwebsite.</li>     </ul><ul><li>Goods and/or Services: The main business of Supplier is to  facilitate the sharing of music-related content for a closed group of  subscribers.</li>     </ul><ul><li>Terms and conditions of download:\r\n The Consumer or User will be  liable for the full price or fees where applicable including transport costs,  \ntaxes and any other fees or costs, guarantees, and where \r\nguarantees can be  accessed and downloaded by consumers where such tariffs, fees and or prices  will be specified on the website in relation to the goods and services  provided. \r\nGoods and services offered through this website by Supplier are  \nstrictly on an ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂas isÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ basis for a price, fee and or tariff as shall be  indicated. Warranties and representations are hereby expressly excluded.  Downloaded files cannot be returned. In case of defect, User may notify  Supplier within 24 hours of becoming aware of defect by email to the following  address: peterpiegl@me.com. \nUserÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂs cooling-off rights under s 44 of ECTA  do not apply in terms of s 42 of ECTA, due to downloads being audio, or video  recordings, or software or newspapers, periodicals, magazines or books. </li>     </ul><ul><li>Payment:  Payment may be \r\nmade  online by credit card through a sufficiently secure payment system, or in the  case of Registered Users (corporate users only)\n, by virtue of a monthly \ndebit  order that can be arranged by calling \r\nthe following number +2782 411 \r\n7430. The  payment system allows for review, corrections and withdrawal by User prior to  placing a final order.</li>     </ul><ul><li>Complaints and disputes:  Supplier offers Users to file complaints via the contacting the supplier on the  following email address peterpiegl@me.com. Currently, Supplier does not  subscribe to any alternative dispute resolution code or mechanism. </li>     </ul>Copyright and Intellectual  Property Rights:       Provider provides certain information at the Website. Content  \ncurrently or anticipated to be displayed at this Website is provided by  Provider, its affiliates and/or subsidiary, or any other third party owners of  such content, and includes but is not limited to Literary Works, Musical Works,  Artistic Works, Sound Recordings, \r\nCinematograph Films, Sound and Television  Broadcasts, Program-Carrying Signals, Published Editions and Computer Programs  (\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂthe \nContentÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ). \r\nAll such proprietary works, and the compilation of the proprietary  \r\nworks, belong to the Provider, its affiliates or subsidiary, or any third party  owners of such rights (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂthe OwnersÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ), and the Content protected by South  African and International copyright laws. The Providers reserve the right to  make any changes to the Website, the Content, or to products and/or services  offered through the Website at any times and without notice. All rights in and  to the Content is reserved and retained by the Owners. \nExcept as specified in  these Terms and Conditions, the User is not granted a license or any other  \nright including without limitation under Copyright, Trademark, Patent or other  Intellectual Property Rights in or to the Content.     Limited License to General  Users:     <ul><li>Provider grants to the User,  subject \r\nto the further terms of these Terms and Conditions, a non-exclusive,  non-\r\ntransferable, limited and revocable right to access, display, use, download  and \notherwise copy the current and future Content for personal, non-commercial  and information \r\npurposes only. </li>     </ul><ul><li>This Website and the Content  may not be reproduced, duplicated, copied, resold, visited or otherwise  exploited for any commercial purpose without the express prior written consent  of Provider/Supplier.</li>     </ul><ul><li>The license does not allow the  User to collect product or service listings, descriptions or other information  displayed here, and does not allow any derivative use of this Website \nor the  Content for the benefit of another merchant.</li>     </ul><ul><li>The User may not \nframe nor use  framing technologies to enclose the Provider Website or the Content nor any  part thereof without the express written consent of Provider.</li>     </ul><ul><li>Provider and the Owners do not  offer products or \r\nservices to minors. If you are under the age of 18, you may  not respond \r\nto or otherwise accept or act upon any offers in the Website. </li>     </\nul><ul><li>Provider and the Owners, their  affiliates or subsidiary reserve the right to refuse service, \r\nterminate  accounts, remove or edit content, or cancel orders in their sole discretion.</li>     </ul><ul><li>Any unauthorised use terminates  this license.</li>     </ul>Limited License to  Registered Users:     Provider allows and processes the  registration of certain corporate users (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂthe Registered UserÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ) at the Website.  If you \nbelieve that you are entitled to registration, please contact \n info@l-inc.co.za     <ul><li>Subject to the further terms of  these Terms and Conditions, a non-exclusive, non-transferable, limited and  revocable right is granted to Registered Users to access, display, use,  download and otherwise copy the current and future Content for the purposes  agreed to by the Registered User and Provider in their \r\nr\nrespective agreements.</li>     </ul><ul><li>This Website and the Content  may only be reproduced, duplicated, copied, resold, visited or otherwise  exploited for \nthe specific purposes set out in that agreement.</li>     </ul><ul><li>The license does not allow the Registered  \r\nUser to collect product or service listings, descriptions or other information  displayed here, and does not allow any derivative use of this Website or the  Content for the benefit of another merchant.</li>     </ul><ul><li>The Registered User may not  frame nor use framing technologies to enclose the Provider Website or \nthe  Content nor any part thereof without the express written \nconsent of Provider.</li>     </ul><ul><li>Provider and the Owners, their  affiliates or subsidiary reserve the right in their sole discretion to refuse  service, terminate accounts, remove or edit content, or cancel orders in their  sole discretion.</li>     </ul><ul><li>Any unauthorised use terminates  this license.</li>     </ul>Limitation of \r\nr\nliability:       Subject to sub-sections 43(5) and 43 (6) of ECTA, if applicable, and  to the extent permitted by law, the Website and all Content on the Website,  \nincluding any current or future offer of products or services, are provided on  an ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂas isÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ basis, and may include \r\ninaccuracies or typographical errors and  Provider, Owners, suppliers, employees, directors partners, affiliates and  agents shall \nnot be liable for any damage, or loss or liability of any nature  incurred by whoever as a result of any action or omission.<br>The Owners make no  warranty or representation as to the availability, accuracy or \ncompleteness of  the Content, or any third-party content accessible via an Internet link.  Neither Provider nor any holding company, affiliate or subsidiary of Provider  or Owners, shall be held responsible for any direct or indirect special,  consequential or other damage of any kind whatsoever \r\nsuffered or incurred,  related to the use of, or the inability to access or \r\nuse the Content or the  Website or any functionality thereof, or of any linked website, even if  Provider is expressly advised thereof.<br>Privacy, access to and use  of \ninformation:       <span>Provider allows you  to visit this website without telling the Provider who you are or revealing any  personal \r\ninformation about yourself, the User. However, you, the User, should  be aware that anonymous visitor information \nsuch as your IP address, browser  type, referring pages and pages visited on the website may be automatically  collected for statistical analysis of web traffic patterns.<br></span>     Provider receives various types of \ninformation (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂthe InformationÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ)  from Users who access the Website, including personal information as detailed  in the Promotion of Access to Information Act (\r\nÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂPAIAÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ), Act 2 of 2000, and as  detailed in s 1 of ECTA (hereinafter referred to ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂPersonal \nInformationÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ).<br>Provider may electronically collect, store \r\nand use Personal Information,  including such information as your IP address, browser type, referring pages and  pages visited on the website for statistical analysis of web traffic patterns.      Provider \nvoluntarily subscribes to s 51 of ECTA and endeavours to  treat Personal Information received by Provider accordingly. Whenever User is  of the opinion that \r\nProvider fails to comply with s 51 of ECTA, User shall  contact Provider by sending an email to peter@music2mendia.net.<br>Provider will  review UserÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂs representations made by \nemail and, if within ProviderÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂs sole \r\nand  absolute discretion advisable, take corrective action and in any event within  \n30 days respond to User, informing User about corrective actions taken, if any.      Despite such undertaking, it is possible for Internet-based  communications to be intercepted. Without the use of encryption, the Internet  is not a secure medium and privacy cannot be ensured. Internet e-mail is  vulnerable to interception and \r\nforging.<br>The Owners will not be responsible for  any damages you or any third party may suffer as a result of the transmission  of confidential or disclosed information that you make to the Owners and/or  Provider through \nthe Internet, or that you expressly or implicitly authorise  the Owners to make, or for any errors or any changes made to any transmitted  information. To ensure \r\nacquaintance with and awareness of the privacy measures  and policies of Provider, the User is urged to take care to read and understand  the underlying \nprivacy clauses incorporated in these Terms and \r\nConditions:     Privacy:  casual  surfing     The User may visit the Website without \nproviding any personal  information. The User accordingly hereby grants express written permission for  the Website servers in such instances collecting the IP address of the User  computer, but not the email address or any other distinguishing information.<br>This information is aggregated to measure the number of visits, average time  spent \r\nat the Website, pages viewed, etc. Provider uses this information to  determine use of the Website, and to improve content thereon. Provider assumes  no obligation to protect this information, and may copy, distribute or \notherwise  use such information without limitation     Privacy:  unsolicited  information      If the User posts unsolicited content or other information (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂthe  \r\nInformationÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ) to the Website, and unless otherwise indicated, then the User  grants to the \nOwners a non-\r\nnexclusive, royalty-free, perpetual, irrevocable, and  fully sub-licensable right to use, reproduce, modify, adapt, publish, translate,  create derivative works from, distribute, and display such Information  throughout the world in any media.<br>The User grants to the Owners the right to  use the name that the User submits in connection with such Information, if they  choose. The User warrants that the User owns or otherwise controls all of the  rights to the Information that the User posts; that the \r\nInformation is  accurate; that by the supply of the Information to Provider, the User does not  violate this Policy and does not infringe the rights of any person or entity;  and that the User indemnifies the Owners for all claims \nresulting from the  receipt by Provider of the Information the User supplies to it. Provider  reserves the right but not the obligation to monitor and edit or remove any  \r\nInformation, where posted to public pages.<br>Provider takes no responsibility,  and \nassumes no \r\nliability \nfor any Information posted by the User or any third  party.     Privacy:  solicited  information the User gives to Provider     Provider requires certain Personal Information necessary to process  transactions if the User requires any of ProviderÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂs products or services.<br>Provider receives and stores all Information, including Personal Information  which the User enters on the Website or gives to Provider, in any other way. The  User may choose not to provide certain Personal Information, but \r\nthat may limit  the services or products that the User may wish to obtain from this Provider.<br>Provider provides its products and services in conjunction with its affiliates  and subsidiaries. In this regard and unless specifically \nrestricted by the User  from the license below, the User hereby and when entering into the specific  transactions in question expressly grants in writing to the \nOwners and the  \r\nProvider a non-exclusive, royalty-free, \r\nperpetual, irrevocable, and fully  sub-\nlicensable right to use, reproduce, modify, adapt, publish, translate,  create derivative works from, distribute, and display such Information  throughout the world in any media for any purpose whatsoever, including without  limitation for example transactions with user, registration of user, etc. The  UserÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂs Information that is required by affiliates and subsidiaries to give  effect to transactions that the User chooses to enter into is shared with those  entities.<br>Privacy:  promotional  information     \r\nProvider aspires to provide first-class  service to its customers, which necessitates Provider providing information to  the User regarding new services or special offers. In each instance, the User  is provided an opportunity to opt-out of such \ninformation circulars. For more  information send an email \nto   peter@music2mendia.net<br>Privacy:  business  transfers     Provider may enter into business arrangements \r\nwhereby its \r\ncustomer  base is one of the more valued assets. \nIn such an event, customer Information  will be one of the transferable assets.     Privacy:  lawful  purposes     When the Provider is served with due legal process requiring the  delivery of Personal Information, it has the legal duty to abide by that  demand, and will do so.<br>Provider may also impart Personal Information if  permitted or required to do so by law.     Privacy:  surveys  and statistical profiles     Provider understands that efficiency and customer care translates to  good service.<br>Provider may periodically \r\nconduct online customer care surveys to  facilitate the updating of service standards. When it conducts a survey,  Provider will inform the User how the information gathered will be used, and  will provide the User with the opportunity to opt-out from \nsuch surveys.<br>Notwithstanding the foregoing, \nProvider may chose to use Personal Information  to compile profiles for statistical purposes and may chose to \r\ntrade with such  profiles \r\nand statistical data, as long as the \nprofiles or statistical data  cannot be linked to any specific data subject, including the User, by a third  party.     Privacy:  storage     Personal Information will be stored for as long as it is used and  for a period of one year (twelve months) thereafter, together with a record of  the Personal Information and the specific purposes it was collected for.  Personal Information will be first be anonymized and then destroyed once it has  become obsolete.<br>Privacy:  interception     Subject to the Regulation of Interception of \r\nCommunications Act  (ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂRICAÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ), Act no 70 of 2002, User agrees that Provider may intercept, block,  read, delete,\n disclose and use all communications sent or otherwise  communicated to Provider, its employees, directors and agents. User agrees that  his \nor her consent satisfies the requirements of ECTA and RICA for \r\nconsent in  ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂwritingÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ¢ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ as defined.     Choice of Law:       This Website is \ncontrolled, operated and administered by Provider  \r\nfrom its offices as set out below within the Republic of South Africa. The  Providers make no representation that the Content is appropriate or available  for use in other locations or countries other than the Republic of South  Africa. Access to the Website from territories or countries where the Content  is illegal is prohibited. The User may not use this Website in violation of  South African export laws and regulations. If the User accesses this Website  from locations outside of \nSouth Africa, that User is responsible for \r\ncompliance  with all local laws. These Terms and Conditions shall be governed by the laws  of the Republic of South Africa, and the User consents to the jurisdiction of  the appropriate court within the Republic of South Africa in the event of any  dispute. If \r\nany of the provisions of \nthese Terms and Conditions are found by a  court of competent jurisdiction to be invalid or unenforceable, that provision  shall be enforced to \nthe maximum extent permissible so as to give effect to the  \r\nintent of these Terms and Conditions, and the remainder of these Terms and  Conditions shall continue in full force and effect.<br><br>These Terms and Conditions  constitute the entire agreement between the Provider and the User with regard  to the use of the Content and this Website.     Contact  Details:       In the event that you need to contact Provider/Supplier for purposes  related to these Terms and Conditions, please use the following:     <br><br>Email: \npeterpiegl@me.com     <span>Physical Address:<br>43 Pebble  \r\nLake, Florin Road, Wilgeheuwel,</span>     <span>Postal Address:<br>P O Box  1445, Wilgeheuwel, 1735</span>     ÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂÃÂ© MUSIC2MEDIA (2010)<br>', 'en'),
(7, 'gong', 'test', 'asdf123', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `livescores_user`
--

CREATE TABLE IF NOT EXISTS `livescores_user` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `livescores_user`
--

INSERT INTO `livescores_user` (`id`, `username`, `password`, `salt`, `activationKey`, `createtime`, `lastvisit`, `lastaction`, `lastpasswordchange`, `superuser`, `status`, `approved`, `published`, `avatar`, `notifyType`) VALUES
(1, 'admin', '0be4b859df6a8db6e76f59cd017bed843f51bfab2aa673ef478ca0592e6d55f7905598087068f97477674e4c5227b587668f2da03f0a089b0aecdb0d11ef45bf', '1cKpqyPTh3pnytonuQzaxIomnzuLwDVN/rhfCtF78pmyPlB7oSwV2SVvI0pjsuXdsIkrUM+4xcwi4oM8BZG+wg==', 'a20d352c475c4500d6a8cc58ef53fea497fc0c5edf52053182e19aaaad6e32c91e2ec5147763c9013b7ef5ed2f6a3b19fadf2218416f040902467d726668492e', 1335171345, 1413816050, 0, 0, 1, 1, 0, 1, '', 'Instant'),
(36, 'ScoreCreator', 'b357956890aab8fc6420bbe729d5a29fe786bd9bfb36de6d4620a5c46f34e2bf5bffa3ed67afd8eaa6d2f5c558539a8bbfc1ccd04cfcb5d937e4aa96d84027ce', '1cKpqyPTh3pnytonuQzaxIomnzuLwDVN/rhfCtF78pmyPlB7oSwV2SVvI0pjsuXdsIkrUM+4xcwi4oM8BZG+wg==', '1b8c6019d3e982599f1989cd4a9db573898adabcbb8e8f6b3d263b4b6c880207d972c6959dde3d5fedd6793a44ef16b8c94f7d0e267d29902b57924518365d54', 1392647405, 1413523667, 0, 1392647405, 0, 1, 1, 1, NULL, 'Instant');

-- --------------------------------------------------------

--
-- Table structure for table `livescores_userTest`
--

CREATE TABLE IF NOT EXISTS `livescores_userTest` (
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
-- Dumping data for table `livescores_userTest`
--

INSERT INTO `livescores_userTest` (`id`, `created`, `modified`, `userId`, `username`, `email`, `password`, `retypePassword`, `role`, `capatcha`, `termsAndConditions`) VALUES
(1, '2014-03-07', '0000-00-00', 0, 'peter', 'almagestfraternite@gmail.com', 'almagest', 'almagest', 'reporter', 'fiwiyu', '1'),
(2, '2014-03-07', '0000-00-00', 0, 'peter', 'almagestfraternite@gmail.com', 'almagest', 'almagest', 'reporter', 'fiwiyu', '1'),
(3, '2014-03-17', '0000-00-00', 0, 'DJ Allie', 'alistair@searchfusion.co.za', '123!Slam', '123!Slam', 'producer', 'fizexo', '1'),
(4, '2014-03-17', '0000-00-00', 0, 'DJ Allie', 'alistair@searchfusion.co.za', '123!slam', '123!slam', 'producer', 'fff', '0'),
(5, '2014-03-17', '0000-00-00', 0, 'DJ ALlie', 'alistair@searchfusion.co.za', '123!Slam', '123!slam', 'producer', 'asdasd', '0'),
(6, '2014-03-17', '0000-00-00', 0, 'djAllie', 'alistair@searchfusion.co.za', '123!Slam', '123!Slam', 'producer', 'fizexo', '1'),
(7, '2014-03-17', '0000-00-00', 0, 'djAllie', 'alistair@searchfusion.co.za', '123!Slam', '12312313', 'producer', 'fizexo', '1');

-- --------------------------------------------------------

--
-- Table structure for table `livescores_user_group`
--

CREATE TABLE IF NOT EXISTS `livescores_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `participants` text,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `livescores_user_group_message`
--

CREATE TABLE IF NOT EXISTS `livescores_user_group_message` (
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
-- Table structure for table `livescores_user_role`
--

CREATE TABLE IF NOT EXISTS `livescores_user_role` (
  `userId` int(10) unsigned NOT NULL,
  `roleId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `livescores_user_role`
--

INSERT INTO `livescores_user_role` (`userId`, `roleId`) VALUES
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17);

-- --------------------------------------------------------

--
-- Table structure for table `livescores_visit`
--

CREATE TABLE IF NOT EXISTS `livescores_visit` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (userId) REFERENCES livescores_user(id)',
  `postId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (postId) REFERENCES livescores_item(id)',
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
-- Table structure for table `livescores_vote`
--

CREATE TABLE IF NOT EXISTS `livescores_vote` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (postId) REFERENCES livescores_item(id)',
  `userId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (userId) REFERENCES livescores_user(id)',
  `approve` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `livescores_vote`
--

INSERT INTO `livescores_vote` (`id`, `fileId`, `userId`, `approve`) VALUES
(1, 53, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `scores_country`
--

CREATE TABLE IF NOT EXISTS `scores_country` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=338 ;

--
-- Dumping data for table `scores_country`
--

INSERT INTO `scores_country` (`id`, `name`, `flag`, `created`, `modified`) VALUES
(91, 'Afghanistan', '/country/91.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'African Union', '/country/92.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Albania', '/country/93.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Algeria', '/country/94.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'American Samoa', '/country/95.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Andorra', '/country/96.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 'Angola', '/country/97.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'Anguilla', '/country/98.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'Antarctica', '/country/99.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'Antigua & Barbuda', '/country/100.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'Arab League', '/country/101.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'Argentina', '/country/102.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'Armenia', '/country/103.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'Aruba', '/country/104.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'ASEAN', '/country/105.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'Australia', '/country/106.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'Austria', '/country/107.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'Azerbaijan', '/country/108.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'Bahamas', '/country/109.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'Bahrain', '/country/110.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'Bangladesh', '/country/111.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'Barbados', '/country/112.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'Belarus', '/country/113.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'Belgium', '/country/114.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'Belize', '/country/115.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'Benin', '/country/116.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'Bermuda', '/country/117.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'Bhutan', '/country/118.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'Bolivia', '/country/119.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'Bosnia & Herzegovina', '/country/120.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'Botswana', '/country/121.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'Brazil', '/country/122.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'Brunei', '/country/123.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'Bulgaria', '/country/124.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'Burkina Faso', '/country/125.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'Burundi', '/country/126.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'Cambodja', '/country/127.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'Cameroon', '/country/128.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'Canada', '/country/129.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'Cape Verde', '/country/130.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'CARICOM', '/country/131.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(132, 'Cayman Islands', '/country/132.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'Central African Republic', '/country/133.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'Chad', '/country/134.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'Chile', '/country/135.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'China', '/country/136.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'CIS', '/country/137.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'Colombia', '/country/138.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'Commonwealth', '/country/139.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'Comoros', '/country/140.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'Congo-Brazzaville', '/country/141.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'Congo-Kinshasa (Zaire)', '/country/142.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'Cook Islands', '/country/143.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'Costa Rica', '/country/144.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'Cote d''lvoire', '/country/145.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'Croatia', '/country/146.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'Cuba', '/country/147.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'Cyprus', '/country/148.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'Czech Republic', '/country/149.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'Denmark', '/country/150.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'Djibouti', '/country/151.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'Dominica', '/country/152.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'Dominican Republic', '/country/153.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'Ecuador', '/country/154.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'Egypt', '/country/155.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'El Salvador', '/country/156.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'England', '/country/157.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'Equatorial Guinea', '/country/158.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'Eritrea', '/country/159.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'Estonia', '/country/160.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'Ethiopia', '/country/161.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'European Union', '/country/162.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'Faroes', '/country/163.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'Fiji', '/country/164.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'Finland', '/country/165.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'France', '/country/166.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'Gabon', '/country/167.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'Gambia', '/country/168.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'Georgia', '/country/169.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'Germany', '/country/170.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'Ghana', '/country/171.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'Gibraltar', '/country/172.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'Greece', '/country/173.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'Greenland', '/country/174.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'Grenada', '/country/175.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'Guadeloupe', '/country/176.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'Guam', '/country/177.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'Guatemala', '/country/178.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'Guernsey', '/country/179.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'Guinea-Bissau', '/country/180.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'Guinea', '/country/181.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'Guyana', '/country/182.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'Haiti', '/country/183.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'Honduras', '/country/184.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'Hong Kong', '/country/185.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'Hungary', '/country/186.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'Iceland', '/country/187.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'India', '/country/188.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'Indonezia', '/country/189.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'Iran', '/country/190.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'Iraq', '/country/191.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'Ireland', '/country/192.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'Islamic Conference', '/country/193.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'Isle of Man', '/country/194.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'Israel', '/country/195.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'Italy', '/country/196.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'Jamaica', '/country/197.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'Japan', '/country/198.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'Jersey', '/country/199.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'Jordan', '/country/200.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'Kazakstan', '/country/201.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'Kenya', '/country/202.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'Kirbati', '/country/203.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'Kosovo', '/country/204.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'Kuwait', '/country/205.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'Kyrgyzstan', '/country/206.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'Laos', '/country/207.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'Latvia', '/country/208.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'Lebanon', '/country/210.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'Lesotho', '/country/211.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'Liberia', '/country/212.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'Libya', '/country/213.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'Liechtenstein', '/country/214.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'Lithuania', '/country/215.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(216, 'Luxembourg', '/country/216.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(217, 'Macao', '/country/217.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'Macedonia', '/country/218.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'Madagascar', '/country/219.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'Malawi', '/country/220.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'Malaysia', '/country/221.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'Maldives', '/country/222.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'Mali', '/country/223.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'Malta', '/country/224.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'Marshall Islands', '/country/225.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'Martinique', '/country/226.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(227, 'Mauritania', '/country/227.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'Mauritius', '/country/228.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'Mexico', '/country/229.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'Micronesia', '/country/231.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'Moldova', '/country/232.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'Monaco', '/country/233.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'Mongolia', '/country/234.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'Montenegro', '/country/235.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'Montserrat', '/country/236.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'Morocco', '/country/237.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'Mozambique', '/country/238.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'Myanmar(Burma)', '/country/239.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'NATO', '/country/240.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'Namibia', '/country/241.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'Nauru', '/country/242.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'Nepal', '/country/244.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'Netherlands', '/country/245.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(246, 'Netherlands Antilles', '/country/246.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'New Caledonia', '/country/247.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'New Zealand', '/country/248.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'Nicaragua', '/country/249.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'Niger', '/country/250.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 'Nigeria', '/country/251.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 'North Korea', '/country/252.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 'Northern Cyprus', '/country/253.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(254, 'Northern Ireland', '/country/254.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(255, 'Norway', '/country/255.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(256, 'OPEC', '/country/256.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(257, 'Olimpic Movement', '/country/257.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(258, 'Oman', '/country/258.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(259, 'Pakistan', '/country/259.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(260, 'Palau', '/country/260.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(261, 'Palestine', '/country/261.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(262, 'Panama', '/country/262.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(263, 'Papua New Guinea', '/country/263.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(264, 'Paraguay', '/country/264.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(265, 'Peru', '/country/265.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 'Phillipines', '/country/266.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 'Poland', '/country/267.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(268, 'Portugal', '/country/268.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(269, 'Puerto Rico', '/country/269.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(270, 'Qatar', '/country/270.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(271, 'Red Cross', '/country/271.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(272, 'Reunion', '/country/272.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 'Romania', '/country/273.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 'Russian Federation', '/country/274.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(275, 'Rwanda', '/country/275.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 'Saint Lucia', '/country/276.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(277, 'Samoa', '/country/277.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 'San Marino', '/country/278.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 'Sao Tome & Principe', '/country/279.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 'Saudi Arabia', '/country/280.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 'Scotland', '/country/281.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 'Senegal', '/country/282.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 'Serbia (Yugoslavia)', '/country/283.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 'Seychelles', '/country/284.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(285, 'Sierra Leone', '/country/285.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 'Singapore', '/country/286.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(287, 'Slovakia', '/country/287.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 'Slovenia', '/country/288.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(289, 'Solomon Islands', '/country/289.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 'Somalia', '/country/290.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(291, 'Somaliland', '/country/291.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 'South Africa', '/country/292.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(293, 'South Korea', '/country/293.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 'Spain', '/country/294.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(295, 'Sri Lanka', '/country/295.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 'St Kitta & Nevis', '/country/296.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 'St Vincent & the Grenadines', '/country/297.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 'Sudan', '/country/298.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(299, 'Suriname', '/country/299.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(300, 'Swaziland', '/country/300.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(301, 'Sweden', '/country/301.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 'Swtzerland', '/country/302.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(303, 'Syria', '/country/303.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(304, 'Tahiti (French Polinesia)', '/country/304.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 'Taiwan', '/country/305.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(306, 'Tajikstan', '/country/306.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(307, 'Tanzania', '/country/307.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 'Thailand', '/country/308.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(309, 'Timor-Leste', '/country/309.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 'Togo', '/country/310.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(311, 'Togo', '/country/311.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(312, 'Tonga', '/country/312.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(313, 'Trinidad & Tobago', '/country/313.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 'Tunisia', '/country/314.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(315, 'Turkey', '/country/315.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 'Turkmenistan', '/country/316.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 'Turks and Caicos Islands', '/country/317.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 'Tuvalu', '/country/318.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 'Uganda', '/country/319.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(320, 'Ukraine', '/country/320.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(321, 'United Arab Emirates', '/country/321.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(322, 'United Kingdom (Great Britain)', '/country/322.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(323, 'United Nations', '/country/323.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 'United States of America (USA)', '/country/324.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 'Uruguay', '/country/325.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 'Uzbekistan', '/country/326.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 'Vanutau', '/country/327.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(328, 'Vatican City', '/country/328.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(329, 'Venezuela', '/country/329.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(330, 'Viet Nam', '/country/330.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(331, 'Virgin Islands British', '/country/331.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(332, 'Virgin Islands US', '/country/332.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(333, 'Wales', '/country/333.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(334, 'Western Sahara', '/country/334.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(335, 'Yemen', '/country/335.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(336, 'Zambia', '/country/336.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(337, 'Zimbabwe', '/country/337.png', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `scores_course`
--

CREATE TABLE IF NOT EXISTS `scores_course` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `tournamentId` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `scores_course`
--

INSERT INTO `scores_course` (`id`, `name`, `tournamentId`, `created`, `modified`) VALUES
(1, 'Durban Country Club', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Umhlali Country Club', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Mount Edgecombe', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Selbourne Park Golf Club', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Beachwood Country Club', 0, '2014-10-14 13:44:28', '0000-00-00 00:00:00'),
(6, 'Test Course 2', 0, '2014-10-14 13:52:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `scores_flighting`
--

CREATE TABLE IF NOT EXISTS `scores_flighting` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `tournamentId` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `scores_flighting`
--

INSERT INTO `scores_flighting` (`id`, `name`, `tournamentId`, `created`, `modified`) VALUES
(1, '0-5', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '6-10', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '11-15', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '16-20', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '20-25', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '100-200', 0, '2014-10-14 12:26:48', '0000-00-00 00:00:00'),
(7, '100-200', 0, '2014-10-14 12:27:01', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `scores_group`
--

CREATE TABLE IF NOT EXISTS `scores_group` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `css` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `tournamentId` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `course` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `scores_group`
--

INSERT INTO `scores_group` (`id`, `name`, `css`, `tournamentId`, `created`, `modified`, `course`) VALUES
(3, 'Group 1', 'scores_group1', 0, '0000-00-00 00:00:00', '2014-10-20 11:59:42', '1'),
(4, 'Group 2', 'scores_group2', 0, '0000-00-00 00:00:00', '2014-10-20 11:59:44', '2'),
(5, 'Group 3', 'scores_group3', 0, '0000-00-00 00:00:00', '2014-10-20 11:59:47', '3'),
(6, 'Group 4', 'scores_group4', 0, '0000-00-00 00:00:00', '2014-10-20 11:59:50', '4');

-- --------------------------------------------------------

--
-- Table structure for table `scores_hole`
--

CREATE TABLE IF NOT EXISTS `scores_hole` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `course` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `tournamentId` int(11) NOT NULL,
  `set` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `par` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `number` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `scores_hole`
--

INSERT INTO `scores_hole` (`id`, `course`, `tournamentId`, `set`, `par`, `number`) VALUES
(1, '1', 0, '', '5', '1'),
(2, '1', 0, '', '5', '2'),
(3, '1', 0, '', '5', '3'),
(4, '1', 0, '', '5', '4'),
(5, '1', 0, '', '5', '6'),
(6, '1', 0, '', '5', '7'),
(7, '1', 0, '', '5', '8'),
(9, '1', 0, '', '5', '9'),
(10, '1', 0, '', '5', '10'),
(11, '1', 0, '', '5', '11'),
(12, '1', 0, '', '5', '12'),
(13, '1', 0, '', '5', '13'),
(14, '1', 0, '', '5', '14'),
(15, '1', 0, '', '5', '15'),
(16, '1', 0, '', '5', '16'),
(17, '1', 0, '', '5', '17'),
(18, '1', 0, '', '5', '18');

-- --------------------------------------------------------

--
-- Table structure for table `scores_par`
--

CREATE TABLE IF NOT EXISTS `scores_par` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `course` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `par` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `hole` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `scores_par`
--

INSERT INTO `scores_par` (`id`, `course`, `par`, `hole`, `created`, `modified`) VALUES
(1, '1', '5', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '1', '5', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, '1', '5', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, '1', '5', 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, '1', '5', 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, '1', '5', 7, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, '1', '5', 8, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, '1', '5', 9, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, '1', '5', 10, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, '1', '5', 11, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, '1', '5', 12, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, '1', '5', 13, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, '1', '5', 14, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, '1', '5', 15, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, '1', '5', 16, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, '1', '5', 17, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, '1', '5', 18, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, '1', '5', 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `scores_player`
--

CREATE TABLE IF NOT EXISTS `scores_player` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `team` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `group` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `handicap` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `flighting` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `contactNumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `tournamentId` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `scores_player`
--

INSERT INTO `scores_player` (`id`, `name`, `country`, `team`, `group`, `handicap`, `flighting`, `contactNumber`, `tournamentId`, `email`, `created`, `modified`) VALUES
(2, 'Alistair Nel', '93', '2', '3', '12', '1', '02121121212121', 0, 'happy@gpp.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Jimmy Hendrix', '103', '3', '3', '43', '2', '2222222222222222', 0, 'asda@jim.hen', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Clint G', '225', '3', '3', '75', '3', '1211111111111', 0, 'asdsada@ads.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'BoB D', '213', '1', '3', '86', '3', '11111111111111', 0, 'asdsad@asdsa.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Dave Rod', '172', '3', '4', '87', '4', '23213213213', 0, 'sdasdsad@aeroc.cc', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Angie D', '184', '1', '5', '234', '4', '2323232323232', 0, '1213ASD22@sdsa.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Roby Mullen', '175', '3', '3', '34', '5', '11111111111111122', 0, 'asdsad@asd.com', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'asdf', '92', '2', '4', '123', '1', '1234567890', 0, 'asdf@asdf.c', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'test', '94', '2', '5', '1234', '2', '1234567890', 0, 'a@a.c', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Candice', '244', '2', '3', '42', '2', '55555555555555555', 0, 'jhjsdha@sasd.com', '2014-10-14 12:16:44', '0000-00-00 00:00:00'),
(12, 'Cinttes', '91', '1', '3', '18', '1', '+9649898989898898', 0, 'clint@clintgriffin.com', '2014-10-14 12:17:35', '0000-00-00 00:00:00'),
(13, 'test', '92', '1', '3', '12', '2', '4564556', 0, 'c', '2014-10-14 12:22:07', '0000-00-00 00:00:00'),
(14, 'hasdasd', '100', '2', '4', '232', '6', '222222222222222222', 0, 'asdasda@cc.com', '2014-10-14 12:40:35', '0000-00-00 00:00:00'),
(15, 'john', '92', '2', '4', '12', '2', '333', 0, 'c', '2014-10-14 12:40:42', '0000-00-00 00:00:00'),
(16, 'Neil', '292', '4', '3', '13', '3', '78', 0, 'vgg', '2014-10-14 13:29:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `scores_score`
--

CREATE TABLE IF NOT EXISTS `scores_score` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `playerId` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `tournamentId` int(11) NOT NULL,
  `created` date NOT NULL,
  `modified` datetime NOT NULL,
  `course` int(11) NOT NULL,
  `hole` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `scores_score`
--

INSERT INTO `scores_score` (`id`, `playerId`, `score`, `tournamentId`, `created`, `modified`, `course`, `hole`) VALUES
(1, '1', '3', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(2, '1', '2', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(3, '1', '4', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(4, '1', '5', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(5, '1', '3', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(6, '1', '2', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(7, '1', '3', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(8, '1', '6', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(9, '1', '4', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(10, '1', '3', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(11, '1', '5', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(12, '1', '3', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(13, '1', '2', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(14, '1', '3', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(15, '1', '5', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(16, '1', '6', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(17, '1', '6', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(18, '1', '3', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(19, '1', '4', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(20, '1', '4', 0, '0000-00-00', '0000-00-00 00:00:00', 0, 0),
(21, '1', '1', 0, '2014-10-11', '0000-00-00 00:00:00', 0, 0),
(22, '1', '2', 0, '2014-10-11', '0000-00-00 00:00:00', 0, 0),
(23, '1', '2', 0, '2014-10-11', '0000-00-00 00:00:00', 0, 0),
(24, '2', '3', 0, '2014-10-14', '0000-00-00 00:00:00', 1, 1),
(25, '2', '4', 0, '2014-10-14', '0000-00-00 00:00:00', 1, 2),
(26, '2', '10', 0, '2014-10-14', '0000-00-00 00:00:00', 1, 4),
(27, '2', '10', 0, '2014-10-14', '0000-00-00 00:00:00', 1, 5),
(28, '2', '10', 0, '2014-10-14', '0000-00-00 00:00:00', 1, 3),
(29, '2', '3', 0, '2014-10-14', '0000-00-00 00:00:00', 1, 6),
(30, '16', '10', 0, '2014-10-14', '0000-00-00 00:00:00', 1, 7),
(31, '2', '78', 0, '2014-10-14', '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `scores_team`
--

CREATE TABLE IF NOT EXISTS `scores_team` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `tournamentId` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `scores_team`
--

INSERT INTO `scores_team` (`id`, `name`, `tournamentId`, `created`, `modified`) VALUES
(1, 'Afghans', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Green Goblins', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Happy Smackers', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'South Africa', 0, '2014-10-14 13:26:57', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `scores_tournament`
--

CREATE TABLE IF NOT EXISTS `scores_tournament` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `created` int(20) NOT NULL,
  `modified` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `YiiSession`
--

INSERT INTO `YiiSession` (`id`, `expire`, `data`) VALUES
('2f0pq7lrgkdgppa9fuft9dl2s2', 1413818080, 0x33623133313364303538633238666138393466613735653738626131656635325969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
('5ucrd3f5fcom7fa5jhshvs8nt4', 1413816798, 0x726566726573687c623a313b33623133313364303538633238666138393466613735653738626131656635325f5f69647c733a313a2231223b33623133313364303538633238666138393466613735653738626131656635325f5f6e616d657c733a353a2261646d696e223b336231333133643035386332386661383934666137356537386261316566353269647c733a313a2231223b33623133313364303538633238666138393466613735653738626131656635325f5f7374617465737c613a313a7b733a323a226964223b623a313b7d33623133313364303538633238666138393466613735653738626131656635325969692e43576562557365722e666c617368636f756e746572737c613a303a7b7d),
('hqv9acnorim9767tn4vse7cds6', 1413819555, 0x726566726573687c623a313b33623133313364303538633238666138393466613735653738626131656635325f5f69647c733a313a2231223b33623133313364303538633238666138393466613735653738626131656635325f5f6e616d657c733a353a2261646d696e223b336231333133643035386332386661383934666137356537386261316566353269647c733a313a2231223b33623133313364303538633238666138393466613735653738626131656635325f5f7374617465737c613a313a7b733a323a226964223b623a313b7d),
('kagbc2ibdb158193ts01es6df4', 1413819744, 0x726566726573687c623a313b);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
