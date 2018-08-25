-- Schema for ERC Archive

-- Speakers (Preachers, etc)

CREATE TABLE `speakers` (
  `speakerID` int(11) NOT NULL AUTO_INCREMENT,
  `speakerName` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `speakerBio` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bioUpdateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `nameWithTitle` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'e.g. First Last -> Rev. Dr. First Last',
  PRIMARY KEY (`speakerID`),
  UNIQUE KEY `speakerName` (`speakerName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Audio recordings
-- File path: /campmeetingYear/filename

CREATE TABLE `audio` (
 `audioID` int(11) NOT NULL AUTO_INCREMENT,
 `length` int(11) NOT NULL COMMENT 'Length of the recording in seconds',
 `filename` varchar(128) NOT NULL,
 `speakerID` int(11) DEFAULT NULL COMMENT 'If associated with a speaker, this is their primary key',
 `campmeetingYear` int(4) NOT NULL COMMENT '4-digit year',
 `title` varchar(128) DEFAULT NULL COMMENT 'Title of recording, if null then show filename',
 `description` text DEFAULT NULL,
 PRIMARY KEY (`audioID`),
 UNIQUE KEY `filename` (`filename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Campmeetings

CREATE TABLE `campmeetings` (
 `campmeetingYear` int(4) NOT NULL,
  PRIMARY KEY (`campmeetingYear`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Which speakers came each year

CREATE TABLE `speakerVisits` (
 `campmeetingYear` int(4) NOT NULL,
 `speakerID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
