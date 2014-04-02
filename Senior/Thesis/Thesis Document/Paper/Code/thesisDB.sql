-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 02, 2014 at 12:45 PM
-- Server version: 5.5.35-0ubuntu0.13.10.2
-- PHP Version: 5.5.3-1ubuntu2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `thesisDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `share_tracker`
--

DROP TABLE IF EXISTS `share_tracker`;
CREATE TABLE IF NOT EXISTS `share_tracker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Gives every image a unique ID - PKey, AutoInc',
  `ILookup` varchar(6) NOT NULL COMMENT 'Unique URL ID Lookup',
  `IName` varchar(21) NOT NULL COMMENT 'Images file name',
  `directory` varchar(15) NOT NULL DEFAULT 'uploads' COMMENT 'File location from virtual server root',
  `uMethod` int(11) NOT NULL COMMENT 'Upload method',
  `hash` varchar(40) DEFAULT NULL COMMENT 'Hash of the image for exact dup matching',
  `fingerprint` varchar(32) DEFAULT NULL COMMENT 'The MD5 fingerprint of the histogram array.',
  `processTime` float NOT NULL DEFAULT '0' COMMENT 'Upload time to completion',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
