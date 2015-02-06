-- phpMyAdmin SQL Dump
-- version 2.7.0-beta1
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generatie Tijd: 24 Jan 2009 om 15:48
-- Server versie: 5.0.67
-- PHP Versie: 5.2.6-2ubuntu5
-- 
-- Database: `ossearch`
-- 

-- --------------------------------------------------------

-- 
-- Tabel structuur voor tabel `allparcels`
-- 

CREATE TABLE `allparcels` (
  `regionUUID` varchar(255) NOT NULL,
  `parcelname` varchar(255) NOT NULL,
  `ownerUUID` char(36) NOT NULL default '00000000-0000-0000-0000-000000000000',
  `groupUUID` char(36) NOT NULL default '00000000-0000-0000-0000-000000000000',
  `landingpoint` varchar(255) NOT NULL,
  `parcelUUID` char(36) NOT NULL default '00000000-0000-0000-0000-000000000000',
  `infoUUID` char(36) NOT NULL default '00000000-0000-0000-0000-000000000000',
  `parcelarea` int(11) NOT NULL,
  PRIMARY KEY  (`parcelUUID`),
  KEY `regionUUID` (`regionUUID`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

-- 
-- Tabel structuur voor tabel `classifieds`
-- 

CREATE TABLE IF NOT EXISTS `classifieds` (
  `classifieduuid` char(36) NOT NULL,
  `creatoruuid` char(36) NOT NULL,
  `creationdate` int(20) NOT NULL,
  `expirationdate` int(20) NOT NULL,
  `category` varchar(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `parceluuid` char(36) NOT NULL,
  `parentestate` int(11) NOT NULL,
  `snapshotuuid` char(36) NOT NULL,
  `simname` varchar(255) NOT NULL,
  `posglobal` varchar(255) NOT NULL,
  `parcelname` varchar(255) NOT NULL,
  `classifiedflags` int(8) NOT NULL,
  `priceforlisting` int(5) NOT NULL,
  PRIMARY KEY  (`classifieduuid`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Tabel structuur voor tabel `events`
-- 

CREATE TABLE `events` (
  `owneruuid` char(40) NOT NULL,
  `name` varchar(255) NOT NULL,
  `eventid` int(11) NOT NULL auto_increment,
  `creatoruuid` char(40) NOT NULL,
  `category` int(2) NOT NULL,
  `description` text NOT NULL,
  `dateUTC` int(12) NOT NULL,
  `duration` int(3) NOT NULL,
  `covercharge` int(1) NOT NULL,
  `coveramount` int(10) NOT NULL,
  `simname` varchar(255) NOT NULL,
  `globalPos` varchar(255) NOT NULL,
  `eventflags` int(10) NOT NULL,
  `mature` enum('true','false') NOT NULL,
  PRIMARY KEY  (`eventid`)
) ENGINE=InnoDB;

-- --------------------------------------------------------

-- 
-- Tabel structuur voor tabel `hostsregister`
-- 

CREATE TABLE `hostsregister` (
  `host` varchar(255) NOT NULL,
  `port` int(5) NOT NULL,
  `register` int(10) NOT NULL,
  `nextcheck` int(10) NOT NULL,
  `checked` tinyint(1) NOT NULL,
  `failcounter` int(10) NOT NULL,
  PRIMARY KEY (`host`,`port`)
) ENGINE=MyISAM; 

-- --------------------------------------------------------

-- 
-- Tabel structuur voor tabel `objects`
-- 

CREATE TABLE `objects` (
  `objectuuid` varchar(255) NOT NULL,
  `parceluuid` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `regionuuid` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`objectuuid`,`parceluuid`)
) ENGINE=MyISAM; 

-- --------------------------------------------------------

-- 
-- Tabel structuur voor tabel `parcels`
-- 

CREATE TABLE `parcels` (
  `regionUUID` varchar(255) NOT NULL,
  `parcelname` varchar(255) NOT NULL,
  `parcelUUID` varchar(255) NOT NULL,
  `landingpoint` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `searchcategory` varchar(50) NOT NULL,
  `build` enum('true','false') NOT NULL,
  `script` enum('true','false') NOT NULL,
  `public` enum('true','false') NOT NULL,
  `dwell` float NOT NULL default '0',
  `infouuid` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`regionUUID`,`parcelUUID`),
  KEY `name` (`parcelname`),
  KEY `description` (`description`),
  KEY `searchcategory` (`searchcategory`),
  KEY `dwell` (`dwell`)
) ENGINE=MyISAM; 

-- --------------------------------------------------------

-- 
-- Tabel structuur voor tabel `parcelsales`
-- 

CREATE TABLE `parcelsales` (
  `regionUUID` varchar(255) NOT NULL,
  `parcelname` varchar(255) NOT NULL,
  `parcelUUID` varchar(255) NOT NULL,
  `area` int(6) NOT NULL,
  `saleprice` int(11) NOT NULL,
  `landingpoint` varchar(255) NOT NULL,
  `infoUUID` char(36) NOT NULL default '00000000-0000-0000-0000-000000000000',
  `dwell` int(11) NOT NULL,
  `parentestate` int(11) NOT NULL default '1',
  `mature` varchar(32) NOT NULL default 'PG',
  PRIMARY KEY  (`regionUUID`,`parcelUUID`)
) ENGINE=MyISAM; 

-- --------------------------------------------------------

-- 
-- Tabel structuur voor tabel `popularplaces`
-- 

CREATE TABLE `popularplaces` (
  `parcelUUID` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dwell` float NOT NULL,
  `infoUUID` char(36) NOT NULL,
  `has_picture` tinyint(4) NOT NULL,
  `mature` tinyint(4) NOT NULL
) ENGINE=MyISAM; 

-- --------------------------------------------------------

-- 
-- Tabel structuur voor tabel `regions`
-- 

CREATE TABLE `search_regions` (
  `regionname` varchar(255) NOT NULL,
  `regionuuid` varchar(255) NOT NULL,
  `regionhandle` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `owneruuid` varchar(255) NOT NULL,
  PRIMARY KEY  (`regionuuid`)
) ENGINE=MyISAM; 
-- --------------------------------------------------------

--
-- Begin Profile Table (excluding already included classifieds)
--


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


-- --------------------------------------------------------
-- GROUPS
-- 
-- Table structure for table `osagent`
-- 

CREATE TABLE `osagent` (
  `AgentID` varchar(128) NOT NULL default '',
  `ActiveGroupID` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`AgentID`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `osgroup`
-- 

CREATE TABLE `osgroup` (
  `GroupID` varchar(128) NOT NULL default '',
  `Name` varchar(255) NOT NULL default '',
  `Charter` text NOT NULL,
  `InsigniaID` varchar(128) NOT NULL default '',
  `FounderID` varchar(128) NOT NULL default '',
  `MembershipFee` int(11) NOT NULL default '0',
  `OpenEnrollment` varchar(255) NOT NULL default '',
  `ShowInList` tinyint(1) NOT NULL default '0',
  `AllowPublish` tinyint(1) NOT NULL default '0',
  `MaturePublish` tinyint(1) NOT NULL default '0',
  `OwnerRoleID` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`GroupID`),
  UNIQUE KEY `Name` (`Name`),
  FULLTEXT KEY `Name_2` (`Name`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `osgroupinvite`
-- 

CREATE TABLE `osgroupinvite` (
  `InviteID` varchar(128) NOT NULL default '',
  `GroupID` varchar(128) NOT NULL default '',
  `RoleID` varchar(128) NOT NULL default '',
  `AgentID` varchar(128) NOT NULL default '',
  `TMStamp` timestamp NOT NULL,
  PRIMARY KEY  (`InviteID`),
  UNIQUE KEY `GroupID` (`GroupID`,`RoleID`,`AgentID`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `osgroupmembership`
-- 

CREATE TABLE `osgroupmembership` (
  `GroupID` varchar(128) NOT NULL default '',
  `AgentID` varchar(128) NOT NULL default '',
  `SelectedRoleID` varchar(128) NOT NULL default '',
  `Contribution` int(11) NOT NULL default '0',
  `ListInProfile` int(11) NOT NULL default '1',
  `AcceptNotices` int(11) NOT NULL default '1',
  PRIMARY KEY  (`GroupID`,`AgentID`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `osgroupnotice`
-- 

CREATE TABLE `osgroupnotice` (
  `GroupID` varchar(128) NOT NULL default '',
  `NoticeID` varchar(128) NOT NULL default '',
  `Timestamp` int(10) unsigned NOT NULL default '0',
  `FromName` varchar(255) NOT NULL default '',
  `Subject` varchar(255) NOT NULL default '',
  `Message` text NOT NULL,
  `BinaryBucket` text NOT NULL,
  PRIMARY KEY  (`GroupID`,`NoticeID`),
  KEY `Timestamp` (`Timestamp`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `osgrouprolemembership`
-- 

CREATE TABLE `osgrouprolemembership` (
  `GroupID` varchar(128) NOT NULL default '',
  `RoleID` varchar(128) NOT NULL default '',
  `AgentID` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`GroupID`,`RoleID`,`AgentID`)
) ENGINE=MyISAM;

-- --------------------------------------------------------

-- 
-- Table structure for table `osrole`
-- 

CREATE TABLE `osrole` (
  `GroupID` varchar(128) NOT NULL default '',
  `RoleID` varchar(128) NOT NULL default '',
  `Name` varchar(255) NOT NULL default '',
  `Description` varchar(255) NOT NULL default '',
  `Title` varchar(255) NOT NULL default '',
  `Powers` bigint(20) unsigned NOT NULL default '0',
  PRIMARY KEY  (`GroupID`,`RoleID`)
) ENGINE=MyISAM;

-- --------------------------------------------------------
-- for Offline Message
-- --------------------------------------------------------
    
CREATE TABLE `offline_message` (
    `to_uuid`       varchar(36) NOT NULL,
    `from_uuid`     varchar(36) NOT NULL,
    `message`       text NOT NULL,
    KEY `to_uuid` (`to_uuid`)
) ENGINE=MyISAM;

-- --------------------------------------------------------
-- for Mute List
-- --------------------------------------------------------

CREATE TABLE `mute_list` (
    `agentID`       varchar(36)  NOT NULL,
    `muteID`        varchar(36)  NOT NULL,
    `muteName`      varchar(255) NOT NULL,
    `muteType`      int(10) unsigned NOT NULL default '0',
    `muteFlags`     int(10) unsigned NOT NULL default '0',
    `timestamp`     int(11) unsigned NOT NULL default '0',
    PRIMARY KEY  (`AgentID`,`MuteID`,`MuteName`)
) ENGINE=MyISAM;

