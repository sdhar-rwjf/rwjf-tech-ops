DELIMITER //

CREATE PROCEDURE `aqintegrations`.`p_uimp1b_populaterequesterupdate`()
BEGIN
	INSERT INTO uimp_requesterupdate (
                                   emplid,
                                   ntuserid,
                                   firstname,
                                   lastname,
								   middleinitial,
								   preferredname,
                                   email,
                                   saml,
                                   status,
								   department,
								   businessunit,
								   title,
								   workphone,
								   location,
								   employeeid
                            )
                            SELECT trim(UNIQUE_ID) emplid,
                                trim(UNIQUE_ID) ntuserid,
                                trim(FIRSTNAME) firstname,
                                trim(LASTNAME) lastname,
								CASE trim(Middle_Initial) WHEN '' THEN NULL ELSE trim(Middle_Initial) END middleinitial,
								CASE trim(Preferred_Name) WHEN '' THEN NULL ELSE trim(Preferred_Name) END preferredname,
                                trim(PRIMARY_EMAIL_ADDRESS) email,
                                CASE trim(SAML) WHEN '' THEN NULL ELSE trim(saml) END saml,
                                CASE trim(STATUS) WHEN 'Active' THEN 'A' WHEN 'Inactive' THEN 'I' ELSE NULL END status,
								CASE trim(Department) WHEN '' THEN NULL ELSE trim(Department) END department,
								CASE trim(Business_Unit) WHEN '' THEN NULL ELSE trim(Business_Unit) END businessunit,
								CASE trim(Title) WHEN '' THEN NULL ELSE trim(Title) END title,
								CASE trim(Work_Phone) WHEN '' THEN NULL ELSE trim(Work_Phone) END workphone,
								CASE trim(Location) WHEN '' THEN NULL ELSE trim(Location) END location,
								CASE trim(EmployeeID) WHEN '' THEN NULL ELSE trim(EmployeeID) END employeeid
                            FROM uimp_rawdata;
END //

DELIMITER ;
