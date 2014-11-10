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


DROP TABLE IF EXISTS `livescores_account`;
CREATE TABLE `livescores_account` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `size` bigint(40) NOT NULL,
  `userId` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `livescores_account` (`id`, `size`, `userId`, `created`, `modified`) VALUES
(1,	2749642830,	1,	'0000-00-00 00:00:00',	'2014-09-08 13:49:31'),
(2,	32354677,	36,	'0000-00-00 00:00:00',	'2014-04-12 00:35:50'),
(3,	8260697,	2,	'2014-03-14 13:53:52',	'2014-03-14 13:54:16');

DROP TABLE IF EXISTS `livescores_action`;
CREATE TABLE `livescores_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `comment` text,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `livescores_action` (`id`, `title`, `comment`, `subject`) VALUES
(28,	'GUserUpdate',	NULL,	NULL),
(29,	'GInvoiceUpdate',	NULL,	NULL),
(30,	'GAccountUpdate',	NULL,	NULL),
(31,	'GTranslationUpdate',	NULL,	NULL);

DROP TABLE IF EXISTS `livescores_custom_url`;
CREATE TABLE `livescores_custom_url` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(256) NOT NULL,
  `url` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `livescores_custom_url` (`id`, `path`, `url`) VALUES
(1,	'/page/post/admin',	'/newspaper');

DROP TABLE IF EXISTS `livescores_file`;
CREATE TABLE `livescores_file` (
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

INSERT INTO `livescores_file` (`id`, `type`, `filename`, `mime`, `created`, `modified`, `weight`, `view`, `edit`, `delete`, `userId`) VALUES
(195,	'video',	'final_2.mp4',	'',	'2014-08-15 19:41:59',	NULL,	NULL,	'P',	'P',	'P',	1),
(316,	'data',	'',	'',	'2014-09-02 23:09:42',	NULL,	NULL,	'P',	'P',	'P',	1),
(317,	'video',	'TF2-In-10-Seconds-SFM---YouTube.mp4',	'',	'2014-09-03 07:26:35',	NULL,	NULL,	'P',	'P',	'P',	1);

DROP TABLE IF EXISTS `livescores_file_audio`;
CREATE TABLE `livescores_file_audio` (
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


DROP TABLE IF EXISTS `livescores_file_image`;
CREATE TABLE `livescores_file_image` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `alt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `livescores_file_video`;
CREATE TABLE `livescores_file_video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `livescores_file_video` (`id`, `fileId`) VALUES
(63,	288),
(62,	195),
(61,	194),
(60,	193),
(59,	192),
(58,	191),
(57,	190),
(56,	189),
(55,	187),
(54,	186),
(53,	185),
(31,	162),
(32,	163),
(33,	164),
(34,	165),
(35,	0),
(36,	167),
(37,	169),
(38,	170),
(39,	171),
(40,	172),
(41,	173),
(42,	174),
(43,	175),
(44,	176),
(45,	177),
(46,	178),
(47,	179),
(48,	180),
(49,	181),
(50,	182),
(51,	183),
(52,	184),
(64,	291),
(65,	292),
(66,	293),
(67,	294),
(68,	295),
(69,	296),
(70,	297),
(71,	298),
(72,	299),
(73,	300),
(74,	302),
(75,	303),
(76,	304),
(77,	317);

DROP TABLE IF EXISTS `livescores_form`;
CREATE TABLE `livescores_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `livescores_form` (`id`, `name`, `created`, `modified`, `elementId`) VALUES
(1,	'registration',	'2013-11-20',	'2014-03-02',	0);

DROP TABLE IF EXISTS `livescores_friendship`;
CREATE TABLE `livescores_friendship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inviterId` int(11) NOT NULL,
  `friendId` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `livescores_friendship` (`id`, `inviterId`, `friendId`, `status`, `modified`, `created`, `message`) VALUES
(7,	35,	36,	2,	NULL,	'2014-03-04 00:24:42',	''),
(8,	1,	36,	1,	NULL,	'2014-06-29 16:16:02',	'');

DROP TABLE IF EXISTS `livescores_invoice`;
CREATE TABLE `livescores_invoice` (
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

INSERT INTO `livescores_invoice` (`id`, `size`, `rate`, `userId`, `created`, `sent`, `paid`) VALUES
(4,	3074048,	2,	1,	'0000-00-00 00:00:00',	0,	0),
(5,	239554107,	23,	1,	'2014-06-29 16:15:33',	0,	0);

DROP TABLE IF EXISTS `livescores_membership`;
CREATE TABLE `livescores_membership` (
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

INSERT INTO `livescores_membership` (`id`, `roleId`, `userId`, `payment_id`, `order_date`, `end_date`, `name`, `street`, `zipcode`, `city`, `payment_date`, `subscribed`) VALUES
(9,	12,	35,	1,	1392452436,	2147483647,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(12,	11,	36,	1,	1392452436,	2147483647,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(13,	12,	38,	1,	1394197780,	2147483647,	NULL,	NULL,	NULL,	NULL,	NULL,	0),
(14,	11,	38,	1,	1395058062,	2147483647,	NULL,	NULL,	NULL,	NULL,	NULL,	0);

DROP TABLE IF EXISTS `livescores_message`;
CREATE TABLE `livescores_message` (
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

INSERT INTO `livescores_message` (`id`, `created`, `modified`, `fromUserId`, `toUserId`, `subject`, `message`, `read`, `answered`, `draft`) VALUES
(9,	'2014-03-04 10:02:25',	'2014-03-07 12:37:59',	35,	36,	'test',	'321',	1,	0,	0),
(11,	'2014-06-30 10:50:49',	'0000-00-00 00:00:00',	1,	1,	'sdfg',	'asdf',	0,	0,	0),
(12,	'2014-06-30 16:30:28',	'2014-06-30 16:31:40',	35,	36,	'asdf',	'asdf',	1,	0,	0);

DROP TABLE IF EXISTS `livescores_payment`;
CREATE TABLE `livescores_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `livescores_payment` (`id`, `title`, `text`) VALUES
(1,	'Prepayment',	NULL),
(2,	'Paypal',	NULL);

DROP TABLE IF EXISTS `livescores_permission`;
CREATE TABLE `livescores_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `actionId` int(11) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `livescores_permission` (`id`, `roleId`, `actionId`, `description`) VALUES
(1,	13,	28,	NULL),
(2,	14,	30,	NULL),
(3,	15,	29,	NULL),
(4,	16,	31,	NULL);

DROP TABLE IF EXISTS `livescores_post`;
CREATE TABLE `livescores_post` (
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

INSERT INTO `livescores_post` (`id`, `title`, `summary`, `content`, `view`, `edit`, `delete`, `created`, `modified`, `coverId`, `userId`) VALUES
(146,	'Title',	'Biatch',	NULL,	'P',	'P',	'*',	'2014-03-14 13:53:21',	'2014-03-14 13:53:35',	NULL,	2),
(154,	'Click here to enter a titleasdf',	'Click here enter a brief summaryasdf',	'fasdClick here enter a post content',	'P',	'P',	'*',	'2014-04-11 16:50:59',	'2014-06-30 16:32:03',	NULL,	36),
(184,	'',	NULL,	NULL,	'P',	'P',	'P',	'2014-09-02 23:09:19',	NULL,	NULL,	1);

DROP TABLE IF EXISTS `livescores_post_file`;
CREATE TABLE `livescores_post_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `postId` int(11) NOT NULL,
  `fileId` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `livescores_post_file` (`id`, `type`, `postId`, `fileId`, `weight`) VALUES
(975,	'data',	174,	70,	NULL),
(976,	'audio',	174,	71,	NULL),
(977,	'image',	174,	72,	NULL),
(1026,	'audio',	154,	122,	NULL),
(1030,	'image',	178,	126,	NULL),
(1031,	'image',	178,	127,	NULL),
(1076,	'video',	179,	178,	NULL),
(1080,	'video',	180,	182,	NULL),
(1081,	'video',	180,	183,	NULL),
(1082,	'video',	180,	184,	NULL),
(1083,	'video',	180,	185,	NULL),
(1084,	'video',	180,	186,	NULL),
(1085,	'video',	180,	187,	NULL),
(1086,	'data',	180,	188,	NULL),
(1087,	'video',	180,	189,	NULL),
(1088,	'video',	180,	190,	NULL),
(1089,	'video',	180,	191,	NULL),
(1090,	'video',	180,	192,	NULL),
(1091,	'video',	180,	193,	NULL),
(1092,	'video',	180,	194,	NULL),
(1093,	'audio',	180,	196,	NULL),
(1094,	'audio',	180,	197,	NULL),
(1095,	'image',	180,	198,	NULL),
(1096,	'image',	180,	199,	NULL),
(1097,	'image',	180,	200,	NULL),
(1098,	'image',	180,	201,	NULL),
(1099,	'image',	180,	202,	NULL),
(1100,	'image',	180,	203,	NULL),
(1101,	'image',	180,	204,	NULL),
(1102,	'audio',	180,	205,	NULL),
(1103,	'audio',	180,	206,	NULL),
(1104,	'audio',	180,	207,	NULL),
(1105,	'audio',	180,	208,	NULL),
(1106,	'audio',	180,	209,	NULL),
(1107,	'audio',	180,	210,	NULL),
(1108,	'data',	180,	211,	NULL),
(1109,	'audio',	180,	212,	NULL),
(1110,	'audio',	180,	213,	NULL),
(1111,	'audio',	180,	214,	NULL),
(1112,	'audio',	180,	215,	NULL),
(1113,	'image',	180,	216,	NULL),
(1114,	'audio',	180,	217,	NULL),
(1115,	'audio',	180,	218,	NULL),
(1116,	'audio',	180,	219,	NULL),
(1117,	'audio',	180,	220,	NULL),
(1118,	'audio',	180,	221,	NULL),
(1119,	'audio',	180,	222,	NULL),
(1120,	'audio',	180,	223,	NULL),
(1121,	'audio',	180,	224,	NULL),
(1122,	'audio',	180,	225,	NULL),
(1123,	'audio',	180,	226,	NULL),
(1124,	'audio',	180,	227,	NULL),
(1125,	'audio',	180,	228,	NULL),
(1126,	'audio',	180,	229,	NULL),
(1127,	'audio',	180,	230,	NULL),
(1128,	'audio',	180,	231,	NULL),
(1129,	'audio',	180,	232,	NULL),
(1130,	'audio',	180,	233,	NULL),
(1131,	'audio',	180,	234,	NULL),
(1132,	'audio',	180,	235,	NULL),
(1133,	'audio',	180,	236,	NULL),
(1134,	'data',	180,	237,	NULL),
(1135,	'audio',	180,	238,	NULL),
(1136,	'audio',	180,	239,	NULL),
(1137,	'audio',	180,	240,	NULL),
(1138,	'audio',	180,	241,	NULL),
(1139,	'audio',	182,	242,	NULL),
(1140,	'audio',	182,	243,	NULL),
(1141,	'image',	182,	244,	NULL),
(1142,	'image',	182,	245,	NULL),
(1143,	'image',	182,	246,	NULL),
(1144,	'image',	182,	247,	NULL),
(1145,	'image',	182,	248,	NULL),
(1146,	'image',	182,	249,	NULL),
(1147,	'image',	182,	250,	NULL),
(1148,	'audio',	182,	251,	NULL),
(1149,	'audio',	182,	252,	NULL),
(1150,	'audio',	182,	253,	NULL),
(1151,	'audio',	182,	254,	NULL),
(1152,	'audio',	182,	255,	NULL),
(1153,	'audio',	182,	256,	NULL),
(1154,	'data',	182,	257,	NULL),
(1155,	'audio',	182,	258,	NULL),
(1156,	'audio',	182,	259,	NULL),
(1157,	'audio',	182,	260,	NULL),
(1158,	'audio',	182,	261,	NULL),
(1159,	'image',	182,	262,	NULL),
(1160,	'audio',	182,	263,	NULL),
(1161,	'audio',	182,	264,	NULL),
(1162,	'audio',	182,	265,	NULL),
(1163,	'audio',	182,	266,	NULL),
(1164,	'audio',	182,	267,	NULL),
(1165,	'audio',	182,	268,	NULL),
(1166,	'audio',	182,	269,	NULL),
(1167,	'audio',	182,	270,	NULL),
(1168,	'audio',	182,	271,	NULL),
(1169,	'audio',	182,	272,	NULL),
(1170,	'audio',	182,	273,	NULL),
(1171,	'audio',	182,	274,	NULL),
(1172,	'audio',	182,	275,	NULL),
(1173,	'audio',	182,	276,	NULL),
(1174,	'audio',	182,	277,	NULL),
(1175,	'audio',	182,	278,	NULL),
(1176,	'audio',	182,	279,	NULL),
(1177,	'audio',	182,	280,	NULL),
(1178,	'audio',	182,	281,	NULL),
(1179,	'audio',	182,	282,	NULL),
(1180,	'data',	182,	283,	NULL),
(1181,	'audio',	182,	284,	NULL),
(1182,	'audio',	182,	285,	NULL),
(1183,	'audio',	182,	286,	NULL),
(1184,	'audio',	182,	287,	NULL),
(1200,	'video',	183,	302,	NULL),
(1201,	'video',	183,	303,	NULL),
(1202,	'video',	183,	304,	NULL),
(1203,	'data',	183,	306,	NULL),
(1204,	'data',	183,	307,	NULL),
(1205,	'data',	183,	308,	NULL),
(1206,	'data',	183,	309,	NULL),
(1207,	'data',	183,	310,	NULL),
(1208,	'data',	183,	311,	NULL),
(1209,	'data',	183,	312,	NULL),
(1210,	'data',	183,	313,	NULL),
(1211,	'data',	183,	314,	NULL),
(1212,	'data',	183,	315,	NULL),
(1213,	'data',	184,	316,	NULL),
(1214,	'video',	184,	317,	NULL);

DROP TABLE IF EXISTS `livescores_privacysetting`;
CREATE TABLE `livescores_privacysetting` (
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

INSERT INTO `livescores_privacysetting` (`userId`, `message_new_friendship`, `message_new_message`, `message_new_profilecomment`, `appear_in_search`, `show_online_status`, `log_profile_visits`, `ignore_users`, `public_profile_fields`) VALUES
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
(38,	1,	1,	1,	1,	1,	1,	'',	NULL),
(39,	1,	1,	1,	1,	1,	1,	'',	NULL);

DROP TABLE IF EXISTS `livescores_profile`;
CREATE TABLE `livescores_profile` (
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

INSERT INTO `livescores_profile` (`id`, `userId`, `timestamp`, `privacy`, `lastname`, `firstname`, `show_friends`, `allow_comments`, `email`, `company`, `telephone`, `address`, `city`, `state`, `zip`, `country`) VALUES
(1,	1,	'2014-06-30 13:28:55',	'protected',	'admin',	'admin123asfasdfassssfd',	1,	1,	'a@a.c',	'Almagest Fraternite',	'1111111111111',	'Ghost Street',	'Durban',	'KZNasdf',	4000,	'ds'),
(2,	2,	'2013-02-18 02:06:30',	'protected',	'Nel',	'Alistair',	1,	1,	'alistair@blahblahblah.co.za',	'test',	'27393192111',	'test',	'test',	'KZN',	4000,	'ZA'),
(35,	35,	'2014-06-30 16:31:03',	'protected',	'James',	'Reporter',	1,	1,	'r@r.com',	'Almagest Fraternite',	'0723557267',	'P.O. Box 1008',	'Belfast',	'Kwazulu Natal',	1100,	'ZA'),
(36,	36,	'2014-06-30 13:28:44',	'protected',	'Vos',	'Producer',	1,	1,	'almagestfraternite@gmail.com',	'Production Company',	'0723557267',	'P.O. Box 1008',	'Middelburg',	'Mpumalanga',	1100,	'US'),
(37,	37,	'0000-00-00 00:00:00',	'protected',	'',	'',	1,	1,	'jvos@lando.co.za',	'',	'',	'',	'',	'',	0,	''),
(38,	38,	'2014-03-10 11:38:12',	'protected',	'',	'',	1,	1,	'a@gmail.com',	'',	'',	'',	'',	'',	0,	''),
(39,	38,	'0000-00-00 00:00:00',	'protected',	'',	'',	1,	1,	'alistair@searchfusion.co.za',	'',	'',	'',	'',	'',	0,	''),
(40,	39,	'0000-00-00 00:00:00',	'protected',	'test',	'test',	1,	1,	't@t.c',	'test',	'0123456789',	'asdf',	'Belfast',	'asdf',	234,	'asd');

DROP TABLE IF EXISTS `livescores_profile_comment`;
CREATE TABLE `livescores_profile_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `createtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `livescores_profile_field`;
CREATE TABLE `livescores_profile_field` (
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

INSERT INTO `livescores_profile_field` (`id`, `varname`, `title`, `hint`, `field_type`, `field_size`, `field_size_min`, `required`, `match`, `range`, `error_message`, `other_validator`, `default`, `position`, `visible`, `related_field_name`) VALUES
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

DROP TABLE IF EXISTS `livescores_profile_visit`;
CREATE TABLE `livescores_profile_visit` (
  `visitor_id` int(11) NOT NULL,
  `visited_id` int(11) NOT NULL,
  `timestamp_first_visit` int(11) NOT NULL,
  `timestamp_last_visit` int(11) NOT NULL,
  `num_of_visits` int(11) NOT NULL,
  PRIMARY KEY (`visitor_id`,`visited_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `livescores_profile_visit` (`visitor_id`, `visited_id`, `timestamp_first_visit`, `timestamp_last_visit`, `num_of_visits`) VALUES
(1,	2,	1335171800,	1337652058,	11),
(1,	3,	1335179541,	1337135324,	41),
(1,	4,	1337132241,	1337646718,	22),
(2,	1,	1336575805,	1336576270,	4),
(4,	1,	1336661711,	1337148523,	8),
(4,	2,	1336661708,	1337146605,	2);

DROP TABLE IF EXISTS `livescores_role`;
CREATE TABLE `livescores_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double NOT NULL COMMENT 'Price (when using membership module)',
  `duration` int(11) NOT NULL COMMENT 'How long a membership is valid',
  `registration` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `livescores_role` (`id`, `title`, `description`, `price`, `duration`, `registration`) VALUES
(11,	'Producer',	'null',	123,	321,	1),
(12,	'Reporter',	'null',	321,	321,	1),
(13,	'UserManager',	'',	1,	365,	0),
(14,	'AccountManager',	NULL,	0,	0,	0),
(15,	'InvoiceManager',	NULL,	0,	0,	0),
(16,	'SiteManager',	NULL,	0,	0,	0),
(17,	'ElementManager',	NULL,	0,	0,	0);

DROP TABLE IF EXISTS `livescores_site_page`;
CREATE TABLE `livescores_site_page` (
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

INSERT INTO `livescores_site_page` (`id`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`) VALUES
(5,	'upload',	'@',	'admin',	'admin',	'2013-02-17 00:00:00',	'2014-09-08 15:34:45',	0,	1),
(11,	'about_us',	'*',	'null',	'null',	'2013-08-31 17:47:59',	'2014-06-05 16:59:03',	2,	1),
(12,	'landing',	'*',	'null',	'null',	'2014-02-26 14:07:41',	'2014-06-05 16:59:03',	1,	1),
(14,	'profile',	'@',	'admin',	'admin',	'2014-06-05 14:50:22',	'2014-09-08 15:34:50',	4,	1);

DROP TABLE IF EXISTS `livescores_site_page_element`;
CREATE TABLE `livescores_site_page_element` (
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

INSERT INTO `livescores_site_page_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
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
(62,	1,	'GTag',	'aboutHeader',	'About',	'',	'{\"tag\":\"h2\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-31 17:52:18',	'2014-05-22 23:24:39',	0,	11,	1),
(66,	1,	'GTag',	'aboutParagraph',	'<p>Coastal Accounting video exchange serves as an online intermediary between members of the press and the music industry.</p>In addition to opening up the channels of communication, Coastal Accounting video exchange also allows for the streaming of new releases (and access to supplementary video, text and images) for potential review in publications.<p>The digital nature of our platform means quicker turnaround times, lower running costs and greater reach.</p> ',	'',	'{\"tag\":\"p\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-31 18:19:08',	'2014-05-22 23:24:39',	1,	11,	1),
(67,	2,	'GFolder',	'aboutTermsFolder',	'',	'',	'{\"title\":\"Terms and conditions\",\"hideContent\":true,\"htmlOptions\":{\"class\":\"termsAndConditions\"}}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-31 18:27:47',	'2014-05-22 23:24:39',	3,	11,	1),
(68,	1,	'GTag',	'aboutTerms',	'',	'',	'{\"text\":\"translate:Terms And Conditions\"}',	NULL,	NULL,	'*',	'ElementManager',	'null',	'2013-08-31 18:36:47',	'2014-05-22 23:28:48',	4,	11,	1),
(69,	3,	NULL,	'aboutTermsFolderClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	NULL,	'2014-05-22 23:24:39',	5,	11,	1),
(70,	1,	'GImage',	'aboutHeadphonesImage',	'',	'',	'{\"htmlOptions\":{\"class\":\"pull-right\"},\"src\":\"\\/themes\\/video\\/images\\/about_headphones.png\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-31 18:50:05',	'2014-05-22 23:24:39',	2,	11,	1),
(75,	1,	'GImage',	'profile_image',	'',	'',	'{\"htmlOptions\":{\"class\":\"pull-left\"},\"src\":\"\\/themes\\/video\\/images\\/profile_reporter.png\"}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-09-01 14:44:02',	'2014-04-29 00:00:14',	0,	1,	1),
(79,	1,	'GPublishButton',	'profile_publish',	'',	'',	'{}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-09-01 16:50:01',	'2014-03-17 14:49:06',	1,	1,	1),
(84,	1,	'GPostSearch',	'search_uploads_list',	'',	'',	'{\"action\":\"/gong/post/post/searchUploads\",\"htmlOptions\":{\"class\":\"SearchUploads\"}}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-09-03 13:39:01',	'2013-12-20 00:57:34',	1,	5,	1),
(88,	2,	'GTag',	'search_uploads',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-10-21 17:52:37',	'2013-12-20 00:55:45',	2,	5,	1),
(89,	3,	'GTag',	'',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-10-21 17:52:52',	'2013-12-20 00:55:45',	3,	5,	1),
(105,	1,	'GUserField',	'UserHash',	'',	'',	'{\"htmlOptions\":{\"class\":\"inline alert alert-info\"},\"edit\":false,\"tag\":\"h2\"}',	NULL,	NULL,	'Producer, Reporter',	'SUPER',	NULL,	'2014-03-03 07:44:45',	'2014-03-17 12:50:24',	7,	12,	1),
(137,	1,	'GPostSearch',	'postSearch',	'',	'',	'{\"publishedPosts\":true}',	NULL,	NULL,	'Reporter, Producer',	'SUPER',	NULL,	'2014-03-12 19:18:15',	'2014-03-17 12:50:24',	8,	12,	1),
(143,	2,	'GTag',	'GTag',	'',	'',	'{\"htmlOptions\":{\"class\":\"inline\"}}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 19:17:02',	'2014-06-05 19:44:46',	0,	14,	1),
(144,	1,	'GUserProfileField',	'First Name',	'',	'',	'{\"label\":\"First Name\",\"htmlOptions\":{\"class\":\"inline\"},\"field\":\"firstname\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 19:18:21',	'2014-06-05 19:44:46',	1,	14,	1),
(145,	3,	'GTag',	'Close',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 19:27:43',	'2014-06-05 19:44:46',	10,	14,	1),
(146,	1,	'GUserProfileField',	'Last Name',	'',	'',	'{\"label\":\"Last Name\",\"field\":\"lastname\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 19:29:49',	'2014-06-05 19:44:46',	2,	14,	1),
(147,	1,	'GUserProfileField',	'Email',	'',	'',	'{\"label\":\"Email\",\"field\":\"email\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 19:32:12',	'2014-06-05 19:44:46',	3,	14,	1),
(148,	1,	'GUserProfileField',	'Company',	'',	'',	'{\"label\":\"Company\",\"field\":\"company\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 19:33:05',	'2014-06-05 19:44:46',	4,	14,	1),
(149,	1,	'GUserProfileField',	'Telephone',	'',	'',	'{\"label\":\"Telephone\",\"field\":\"telephone\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 19:36:38',	'2014-06-05 19:44:46',	5,	14,	1),
(150,	1,	'GUserProfileField',	'Address',	'',	'',	'{\"label\":\"Address\",\"field\":\"address\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 19:41:38',	'2014-06-05 19:44:46',	6,	14,	1),
(151,	1,	'GUserProfileField',	'City',	'',	'',	'{\"label\":\"City\",\"field\":\"city\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 19:42:47',	'2014-06-05 19:44:46',	7,	14,	1),
(152,	1,	'GUserProfileField',	'State',	'',	'',	'{\"label\":\"State\",\"field\":\"state\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 19:43:51',	'2014-06-05 19:44:46',	8,	14,	1),
(153,	1,	'GUserProfileField',	'Zip',	'',	'',	'{\"field\":\"zip\",\"label\":\"Zip\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 19:44:41',	'2014-06-05 19:45:04',	9,	14,	1),
(154,	1,	'GImage',	'Producer Graphic',	'',	'',	'{\"htmlOptions\":{\"class\":\"pull-left\"},\"src\":\"/themes/video/images/profile_producer.png\"}',	NULL,	NULL,	'producer',	'SUPER',	NULL,	'2014-06-05 19:45:22',	'2014-06-05 19:48:08',	NULL,	14,	1),
(155,	1,	'GImage',	'Reporter Graphic',	'',	'',	'{\"htmlOptions\":{\"class\":\"pull-left\"},\"src\":\"/themes/video/images/profile_reporter.png\"}',	NULL,	NULL,	'reporter',	'SUPER',	NULL,	'2014-06-05 19:46:14',	'2014-06-05 19:48:29',	NULL,	14,	1);

DROP TABLE IF EXISTS `livescores_site_template`;
CREATE TABLE `livescores_site_template` (
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

INSERT INTO `livescores_site_template` (`id`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`) VALUES
(2,	'template',	'*',	'admin',	'admin',	'2013-02-17 00:00:00',	'2014-09-08 15:37:45',	1,	1),
(9,	'printTemplate',	'none',	'admin',	'admin',	'2013-07-11 00:00:00',	'2014-09-08 15:37:47',	0,	1);

DROP TABLE IF EXISTS `livescores_site_template_element`;
CREATE TABLE `livescores_site_template_element` (
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

INSERT INTO `livescores_site_template_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
(3,	2,	'GHeader',	'header',	'',	'',	'{\"tag\":\"div\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-02-17 00:00:00',	'2014-09-08 15:33:42',	0,	2,	1),
(4,	1,	'GImage',	'logoImage',	'',	'',	'{\"alt\":\"Coastal Accounting video exchange Logo\",\"htmlOptions\":{\"class\":\"logo\"},\"src\":\"\\/themes\\/video\\/images\\/coastal-logo.png\"}',	NULL,	NULL,	'disabled',	'SUPER',	'',	'2013-08-12 00:00:00',	'2014-09-08 15:33:42',	1,	2,	1),
(12,	3,	'GHeader',	'headerEnd',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-06-27 00:00:00',	'2014-09-08 15:33:42',	3,	2,	1),
(13,	1,	'GBusyPrompt',	'loading',	'',	'',	'{\"loadingImage\":\"\\/themes\\/video\\/images\\/ajax-loader.gif\",\"loadingText\":\"\",\"savingImage\":\"\\/themes\\/video\\/images\\/ajax-loader.gif\",\"savingText\":\"\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-07-10 00:00:00',	'2014-09-08 15:33:42',	7,	2,	1),
(14,	1,	'GBrowserWarning',	'browserNotification',	'',	'',	'[]',	NULL,	NULL,	'disabled',	'SUPER',	'',	'2013-07-10 00:00:00',	'2014-09-08 15:33:42',	9,	2,	1),
(15,	1,	'GTag',	'loadingShadow',	'',	'',	'{\"htmlOptions\":{\"class\":\"fullscreen saving loading\\u00a0browserNotification\"}}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-07-10 00:00:00',	'2014-09-08 15:33:42',	8,	2,	1),
(17,	1,	'GTabs',	'tabs',	'',	'',	'{\"items\":[{\"linkOptions\":{\"class\":\"searchTab\"},\"icon\":\"glyphicon glyphicon-play glyphicon-2x\",\"url\":\"\\/index.php\",\"view\":\"disabled\"},{\"linkOptions\":{\"class\":\"uploadTab\"},\"icon\":\"glyphicon glyphicon-upload glyphicon-2x\",\"url\":\"\\/page\\/upload\",\"view\":\"disabled\"},{\"linkOptions\":{\"class\":\"contactTab\"},\"icon\":\"glyphicon glyphicon-envelope glyphicon-2x\",\"view\":\"g\",\"url\":\"\\/site\\/contact\"},{\"linkOptions\":{\"class\":\"contactTab\"},\"icon\":\"glyphicon glyphicon-book glyphicon-2x\",\"view\":\"admin\",\"url\":\"\\/gong\\/site\\/page\\/list\"},{\"linkOptions\":{\"class\":\"contactTab\"},\"icon\":\"glyphicon glyphicon-list glyphicon-2x\",\"view\":\"admin\",\"url\":\"\\/gong\\/site\\/view\\/list\"},{\"linkOptions\":{\"class\":\"contactTab\"},\"icon\":\"glyphicon glyphicon-list-alt glyphicon-2x\",\"view\":\"admin\",\"url\":\"\\/gong\\/site\\/template\\/list\"},{\"linkOptions\":{\"class\":\"loginTab\"},\"type\":\"login\",\"icon\":\"glyphicon glyphicon-off glyphicon-2x\"}],\"tabsOptions\":{\"placement\":\"left\"}}',	NULL,	NULL,	'*',	'SUPER',	'',	'2013-02-17 00:00:00',	'2014-09-08 15:33:42',	4,	2,	1),
(44,	1,	'GTag',	'footer',	'Coastal Accounting video exchange.net  ™',	'',	'{\"htmlOptions\":{\"class\":\"Footer\"}}',	NULL,	NULL,	'*',	'SUPER',	'null',	'2013-08-27 17:15:11',	'2014-09-08 15:33:42',	6,	2,	1),
(91,	1,	'GPlayer',	'player',	'',	'',	'[]',	NULL,	NULL,	'disabled',	'SUPER',	'null',	'2014-02-18 01:52:04',	'2014-09-08 15:33:42',	2,	2,	1),
(145,	NULL,	'GTag',	'test',	'',	'',	NULL,	NULL,	NULL,	'*',	'SUPER',	'',	'2014-04-28 22:04:18',	NULL,	NULL,	0,	1),
(146,	NULL,	'GTag',	'test',	'',	'',	NULL,	NULL,	NULL,	'*',	'SUPER',	'',	'2014-04-28 22:06:29',	NULL,	NULL,	0,	1),
(147,	NULL,	'GTag',	'test',	'',	'',	NULL,	NULL,	NULL,	'*',	'SUPER',	'',	'2014-04-28 22:08:20',	NULL,	NULL,	0,	1),
(148,	NULL,	'GTag',	'test',	'',	'',	NULL,	NULL,	NULL,	'*',	'SUPER',	'',	'2014-04-28 22:10:00',	NULL,	NULL,	0,	1),
(149,	NULL,	'GTag',	'test',	'',	'',	NULL,	NULL,	NULL,	'*',	'SUPER',	'',	'2014-04-28 22:14:51',	NULL,	NULL,	0,	1),
(152,	1,	'GArticle',	'content',	'',	'',	'{\"htmlOptions\":{\"class\":\"tab-content\"}}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-04-28 22:55:30',	'2014-09-08 15:33:42',	5,	2,	1),
(153,	1,	'GFileUploader',	'uploader',	'',	'',	'[]',	NULL,	NULL,	'disabled',	'SUPER',	NULL,	'2014-06-29 15:49:20',	'2014-09-08 15:33:42',	10,	2,	1);

DROP TABLE IF EXISTS `livescores_site_view`;
CREATE TABLE `livescores_site_view` (
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

INSERT INTO `livescores_site_view` (`id`, `module`, `controller`, `name`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `userId`, `parentId`) VALUES
(47,	'site',	'element',	'create',	'*',	'admin',	'admin',	'2014-05-07 20:33:28',	'2014-09-08 15:37:53',	NULL,	1,	16),
(58,	'site',	'model',	'update',	'*',	'admin',	'admin',	'2014-05-07 22:46:59',	'2014-09-08 15:37:55',	NULL,	1,	16),
(59,	'site',	'model',	'updateDone',	'*',	'admin',	'admin',	'2014-05-07 23:08:18',	'2014-09-08 15:37:58',	NULL,	1,	16),
(210,	'site',	'view',	'create',	'*',	'admin',	'admin',	'2014-05-10 05:11:08',	'2014-09-08 15:38:00',	NULL,	1,	1),
(211,	'site',	'model',	'view',	'*',	'admin',	'admin',	'2014-05-10 05:11:08',	'2014-09-08 15:38:03',	NULL,	1,	1),
(212,	'site',	'model',	'delete',	'*',	'admin',	'admin',	'2014-05-10 05:11:08',	'2014-09-08 15:38:05',	NULL,	1,	1),
(213,	'site',	'model',	'createDone',	'*',	'admin',	'admin',	'2014-05-10 05:11:08',	'2014-09-08 15:38:07',	NULL,	1,	1),
(214,	'site',	'model',	'list',	'*',	'admin',	'admin',	'2014-05-10 05:11:08',	'2014-09-08 15:38:09',	NULL,	1,	1),
(228,	'user',	'auth',	'login',	'*',	'admin',	'admin',	'2014-05-13 03:10:06',	'2014-09-08 15:38:11',	NULL,	1,	NULL),
(229,	'site',	'model',	'reorderDone',	'*',	'admin',	'admin',	'2014-05-16 02:16:19',	'2014-09-08 15:38:13',	NULL,	1,	NULL),
(230,	'site',	'view',	'view',	'*',	'admin',	'admin',	'2014-05-19 00:33:18',	'2014-09-08 15:38:16',	NULL,	1,	NULL),
(231,	'user',	'registration',	'registration',	'*',	'admin',	'admin',	'2014-05-19 01:31:46',	'2014-09-08 15:38:18',	NULL,	1,	NULL),
(234,	'site',	'viewMap',	'create',	'*',	'admin',	'admin',	'2014-05-22 18:09:10',	'2014-09-08 15:38:23',	NULL,	1,	NULL),
(235,	'user',	'profile',	'update',	'*',	'admin',	'admin',	'2014-05-22 22:46:52',	'2014-09-08 15:38:24',	NULL,	1,	NULL),
(236,	'post',	'post',	'createDone',	'*',	'admin',	'admin',	'2014-06-02 20:22:18',	'2014-09-08 15:38:26',	NULL,	1,	NULL),
(237,	'site',	'page',	'create',	'*',	'admin',	'admin',	'2014-06-02 20:31:22',	'2014-09-08 15:38:28',	NULL,	1,	NULL),
(238,	'site',	'pageElement',	'create',	'*',	'admin',	'admin',	'2014-06-05 16:49:50',	'2014-09-08 15:38:30',	NULL,	1,	NULL),
(239,	'user',	'invoice',	'view',	'*',	'admin',	'admin',	'2014-06-09 11:46:34',	'2014-09-08 15:38:32',	NULL,	1,	NULL),
(240,	'site',	'template',	'create',	'*',	'admin',	'admin',	'2014-06-29 15:23:41',	'2014-09-08 15:38:34',	NULL,	1,	NULL),
(241,	'site',	'templateElement',	'create',	'*',	'admin',	'admin',	'2014-06-29 15:36:12',	'2014-09-08 15:38:36',	NULL,	1,	NULL),
(242,	'user',	'registration',	'recoveryMail',	'*',	'admin',	NULL,	'2014-06-30 13:34:21',	'2014-09-08 15:38:40',	0,	1,	NULL);

DROP TABLE IF EXISTS `livescores_site_view_element`;
CREATE TABLE `livescores_site_view_element` (
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

INSERT INTO `livescores_site_view_element` (`id`, `mode`, `className`, `name`, `prefixContent`, `suffixContent`, `fields`, `userAgentExclude`, `userAgentInclude`, `view`, `edit`, `delete`, `created`, `modified`, `weight`, `parentId`, `userId`) VALUES
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
(618,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-22 18:16:38',	0,	210,	1),
(619,	1,	'GTextField',	'name',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-22 18:16:38',	3,	210,	1),
(621,	1,	'GSubmitButton',	'submit',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-22 18:16:38',	4,	210,	1),
(622,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-22 18:16:38',	5,	210,	1),
(623,	1,	'GTag',	'name',	'',	'',	'{\"text\":\"Model:<h1>{var:model.modelLabel}</h1><h2>Name: {var:model.name}</h2>\",\"tag\":\"span\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-22 17:55:59',	0,	211,	1),
(624,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"label\":\"List {var:model.controllerId}s\",\"url\":[\"list\"]},{\"label\":\"Create {var:model.childModel.controllerId}\",\"url\":{\"0\":\"{var:model.childModel.controllerId}\\/create\",\"parentId\":\"var:model.hash\"}}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-16 02:39:29',	1,	211,	1),
(625,	1,	'GViewDom',	'children',	'',	'',	'{\"importUrl\":\"dom/batchImport/type/page/id/{var:model.hash}\",\"exportUrl\":\"dom/batchExport/type/page/id/{var:model.hash}\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 05:11:08',	'2014-05-19 01:27:53',	2,	211,	1),
(627,	1,	'GRedirect',	'redirect',	'',	'',	'{\"url\":\"var:model.deleteRedirect\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 05:11:08',	'2014-05-12 21:52:21',	NULL,	212,	1),
(628,	1,	'GRedirect',	'redirect',	'',	'',	'{\"url\":\"var:model.createRedirect\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 05:11:08',	'2014-05-12 23:39:07',	NULL,	213,	1),
(629,	1,	'GTag',	'name',	'',	'',	'{\"tag\":\"h1\",\"text\":\"{var:model.modelLabel}s:\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-22 17:53:50',	1,	214,	1),
(630,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"url\":[\"create\"],\"label\":\"Create {var:model.modelLabel}\"}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-10 05:11:08',	'2014-05-22 17:57:48',	2,	214,	1),
(632,	1,	'GTextField',	'controller',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 06:17:55',	'2014-05-22 18:16:38',	2,	210,	1),
(633,	1,	'GTextField',	'module',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-10 06:18:20',	'2014-05-22 18:16:38',	1,	210,	1),
(643,	1,	'GTag',	'name',	'',	'',	'{\"tag\":\"h1\",\"text\":\"{var:controller.label}s:\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-11 15:25:08',	NULL,	1,	216,	1),
(644,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"url\":[\"create\"],\"label\":\"Create {var:controller.label}\"}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-11 15:25:08',	NULL,	2,	216,	1),
(645,	1,	'GTable',	'list',	'',	'',	'{\"actions\":[\"<a href=\\\"\\/gong\\/site\\/{var:model.childType}\\/update\\/id\\/{child:view.hash}\\\"><i class=\\\\\'glyphicon glyphicon-search\\\\\'><\\/i><\\/a>\"],\"controllerUrl\":\"\\/gong\\/site\\/{var:model.childType}\",\"columns\":[{\"id\":\"id\",\"display\":false},{\"id\":\"module\",\"editor\":\"textarea\"},{\"id\":\"controller\",\"editor\":\"textarea\"},{\"id\":\"name\",\"editor\":\"textarea\"},{\"field\":\"view.name\",\"id\":\"Parent\"},{\"field\":\"id\",\"id\":\"actions\",\"formatter\":\"Actions\"}],\"options\":{\"bFilter\":true},\"data\":\"var:data\"}',	NULL,	NULL,	'disabled',	'SUPER',	'',	'2014-05-11 15:25:09',	'2014-05-12 15:12:29',	3,	216,	1),
(646,	1,	'GGridView',	'grid',	'',	'',	'{\"columns\":\"var:model.gridColumns\",\"itemsCssClass\":\"table\",\"ajaxUpdate\":false,\"dataProvider\":\"var:dataProvider\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-11 23:07:30',	'2014-05-12 20:37:38',	3,	216,	1),
(648,	1,	'GGridView',	'grid',	'',	'',	'{\"columns\":\"var:model.gridColumns\",\"itemsCssClass\":\"table table-striped table-hover\",\"ajaxUpdate\":false,\"dataProvider\":\"var:dataProvider\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-12 17:37:17',	'2014-05-22 18:32:55',	4,	214,	1),
(649,	1,	'GGridView',	'grid',	'',	'',	'{\"columns\":\"var:model.childModel.gridColumns\",\"itemsCssClass\":\"table table-striped\",\"sortUrl\":\"{var:model.childModel.controllerId}/reorder\",\"sort\":true,\"dataProvider\":\"var:dataProvider\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-12 18:46:23',	'2014-05-19 00:38:40',	3,	211,	1),
(650,	2,	'GFormWidget',	'SignIn',	'',	'',	'{\"htmlOptions\":{\"class\":\"nohijack\"}}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-13 03:13:20',	'2014-06-02 20:36:34',	0,	228,	1),
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
(670,	3,	'GTag',	'buttonsClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 03:07:16',	'2014-06-02 20:35:51',	16,	228,	1),
(671,	2,	'GTag',	'buttons',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-16 03:07:21',	'2014-06-02 20:35:43',	7,	228,	1),
(672,	1,	'GTag',	'name',	'',	'',	'{\"text\":\"View<h1>{var:model.modelLabel}</h1><h2>Name: {var:model.name}</h2>\",\"tag\":\"span\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-19 00:33:36',	'2014-05-22 17:57:12',	0,	230,	1),
(673,	1,	'GMenu',	'menu',	'',	'',	'{\"items\":[{\"label\":\"List {var:model.controllerId}s\",\"url\":[\"list\"]},{\"label\":\"Create {var:model.childModel.controllerId}\",\"url\":{\"0\":\"{var:model.childModel.controllerId}\\/create\",\"parentId\":\"var:model.hash\"}}]}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-19 00:33:36',	NULL,	1,	230,	1),
(674,	1,	'GViewDom',	'children',	'',	'',	'{\"importUrl\":\"dom/batchImport/type/view/module/{var:model.module}/controller/{var:model.controller}/name/{var:model.name}\",\"exportUrl\":\"dom/batchExport/type/view/module/{var:model.module}/controller/{var:model.controller}/name/{var:model.name}\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 00:33:36',	'2014-05-19 01:23:04',	2,	230,	1),
(675,	1,	'GGridView',	'grid',	'',	'',	'{\"columns\":\"var:model.childModel.gridColumns\",\"itemsCssClass\":\"table table-striped table-hover\",\"sortUrl\":\"{var:model.childModel.controllerId}/reorder\",\"sort\":true,\"dataProvider\":\"var:dataProvider\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 00:33:36',	'2014-05-22 18:32:27',	3,	230,	1),
(676,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-19 01:33:27',	'2014-06-23 12:50:35',	1,	231,	1),
(677,	1,	'GTextField',	'username',	'',	'',	'{\"submission\":\"var:form\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-19 01:33:27',	'2014-06-23 12:50:36',	3,	231,	1),
(678,	1,	'GPasswordField',	'password',	'',	'',	'{\"submission\":\"var:form\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 01:33:27',	'2014-06-23 12:50:36',	4,	231,	1),
(680,	1,	'GSubmitButton',	'submit',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-19 01:33:27',	'2014-06-23 12:50:36',	20,	231,	1),
(681,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-19 01:33:27',	'2014-06-23 12:50:37',	21,	231,	1),
(682,	1,	'GTextField',	'firstname',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 01:44:03',	'2014-06-23 12:50:36',	6,	231,	1),
(683,	1,	'GTextField',	'lastname',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 01:44:03',	'2014-06-23 12:50:36',	7,	231,	1),
(684,	1,	'GEmailField',	'email',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 01:44:03',	'2014-06-23 12:50:36',	8,	231,	1),
(685,	1,	'GTextField',	'company',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 01:44:03',	'2014-06-23 12:50:36',	15,	231,	1),
(686,	1,	'GTextField',	'telephone',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 01:44:03',	'2014-06-23 12:50:36',	16,	231,	1),
(687,	1,	'GTextField',	'address',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 01:44:03',	'2014-06-23 12:50:36',	18,	231,	1),
(688,	1,	'GTextField',	'city',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 01:44:03',	'2014-06-23 12:50:36',	13,	231,	1),
(689,	1,	'GTextField',	'state',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 01:44:03',	'2014-06-23 12:50:36',	12,	231,	1),
(690,	1,	'GTextField',	'zip',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 01:44:03',	'2014-06-23 12:50:36',	14,	231,	1),
(691,	1,	'GTextField',	'country',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-19 01:44:03',	'2014-06-23 12:50:36',	11,	231,	1),
(700,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-22 18:09:23',	'2014-05-22 18:15:14',	0,	234,	1),
(701,	1,	'GTextField',	'module',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 18:09:23',	'2014-05-22 18:15:14',	1,	234,	1),
(702,	1,	'GTextField',	'controller',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-22 18:09:23',	'2014-05-22 18:15:14',	2,	234,	1),
(703,	1,	'GTextField',	'name',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 18:09:23',	'2014-05-22 18:15:14',	3,	234,	1),
(704,	1,	'GTextField',	'parentModule',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 18:09:23',	'2014-05-22 18:15:14',	4,	234,	1),
(705,	1,	'GTextField',	'parentName',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-22 18:09:23',	'2014-05-22 18:15:14',	6,	234,	1),
(706,	1,	'GSubmitButton',	'submit',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-22 18:09:23',	'2014-05-22 18:15:14',	7,	234,	1),
(707,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-22 18:09:23',	'2014-05-22 18:15:14',	8,	234,	1),
(708,	1,	'GTextField',	'parentController',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 18:13:53',	'2014-05-22 18:15:14',	5,	234,	1),
(709,	1,	'GCaptcha',	'verifyCode',	'',	'',	'{\"submission\":\"var:form\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 22:32:00',	'2014-06-23 12:50:36',	19,	231,	1),
(710,	1,	'GPasswordField',	'verifyPassword',	'',	'',	'{\"submission\":\"var:form\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 22:36:07',	'2014-06-23 12:50:36',	5,	231,	1),
(711,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-22 22:46:59',	NULL,	0,	235,	1),
(715,	1,	'GTextField',	'firstname',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 22:46:59',	NULL,	4,	235,	1),
(716,	1,	'GTextField',	'lastname',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 22:46:59',	NULL,	5,	235,	1),
(717,	1,	'GEmailField',	'email',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 22:46:59',	NULL,	6,	235,	1),
(718,	1,	'GTextField',	'company',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 22:46:59',	NULL,	7,	235,	1),
(719,	1,	'GTextField',	'telephone',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 22:46:59',	NULL,	8,	235,	1),
(720,	1,	'GTextField',	'address',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 22:46:59',	NULL,	9,	235,	1),
(721,	1,	'GTextField',	'city',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 22:46:59',	NULL,	10,	235,	1),
(722,	1,	'GTextField',	'state',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 22:46:59',	NULL,	11,	235,	1),
(723,	1,	'GTextField',	'zip',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 22:46:59',	NULL,	12,	235,	1),
(724,	1,	'GTextField',	'country',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-05-22 22:46:59',	NULL,	13,	235,	1),
(726,	1,	'GSubmitButton',	'submit',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-22 22:47:00',	NULL,	15,	235,	1),
(727,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-05-22 22:47:00',	NULL,	16,	235,	1),
(728,	1,	'GRedirect',	'redirect',	'',	'',	'{\"url\":\"/page/upload\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-02 20:23:10',	'2014-06-02 20:25:36',	NULL,	236,	1),
(729,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-02 20:31:30',	NULL,	0,	237,	1),
(732,	1,	'GTextField',	'name',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-02 20:31:30',	NULL,	3,	237,	1),
(733,	1,	'GSubmitButton',	'submit',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-02 20:31:30',	NULL,	4,	237,	1),
(734,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-02 20:31:30',	NULL,	5,	237,	1),
(735,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-05 16:51:34',	NULL,	1,	238,	1),
(736,	1,	'GTextField',	'mode',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 16:51:34',	NULL,	2,	238,	1),
(737,	1,	'GTextField',	'name',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-05 16:51:34',	NULL,	3,	238,	1),
(738,	1,	'GTextField',	'className',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 16:51:34',	NULL,	4,	238,	1),
(739,	1,	'GTextField',	'weight',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-05 16:51:35',	NULL,	5,	238,	1),
(740,	1,	'GHiddenField',	'parentId',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-05 16:51:35',	NULL,	18,	238,	1),
(741,	1,	'GSubmitButton',	'submit',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-05 16:51:35',	NULL,	19,	238,	1),
(742,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-05 16:51:35',	NULL,	20,	238,	1),
(743,	1,	'GTag',	'Registeration',	'Registeration',	'',	'{\"tag\":\"h2\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-20 14:56:02',	'2014-06-23 12:50:35',	0,	231,	1),
(744,	1,	'GTag',	'H2',	'Profile',	'',	'{\"tag\":\"h2\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-20 15:12:56',	'2014-06-20 15:14:17',	NULL,	235,	1),
(745,	1,	'GImage',	'Producer Image',	'',	'',	'{\"src\":\"/themes/video/images/profile_producer.png\",\"htmlOptions\":{\"class\":\"pull-left\"}}',	NULL,	NULL,	'producer',	'SUPER',	NULL,	'2014-06-20 16:58:35',	'2014-06-20 17:02:50',	NULL,	235,	1),
(746,	1,	'GImage',	'Reporter Image',	'',	'',	'{\"htmlOptions\":{\"class\":\"pull-left\"},\"src\":\"/themes/video/images/profile_reporter.png\"}',	NULL,	NULL,	'reporter',	'SUPER',	NULL,	'2014-06-20 17:00:55',	'2014-06-20 17:02:14',	NULL,	235,	1),
(747,	2,	'GTag',	'GTag Inline',	'',	'',	'{\"htmlOptions\":{\"class\":\"inline\"}}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-23 12:44:23',	'2014-06-23 12:50:36',	2,	231,	1),
(748,	3,	'GTag',	'GTag Inline',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-23 12:44:37',	'2014-06-23 12:50:36',	9,	231,	1),
(749,	2,	'GTag',	'Inline',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-23 12:48:16',	'2014-06-23 12:50:36',	10,	231,	1),
(750,	3,	'GTag',	'GTag inline',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-23 12:48:57',	'2014-06-23 12:50:36',	17,	231,	1),
(751,	1,	'GTag',	'invoiceHeader',	'Tax Invoice',	'',	'{\"tag\":\"h2\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 16:09:33',	'2014-03-05 22:42:36',	0,	13,	1),
(752,	2,	'GTag',	'invoiceRecipient',	'',	'',	'{\"htmlOptions\":{\"style\":\"float:right\",\"class\":\"well\"}}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 16:11:38',	'2014-03-06 00:12:09',	10,	239,	1),
(753,	3,	'GTag',	'invoiceRecipientClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 16:12:00',	'2014-03-05 22:42:36',	18,	239,	1),
(754,	1,	'GVar',	'invoiceRecipientCompany',	'',	'',	'{\"key\":\"invoice.user.profile.company\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 16:13:52',	'2014-03-05 22:42:36',	13,	239,	1),
(755,	1,	'GTag',	'invoiceRecipientHeader',	'To:',	'',	'{\"tag\":\"h4\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 16:33:23',	'2014-03-05 22:42:36',	11,	239,	1),
(756,	1,	'GVar',	'invoiceRecipientAddress',	'',	'',	'{\"key\":\"invoice.user.profile.address\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 16:34:54',	'2014-03-05 22:42:36',	15,	239,	1),
(757,	1,	'GTag',	'invoiceRecipientCompanyLabel',	'Company:',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 16:38:42',	'2014-03-05 22:42:36',	12,	239,	1),
(758,	1,	'GTag',	'invoiceRecipientAddressLabel',	'Address:',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 16:39:37',	'2014-03-05 22:42:36',	14,	239,	1),
(759,	1,	'GTag',	'invoiceRecipientEmailLabel',	'E-Mail:',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 16:40:41',	'2014-03-05 22:42:36',	16,	239,	1),
(760,	1,	'GVar',	'invoiceRecipientEmail',	'',	'',	'{\"key\":\"invoice.user.profile.email\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 16:40:55',	'2014-03-05 22:42:36',	17,	239,	1),
(761,	2,	'GTag',	'invoiceSender',	'',	'',	'{\"htmlOptions\":{\"style\":\"float:left\",\"class\":\"well\"}}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 17:02:22',	'2014-03-06 00:11:46',	1,	239,	1),
(762,	3,	'GTag',	'invoiceSenderClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 17:02:37',	'2014-03-05 22:42:36',	9,	239,	1),
(763,	1,	'GTag',	'invoiceSenderHeader',	'From:',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 17:03:13',	'2014-03-05 22:42:36',	2,	239,	1),
(764,	1,	'GTag',	'invoiceSenderCompanyLabel',	'Company:',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 17:04:01',	'2014-03-05 22:42:36',	3,	239,	1),
(765,	1,	'GVar',	'invoiceSenderCompany',	'',	'',	'{\"key\":\"user.profile.company\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 17:04:13',	'2014-03-05 22:42:36',	4,	239,	1),
(766,	1,	'GTag',	'invoiceSenderAddressLabel',	'Address:',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 17:17:29',	'2014-03-05 22:42:36',	5,	239,	1),
(767,	1,	'GVar',	'invoiceSenderAddress',	'',	'',	'{\"key\":\"user.profile.company\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 17:17:36',	'2014-03-05 22:42:36',	6,	239,	1),
(768,	1,	'GTag',	'invoiceSenderEmailLabel',	'E-Mail:',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 17:18:51',	'2014-03-05 22:42:36',	7,	239,	1),
(769,	1,	'GVar',	'invoiceSenderEmail',	'',	'',	'{\"key\":\"user.profile.email\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 17:18:58',	'2014-03-05 22:42:36',	8,	239,	1),
(770,	1,	'GTable',	'invoice',	'',	'',	'{\"columns\":[{\"id\":1,\"name\":\"Item\",\"field\":\"item\"},{\"id\":2,\"name\":\"Price\",\"field\":\"price\"}],\"data\":\"var:invoice-data\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-03-05 22:42:24',	'2014-06-29 21:41:31',	19,	239,	1),
(772,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-29 15:24:38',	NULL,	0,	240,	1),
(775,	1,	'GTextField',	'name',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-29 15:24:38',	NULL,	3,	240,	1),
(776,	1,	'GSubmitButton',	'submit',	'',	'',	'{\"submission\":\"var:model\"}',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-29 15:24:38',	NULL,	4,	240,	1),
(777,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-29 15:24:38',	NULL,	5,	240,	1),
(778,	2,	'GFormWidget',	'form',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-29 15:36:36',	NULL,	1,	241,	1),
(779,	1,	'GTextField',	'mode',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-29 15:36:36',	NULL,	2,	241,	1),
(780,	1,	'GTextField',	'name',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-29 15:36:36',	NULL,	3,	241,	1),
(781,	1,	'GTextField',	'className',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-29 15:36:36',	NULL,	4,	241,	1),
(782,	1,	'GTextField',	'weight',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-29 15:36:36',	NULL,	5,	241,	1),
(783,	1,	'GHiddenField',	'parentId',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-29 15:36:36',	NULL,	18,	241,	1),
(784,	1,	'GSubmitButton',	'submit',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-29 15:36:37',	NULL,	19,	241,	1),
(785,	3,	'GFormWidget',	'formClose',	'',	'',	'[]',	NULL,	NULL,	'*',	'SUPER',	'',	'2014-06-29 15:36:37',	NULL,	20,	241,	1),
(786,	1,	'GTag',	'',	'',	'',	'{\"text\":\"Hello {var:username}<br>Please click on the following link: <a href=\'{var:recovery_url}\'></a> to change your password.\"}',	NULL,	NULL,	'*',	'SUPER',	NULL,	'2014-06-30 13:36:21',	'2014-06-30 13:47:56',	NULL,	242,	1);

DROP TABLE IF EXISTS `livescores_site_view_map`;
CREATE TABLE `livescores_site_view_map` (
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

INSERT INTO `livescores_site_view_map` (`id`, `module`, `controller`, `name`, `parentModule`, `parentController`, `parentName`, `priority`) VALUES
(97,	'site',	'*',	'*',	'site',	'model',	'*',	999),
(121,	'*',	'view',	'create',	'*',	'elementCollection',	'*',	1),
(122,	'*',	'viewElement',	'create',	'*',	'element',	'*',	1);

DROP TABLE IF EXISTS `livescores_textsettings`;
CREATE TABLE `livescores_textsettings` (
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

INSERT INTO `livescores_textsettings` (`id`, `language`, `text_email_registration`, `subject_email_registration`, `text_email_recovery`, `text_email_activation`, `text_friendship_new`, `text_friendship_confirmed`, `text_profilecomment_new`, `text_message_new`, `text_membership_ordered`, `text_payment_arrived`) VALUES
(1,	'en_us',	'Thank you for registering with IPP-Renewables the Bid Windows 3, 4 and 5 is open. After validating your details please kindly sign in and provide your project information. You can do this by clicking the following link:\n{activation_url}',	'IPP-Renewables User Registration',	'You have requested a new Password. To set your new Password,\n										please go to {recovery_url}',	'Your account has been activated. Thank you for registering. Please sign in to fill in Bid Window 3, 4 and 5.',	'New friendship Request from {username}: {message}. To accept or ignore this request, go to your friendship page: {link_friends} or go to your profile: {link_profile}',	'The User {username} has accepted your friendship request',	'You have a new profile comment from {username}: {message} visit your profile: {link_profile}',	'You have received a new message from {username}: {message}',	'Your order of membership {membership} on {order_date} has been taken. Your order \r\nNumber is {id}. You have choosen the payment style {payment}.',	'Your payment has been received on {payment_date} and your Membership {id} is now active'),
(2,	'de',	'Sie haben sich fÃÂÃÂÃÂÃÂ¼r unsere Applikation registriert. Bitte bestÃÂÃÂÃÂÃÂ¤tigen Sie ihre E-Mail adresse mit diesem Link: {activation_url}',	'Sie haben sich fÃÂÃÂÃÂÃÂ¼r eine Applikation registriert.',	'Sie haben ein neues Passwort angefordert. Bitte klicken Sie diesen link: {activation_url}',	'Ihr Konto wurde freigeschaltet.',	'Der Benutzer {username} hat Ihnen eine Freundschaftsanfrage gesendet. \n\n							 Nachricht: {message}\n\n							 Klicken sie <a href=\"{link_friends}\">hier</a>, um diese Anfrage zu bestÃÂÃÂÃÂÃÂ¤tigen oder zu ignorieren. Alternativ kÃÂÃÂÃÂÃÂ¶nnen sie <a href=\"{link_profile}\">hier</a> auf ihre Profilseite zugreifen.',	'Der Benutzer {username} hat ihre Freundschaftsanfrage bestÃÂÃÂÃÂÃÂ¤tigt.',	'\n							 Benutzer {username} hat Ihnen eine Nachricht auf Ihrer Pinnwand hinterlassen: \n\n							 {message}\n\n							 <a href=\"{link}\">hier</a> geht es direkt zu Ihrer Pinnwand!',	'Sie haben eine neue Nachricht von {username} bekommen: {\r\nmessage}',	'Ihre Bestellung der Mitgliedschaft {membership} wurde am {order_date} entgegen genommen. Die gewÃÂÃÂÃÂÃÂ¤hlte Zahlungsart ist {payment}. Die Auftragsnummer lautet {id}.',	'Ihre Zahlung wurde am {payment_date} entgegen genommen. Ihre Mitgliedschaft mit der Nummer {id} ist nun Aktiv.'),
(3,	'es',	'Te has registrado en esta aplicaciÃÂÃÂÃÂÃÂ³n. Para confirmar tu direcciÃÂÃÂÃÂÃÂ³n de correo electrÃÂÃÂÃÂÃÂ³nico, por favor, visita {activation_url}.',	'Te has registrado en esta aplicaciÃÂÃÂÃÂÃÂ³n.',	'Has solicitado una nueva contraseÃÂÃÂÃÂÃÂ±a. Para establecer una nueva contraseÃÂÃÂÃÂÃÂ±a, por favor ve a {activation_url}',	'Tu cuenta ha sido activada. Gracias por registrarte.',	'Has recibido una nueva solicitud de amistad de {user_from}: {message} Ve a tus contactos: {link}',	'Tienes un nuevo comentario en tu perfil de {username}: {message} visita tu perfil: {link}',	'Please translatore thisse hiere toh tha espagnola langsch {username}',	'Has recibido un mensaje de {username}: {message}',	'Tu orden de membresÃÂÃÂÃÂÃÂ­a {membership} de fecha {order_date} fuÃÂÃÂÃÂÃÂ© tomada. Tu nÃÂÃÂÃÂÃÂºmero de orden es {id}. Escogiste como modo de pago {payment}.',	'Tu pago fuÃÂÃÂÃÂÃÂ© recibido en fecha {payment_date}. Ahora tu MembresÃÂÃÂÃÂÃÂ­a {id} ya estÃÂÃÂÃÂÃÂ¡ activa'),
(4,	'fr',	'',	'',	'',	'',	'',	'',	'',	'',	'',	''),
(5,	'ro',	'',	'',	'',	'',	'',	'',	'',	'',	'',	'');

DROP TABLE IF EXISTS `livescores_translation`;
CREATE TABLE `livescores_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'gong',
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `translation` text CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `language` varchar(5) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `livescores_translation` (`id`, `category`, `message`, `translation`, `language`) VALUES
(6,	'gong',	'Terms And Conditions',	'Website Terms and Conditions of Use:       These Terms and Conditions (“the Terms and Conditions”) govern your  (“the User”) use of the Coastal Accounting video exchange (“Provider”) website located at the domain  name <a target=\"_blank\" rel=\"nofollow\" href=\"http://www.Coastal Accounting video exchange.net\">www.Coastal Accounting video exchange.net</a> (“the Website”).      By accessing and using the Website, the User agrees to be bound by  the Terms and Conditions set out in this legal notice. If the User does not  wish to be bound by these Terms and Conditions, the User may not access,  display, use, download, and/or otherwise copy or distribute Content obtained at  the Website.     Updating of these Terms  and Conditions:       Provider reserves the rights to change, modify, add to or remove  from portions or the whole of these Terms and Conditions from time to time.  Changes to these Terms and Conditions will become effective upon such changes  being posted to this Website. It is the User’s obligation to periodically check  these Terms and Conditions at the Website for changes or updates. The User’s  continued use of this Website following the posting of changes or updates will  be considered notice of the User’s acceptance to abide by and be bound by these  Terms and Conditions, including such changes or updates.     <span>Supplier of services  details:  <br><br>In accordance with the disclosure requirements of  the Electronic Communications and Transactions Act (“ECTA”), Act No 25 of 2005,  the supplier of goods and/or services offered for sale, hire or exchange by way  of an electronic transaction, makes the following information available to  consumers:</span>     <ul><li>Supplier is Coastal Accounting video exchange CC (hereinafter referred to as “Supplier”),  a close corporation duly registered and existing under the laws of South Africa  with registration number: 2010/088984/23, with its physical address at No. 43  Pebble Lake, Florin Road, Wilgeheuwel. Supplier’s place of registration is No.  43 Pebble Lake, Florin Road, Wilgeheuwel and Supplier will accept legal service  at this given address. Supplier’s main member is: Mr. P Piegl. The main  business of Supplier is to facilitate the sharing of music-related content for  a closed group of subscribers and falls within the companies group of  Recreational, Cultural and Sporting Activities;</li>     </ul><ul><li>Supplier’s website is <a target=\"_blank\" rel=\"nofollow\" href=\"http://www.music2.media.net\">www.music2.media.net</a> and its contact details  are located on the above mentioned website.</li>     </ul><ul><li>Goods and/or Services: The main business of Supplier is to  facilitate the sharing of music-related content for a closed group of  subscribers.</li>     </ul><ul><li>Terms and conditions of download: The Consumer or User will be  liable for the full price or fees where applicable including transport costs,  taxes and any other fees or costs, guarantees, and where guarantees can be  accessed and downloaded by consumers where such tariffs, fees and or prices  will be specified on the website in relation to the goods and services  provided. Goods and services offered through this website by Supplier are  strictly on an “as is” basis for a price, fee and or tariff as shall be  indicated. Warranties and representations are hereby expressly excluded.  Downloaded files cannot be returned. In case of defect, User may notify  Supplier within 24 hours of becoming aware of defect by email to the following  address: peterpiegl@me.com. User’s cooling-off rights under s 44 of ECTA  do not apply in terms of s 42 of ECTA, due to downloads being audio, or video  recordings, or software or newspapers, periodicals, magazines or books. </li>     </ul><ul><li>Payment:  Payment may be made  online by credit card through a sufficiently secure payment system, or in the  case of Registered Users (corporate users only), by virtue of a monthly debit  order that can be arranged by calling the following number +2782 411 7430. The  payment system allows for review, corrections and withdrawal by User prior to  placing a final order.</li>     </ul><ul><li>Complaints and disputes:  Supplier offers Users to file complaints via the contacting the supplier on the  following email address peterpiegl@me.com. Currently, Supplier does not  subscribe to any alternative dispute resolution code or mechanism. </li>     </ul>Copyright and Intellectual  Property Rights:       Provider provides certain information at the Website. Content  currently or anticipated to be displayed at this Website is provided by  Provider, its affiliates and/or subsidiary, or any other third party owners of  such content, and includes but is not limited to Literary Works, Musical Works,  Artistic Works, Sound Recordings, Cinematograph Films, Sound and Television  Broadcasts, Program-Carrying Signals, Published Editions and Computer Programs  (“the Content”). All such proprietary works, and the compilation of the proprietary  works, belong to the Provider, its affiliates or subsidiary, or any third party  owners of such rights (“the Owners”), and the Content protected by South  African and International copyright laws. The Providers reserve the right to  make any changes to the Website, the Content, or to products and/or services  offered through the Website at any times and without notice. All rights in and  to the Content is reserved and retained by the Owners. Except as specified in  these Terms and Conditions, the User is not granted a license or any other  right including without limitation under Copyright, Trademark, Patent or other  Intellectual Property Rights in or to the Content.     Limited License to General  Users:     <ul><li>Provider grants to the User,  subject to the further terms of these Terms and Conditions, a non-exclusive,  non-transferable, limited and revocable right to access, display, use, download  and otherwise copy the current and future Content for personal, non-commercial  and information purposes only. </li>     </ul><ul><li>This Website and the Content  may not be reproduced, duplicated, copied, resold, visited or otherwise  exploited for any commercial purpose without the express prior written consent  of Provider/Supplier.</li>     </ul><ul><li>The license does not allow the  User to collect product or service listings, descriptions or other information  displayed here, and does not allow any derivative use of this Website or the  Content for the benefit of another merchant.</li>     </ul><ul><li>The User may not frame nor use  framing technologies to enclose the Provider Website or the Content nor any  part thereof without the express written consent of Provider.</li>     </ul><ul><li>Provider and the Owners do not  offer products or services to minors. If you are under the age of 18, you may  not respond to or otherwise accept or act upon any offers in the Website. </li>     </ul><ul><li>Provider and the Owners, their  affiliates or subsidiary reserve the right to refuse service, terminate  accounts, remove or edit content, or cancel orders in their sole discretion.</li>     </ul><ul><li>Any unauthorised use terminates  this license.</li>     </ul>Limited License to  Registered Users:     Provider allows and processes the  registration of certain corporate users (“the Registered User”) at the Website.  If you believe that you are entitled to registration, please contact  info@l-inc.co.za     <ul><li>Subject to the further terms of  these Terms and Conditions, a non-exclusive, non-transferable, limited and  revocable right is granted to Registered Users to access, display, use,  download and otherwise copy the current and future Content for the purposes  agreed to by the Registered User and Provider in their respective agreements.</li>     </ul><ul><li>This Website and the Content  may only be reproduced, duplicated, copied, resold, visited or otherwise  exploited for the specific purposes set out in that agreement.</li>     </ul><ul><li>The license does not allow the Registered  User to collect product or service listings, descriptions or other information  displayed here, and does not allow any derivative use of this Website or the  Content for the benefit of another merchant.</li>     </ul><ul><li>The Registered User may not  frame nor use framing technologies to enclose the Provider Website or the  Content nor any part thereof without the express written consent of Provider.</li>     </ul><ul><li>Provider and the Owners, their  affiliates or subsidiary reserve the right in their sole discretion to refuse  service, terminate accounts, remove or edit content, or cancel orders in their  sole discretion.</li>     </ul><ul><li>Any unauthorised use terminates  this license.</li>     </ul>Limitation of liability:       Subject to sub-sections 43(5) and 43 (6) of ECTA, if applicable, and  to the extent permitted by law, the Website and all Content on the Website,  including any current or future offer of products or services, are provided on  an “as is” basis, and may include inaccuracies or typographical errors and  Provider, Owners, suppliers, employees, directors partners, affiliates and  agents shall not be liable for any damage, or loss or liability of any nature  incurred by whoever as a result of any action or omission.<br>The Owners make no  warranty or representation as to the availability, accuracy or completeness of  the Content, or any third-party content accessible via an Internet link.  Neither Provider nor any holding company, affiliate or subsidiary of Provider  or Owners, shall be held responsible for any direct or indirect special,  consequential or other damage of any kind whatsoever suffered or incurred,  related to the use of, or the inability to access or use the Content or the  Website or any functionality thereof, or of any linked website, even if  Provider is expressly advised thereof.<br>Privacy, access to and use  of information:       <span>Provider allows you  to visit this website without telling the Provider who you are or revealing any  personal information about yourself, the User. However, you, the User, should  be aware that anonymous visitor information such as your IP address, browser  type, referring pages and pages visited on the website may be automatically  collected for statistical analysis of web traffic patterns.<br></span>     Provider receives various types of information (“the Information”)  from Users who access the Website, including personal information as detailed  in the Promotion of Access to Information Act (“PAIA”), Act 2 of 2000, and as  detailed in s 1 of ECTA (hereinafter referred to “Personal Information”).<br>Provider may electronically collect, store and use Personal Information,  including such information as your IP address, browser type, referring pages and  pages visited on the website for statistical analysis of web traffic patterns.      Provider voluntarily subscribes to s 51 of ECTA and endeavours to  treat Personal Information received by Provider accordingly. Whenever User is  of the opinion that Provider fails to comply with s 51 of ECTA, User shall  contact Provider by sending an email to peter@music2mendia.net.<br>Provider will  review User’s representations made by email and, if within Provider’s sole and  absolute discretion advisable, take corrective action and in any event within  30 days respond to User, informing User about corrective actions taken, if any.      Despite such undertaking, it is possible for Internet-based  communications to be intercepted. Without the use of encryption, the Internet  is not a secure medium and privacy cannot be ensured. Internet e-mail is  vulnerable to interception and forging.<br>The Owners will not be responsible for  any damages you or any third party may suffer as a result of the transmission  of confidential or disclosed information that you make to the Owners and/or  Provider through the Internet, or that you expressly or implicitly authorise  the Owners to make, or for any errors or any changes made to any transmitted  information. To ensure acquaintance with and awareness of the privacy measures  and policies of Provider, the User is urged to take care to read and understand  the underlying privacy clauses incorporated in these Terms and Conditions:     Privacy:  casual  surfing     The User may visit the Website without providing any personal  information. The User accordingly hereby grants express written permission for  the Website servers in such instances collecting the IP address of the User  computer, but not the email address or any other distinguishing information.<br>This information is aggregated to measure the number of visits, average time  spent at the Website, pages viewed, etc. Provider uses this information to  determine use of the Website, and to improve content thereon. Provider assumes  no obligation to protect this information, and may copy, distribute or otherwise  use such information without limitation     Privacy:  unsolicited  information      If the User posts unsolicited content or other information (“the  Information”) to the Website, and unless otherwise indicated, then the User  grants to the Owners a non-exclusive, royalty-free, perpetual, irrevocable, and  fully sub-licensable right to use, reproduce, modify, adapt, publish, translate,  create derivative works from, distribute, and display such Information  throughout the world in any media.<br>The User grants to the Owners the right to  use the name that the User submits in connection with such Information, if they  choose. The User warrants that the User owns or otherwise controls all of the  rights to the Information that the User posts; that the Information is  accurate; that by the supply of the Information to Provider, the User does not  violate this Policy and does not infringe the rights of any person or entity;  and that the User indemnifies the Owners for all claims resulting from the  receipt by Provider of the Information the User supplies to it. Provider  reserves the right but not the obligation to monitor and edit or remove any  Information, where posted to public pages.<br>Provider takes no responsibility,  and assumes no liability for any Information posted by the User or any third  party.     Privacy:  solicited  information the User gives to Provider     Provider requires certain Personal Information necessary to process  transactions if the User requires any of Provider’s products or services.<br>Provider receives and stores all Information, including Personal Information  which the User enters on the Website or gives to Provider, in any other way. The  User may choose not to provide certain Personal Information, but that may limit  the services or products that the User may wish to obtain from this Provider.<br>Provider provides its products and services in conjunction with its affiliates  and subsidiaries. In this regard and unless specifically restricted by the User  from the license below, the User hereby and when entering into the specific  transactions in question expressly grants in writing to the Owners and the  Provider a non-exclusive, royalty-free, perpetual, irrevocable, and fully  sub-licensable right to use, reproduce, modify, adapt, publish, translate,  create derivative works from, distribute, and display such Information  throughout the world in any media for any purpose whatsoever, including without  limitation for example transactions with user, registration of user, etc. The  User’s Information that is required by affiliates and subsidiaries to give  effect to transactions that the User chooses to enter into is shared with those  entities.<br>Privacy:  promotional  information     Provider aspires to provide first-class  service to its customers, which necessitates Provider providing information to  the User regarding new services or special offers. In each instance, the User  is provided an opportunity to opt-out of such information circulars. For more  information send an email to   peter@music2mendia.net<br>Privacy:  business  transfers     Provider may enter into business arrangements whereby its customer  base is one of the more valued assets. In such an event, customer Information  will be one of the transferable assets.     Privacy:  lawful  purposes     When the Provider is served with due legal process requiring the  delivery of Personal Information, it has the legal duty to abide by that  demand, and will do so.<br>Provider may also impart Personal Information if  permitted or required to do so by law.     Privacy:  surveys  and statistical profiles     Provider understands that efficiency and customer care translates to  good service.<br>Provider may periodically conduct online customer care surveys to  facilitate the updating of service standards. When it conducts a survey,  Provider will inform the User how the information gathered will be used, and  will provide the User with the opportunity to opt-out from such surveys.<br>Notwithstanding the foregoing, Provider may chose to use Personal Information  to compile profiles for statistical purposes and may chose to trade with such  profiles and statistical data, as long as the profiles or statistical data  cannot be linked to any specific data subject, including the User, by a third  party.     Privacy:  storage     Personal Information will be stored for as long as it is used and  for a period of one year (twelve months) thereafter, together with a record of  the Personal Information and the specific purposes it was collected for.  Personal Information will be first be anonymized and then destroyed once it has  become obsolete.<br>Privacy:  interception     Subject to the Regulation of Interception of Communications Act  (“RICA”), Act no 70 of 2002, User agrees that Provider may intercept, block,  read, delete, disclose and use all communications sent or otherwise  communicated to Provider, its employees, directors and agents. User agrees that  his or her consent satisfies the requirements of ECTA and RICA for consent in  “writing” as defined.     Choice of Law:       This Website is controlled, operated and administered by Provider  from its offices as set out below within the Republic of South Africa. The  Providers make no representation that the Content is appropriate or available  for use in other locations or countries other than the Republic of South  Africa. Access to the Website from territories or countries where the Content  is illegal is prohibited. The User may not use this Website in violation of  South African export laws and regulations. If the User accesses this Website  from locations outside of South Africa, that User is responsible for compliance  with all local laws. These Terms and Conditions shall be governed by the laws  of the Republic of South Africa, and the User consents to the jurisdiction of  the appropriate court within the Republic of South Africa in the event of any  dispute. If any of the provisions of these Terms and Conditions are found by a  court of competent jurisdiction to be invalid or unenforceable, that provision  shall be enforced to the maximum extent permissible so as to give effect to the  intent of these Terms and Conditions, and the remainder of these Terms and  Conditions shall continue in full force and effect.<br><br>These Terms and Conditions  constitute the entire agreement between the Provider and the User with regard  to the use of the Content and this Website.     Contact  Details:       In the event that you need to contact Provider/Supplier for purposes  related to these Terms and Conditions, please use the following:     <br><br>Email: peterpiegl@me.com     <span>Physical Address:<br>43 Pebble  Lake, Florin Road, Wilgeheuwel,</span>     <span>Postal Address:<br>P O Box  1445, Wilgeheuwel, 1735</span>     © MUSIC2MEDIA (2010)<br>',	'en'),
(7,	'gong',	'test',	'asdf123',	'en');

DROP TABLE IF EXISTS `livescores_user`;
CREATE TABLE `livescores_user` (
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

INSERT INTO `livescores_user` (`id`, `username`, `password`, `salt`, `activationKey`, `createtime`, `lastvisit`, `lastaction`, `lastpasswordchange`, `superuser`, `status`, `approved`, `published`, `avatar`, `notifyType`) VALUES
(1,	'admin',	'2d92aead1ecbd68b81e67844abcbea02325dc4c760e9afb155ac9560e96a24008597014acfbc179e4e43a9cb63dee64d33ff6ff795f9f5f7337027eb19bae8e4',	'1cKpqyPTh3pnytonuQzaxIomnzuLwDVN/rhfCtF78pmyPlB7oSwV2SVvI0pjsuXdsIkrUM+4xcwi4oM8BZG+wg==',	'edbd335ae87994b37ed2a9211183a4425c20d186f66ec3ac060f914778c6544eb0da45c783ec68587720148f7c7d2beba2ffb1e40843624146cce5370f0e24f5',	1335171345,	1410183112,	1410183520,	0,	1,	1,	0,	1,	'',	'Instant'),
(2,	'peter',	'2b7d157bdf6b0968c69695d8d1d3eb95a495bbd98d1bbe3da52167ae0689cbdce8d1fb32102052632bf1a4b6f2547d715fbf48b4701df42d0ed7d9b43604576b',	'iVz0Sl+EWFq+KjhL6cHIS+pYMIcZtBdiaFgqTvOFzfkGymGpod65wQCQNJzWsL5jOQ2C1SVCHWpdHYf9wn8H+g==',	'1',	1394197762,	1395658986,	0,	1394197762,	0,	1,	1,	1,	NULL,	'Instant'),
(35,	'r',	'6a25e7028a5c8e7e110c8190c9fabfc0d29620427a0970d1497ca8f914de75241e9ca5cb3e83b0976f488753206ad160122db612bf2a9a96507914407d77ea14',	'26JlJs3mfteUkKoGPymmgbeW7Tt28DHeoZKHZhrWrbFx/FfOkLn4pzZKceSilyUUADFNuWu4ALxdx7ugMrXrUA==',	'e1ab0195322bfbf6a3b6c09bd91c8255b76582cace6e3ac3eb25d2d4c29c546dd209b3039cd90e853fb6e9d731a35a99865d7e73dcd8430807d6feaefa9a3608',	1392452435,	1404145180,	1404145183,	1392452435,	0,	1,	1,	1,	NULL,	'Instant'),
(36,	'p',	'3194f54fe3645c63c9a2d9429031ee0db7133cf9bdd02d0c6652915fd08e0c690e5e49df70457a84c083ea342e8380f40c9d9b1d560f9032e167dc4431258a1a',	'THfa/Demy74kFNr8yip8lTH6ATWAIIVUNT/cgtLJSA+3uUEq8tkHEUtrnQRw1QXy6jvlr9n/3qzZV3W1CatdHA==',	'f1474bf56f49fc02a2eaf0a1de3c6129b3e33823d71d5335b8d6d15b559db4448f3c2953246cd25a1a6f848bffc820bc8d752f750f1f8f4a82631fc336f700a0',	1392647405,	1406560681,	1406560778,	1392647405,	0,	1,	1,	1,	NULL,	'Instant'),
(37,	'test',	'7e7db0d285a87ce52d73306f7c5b807bdf0398f3f731d1781972d8e8bbf2658b7e0687c934c9283cb6d86bc8a91147f8500dee1b0787c90bab5cfd4b938adb51',	'J/0VSG62r4ZFj1V9WM6pGW9O4Pr/4hC+22M8FwbA/TaY2ZaMu3OJAz/GUggEPVT1FIpy05VIf1cpB6N3AEsqqg==',	'4b698363769798c95be6bd798c61f2a7699400ce36d86086c53ed5435c45e1f1a526a0184309a14993a0fd0323ac9b96ea8a7b83730117618b52da2209811113',	1392783259,	0,	0,	1392783259,	0,	1,	1,	1,	NULL,	'Instant'),
(38,	'djAllie',	'2d92aead1ecbd68b81e67844abcbea02325dc4c760e9afb155ac9560e96a24008597014acfbc179e4e43a9cb63dee64d33ff6ff795f9f5f7337027eb19bae8e4',	'1cKpqyPTh3pnytonuQzaxIomnzuLwDVN/rhfCtF78pmyPlB7oSwV2SVvI0pjsuXdsIkrUM+4xcwi4oM8BZG+wg==',	'c46ded904d927ceaf95b464a40c4b3e855716f98fa826f60008104b08dac3f2d6502e52b3bb5cd70c1d8ae2915df6ad4eeebdd0e886c25cb63dc8e1a690c2a98',	1395058060,	0,	1395058497,	1395058060,	0,	1,	1,	1,	NULL,	'Instant');

DROP TABLE IF EXISTS `livescores_userTest`;
CREATE TABLE `livescores_userTest` (
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

INSERT INTO `livescores_userTest` (`id`, `created`, `modified`, `userId`, `username`, `email`, `password`, `retypePassword`, `role`, `capatcha`, `termsAndConditions`) VALUES
(1,	'2014-03-07',	'0000-00-00',	0,	'peter',	'almagestfraternite@gmail.com',	'almagest',	'almagest',	'reporter',	'fiwiyu',	'1'),
(2,	'2014-03-07',	'0000-00-00',	0,	'peter',	'almagestfraternite@gmail.com',	'almagest',	'almagest',	'reporter',	'fiwiyu',	'1'),
(3,	'2014-03-17',	'0000-00-00',	0,	'DJ Allie',	'alistair@searchfusion.co.za',	'123!Slam',	'123!Slam',	'producer',	'fizexo',	'1'),
(4,	'2014-03-17',	'0000-00-00',	0,	'DJ Allie',	'alistair@searchfusion.co.za',	'123!slam',	'123!slam',	'producer',	'fff',	'0'),
(5,	'2014-03-17',	'0000-00-00',	0,	'DJ ALlie',	'alistair@searchfusion.co.za',	'123!Slam',	'123!slam',	'producer',	'asdasd',	'0'),
(6,	'2014-03-17',	'0000-00-00',	0,	'djAllie',	'alistair@searchfusion.co.za',	'123!Slam',	'123!Slam',	'producer',	'fizexo',	'1'),
(7,	'2014-03-17',	'0000-00-00',	0,	'djAllie',	'alistair@searchfusion.co.za',	'123!Slam',	'12312313',	'producer',	'fizexo',	'1');

DROP TABLE IF EXISTS `livescores_user_group`;
CREATE TABLE `livescores_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) NOT NULL,
  `participants` text,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `livescores_user_group_message`;
CREATE TABLE `livescores_user_group_message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) unsigned NOT NULL,
  `group_id` int(11) unsigned NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `livescores_user_role`;
CREATE TABLE `livescores_user_role` (
  `userId` int(10) unsigned NOT NULL,
  `roleId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userId`,`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `livescores_user_role` (`userId`, `roleId`) VALUES
(2,	11),
(2,	12),
(2,	13),
(2,	14),
(2,	15),
(2,	16),
(2,	17);

DROP TABLE IF EXISTS `livescores_visit`;
CREATE TABLE `livescores_visit` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `livescores_vote`;
CREATE TABLE `livescores_vote` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fileId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (postId) REFERENCES livescores_item(id)',
  `userId` int(11) NOT NULL COMMENT 'CONSTRAINT FOREIGN KEY (userId) REFERENCES livescores_user(id)',
  `approve` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `livescores_vote` (`id`, `fileId`, `userId`, `approve`) VALUES
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
('rro6ulouv3e8rf7u139otvcn47',	1410187120,	'refresh|b:1;Yii.CCaptchaAction.c6786d1a.site.captcha|s:6:\"xexewo\";Yii.CCaptchaAction.c6786d1a.site.captchacount|i:1;28d0dda5f435af5be021a8ae68fc53e3__id|s:1:\"1\";28d0dda5f435af5be021a8ae68fc53e3__name|s:5:\"admin\";28d0dda5f435af5be021a8ae68fc53e3id|s:1:\"1\";28d0dda5f435af5be021a8ae68fc53e3__states|a:1:{s:2:\"id\";b:1;}');

-- 2014-09-08 15:39:56
