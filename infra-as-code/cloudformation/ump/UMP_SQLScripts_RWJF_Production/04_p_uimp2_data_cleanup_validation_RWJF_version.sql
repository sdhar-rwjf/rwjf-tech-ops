DELIMITER //

CREATE PROCEDURE `aqintegrations`.`p_uimp2_data_cleanup_validation`(IN batch_id BIGINT)
BEGIN

	UPDATE uimp_requesterupdate SET FirstName = REPLACE(FirstName,'"',''), LastName = REPLACE(LastName,'"','');
	
	UPDATE uimp_requesterupdate ru 
	INNER JOIN uimp_locationmapping lm ON ru.location=lm.location
	SET ru.reservelocation=lm.reservelocation
	WHERE ru.location IS NOT NULL;
	
		
	DELETE FROM uimp_requesterupdate WHERE (emplid IS NULL AND firstname IS NULL AND lastname IS NULL AND ntuserid IS NULL)
                                                OR (emplid = 'NULL' AND firstname = 'NULL' AND lastname  = 'NULL' AND ntuserid= 'NULL')
                                                OR (emplid = '' AND firstname = '' AND lastname  = '' AND ntuserid = '');
	
	INSERT INTO uimp_requesterupdateerror(emplid, ntuserid, firstname, lastname, email, status, createdate, error, batch_id)
    SELECT DISTINCT emplid
					,ntuserid
                    ,firstname
                    ,lastname
                    ,'None Given'
                    ,CASE WHEN status is NULL THEN 'Invalid' ELSE status END
                    ,Now()
                    ,'Invalid Email Address'
                    ,batch_id
    FROM uimp_requesterupdate 
    WHERE Status IN ('A','I','T')
    AND (email is null or email = '' OR Email NOT LIKE '%@%' OR Email like '% %');
	

	INSERT INTO uimp_requesterupdateerror(emplid, ntuserid, firstname, lastname, email, status, createdate, error, batch_id)
    SELECT DISTINCT emplid
					,ntuserid
                    ,firstname
                    ,lastname
                    ,email
                    ,CASE WHEN status is NULL THEN 'Invalid' ELSE status END
                    ,Now()
                    ,'Duplicate Email'
                    ,batch_id
    FROM uimp_requesterupdate
    WHERE email <> ''
        AND email IS NOT NULL 
        AND email IN (SELECT email FROM uimp_requesterupdate GROUP BY email HAVING COUNT(*)>1)
        AND emplid NOT IN (SELECT emplid FROM uimp_requesterupdateerror);


	INSERT INTO uimp_requesterupdateerror(emplid, ntuserid, firstname, lastname, email, status, createdate, error, batch_id)
    SELECT DISTINCT emplid
					,ntuserid
                    ,firstname
                    ,lastname
                    ,email
                    ,CASE WHEN status is NULL THEN 'Invalid' ELSE status END
                    ,Now()
                    ,'Duplicate Employee ID'
                    ,batch_id
    FROM uimp_requesterupdate
    WHERE emplid <> ''
		AND emplid IS NOT NULL 
        AND emplid IN (SELECT emplid FROM uimp_requesterupdate GROUP BY emplid HAVING COUNT(*)>1)
        AND emplid NOT IN (SELECT emplid FROM uimp_requesterupdateerror);


	INSERT INTO uimp_requesterupdateerror(emplid, ntuserid, firstname, lastname, email, status, createdate, error, batch_id)
    SELECT DISTINCT emplid
                    ,ntuserid
                    ,firstname
                    ,lastname
                    ,email
                    ,CASE WHEN status is NULL THEN 'Invalid' ELSE status END
                    ,Now()
                    ,'Duplicate SAML Credentials'
                    ,batch_id
    FROM uimp_requesterupdate
    WHERE saml <> ''
		AND saml IS NOT NULL 
        AND saml IN (SELECT saml FROM uimp_requesterupdate GROUP BY saml HAVING COUNT(*)>1)
        AND emplid NOT IN (SELECT emplid FROM uimp_requesterupdateerror);

	DELETE FROM uimp_requesterupdate where EmplID IN ( SELECT * FROM (SELECT EmplID FROM uimp_requesterupdate Group By EmplID HAVING COUNT(*)>1) AS t1) 
                                                OR Email IN ( SELECT * FROM  (SELECT Email FROM uimp_requesterupdate GROUP BY Email HAVING COUNT(*)>1) AS t3) 
                                                OR Saml IN ( SELECT * FROM  (SELECT saml from uimp_requesterupdate GROUP BY saml HAVING COUNT(*)>1) AS t4);
												
	
	INSERT INTO uimp_requesterupdateerror(emplid, ntuserid, firstname, lastname, email, status, createdate, error, batch_id)
    SELECT DISTINCT emplid
                    ,ntuserid
                    ,firstname
                    ,lastname
                    ,email
                    ,CASE WHEN status is NULL THEN 'Invalid' ELSE status END
                    ,Now()
                    ,'Validation Failed for FirstName'
                    ,batch_id
    FROM uimp_requesterupdate 
    WHERE status IN ('A','I','T')
        AND email NOT IN (SELECT email from uimp_requesterupdateerror)
        AND email IN (SELECT email FROM uimp_requesterupdate   
                      WHERE length(firstname) > 50
                        OR firstname is null
                        OR firstname = 'null'
                        OR firstname like ''
                        OR firstname like '%1%' 
                        OR firstname like '%2%'
                        OR firstname like '%3%'
                        OR firstname like '%4%'
                        OR firstname like '%5%'
                        OR firstname like '%6%'
                        OR firstname like '%7%'
                        OR firstname like '%8%'
                        OR firstname like '%9%'
                        OR firstname is NULL);

	INSERT INTO uimp_requesterupdateerror(emplid, ntuserid, firstname, lastname, email, status, createdate, error, batch_id)
    SELECT DISTINCT emplid
                    ,ntuserid
                    ,firstname
                    ,lastname
                    ,email
                    ,CASE WHEN status is NULL THEN 'Invalid' ELSE status END
                    ,Now()
                    ,'Validation Failed for LastName'
                    ,batch_id
    FROM uimp_requesterupdate 
    WHERE status IN ('A','I','T') 
		AND email NOT IN (SELECT email from uimp_requesterupdateerror) 
        AND email IN (SELECT email FROM uimp_requesterupdate   
                      WHERE length(lastname) > 50
                        OR lastname is null
                        OR lastname = 'null'
                        OR lastname like ''
                        OR lastname like '%1%' 
                        OR lastname like '%2%'
                        OR lastname like '%3%'
                        OR lastname like '%4%'
                        OR lastname like '%5%'
                        OR lastname like '%6%'
                        OR lastname like '%7%'
                        OR lastname like '%8%'
                        OR lastname like '%9%'
                        OR lastname is NULL);

	INSERT INTO uimp_requesterupdateerror(emplid, ntuserid, firstname, lastname, email, status, createdate, error, batch_id)
    SELECT DISTINCT emplid
                    ,ntuserid
                    ,firstname
                    ,lastname
                    ,email
                    ,CASE WHEN status is NULL THEN 'Invalid' ELSE status END
                    ,Now()
                    ,'Validation Failed for NTUserID'
                    ,batch_id
    FROM uimp_requesterupdate
    WHERE (Status IN ('A','I','T'))
    AND (ntuserid IN (SELECT NTUserID FROM uimp_requesterupdate  WHERE length(ntuserid) > 100)
                        OR ntuserid LIKE ''
                        OR ntuserid = 'null'
                        OR ntuserid IS NULL
                        OR (COALESCE(ntuserid,'') = ''))
                        AND emplid NOT IN (SELECT ntuserid FROM uimp_requesterupdateerror);
	
	INSERT INTO uimp_requesterupdateerror(emplid, ntuserid, firstname, lastname, email, status, createdate, error, batch_id)
    SELECT DISTINCT emplid
                    ,ntuserid
                    ,firstname
                    ,lastname
                    ,email
                    ,CASE WHEN status is NULL THEN 'Invalid' ELSE status END
                    ,Now()
                    ,'Validation Failed for EMPLID'
                    ,batch_id
    FROM uimp_requesterupdate 
    WHERE emplid IN (SELECT emplid FROM uimp_requesterupdate 
                        WHERE length(emplid) > 100
                            OR emplid like '')
                            OR emplid is NULL
                            OR (COALESCE(emplid,'') = '')                                                            
                        AND emplid NOT IN (SELECT emplid from uimp_requesterupdateerror);


	DELETE FROM uimp_requesterupdate 
    WHERE (Status IN ('A','I','T') AND email IN
			( SELECT * FROM (SELECT email FROM uimp_requesterupdate  
				WHERE length(firstname) > 50
                    OR firstname is null
                    OR firstname = 'null'
                    OR firstname like ''
                    OR firstname like '%1%' 
                    OR firstname like '%2%'
                    OR firstname like '%3%'
                    OR firstname like '%4%'
                    OR firstname like '%5%'
                    OR firstname like '%6%'
                    OR firstname like '%7%'
                    OR firstname like '%8%'
                    OR firstname like '%9%'
                    OR firstname is NULL) AS T1))
                    OR (Status IN ('A','I','T') AND email IN
            ( SELECT * FROM (SELECT email FROM uimp_requesterupdate  
                WHERE length(lastname) > 50
                    OR lastname is null
                    OR lastname = 'null'
                    OR lastname like ''
                    OR lastname like '%1%' 
                    OR lastname like '%2%'
                    OR lastname like '%3%'
                    OR lastname like '%4%'
                    OR lastname like '%5%'
                    OR lastname like '%6%'
                    OR lastname like '%7%'
                    OR lastname like '%8%'
                    OR lastname like '%9%'
                    OR lastname is NULL) AS T2))
                    OR ((Status IN ('A','I','T'))
                    AND (NTUserID IN 
			( SELECT * FROM (SELECT ntuserid FROM uimp_requesterupdate WHERE length(ntuserid) > 100) AS T3)
                                OR ntuserid LIKE ''
                                OR ntuserid = 'null'
                                OR ntuserid IS NULL
                                OR (COALESCE(ntuserid,'') = '')))
                                    OR (emplid IN
										( SELECT * FROM (SELECT emplid FROM uimp_requesterupdate  
                                            WHERE length(emplid) > 100
                                                OR emplid like '') AS T4))
                                                OR (COALESCE(emplid,'') = '')
                                                OR (Status IN ('A','I','T') AND (email IS NULL 
                                                OR email = '' OR email NOT LIKE '%@%' OR email like '% %'));
												
	INSERT INTO uimp_requesterupdateerror(emplid, ntuserid, firstname, lastname, email, status, createdate, error, batch_id)
    SELECT DISTINCT emplid
                    ,ntuserid
                    ,firstname
                    ,lastname
                    ,email
                    ,CASE WHEN status is NULL THEN 'Invalid' ELSE status END
                    ,Now()
                    ,'Missing Status'
                    ,batch_id
    FROM uimp_requesterupdate
    WHERE Status NOT IN ('A','I','T')
        AND emplid NOT IN (SELECT emplid from uimp_requesterupdateerror);
		
	DELETE FROM uimp_requesterupdate WHERE Status NOT IN ('A','I','T');

	
END //

DELIMITER ;
