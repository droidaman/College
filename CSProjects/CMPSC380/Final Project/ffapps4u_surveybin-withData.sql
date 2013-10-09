-- phpMyAdmin SQL Dump
-- version 3.5.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 03, 2013 at 08:30 PM
-- Server version: 5.1.68-cll
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ffapps4u_surveybin`
--

-- --------------------------------------------------------

--
-- Table structure for table `check_data`
--

DROP TABLE IF EXISTS `check_data`;
CREATE TABLE IF NOT EXISTS `check_data` (
  `EID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  KEY `EID` (`EID`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `check_data`
--

INSERT INTO `check_data` (`EID`, `UID`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `check_options`
--

DROP TABLE IF EXISTS `check_options`;
CREATE TABLE IF NOT EXISTS `check_options` (
  `EID` int(11) NOT NULL,
  `value` varchar(64) NOT NULL,
  `text` varchar(64) NOT NULL,
  `weight` int(11) NOT NULL,
  KEY `EID` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `check_options`
--

INSERT INTO `check_options` (`EID`, `value`, `text`, `weight`) VALUES
(2, 'anonymous', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `drop_data`
--

DROP TABLE IF EXISTS `drop_data`;
CREATE TABLE IF NOT EXISTS `drop_data` (
  `EID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `opid` int(11) NOT NULL,
  KEY `EID` (`EID`),
  KEY `UID` (`UID`),
  KEY `opid` (`opid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drop_data`
--

INSERT INTO `drop_data` (`EID`, `UID`, `opid`) VALUES
(11, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `drop_options`
--

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

--
-- Dumping data for table `drop_options`
--

INSERT INTO `drop_options` (`opid`, `EID`, `value`, `text`, `weight`) VALUES
(1, 11, 'small', 'Small', 0),
(2, 11, 'medium', 'Medium', 10),
(3, 11, 'large', 'Large', 20),
(4, 11, 'x-large', 'Extra Large', 30),
(5, 11, 'xx-large', 'Double Extra Large', 40),
(6, 11, 'xxx-large', 'Triple Extra Large', 50);

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

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

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`EID`, `ename`, `FID`, `Name`, `Description`, `Required`, `Weight`) VALUES
(1, 'text1', 1, 'Buyer''s Name:', 'Enter the name of the person buying the flower(s).', 1, 0),
(2, 'check1', 1, 'Anonymous sender?', 'Check this box if you would like the flowers to be delivered anonymously.', 0, 10),
(3, 'text2', 1, 'Number of flowers:', 'Enter the number of flowers you would like to purchase. Remember, flowers are $1 apiece and $10 for a bouquet of 12 flowers.', 1, 20),
(4, 'text3', 1, 'Recipient Name:', 'Enter the name of the flower recipient.', 1, 30),
(5, 'text4', 1, 'Recipient Homeroom:', 'If you know it, enter the homeroom of the flower recipient. We can look it up if you aren''t sure.', 0, 40),
(6, 'textarea1', 1, 'Message:', ' Enter a message to be included with the flower(s).', 0, 50),
(7, 'text1', 2, 'Buyer''s Name:', ' Enter the name of the person buying the shirt(s).', 1, 0),
(8, 'text2', 2, 'Email:', 'Only needed for you to access and edit your order.', 1, 10),
(9, 'text3', 2, 'Buyer''s Homeroom:', 'If applicable, enter the buyer''s homeroom number.', 0, 20),
(10, 'radio1', 2, 'School:', 'Who are you supporting: Derry or Latrobe? Choose which style of shirt you want to order.', 1, 30),
(11, 'drop1', 2, 'Shirt Size:', 'Choose your shirt size. Note: If you are ordering multiple shirts, they must all be of the same size. <em>To order shirts of different sizes, please create multiple orders, one for each shirt size.</em>', 1, 40),
(12, 'text4', 2, 'Quantity:', 'Enter the number of shirts you would like to order. Be sure to see the Shirt Size note for information on ordering multiple shirt sizes.', 1, 50),
(13, 'text1', 3, 'Name:', 'Enter your name.', 0, 0),
(14, 'text2', 3, 'Homeroom:', 'Enter your homeroom number.', 0, 10),
(15, 'radio1', 3, 'After school plans:', 'Please select the most appropriate option detailing your after high-school plans.', 0, 20),
(16, 'text3', 3, 'School:', 'If you chose College or Technical School, enter its name here. If you selected Military, please indicate what branch.', 0, 30),
(17, 'radio2', 3, 'College Sports?', 'Indicate if you are playing any sports next year (do not include intramural sports).', 0, 40),
(18, 'text4', 3, '', '', 0, 50);

-- --------------------------------------------------------

--
-- Table structure for table `formAccess`
--

DROP TABLE IF EXISTS `formAccess`;
CREATE TABLE IF NOT EXISTS `formAccess` (
  `UID` int(11) NOT NULL,
  `FID` int(11) NOT NULL,
  KEY `UID` (`UID`),
  KEY `FID` (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `formAccess`
--

INSERT INTO `formAccess` (`UID`, `FID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

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

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`FID`, `UID`, `title`) VALUES
(1, 1, 'Form 1'),
(2, 1, 'Form 2'),
(3, 1, 'Form 3');

-- --------------------------------------------------------

--
-- Table structure for table `radio_data`
--

DROP TABLE IF EXISTS `radio_data`;
CREATE TABLE IF NOT EXISTS `radio_data` (
  `EID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `opid` int(11) NOT NULL,
  KEY `UID` (`UID`),
  KEY `opid` (`opid`),
  KEY `EID` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `radio_data`
--

INSERT INTO `radio_data` (`EID`, `UID`, `opid`) VALUES
(10, 1, 2),
(15, 1, 3),
(17, 1, 9),
(15, 1, 3),
(17, 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `radio_options`
--

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

--
-- Dumping data for table `radio_options`
--

INSERT INTO `radio_options` (`opid`, `EID`, `value`, `text`, `weight`) VALUES
(1, 10, 'derry', 'Derry', 0),
(2, 10, 'latrobe', 'Latrobe', 10),
(3, 15, 'College', 'College', 0),
(4, 15, 'Tech School', 'Technical School', 10),
(5, 15, 'Military', 'Military', 20),
(6, 15, 'Workforce', 'Workforce', 30),
(7, 15, 'Undecided', 'Undecided', 40),
(8, 17, 'yes', 'Yes', 0),
(9, 17, 'no', 'No', 10);

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `mmode` tinyint(4) NOT NULL DEFAULT '0',
  `mmessage` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`mmode`, `mmessage`) VALUES
(0, 'Thank-you for visiting SurveyBin.<br /><br />We are currently offline for maintenance and should return shortly.<br /> Please keep checking back; we are sorry for any inconvenience this may cause.');

-- --------------------------------------------------------

--
-- Table structure for table `textarea_data`
--

DROP TABLE IF EXISTS `textarea_data`;
CREATE TABLE IF NOT EXISTS `textarea_data` (
  `EID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `input` text NOT NULL,
  KEY `EID` (`EID`),
  KEY `UID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `textarea_data`
--

INSERT INTO `textarea_data` (`EID`, `UID`, `input`) VALUES
(6, 1, 'Happy finals week!');

-- --------------------------------------------------------

--
-- Table structure for table `text_data`
--

DROP TABLE IF EXISTS `text_data`;
CREATE TABLE IF NOT EXISTS `text_data` (
  `EID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `input` text NOT NULL,
  KEY `UID` (`UID`),
  KEY `EID` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `text_data`
--

INSERT INTO `text_data` (`EID`, `UID`, `input`) VALUES
(1, 1, 'Braden Licastro'),
(3, 1, '6'),
(4, 1, 'Kelly Pohland'),
(5, 1, 'AL12'),
(7, 1, 'Devin Boyer'),
(8, 1, 'devin@live.com'),
(9, 1, 'W213'),
(12, 1, '1'),
(13, 1, 'Justin Kirkwood'),
(14, 1, 'Q111'),
(16, 1, 'Pitt Main Campus'),
(18, 1, ''),
(13, 1, 'Braden Licastro'),
(14, 1, 'NV2208'),
(16, 1, 'Allegheny College'),
(18, 1, 'Extreme Poetry');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

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

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `email`, `fName`, `lName`, `pass`, `group`, `activated`) VALUES
(1, 'noreply@fullforceapps.com', 'Root', NULL, '7b24afc8bc80e548d66c4e7ff72171c5', 0, 1),
(2, 'blicastro@live.com', 'Braden', 'Licastro', '2f7c55c0dea783761f37448e616cd8a5', 1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `check_data`
--
ALTER TABLE `check_data`
  ADD CONSTRAINT `check_data_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE,
  ADD CONSTRAINT `check_data_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE;

--
-- Constraints for table `check_options`
--
ALTER TABLE `check_options`
  ADD CONSTRAINT `check_options_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE;

--
-- Constraints for table `drop_data`
--
ALTER TABLE `drop_data`
  ADD CONSTRAINT `drop_data_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drop_data_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `drop_data_ibfk_4` FOREIGN KEY (`opid`) REFERENCES `drop_options` (`opid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drop_options`
--
ALTER TABLE `drop_options`
  ADD CONSTRAINT `drop_options_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `elements_ibfk_1` FOREIGN KEY (`FID`) REFERENCES `forms` (`FID`) ON DELETE CASCADE;

--
-- Constraints for table `formAccess`
--
ALTER TABLE `formAccess`
  ADD CONSTRAINT `formAccess_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE,
  ADD CONSTRAINT `formAccess_ibfk_2` FOREIGN KEY (`FID`) REFERENCES `forms` (`FID`) ON DELETE CASCADE;

--
-- Constraints for table `forms`
--
ALTER TABLE `forms`
  ADD CONSTRAINT `forms_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE;

--
-- Constraints for table `radio_data`
--
ALTER TABLE `radio_data`
  ADD CONSTRAINT `radio_data_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `radio_data_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `radio_data_ibfk_3` FOREIGN KEY (`opid`) REFERENCES `radio_options` (`opid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `radio_options`
--
ALTER TABLE `radio_options`
  ADD CONSTRAINT `radio_options_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `textarea_data`
--
ALTER TABLE `textarea_data`
  ADD CONSTRAINT `textarea_data_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `textarea_data_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `text_data`
--
ALTER TABLE `text_data`
  ADD CONSTRAINT `text_data_ibfk_3` FOREIGN KEY (`EID`) REFERENCES `elements` (`EID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `text_data_ibfk_4` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
