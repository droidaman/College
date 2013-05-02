SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `check_data`;
CREATE TABLE IF NOT EXISTS `check_data` (
  `EID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  KEY `EID` (`EID`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `check_options`;
CREATE TABLE IF NOT EXISTS `check_options` (
  `EID` int(11) NOT NULL,
  `value` varchar(64) NOT NULL,
  `text` varchar(64) NOT NULL,
  `weight` int(11) NOT NULL,
  KEY `EID` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `drop_data`;
CREATE TABLE IF NOT EXISTS `drop_data` (
  `EID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `opid` int(11) NOT NULL,
  KEY `EID` (`EID`),
  KEY `UID` (`UID`),
  KEY `opid` (`opid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `drop_options`;
CREATE TABLE IF NOT EXISTS `drop_options` (
  `opid` int(11) NOT NULL AUTO_INCREMENT,
  `EID` int(11) NOT NULL,
  `value` varchar(64) NOT NULL,
  `text` varchar(64) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`opid`),
  KEY `EID` (`EID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

DROP TABLE IF EXISTS `elements`;
CREATE TABLE IF NOT EXISTS `elements` (
  `EID` int(11) NOT NULL AUTO_INCREMENT,
  `ename` text NOT NULL,
  `FID` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Description` text NOT NULL,
  `Required` int(11) NOT NULL DEFAULT '0',
  `Weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EID`),
  KEY `FID` (`FID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

DROP TABLE IF EXISTS `formAccess`;
CREATE TABLE IF NOT EXISTS `formAccess` (
  `UID` int(11) NOT NULL,
  `FID` int(11) NOT NULL,
  KEY `UID` (`UID`),
  KEY `FID` (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `forms`;
CREATE TABLE IF NOT EXISTS `forms` (
  `FID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`FID`),
  KEY `title` (`title`),
  KEY `title_2` (`title`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

DROP TABLE IF EXISTS `radio_data`;
CREATE TABLE IF NOT EXISTS `radio_data` (
  `EID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `opid` int(11) NOT NULL,
  KEY `UID` (`UID`),
  KEY `opid` (`opid`),
  KEY `EID` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `radio_options`;
CREATE TABLE IF NOT EXISTS `radio_options` (
  `opid` int(11) NOT NULL AUTO_INCREMENT,
  `EID` int(11) NOT NULL,
  `value` varchar(64) NOT NULL,
  `text` varchar(64) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`opid`),
  KEY `EID` (`EID`),
  KEY `opid` (`opid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `mmode` tinyint(4) NOT NULL DEFAULT '0',
  `mmessage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `textarea_data`;
CREATE TABLE IF NOT EXISTS `textarea_data` (
  `EID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `input` text NOT NULL,
  KEY `EID` (`EID`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `text_data`;
CREATE TABLE IF NOT EXISTS `text_data` (
  `EID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `input` text NOT NULL,
  KEY `UID` (`UID`),
  KEY `EID` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `fName` varchar(32) NOT NULL,
  `lName` varchar(32) DEFAULT NULL,
  `pass` varchar(32) NOT NULL,
  `group` tinyint(4) NOT NULL DEFAULT '1',
  `activated` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`UID`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;


ALTER TABLE `check_data`
  ADD CONSTRAINT `check_data_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE,
  ADD CONSTRAINT `check_data_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE;

ALTER TABLE `check_options`
  ADD CONSTRAINT `check_options_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE;

ALTER TABLE `drop_data`
  ADD CONSTRAINT `drop_data_ibfk_4` FOREIGN KEY (`opid`) REFERENCES `drop_options` (`opid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drop_data_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drop_data_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `drop_options`
  ADD CONSTRAINT `drop_options_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `elements`
  ADD CONSTRAINT `elements_ibfk_1` FOREIGN KEY (`FID`) REFERENCES `forms` (`FID`) ON DELETE CASCADE;

ALTER TABLE `formAccess`
  ADD CONSTRAINT `formAccess_ibfk_2` FOREIGN KEY (`FID`) REFERENCES `forms` (`FID`) ON DELETE CASCADE,
  ADD CONSTRAINT `formAccess_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE;

ALTER TABLE `forms`
  ADD CONSTRAINT `forms_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE;

ALTER TABLE `radio_data`
  ADD CONSTRAINT `radio_data_ibfk_3` FOREIGN KEY (`opid`) REFERENCES `radio_options` (`opid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `radio_data_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `radio_data_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `radio_options`
  ADD CONSTRAINT `radio_options_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `textarea_data`
  ADD CONSTRAINT `textarea_data_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `textarea_data_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `text_data`
  ADD CONSTRAINT `text_data_ibfk_4` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `text_data_ibfk_3` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE;
