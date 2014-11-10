-- Adminer 3.7.1 MySQL dump

SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = '+02:00';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) DEFAULT NULL,
  `fields` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `m2m_account`;
CREATE TABLE `m2m_account` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `size` bigint(40) NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `m2m_account` (`id`, `size`, `userId`, `created`, `modified`) VALUES
(1,	239554107,	1,	'0000-00-00 00:00:00',	'2014-04-22 15:32:03'),
(2,	32354677,	36,	'0000-00-00 00:00:00',	'2014-04-12 00:35:50'),
(3,	8260697,	2,	'2014-03-14 13:53:52',	'2014-03-14 13:54:16');

DROP TABLE IF EXISTS `m2m_action`;
CREATE TABLE `m2m_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `comment` text,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `m2m_action` (`id`, `title`, `comment`, `subject`) VALUES
(28,	'GUserUpdate',	NULL,	NULL),
(29,	'GInvoiceUpdate',	NULL,	NULL),
(30,	'GAccountUpdate',	NULL,	NULL),
(31,	'GTranslationUpdate',	NULL,	NULL);

DROP TABLE IF EXISTS `m2m_custom_url`;
CREATE TABLE `m2m_custom_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(256) NOT NULL,
  `url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_custom_url` (`id`, `path`, `url`) VALUES
(1,	'/page/post/admin',	'/newspaper');

DROP TABLE IF EXISTS `m2m_file`;
CREATE TABLE `m2m_file` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `m2m_file` (`id`, `type`, `filename`, `mime`, `created`, `modified`, `weight`, `view`, `edit`, `delete`, `userId`) VALUES
(200,	'image',	'download (1).jpg',	'image/jpg',	'2014-04-27 15:42:47',	'2014-04-27 15:42:47',	NULL,	'P',	'P',	'P',	1),
(199,	'image',	'dash.jpg',	'image/jpg',	'2014-04-27 15:42:46',	'2014-04-27 15:42:46',	NULL,	'P',	'P',	'P',	1),
(39,	'audio',	'BOB MARLEY - COULD YOU BE LOVED.mp3',	'',	'2014-04-21 17:37:32',	NULL,	NULL,	'P',	'P',	'P',	NULL),
(190,	'image',	'about.gif',	'image/gif',	'2014-04-25 16:11:40',	'2014-04-25 16:11:41',	NULL,	'P',	'P',	'P',	1);

DROP TABLE IF EXISTS `m2m_file_audio`;
CREATE TABLE `m2m_file_audio` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

INSERT INTO `m2m_file_audio` (`id`, `title`, `artist`, `album`, `year`, `comment`, `track`, `genre`, `fileId`) VALUES
(1,	'Could you be loved',	'Bob Marley',	'Unknown Album',	NULL,	NULL,	NULL,	'Other',	39);

DROP TABLE IF EXISTS `m2m_file_image`;
CREATE TABLE `m2m_file_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `alt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `m2m_file_image` (`id`, `fileId`, `width`, `height`, `type`, `alt`) VALUES
(114,	190,	600,	600,	'l',	''),
(113,	190,	300,	300,	'm',	''),
(112,	190,	128,	128,	's',	''),
(144,	200,	600,	600,	'l',	''),
(143,	200,	300,	300,	'm',	''),
(142,	200,	128,	128,	's',	''),
(141,	199,	600,	600,	'l',	''),
(140,	199,	300,	300,	'm',	''),
(139,	199,	128,	128,	's',	'');

DROP TABLE IF EXISTS `m2m_form`;
CREATE TABLE `m2m_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_form` (`id`, `name`, `created`, `modified`, `elementId`) VALUES
(1,	'registration',	'2013-11-20',	'2014-03-02',	0);

DROP TABLE IF EXISTS `m2m_friendship`;
CREATE TABLE `m2m_friendship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inviterId` int(11) NOT NULL,
  `friendId` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_friendship` (`id`, `inviterId`, `friendId`, `status`, `modified`, `created`, `message`) VALUES
(7,	35,	36,	2,	NULL,	'2014-03-04 00:24:42',	'');

DROP TABLE IF EXISTS `m2m_invoice`;
CREATE TABLE `m2m_invoice` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `size` bigint(40) NOT NULL,
  `rate` bigint(40) NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `m2m_invoice` (`id`, `size`, `rate`, `userId`, `created`, `sent`, `paid`) VALUES
(4,	3074048,	2,	1,	'0000-00-00 00:00:00',	0,	0);

DROP TABLE IF EXISTS `m2m_membership`;
CREATE TABLE `m2m_membership` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `m2m_membership` (`id`, `roleId`, `userId`, `payment_id`, `order_date`, `end_date`, `name`, `street`, `zipcode`, `city`, `payment_date`, `subscribed`) VALUES
(9,	12,	35,	1,	1392452436,	1423988436,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(12,	11,	36,	1,	1392452436,	1423988436,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(13,	12,	38,	1,	1394197780,	1425733780,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(14,	11,	38,	1,	1395058062,	1426594062,	NULL,	NULL,	NULL,	NULL,	NULL,	0);

DROP TABLE IF EXISTS `m2m_message`;
CREATE TABLE `m2m_message` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `m2m_message` (`id`, `created`, `modified`, `fromUserId`, `toUserId`, `subject`, `message`, `read`, `answered`, `draft`) VALUES
(9,	'2014-03-04 10:02:25',	'2014-03-07 12:37:59',	35,	36,	'test',	'321',	1,	0,	0),
(10,	'2014-03-07 16:37:11',	'2014-03-07 16:57:26',	1,	38,	'Your activation succeeded',	'The activation of the account peter succeeded. Please navigate to the login page to start using the site',	1,	0,	0);

DROP TABLE IF EXISTS `m2m_payment`;
CREATE TABLE `m2m_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `m2m_payment` (`id`, `title`, `text`) VALUES
(1,	'Prepayment',	NULL),
(2,	'Paypal',	NULL);

DROP TABLE IF EXISTS `m2m_permission`;
CREATE TABLE `m2m_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `actionId` int(11) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `m2m_permission` (`id`, `roleId`, `actionId`, `description`) VALUES
(1,	13,	28,	NULL),
(2,	14,	30,	NULL),
(3,	15,	29,	NULL),
(4,	16,	31,	NULL);

DROP TABLE IF EXISTS `m2m_post`;
CREATE TABLE `m2m_post` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf16 COLLATE=utf16_swedish_ci;

INSERT INTO `m2m_post` (`id`, `title`, `summary`, `content`, `view`, `edit`, `delete`, `created`, `modified`, `coverId`, `userId`) VALUES
(146,	'Title',	'Biatch',	NULL,	'P',	'P',	'*',	'2014-03-14 13:53:21',	'2014-03-14 13:53:35',	NULL,	2),
(158,	'',	NULL,	'Click here enter a <b>post</b> content',	'P',	'P',	'P',	'2014-04-25 16:10:03',	'2014-04-26 23:55:28',	NULL,	1),
(154,	'',	NULL,	NULL,	'P',	'P',	'*',	'2014-04-11 16:50:59',	'2014-04-12 00:37:28',	NULL,	36),
(157,	'',	'Click here enter a brief summary123',	'Click here enter a post content123',	'P',	'P',	'P',	'2014-04-23 14:10:53',	'2014-04-25 13:50:27',	NULL,	1);

DROP TABLE IF EXISTS `m2m_post_file`;
CREATE TABLE `m2m_post_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `postId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_post_file` (`id`, `type`, `postId`, `fileId`, `weight`) VALUES
(780,	'image',	149,	35,	NULL),
(781,	'image',	149,	36,	NULL),
(782,	'image',	149,	37,	NULL),
(783,	'data',	149,	38,	NULL),
(784,	'audio',	149,	40,	NULL),
(785,	'audio',	149,	41,	NULL),
(786,	'audio',	149,	42,	NULL),
(787,	'audio',	149,	43,	NULL),
(788,	'audio',	149,	44,	NULL),
(789,	'audio',	149,	45,	NULL),
(790,	'audio',	149,	46,	NULL),
(791,	'audio',	149,	47,	NULL),
(792,	'audio',	149,	48,	NULL),
(793,	'audio',	149,	49,	NULL),
(794,	'audio',	149,	50,	NULL),
(795,	'audio',	149,	51,	NULL),
(796,	'audio',	149,	52,	NULL),
(797,	'audio',	149,	53,	NULL),
(798,	'data',	149,	54,	NULL),
(799,	'audio',	149,	55,	NULL),
(800,	'audio',	149,	56,	NULL),
(801,	'audio',	149,	57,	NULL),
(802,	'audio',	149,	58,	NULL),
(803,	'audio',	149,	59,	NULL),
(804,	'audio',	149,	60,	NULL),
(805,	'audio',	149,	61,	NULL),
(806,	'audio',	149,	62,	NULL),
(807,	'audio',	149,	63,	NULL),
(808,	'audio',	149,	64,	NULL),
(809,	'audio',	149,	65,	NULL),
(810,	'audio',	149,	66,	NULL),
(811,	'audio',	149,	67,	NULL),
(812,	'audio',	149,	68,	NULL),
(813,	'audio',	149,	69,	NULL),
(814,	'audio',	149,	70,	NULL),
(815,	'audio',	149,	71,	NULL),
(816,	'audio',	149,	72,	NULL),
(817,	'audio',	149,	73,	NULL),
(818,	'audio',	149,	74,	NULL),
(819,	'audio',	149,	75,	NULL),
(820,	'audio',	149,	76,	NULL),
(821,	'audio',	149,	77,	NULL),
(822,	'audio',	149,	78,	NULL),
(823,	'audio',	149,	79,	NULL),
(824,	'audio',	149,	80,	NULL),
(825,	'audio',	149,	81,	NULL),
(826,	'audio',	149,	82,	NULL),
(827,	'audio',	149,	83,	NULL),
(828,	'audio',	149,	84,	NULL),
(829,	'audio',	149,	85,	NULL),
(830,	'audio',	149,	86,	NULL),
(831,	'audio',	149,	87,	NULL),
(832,	'audio',	149,	88,	NULL),
(833,	'audio',	149,	89,	NULL),
(834,	'audio',	149,	90,	NULL),
(835,	'audio',	149,	91,	NULL),
(836,	'audio',	149,	92,	NULL),
(837,	'audio',	149,	93,	NULL),
(838,	'audio',	149,	94,	NULL),
(839,	'audio',	149,	95,	NULL),
(840,	'audio',	149,	96,	NULL),
(841,	'audio',	149,	97,	NULL),
(842,	'audio',	149,	98,	NULL),
(843,	'audio',	149,	99,	NULL),
(844,	'audio',	149,	100,	NULL),
(845,	'audio',	149,	101,	NULL),
(846,	'audio',	149,	102,	NULL),
(847,	'data',	149,	103,	NULL),
(848,	'audio',	149,	104,	NULL),
(849,	'audio',	157,	105,	NULL),
(850,	'audio',	157,	106,	NULL),
(851,	'audio',	157,	107,	NULL),
(852,	'audio',	157,	108,	NULL),
(853,	'audio',	157,	109,	NULL),
(854,	'audio',	157,	110,	NULL),
(855,	'audio',	157,	111,	NULL),
(856,	'audio',	157,	112,	NULL),
(857,	'audio',	157,	113,	NULL),
(858,	'audio',	157,	114,	NULL),
(859,	'audio',	157,	115,	NULL),
(860,	'audio',	157,	116,	NULL),
(861,	'audio',	157,	117,	NULL),
(862,	'audio',	157,	118,	NULL),
(863,	'audio',	157,	119,	NULL),
(864,	'audio',	157,	120,	NULL),
(865,	'audio',	157,	121,	NULL),
(866,	'audio',	157,	122,	NULL),
(867,	'audio',	157,	123,	NULL),
(868,	'audio',	157,	124,	NULL),
(869,	'audio',	157,	125,	NULL),
(870,	'audio',	157,	126,	NULL),
(871,	'audio',	157,	127,	NULL),
(872,	'audio',	157,	128,	NULL),
(873,	'audio',	157,	129,	NULL),
(874,	'audio',	157,	130,	NULL),
(875,	'audio',	157,	131,	NULL),
(876,	'audio',	157,	132,	NULL),
(877,	'audio',	157,	133,	NULL),
(878,	'audio',	157,	134,	NULL),
(879,	'audio',	157,	135,	NULL),
(880,	'audio',	157,	136,	NULL),
(881,	'audio',	157,	137,	NULL),
(882,	'audio',	157,	138,	NULL),
(883,	'audio',	157,	139,	NULL),
(884,	'audio',	157,	140,	NULL),
(885,	'audio',	157,	141,	NULL),
(886,	'audio',	157,	142,	NULL),
(887,	'audio',	157,	143,	NULL),
(888,	'audio',	157,	144,	NULL),
(889,	'audio',	157,	145,	NULL),
(890,	'audio',	157,	146,	NULL),
(891,	'audio',	157,	147,	NULL),
(892,	'audio',	157,	148,	NULL),
(893,	'audio',	157,	149,	NULL),
(894,	'data',	157,	150,	NULL),
(895,	'audio',	157,	151,	NULL),
(896,	'audio',	157,	152,	NULL),
(897,	'audio',	157,	153,	NULL),
(898,	'audio',	157,	154,	NULL),
(899,	'audio',	157,	155,	NULL),
(900,	'data',	157,	156,	NULL),
(901,	'audio',	157,	157,	NULL),
(902,	'audio',	157,	158,	NULL),
(903,	'audio',	157,	159,	NULL),
(904,	'audio',	157,	160,	NULL),
(905,	'audio',	157,	161,	NULL),
(906,	'audio',	157,	162,	NULL),
(907,	'audio',	157,	163,	NULL),
(908,	'audio',	157,	164,	NULL),
(909,	'audio',	157,	165,	NULL),
(910,	'audio',	157,	166,	NULL),
(911,	'audio',	157,	167,	NULL),
(912,	'audio',	157,	168,	NULL),
(913,	'audio',	157,	169,	NULL),
(914,	'audio',	157,	170,	NULL),
(915,	'audio',	157,	171,	NULL),
(916,	'audio',	157,	172,	NULL),
(917,	'audio',	157,	173,	NULL),
(918,	'audio',	157,	174,	NULL),
(919,	'audio',	157,	175,	NULL),
(920,	'audio',	149,	176,	NULL),
(921,	'audio',	149,	177,	NULL),
(922,	'audio',	149,	178,	NULL),
(923,	'audio',	157,	179,	NULL),
(924,	'audio',	157,	180,	NULL),
(925,	'audio',	157,	181,	NULL),
(926,	'audio',	157,	182,	NULL),
(927,	'image',	157,	183,	NULL),
(928,	'image',	157,	184,	NULL),
(929,	'image',	157,	185,	NULL),
(930,	'image',	157,	186,	NULL),
(931,	'image',	157,	187,	NULL),
(932,	'image',	157,	188,	NULL),
(933,	'image',	157,	189,	NULL),
(934,	'image',	157,	190,	NULL),
(935,	'image',	157,	191,	NULL),
(936,	'image',	157,	192,	NULL),
(937,	'image',	157,	193,	NULL),
(938,	'image',	157,	194,	NULL),
(939,	'image',	158,	195,	NULL),
(940,	'image',	158,	196,	NULL),
(941,	'image',	158,	197,	NULL),
(942,	'image',	158,	198,	NULL),
(943,	'image',	158,	199,	NULL),
(944,	'image',	158,	200,	NULL);

DROP TABLE IF EXISTS `m2m_privacysetting`;
CREATE TABLE `m2m_privacysetting` (
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

INSERT INTO `m2m_privacysetting` (`userId`, `message_new_friendship`, `message_new_message`, `message_new_profilecomment`, `appear_in_search`, `show_online_status`, `log_profile_visits`, `ignore_users`, `public_profile_fields`) VALUES
(1,	1,	1,	1,	1,	1,	1,	'',	NULL),
(2,	1,	1,	1,	1,	1,	1,	'',	NULL),
(6,	1,	1,	1,	1,	1,	1,	'',	NULL),
(7,	1,	1,	1,	1,	1,	1,	'',	NULL),
(8,	1,	1,	1,	1,	1,	1,	'',	NULL),
(9,	1,	1,	1,	1,	1,	1,	'',	NULL),
(10,	1,	1,	1,	1,	1,	1,	'',	NULL),
(11,	1,	1,	1,	1,	1,	1,	'',	NULL),
(12,	1,	1,	1,	1,	1,	1,	'',	NULL),
(13,	1,	1,	1,	1,	1,	1,	'',	NULL),
(14,	1,	1,	1,	1,	1,	1,	'',	NULL),
(15,	1,	1,	1,	1,	1,	1,	'',	NULL),
(16,	1,	1,	1,	1,	1,	1,	'',	NULL),
(17,	1,	1,	1,	1,	1,	1,	'',	NULL),
(18,	1,	1,	1,	1,	1,	1,	'',	NULL),
(19,	1,	1,	1,	1,	1,	1,	'',	NULL),
(20,	1,	1,	1,	1,	1,	1,	'',	NULL),
(21,	1,	1,	1,	1,	1,	1,	'',	NULL),
(22,	1,	1,	1,	1,	1,	1,	'',	NULL),
(23,	1,	1,	1,	1,	1,	1,	'',	NULL),
(24,	1,	1,	1,	1,	1,	1,	'',	NULL),
(25,	1,	1,	1,	1,	1,	1,	'',	NULL),
(26,	1,	1,	1,	1,	1,	1,	'',	NULL),
(27,	1,	1,	1,	1,	1,	1,	'',	NULL),
(28,	1,	1,	1,	1,	1,	1,	'',	NULL),
(29,	1,	1,	1,	1,	1,	1,	'',	NULL),
(30,	1,	1,	1,	1,	1,	1,	'',	NULL),
(31,	1,	1,	1,	1,	1,	1,	'',	NULL),
(32,	1,	1,	1,	1,	1,	1,	'',	NULL),
(33,	1,	1,	1,	1,	1,	1,	'',	NULL),
(34,	1,	1,	1,	1,	1,	1,	'',	NULL),
(35,	1,	1,	1,	1,	1,	1,	'',	NULL),
(36,	1,	1,	1,	1,	1,	1,	'',	NULL),
(37,	1,	1,	1,	1,	1,	1,	'',	NULL),
(38,	1,	1,	1,	1,	1,	1,	'',	NULL);

DROP TABLE IF EXISTS `m2m_profile`;
CREATE TABLE `m2m_profile` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `m2m_profile` (`id`, `userId`, `timestamp`, `privacy`, `lastname`, `firstname`, `show_friends`, `allow_comments`, `email`, `company`, `telephone`, `address`, `city`, `state`, `zip`, `country`) VALUES
(1,	1,	'2014-04-26 23:56:32',	'protected',	'admin',	'admin123asfasdfassssfd',	1,	1,	'almagestfraternite@gmail.com',	'Almagest Fraternite',	'1111111111111',	'Ghost Street',	'Durban',	'KZNasdf',	4000,	'zzr'),
(2,	2,	'2013-02-18 02:06:30',	'protected',	'Nel',	'Alistair',	1,	1,	'alistair@blahblahblah.co.za',	'test',	'27393192111',	'test',	'test',	'KZN',	4000,	'ZA'),
(35,	35,	'2014-03-03 12:04:32',	'protected',	'James',	'Reporter',	1,	1,	'a@a.c',	'Almagest Fraternite',	'0723557267',	'P.O. Box 1008',	'Belfast',	'Kwazulu Natal',	1100,	'ZA'),
(36,	36,	'2014-03-07 15:09:19',	'protected',	'Vos',	'Producer',	1,	1,	'r@r.c',	'Production Company',	'0723557267',	'P.O. Box 1008',	'Middelburg',	'Mpumalanga',	1100,	'US'),
(37,	37,	'0000-00-00 00:00:00',	'protected',	'',	'',	1,	1,	'jvos@lando.co.za',	'',	'',	'',	'',	'',	0,	''),
(38,	38,	'2014-03-10 11:38:12',	'protected',	'',	'',	1,	1,	'a@gmail.com',	'',	'',	'',	'',	'',	0,	''),
(39,	38,	'0000-00-00 00:00:00',	'protected',	'',	'',	1,	1,	'alistair@searchfusion.co.za',	'',	'',	'',	'',	'',	0,	'');

DROP TABLE IF EXISTS `m2m_profile_comment`;
CREATE TABLE `m2m_profile_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `m2m_profile_field`;
CREATE TABLE `m2m_profile_field` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `m2m_profile_field` (`id`, `varname`, `title`, `hint`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `position`, `visible`, `related_field_name`) VALUES
(1,	'email',	'E-Mail',	'',	'VARCHAR',	255,	0,	0,	'',	'',	'',	'CEmailValidator',	'',	0,	2,	''),
(2,	'firstname',	'First name',	'',	'VARCHAR',	255,	0,	0,	'',	'',	'',	'',	'',	0,	3,	''),
(3,	'lastname',	'Last name',	'',	'VARCHAR',	255,	0,	0,	'',	'',	'',	'',	'',	0,	3,	''),
(9,	'telephone',	'Contact Number',	'',	'VARCHAR',	13,	10,	0,	'',	'',	'',	'',	'',	0,	4,	''),
(14,	'company',	'Company',	'',	'VARCHAR',	255,	0,	0,	'',	'',	'',	'',	'',	0,	4,	''),
(15,	'address',	'Address',	'',	'VARCHAR',	255,	0,	0,	'',	'',	'',	'',	'',	0,	4,	''),
(18,	'zip',	'Zip/Postal Code',	'',	'VARCHAR',	28,	2,	0,	'',	'',	'',	'',	'',	0,	4,	''),
(20,	'country',	'Country Code (eg. ZA)',	'',	'VARCHAR',	3,	2,	0,	'',	'',	'',	'',	'',	0,	4,	''),
(21,	'city',	'City',	'Your city of origin.',	'VARCHAR',	255,	4,	0,	'',	'',	'',	'',	'',	0,	4,	''),
(22,	'state',	'Province/State',	'Province or state of origin.',	'VARCHAR',	255,	3,	0,	'',	'',	'',	'',	'',	0,	4,	'');

DROP TABLE IF EXISTS `m2m_profile_visit`;
CREATE TABLE `m2m_profile_visit` (
  `visitor_id` int(11) NOT NULL,
  `visited_id` int(11) NOT NULL,
  `timestamp_first_visit` int(11) NOT NULL,
  `timestamp_last_visit` int(11) NOT NULL,
  `num_of_visits` int(11) NOT NULL,
  PRIMARY KEY (`visitor_id`,`visited_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_profile_visit` (`visitor_id`, `visited_id`, `timestamp_first_visit`, `timestamp_last_visit`, `num_of_visits`) VALUES
(1,	2,	1335171800,	1337652058,	11),
(1,	3,	1335179541,	1337135324,	41),
(1,	4,	1337132241,	1337646718,	22),
(2,	1,	1336575805,	1336576270,	4),
(4,	1,	1336661711,	1337148523,	8),
(4,	2,	1336661708,	1337146605,	2);

DROP TABLE IF EXISTS `m2m_role`;
CREATE TABLE `m2m_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double NOT NULL COMMENT 'Price (when using membership module)',
  `duration` int(11) NOT NULL COMMENT 'How long a membership is valid',
  `registration` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `m2m_role` (`id`, `title`, `description`, `price`, `duration`, `registration`) VALUES
(11,	'Producer',	'null',	123,	321,	1),
(12,	'Reporter',	'null',	321,	321,	1),
(13,	'UserManager',	'',	1,	365,	0),
(14,	'AccountManager',	NULL,	0,	0,	0),
(15,	'InvoiceManager',	NULL,	0,	0,	0),
(16,	'SiteManager',	NULL,	0,	0,	0),
(17,	'ElementManager',	NULL,	0,	0,	0);

DROP TABLE IF EXISTS `m2m_site_page`;
CREATE TABLE `m2m_site_page` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_site_page` (`id`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`) VALUES
(5,	'upload',	'@',	'',	'',	'2013-02-17 00:00:00',	'2013-08-31 13:34:08',	0,	NULL),
(11,	'about_us',	'*',	'null',	'null',	'2013-08-31 17:47:59',	'2013-08-31 18:17:00',	0,	NULL),
(12,	'landing',	'*',	'null',	'null',	'2014-02-26 14:07:41',	'2014-02-26 14:07:51',	0,	1);

DROP TABLE IF EXISTS `m2m_site_page_element`;
CREATE TABLE `m2m_site_page_element` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_site_page_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
(1,	1,	'GUserField',	'HASH',	'',	'',	'{\"htmlOptions\":{\"style\":\"font-size: large;\"},\"edit\":false}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-02-17 00:00:00',	'2014-03-17 14:48:27',	2,	1,	1),
(45,	1,	'GUserProfileField',	'FIRSTNAME',	'',	'',	'{\"field\":\"firstname\",\"label\":\"First Name\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-08-28 21:56:14',	'2014-03-17 14:48:27',	3,	1,	1),
(46,	1,	'GUserProfileField',	'LASTNAME',	'',	'',	'{\"field\":\"lastname\",\"label\":\"Last Name\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-28 22:03:03',	'2014-03-17 14:48:27',	4,	1,	1),
(47,	1,	'GUserProfileField',	'EMAIL',	'',	'',	'{\"field\":\"email\",\"label\":\"Email\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-28 22:04:34',	'2014-03-17 14:48:27',	5,	1,	1),
(48,	1,	'GUserProfileField',	'COMPANY',	'',	'',	'{\"field\":\"company\",\"label\":\"Company\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-28 22:05:07',	'2014-03-17 14:48:27',	6,	1,	1),
(49,	1,	'GUserProfileField',	'CONTACTNUMBER',	'',	'',	'{\"field\":\"telephone\",\"label\":\"Contact Number\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-28 22:05:47',	'2014-03-17 14:48:27',	7,	1,	1),
(50,	1,	'GUserProfileField',	'ADDRESS',	'',	'',	'{\"field\":\"address\",\"label\":\"Address\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-28 22:05:54',	'2014-03-17 14:48:27',	12,	1,	1),
(51,	1,	'GUserProfileField',	'CITY',	'',	'',	'{\"field\":\"city\",\"label\":\"City\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-28 22:06:00',	'2014-03-17 14:48:27',	10,	1,	1),
(52,	1,	'GUserProfileField',	'STATE',	'',	'',	'{\"field\":\"state\",\"label\":\"Province\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-28 22:06:04',	'2014-03-17 14:48:27',	9,	1,	1),
(53,	1,	'GUserProfileField',	'ZIP',	'',	'',	'{\"field\":\"zip\",\"label\":\"Postal Code\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-28 22:06:09',	'2014-03-17 14:48:27',	11,	1,	1),
(54,	1,	'GUserProfileField',	'COUNTRY',	'',	'',	'{\"field\":\"country\",\"label\":\"Country\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-28 22:06:15',	'2014-03-17 14:48:27',	8,	1,	1),
(62,	1,	'GTag',	'aboutHeader',	'About',	'',	'{\"tag\":\"h2\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-31 17:52:18',	'2014-03-06 18:55:11',	0,	11,	1),
(66,	1,	'GTag',	'aboutParagraph',	'<p>Music2Media serves as an online intermediary between members of the press and the music industry.</p>In addition to opening up the channels of communication, Music2Media also allows for the streaming of new releases (and access to supplementary video, text and images) for potential review in publications.<p>The digital nature of our platform means quicker turnaround times, lower running costs and greater reach.</p> ',	'',	'{\"tag\":\"p\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-31 18:19:08',	'2014-03-06 18:55:06',	1,	11,	1),
(67,	2,	'GFolder',	'aboutTermsFolder',	'',	'',	'{\"title\":\"Terms and conditions\",\"hideContent\":true,\"htmlOptions\":{\"class\":\"termsAndConditions\"}}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-31 18:27:47',	'2014-03-06 18:55:56',	5,	11,	1),
(68,	1,	'GTag',	'aboutTerms',	'',	'',	'{\"translate\":true,\"text\":\"Terms And Conditions\"}',	NULL,	NULL,	'*',	'ElementManager',	'null',	'2013-08-31 18:36:47',	'2014-03-14 18:28:49',	6,	11,	1),
(69,	3,	NULL,	'aboutTermsFolderClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	NULL,	'2014-03-06 18:56:18',	8,	11,	1),
(70,	1,	'GImage',	'aboutHeadphonesImage',	'',	'',	'{\"htmlOptions\":{\"class\":\"pull-right\"},\"src\":\"\\/themes\\/m2m\\/images\\/about_headphones.png\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-31 18:50:05',	'2014-03-06 18:55:18',	4,	11,	1),
(75,	1,	'GImage',	'profile_image',	'',	'',	'{\"htmlOptions\":{\"class\":\"pull-left\"},\"src\":\"\\/themes\\/m2m\\/images\\/profile_reporter.png\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-09-01 14:44:02',	'2014-04-29 00:00:14',	0,	1,	1),
(79,	1,	'GPublishButton',	'profile_publish',	'',	'',	'{}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-09-01 16:50:01',	'2014-03-17 14:49:06',	1,	1,	1),
(80,	1,	'GPostCreator',	'creator',	'',	'',	'{}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-09-01 17:30:22',	'2014-01-16 11:37:10',	0,	5,	1),
(84,	1,	'GPostSearch',	'search_uploads_list',	'',	'',	'{\"action\":\"/gong/post/post/searchUploads\",\"htmlOptions\":{\"class\":\"SearchUploads\"}}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-09-03 13:39:01',	'2013-12-20 00:57:34',	1,	5,	1),
(88,	2,	'GTag',	'search_uploads',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-10-21 17:52:37',	'2013-12-20 00:55:45',	2,	5,	1),
(89,	3,	'GTag',	'',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-10-21 17:52:52',	'2013-12-20 00:55:45',	3,	5,	1),
(94,	1,	'GTag',	'WelcomeGuestHeading',	'',	'Welcome to music2media',	'{\"tag\":\"h2\"}',	NULL,	NULL,	'g',	'SUPER',	'null',	'2014-02-26 14:08:02',	'2014-03-17 12:50:24',	0,	12,	1),
(99,	1,	'GTag',	'WelcomeGuestParagraph',	'',	'click on the power icon to the left to sign up or login.',	'{\"tag\":\"p\"}',	NULL,	NULL,	'g',	'SUPER',	'null',	'2014-02-26 15:00:14',	'2014-03-17 12:50:24',	1,	12,	1),
(103,	1,	'GUserWidget',	'Site',	'',	'',	'[]',	NULL,	NULL,	'SiteManager',	'SUPER',	'null',	'2014-03-02 11:36:32',	'2014-03-17 12:50:24',	3,	12,	1),
(105,	1,	'GUserField',	'UserHash',	'',	'',	'{\"htmlOptions\":{\"class\":\"inline alert alert-info\"},\"edit\":false,\"tag\":\"h2\"}',	NULL,	NULL,	'Producer, Reporter',	'SUPER',	NULL,	'2014-03-03 07:44:45',	'2014-03-17 12:50:24',	7,	12,	1),
(108,	1,	'GFriendshipWidget',	'FriendshipNotification',	'',	'',	'[]',	NULL,	NULL,	'Producer, Reporter',	'SUPER',	NULL,	'2014-03-03 22:44:31',	'2014-03-17 12:50:24',	4,	12,	1),
(115,	1,	'GMessageWidget',	'UnreadMessages',	'',	'',	'[]',	NULL,	NULL,	'@',	'SUPER',	NULL,	'2014-03-04 02:09:04',	'2014-03-17 12:50:24',	5,	12,	1),
(137,	1,	'GPostSearch',	'postSearch',	'',	'',	'{\"publishedPosts\":true}',	NULL,	NULL,	'Reporter, Producer',	'SUPER',	NULL,	'2014-03-12 19:18:15',	'2014-03-17 12:50:24',	8,	12,	1),
(138,	2,	'GTag',	'controlGroup',	'',	'',	'{\"htmlOptions\":{\"style\":\"text-align:center\"}}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-17 12:49:20',	'2014-03-17 12:53:09',	2,	12,	1),
(139,	3,	NULL,	'',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-17 12:50:16',	'2014-03-17 12:50:24',	6,	12,	1);

DROP TABLE IF EXISTS `m2m_site_template`;
CREATE TABLE `m2m_site_template` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_site_template` (`id`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`) VALUES
(2,	'template',	'*',	'',	'',	'2013-02-17 00:00:00',	'2014-04-28 03:26:24',	1,	1),
(9,	'printTemplate',	'none',	'',	'',	'2013-07-11 00:00:00',	'2014-03-07 00:15:44',	0,	1);

DROP TABLE IF EXISTS `m2m_site_template_element`;
CREATE TABLE `m2m_site_template_element` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_site_template_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
(3,	2,	'GHeader',	'templateHeader',	'',	'',	'{\"tag\":\"div\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-02-17 00:00:00',	'2014-04-30 16:15:00',	0,	2,	1),
(4,	1,	'GImage',	'templateHeaderLogoImage',	'',	'',	'{\"alt\":\"Music2Media Logo\",\"htmlOptions\":{\"class\":\"logo\"},\"src\":\"\\/themes\\/m2m\\/images\\/music2media_logo.png\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-08-12 00:00:00',	'2014-03-12 23:48:44',	1,	2,	1),
(5,	1,	'GTag',	'templateHeaderLogoText',	'music<span class=\"logospan\">2</span>media.net',	'',	'{\"htmlOptions\":{\"class\":\"SiteTitle\"},\"tag\":\"h1\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-08-12 00:00:00',	'2014-03-14 12:59:14',	2,	2,	1),
(12,	3,	'GHeader',	'templateHeaderEnd',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-06-27 00:00:00',	'2014-03-12 23:49:40',	5,	2,	1),
(13,	1,	'GBusyPrompt',	'templateLoading',	'',	'',	'{\"loadingImage\":\"\\/themes\\/m2m\\/images\\/ajax-loader.gif\",\"loadingText\":\"\",\"savingImage\":\"\\/themes\\/m2m\\/images\\/ajax-loader.gif\",\"savingText\":\"\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-07-10 00:00:00',	'2014-03-12 23:50:31',	8,	2,	1),
(14,	1,	'GBrowserWarning',	'templateBrowserNotification',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-07-10 00:00:00',	'2014-03-12 23:51:46',	10,	2,	1),
(15,	1,	'GTag',	'templateLoadingShadow',	'',	'',	'{\"htmlOptions\":{\"class\":\"fullscreen saving loading\\u00a0browserNotification\"}}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-07-10 00:00:00',	'2014-03-12 23:51:18',	9,	2,	1),
(17,	1,	'GTabs',	'templateTabs',	'',	'',	'{\"items\":[{\"linkOptions\":{\"class\":\"searchTab\"},\"icon\":\"glyphicon glyphicon-headphones glyphicon-2x\",\"url\":\"/index.php\",\"view\":\"*\"},{\"icon\":\"glyphicon glyphicon-user glyphicon-2x\",\"url\":\"/page/profile\",\"view\":\"@\"},{\"linkOptions\":{\"class\":\"uploadTab\"},\"icon\":\"glyphicon glyphicon-upload glyphicon-2x\",\"url\":\"/page/upload\",\"view\":\"Producer\"},{\"icon\":\"glyphicon glyphicon-info-sign glyphicon-2x\",\"url\":\"/page/about_us\"},{\"icon\":\"glyphicon glyphicon-envelope glyphicon-2x\",\"view\":\"g\",\"url\":\"/site/contact\"},{\"type\":\"login\",\"icon\":\"glyphicon glyphicon-off glyphicon-2x\"}],\"tabsOptions\":{\"placement\":\"left\"}}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-02-17 00:00:00',	'2014-04-28 23:09:45',	7,	2,	1),
(44,	1,	'GTag',	'templateFooter',	'music2media.net  ™',	'',	'{\"htmlOptions\":{\"class\":\"Footer\"}}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-27 17:15:11',	'2014-04-28 23:02:10',	8,	2,	1),
(58,	1,	'GLink',	'templateHeaderInspectorLink',	'<i class=\"glyphicon glyphicon-wrench glyphicon-2x\"></i>',	'',	'{\"htmlOptions\":{\"class\":\"InspectorLink\"},\"url\":\"/gong/site/template/list\"}',	NULL,	NULL,	'SUPER',	'SUPER',	'null',	'2013-08-31 13:18:57',	'2014-04-28 23:11:46',	4,	2,	32),
(91,	1,	'GPlayer',	'templateHeaderPlayer',	'',	'',	'[]',	NULL,	NULL,	'Reporter, Producer',	'SUPER',	'null',	'2014-02-18 01:52:04',	'2014-03-12 23:49:10',	3,	2,	1),
(93,	1,	'GTag',	'templateFooterGraphic',	'',	'<img class=\"footerGraphic\" src=\"/themes/m2m/images/footerBars.png\" alt=\"footerBars.png\" />',	'[]',	NULL,	NULL,	'*',	'SUPER',	'null',	'2014-02-21 00:04:13',	'2014-03-12 23:51:56',	11,	2,	1),
(145,	NULL,	'GTag',	'test',	'',	'',	NULL,	NULL,	NULL,	'*',	'SUPER',	'',	'2014-04-28 22:04:18',	NULL,	NULL,	0,	1),
(146,	NULL,	'GTag',	'test',	'',	'',	NULL,	NULL,	NULL,	'*',	'SUPER',	'',	'2014-04-28 22:06:29',	NULL,	NULL,	0,	1),
(147,	NULL,	'GTag',	'test',	'',	'',	NULL,	NULL,	NULL,	'*',	'SUPER',	'',	'2014-04-28 22:08:20',	NULL,	NULL,	0,	1),
(148,	NULL,	'GTag',	'test',	'',	'',	NULL,	NULL,	NULL,	'*',	'SUPER',	'',	'2014-04-28 22:10:00',	NULL,	NULL,	0,	1),
(149,	NULL,	'GTag',	'test',	'',	'',	NULL,	NULL,	NULL,	'*',	'SUPER',	'',	'2014-04-28 22:14:51',	NULL,	NULL,	0,	1),
(152,	1,	'GArticle',	'content',	'',	'',	'{\"htmlOptions\":{\"class\":\"tab-content\"}}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-04-28 22:55:30',	'2014-04-28 23:13:06',	7,	2,	1);

DROP TABLE IF EXISTS `m2m_site_view`;
CREATE TABLE `m2m_site_view` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_site_view` (`id`, `module`, `controller`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`, `parentId`) VALUES
(47,	'site',	'element',	'create',	'*',	'',	'',	'2014-05-07 20:33:28',	'2014-05-12 23:26:18',	NULL,	1,	16),
(58,	'site',	'model',	'update',	'*',	'',	'',	'2014-05-07 22:46:59',	'2014-05-10 16:23:42',	NULL,	1,	16),
(59,	'site',	'model',	'updateDone',	'*',	'',	'',	'2014-05-07 23:08:18',	'2014-05-11 02:28:27',	NULL,	1,	16),
(210,	'site',	'elementCollection',	'create',	'*',	'',	'',	'2014-05-10 05:11:08',	'2014-05-12 23:26:25',	NULL,	1,	1),
(211,	'site',	'model',	'view',	'*',	'',	'',	'2014-05-10 05:11:08',	'2014-05-12 23:10:42',	NULL,	1,	1),
(212,	'site',	'model',	'delete',	'*',	'',	'',	'2014-05-10 05:11:08',	'2014-05-12 23:10:48',	NULL,	1,	1),
(213,	'site',	'model',	'createDone',	'*',	'',	'',	'2014-05-10 05:11:08',	'2014-05-12 23:10:51',	NULL,	1,	1),
(214,	'site',	'model',	'list',	'*',	'',	'',	'2014-05-10 05:11:08',	'2014-05-12 23:10:54',	NULL,	1,	1),
(228,	'user',	'auth',	'/user/login',	'*',	'',	'',	'2014-05-13 03:10:06',	'2014-05-15 14:27:48',	NULL,	1,	NULL),
(229,	'site',	'model',	'reorderDone',	'*',	'',	'',	'2014-05-16 02:16:19',	'2014-05-16 02:20:28',	NULL,	1,	NULL);

DROP TABLE IF EXISTS `m2m_site_view_element`;
CREATE TABLE `m2m_site_view_element` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_site_view_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
(145,	1,	'GTable',	'list',	'',	'',	'{\"controllerUrl\":\"\\/gong\\/site\\/{var:model.childType}\",\"view\":false,\"fields\":\"*\",\"data\":\"var:model.children\",\"columns\":[{\"id\":\"mode\",\"editor\":\"textarea\"},{\"id\":\"id\",\"display\":false},{\"id\":\"name\",\"editor\":\"textarea\"},{\"id\":\"className\",\"editor\":\"textarea\"},{\"id\":\"view\",\"editor\":\"textarea\"},{\"id\":\"edit\",\"editor\":\"textarea\"},{\"id\":\"delete\",\"editor\":\"textarea\"},{\"id\":\"weight\",\"editor\":\"textarea\"},{\"id\":\"created\"},{\"id\":\"modified\"},{\"id\":\"actions\",\"field\":\"id\",\"formatter\":\"Actions\"}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-01 22:15:32',	'2014-05-10 05:10:44',	6,	195,	1),
(178,	1,	'GTextField',	'name',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-04 15:46:43',	'2014-05-11 14:24:15',	3,	47,	1),
(179,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-07 00:48:34',	'2014-05-11 14:24:15',	1,	47,	1),
(180,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-07 00:48:55',	'2014-05-11 14:24:15',	20,	47,	1),
(181,	1,	'GSubmitButton',	'submit',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-07 00:51:05',	'2014-05-11 14:24:15',	19,	47,	1),
(182,	1,	'GHiddenField',	'parentId',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-07 20:23:22',	'2014-05-11 14:24:15',	18,	47,	1),
(183,	1,	'GTextField',	'mode',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-07 20:43:55',	'2014-05-11 14:24:15',	2,	47,	1),
(184,	1,	'GTextField',	'weight',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-07 20:58:47',	'2014-05-11 14:24:15',	5,	47,	1),
(185,	1,	'GTextField',	'className',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-07 21:05:01',	'2014-05-11 14:24:15',	4,	47,	1),
(197,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-07 22:47:32',	'2014-05-07 22:48:14',	1,	58,	1),
(198,	3,	'GFormWidget',	'formEnd',	'',	'',	NULL,	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-07 22:48:04',	NULL,	10,	58,	1),
(199,	1,	'GJsonEditor',	'fields',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-07 22:48:36',	'2014-05-07 22:49:41',	2,	58,	1),
(201,	1,	'GViewDom',	'children',	'',	'',	'{\"url\":\"dom\\/import\\/type\\/view\\/id\\/{var:model.hash}\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-07 23:20:14',	'2014-05-10 05:10:44',	4,	195,	1),
(244,	1,	'GRedirect',	'redirect',	'',	'',	'{\"url\":\"var:model.updateRedirect\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-08 02:29:06',	'2014-05-12 23:06:44',	NULL,	59,	1),
(245,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"label\":\"View parent\",\"url\":{\"0\":\"{var:model.parent.controllerId}/view\",\"id\":\"var:model.parent.hash\"}}]}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-08 02:31:11',	'2014-05-12 23:01:05',	1,	58,	1),
(522,	1,	'GRedirect',	'redirect',	'',	'',	'{\"params\":{\"id\":\"var:model.parent.hash\"},\"url\":\"{var:model.parentType}/view\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-08 16:23:28',	'2014-05-10 04:27:47',	NULL,	175,	1),
(523,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-08 16:23:28',	NULL,	1,	176,	1),
(524,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"label\":\"View parent\",\"url\":{\"0\":\"{var:model.parentType}/view\",\"id\":\"var:model.parent.hash\"}}]}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-08 16:23:28',	'2014-05-10 04:54:35',	1,	176,	1),
(525,	1,	'GJsonEditor',	'fields',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-08 16:23:28',	NULL,	2,	176,	1),
(526,	3,	'GFormWidget',	'formEnd',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-08 16:23:28',	NULL,	10,	176,	1),
(527,	1,	'GRedirect',	'redirect',	'',	'',	'{\"params\":{\"id\":\"var:model.parent.hash\"},\"url\":\"{var:model.parentType}/view\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-08 16:23:28',	'2014-05-10 04:27:59',	NULL,	177,	1),
(528,	1,	'GRedirect',	'redirect',	'',	'',	'{\"params\":{\"id\":\"var:model.parent.hash\"},\"url\":\"{var:model.parentType}/view\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-08 16:23:28',	'2014-05-10 04:28:09',	NULL,	178,	1),
(539,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 02:55:11',	'2014-05-10 05:10:43',	1,	194,	1),
(540,	1,	'GTextField',	'name',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 02:55:11',	'2014-05-10 05:10:43',	3,	194,	1),
(541,	1,	'GHiddenField',	'parentId',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 02:55:11',	'2014-05-10 05:10:43',	8,	194,	1),
(542,	1,	'GSubmitButton',	'submit',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 02:55:11',	'2014-05-10 05:10:43',	9,	194,	1),
(543,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 02:55:11',	'2014-05-10 05:10:43',	10,	194,	1),
(544,	1,	'GTag',	'name',	'',	'',	'{\"text\":\"Page<\\/h1>Name: {var:model.name}<\\/h2>\",\"tag\":\"span\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 02:55:11',	'2014-05-10 05:10:43',	1,	195,	1),
(545,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"label\":\"List pages\",\"url\":[\"page\\/list\"]},{\"label\":\"Create view element\",\"url\":{\"0\":\"pageElement\\/create\",\"parentId\":\"var:model.hash\"}}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 02:55:11',	'2014-05-10 05:10:44',	2,	195,	1),
(548,	1,	'GRedirect',	'redirect',	'',	'',	'{\"url\":\"page\\/list\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 02:55:12',	'2014-05-10 05:10:44',	NULL,	196,	1),
(549,	1,	'GRedirect',	'redirect',	'',	'',	'{\"params\":{\"id\":\"var:model.hash\"},\"url\":\"view\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 02:55:12',	'2014-05-10 05:10:44',	NULL,	197,	1),
(572,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 03:04:56',	NULL,	1,	194,	1),
(573,	1,	'GTextField',	'name',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 03:04:56',	NULL,	3,	194,	1),
(574,	1,	'GHiddenField',	'parentId',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 03:04:56',	NULL,	8,	194,	1),
(575,	1,	'GSubmitButton',	'submit',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 03:04:56',	NULL,	9,	194,	1),
(576,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 03:04:56',	NULL,	10,	194,	1),
(577,	1,	'GTag',	'name',	'',	'',	'{\"text\":\"Page</h1>Name: {var:model.name}</h2>\",\"tag\":\"span\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 03:04:56',	'2014-05-10 04:03:32',	1,	195,	1),
(578,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"label\":\"List pages\",\"url\":{\"0\":\"page/list\"}},{\"label\":\"Create view element\",\"url\":{\"0\":\"pageElement/create\",\"parentId\":\"var:model.hash\"}}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 03:04:56',	'2014-05-10 04:04:39',	2,	195,	1),
(579,	1,	'GViewDom',	'children',	'',	'',	'{\"url\":\"dom\\/import\\/type\\/view\\/id\\/{var:model.hash}\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 03:04:56',	NULL,	4,	195,	1),
(580,	1,	'GTable',	'list',	'',	'',	'{\"controllerUrl\":\"/gong/site/{var:model.childType}\",\"view\":false,\"fields\":\"*\",\"data\":\"var:model.children\",\"columns\":[{\"id\":\"mode\",\"editor\":\"textarea\"},{\"id\":\"id\",\"display\":false},{\"id\":\"name\",\"editor\":\"textarea\"},{\"id\":\"className\",\"editor\":\"textarea\"},{\"id\":\"view\",\"editor\":\"textarea\"},{\"id\":\"edit\",\"editor\":\"textarea\"},{\"id\":\"delete\",\"editor\":\"textarea\"},{\"id\":\"weight\",\"editor\":\"textarea\"},{\"id\":\"created\"},{\"id\":\"modified\"},{\"id\":\"actions\",\"field\":\"id\",\"formatter\":\"Actions\"}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 03:04:56',	'2014-05-10 04:14:07',	6,	195,	1),
(581,	1,	'GRedirect',	'redirect',	'',	'',	'{\"url\":\"page/list\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 03:04:56',	'2014-05-10 04:05:47',	NULL,	196,	1),
(582,	1,	'GRedirect',	'redirect',	'',	'',	'{\"params\":{\"id\":\"var:model.hash\"},\"url\":\"view\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 03:04:56',	NULL,	NULL,	197,	1),
(583,	1,	'GTag',	'name',	'',	'',	'{\"tag\":\"h1\",\"text\":\"Pages:\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 03:05:51',	'2014-05-10 03:06:43',	1,	198,	1),
(584,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"url\":[\"create\"],\"label\":\"Create Page\"}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 03:05:51',	'2014-05-10 04:03:07',	2,	198,	1),
(585,	1,	'GTable',	'list',	'',	'',	'{\"controllerUrl\":\"/gong/site/{var:controller.id}\",\"columns\":[{\"id\":\"id\",\"display\":false},{\"id\":\"name\",\"editor\":\"textarea\"},{\"field\":\"id\",\"id\":\"actions\",\"formatter\":\"Actions\"}],\"data\":\"var:data\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 03:05:51',	'2014-05-10 04:09:11',	3,	198,	1),
(586,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:56:41',	NULL,	1,	199,	1),
(587,	1,	'GTextField',	'name',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:56:41',	NULL,	3,	199,	1),
(588,	1,	'GHiddenField',	'parentId',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:56:41',	NULL,	8,	199,	1),
(589,	1,	'GSubmitButton',	'submit',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:56:41',	NULL,	9,	199,	1),
(590,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:56:41',	NULL,	10,	199,	1),
(591,	1,	'GTag',	'name',	'',	'',	'{\"text\":\"Page<\\/h1>Name: {var:model.name}<\\/h2>\",\"tag\":\"span\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:56:41',	NULL,	1,	200,	1),
(592,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"label\":\"List pages\",\"url\":[\"page\\/list\"]},{\"label\":\"Create view element\",\"url\":{\"0\":\"pageElement\\/create\",\"parentId\":\"var:model.hash\"}}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:56:41',	NULL,	2,	200,	1),
(593,	1,	'GViewDom',	'children',	'',	'',	'{\"url\":\"dom\\/import\\/type\\/view\\/id\\/{var:model.hash}\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:56:41',	NULL,	4,	200,	1),
(594,	1,	'GTable',	'list',	'',	'',	'{\"controllerUrl\":\"\\/gong\\/site\\/{var:model.childType}\",\"view\":false,\"fields\":\"*\",\"data\":\"var:model.children\",\"columns\":[{\"id\":\"mode\",\"editor\":\"textarea\"},{\"id\":\"id\",\"display\":false},{\"id\":\"name\",\"editor\":\"textarea\"},{\"id\":\"className\",\"editor\":\"textarea\"},{\"id\":\"view\",\"editor\":\"textarea\"},{\"id\":\"edit\",\"editor\":\"textarea\"},{\"id\":\"delete\",\"editor\":\"textarea\"},{\"id\":\"weight\",\"editor\":\"textarea\"},{\"id\":\"created\"},{\"id\":\"modified\"},{\"id\":\"actions\",\"field\":\"id\",\"formatter\":\"Actions\"}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:56:41',	NULL,	6,	200,	1),
(595,	1,	'GRedirect',	'redirect',	'',	'',	'{\"url\":\"page\\/list\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:56:41',	NULL,	NULL,	201,	1),
(596,	1,	'GRedirect',	'redirect',	'',	'',	'{\"params\":{\"id\":\"var:model.hash\"},\"url\":\"view\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:56:41',	NULL,	NULL,	202,	1),
(597,	1,	'GTag',	'name',	'',	'',	'{\"tag\":\"h1\",\"text\":\"Pages:\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:56:41',	NULL,	1,	203,	1),
(598,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"url\":[\"create\"],\"label\":\"Create Page\"}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:56:41',	NULL,	2,	203,	1),
(599,	1,	'GTable',	'list',	'',	'',	'{\"controllerUrl\":\"\\/gong\\/site\\/{var:controller.id}\",\"columns\":[{\"id\":\"id\",\"display\":false},{\"id\":\"name\",\"editor\":\"textarea\"},{\"field\":\"id\",\"id\":\"actions\",\"formatter\":\"Actions\"}],\"data\":\"var:data\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:56:41',	NULL,	3,	203,	1),
(600,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:58:37',	NULL,	1,	204,	1),
(601,	1,	'GTextField',	'mode',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:58:37',	NULL,	2,	204,	1),
(602,	1,	'GTextField',	'name',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:58:37',	NULL,	3,	204,	1),
(603,	1,	'GTextField',	'className',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:58:37',	NULL,	4,	204,	1),
(604,	1,	'GTextField',	'weight',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:58:37',	NULL,	5,	204,	1),
(605,	1,	'GHiddenField',	'parentId',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:58:37',	NULL,	18,	204,	1),
(606,	1,	'GSubmitButton',	'submit',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:58:37',	NULL,	19,	204,	1),
(607,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 04:58:37',	NULL,	20,	204,	1),
(608,	1,	'GRedirect',	'redirect',	'',	'',	'{\"params\":{\"id\":\"var:model.parent.hash\"},\"url\":\"{var:model.parentType}\\/view\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:58:37',	NULL,	NULL,	205,	1),
(609,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:58:37',	NULL,	1,	206,	1),
(610,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"label\":\"View parent\",\"url\":{\"0\":\"{var:model.parentType}\\/view\",\"id\":\"var:model.parent.hash\"}}]}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:58:37',	NULL,	1,	206,	1),
(611,	1,	'GJsonEditor',	'fields',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:58:37',	NULL,	2,	206,	1),
(612,	3,	'GFormWidget',	'formEnd',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:58:37',	NULL,	10,	206,	1),
(613,	1,	'GRedirect',	'redirect',	'',	'',	'{\"params\":{\"id\":\"var:model.parent.hash\"},\"url\":\"{var:model.parentType}\\/view\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:58:37',	NULL,	NULL,	207,	1),
(614,	1,	'GRedirect',	'redirect',	'',	'',	'{\"params\":{\"id\":\"var:model.parent.hash\"},\"url\":\"{var:model.parentType}\\/view\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 04:58:37',	NULL,	NULL,	208,	1),
(618,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-11 13:22:34',	1,	210,	1),
(619,	1,	'GTextField',	'name',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-11 13:22:34',	3,	210,	1),
(621,	1,	'GSubmitButton',	'submit',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-11 13:22:35',	9,	210,	1),
(622,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-11 13:22:35',	10,	210,	1),
(623,	1,	'GTag',	'name',	'',	'',	'{\"text\":\"<h1>{var:controller.label}<\\/h1><h2>Name: {var:model.name}<\\/h2>\",\"tag\":\"span\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-16 02:39:29',	0,	211,	1),
(624,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"label\":\"List {var:model.controllerId}s\",\"url\":[\"list\"]},{\"label\":\"Create {var:model.childModel.controllerId}\",\"url\":{\"0\":\"{var:model.childModel.controllerId}\\/create\",\"parentId\":\"var:model.hash\"}}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-16 02:39:29',	1,	211,	1),
(625,	1,	'GViewDom',	'children',	'',	'',	'{\"importUrl\":\"dom\\/batchImport\\/type\\/view\\/module\\/{var:model.module}\\/controller\\/{var:model.controller}\\/name\\/{var:model.name}\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 05:11:08',	'2014-05-16 02:39:29',	2,	211,	1),
(627,	1,	'GRedirect',	'redirect',	'',	'',	'{\"url\":\"var:model.deleteRedirect\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 05:11:08',	'2014-05-12 21:52:21',	NULL,	212,	1),
(628,	1,	'GRedirect',	'redirect',	'',	'',	'{\"url\":\"var:model.createRedirect\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 05:11:08',	'2014-05-12 23:39:07',	NULL,	213,	1),
(629,	1,	'GTag',	'name',	'',	'',	'{\"tag\":\"h1\",\"text\":\"{var:controller.label}s:\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-10 06:14:46',	1,	214,	1),
(630,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"url\":[\"create\"],\"label\":\"Create {var:controller.label}\"}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-10 06:16:56',	2,	214,	1),
(632,	1,	'GTextField',	'controller',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 06:17:55',	'2014-05-11 13:22:35',	4,	210,	1),
(633,	1,	'GTextField',	'module',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 06:18:20',	'2014-05-11 13:22:35',	5,	210,	1),
(643,	1,	'GTag',	'name',	'',	'',	'{\"tag\":\"h1\",\"text\":\"{var:controller.label}s:\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-11 15:25:08',	NULL,	1,	216,	1),
(644,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"url\":[\"create\"],\"label\":\"Create {var:controller.label}\"}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-11 15:25:08',	NULL,	2,	216,	1),
(645,	1,	'GTable',	'list',	'',	'',	'{\"actions\":[\"<a href=\\\"\\/gong\\/site\\/{var:model.childType}\\/update\\/id\\/{child:view.hash}\\\"><i class=\\\\\'glyphicon glyphicon-search\\\\\'><\\/i><\\/a>\"],\"controllerUrl\":\"\\/gong\\/site\\/{var:model.childType}\",\"columns\":[{\"id\":\"id\",\"display\":false},{\"id\":\"module\",\"editor\":\"textarea\"},{\"id\":\"controller\",\"editor\":\"textarea\"},{\"id\":\"name\",\"editor\":\"textarea\"},{\"field\":\"view.name\",\"id\":\"Parent\"},{\"field\":\"id\",\"id\":\"actions\",\"formatter\":\"Actions\"}],\"options\":{\"bFilter\":true},\"data\":\"var:data\"}',	NULL,	NULL,	'disabled',	'SUPER',	'',	'2014-05-11 15:25:09',	'2014-05-12 15:12:29',	3,	216,	1),
(646,	1,	'GGridView',	'grid',	'',	'',	'{\"columns\":\"var:model.gridColumns\",\"itemsCssClass\":\"table\",\"ajaxUpdate\":false,\"dataProvider\":\"var:dataProvider\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-11 23:07:30',	'2014-05-12 20:37:38',	3,	216,	1),
(648,	1,	'GGridView',	'grid',	'',	'',	'{\"columns\":\"var:model.gridColumns\",\"itemsCssClass\":\"table\",\"ajaxUpdate\":false,\"dataProvider\":\"var:dataProvider\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-12 17:37:17',	'2014-05-12 21:19:43',	4,	214,	1),
(649,	1,	'GGridView',	'grid',	'',	'',	'{\"columns\":\"var:model.childModel.gridColumns\",\"itemsCssClass\":\"table\",\"sortUrl\":\"{var:model.childModel.controllerId}\\/reorder\",\"sort\":true,\"dataProvider\":\"var:dataProvider\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-12 18:46:23',	'2014-05-16 02:39:29',	3,	211,	1),
(650,	2,	'GFormWidget',	'SignIn',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-13 03:13:20',	'2014-05-16 03:09:41',	0,	228,	1),
(651,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-13 03:13:48',	'2014-05-16 03:09:42',	15,	228,	1),
(652,	1,	'GTextField',	'username',	'',	'',	'{\"fieldOptions\":{\"class\":\"form-control input-large\"}}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-13 03:17:07',	'2014-05-16 03:09:41',	2,	228,	1),
(653,	1,	'GPasswordField',	'password',	'',	'',	'{\"fieldOptions\":{\"class\":\"form-control input-large\"}}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-13 03:18:25',	'2014-05-16 03:09:41',	5,	228,	1),
(654,	1,	'GSubmitButton',	'Submit',	'',	'',	'{\"buttonLabel\":\"translate:Login\",\"buttonOptions\":{\"class\":\"btn btn-large btn-info\"}}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-15 14:27:18',	'2014-05-16 03:09:42',	9,	228,	1),
(655,	1,	'GButton',	'rememberMe',	'',	'',	'{\"buttonLabel\":\"Stay signed in\",\"buttonOptions\":{\"class\":\"btn-large\",\"color\":\"danger\",\"toggle\":\"checkbox\"}}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-15 14:45:45',	'2014-05-16 03:09:42',	13,	228,	1),
(656,	1,	'GLink',	'signup',	'',	'',	'{\"htmlOptions\":{\"class\":\"btn btn-large btn-success\"},\"text\":\"Sign Up\",\"url\":\"\\/gong\\/user\\/registration\\/registration\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 00:04:40',	'2014-05-16 03:09:42',	10,	228,	1),
(657,	1,	'GLink',	'recovery',	'',	'',	'{\"htmlOptions\":{\"class\":\"btn btn-large btn-danger\"},\"text\":\"Lost password\",\"url\":\"\\/gong\\/user\\/registration\\/recovery\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 00:05:29',	'2014-05-16 03:09:42',	14,	228,	1),
(659,	1,	'GRedirect',	'redirect',	'',	'',	'{\"url\":\"var:model.updateRedirect\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 02:18:05',	NULL,	NULL,	229,	1),
(660,	2,	'GTag',	'Inline',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 02:42:44',	'2014-05-16 03:09:41',	1,	228,	1),
(661,	3,	'GTag',	'InlineClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 02:43:25',	'2014-05-16 03:09:41',	3,	228,	1),
(662,	2,	'GTag',	'Inline',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 02:44:58',	'2014-05-16 03:09:41',	4,	228,	1),
(663,	3,	'GTag',	'InlineClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 02:45:08',	'2014-05-16 03:09:42',	17,	228,	1),
(665,	3,	'GTag',	'InlineClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 02:54:17',	'2014-05-16 03:09:41',	6,	228,	1),
(666,	2,	'GTag',	'Inline',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 02:55:16',	'2014-05-16 03:09:42',	8,	228,	1),
(667,	3,	'GTag',	'InlineClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 03:03:43',	'2014-05-16 03:09:42',	11,	228,	1),
(668,	2,	'GTag',	'Inline',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 03:05:02',	'2014-05-16 03:09:42',	12,	228,	1),
(670,	3,	'GTag',	'',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 03:07:16',	'2014-05-16 03:09:42',	16,	228,	1),
(671,	2,	'GTag',	'',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 03:07:21',	'2014-05-16 03:09:41',	7,	228,	1);

DROP TABLE IF EXISTS `m2m_site_view_map`;
CREATE TABLE `m2m_site_view_map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL DEFAULT '*',
  `controller` varchar(255) NOT NULL DEFAULT '*',
  `name` varchar(255) NOT NULL DEFAULT '*',
  `parentModule` varchar(255) NOT NULL DEFAULT '*',
  `parentController` varchar(255) NOT NULL DEFAULT '*',
  `parentName` varchar(255) NOT NULL DEFAULT '*',
  `priority` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_site_view_map` (`id`, `module`, `controller`, `name`, `parentModule`, `parentController`, `parentName`, `priority`) VALUES
(97,	'*',	'*',	'*',	'*',	'model',	'*',	999),
(121,	'*',	'view',	'create',	'*',	'elementCollection',	'*',	1),
(122,	'*',	'viewElement',	'create',	'*',	'element',	'*',	1);

DROP TABLE IF EXISTS `m2m_textsettings`;
CREATE TABLE `m2m_textsettings` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `m2m_textsettings` (`id`, `language`, `text_email_registration`, `subject_email_registration`, `text_email_recovery`, `text_email_activation`, `text_friendship_new`, `text_friendship_confirmed`, `text_profilecomment_new`, `text_message_new`, `text_membership_ordered`, `text_payment_arrived`) VALUES
(1,	'en_us',	'Thank you for registering with IPP-Renewables the Bid Windows 3, 4 and 5 is open. After validating your details please kindly sign in and provide your project information. You can do this by clicking the following link:\n{activation_url}',	'IPP-Renewables User Registration',	'You have requested a new Password. To set your new Password,\n										please go to {recovery_url}',	'Your account has been activated. Thank you for registering. Please sign in to fill in Bid Window 3, 4 and 5.',	'New friendship Request from {username}: {message}. To accept or ignore this request, go to your friendship page: {link_friends} or go to your profile: {link_profile}',	'The User {username} has accepted your friendship request',	'You have a new profile comment from {username}: {message} visit your profile: {link_profile}',	'You have received a new message from {username}: {message}',	'Your order of membership {membership} on {order_date} has been taken. Your order \r\nNumber is {id}. You have choosen the payment style {payment}.',	'Your payment has been received on {payment_date} and your Membership {id} is now active'),
(2,	'de',	'Sie haben sich fÃÂÃÂÃÂÃÂ¼r unsere Applikation registriert. Bitte bestÃÂÃÂÃÂÃÂ¤tigen Sie ihre E-Mail adresse mit diesem Link: {activation_url}',	'Sie haben sich fÃÂÃÂÃÂÃÂ¼r eine Applikation registriert.',	'Sie haben ein neues Passwort angefordert. Bitte klicken Sie diesen link: {activation_url}',	'Ihr Konto wurde freigeschaltet.',	'Der Benutzer {username} hat Ihnen eine Freundschaftsanfrage gesendet. \n\n							 Nachricht: {message}\n\n							 Klicken sie <a href=\"{link_friends}\">hier</a>, um diese Anfrage zu bestÃÂÃÂÃÂÃÂ¤tigen oder zu ignorieren. Alternativ kÃÂÃÂÃÂÃÂ¶nnen sie <a href=\"{link_profile}\">hier</a> auf ihre Profilseite zugreifen.',	'Der Benutzer {username} hat ihre Freundschaftsanfrage bestÃÂÃÂÃÂÃÂ¤tigt.',	'\n							 Benutzer {username} hat Ihnen eine Nachricht auf Ihrer Pinnwand hinterlassen: \n\n							 {message}\n\n							 <a href=\"{link}\">hier</a> geht es direkt zu Ihrer Pinnwand!',	'Sie haben eine neue Nachricht von {username} bekommen: {\r\nmessage}',	'Ihre Bestellung der Mitgliedschaft {membership} wurde am {order_date} entgegen genommen. Die gewÃÂÃÂÃÂÃÂ¤hlte Zahlungsart ist {payment}. Die Auftragsnummer lautet {id}.',	'Ihre Zahlung wurde am {payment_date} entgegen genommen. Ihre Mitgliedschaft mit der Nummer {id} ist nun Aktiv.'),
(3,	'es',	'Te has registrado en esta aplicaciÃÂÃÂÃÂÃÂ³n. Para confirmar tu direcciÃÂÃÂÃÂÃÂ³n de correo electrÃÂÃÂÃÂÃÂ³nico, por favor, visita {activation_url}.',	'Te has registrado en esta aplicaciÃÂÃÂÃÂÃÂ³n.',	'Has solicitado una nueva contraseÃÂÃÂÃÂÃÂ±a. Para establecer una nueva contraseÃÂÃÂÃÂÃÂ±a, por favor ve a {activation_url}',	'Tu cuenta ha sido activada. Gracias por registrarte.',	'Has recibido una nueva solicitud de amistad de {user_from}: {message} Ve a tus contactos: {link}',	'Tienes un nuevo comentario en tu perfil de {username}: {message} visita tu perfil: {link}',	'Please translatore thisse hiere toh tha espagnola langsch {username}',	'Has recibido un mensaje de {username}: {message}',	'Tu orden de membresÃÂÃÂÃÂÃÂ­a {membership} de fecha {order_date} fuÃÂÃÂÃÂÃÂ© tomada. Tu nÃÂÃÂÃÂÃÂºmero de orden es {id}. Escogiste como modo de pago {payment}.',	'Tu pago fuÃÂÃÂÃÂÃÂ© recibido en fecha {payment_date}. Ahora tu MembresÃÂÃÂÃÂÃÂ­a {id} ya estÃÂÃÂÃÂÃÂ¡ activa'),
(4,	'fr',	'',	'',	'',	'',	'',	'',	'',	'',	'',	''),
(5,	'ro',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'');

DROP TABLE IF EXISTS `m2m_translation`;
CREATE TABLE `m2m_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'gong',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `translation` text CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `language` varchar(5) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `m2m_translation` (`id`, `category`, `message`, `translation`, `language`) VALUES
(6,	'gong',	'Terms And Conditions',	'Website Terms and Conditions of Use:       These Terms and Conditions (“the Terms and Conditions”) govern your  (“the User”) use of the MUSIC2EDIA (“Provider”) website located at the domain  name <a target=\"_blank\" rel=\"nofollow\" href=\"http://www.music2media.net\">www.music2media.net</a> (“the Website”).      By accessing and using the Website, the User agrees to be bound by  the Terms and Conditions set out in this legal notice. If the User does not  wish to be bound by these Terms and Conditions, the User may not access,  display, use, download, and/or otherwise copy or distribute Content obtained at  the Website.     Updating of these Terms  and Conditions:       Provider reserves the rights to change, modify, add to or remove  from portions or the whole of these Terms and Conditions from time to time.  Changes to these Terms and Conditions will become effective upon such changes  being posted to this Website. It is the User’s obligation to periodically check  these Terms and Conditions at the Website for changes or updates. The User’s  continued use of this Website following the posting of changes or updates will  be considered notice of the User’s acceptance to abide by and be bound by these  Terms and Conditions, including such changes or updates.     <span>Supplier of services  details:  <br><br>In accordance with the disclosure requirements of  the Electronic Communications and Transactions Act (“ECTA”), Act No 25 of 2005,  the supplier of goods and/or services offered for sale, hire or exchange by way  of an electronic transaction, makes the following information available to  consumers:</span>     <ul><li>Supplier is Music2Media CC (hereinafter referred to as “Supplier”),  a close corporation duly registered and existing under the laws of South Africa  with registration number: 2010/088984/23, with its physical address at No. 43  Pebble Lake, Florin Road, Wilgeheuwel. Supplier’s place of registration is No.  43 Pebble Lake, Florin Road, Wilgeheuwel and Supplier will accept legal service  at this given address. Supplier’s main member is: Mr. P Piegl. The main  business of Supplier is to facilitate the sharing of music-related content for  a closed group of subscribers and falls within the companies group of  Recreational, Cultural and Sporting Activities;</li>     </ul><ul><li>Supplier’s website is <a target=\"_blank\" rel=\"nofollow\" href=\"http://www.music2.media.net\">www.music2.media.net</a> and its contact details  are located on the above mentioned website.</li>     </ul><ul><li>Goods and/or Services: The main business of Supplier is to  facilitate the sharing of music-related content for a closed group of  subscribers.</li>     </ul><ul><li>Terms and conditions of download: The Consumer or User will be  liable for the full price or fees where applicable including transport costs,  taxes and any other fees or costs, guarantees, and where guarantees can be  accessed and downloaded by consumers where such tariffs, fees and or prices  will be specified on the website in relation to the goods and services  provided. Goods and services offered through this website by Supplier are  strictly on an “as is” basis for a price, fee and or tariff as shall be  indicated. Warranties and representations are hereby expressly excluded.  Downloaded files cannot be returned. In case of defect, User may notify  Supplier within 24 hours of becoming aware of defect by email to the following  address: peterpiegl@me.com. User’s cooling-off rights under s 44 of ECTA  do not apply in terms of s 42 of ECTA, due to downloads being audio, or video  recordings, or software or newspapers, periodicals, magazines or books. </li>     </ul><ul><li>Payment:  Payment may be made  online by credit card through a sufficiently secure payment system, or in the  case of Registered Users (corporate users only), by virtue of a monthly debit  order that can be arranged by calling the following number +2782 411 7430. The  payment system allows for review, corrections and withdrawal by User prior to  placing a final order.</li>     </ul><ul><li>Complaints and disputes:  Supplier offers Users to file complaints via the contacting the supplier on the  following email address peterpiegl@me.com. Currently, Supplier does not  subscribe to any alternative dispute resolution code or mechanism. </li>     </ul>Copyright and Intellectual  Property Rights:       Provider provides certain information at the Website. Content  currently or anticipated to be displayed at this Website is provided by  Provider, its affiliates and/or subsidiary, or any other third party owners of  such content, and includes but is not limited to Literary Works, Musical Works,  Artistic Works, Sound Recordings, Cinematograph Films, Sound and Television  Broadcasts, Program-Carrying Signals, Published Editions and Computer Programs  (“the Content”). All such proprietary works, and the compilation of the proprietary  works, belong to the Provider, its affiliates or subsidiary, or any third party  owners of such rights (“the Owners”), and the Content protected by South  African and International copyright laws. The Providers reserve the right to  make any changes to the Website, the Content, or to products and/or services  offered through the Website at any times and without notice. All rights in and  to the Content is reserved and retained by the Owners. Except as specified in  these Terms and Conditions, the User is not granted a license or any other  right including without limitation under Copyright, Trademark, Patent or other  Intellectual Property Rights in or to the Content.     Limited License to General  Users:     <ul><li>Provider grants to the User,  subject to the further terms of these Terms and Conditions, a non-exclusive,  non-transferable, limited and revocable right to access, display, use, download  and otherwise copy the current and future Content for personal, non-commercial  and information purposes only. </li>     </ul><ul><li>This Website and the Content  may not be reproduced, duplicated, copied, resold, visited or otherwise  exploited for any commercial purpose without the express prior written consent  of Provider/Supplier.</li>     </ul><ul><li>The license does not allow the  User to collect product or service listings, descriptions or other information  displayed here, and does not allow any derivative use of this Website or the  Content for the benefit of another merchant.</li>     </ul><ul><li>The User may not frame nor use  framing technologies to enclose the Provider Website or the Content nor any  part thereof without the express written consent of Provider.</li>     </ul><ul><li>Provider and the Owners do not  offer products or services to minors. If you are under the age of 18, you may  not respond to or otherwise accept or act upon any offers in the Website. </li>     </ul><ul><li>Provider and the Owners, their  affiliates or subsidiary reserve the right to refuse service, terminate  accounts, remove or edit content, or cancel orders in their sole discretion.</li>     </ul><ul><li>Any unauthorised use terminates  this license.</li>     </ul>Limited License to  Registered Users:     Provider allows and processes the  registration of certain corporate users (“the Registered User”) at the Website.  If you believe that you are entitled to registration, please contact  peter@music2mendia.net     <ul><li>Subject to the further terms of  these Terms and Conditions, a non-exclusive, non-transferable, limited and  revocable right is granted to Registered Users to access, display, use,  download and otherwise copy the current and future Content for the purposes  agreed to by the Registered User and Provider in their respective agreements.</li>     </ul><ul><li>This Website and the Content  may only be reproduced, duplicated, copied, resold, visited or otherwise  exploited for the specific purposes set out in that agreement.</li>     </ul><ul><li>The license does not allow the Registered  User to collect product or service listings, descriptions or other information  displayed here, and does not allow any derivative use of this Website or the  Content for the benefit of another merchant.</li>     </ul><ul><li>The Registered User may not  frame nor use framing technologies to enclose the Provider Website or the  Content nor any part thereof without the express written consent of Provider.</li>     </ul><ul><li>Provider and the Owners, their  affiliates or subsidiary reserve the right in their sole discretion to refuse  service, terminate accounts, remove or edit content, or cancel orders in their  sole discretion.</li>     </ul><ul><li>Any unauthorised use terminates  this license.</li>     </ul>Limitation of liability:       Subject to sub-sections 43(5) and 43 (6) of ECTA, if applicable, and  to the extent permitted by law, the Website and all Content on the Website,  including any current or future offer of products or services, are provided on  an “as is” basis, and may include inaccuracies or typographical errors and  Provider, Owners, suppliers, employees, directors partners, affiliates and  agents shall not be liable for any damage, or loss or liability of any nature  incurred by whoever as a result of any action or omission.<br>The Owners make no  warranty or representation as to the availability, accuracy or completeness of  the Content, or any third-party content accessible via an Internet link.  Neither Provider nor any holding company, affiliate or subsidiary of Provider  or Owners, shall be held responsible for any direct or indirect special,  consequential or other damage of any kind whatsoever suffered or incurred,  related to the use of, or the inability to access or use the Content or the  Website or any functionality thereof, or of any linked website, even if  Provider is expressly advised thereof.<br>Privacy, access to and use  of information:       <span>Provider allows you  to visit this website without telling the Provider who you are or revealing any  personal information about yourself, the User. However, you, the User, should  be aware that anonymous visitor information such as your IP address, browser  type, referring pages and pages visited on the website may be automatically  collected for statistical analysis of web traffic patterns.<br></span>     Provider receives various types of information (“the Information”)  from Users who access the Website, including personal information as detailed  in the Promotion of Access to Information Act (“PAIA”), Act 2 of 2000, and as  detailed in s 1 of ECTA (hereinafter referred to “Personal Information”).<br>Provider may electronically collect, store and use Personal Information,  including such information as your IP address, browser type, referring pages and  pages visited on the website for statistical analysis of web traffic patterns.      Provider voluntarily subscribes to s 51 of ECTA and endeavours to  treat Personal Information received by Provider accordingly. Whenever User is  of the opinion that Provider fails to comply with s 51 of ECTA, User shall  contact Provider by sending an email to peter@music2mendia.net.<br>Provider will  review User’s representations made by email and, if within Provider’s sole and  absolute discretion advisable, take corrective action and in any event within  30 days respond to User, informing User about corrective actions taken, if any.      Despite such undertaking, it is possible for Internet-based  communications to be intercepted. Without the use of encryption, the Internet  is not a secure medium and privacy cannot be ensured. Internet e-mail is  vulnerable to interception and forging.<br>The Owners will not be responsible for  any damages you or any third party may suffer as a result of the transmission  of confidential or disclosed information that you make to the Owners and/or  Provider through the Internet, or that you expressly or implicitly authorise  the Owners to make, or for any errors or any changes made to any transmitted  information. To ensure acquaintance with and awareness of the privacy measures  and policies of Provider, the User is urged to take care to read and understand  the underlying privacy clauses incorporated in these Terms and Conditions:     Privacy:  casual  surfing     The User may visit the Website without providing any personal  information. The User accordingly hereby grants express written permission for  the Website servers in such instances collecting the IP address of the User  computer, but not the email address or any other distinguishing information.<br>This information is aggregated to measure the number of visits, average time  spent at the Website, pages viewed, etc. Provider uses this information to  determine use of the Website, and to improve content thereon. Provider assumes  no obligation to protect this information, and may copy, distribute or otherwise  use such information without limitation     Privacy:  unsolicited  information      If the User posts unsolicited content or other information (“the  Information”) to the Website, and unless otherwise indicated, then the User  grants to the Owners a non-exclusive, royalty-free, perpetual, irrevocable, and  fully sub-licensable right to use, reproduce, modify, adapt, publish, translate,  create derivative works from, distribute, and display such Information  throughout the world in any media.<br>The User grants to the Owners the right to  use the name that the User submits in connection with such Information, if they  choose. The User warrants that the User owns or otherwise controls all of the  rights to the Information that the User posts; that the Information is  accurate; that by the supply of the Information to Provider, the User does not  violate this Policy and does not infringe the rights of any person or entity;  and that the User indemnifies the Owners for all claims resulting from the  receipt by Provider of the Information the User supplies to it. Provider  reserves the right but not the obligation to monitor and edit or remove any  Information, where posted to public pages.<br>Provider takes no responsibility,  and assumes no liability for any Information posted by the User or any third  party.     Privacy:  solicited  information the User gives to Provider     Provider requires certain Personal Information necessary to process  transactions if the User requires any of Provider’s products or services.<br>Provider receives and stores all Information, including Personal Information  which the User enters on the Website or gives to Provider, in any other way. The  User may choose not to provide certain Personal Information, but that may limit  the services or products that the User may wish to obtain from this Provider.<br>Provider provides its products and services in conjunction with its affiliates  and subsidiaries. In this regard and unless specifically restricted by the User  from the license below, the User hereby and when entering into the specific  transactions in question expressly grants in writing to the Owners and the  Provider a non-exclusive, royalty-free, perpetual, irrevocable, and fully  sub-licensable right to use, reproduce, modify, adapt, publish, translate,  create derivative works from, distribute, and display such Information  throughout the world in any media for any purpose whatsoever, including without  limitation for example transactions with user, registration of user, etc. The  User’s Information that is required by affiliates and subsidiaries to give  effect to transactions that the User chooses to enter into is shared with those  entities.<br>Privacy:  promotional  information     Provider aspires to provide first-class  service to its customers, which necessitates Provider providing information to  the User regarding new services or special offers. In each instance, the User  is provided an opportunity to opt-out of such information circulars. For more  information send an email to   peter@music2mendia.net<br>Privacy:  business  transfers     Provider may enter into business arrangements whereby its customer  base is one of the more valued assets. In such an event, customer Information  will be one of the transferable assets.     Privacy:  lawful  purposes     When the Provider is served with due legal process requiring the  delivery of Personal Information, it has the legal duty to abide by that  demand, and will do so.<br>Provider may also impart Personal Information if  permitted or required to do so by law.     Privacy:  surveys  and statistical profiles     Provider understands that efficiency and customer care translates to  good service.<br>Provider may periodically conduct online customer care surveys to  facilitate the updating of service standards. When it conducts a survey,  Provider will inform the User how the information gathered will be used, and  will provide the User with the opportunity to opt-out from such surveys.<br>Notwithstanding the foregoing, Provider may chose to use Personal Information  to compile profiles for statistical purposes and may chose to trade with such  profiles and statistical data, as long as the profiles or statistical data  cannot be linked to any specific data subject, including the User, by a third  party.     Privacy:  storage     Personal Information will be stored for as long as it is used and  for a period of one year (twelve months) thereafter, together with a record of  the Personal Information and the specific purposes it was collected for.  Personal Information will be first be anonymized and then destroyed once it has  become obsolete.<br>Privacy:  interception     Subject to the Regulation of Interception of Communications Act  (“RICA”), Act no 70 of 2002, User agrees that Provider may intercept, block,  read, delete, disclose and use all communications sent or otherwise  communicated to Provider, its employees, directors and agents. User agrees that  his or her consent satisfies the requirements of ECTA and RICA for consent in  “writing” as defined.     Choice of Law:       This Website is controlled, operated and administered by Provider  from its offices as set out below within the Republic of South Africa. The  Providers make no representation that the Content is appropriate or available  for use in other locations or countries other than the Republic of South  Africa. Access to the Website from territories or countries where the Content  is illegal is prohibited. The User may not use this Website in violation of  South African export laws and regulations. If the User accesses this Website  from locations outside of South Africa, that User is responsible for compliance  with all local laws. These Terms and Conditions shall be governed by the laws  of the Republic of South Africa, and the User consents to the jurisdiction of  the appropriate court within the Republic of South Africa in the event of any  dispute. If any of the provisions of these Terms and Conditions are found by a  court of competent jurisdiction to be invalid or unenforceable, that provision  shall be enforced to the maximum extent permissible so as to give effect to the  intent of these Terms and Conditions, and the remainder of these Terms and  Conditions shall continue in full force and effect.<br><br>These Terms and Conditions  constitute the entire agreement between the Provider and the User with regard  to the use of the Content and this Website.     Contact  Details:       In the event that you need to contact Provider/Supplier for purposes  related to these Terms and Conditions, please use the following:     <br><br>Email: peterpiegl@me.com     <span>Physical Address:<br>43 Pebble  Lake, Florin Road, Wilgeheuwel,</span>     <span>Postal Address:<br>P O Box  1445, Wilgeheuwel, 1735</span>     © MUSIC2MEDIA (2010)<br>',	'en'),
(7,	'gong',	'test',	'asdf123',	'en');

DROP TABLE IF EXISTS `m2m_user`;
CREATE TABLE `m2m_user` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `m2m_user` (`id`, `username`, `password`, `salt`, `activationKey`, `createtime`, `lastvisit`, `lastaction`, `lastpasswordchange`, `superuser`, `status`, `approved`, `published`, `avatar`, `notifyType`) VALUES
(1,	'admin',	'2d92aead1ecbd68b81e67844abcbea02325dc4c760e9afb155ac9560e96a24008597014acfbc179e4e43a9cb63dee64d33ff6ff795f9f5f7337027eb19bae8e4',	'1cKpqyPTh3pnytonuQzaxIomnzuLwDVN/rhfCtF78pmyPlB7oSwV2SVvI0pjsuXdsIkrUM+4xcwi4oM8BZG+wg==',	'edbd335ae87994b37ed2a9211183a4425c20d186f66ec3ac060f914778c6544eb0da45c783ec68587720148f7c7d2beba2ffb1e40843624146cce5370f0e24f5',	1335171345,	1400202830,	1400203134,	0,	1,	1,	0,	1,	'',	'Instant'),
(2,	'peter',	'2b7d157bdf6b0968c69695d8d1d3eb95a495bbd98d1bbe3da52167ae0689cbdce8d1fb32102052632bf1a4b6f2547d715fbf48b4701df42d0ed7d9b43604576b',	'iVz0Sl+EWFq+KjhL6cHIS+pYMIcZtBdiaFgqTvOFzfkGymGpod65wQCQNJzWsL5jOQ2C1SVCHWpdHYf9wn8H+g==',	'1',	1394197762,	1395658986,	0,	1394197762,	0,	1,	1,	1,	NULL,	'Instant'),
(35,	'r',	'6a25e7028a5c8e7e110c8190c9fabfc0d29620427a0970d1497ca8f914de75241e9ca5cb3e83b0976f488753206ad160122db612bf2a9a96507914407d77ea14',	'26JlJs3mfteUkKoGPymmgbeW7Tt28DHeoZKHZhrWrbFx/FfOkLn4pzZKceSilyUUADFNuWu4ALxdx7ugMrXrUA==',	'1',	1392452435,	1398260339,	1398262368,	1392452435,	0,	1,	1,	1,	NULL,	'Instant'),
(36,	'p',	'3194f54fe3645c63c9a2d9429031ee0db7133cf9bdd02d0c6652915fd08e0c690e5e49df70457a84c083ea342e8380f40c9d9b1d560f9032e167dc4431258a1a',	'THfa/Demy74kFNr8yip8lTH6ATWAIIVUNT/cgtLJSA+3uUEq8tkHEUtrnQRw1QXy6jvlr9n/3qzZV3W1CatdHA==',	'f1474bf56f49fc02a2eaf0a1de3c6129b3e33823d71d5335b8d6d15b559db4448f3c2953246cd25a1a6f848bffc820bc8d752f750f1f8f4a82631fc336f700a0',	1392647405,	1398260307,	1398260331,	1392647405,	0,	1,	1,	1,	NULL,	'Instant'),
(37,	'test',	'7e7db0d285a87ce52d73306f7c5b807bdf0398f3f731d1781972d8e8bbf2658b7e0687c934c9283cb6d86bc8a91147f8500dee1b0787c90bab5cfd4b938adb51',	'J/0VSG62r4ZFj1V9WM6pGW9O4Pr/4hC+22M8FwbA/TaY2ZaMu3OJAz/GUggEPVT1FIpy05VIf1cpB6N3AEsqqg==',	'4b698363769798c95be6bd798c61f2a7699400ce36d86086c53ed5435c45e1f1a526a0184309a14993a0fd0323ac9b96ea8a7b83730117618b52da2209811113',	1392783259,	0,	0,	1392783259,	0,	1,	1,	1,	NULL,	'Instant'),
(38,	'djAllie',	'2d92aead1ecbd68b81e67844abcbea02325dc4c760e9afb155ac9560e96a24008597014acfbc179e4e43a9cb63dee64d33ff6ff795f9f5f7337027eb19bae8e4',	'1cKpqyPTh3pnytonuQzaxIomnzuLwDVN/rhfCtF78pmyPlB7oSwV2SVvI0pjsuXdsIkrUM+4xcwi4oM8BZG+wg==',	'c46ded904d927ceaf95b464a40c4b3e855716f98fa826f60008104b08dac3f2d6502e52b3bb5cd70c1d8ae2915df6ad4eeebdd0e886c25cb63dc8e1a690c2a98',	1395058060,	0,	1395058497,	1395058060,	0,	1,	0,	1,	NULL,	'Instant');

DROP TABLE IF EXISTS `m2m_userTest`;
CREATE TABLE `m2m_userTest` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `m2m_userTest` (`id`, `created`, `modified`, `userId`, `username`, `email`, `password`, `retypePassword`, `role`, `capatcha`, `termsAndConditions`) VALUES
(1,	'2014-03-07',	'0000-00-00',	0,	'peter',	'almagestfraternite@gmail.com',	'almagest',	'almagest',	'reporter',	'fiwiyu',	'1'),
(2,	'2014-03-07',	'0000-00-00',	0,	'peter',	'almagestfraternite@gmail.com',	'almagest',	'almagest',	'reporter',	'fiwiyu',	'1'),
(3,	'2014-03-17',	'0000-00-00',	0,	'DJ Allie',	'alistair@searchfusion.co.za',	'123!Slam',	'123!Slam',	'producer',	'fizexo',	'1'),
(4,	'2014-03-17',	'0000-00-00',	0,	'DJ Allie',	'alistair@searchfusion.co.za',	'123!slam',	'123!slam',	'producer',	'fff',	'0'),
(5,	'2014-03-17',	'0000-00-00',	0,	'DJ ALlie',	'alistair@searchfusion.co.za',	'123!Slam',	'123!slam',	'producer',	'asdasd',	'0'),
(6,	'2014-03-17',	'0000-00-00',	0,	'djAllie',	'alistair@searchfusion.co.za',	'123!Slam',	'123!Slam',	'producer',	'fizexo',	'1'),
(7,	'2014-03-17',	'0000-00-00',	0,	'djAllie',	'alistair@searchfusion.co.za',	'123!Slam',	'12312313',	'producer',	'fizexo',	'1');

DROP TABLE IF EXISTS `m2m_user_group`;
CREATE TABLE `m2m_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `participants` text,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `m2m_user_group_message`;
CREATE TABLE `m2m_user_group_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `m2m_user_role`;
CREATE TABLE `m2m_user_role` (
  `userId` int(10) unsigned NOT NULL,
  `roleId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `m2m_user_role` (`userId`, `roleId`) VALUES
(2,	11),
(2,	12),
(2,	13),
(2,	14),
(2,	15),
(2,	16),
(2,	17);

DROP TABLE IF EXISTS `m2m_visit`;
CREATE TABLE `m2m_visit` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `m2m_vote`;
CREATE TABLE `m2m_vote` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (postId) REFERENCES m2m_item(id)',
  `userId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (userId) REFERENCES m2m_user(id)',
  `approve` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `m2m_vote` (`id`, `fileId`, `userId`, `approve`) VALUES
(1,	53,	4,	0);

DROP TABLE IF EXISTS `tbl_migration`;
CREATE TABLE `tbl_migration` (
  `version` varchar(255) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `tbl_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base',	1377335738),
('m130801_123544_drawing_refactor',	1377605385),
('m130830_083838_pagedescription',	1377852134),
('m130830_084322_post_tables',	1377852628),
('m130830_092934_remove_garticle',	1377855245),
('m130830_094328_add_fontawesome',	1377855972),
('m130830_104518_add_garticle',	1377859991),
('m130830_124807_remove_friend',	1377866940);

DROP TABLE IF EXISTS `YiiSession`;
CREATE TABLE `YiiSession` (
  `id` char(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `YiiSession` (`id`, `expire`, `data`) VALUES
('pm31mgks4h2ptbafmbf4tbia75',	1400238168,	'');

-- 2014-05-16 12:03:06