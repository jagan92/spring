/********** Starts : Version: v1 ************/

/*Table name : user */
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(80) NOT NULL,
  `password` varchar(80) DEFAULT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `date_lastlogin` datetime DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `is_deleted` char(1) NOT NULL DEFAULT 'N',
  `optlock_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_usersemail` (`email_id`),
  KEY `fk_createdby` (`created_by`),
  KEY `fk_modifiedby` (`modified_by`),
  KEY `fk_tenantid` (`tenant_id`),
  KEY `fk_roleid` (`role_id`)
);
 
 
 /*Table name : user_profile */
CREATE TABLE `users_profile` (
  `user_profile_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile_number` varchar(20) DEFAULT NULL,
  `aadhar_number` bigint(40) DEFAULT NULL,
  `user_address` longtext,
  `user_city` varchar(40) DEFAULT NULL,
  `user_state` varchar(40) DEFAULT NULL,
  `user_country` varchar(40) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `is_deleted` char(1) NOT NULL DEFAULT 'N',
  `optlock_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_profile_id`),
  KEY `fk_user_profiles_1` (`user_id`),
  KEY `fk_createdby` (`created_by`),
  KEY `fk_modifiedby` (`modified_by`)
);

/*Table name : lists*/
CREATE TABLE `app_lists` (
  `list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  `is_deleted` char(1) NOT NULL,
  `datatype` varchar(30) DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `sort_preference` varchar(20) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `has_sub_items` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`list_id`),
  KEY `FK_createdby` (`created_by`),
  KEY `FK_modifiedby` (`modified_by`)
); 

/*Table name : items*/
CREATE TABLE `app_items` (
  `item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  `is_default` char(1) NOT NULL,
  `long_name` varchar(250) NOT NULL,
  `seq_no` int(11) NOT NULL,
  `short_name` varchar(80) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `FK_createdby` (`created_by`),
  KEY `FK_modifiedby` (`modified_by`),
  KEY `fk_app_items_1` (`list_id`)
);

/*Table name : sub_items*/
CREATE TABLE `app_sub_items` (
  `sub_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  `is_default` char(1) NOT NULL,
  `long_name` varchar(250) NOT NULL,
  `seq_no` int(11) NOT NULL,
  `short_name` varchar(80) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `item_id` bigint(20) NOT NULL,
  `list_id` bigint(20) NOT NULL,
  `tool_tip` varchar(1000) DEFAULT NULL,
  `service_link` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`sub_item_id`),
  KEY `FK_createdby` (`created_by`),
  KEY `FK_modifiedby` (`modified_by`),
  KEY `fk_app_sub_items_2` (`item_id`),
  KEY `fk_app_sub_items_1` (`list_id`)
);

/*Table name : capability*/
CREATE TABLE `capability` (
  `capability_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `permission_type` varchar(80) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `seq_no` int(11) NOT NULL DEFAULT '0',
  `ui_type` varchar(40) NOT NULL,
  PRIMARY KEY (`capability_id`)
);


/*Table name : roles*/
CREATE TABLE `roles` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  `name` varchar(40) NOT NULL,
  `role_type` bigint(20) NOT NULL,
  `app_role_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `UK_app_role_id` (`app_role_id`),
  KEY `FK_createdby` (`created_by`),
  KEY `FK_modifiedby` (`modified_by`)
);


/*Table name : permissions*/
CREATE TABLE `permissions` (
  `permission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  `is_create` char(1) NOT NULL,
  `is_delete` char(1) NOT NULL,
  `is_update` char(1) NOT NULL,
  `is_read` char(1) NOT NULL,
  `is_visible` char(1) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `capability_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `UK_roleid,capabilityid` (`role_id`,`capability_id`),
  KEY `FK_createdby` (`created_by`),
  KEY `FK_modifiedby` (`modified_by`),
  KEY `fk_permission_2` (`capability_id`)
); 


/*Table name : tenant*/
CREATE TABLE `tenant` (
  `tenant_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tenant_name` varchar(150) DEFAULT NULL,
  `tenant_shname` varchar(40) DEFAULT NULL,
  `tenant_email` varchar(40) DEFAULT NULL,
  `tenant_website` varchar(40) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `tenant_address` longtext,
  `tenant_city` varchar(40) DEFAULT NULL,
  `tenant_state` varchar(40) DEFAULT NULL,
  `tenant_country` varchar(40) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `is_deleted` char(1) NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`tenant_id`),
  UNIQUE KEY `UK_tenantemail` (`tenant_email`),
  KEY `fk_tenant_2` (`created_by`),
  KEY `fk_tenant_3` (`modified_by`)
);



/* Persistent Table - Spring */
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
);

/*Table name : team*/
CREATE TABLE `team` (
  `team_id`  bigint(20) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(150) DEFAULT NULL,
  `team_colour` varchar(40) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `is_deleted` char(1) NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  KEY `fk_tenantid` (`tenant_id`),
  KEY `FK_createdby` (`created_by`),
  KEY `FK_modifiedby` (`modified_by`)
);

/*Table name : Division */
CREATE TABLE `division` (
  `division_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `division_name` varchar(80) DEFAULT NULL,
  `section` varchar(40) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `staff_id` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `is_deleted` char(1) NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`division_id`),
  KEY `fk_tenantid` (`tenant_id`),
  KEY `FK_createdby` (`created_by`),
  KEY `FK_modifiedby` (`modified_by`)
);

/*Table name : pupil */
CREATE TABLE `pupil` (
  `pupil_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pupil_name` varchar(150) DEFAULT NULL,
  `pupil_rollno` bigint(20) DEFAULT NULL,
  `pupil_gender` varchar(40) DEFAULT NULL,
  `pupil_age` bigint(20) DEFAULT NULL,
  `division_id` bigint(20) DEFAULT NULL,
  `team_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `is_deleted` char(1) NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`pupil_id`),
  KEY `fk_teamid` (`team_id`),
  KEY `fk_divisionid` (`division_id`),
  KEY `FK_createdby` (`created_by`),
  KEY `FK_modifiedby` (`modified_by`)
);

/*Table name : order */
CREATE TABLE `orders` (
  `order_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(40) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `is_deleted` char(1) NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_tenantid` (`tenant_id`),
  KEY `FK_createdby` (`created_by`),
  KEY `FK_modifiedby` (`modified_by`)
);


/*Table name : assign_history */
CREATE TABLE `assign_history` (
  `assign_history_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `entity_type` varchar(40) DEFAULT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `is_deleted` char(1) NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  PRIMARY KEY (`assign_history_id`),
  KEY `fk_entityid` (`entity_id`),
  KEY `fk_userid` (`user_id`),
  KEY `FK_createdby` (`created_by`),
  KEY `FK_modifiedby` (`modified_by`)
);
/********** Ends : Version: v1 ************/

/********** Starts : Version: v2 ************/
/* Added: 27Oct2017 */

 CREATE TABLE `app_access_log` (
  `app_access_log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `optlock_version` int(11) DEFAULT NULL,
  `client_browser` varchar(50) DEFAULT NULL,
  `client_ip` varchar(20) DEFAULT NULL,
  `client_local_ip` varchar(20) DEFAULT NULL,
  `client_os` varchar(50) DEFAULT NULL,
  `login_id` varchar(80) NOT NULL,
  `session_id` varchar(50) NOT NULL,
  `status` varchar(80) NOT NULL,
  `created_by` bigint(20) NOT NULL,
  `modified_by` bigint(20) NOT NULL,
  `date_logout` datetime DEFAULT NULL,
  PRIMARY KEY (`app_access_log_id`),
  KEY `FK_createdby` (`created_by`),
  KEY `FK_modifiedby` (`modified_by`)
);

/********** Ends : Version: v2 ************/

