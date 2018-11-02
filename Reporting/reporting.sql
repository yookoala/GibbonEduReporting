SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE arrArchive (
  archiveID int(10) UNSIGNED NOT NULL,
  studentID int(10) UNSIGNED NOT NULL,
  reportID int(10) UNSIGNED NOT NULL,
  reportName varchar(255) NOT NULL,
  created datetime NOT NULL,
  firstDate datetime NOT NULL,
  lastDate datetime NOT NULL,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE arrCriteria (
  criteriaID int(10) UNSIGNED NOT NULL,
  subjectID int(10) UNSIGNED ZEROFILL NOT NULL,
  schoolYearID int(10) UNSIGNED NOT NULL,
  yearGroupID int(10) UNSIGNED NOT NULL,
  criteriaName varchar(255) NOT NULL,
  criteriaType tinyint(4) UNSIGNED NOT NULL DEFAULT '0',
  gradeScaleID int(10) UNSIGNED NOT NULL,
  criteriaOrder tinyint(3) UNSIGNED NOT NULL,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  arrCriteriacol varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE arrReport (
  reportID int(10) UNSIGNED NOT NULL,
  schoolYearID int(3) UNSIGNED ZEROFILL NOT NULL,
  reportName varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  reportNum tinyint(3) UNSIGNED NOT NULL DEFAULT '1',
  reportOrder tinyint(4) DEFAULT NULL,
  orientation tinyint(4) UNSIGNED NOT NULL DEFAULT '1',
  gradeScale int(10) UNSIGNED DEFAULT NULL,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE arrReportAssign (
  reportAssignID int(10) UNSIGNED NOT NULL,
  schoolYearID int(3) UNSIGNED ZEROFILL NOT NULL,
  yearGroupID int(3) UNSIGNED ZEROFILL NOT NULL,
  reportID int(10) NOT NULL,
  assignStatus tinyint(1) NOT NULL,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE arrReportGrade (
  reportGradeID int(10) UNSIGNED NOT NULL,
  reportID int(10) UNSIGNED DEFAULT NULL,
  criteriaID int(10) UNSIGNED NOT NULL,
  studentID int(10) UNSIGNED NOT NULL,
  gradeID varchar(10) NOT NULL,
  mark float NOT NULL,
  percent float NOT NULL,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE arrReportSection (
  sectionID int(10) UNSIGNED NOT NULL,
  reportID int(10) UNSIGNED DEFAULT NULL,
  sectionType int(10) UNSIGNED DEFAULT NULL,
  sectionOrder int(10) UNSIGNED DEFAULT NULL,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE arrReportSectionDetail (
  reportSectionDetailID int(10) UNSIGNED NOT NULL,
  sectionID int(10) UNSIGNED DEFAULT NULL,
  sectionContent text,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE arrReportSectionType (
  reportSectionTypeID int(11) NOT NULL,
  sectionTypeName varchar(45) DEFAULT NULL,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE arrReportSubject (
  reportSubjectID int(10) UNSIGNED NOT NULL,
  studentID int(10) UNSIGNED ZEROFILL NOT NULL,
  subjectID int(10) UNSIGNED NOT NULL,
  classID int(8) UNSIGNED ZEROFILL NOT NULL,
  reportID int(10) UNSIGNED NOT NULL,
  subjectComment text,
  teacherID int(10) UNSIGNED DEFAULT NULL,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE arrStatus (
  statusID int(10) UNSIGNED NOT NULL,
  reportID int(10) NOT NULL,
  roleID int(3) UNSIGNED ZEROFILL NOT NULL,
  reportStatus tinyint(4) NOT NULL,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE arrSubjectOrder (
  subjectOrderID int(10) UNSIGNED NOT NULL,
  subjectID int(10) UNSIGNED NOT NULL,
  schoolYearID int(10) UNSIGNED NOT NULL,
  yearGroupID int(10) UNSIGNED NOT NULL,
  subjectOrder tinyint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


ALTER TABLE arrArchive
  ADD PRIMARY KEY (archiveID),
  ADD UNIQUE KEY studentID (studentID,reportID);

ALTER TABLE arrCriteria
  ADD PRIMARY KEY (criteriaID),
  ADD UNIQUE KEY criteriaName (subjectID,criteriaName);

ALTER TABLE arrReport
  ADD PRIMARY KEY (reportID),
  ADD UNIQUE KEY schoolYearID (schoolYearID,reportName),
  ADD KEY reportNum (reportNum);

ALTER TABLE arrReportAssign
  ADD PRIMARY KEY (reportAssignID),
  ADD UNIQUE KEY yearGroupID (yearGroupID,reportID,schoolYearID);

ALTER TABLE arrReportGrade
  ADD PRIMARY KEY (reportGradeID),
  ADD UNIQUE KEY criteriaID (studentID,criteriaID,reportID);

ALTER TABLE arrReportSection
  ADD PRIMARY KEY (sectionID);

ALTER TABLE arrReportSectionDetail
  ADD PRIMARY KEY (reportSectionDetailID),
  ADD UNIQUE KEY sectionID (sectionID);

ALTER TABLE arrReportSectionType
  ADD PRIMARY KEY (reportSectionTypeID),
  ADD UNIQUE KEY sectionTypeName (sectionTypeName);

ALTER TABLE arrReportSubject
  ADD PRIMARY KEY (reportSubjectID),
  ADD UNIQUE KEY arrPersonID (studentID,reportID,subjectID);

ALTER TABLE arrStatus
  ADD PRIMARY KEY (statusID),
  ADD UNIQUE KEY reportID (reportID,roleID);

ALTER TABLE arrSubjectOrder
  ADD PRIMARY KEY (subjectOrderID),
  ADD UNIQUE KEY subjectYear (subjectID,schoolYearID,yearGroupID);


ALTER TABLE arrArchive
  MODIFY archiveID int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
ALTER TABLE arrCriteria
  MODIFY criteriaID int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;
ALTER TABLE arrReport
  MODIFY reportID int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
ALTER TABLE arrReportAssign
  MODIFY reportAssignID int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
ALTER TABLE arrReportGrade
  MODIFY reportGradeID int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;
ALTER TABLE arrReportSection
  MODIFY sectionID int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
ALTER TABLE arrReportSectionDetail
  MODIFY reportSectionDetailID int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
ALTER TABLE arrReportSectionType
  MODIFY reportSectionTypeID int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
ALTER TABLE arrReportSubject
  MODIFY reportSubjectID int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
ALTER TABLE arrStatus
  MODIFY statusID int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
ALTER TABLE arrSubjectOrder
  MODIFY subjectOrderID int(10) UNSIGNED NOT NULL AUTO_INCREMENT;