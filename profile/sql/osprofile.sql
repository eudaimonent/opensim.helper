--
--
--

CREATE TABLE  IF NOT EXISTS `classifieds` (
  `classifieduuid` 	char(36) NOT NULL,
  `creatoruuid` 	char(36) NOT NULL,
  `creationdate` 	int(20) NOT NULL,
  `expirationdate` 	int(20) NOT NULL,
  `category` 		varchar(20) NOT NULL,
  `name` 			varchar(255) NOT NULL,
  `description` 	text NOT NULL,
  `parceluuid` 		char(36) NOT NULL,
  `parentestate` 	int(11) NOT NULL,
  `snapshotuuid` 	char(36) NOT NULL,
  `simname` 		varchar(255) NOT NULL,
  `posglobal` 		varchar(255) NOT NULL,
  `parcelname` 		varchar(255) NOT NULL,
  `classifiedflags` int(8) NOT NULL,
  `priceforlisting` int(5) NOT NULL,
  PRIMARY KEY (`classifieduuid`)
) ENGINE=InnoDB;


CREATE TABLE `usernotes` (
  `id`              int(11) NOT NULL auto_increment,
  `useruuid`        varchar(36) NOT NULL,
  `targetuuid`      varchar(36) NOT NULL,
  `notes`           text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY  `useruuid` (`useruuid`, `targetuuid`)
) ENGINE=MyISAM;



CREATE TABLE `userpicks` (
  `pickuuid` 		varchar(36) NOT NULL,
  `creatoruuid` 	varchar(36) NOT NULL,
  `toppick` 		enum('true','false') NOT NULL,
  `parceluuid` 		varchar(36) NOT NULL,
  `name` 			varchar(255) NOT NULL,
  `description` 	text NOT NULL,
  `snapshotuuid` 	varchar(36) NOT NULL,
  `user` 			varchar(255) NOT NULL,
  `originalname` 	varchar(255) NOT NULL,
  `simname` 		varchar(255) NOT NULL,
  `posglobal` 		varchar(255) NOT NULL,
  `sortorder` 		int(2) NOT NULL,
  `enabled` 		enum('true','false') NOT NULL,
  PRIMARY KEY (`pickuuid`)
) ENGINE=MyISAM;


CREATE TABLE `userprofile` (
  `useruuid` 			 varchar(36) NOT NULL,
  `profilePartner` 		 varchar(36) NOT NULL,
  `profileImage` 		 varchar(36) NOT NULL,
  `profileAboutText` 	 text NOT NULL,
  `profileAllowPublish`  binary(1) NOT NULL,
  `profileMaturePublish` binary(1) NOT NULL,
  `profileURL` 			 varchar(255) NOT NULL,
  `profileWantToMask` 	 int(3) NOT NULL,
  `profileWantToText` 	 text NOT NULL,
  `profileSkillsMask` 	 int(3) NOT NULL,
  `profileSkillsText` 	 text NOT NULL,
  `profileLanguagesText` text NOT NULL,
  `profileFirstImage` 	 varchar(36) NOT NULL,
  `profileFirstText` 	 text NOT NULL,
  PRIMARY KEY (`useruuid`)
) ENGINE=MyISAM;


CREATE TABLE `usersettings` (
  `useruuid` 		varchar(36) NOT NULL,
  `imviaemail` 		enum('true','false') NOT NULL,
  `visible` 		enum('true','false') NOT NULL,
  `email` 			varchar(254) NOT NULL,
  PRIMARY KEY (`useruuid`)
) ENGINE=MyISAM;


