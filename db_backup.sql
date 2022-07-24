

DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_id_UNIQUE` (`admin_id`),
  UNIQUE KEY `email_id_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `admin_info` WRITE;
INSERT INTO `admin_info` VALUES (1,'service@iiitb.org','thanksiiitb','Admin','9998889990');
UNLOCK TABLES;


DROP TABLE IF EXISTS `complaint_info`;
CREATE TABLE `complaint_info` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `handyman_id` int(5) DEFAULT NULL,
  `subject` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `catagory` varchar(20) DEFAULT NULL,
  `time_slot` varchar(45) NOT NULL,
  `priority` int(11) DEFAULT '1',
  `flag` int(11) DEFAULT '0',
  `status` int(11) DEFAULT '0',
  `cost` int(11) DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `feedback` varchar(100) DEFAULT NULL,
  `otp` int(5) NOT NULL,
  `descriptionFull` varchar(100) DEFAULT '',
  `assignDate` datetime DEFAULT NULL,
  PRIMARY KEY (`complaint_id`),
  UNIQUE KEY `complaint_id_UNIQUE` (`complaint_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `handyman_id_idx` (`handyman_id`),
  CONSTRAINT `handyman_id` FOREIGN KEY (`handyman_id`) REFERENCES `handyman_info` (`handyman_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `feedback_info`;
CREATE TABLE `feedback_info` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `complaint_id` int(11) NOT NULL,
  `text` varchar(250) NOT NULL,
  `student_id` int(11) NOT NULL,
  `handyman_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `complaint_id_idx` (`complaint_id`),
  KEY `student_id_idx` (`student_id`),
  KEY `handymain_Id_idx` (`handyman_id`),
  CONSTRAINT `fk_feedback_info_1` FOREIGN KEY (`complaint_id`) REFERENCES `complaint_info` (`complaint_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_feedback_info_2` FOREIGN KEY (`handyman_id`) REFERENCES `handyman_info` (`handyman_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_feedback_info_3` FOREIGN KEY (`student_id`) REFERENCES `student_info` (`student_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `feedback_info` WRITE;
UNLOCK TABLES;


DROP TABLE IF EXISTS `handyman_info`;
CREATE TABLE `handyman_info` (
  `handyman_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(40) NOT NULL,
  `password` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `phone_no` varchar(13) NOT NULL,
  `Catagory` varchar(13) NOT NULL,
  `slot1` int(5) DEFAULT '0',
  `slot2` int(5) DEFAULT '0',
  `slot3` int(5) DEFAULT '0',
  `issued` int(5) DEFAULT '0',
  `solved` int(5) DEFAULT '0',
  `today` int(5) DEFAULT '0',
  PRIMARY KEY (`handyman_id`),
  UNIQUE KEY `handyman_id_UNIQUE` (`handyman_id`),
  UNIQUE KEY `email_id_UNIQUE` (`email`),
  UNIQUE KEY `Phone_no_UNIQUE` (`phone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

LOCK TABLES `handyman_info` WRITE;
INSERT INTO `handyman_info` VALUES (1,'handy@xyz.com','abxy1298','ABC XYZ','+911234567890','Carpenter',0,0,0,0,0,0);
UNLOCK TABLES;


DROP TABLE IF EXISTS `master_data`;
CREATE TABLE `master_data` (
  `owner` varchar(30) DEFAULT NULL,
  `handman` varchar(30) DEFAULT NULL,
  `equipment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--

LOCK TABLES `master_data` WRITE;
INSERT INTO `master_data` VALUES ('Hostel','Carpenter','Table'),('Hostel','Carpenter','Chair'),('Hostel','Carpenter','Cupboard'),('Hostel','Electrician','Fan'),('Hostel','Electrician','Tubelight'),('Hostel','Electrician','Regulator'),('Personnel','Electrician','Iron'),('Personnel','Electrician','Kettle'),('Personnel','Electrician','Heater'),('Personnel','Carpenter','Table'),('Hostel','Carpenter','Door');
UNLOCK TABLES;


DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `roll_no` varchar(150) NOT NULL,
  `phone_no` varchar(150) NOT NULL,
  `room_no` int(11) NOT NULL,
  `gender` char(1) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_no_UNIQUE` (`phone_no`),
  UNIQUE KEY `room_no_UNIQUE` (`room_no`),
  UNIQUE KEY `roll_no_UNIQUE` (`roll_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
