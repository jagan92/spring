/*Default Applicattion admin User*/
INSERT INTO `SD_CONNEXION`.`users`
(`user_id`,`email_id`,`password`,`first_name`,`last_name`,`role_id`,`type`,`tenant_id`,`date_lastlogin`,`created_by`,`modified_by`,
`created_date`,`modified_date`,`is_deleted`,`optlock_version`)VALUES('1','admin@aalamsoft.com',
'$2a$10$xKwFyg2EZQm9IMnc0WZn0uo4zQPXOa.CRFejVZgejFPR5RmjKfn1m','Admin','Aalam','1','8',null,null,'1','1',now(),now(),'N','0');

