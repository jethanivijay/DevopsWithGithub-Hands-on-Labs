
CREATE USER 'user' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES on *.* to 'user' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE DATABASE MyShuttleDb;
use MyShuttleDb;

CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `fares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `pickup` varchar(50) DEFAULT NULL COMMENT 'Street address',
  `dropoff` varchar(50) DEFAULT NULL COMMENT 'Street address',
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `fare_charge` int(11) DEFAULT NULL COMMENT 'USD in pennies',
  `driver_fee` int(11) DEFAULT NULL COMMENT 'USD in pennies',
  `passenger_rating` tinyint(3) unsigned DEFAULT NULL COMMENT 'From 0 to 5',
  `driver_rating` tinyint(3) unsigned DEFAULT NULL COMMENT 'From 0 to 5',
  PRIMARY KEY (`id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `fares_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;


INSERT INTO `employees` (`username`, `password`) VALUES ('fred', 'fredpassword');
INSERT INTO `employees` (`username`, `password`) VALUES ('barney', 'barneypassword');
INSERT INTO `employees` (`username`, `password`) VALUES ('wilma', 'wilmapassword');
INSERT INTO `employees` (`username`, `password`) VALUES ('betty', 'bettypassword');
INSERT INTO `employees` (`username`, `password`) VALUES ('jamie', 'jamiepassword');

INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='betty') , '87 Wooly Way, Topsoil, WA', '55 Mammoth Way, Bedrock, WA', '2014-06-19 16:13:00', '2014-06-19 16:34:00', '1527', '1145', '3', '4');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='betty'), '18 Wooly Way, Bedrock, WA', '73 Mammoth Way, Limestone, WA', '2015-01-20 17:00:00', '2015-01-20 17:02:00', '743', '557', '2', '3');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='betty'), '42 Mammoth Way, Rock Gardens, WA', '71 Hunting Lane, Bedrock, WA', '2015-04-28 00:20:00', '2015-04-28 00:40:00', '1682', '1261', '5', '2');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='wilma'), '25 Hunting Lane, Topsoil, WA', '4 Mammoth Way, Limestone, WA', '2014-08-26 04:32:00', '2014-08-26 04:38:00', '900', '675', '1', '2');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='wilma'), '1 Wooly Way, Rock Gardens, WA', '19 Wooly Way, Rock Gardens, WA', '2014-11-05 22:58:00', '2014-11-05 23:02:00', '718', '538', '2', '1');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='wilma'), '36 Hard Rock Pl, Rock Gardens, WA', '38 Shale St, Limestone, WA', '2014-05-20 07:04:00', '2014-05-20 07:26:00', '567', '425', '4', '2');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='fred'), '37 Hunting Lane, Rock Gardens, WA', '83 Brontosaurus Blvd, Topsoil, WA', '2014-04-08 16:00:00', '2014-04-08 16:24:00', '2878', '2158', '1', '5');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='fred'), '84 Mammoth Way, Bedrock, WA', '40 Stegasaurus St, Limestone, WA', '2014-05-06 01:18:00', '2014-05-06 01:29:00', '1910', '1432', '5', '1');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='barney'), '97 Stegasaurus St, Bedrock, WA', '93 Shale St, Bedrock, WA', '2014-12-13 10:43:00', '2014-12-13 11:20:00', '1869', '1401', '3', '2');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='barney'), '43 Brontosaurus Blvd, Bedrock, WA', '51 Stegasaurus St, Rock Gardens, WA', '2014-05-17 10:41:00', '2014-05-17 10:53:00', '1460', '1095', '3', '2');


INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='jamie') , '87 Wooly Way, Topsoil, WA', '55 Mammoth Way, Bedrock, WA', '2014-06-19 16:13:00', '2014-06-19 16:34:00', '1527', '1145', '3', '4');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='jamie'), '18 Wooly Way, Bedrock, WA', '73 Mammoth Way, Limestone, WA', '2015-01-20 17:00:00', '2015-01-20 17:02:00', '743', '557', '2', '3');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='jamie'), '42 Mammoth Way, Rock Gardens, WA', '71 Hunting Lane, Bedrock, WA', '2015-04-28 00:20:00', '2015-04-28 00:40:00', '1682', '1261', '5', '2');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='jamie'), '25 Hunting Lane, Topsoil, WA', '4 Mammoth Way, Limestone, WA', '2014-08-26 04:32:00', '2014-08-26 04:38:00', '900', '675', '1', '2');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='jamie'), '1 Wooly Way, Rock Gardens, WA', '19 Wooly Way, Rock Gardens, WA', '2014-11-05 22:58:00', '2014-11-05 23:02:00', '718', '538', '2', '1');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='jamie'), '36 Hard Rock Pl, Rock Gardens, WA', '38 Shale St, Limestone, WA', '2014-05-20 07:04:00', '2014-05-20 07:26:00', '567', '425', '4', '2');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='jamie'), '37 Hunting Lane, Rock Gardens, WA', '83 Brontosaurus Blvd, Topsoil, WA', '2014-04-08 16:00:00', '2014-04-08 16:24:00', '2878', '2158', '1', '5');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='jamie'), '84 Mammoth Way, Bedrock, WA', '40 Stegasaurus St, Limestone, WA', '2014-05-06 01:18:00', '2014-05-06 01:29:00', '1910', '1432', '5', '1');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='jamie'), '97 Stegasaurus St, Bedrock, WA', '93 Shale St, Bedrock, WA', '2014-12-13 10:43:00', '2014-12-13 11:20:00', '1869', '1401', '3', '2');
INSERT INTO `fares` (`emp_id`, `pickup`, `dropoff`, `start`, `end`, `fare_charge`, `driver_fee`, `passenger_rating`, `driver_rating`) VALUES ((select `id` from `employees` where `username`='jamie'), '43 Brontosaurus Blvd, Bedrock, WA', '51 Stegasaurus St, Rock Gardens, WA', '2014-05-17 10:41:00', '2014-05-17 10:53:00', '1460', '1095', '3', '2');



