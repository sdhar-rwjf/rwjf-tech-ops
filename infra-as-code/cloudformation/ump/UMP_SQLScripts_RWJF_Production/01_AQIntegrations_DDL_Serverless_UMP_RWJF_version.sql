-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: AQ
-- Source Schemata: aqintegrations
-- Created: Tue Aug 17 21:43:38 2022
-- Workbench Version: 8.0.26
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------------------------------------------------------
-- Schema aqintegrations
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `aqintegrations` ;
CREATE SCHEMA IF NOT EXISTS `aqintegrations` ;


-- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_userjunction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_userjunction` (
    `sysid_applicationuser` BIGINT NULL,
    `email` VARCHAR(256) NULL,
    `emplid` VARCHAR(256) NULL,
    `managedbyimport` VARCHAR(1) NULL,
    `modifytimestamp` VARCHAR(50) NULL,
    `createdate` DATETIME(6) NULL,
    `modifydate` DATETIME(6) NULL,
    `batch_id` INT NULL,
    UNIQUE INDEX `IX_uimp_UserJunction` (`email` ASC),
    INDEX `IX_uimp_UserJunction_1` (`sysid_applicationuser` ASC),
    INDEX `IX_UserJunction_ManagedByImport` (`emplid`(255) ASC, `managedbyimport` ASC, `sysid_applicationuser` ASC));

-- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_requesterupdatelog
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_requesterupdatelog` (
  `batch_ID` BIGINT NOT NULL AUTO_INCREMENT,
  `createdate` DATETIME(6) NOT NULL,
  `added` INT NULL,
  `updated` INT NULL,
  `deleted` INT NULL,
  `totalrecs` INT NULL,
  `successcount` INT NULL,
  `failurecount` INT NULL,
  `nostatuscount` INT NULL,
  `errors` INT NULL,
  `Comment` VARCHAR(2000) NULL,
  UNIQUE INDEX `IX_uimp_RequesterUpdateLog` (`batch_id` ASC));

-- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_processtrackinglog
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_processtrackinglog` (
  `processstepID` BIGINT NOT NULL AUTO_INCREMENT,
  `batch_id` BIGINT NULL,
  `stepname` VARCHAR(255) NOT NULL,
  `processsteptimeinseconds` INT NULL,
  `executionstartdatetime` DATETIME(6) NULL,
  `status` VARCHAR(20) NULL,
  `error` VARCHAR(2000) NULL,
  UNIQUE INDEX `IX_uimp_ProcessTrackingLog` (`ProcessStepID` ASC));


-- ----------------------------------------------------------------------------
-- DROP Table aqintegrations.uimp_settings
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_settings` (
    `settingname` VARCHAR(256) NOT NULL,
    `settingvalue` VARCHAR(512) NULL,
    `description` VARCHAR(1024) NULL,
  PRIMARY KEY (`SettingName`));


-- ----------------------------------------------------------------------------
-- Drop Table aqintegrations.uimp_rawdata
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_rawdata` (
  `UNIQUE_ID` VARCHAR(50) NULL,
  `FIRSTNAME` VARCHAR(50) NULL,
  `LASTNAME` VARCHAR(50) NULL,
  `PRIMARY_EMAIL_ADDRESS` VARCHAR(256) NULL,
  `STATUS` VARCHAR(8) NULL,
  `Middle_Initial` VARCHAR(1) NULL,
  `Preferred_Name` VARCHAR(50) NULL,
  `Department` VARCHAR(50) NULL,
  `Title` VARCHAR(50) NULL,
  `Work_Phone` VARCHAR(20) NULL,
  `SAML` VARCHAR(35) NULL,
  `Location` VARCHAR(150) NULL,
  `EmployeeID` VARCHAR(6) NULL,
  `Business_Unit` VARCHAR(50) NULL);

-- ----------------------------------------------------------------------------
-- drop Table aqintegrations.uimp_requesterupdate
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_requesterupdate` (
  `empliD` VARCHAR(50) NULL,
  `ntuserid` VARCHAR(50) NULL,
  `firstname` VARCHAR(50) NULL,
  `preferredname` VARCHAR(100) NULL,
  `middleinitial` VARCHAR(5) NULL,
  `lastname` VARCHAR(50) NULL,
  `email` VARCHAR(256) NULL,
  `saml` VARCHAR(256) NULL,
  `title` VARCHAR (100) NULL,
  `department` VARCHAR (100) NULL,
  `businessunit` VARCHAR (100) NULL,
  `organizationcode` VARCHAR(150) NULL,
  `workphone` VARCHAR (50) NULL,
  `mobilephone` VARCHAR (25) NULL,
  `employeeid` VARCHAR (50) NULL, 
  `location` VARCHAR (256) NULL,   
  `reservelocation` VARCHAR (256) NULL, 
  `language` VARCHAR (100) NULL,
  `userrole` VARCHAR (100) NULL,
  `sysidRole` BIGINT NULL,
  `sysidLanguage` BIGINT NULL,
  `sysidDepartment` BIGINT NULL,
  `sysidTitle` BIGINT NULL,
  `sysidBusinessUnit` BIGINT NULL,
  `sysidManager` BIGINT NULL,
  `sysidUserStatus` INT NULL,
  `locationId` BIGINT NULL,
  `badge` VARCHAR(50) NULL,
  `status` VARCHAR(50) NULL,
  `usergroups` TEXT NULL,
  INDEX `IX_RequesteUpdate_EMPLID` (`emplid` ASC, `Email` ASC));

-- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_requesterupdateerror
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_requesterupdateerror` (
  `errorid` BIGINT NOT NULL AUTO_INCREMENT,
  `emplid` VARCHAR(250) NULL,
  `ntuserid` VARCHAR(250) NULL,
  `firstname` VARCHAR(65) NULL,
  `lastname` VARCHAR(65) NULL,
  `email` VARCHAR(256) NULL,
  `status` VARCHAR(25) NULL,
  `createdate` DATETIME(6) NULL,
  `error` VARCHAR(256) NULL,
  `batch_id` INT NOT NULL,
  UNIQUE INDEX `IX_uimp_RequesterUpdateError` (`errorid` ASC));


-- ----------------------------------------------------------------------------
-- DROP Table aqintegrations.uimp_aqreserveuserdata
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_aqreserveuserdata` (
  `SYSID_ApplicationUser` BIGINT NOT NULL,
  `LASTNAME` VARCHAR(50) NULL,
  `FIRSTNAME` VARCHAR(50) NULL,
  `MIDDLEINITIAL` VARCHAR(50) NULL,
  `PREFERREDNAME` VARCHAR(100)  NULL,
  `PRIMARYEMAILADDRESS` VARCHAR(256) NULL,
  `STATUS` VARCHAR(20) NULL,
  `PRIVATEPROFILE` VARCHAR(10) NULL,
  `LANGUAGE` VARCHAR(65) NULL,
  `LOCATION` VARCHAR(256) NULL,
  `DEPARTMENT` VARCHAR(100) NULL,
  `TITLE` VARCHAR(100) NULL,
  `WORKPHONE` VARCHAR(64) NULL,
  `MOBILEPHONE` VARCHAR(50) NULL,
  `ADDITIONALEMAIL` VARCHAR(100) NULL,
  `USERROLE` VARCHAR(50) NULL,
  `USERGROUPS` TEXT NULL,
  `BADGE` VARCHAR(50) NULL,
  `SAML` VARCHAR(256) NULL,
  `MAXDAYSINADVANCE` VARCHAR(10) NULL,
  `MAXWORKSPACERESERVATIONS` VARCHAR(10) NULL,
  `BUMP` VARCHAR(10) NULL,
  `MAKEASSETSAVAILABLEBUMP` VARCHAR(10) NULL,
  `AUTOBUMP` VARCHAR(10) NULL,
  `MAKEASSETSAVAILABLEAUTOBUMP` VARCHAR(10) NULL,
  `GAPCONFLICTING` VARCHAR(10) NULL,
  `LOCATIONPREFERENCE` VARCHAR(50)  NULL,
  `ASSETCATEGORYPREFERENCE` VARCHAR(50)  NULL,
  `PHONEINFORMATION` TEXT  NULL,
  `ORGANIZATIONCODE` VARCHAR(255)  NULL,
  `EMPLOYEEID` VARCHAR(255)  NULL,
  `BUSINESSUNIT` VARCHAR (100)   NULL,
  `PRIMARYWORKSPACE` VARCHAR (100)  NULL,
  `PRIMARYWORKSPACELOCATION` TEXT  NULL,
  `MAXWORKSPACEDAYSWEEKALLOWED` VARCHAR (10)  NULL,
  `RECEIVERESERVATIONCONFIRMATION` VARCHAR(10)  NULL,
  `RECEIVERESERVATIONUPDATED` VARCHAR(10)  NULL,
  `RECEIVERESERVATIONREMINDER` VARCHAR(10)  NULL,
  `RECEIVERESERVATIONCANCELED` VARCHAR(10)  NULL,
  `RECEIVERESERVATIONCANCELEDBYADMINUSERORBYTHEAPPLICATION` VARCHAR(10)  NULL,
  `RECEIVERESERVATIONCANCELEDBYAPPLICATIONDUETOFAILURETOCHECKIN` VARCHAR(10)  NULL,
  `RECEIVERESERVATIONCANCELLATIONWARNING` VARCHAR(10)  NULL,
  `RECEIVEREQUESTAPPROVED` VARCHAR(10)  NULL,
  `RECEIVEREQUESTDENIED` VARCHAR(10)  NULL,
  `RECEIVECHECKINSUCCESSFUL_FORPRESENCEEVENTSONLY` VARCHAR(10)  NULL,
  `sysidRole` BIGINT NULL,
  `sysidLanguage` BIGINT NULL,
  `sysidDepartment` BIGINT NULL,
  `sysidTitle` BIGINT NULL,
  `sysidBusinessUnit` BIGINT NULL,
  `sysidManager` BIGINT NULL,
  `sysidAccount` BIGINT NULL,
  `originaluser` VARCHAR (10)  NULL,
  `comments` TEXT  NULL,
  `address1` VARCHAR (512)  NULL,
  `address2` VARCHAR (512)  NULL,
  `city` VARCHAR (256)  NULL,
  `state_province` VARCHAR (256)  NULL,
  `postalcode` VARCHAR (50)  NULL,
  `country` VARCHAR (256)  NULL,
  `sysidDefaultCategory` BIGINT NULL,
  `sysidDefaultResType` BIGINT NULL,
  `defaultChargeCode` VARCHAR (256)  NULL,
  `calendarURL` TEXT  NULL,
  `statusMessage` TEXT  NULL,
  `userEmailPreferences` TEXT  NULL,
  `userImages` TEXT  NULL,
  `userContacts` TEXT  NULL,
  `userCredentials` TEXT  NULL,  
  `userAttributeValue` TEXT  NULL,  
  `mypeople` TEXT  NULL,
  `myrooms`  TEXT  NULL,
  `myDelegates` TEXT  NULL,
  `preferences` TEXT  NULL,
  `userAuthRules` TEXT  NULL,
  `sysidUserStatus` INT NULL,
  `userPassword` VARCHAR (256)  NULL,
  `accountLocked` VARCHAR (20)  NULL,
  `sysidDefaultLocation` BIGINT NULL,
  `sysidHomeLocation` BIGINT NULL,
  `forums` TEXT  NULL,
  `aqPasswordExpDate` TEXT  NULL,
  `groupMemberships` TEXT  NULL,
  `sysidSAMLUserCredential` BIGINT NULL,
  `sysidBadgeUserCredential` BIGINT NULL,
  `sysidOrgCodeUserAttribute` BIGINT NULL,
  `sysidEmplIDUserAttribute`  BIGINT NULL,
  `reservationSpendingLimit`  BIGINT NULL);
  
-- ----------------------------------------------------------------------------
-- DROP Table aqintegrations.uimp_aqreserveprocess
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_aqreserveprocess` (
  `BatchID` INT NOT NULL,
  `EMPLID` VARCHAR(50) NULL,
  `SYSID_ApplicationUser` BIGINT NOT NULL,
  `NTUSERID` VARCHAR(50) NULL,
  `FirstName` VARCHAR(50) NOT NULL,
  `MiddleInitial` VARCHAR(50) NULL,
  `LastName` VARCHAR(50) NOT NULL,
  `PreferredName` VARCHAR(100) NULL,
  `Email` VARCHAR(256) NOT NULL,
  `PRIVATEPROFILE` VARCHAR(10)  NULL,
  `LANGUAGE` VARCHAR(65)  NULL,
  `LOCATION` VARCHAR(256)  NULL,
  `DEPARTMENT` VARCHAR(100)  NULL,
  `TITLE` VARCHAR(100)  NULL,
  `WORKPHONE` VARCHAR(64)  NULL,
  `MOBILEPHONE` VARCHAR(50)  NULL,
  `ADDITIONALEMAIL` VARCHAR(100)  NULL,
  `USERROLE` VARCHAR(50)  NULL,
  `USERGROUPS` TEXT  NULL,
  `BADGE` VARCHAR(50)  NULL,
  `SAML` VARCHAR(256) NULL,
  `MAXDAYSINADVANCE` VARCHAR(10)  NULL,
  `MAXWORKSPACERESERVATIONS` VARCHAR(10)  NULL,
  `BUMP` VARCHAR(10)  NULL,
  `MAKEASSETSAVAILABLEBUMP` VARCHAR(10)  NULL,
  `AUTOBUMP` VARCHAR(10)  NULL,
  `MAKEASSETSAVAILABLEAUTOBUMP` VARCHAR(10)  NULL,
  `GAPCONFLICTING` VARCHAR(10)  NULL,
  `LOCATIONPREFERENCE` VARCHAR(50)  NULL,
  `ASSETCATEGORYPREFERENCE` VARCHAR(50)  NULL,
  `PHONEINFORMATION` VARCHAR(0)  NULL,
  `ORGANIZATIONCODE` VARCHAR(255)  NULL,
  `EMPLOYEEID` VARCHAR(255)  NULL,
  `BUSINESSUNIT` VARCHAR (100)   NULL,
  `PRIMARYWORKSPACE` VARCHAR (100)  NULL,
  `PRIMARYWORKSPACELOCATION` TEXT  NULL,
  `MAXWORKSPACEDAYSWEEKALLOWED` VARCHAR (10)  NULL,
  `RECEIVERESERVATIONCONFIRMATION` VARCHAR(10)  NULL,
  `RECEIVERESERVATIONUPDATED` VARCHAR(10)  NULL,
  `RECEIVERESERVATIONREMINDER` VARCHAR(10)  NULL,
  `RECEIVERESERVATIONCANCELED` VARCHAR(10)  NULL,
  `RECEIVERESERVATIONCANCELEDBYADMINUSERORBYTHEAPPLICATION` VARCHAR(10)  NULL,
  `RECEIVERESERVATIONCANCELEDBYAPPLICATIONDUETOFAILURETOCHECKIN` VARCHAR(10)  NULL,
  `RECEIVERESERVATIONCANCELLATIONWARNING` VARCHAR(10)  NULL,
  `RECEIVEREQUESTAPPROVED` VARCHAR(10)  NULL,
  `RECEIVEREQUESTDENIED` VARCHAR(10)  NULL,
  `RECEIVECHECKINSUCCESSFUL_FORPRESENCEEVENTSONLY` VARCHAR(10)  NULL,
  `Password` VARCHAR(50) NULL,
  `Status` VARCHAR(20) NOT NULL,
  `sysidRole` BIGINT NULL,
  `sysidLanguage` BIGINT NULL,
  `sysidDepartment` BIGINT NULL,
  `sysidTitle` BIGINT NULL,
  `sysidBusinessUnit` BIGINT NULL,
  `sysidManager` BIGINT NULL,
  `sysidAccount` BIGINT NULL,
  `originaluser` VARCHAR (10)  NULL,
  `comments` TEXT  NULL,
  `address1` VARCHAR (512)  NULL,
  `address2` VARCHAR (512)  NULL,
  `city` VARCHAR (256)  NULL,
  `state_province` VARCHAR (256)  NULL,
  `postalcode` VARCHAR (50)  NULL,
  `country` VARCHAR (256)  NULL,
  `sysidDefaultCategory` BIGINT NULL,
  `sysidDefaultResType` BIGINT NULL,
  `defaultChargeCode` VARCHAR (256)  NULL,
  `calendarURL` TEXT  NULL,
  `statusMessage` TEXT  NULL,
  `userEmailPreferences` TEXT  NULL,
  `userImages` TEXT  NULL,
  `userContacts` TEXT  NULL,
  `userCredentials` TEXT  NULL,
  `userAttributeValue` TEXT  NULL,    
  `mypeople` TEXT  NULL,
  `myrooms`  TEXT  NULL,
  `myDelegates` TEXT  NULL,
  `preferences` TEXT  NULL,
  `userAuthRules` TEXT  NULL,
  `sysidUserStatus` INT NULL,
  `userPassword` VARCHAR (256)  NULL,
  `accountLocked` VARCHAR (20)  NULL,
  `sysidDefaultLocation` BIGINT NULL,
  `sysidHomeLocation` BIGINT NULL,
  `forums` TEXT  NULL,
  `aqPasswordExpDate` VARCHAR (256)  NULL,
  `groupMemberships` TEXT  NULL,
  `sysidSAMLUserCredential` BIGINT NULL,
  `sysidBadgeUserCredential` BIGINT NULL,
  `sysidOrgCodeUserAttribute` BIGINT NULL,
  `sysidEmplIDUserAttribute`  BIGINT NULL,
  `reservationSpendingLimit`  BIGINT NULL,
  `Action` BIGINT NOT NULL,
  `ActionStatus` CHAR(1) NULL,
  `ErrorMessage` VARCHAR(1000) NULL);

 
-- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_usergroup
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_usergroup` (
  `sysidUserGroup` BIGINT NOT NULL,
  `name` VARCHAR(255)  NULL,
  `description` VARCHAR(255)  NULL,
  UNIQUE INDEX `IX_uimp_usergroup` (`sysidUserGroup` ASC));
  
 -- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_userrole
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_userrole` (
  `sysidRole` BIGINT NOT NULL,
  `name` VARCHAR(50)  NULL,
  UNIQUE INDEX `IX_uimp_userrole` (`sysidRole` ASC));
 
 
-- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_usergroupassignment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_usergroupassignment` (
  `emplid` VARCHAR(50) NULL,
  `sysidUserGroup` BIGINT NOT NULL);

 -- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_Languages
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_language` (
  `sysidLanguage` BIGINT NOT NULL,
  `languageName` VARCHAR(50)  NULL,
  `language` VARCHAR(50)  NULL,
  `country` VARCHAR(255)  NULL,
  `languageTag` VARCHAR(255)  NULL,
  UNIQUE INDEX `IX_uimp_language` (`sysidLanguage` ASC));
  

 -- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_department
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_department` (
  `sysidDepartment` BIGINT NOT NULL,
  `DepartmentName` VARCHAR(100)  NULL,
  UNIQUE INDEX `IX_uimp_department` (`sysidDepartment` ASC));


 -- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_authorizationruleset
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_authorizationruleset` (
  `sysidRole` INT NOT NULL,
  `RoleName` NVARCHAR(256) NULL,
  `sysidRoleAuthRule` BIGINT NOT NULL,
  `sysidAuthorizationRule` BIGINT NOT NULL);


 -- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_title
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_title` (
  `sysidTitle` BIGINT NOT NULL,
  `TitleName` VARCHAR(100)  NULL,
  UNIQUE INDEX `IX_uimp_title` (`sysidTitle` ASC));


 -- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_businessunit
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_businessunit` (
  `sysidBusinessUnit` BIGINT NOT NULL,
  `BusinessUnitName` VARCHAR(100)  NULL,
  UNIQUE INDEX `IX_uimp_businessunit` (`sysidBusinessUnit` ASC));

  
-- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_reserveruserdataids
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_reserveruserdataids` (
  `sysidApplicationUser` BIGINT NOT NULL,
  `UserDetailsDownloaded` VARCHAR(1)  NULL,
  `Batch_ID` BIGINT NULL,
  `CreateDate` DATETIME(6) NOT NULL);
  

 -- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_location
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_location` (
  `LocationID` BIGINT NOT NULL,
  `LocationName` VARCHAR(256)  NULL,
  UNIQUE INDEX `IX_uimp_location` (`LocationID` ASC));
 

 -- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_searchedusers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_searchedusers` (
  `SYSID_ApplicationUser` BIGINT NOT NULL,
  `RecordSearched` VARCHAR(1) NULL,
UNIQUE INDEX `IX_uimp_searchedusers` (`SYSID_ApplicationUser` ASC));
 

-- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_archivedusers
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_archivedusers` (
  `archiveId` BIGINT NOT NULL AUTO_INCREMENT,
  `emplid` VARCHAR(250)  NOT NULL,
  `SYSID_ApplicationUser` BIGINT NOT NULL,
  `email` VARCHAR(256)  NOT NULL,
  `archivedate` DATETIME(6) NOT NULL,
  `batch_id` INT NOT NULL,
  UNIQUE INDEX `IX_uimp_archiveusers` (`archiveId` ASC));


 -- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_departmentusergroups
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_departmentusergroups` (
  `sysidDepartmentGroup` BIGINT NOT NULL AUTO_INCREMENT,
  `Department` VARCHAR(100) NULL,
  `UserGroup` VARCHAR(256) NULL,
 UNIQUE INDEX `IX_uimp_departmentusergroup` (`sysidDepartmentGroup` ASC));
 

 
 -- ----------------------------------------------------------------------------
-- Table aqintegrations.uimp_locationmapping
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `aqintegrations`.`uimp_locationmapping` (
  `sysid_locationmapping` BIGINT NOT NULL AUTO_INCREMENT,
  `Location` VARCHAR(100) NULL,
  `ReserveLocation` VARCHAR(256) NULL,
 UNIQUE INDEX `IX_uimp_locationmapping` (`sysid_locationmapping` ASC));