DROP TABLE IF EXISTS `xhxxfb_mall`;
CREATE TABLE `xhxxfb_mall` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `catid` int(10) unsigned NOT NULL default '0',
  `mycatid` bigint(20) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `level` tinyint(1) unsigned NOT NULL default '0',
  `elite` tinyint(1) NOT NULL default '0',
  `title` varchar(100) NOT NULL default '',
  `style` varchar(50) NOT NULL default '',
  `fee` float NOT NULL default '0',
  `introduce` varchar(255) NOT NULL default '',
  `brand` varchar(100) NOT NULL default '',
  `price` decimal(10,2) unsigned NOT NULL default '0.00',
  `step` mediumtext NOT NULL,
  `amount` int(10) unsigned NOT NULL default '0',
  `unit` varchar(20) NOT NULL,
  `tag` varchar(100) NOT NULL default '',
  `keyword` varchar(255) NOT NULL default '',
  `pptword` varchar(255) NOT NULL default '',
  `hits` int(10) unsigned NOT NULL default '0',
  `orders` int(10) unsigned NOT NULL default '0',
  `sales` int(10) unsigned NOT NULL default '0',
  `comments` int(10) unsigned NOT NULL default '0',
  `thumb` varchar(255) NOT NULL default '',
  `thumb1` varchar(255) NOT NULL default '',
  `thumb2` varchar(255) NOT NULL default '',
  `relate_name` varchar(100) NOT NULL,
  `relate_id` varchar(255) NOT NULL,
  `relate_title` varchar(100) NOT NULL,
  `n1` varchar(100) NOT NULL,
  `n2` varchar(100) NOT NULL,
  `n3` varchar(100) NOT NULL,
  `v1` varchar(255) NOT NULL,
  `v2` varchar(255) NOT NULL,
  `v3` varchar(255) NOT NULL,
  `express_1` int(10) unsigned NOT NULL default '0',
  `express_name_1` varchar(100) NOT NULL,
  `fee_start_1` decimal(10,2) unsigned NOT NULL,
  `fee_step_1` decimal(10,2) unsigned NOT NULL,
  `express_2` int(10) unsigned NOT NULL default '0',
  `express_name_2` varchar(100) NOT NULL,
  `fee_start_2` decimal(10,2) unsigned NOT NULL,
  `fee_step_2` decimal(10,2) unsigned NOT NULL,
  `express_3` int(10) unsigned NOT NULL default '0',
  `express_name_3` varchar(100) NOT NULL,
  `fee_start_3` decimal(10,2) unsigned NOT NULL,
  `fee_step_3` decimal(10,2) unsigned NOT NULL,
  `cod` tinyint(1) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `groupid` smallint(4) unsigned NOT NULL default '0',
  `company` varchar(100) NOT NULL default '',
  `vip` smallint(2) unsigned NOT NULL default '0',
  `validated` tinyint(1) unsigned NOT NULL default '0',
  `truename` varchar(30) NOT NULL default '',
  `telephone` varchar(50) NOT NULL default '',
  `mobile` varchar(50) NOT NULL default '',
  `address` varchar(255) NOT NULL default '',
  `email` varchar(50) NOT NULL default '',
  `msn` varchar(50) NOT NULL default '',
  `qq` varchar(20) NOT NULL default '',
  `ali` varchar(30) NOT NULL default '',
  `skype` varchar(30) NOT NULL default '',
  `editor` varchar(30) NOT NULL default '',
  `edittime` int(10) unsigned NOT NULL default '0',
  `editdate` date NOT NULL default '0000-00-00',
  `addtime` int(10) unsigned NOT NULL default '0',
  `adddate` date NOT NULL default '0000-00-00',
  `ip` varchar(50) NOT NULL default '',
  `template` varchar(30) NOT NULL default '0',
  `status` tinyint(1) NOT NULL default '0',
  `linkurl` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `note` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itemid`),
  KEY `username` (`username`),
  KEY `editdate` (`editdate`,`vip`,`edittime`),
  KEY `catid` (`catid`),
  KEY `areaid` (`areaid`)
) TYPE=MyISAM COMMENT='商城';

DROP TABLE IF EXISTS `xhxxfb_mall_cart`;
CREATE TABLE `xhxxfb_mall_cart` (
  `userid` bigint(20) unsigned NOT NULL default '0',
  `data` text NOT NULL,
  `edittime` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `userid` (`userid`)
) TYPE=MyISAM COMMENT='购物车';

DROP TABLE IF EXISTS `xhxxfb_mall_comment`;
CREATE TABLE `xhxxfb_mall_comment` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `mallid` bigint(20) unsigned NOT NULL default '0',
  `buyer` varchar(30) NOT NULL default '',
  `seller` varchar(30) NOT NULL default '',
  `buyer_star` tinyint(1) unsigned NOT NULL default '0',
  `buyer_comment` text NOT NULL,
  `buyer_ctime` int(10) unsigned NOT NULL default '0',
  `buyer_reply` text NOT NULL,
  `buyer_rtime` int(10) unsigned NOT NULL default '0',
  `seller_star` tinyint(1) unsigned NOT NULL default '0',
  `seller_comment` text NOT NULL,
  `seller_ctime` int(10) unsigned NOT NULL default '0',
  `seller_reply` text NOT NULL,
  `seller_rtime` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `itemid` (`itemid`),
  KEY `buyer` (`buyer`),
  KEY `seller` (`seller`)
) TYPE=MyISAM COMMENT='订单评论';

DROP TABLE IF EXISTS `xhxxfb_mall_data`;
CREATE TABLE `xhxxfb_mall_data` (
  `itemid` bigint(20) unsigned NOT NULL default '0',
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='商城内容';

DROP TABLE IF EXISTS `xhxxfb_mall_express`;
CREATE TABLE `xhxxfb_mall_express` (
  `itemid` int(10) unsigned NOT NULL auto_increment,
  `parentid` int(10) unsigned NOT NULL default '0',
  `areaid` int(10) unsigned NOT NULL default '0',
  `username` varchar(30) NOT NULL default '',
  `title` varchar(255) NOT NULL,
  `express` varchar(30) NOT NULL,
  `fee_start` decimal(10,2) unsigned NOT NULL,
  `fee_step` decimal(10,2) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL default '0',
  `items` int(10) unsigned NOT NULL default '0',
  `listorder` smallint(4) unsigned NOT NULL default '0',
  `note` varchar(255) NOT NULL,
  PRIMARY KEY  (`itemid`)
) TYPE=MyISAM COMMENT='运费模板';

DROP TABLE IF EXISTS `xhxxfb_mall_order`;
CREATE TABLE `xhxxfb_mall_order` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `mid` smallint(6) unsigned NOT NULL default '16',
  `mallid` bigint(20) unsigned NOT NULL default '0',
  `buyer` varchar(30) NOT NULL default '',
  `seller` varchar(30) NOT NULL default '',
  `title` varchar(100) NOT NULL default '',
  `thumb` varchar(255) NOT NULL default '',
  `price` decimal(10,2) unsigned NOT NULL default '0.00',
  `number` int(10) unsigned NOT NULL default '0',
  `amount` decimal(10,2) unsigned NOT NULL default '0.00',
  `fee` decimal(10,2) NOT NULL default '0.00',
  `fee_name` varchar(30) NOT NULL default '',
  `buyer_name` varchar(30) NOT NULL default '',
  `buyer_address` varchar(255) NOT NULL default '',
  `buyer_postcode` varchar(10) NOT NULL default '',
  `buyer_phone` varchar(30) NOT NULL default '',
  `buyer_mobile` varchar(30) NOT NULL default '',
  `buyer_star` tinyint(1) unsigned NOT NULL default '0',
  `seller_star` tinyint(1) unsigned NOT NULL default '0',
  `send_type` varchar(50) NOT NULL default '',
  `send_no` varchar(50) NOT NULL default '',
  `send_status` tinyint(1) unsigned NOT NULL default '0',
  `send_time` varchar(20) NOT NULL default '',
  `send_days` int(10) unsigned NOT NULL default '0',
  `cod` tinyint(1) unsigned NOT NULL default '0',
  `trade_no` varchar(50) NOT NULL default '',
  `add_time` smallint(6) NOT NULL default '0',
  `addtime` int(10) unsigned NOT NULL default '0',
  `updatetime` int(10) unsigned NOT NULL default '0',
  `editor` varchar(30) NOT NULL default '',
  `buyer_reason` mediumtext NOT NULL,
  `refund_reason` mediumtext NOT NULL,
  `note` varchar(255) NOT NULL default '',
  `status` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`itemid`),
  KEY `buyer` (`buyer`),
  KEY `seller` (`seller`)
) TYPE=MyISAM COMMENT='商城订单';

DROP TABLE IF EXISTS `xhxxfb_mall_stat`;
CREATE TABLE `xhxxfb_mall_stat` (
  `mallid` bigint(20) unsigned NOT NULL default '0',
  `seller` varchar(30) NOT NULL default '',
  `scomment` int(10) unsigned NOT NULL default '0',
  `s1` int(10) unsigned NOT NULL default '0',
  `s2` int(10) unsigned NOT NULL default '0',
  `s3` int(10) unsigned NOT NULL default '0',
  `buyer` varchar(30) NOT NULL default '',
  `bcomment` int(10) unsigned NOT NULL default '0',
  `b1` int(10) unsigned NOT NULL default '0',
  `b2` int(10) unsigned NOT NULL default '0',
  `b3` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `mallid` (`mallid`)
) TYPE=MyISAM COMMENT='评分统计';