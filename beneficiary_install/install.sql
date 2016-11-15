ALTER TABLE oc_modification CHANGE xml xml MEDIUMTEXT CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ;

CREATE TABLE IF NOT EXISTS `oc_badge` (
  `badge_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`badge_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `oc_badge_description` (
  `badge_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`badge_id`,`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;

CREATE TABLE IF NOT EXISTS `oc_badge_to_beneficiary` (
  `badge_id` int(11) NOT NULL,
  `beneficiary_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`badge_id`,`beneficiary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `oc_bankaccount` (
  `bankaccount_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(32) NOT NULL,
  `company_id` varchar(32) NOT NULL,
  `branch_id` varchar(32) NOT NULL,
  `bankaccount_1` varchar(128) NOT NULL,
  `bankaccount_2` varchar(128) NOT NULL,
  `bank_id` int(11) NOT NULL,
  PRIMARY KEY (`bankaccount_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;


CREATE TABLE IF NOT EXISTS `oc_bank` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ;



CREATE TABLE IF NOT EXISTS `oc_bank_description` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`bank_id`,`language_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  ;

CREATE TABLE IF NOT EXISTS `oc_commission_rate` (
  `commission_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`commission_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=0 ;


CREATE TABLE IF NOT EXISTS `oc_commission_rate_to_beneficiary_group` (
  `commission_rate_id` int(11) NOT NULL,
  `beneficiary_group_id` int(11) NOT NULL,
  PRIMARY KEY (`commission_rate_id`,`beneficiary_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `oc_beneficiary_group` (
  `beneficiary_group_id` int(11) NOT NULL AUTO_INCREMENT,
`commission_id` int(11) NOT NULL,
`product_limit` int(11) NOT NULL,
`subscription_price` int(11) NOT NULL,
`subscription_duration` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
 `status` tinyint(1) NOT NULL,
    PRIMARY KEY (`beneficiary_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `oc_beneficiary_group_description` (
  `beneficiary_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`beneficiary_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `oc_customer` ADD  `beneficiary_bankaccount_id` int(11) NOT NULL AFTER  `address_id` ;

ALTER TABLE `oc_customer` ADD  `beneficiary_group_id` int(11) NOT NULL AFTER  `address_id` ;

ALTER TABLE `oc_customer` ADD  `beneficiary_approved` int(1) NOT NULL AFTER  `beneficiary_group_id` ;

ALTER TABLE `oc_customer` ADD  `beneficiary_changegroup` int(1) NOT NULL AFTER  `beneficiary_approved` ;

ALTER TABLE `oc_customer` ADD `beneficiary_date_added` DATETIME NOT NULL AFTER `beneficiary_changegroup`;

ALTER TABLE `oc_customer` ADD `beneficiary_image`  varchar(255) NULL AFTER `beneficiary_date_added`;

ALTER TABLE `oc_customer` ADD `beneficiary_facebook`  varchar(255) NULL AFTER `beneficiary_date_added`;

ALTER TABLE `oc_customer` ADD `beneficiary_twitter`  varchar(255) NULL AFTER `beneficiary_date_added`;

ALTER TABLE `oc_customer` ADD `beneficiary_googleplus`  varchar(255) NULL AFTER `beneficiary_date_added`;

ALTER TABLE `oc_customer` ADD `beneficiary_instagram`  varchar(255) NULL AFTER `beneficiary_date_added`;

CREATE TABLE IF NOT EXISTS `oc_order_beneficiaryhistory` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `beneficiary_id` int(11) NOT NULL,
 `settlement` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  ;

CREATE TABLE IF NOT EXISTS `oc_product_to_beneficiary` (
  `product_id` int(11) NOT NULL,
  `beneficiary_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`beneficiary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `oc_beneficiary_transaction` (
`beneficiary_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
 PRIMARY KEY (`beneficiary_transaction_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `oc_order_beneficiary_settlement` (
  `order_beneficiary_settlement_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `beneficiary_id` int(11) NOT NULL,
  `settlement` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_beneficiary_settlement_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8  ;

CREATE TABLE IF NOT EXISTS `oc_beneficiaryreview` (
`beneficiaryreview_id` int(11) NOT NULL AUTO_INCREMENT,
  `beneficiary_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `beneficiary_name` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sticky` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
   PRIMARY KEY (`beneficiaryreview_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `oc_category_to_beneficiary_group` (
  `category_id` int(11) NOT NULL,
  `beneficiary_group_id` int(11) NOT NULL,
PRIMARY KEY (`category_id`,`beneficiary_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `oc_category_to_beneficiary` (
  `category_id` int(11) NOT NULL,
  `beneficiary_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
PRIMARY KEY (`category_id`,`beneficiary_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
