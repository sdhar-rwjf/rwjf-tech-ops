-- ************************************************************************************************
-- 5/13/2024 Add UMP Settings
-- ************************************************************************************************
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('notifications.daily', 'true', 'Setting for enabling daily UMP notifications.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('notifications.failure', 'true', 'Setting for enabling UMP failure notifications.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.password', '', 'Setting for default password in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.maxdaysadvance', '365', 'Setting for default maximum days in advance in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.maxworkspaces', '1', 'Setting for default maximum number of simultaneous workspace reservations in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.bump', 'True', 'Setting for default bump setting in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.makeassetsavailablebump', 'True', 'Setting for default make assets available when bump setting in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.autobump', 'True', 'Setting for default autobump setting in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.makeassetsavailableautobump', 'TRUE', 'Setting for default make assets available when auto bump setting in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.location', '', 'Setting for default location setting in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.language', 'English', 'Setting for default language setting in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.assetcategory', 'Workspace', 'Setting for default asset category setting in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.gapconflicting', 'False', 'Setting for default gap conflicting setting in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.role', 'Registered User', 'Setting for default role setting in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('default.user.group', 'All Users', 'Setting for default role setting in application.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('api.base.url', 'https://forumgateway.agilquest.com	', 'Setting for the api url.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('api.app.login.id', 'RWJF_User_Management', 'Setting for the api application login Id.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('api.app.login.password', 'NQ#J)E;0l1!fRAu3@3', 'Setting for the api application login Id.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('reserve.admin.user.id', 'umptango@rwjf.org', 'Setting for the Forum Admin Account User Id.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('reserve.admin.user.password', 'Q~wT,9$nJmqQ6VV', 'Setting for the Forum Admin Password.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('mail.from', '', 'Setting for the FROM address for UMP notifications.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('mail.to', '', 'Setting for the TO address for UMP notifications.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('mail.server', '', 'Setting for the SMTP mail server to be used.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('mail.server.port', '', 'Setting for the SMTP mail server port to be used.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('mail.server.pwd', '', 'Setting for the SMTP mail server user password to be used.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('mail.server.username', '', 'Setting for the SMTP mail server username to be used.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('send.notifications', 'true', 'Setting for enabling UMP notifications.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('manage.saml', 'true', 'Setting to enable management of SAML credential.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('api.key', 'sQovaBIIo36zpRKZTg2Xo4Ch4s79HI314f0cNF7o', 'Setting for API Key for access the DM API.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('api.forumbackend.url', 'https://forumgateway.agilquest.com	', 'Setting for the api url.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('api.gateway.url', 'https://forumgateway.agilquest.com	', 'Setting for the api gateway url.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('archive.mail.from', '', 'Setting for the FROM address for UMP notifications.');
REPLACE INTO uimp_settings (SettingName, SettingValue, Description)	VALUES ('archive.mail.to', '', 'Setting for the TO address for UMP notifications.');

select * from uimp_settings
