CREATE DATABASE  IF NOT EXISTS `flightreservationdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `flightreservationdb`;
-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: flightreservationdb
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `flight_id` int NOT NULL,
  `passenger_id` int NOT NULL,
  `seat_no` varchar(10) DEFAULT NULL,
  `booking_status` varchar(20) NOT NULL,
  `fare_class` varchar(20) NOT NULL,
  `fare_amount` decimal(10,2) NOT NULL,
  `booking_timestamp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`booking_id`),
  KEY `passenger_id` (`passenger_id`),
  KEY `idx_booking_lookup` (`flight_id`,`seat_no`,`booking_status`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `confirmedbookings`
--

DROP TABLE IF EXISTS `confirmedbookings`;
/*!50001 DROP VIEW IF EXISTS `confirmedbookings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `confirmedbookings` AS SELECT 
 1 AS `booking_id`,
 1 AS `flight_id`,
 1 AS `passenger_id`,
 1 AS `seat_no`,
 1 AS `booking_status`,
 1 AS `fare_class`,
 1 AS `fare_amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `flightoccupancy`
--

DROP TABLE IF EXISTS `flightoccupancy`;
/*!50001 DROP VIEW IF EXISTS `flightoccupancy`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `flightoccupancy` AS SELECT 
 1 AS `flight_id`,
 1 AS `flight_number`,
 1 AS `source`,
 1 AS `destination`,
 1 AS `total_seats`,
 1 AS `booked_seats`,
 1 AS `available_seats`,
 1 AS `occupancy_percentage`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `flight_id` int NOT NULL AUTO_INCREMENT,
  `flight_number` varchar(10) NOT NULL,
  `source` varchar(50) NOT NULL,
  `destination` varchar(50) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `total_seats` int NOT NULL,
  PRIMARY KEY (`flight_id`),
  UNIQUE KEY `flight_number` (`flight_number`),
  KEY `idx_flight_search` (`source`,`destination`,`departure_date`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (1,'AI101','Delhi','Mumbai','2026-11-15','09:00:00',100),(2,'AI102','Delhi','Jaipur','2026-11-15','12:00:00',60),(3,'AI103','Mumbai','Bengaluru','2026-11-16','15:30:00',80),(4,'AI104','Delhi','Mumbai','2026-11-16','18:00:00',120);
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `passenger_id` int NOT NULL AUTO_INCREMENT,
  `passenger_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `loyalty_tier` varchar(20) NOT NULL,
  PRIMARY KEY (`passenger_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1,'Aman','aman@example.com','Gold'),(2,'Riya','riya@example.com','Silver'),(3,'Karan','karan@example.com','Bronze'),(4,'Priya','priya@example.com','Gold'),(5,'Rahul','rahul@example.com','Silver'),(6,'Neha','neha@example.com','Bronze');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `waitlistedpassengers`
--

DROP TABLE IF EXISTS `waitlistedpassengers`;
/*!50001 DROP VIEW IF EXISTS `waitlistedpassengers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `waitlistedpassengers` AS SELECT 
 1 AS `booking_id`,
 1 AS `flight_number`,
 1 AS `passenger_name`,
 1 AS `loyalty_tier`,
 1 AS `fare_class`,
 1 AS `booking_timestamp`,
 1 AS `booking_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'flightreservationdb'
--

--
-- Final view structure for view `confirmedbookings`
--

/*!50001 DROP VIEW IF EXISTS `confirmedbookings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `confirmedbookings` AS select `bookings`.`booking_id` AS `booking_id`,`bookings`.`flight_id` AS `flight_id`,`bookings`.`passenger_id` AS `passenger_id`,`bookings`.`seat_no` AS `seat_no`,`bookings`.`booking_status` AS `booking_status`,`bookings`.`fare_class` AS `fare_class`,`bookings`.`fare_amount` AS `fare_amount` from `bookings` where (`bookings`.`booking_status` = 'Confirmed') */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `flightoccupancy`
--

/*!50001 DROP VIEW IF EXISTS `flightoccupancy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `flightoccupancy` AS select `f`.`flight_id` AS `flight_id`,`f`.`flight_number` AS `flight_number`,`f`.`source` AS `source`,`f`.`destination` AS `destination`,`f`.`total_seats` AS `total_seats`,count((case when (`b`.`booking_status` in ('Confirmed','Upgraded')) then 1 end)) AS `booked_seats`,(`f`.`total_seats` - count((case when (`b`.`booking_status` in ('Confirmed','Upgraded')) then 1 end))) AS `available_seats`,round(((count((case when (`b`.`booking_status` in ('Confirmed','Upgraded')) then 1 end)) * 100.0) / nullif(`f`.`total_seats`,0)),2) AS `occupancy_percentage` from (`flights` `f` left join `bookings` `b` on((`f`.`flight_id` = `b`.`flight_id`))) group by `f`.`flight_id`,`f`.`flight_number`,`f`.`source`,`f`.`destination`,`f`.`total_seats` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `waitlistedpassengers`
--

/*!50001 DROP VIEW IF EXISTS `waitlistedpassengers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `waitlistedpassengers` AS select `b`.`booking_id` AS `booking_id`,`f`.`flight_number` AS `flight_number`,`p`.`passenger_name` AS `passenger_name`,`p`.`loyalty_tier` AS `loyalty_tier`,`b`.`fare_class` AS `fare_class`,`b`.`booking_timestamp` AS `booking_timestamp`,`b`.`booking_status` AS `booking_status` from ((`bookings` `b` join `passengers` `p` on((`b`.`passenger_id` = `p`.`passenger_id`))) join `flights` `f` on((`b`.`flight_id` = `f`.`flight_id`))) where (`b`.`booking_status` = 'Waitlisted') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-10 16:00:20
