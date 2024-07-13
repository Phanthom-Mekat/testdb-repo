-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `group25_ps6_exportedtables`
--

DROP TABLE IF EXISTS `group25_ps6_exportedtables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group25_ps6_exportedtables` (
  `AppointmentID` int DEFAULT NULL,
  `Date` text,
  `Online` int DEFAULT NULL,
  `Offline` int DEFAULT NULL,
  `Time` text,
  `PatientID` int DEFAULT NULL,
  `DoctorID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group25_ps6_exportedtables`
--

LOCK TABLES `group25_ps6_exportedtables` WRITE;
/*!40000 ALTER TABLE `group25_ps6_exportedtables` DISABLE KEYS */;
INSERT INTO `group25_ps6_exportedtables` VALUES (1001,'2024-07-15',1,0,'0000-00-00',20000001,1),(1002,'2024-07-18',0,1,'0000-00-00',20000002,2),(1003,'2024-07-20',1,0,'0000-00-00',20000003,3),(1004,'2024-07-22',0,1,'0000-00-00',20000004,4),(1005,'2024-07-25',1,0,'0000-00-00',20000005,5),(101,'Apple',14,0,'1',0,1),(102,'Banana',27,0,'1',1,1),(103,'Chicken Breast',0,3,'0',31,1),(104,'Broccoli',7,0,'1',3,1),(105,'Almonds',22,49,'1',21,3);
/*!40000 ALTER TABLE `group25_ps6_exportedtables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_appointment`
--
CREATE USER 'root'@'localhost' IDENTIFIED BY 'new_password';
GRANT ALL PRIVILEGES ON testdb.* TO 'root'@'localhost';
FLUSH PRIVILEGES;

DROP TABLE IF EXISTS `tbl_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_appointment` (
  `AppointmentID` int NOT NULL,
  `Date` date NOT NULL,
  `Online` tinyint(1) DEFAULT NULL,
  `Offline` tinyint(1) DEFAULT NULL,
  `Time` date NOT NULL,
  `PatientID` int NOT NULL,
  `DoctorID` int NOT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `Appointment_FK1` (`PatientID`),
  KEY `Appointment_FK2` (`DoctorID`),
  CONSTRAINT `Appointment_FK1` FOREIGN KEY (`PatientID`) REFERENCES `tbl_patient` (`PatientID`),
  CONSTRAINT `Appointment_FK2` FOREIGN KEY (`DoctorID`) REFERENCES `tbl_doctor` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_appointment`
--

LOCK TABLES `tbl_appointment` WRITE;
/*!40000 ALTER TABLE `tbl_appointment` DISABLE KEYS */;
INSERT INTO `tbl_appointment` VALUES (1001,'2024-07-15',1,0,'0000-00-00',20000001,1),(1002,'2024-07-18',0,1,'0000-00-00',20000002,2),(1003,'2024-07-20',1,0,'0000-00-00',20000003,3),(1004,'2024-07-22',0,1,'0000-00-00',20000004,4),(1005,'2024-07-25',1,0,'0000-00-00',20000005,5);
/*!40000 ALTER TABLE `tbl_appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_consultation`
--

DROP TABLE IF EXISTS `tbl_consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_consultation` (
  `ConsultationID` int NOT NULL,
  `Instruction` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `FollowUpDate` date DEFAULT NULL,
  `AppointmentID` int NOT NULL,
  PRIMARY KEY (`ConsultationID`),
  KEY `Consultation_FK` (`AppointmentID`),
  CONSTRAINT `Consultation_FK` FOREIGN KEY (`AppointmentID`) REFERENCES `tbl_appointment` (`AppointmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_consultation`
--

LOCK TABLES `tbl_consultation` WRITE;
/*!40000 ALTER TABLE `tbl_consultation` DISABLE KEYS */;
INSERT INTO `tbl_consultation` VALUES (2001,'Prescribed medication and advised rest','2024-07-15',1001),(2002,'Recommended physical therapy exercises','2024-07-18',1002),(2003,'Dietary changes for better glucose control','2024-07-20',1003),(2004,'Suggested lifestyle modifications for stress management','2024-07-22',1004),(2005,'Discussed treatment options and scheduled follow-up','2024-07-25',1005);
/*!40000 ALTER TABLE `tbl_consultation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_consultation_suggested_action`
--

DROP TABLE IF EXISTS `tbl_consultation_suggested_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_consultation_suggested_action` (
  `ConsultationID` int NOT NULL,
  `SuggestedAdvice` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ConsultationID`,`SuggestedAdvice`),
  CONSTRAINT `ConsultationSuggestedAction_FK` FOREIGN KEY (`ConsultationID`) REFERENCES `tbl_consultation` (`ConsultationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_consultation_suggested_action`
--

LOCK TABLES `tbl_consultation_suggested_action` WRITE;
/*!40000 ALTER TABLE `tbl_consultation_suggested_action` DISABLE KEYS */;
INSERT INTO `tbl_consultation_suggested_action` VALUES (2001,'Increase water intake and monitor blood pressure daily'),(2002,'Start a daily walking routine and track steps using a pedometer'),(2003,'Reduce caffeine intake and practice relaxation techniques'),(2004,'Follow a low-sodium diet and monitor weight regularly'),(2005,'Keep a food diary and note any allergic reactions');
/*!40000 ALTER TABLE `tbl_consultation_suggested_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_daily_health_metrics`
--

DROP TABLE IF EXISTS `tbl_daily_health_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_daily_health_metrics` (
  `MetricID` int NOT NULL,
  `BPDiastolic` int DEFAULT NULL,
  `BPSystolic` int DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `GlucoseLevel` int DEFAULT NULL,
  `DailyCaloricConsumption` int DEFAULT NULL,
  `Date` date NOT NULL,
  `CalorieBurned` int DEFAULT NULL,
  PRIMARY KEY (`MetricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_daily_health_metrics`
--

LOCK TABLES `tbl_daily_health_metrics` WRITE;
/*!40000 ALTER TABLE `tbl_daily_health_metrics` DISABLE KEYS */;
INSERT INTO `tbl_daily_health_metrics` VALUES (20001,88,140,70,90,2000,'2024-07-10',500),(20002,95,166,75,100,2500,'2024-07-11',600),(20003,75,150,68,95,1800,'2024-07-12',550),(20004,88,145,80,105,2200,'2024-07-13',650),(20005,75,144,65,85,2100,'2024-07-14',700);
/*!40000 ALTER TABLE `tbl_daily_health_metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosed_symptom`
--

DROP TABLE IF EXISTS `tbl_diagnosed_symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosed_symptom` (
  `DiagnosedSymptomID` int NOT NULL,
  `Duration` int NOT NULL,
  PRIMARY KEY (`DiagnosedSymptomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosed_symptom`
--

LOCK TABLES `tbl_diagnosed_symptom` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosed_symptom` DISABLE KEYS */;
INSERT INTO `tbl_diagnosed_symptom` VALUES (5000001,7),(5000002,14),(5000003,21),(5000004,28),(5000005,35);
/*!40000 ALTER TABLE `tbl_diagnosed_symptom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosed_symptom_name`
--

DROP TABLE IF EXISTS `tbl_diagnosed_symptom_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosed_symptom_name` (
  `DiagnosedSymptomID` int NOT NULL,
  `Name` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`DiagnosedSymptomID`,`Name`),
  CONSTRAINT `DiagnosedSymptomName_FK` FOREIGN KEY (`DiagnosedSymptomID`) REFERENCES `tbl_diagnosed_symptom` (`DiagnosedSymptomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosed_symptom_name`
--

LOCK TABLES `tbl_diagnosed_symptom_name` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosed_symptom_name` DISABLE KEYS */;
INSERT INTO `tbl_diagnosed_symptom_name` VALUES (5000001,'Headache'),(5000002,'Fever'),(5000003,'Cough'),(5000004,'Fatigue'),(5000005,'Nausea');
/*!40000 ALTER TABLE `tbl_diagnosed_symptom_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosis_center`
--

DROP TABLE IF EXISTS `tbl_diagnosis_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosis_center` (
  `dFacilityID` int NOT NULL,
  PRIMARY KEY (`dFacilityID`),
  CONSTRAINT `tbl_diagnosis_center_ibfk_1` FOREIGN KEY (`dFacilityID`) REFERENCES `tbl_healthcare_facility` (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosis_center`
--

LOCK TABLES `tbl_diagnosis_center` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosis_center` DISABLE KEYS */;
INSERT INTO `tbl_diagnosis_center` VALUES (100002),(100004);
/*!40000 ALTER TABLE `tbl_diagnosis_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosis_center_diagnostic_service`
--

DROP TABLE IF EXISTS `tbl_diagnosis_center_diagnostic_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosis_center_diagnostic_service` (
  `dFacilityID` int NOT NULL,
  `DiagnosticService` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`dFacilityID`,`DiagnosticService`),
  CONSTRAINT `tbl_diagnosis_center_diagnostic_service_ibfk_1` FOREIGN KEY (`dFacilityID`) REFERENCES `tbl_diagnosis_center` (`dFacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosis_center_diagnostic_service`
--

LOCK TABLES `tbl_diagnosis_center_diagnostic_service` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosis_center_diagnostic_service` DISABLE KEYS */;
INSERT INTO `tbl_diagnosis_center_diagnostic_service` VALUES (100002,'X-ray'),(100004,'MRI');
/*!40000 ALTER TABLE `tbl_diagnosis_center_diagnostic_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosis_record`
--

DROP TABLE IF EXISTS `tbl_diagnosis_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosis_record` (
  `DiagnosisID` int NOT NULL,
  `ResultSummary` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `Date` date NOT NULL,
  `PatientID` int DEFAULT NULL,
  PRIMARY KEY (`DiagnosisID`),
  KEY `fk_PatientID` (`PatientID`),
  CONSTRAINT `fk_PatientID` FOREIGN KEY (`PatientID`) REFERENCES `tbl_patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosis_record`
--

LOCK TABLES `tbl_diagnosis_record` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosis_record` DISABLE KEYS */;
INSERT INTO `tbl_diagnosis_record` VALUES (3000001,'Normal','2024-01-01',20000001),(3000002,'Abnormal','2024-02-02',20000002),(3000003,'Critical','2024-03-03',20000003),(3000004,'Normal','2024-04-04',20000004),(3000005,'Abnormal','2024-05-05',20000005);
/*!40000 ALTER TABLE `tbl_diagnosis_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosis_record_indicates_symptoms`
--

DROP TABLE IF EXISTS `tbl_diagnosis_record_indicates_symptoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosis_record_indicates_symptoms` (
  `DiagnosisID` int NOT NULL,
  `DiagnosedSymptomID` int NOT NULL,
  PRIMARY KEY (`DiagnosisID`,`DiagnosedSymptomID`),
  KEY `DiagnosisRecordIndicatesSymptoms_FK2` (`DiagnosedSymptomID`),
  CONSTRAINT `DiagnosisRecordIndicatesSymptoms_FK1` FOREIGN KEY (`DiagnosisID`) REFERENCES `tbl_diagnosis_record` (`DiagnosisID`),
  CONSTRAINT `DiagnosisRecordIndicatesSymptoms_FK2` FOREIGN KEY (`DiagnosedSymptomID`) REFERENCES `tbl_diagnosed_symptom` (`DiagnosedSymptomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosis_record_indicates_symptoms`
--

LOCK TABLES `tbl_diagnosis_record_indicates_symptoms` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosis_record_indicates_symptoms` DISABLE KEYS */;
INSERT INTO `tbl_diagnosis_record_indicates_symptoms` VALUES (3000001,5000001),(3000002,5000002),(3000003,5000003),(3000004,5000004),(3000005,5000005);
/*!40000 ALTER TABLE `tbl_diagnosis_record_indicates_symptoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosis_record_observation`
--

DROP TABLE IF EXISTS `tbl_diagnosis_record_observation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosis_record_observation` (
  `DiagnosisID` int NOT NULL,
  `Observation` varchar(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DiagnosisID`),
  CONSTRAINT `DiagnosisRecordObservation_FK` FOREIGN KEY (`DiagnosisID`) REFERENCES `tbl_diagnosis_record` (`DiagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosis_record_observation`
--

LOCK TABLES `tbl_diagnosis_record_observation` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosis_record_observation` DISABLE KEYS */;
INSERT INTO `tbl_diagnosis_record_observation` VALUES (3000001,'No issues detected'),(3000002,'Requires further analysis'),(3000003,'Immediate attention needed'),(3000004,'Routine check-up'),(3000005,'Minor issues found');
/*!40000 ALTER TABLE `tbl_diagnosis_record_observation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosis_record_reference_value`
--

DROP TABLE IF EXISTS `tbl_diagnosis_record_reference_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosis_record_reference_value` (
  `DiagnosisID` int NOT NULL,
  `Min_Value` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  `Max_Value` varchar(11) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`DiagnosisID`,`Min_Value`,`Max_Value`),
  CONSTRAINT `DiagnosisRecordReferenceValue_FK` FOREIGN KEY (`DiagnosisID`) REFERENCES `tbl_diagnosis_record` (`DiagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosis_record_reference_value`
--

LOCK TABLES `tbl_diagnosis_record_reference_value` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosis_record_reference_value` DISABLE KEYS */;
INSERT INTO `tbl_diagnosis_record_reference_value` VALUES (3000001,'60','80'),(3000002,'100','200'),(3000003,'70','120'),(3000004,'60','100'),(3000005,'40','60');
/*!40000 ALTER TABLE `tbl_diagnosis_record_reference_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosis_record_result`
--

DROP TABLE IF EXISTS `tbl_diagnosis_record_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosis_record_result` (
  `DiagnosisID` int NOT NULL,
  `TestResult` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`DiagnosisID`,`TestResult`),
  CONSTRAINT `DiagnosisRecordResult_FK` FOREIGN KEY (`DiagnosisID`) REFERENCES `tbl_diagnosis_record` (`DiagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosis_record_result`
--

LOCK TABLES `tbl_diagnosis_record_result` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosis_record_result` DISABLE KEYS */;
INSERT INTO `tbl_diagnosis_record_result` VALUES (3000001,'Blood Pressure Normal'),(3000002,'High Cholesterol'),(3000003,'Diabetes Detected'),(3000004,'Heart Rate Normal'),(3000005,'Vitamin Deficiency');
/*!40000 ALTER TABLE `tbl_diagnosis_record_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosis_record_test_item`
--

DROP TABLE IF EXISTS `tbl_diagnosis_record_test_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosis_record_test_item` (
  `DiagnosisID` int NOT NULL,
  `TestItem` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`DiagnosisID`,`TestItem`),
  CONSTRAINT `DiagnosisRecordTestItem_FK` FOREIGN KEY (`DiagnosisID`) REFERENCES `tbl_diagnosis_record` (`DiagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosis_record_test_item`
--

LOCK TABLES `tbl_diagnosis_record_test_item` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosis_record_test_item` DISABLE KEYS */;
INSERT INTO `tbl_diagnosis_record_test_item` VALUES (3000001,'Blood Test'),(3000002,'Cholesterol Test'),(3000003,'Glucose Test'),(3000004,'ECG'),(3000005,'Vitamin Test');
/*!40000 ALTER TABLE `tbl_diagnosis_record_test_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosis_test`
--

DROP TABLE IF EXISTS `tbl_diagnosis_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosis_test` (
  `DiagnosisTestID` int NOT NULL,
  `TestSample` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DiagnosisBill` int DEFAULT NULL,
  PRIMARY KEY (`DiagnosisTestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosis_test`
--

LOCK TABLES `tbl_diagnosis_test` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosis_test` DISABLE KEYS */;
INSERT INTO `tbl_diagnosis_test` VALUES (4000001,'Blood',200),(4000002,'Urine',150),(4000003,'Saliva',100),(4000004,'Tissue',250),(4000005,'Hair',300);
/*!40000 ALTER TABLE `tbl_diagnosis_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosis_test_test_name`
--

DROP TABLE IF EXISTS `tbl_diagnosis_test_test_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosis_test_test_name` (
  `DiagnosisTestID` int NOT NULL,
  `TestName` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`DiagnosisTestID`,`TestName`),
  CONSTRAINT `DiagnosisTestTestName_FK` FOREIGN KEY (`DiagnosisTestID`) REFERENCES `tbl_diagnosis_test` (`DiagnosisTestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosis_test_test_name`
--

LOCK TABLES `tbl_diagnosis_test_test_name` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosis_test_test_name` DISABLE KEYS */;
INSERT INTO `tbl_diagnosis_test_test_name` VALUES (4000001,'Complete Blood Count'),(4000002,'Urine Analysis'),(4000003,'Saliva Hormone Test'),(4000004,'Tissue Biopsy'),(4000005,'Hair Mineral Analysis');
/*!40000 ALTER TABLE `tbl_diagnosis_test_test_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnosis_test_test_type`
--

DROP TABLE IF EXISTS `tbl_diagnosis_test_test_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnosis_test_test_type` (
  `DiagnosisTestID` int NOT NULL,
  `TestType` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`DiagnosisTestID`,`TestType`),
  CONSTRAINT `DiagnosisTestTestType_FK` FOREIGN KEY (`DiagnosisTestID`) REFERENCES `tbl_diagnosis_test` (`DiagnosisTestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnosis_test_test_type`
--

LOCK TABLES `tbl_diagnosis_test_test_type` WRITE;
/*!40000 ALTER TABLE `tbl_diagnosis_test_test_type` DISABLE KEYS */;
INSERT INTO `tbl_diagnosis_test_test_type` VALUES (4000001,'Hematology'),(4000002,'Biochemistry'),(4000003,'Endocrinology'),(4000004,'Pathology'),(4000005,'Toxicology');
/*!40000 ALTER TABLE `tbl_diagnosis_test_test_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diagnostic_tests_under_center`
--

DROP TABLE IF EXISTS `tbl_diagnostic_tests_under_center`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diagnostic_tests_under_center` (
  `dFacilityID` int NOT NULL,
  `DiagnosisTestID` int NOT NULL,
  PRIMARY KEY (`dFacilityID`,`DiagnosisTestID`),
  CONSTRAINT `tbl_diagnostic_tests_under_center_ibfk_1` FOREIGN KEY (`dFacilityID`) REFERENCES `tbl_diagnosis_center` (`dFacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diagnostic_tests_under_center`
--

LOCK TABLES `tbl_diagnostic_tests_under_center` WRITE;
/*!40000 ALTER TABLE `tbl_diagnostic_tests_under_center` DISABLE KEYS */;
INSERT INTO `tbl_diagnostic_tests_under_center` VALUES (100002,4000001),(100004,4000002);
/*!40000 ALTER TABLE `tbl_diagnostic_tests_under_center` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diet`
--

DROP TABLE IF EXISTS `tbl_diet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diet` (
  `DietID` int NOT NULL,
  `Date` date NOT NULL,
  `WeightLoss` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MuscleGain` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Maintenance` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Time` date NOT NULL,
  `NumberOfMeals` int NOT NULL,
  `Description` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `StartingTime` date NOT NULL,
  `EndingTime` date NOT NULL,
  `MetricID` int NOT NULL,
  PRIMARY KEY (`DietID`),
  KEY `Diet_FK` (`MetricID`),
  CONSTRAINT `Diet_FK` FOREIGN KEY (`MetricID`) REFERENCES `tbl_daily_health_metrics` (`MetricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diet`
--

LOCK TABLES `tbl_diet` WRITE;
/*!40000 ALTER TABLE `tbl_diet` DISABLE KEYS */;
INSERT INTO `tbl_diet` VALUES (1,'2024-01-01','Y','N','N','2024-01-01',3,'Low carb diet for weight loss','2024-01-01','2024-01-01',20001),(2,'2024-02-01','N','Y','N','2024-02-01',5,'High protein diet for muscle gain','2024-02-01','2024-02-01',20002),(3,'2024-03-01','N','N','Y','2024-03-01',4,'Balanced diet for maintenance','2024-03-01','2024-03-01',20003),(4,'2024-04-01','Y','Y','N','2024-04-01',6,'Combined diet for weight loss and muscle gain','2024-04-01','2024-04-01',20004),(5,'2024-05-01','N','N','Y','2024-05-01',3,'Maintenance diet with moderate protein','2024-05-01','2024-05-01',20005);
/*!40000 ALTER TABLE `tbl_diet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diet_meal_type`
--

DROP TABLE IF EXISTS `tbl_diet_meal_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diet_meal_type` (
  `DietID` int NOT NULL,
  `Breakfast` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Lunch` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Dinner` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Snack` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`DietID`),
  CONSTRAINT `DietMealType_FK` FOREIGN KEY (`DietID`) REFERENCES `tbl_diet` (`DietID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diet_meal_type`
--

LOCK TABLES `tbl_diet_meal_type` WRITE;
/*!40000 ALTER TABLE `tbl_diet_meal_type` DISABLE KEYS */;
INSERT INTO `tbl_diet_meal_type` VALUES (1,'Scrambled eggs with spinach','Grilled chicken salad','Salmon with quinoa','Greek yogurt with berries'),(2,'Oatmeal with fruits','Quinoa with vegetables','Grilled tofu with rice','Mixed nuts'),(3,'Whole wheat toast with avocado','Vegetable stir-fry','Bean soup','Fruit smoothie'),(4,'Protein shake','Baked fish with vegetables','Brown rice with lentils','Cottage cheese with pineapple'),(5,'Granola with almond milk','Mixed green salad','Grilled vegetables','Hummus with carrots');
/*!40000 ALTER TABLE `tbl_diet_meal_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diet_plan`
--

DROP TABLE IF EXISTS `tbl_diet_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diet_plan` (
  `PatientID` int NOT NULL,
  `DietID` int NOT NULL,
  `NutritionistID` int NOT NULL,
  `DietPlan` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`PatientID`,`DietID`,`NutritionistID`),
  KEY `DietPlan_FK2` (`DietID`),
  KEY `DietPlan_FK3` (`NutritionistID`),
  CONSTRAINT `DietPlan_FK1` FOREIGN KEY (`PatientID`) REFERENCES `tbl_patient` (`PatientID`),
  CONSTRAINT `DietPlan_FK2` FOREIGN KEY (`DietID`) REFERENCES `tbl_diet` (`DietID`),
  CONSTRAINT `DietPlan_FK3` FOREIGN KEY (`NutritionistID`) REFERENCES `tbl_nutritionist` (`NutritionistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diet_plan`
--

LOCK TABLES `tbl_diet_plan` WRITE;
/*!40000 ALTER TABLE `tbl_diet_plan` DISABLE KEYS */;
INSERT INTO `tbl_diet_plan` VALUES (20000001,1,1,'Low carb diet with increased protein intake'),(20000002,2,1,'Low carb diet with increased protein intake'),(20000002,2,2,'High protein diet with moderate carbs'),(20000003,3,3,'Balanced diet with emphasis on vitamins and minerals'),(20000004,4,4,'Customized diet plan for weight loss and muscle gain'),(20000005,5,5,'Maintenance diet with focus on calorie control and nutrients');
/*!40000 ALTER TABLE `tbl_diet_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diet_recommendation_suggest_food`
--

DROP TABLE IF EXISTS `tbl_diet_recommendation_suggest_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diet_recommendation_suggest_food` (
  `FoodID` int NOT NULL,
  `DietID` int NOT NULL,
  PRIMARY KEY (`FoodID`,`DietID`),
  KEY `DietRecommendationSuggestFood_FK2` (`DietID`),
  CONSTRAINT `DietRecommendationSuggestFood_FK1` FOREIGN KEY (`FoodID`) REFERENCES `tbl_food` (`FoodID`),
  CONSTRAINT `DietRecommendationSuggestFood_FK2` FOREIGN KEY (`DietID`) REFERENCES `tbl_diet` (`DietID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diet_recommendation_suggest_food`
--

LOCK TABLES `tbl_diet_recommendation_suggest_food` WRITE;
/*!40000 ALTER TABLE `tbl_diet_recommendation_suggest_food` DISABLE KEYS */;
INSERT INTO `tbl_diet_recommendation_suggest_food` VALUES (101,1),(102,1),(103,2),(104,2),(105,3);
/*!40000 ALTER TABLE `tbl_diet_recommendation_suggest_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diet_recommendation_uses_diagnosis`
--

DROP TABLE IF EXISTS `tbl_diet_recommendation_uses_diagnosis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diet_recommendation_uses_diagnosis` (
  `DietID` int NOT NULL,
  `DiagnosisID` int NOT NULL,
  PRIMARY KEY (`DietID`,`DiagnosisID`),
  KEY `DietRecommendationUsesDiagnosis_FK2` (`DiagnosisID`),
  CONSTRAINT `DietRecommendationUsesDiagnosis_FK1` FOREIGN KEY (`DietID`) REFERENCES `tbl_diet` (`DietID`),
  CONSTRAINT `DietRecommendationUsesDiagnosis_FK2` FOREIGN KEY (`DiagnosisID`) REFERENCES `tbl_diagnosis_record` (`DiagnosisID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diet_recommendation_uses_diagnosis`
--

LOCK TABLES `tbl_diet_recommendation_uses_diagnosis` WRITE;
/*!40000 ALTER TABLE `tbl_diet_recommendation_uses_diagnosis` DISABLE KEYS */;
INSERT INTO `tbl_diet_recommendation_uses_diagnosis` VALUES (1,3000001),(2,3000002),(3,3000003),(4,3000004),(5,3000005);
/*!40000 ALTER TABLE `tbl_diet_recommendation_uses_diagnosis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_diet_type`
--

DROP TABLE IF EXISTS `tbl_diet_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_diet_type` (
  `DietID` int NOT NULL,
  `DietType` int NOT NULL,
  `Name` text COLLATE utf8mb4_general_ci NOT NULL,
  `Calories` int NOT NULL,
  `Mineral` int NOT NULL,
  `Carbohydrates` int NOT NULL,
  `Proteins` int NOT NULL,
  `Fats` int NOT NULL,
  `Unit` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`DietID`,`DietType`),
  CONSTRAINT `DietType_FK` FOREIGN KEY (`DietID`) REFERENCES `tbl_diet` (`DietID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_diet_type`
--

LOCK TABLES `tbl_diet_type` WRITE;
/*!40000 ALTER TABLE `tbl_diet_type` DISABLE KEYS */;
INSERT INTO `tbl_diet_type` VALUES (1,101,'Weight loss',2200,10,50,30,20,'Grams'),(1,102,'Anti-Dieabetes ',1200,15,40,40,20,'Grams'),(3,101,'Weight gain',3400,8,60,20,15,'Grams'),(4,102,'Weight gain',3350,5,55,15,15,'Grams'),(5,101,'0Weight gain',4350,12,45,25,20,'Grams');
/*!40000 ALTER TABLE `tbl_diet_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_doctor`
--

DROP TABLE IF EXISTS `tbl_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_doctor` (
  `DoctorID` int NOT NULL,
  PRIMARY KEY (`DoctorID`),
  CONSTRAINT `Doctor_FK` FOREIGN KEY (`DoctorID`) REFERENCES `tbl_healthcare_professionals` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_doctor`
--

LOCK TABLES `tbl_doctor` WRITE;
/*!40000 ALTER TABLE `tbl_doctor` DISABLE KEYS */;
INSERT INTO `tbl_doctor` VALUES (1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `tbl_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_doctor_affiliation`
--

DROP TABLE IF EXISTS `tbl_doctor_affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_doctor_affiliation` (
  `DoctorID` int NOT NULL,
  `hFacilityID` int NOT NULL,
  `StartTime` date NOT NULL,
  `EndTime` date NOT NULL,
  `ScDate` date NOT NULL,
  PRIMARY KEY (`DoctorID`,`hFacilityID`,`StartTime`,`EndTime`,`ScDate`),
  KEY `DoctorAffiliation_FK2` (`hFacilityID`),
  CONSTRAINT `DoctorAffiliation_FK1` FOREIGN KEY (`DoctorID`) REFERENCES `tbl_doctor` (`DoctorID`),
  CONSTRAINT `DoctorAffiliation_FK2` FOREIGN KEY (`hFacilityID`) REFERENCES `tbl_hospital` (`hFacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_doctor_affiliation`
--

LOCK TABLES `tbl_doctor_affiliation` WRITE;
/*!40000 ALTER TABLE `tbl_doctor_affiliation` DISABLE KEYS */;
INSERT INTO `tbl_doctor_affiliation` VALUES (1,100001,'2024-01-01','2024-12-31','2024-01-01'),(3,100003,'2024-01-01','2024-12-31','2024-01-01'),(5,100005,'2024-01-01','2024-12-31','2024-01-01');
/*!40000 ALTER TABLE `tbl_doctor_affiliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_doctor_speciality`
--

DROP TABLE IF EXISTS `tbl_doctor_speciality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_doctor_speciality` (
  `DoctorID` int NOT NULL,
  `Speciality` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`DoctorID`,`Speciality`),
  CONSTRAINT `DoctorSpeciality_FK` FOREIGN KEY (`DoctorID`) REFERENCES `tbl_doctor` (`DoctorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_doctor_speciality`
--

LOCK TABLES `tbl_doctor_speciality` WRITE;
/*!40000 ALTER TABLE `tbl_doctor_speciality` DISABLE KEYS */;
INSERT INTO `tbl_doctor_speciality` VALUES (1,'Cardiology'),(2,'Orthopedics'),(3,'Pediatrics'),(4,'Dermatology'),(5,'Oncology');
/*!40000 ALTER TABLE `tbl_doctor_speciality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_food`
--

DROP TABLE IF EXISTS `tbl_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_food` (
  `FoodID` int NOT NULL,
  `Name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Carbohydrates` int NOT NULL,
  `Fats` int NOT NULL,
  `Vitamins` int NOT NULL,
  `Protein` int NOT NULL,
  `Minerals` int NOT NULL,
  `Unit` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `MinCalorie` int NOT NULL,
  `MaxCalorie` int NOT NULL,
  PRIMARY KEY (`FoodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_food`
--

LOCK TABLES `tbl_food` WRITE;
/*!40000 ALTER TABLE `tbl_food` DISABLE KEYS */;
INSERT INTO `tbl_food` VALUES (101,'Apple',14,0,1,0,1,'Piece',52,95),(102,'Banana',27,0,1,1,1,'Piece',89,105),(103,'Chicken Breast',0,3,0,31,1,'100 grams',165,200),(104,'Broccoli',7,0,1,3,1,'100 grams',34,55),(105,'Almonds',22,49,1,21,3,'100 grams',575,650);
/*!40000 ALTER TABLE `tbl_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_food_other_vitals`
--

DROP TABLE IF EXISTS `tbl_food_other_vitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_food_other_vitals` (
  `FoodID` int NOT NULL,
  `VitalName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Unit` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`FoodID`,`VitalName`),
  CONSTRAINT `FoodOtherVitals_FK` FOREIGN KEY (`FoodID`) REFERENCES `tbl_food` (`FoodID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_food_other_vitals`
--

LOCK TABLES `tbl_food_other_vitals` WRITE;
/*!40000 ALTER TABLE `tbl_food_other_vitals` DISABLE KEYS */;
INSERT INTO `tbl_food_other_vitals` VALUES (101,'Fiber','grams'),(101,'Sugar','grams'),(102,'Fiber','grams'),(102,'Sugar','grams'),(103,'Sodium','milligrams');
/*!40000 ALTER TABLE `tbl_food_other_vitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_healthcare_facility`
--

DROP TABLE IF EXISTS `tbl_healthcare_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_healthcare_facility` (
  `FacilityID` int NOT NULL,
  `Name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Hotline` bigint DEFAULT NULL,
  `DiagnosisCenter` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Hospital` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_healthcare_facility`
--

LOCK TABLES `tbl_healthcare_facility` WRITE;
/*!40000 ALTER TABLE `tbl_healthcare_facility` DISABLE KEYS */;
INSERT INTO `tbl_healthcare_facility` VALUES (100001,'Central Hospital',1234567890,'N','Y'),(100002,'Westside Clinic',2345678901,'Y','N'),(100003,'Eastside Hospital',3456789012,'N','Y'),(100004,'North Health Center',4567890123,'Y','N'),(100005,'South Medical Hub',5678901234,'N','Y');
/*!40000 ALTER TABLE `tbl_healthcare_facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_healthcare_facility_dept`
--

DROP TABLE IF EXISTS `tbl_healthcare_facility_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_healthcare_facility_dept` (
  `FacilityID` int NOT NULL,
  `Department` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`FacilityID`,`Department`),
  CONSTRAINT `tbl_healthcare_facility_dept_ibfk_1` FOREIGN KEY (`FacilityID`) REFERENCES `tbl_healthcare_facility` (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_healthcare_facility_dept`
--

LOCK TABLES `tbl_healthcare_facility_dept` WRITE;
/*!40000 ALTER TABLE `tbl_healthcare_facility_dept` DISABLE KEYS */;
INSERT INTO `tbl_healthcare_facility_dept` VALUES (100001,'Cardiology'),(100001,'Neurology'),(100001,'Orthopedics'),(100002,'Dermatology'),(100002,'Pediatrics'),(100003,'Emergency'),(100003,'Radiology'),(100004,'Outpatient'),(100004,'Surgery'),(100005,'Inpatient');
/*!40000 ALTER TABLE `tbl_healthcare_facility_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_healthcare_facility_location`
--

DROP TABLE IF EXISTS `tbl_healthcare_facility_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_healthcare_facility_location` (
  `FacilityID` int NOT NULL,
  `District` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Sub_District` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`FacilityID`,`District`,`Sub_District`),
  CONSTRAINT `tbl_healthcare_facility_location_ibfk_1` FOREIGN KEY (`FacilityID`) REFERENCES `tbl_healthcare_facility` (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_healthcare_facility_location`
--

LOCK TABLES `tbl_healthcare_facility_location` WRITE;
/*!40000 ALTER TABLE `tbl_healthcare_facility_location` DISABLE KEYS */;
INSERT INTO `tbl_healthcare_facility_location` VALUES (100001,'District A','SubA1'),(100002,'District B','SubB1'),(100003,'District C','SubC1'),(100004,'District D','SubD1'),(100005,'District E','SubE1');
/*!40000 ALTER TABLE `tbl_healthcare_facility_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_healthcare_facility_service`
--

DROP TABLE IF EXISTS `tbl_healthcare_facility_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_healthcare_facility_service` (
  `FacilityID` int NOT NULL,
  `Service` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`FacilityID`,`Service`),
  CONSTRAINT `tbl_healthcare_facility_service_ibfk_1` FOREIGN KEY (`FacilityID`) REFERENCES `tbl_healthcare_facility` (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_healthcare_facility_service`
--

LOCK TABLES `tbl_healthcare_facility_service` WRITE;
/*!40000 ALTER TABLE `tbl_healthcare_facility_service` DISABLE KEYS */;
INSERT INTO `tbl_healthcare_facility_service` VALUES (100001,'Emergency'),(100002,'Radiology'),(100003,'Surgery'),(100004,'Outpatient'),(100005,'Inpatient');
/*!40000 ALTER TABLE `tbl_healthcare_facility_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_healthcare_professionals`
--

DROP TABLE IF EXISTS `tbl_healthcare_professionals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_healthcare_professionals` (
  `ID` int NOT NULL,
  `Name` varchar(35) COLLATE utf8mb4_general_ci NOT NULL,
  `DOB` date NOT NULL,
  `Gender` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PhoneNumber` int NOT NULL,
  `Email` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NID` int DEFAULT NULL,
  `YearsOfExperience` int DEFAULT NULL,
  `Doctors` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Nutritionist` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `tbl_healthcare_professionals_chk_1` CHECK ((`Gender` in (_utf8mb4'M',_utf8mb4'F'))),
  CONSTRAINT `tbl_healthcare_professionals_chk_2` CHECK ((`Doctors` in (_utf8mb4'Y',_utf8mb4'N'))),
  CONSTRAINT `tbl_healthcare_professionals_chk_3` CHECK ((`Nutritionist` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_healthcare_professionals`
--

LOCK TABLES `tbl_healthcare_professionals` WRITE;
/*!40000 ALTER TABLE `tbl_healthcare_professionals` DISABLE KEYS */;
INSERT INTO `tbl_healthcare_professionals` VALUES (1,'John Doe','1980-01-15','M',2147483647,'johndoe@example.com',1234567890,10,'Y','N'),(2,'Jane Smith','1985-02-20','F',2147483647,'janesmith@example.com',2147483647,8,'N','Y'),(3,'Robert Brown','1975-03-25','M',2147483647,'robertbrown@example.com',2147483647,15,'Y','N'),(4,'Emily Davis','1990-04-30','F',2147483647,'emilydavis@example.com',2147483647,5,'N','Y'),(5,'Michael Johnson','1982-05-05','M',2147483647,'michaeljohnson@example.com',2147483647,12,'Y','N');
/*!40000 ALTER TABLE `tbl_healthcare_professionals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_healthcare_professionals_address`
--

DROP TABLE IF EXISTS `tbl_healthcare_professionals_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_healthcare_professionals_address` (
  `ID` int NOT NULL,
  `District` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Sub_District` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`,`District`,`Sub_District`),
  CONSTRAINT `HealthcareProfessionalsAddress_FK` FOREIGN KEY (`ID`) REFERENCES `tbl_healthcare_professionals` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_healthcare_professionals_address`
--

LOCK TABLES `tbl_healthcare_professionals_address` WRITE;
/*!40000 ALTER TABLE `tbl_healthcare_professionals_address` DISABLE KEYS */;
INSERT INTO `tbl_healthcare_professionals_address` VALUES (1,'District A','Sub_District 1'),(2,'District B','Sub_District 2'),(3,'District C','Sub_District 3'),(4,'District D','Sub_District 4'),(5,'District E','Sub_District 5');
/*!40000 ALTER TABLE `tbl_healthcare_professionals_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_healthcare_professionals_certifications`
--

DROP TABLE IF EXISTS `tbl_healthcare_professionals_certifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_healthcare_professionals_certifications` (
  `ID` int NOT NULL,
  `Certifications` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`,`Certifications`),
  CONSTRAINT `HealthcareProfessionalsCertifications_FK` FOREIGN KEY (`ID`) REFERENCES `tbl_healthcare_professionals` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_healthcare_professionals_certifications`
--

LOCK TABLES `tbl_healthcare_professionals_certifications` WRITE;
/*!40000 ALTER TABLE `tbl_healthcare_professionals_certifications` DISABLE KEYS */;
INSERT INTO `tbl_healthcare_professionals_certifications` VALUES (1,'Certification 1'),(2,'Certification 2'),(3,'Certification 3'),(4,'Certification 4'),(5,'Certification 5');
/*!40000 ALTER TABLE `tbl_healthcare_professionals_certifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_healthcare_professionals_education`
--

DROP TABLE IF EXISTS `tbl_healthcare_professionals_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_healthcare_professionals_education` (
  `ID` int NOT NULL,
  `Education` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`,`Education`),
  CONSTRAINT `HealthcareProfessionalsEducation_FK` FOREIGN KEY (`ID`) REFERENCES `tbl_healthcare_professionals` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_healthcare_professionals_education`
--

LOCK TABLES `tbl_healthcare_professionals_education` WRITE;
/*!40000 ALTER TABLE `tbl_healthcare_professionals_education` DISABLE KEYS */;
INSERT INTO `tbl_healthcare_professionals_education` VALUES (1,'Education 1'),(2,'Education 2'),(3,'Education 3'),(4,'Education 4'),(5,'Education 5');
/*!40000 ALTER TABLE `tbl_healthcare_professionals_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_healthcare_professionals_hospital_affiliation`
--

DROP TABLE IF EXISTS `tbl_healthcare_professionals_hospital_affiliation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_healthcare_professionals_hospital_affiliation` (
  `ID` int NOT NULL,
  `HospitalAffiliation` varchar(35) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`ID`,`HospitalAffiliation`),
  CONSTRAINT `HealthcareProfessionalsHospitalAffiliation_FK` FOREIGN KEY (`ID`) REFERENCES `tbl_healthcare_professionals` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_healthcare_professionals_hospital_affiliation`
--

LOCK TABLES `tbl_healthcare_professionals_hospital_affiliation` WRITE;
/*!40000 ALTER TABLE `tbl_healthcare_professionals_hospital_affiliation` DISABLE KEYS */;
INSERT INTO `tbl_healthcare_professionals_hospital_affiliation` VALUES (1,'Hospital 1'),(2,'Hospital 2'),(3,'Hospital 3'),(4,'Hospital 4'),(5,'Hospital 5');
/*!40000 ALTER TABLE `tbl_healthcare_professionals_hospital_affiliation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hospital`
--

DROP TABLE IF EXISTS `tbl_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_hospital` (
  `hFacilityID` int NOT NULL,
  `ICUCapacity` int DEFAULT NULL,
  PRIMARY KEY (`hFacilityID`),
  CONSTRAINT `tbl_hospital_ibfk_1` FOREIGN KEY (`hFacilityID`) REFERENCES `tbl_healthcare_facility` (`FacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_hospital`
--

LOCK TABLES `tbl_hospital` WRITE;
/*!40000 ALTER TABLE `tbl_hospital` DISABLE KEYS */;
INSERT INTO `tbl_hospital` VALUES (100001,50),(100003,30),(100005,40);
/*!40000 ALTER TABLE `tbl_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_hospital_emergency_service`
--

DROP TABLE IF EXISTS `tbl_hospital_emergency_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_hospital_emergency_service` (
  `hFacilityID` int NOT NULL,
  `EmergencyService` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`hFacilityID`,`EmergencyService`),
  CONSTRAINT `tbl_hospital_emergency_service_ibfk_1` FOREIGN KEY (`hFacilityID`) REFERENCES `tbl_hospital` (`hFacilityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_hospital_emergency_service`
--

LOCK TABLES `tbl_hospital_emergency_service` WRITE;
/*!40000 ALTER TABLE `tbl_hospital_emergency_service` DISABLE KEYS */;
INSERT INTO `tbl_hospital_emergency_service` VALUES (100001,'Trauma Care'),(100003,'Burn Unit'),(100005,'Cardiac Emergency');
/*!40000 ALTER TABLE `tbl_hospital_emergency_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_medicine`
--

DROP TABLE IF EXISTS `tbl_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_medicine` (
  `MedicineID` int NOT NULL,
  `DrugName` varchar(35) COLLATE utf8mb4_general_ci NOT NULL,
  `Indications` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Interaction` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SideEffects` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PrecautionsWarnings` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DosageInstructions` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `MetricID` int NOT NULL,
  PRIMARY KEY (`MedicineID`),
  KEY `Medicine_FK` (`MetricID`),
  CONSTRAINT `Medicine_FK` FOREIGN KEY (`MetricID`) REFERENCES `tbl_daily_health_metrics` (`MetricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_medicine`
--

LOCK TABLES `tbl_medicine` WRITE;
/*!40000 ALTER TABLE `tbl_medicine` DISABLE KEYS */;
INSERT INTO `tbl_medicine` VALUES (100001,'Aspirin','Pain relief','Anticoagulants','Nausea','Avoid in case of allergy','Take with food',20001),(100002,'Metformin','Diabetes','Alcohol','Diarrhea','Monitor blood sugar','Take with meals',20002),(100003,'Atorvastatin','Cholesterol','Grapefruit juice','Muscle pain','Liver function tests','Take at bedtime',20003),(100004,'Lisinopril','Hypertension','Potassium supplements','Cough','Monitor blood pressure','Take at the same time daily',20004),(100005,'Omeprazole','GERD','Clopidogrel','Headache','Avoid prolonged use','Take before meals',20005);
/*!40000 ALTER TABLE `tbl_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nutritionist`
--

DROP TABLE IF EXISTS `tbl_nutritionist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_nutritionist` (
  `NutritionistID` int NOT NULL,
  PRIMARY KEY (`NutritionistID`),
  CONSTRAINT `Nutritionist_FK` FOREIGN KEY (`NutritionistID`) REFERENCES `tbl_healthcare_professionals` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nutritionist`
--

LOCK TABLES `tbl_nutritionist` WRITE;
/*!40000 ALTER TABLE `tbl_nutritionist` DISABLE KEYS */;
INSERT INTO `tbl_nutritionist` VALUES (1),(2),(3),(4),(5);
/*!40000 ALTER TABLE `tbl_nutritionist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_nutritionist_type`
--

DROP TABLE IF EXISTS `tbl_nutritionist_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_nutritionist_type` (
  `NutritionistID` int NOT NULL,
  `NutritionistType` varchar(6) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`NutritionistID`,`NutritionistType`),
  CONSTRAINT `NutritionistType_FK` FOREIGN KEY (`NutritionistID`) REFERENCES `tbl_nutritionist` (`NutritionistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_nutritionist_type`
--

LOCK TABLES `tbl_nutritionist_type` WRITE;
/*!40000 ALTER TABLE `tbl_nutritionist_type` DISABLE KEYS */;
INSERT INTO `tbl_nutritionist_type` VALUES (1,'Dietit'),(2,'Coach'),(3,'Consul'),(4,'Dietit'),(5,'Coach');
/*!40000 ALTER TABLE `tbl_nutritionist_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_patient`
--

DROP TABLE IF EXISTS `tbl_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_patient` (
  `PatientID` int NOT NULL,
  `FName` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `LName` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `DOB` date NOT NULL,
  `Gender` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PhoneNumber` int NOT NULL,
  `Email` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Weight` int DEFAULT NULL,
  `Height` int DEFAULT NULL,
  `InsulinStatus` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  CONSTRAINT `tbl_patient_chk_1` CHECK ((`Gender` in (_utf8mb4'M',_utf8mb4'F'))),
  CONSTRAINT `tbl_patient_chk_2` CHECK ((`InsulinStatus` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_patient`
--

LOCK TABLES `tbl_patient` WRITE;
/*!40000 ALTER TABLE `tbl_patient` DISABLE KEYS */;
INSERT INTO `tbl_patient` VALUES (20000001,'John','Doe','1980-01-01','M',1234567890,'john.doe@example.com',70,175,'N'),(20000002,'Jane','Smith','1990-02-02','F',2147483647,'jane.smith@example.com',60,165,'N'),(20000003,'Robert','Brown','1975-03-03','M',2147483647,'robert.brown@example.com',80,180,'Y'),(20000004,'Emily','Clark','1985-04-04','F',2147483647,'emily.clark@example.com',55,160,'N'),(20000005,'Michael','Davis','2000-05-05','M',2147483647,'michael.davis@example.com',90,185,'Y');
/*!40000 ALTER TABLE `tbl_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_patient_address`
--

DROP TABLE IF EXISTS `tbl_patient_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_patient_address` (
  `PatientID` int NOT NULL,
  `District` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `Sub_District` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`PatientID`,`District`,`Sub_District`),
  CONSTRAINT `PatientAddress_FK` FOREIGN KEY (`PatientID`) REFERENCES `tbl_patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_patient_address`
--

LOCK TABLES `tbl_patient_address` WRITE;
/*!40000 ALTER TABLE `tbl_patient_address` DISABLE KEYS */;
INSERT INTO `tbl_patient_address` VALUES (20000001,'Central','Downtown'),(20000002,'North','Uptown'),(20000003,'West','Midtown'),(20000004,'East','Eastside'),(20000005,'South','Southend');
/*!40000 ALTER TABLE `tbl_patient_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_patient_diabetes_type`
--

DROP TABLE IF EXISTS `tbl_patient_diabetes_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_patient_diabetes_type` (
  `PatientID` int NOT NULL,
  `DiabetesType` char(6) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`PatientID`),
  CONSTRAINT `PatientDiabetesType_FK` FOREIGN KEY (`PatientID`) REFERENCES `tbl_patient` (`PatientID`),
  CONSTRAINT `tbl_patient_diabetes_type_chk_1` CHECK ((`DiabetesType` in (_utf8mb4'1',_utf8mb4'2',_utf8mb4'others',_utf8mb4'nil')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_patient_diabetes_type`
--

LOCK TABLES `tbl_patient_diabetes_type` WRITE;
/*!40000 ALTER TABLE `tbl_patient_diabetes_type` DISABLE KEYS */;
INSERT INTO `tbl_patient_diabetes_type` VALUES (20000001,'1'),(20000002,'2'),(20000003,'others'),(20000004,'nil'),(20000005,'1');
/*!40000 ALTER TABLE `tbl_patient_diabetes_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_patient_diet_recommendations`
--

DROP TABLE IF EXISTS `tbl_patient_diet_recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_patient_diet_recommendations` (
  `PatientID` int NOT NULL,
  `DietID` int NOT NULL,
  PRIMARY KEY (`PatientID`,`DietID`),
  KEY `PatientDietRecommendations_FK2` (`DietID`),
  CONSTRAINT `PatientDietRecommendations_FK1` FOREIGN KEY (`PatientID`) REFERENCES `tbl_patient` (`PatientID`),
  CONSTRAINT `PatientDietRecommendations_FK2` FOREIGN KEY (`DietID`) REFERENCES `tbl_diet` (`DietID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_patient_diet_recommendations`
--

LOCK TABLES `tbl_patient_diet_recommendations` WRITE;
/*!40000 ALTER TABLE `tbl_patient_diet_recommendations` DISABLE KEYS */;
INSERT INTO `tbl_patient_diet_recommendations` VALUES (20000001,1),(20000002,2),(20000003,3),(20000004,4),(20000005,5);
/*!40000 ALTER TABLE `tbl_patient_diet_recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_patient_feedback`
--

DROP TABLE IF EXISTS `tbl_patient_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_patient_feedback` (
  `PatientID` int NOT NULL,
  `ReviewID` int NOT NULL,
  PRIMARY KEY (`PatientID`,`ReviewID`),
  KEY `PatientFeedback_FK2` (`ReviewID`),
  CONSTRAINT `PatientFeedback_FK1` FOREIGN KEY (`PatientID`) REFERENCES `tbl_patient` (`PatientID`),
  CONSTRAINT `PatientFeedback_FK2` FOREIGN KEY (`ReviewID`) REFERENCES `tbl_review` (`ReviewID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_patient_feedback`
--

LOCK TABLES `tbl_patient_feedback` WRITE;
/*!40000 ALTER TABLE `tbl_patient_feedback` DISABLE KEYS */;
INSERT INTO `tbl_patient_feedback` VALUES (20000001,60000001),(20000002,60000002),(20000003,60000003),(20000004,60000004),(20000005,60000005);
/*!40000 ALTER TABLE `tbl_patient_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_patient_health_data`
--

DROP TABLE IF EXISTS `tbl_patient_health_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_patient_health_data` (
  `PatientID` int NOT NULL,
  `MetricID` int NOT NULL,
  PRIMARY KEY (`PatientID`,`MetricID`),
  KEY `PatientHealthData_FK2` (`MetricID`),
  CONSTRAINT `PatientHealthData_FK1` FOREIGN KEY (`PatientID`) REFERENCES `tbl_patient` (`PatientID`),
  CONSTRAINT `PatientHealthData_FK2` FOREIGN KEY (`MetricID`) REFERENCES `tbl_daily_health_metrics` (`MetricID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_patient_health_data`
--

LOCK TABLES `tbl_patient_health_data` WRITE;
/*!40000 ALTER TABLE `tbl_patient_health_data` DISABLE KEYS */;
INSERT INTO `tbl_patient_health_data` VALUES (20000001,20001),(20000002,20002),(20000003,20003),(20000004,20004),(20000005,20005);
/*!40000 ALTER TABLE `tbl_patient_health_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_patient_other_illness`
--

DROP TABLE IF EXISTS `tbl_patient_other_illness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_patient_other_illness` (
  `PatientID` int NOT NULL,
  `OtherIllness` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`PatientID`,`OtherIllness`),
  CONSTRAINT `PatientOtherIllness_FK` FOREIGN KEY (`PatientID`) REFERENCES `tbl_patient` (`PatientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_patient_other_illness`
--

LOCK TABLES `tbl_patient_other_illness` WRITE;
/*!40000 ALTER TABLE `tbl_patient_other_illness` DISABLE KEYS */;
INSERT INTO `tbl_patient_other_illness` VALUES (20000001,'Hypertension'),(20000002,'Asthma'),(20000003,'Arthritis'),(20000004,'Diabetes'),(20000005,'Chronic Migraine');
/*!40000 ALTER TABLE `tbl_patient_other_illness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prescription`
--

DROP TABLE IF EXISTS `tbl_prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_prescription` (
  `PrescriptionID` int NOT NULL,
  `Date` date NOT NULL,
  `UpdatedDate` date DEFAULT NULL,
  `ConsultationID` int NOT NULL,
  PRIMARY KEY (`PrescriptionID`),
  KEY `Prescription_FK` (`ConsultationID`),
  CONSTRAINT `Prescription_FK` FOREIGN KEY (`ConsultationID`) REFERENCES `tbl_consultation` (`ConsultationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prescription`
--

LOCK TABLES `tbl_prescription` WRITE;
/*!40000 ALTER TABLE `tbl_prescription` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prescription_medicine_dosage`
--

DROP TABLE IF EXISTS `tbl_prescription_medicine_dosage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_prescription_medicine_dosage` (
  `MedicineID` int NOT NULL,
  `PrescriptionID` int NOT NULL,
  `Frequency` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `Duration` int NOT NULL,
  PRIMARY KEY (`MedicineID`,`PrescriptionID`),
  KEY `PrescriptionMedicineDosage_FK2` (`PrescriptionID`),
  CONSTRAINT `PrescriptionMedicineDosage_FK1` FOREIGN KEY (`MedicineID`) REFERENCES `tbl_medicine` (`MedicineID`),
  CONSTRAINT `PrescriptionMedicineDosage_FK2` FOREIGN KEY (`PrescriptionID`) REFERENCES `tbl_prescription` (`PrescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prescription_medicine_dosage`
--

LOCK TABLES `tbl_prescription_medicine_dosage` WRITE;
/*!40000 ALTER TABLE `tbl_prescription_medicine_dosage` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prescription_medicine_dosage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prescription_test_recommend`
--

DROP TABLE IF EXISTS `tbl_prescription_test_recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_prescription_test_recommend` (
  `PrescriptionID` int NOT NULL,
  `TestRecommend` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`PrescriptionID`,`TestRecommend`),
  CONSTRAINT `PrescriptionTestRecommend_FK` FOREIGN KEY (`PrescriptionID`) REFERENCES `tbl_prescription` (`PrescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prescription_test_recommend`
--

LOCK TABLES `tbl_prescription_test_recommend` WRITE;
/*!40000 ALTER TABLE `tbl_prescription_test_recommend` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prescription_test_recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_prescription_treat_symptom`
--

DROP TABLE IF EXISTS `tbl_prescription_treat_symptom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_prescription_treat_symptom` (
  `PrescriptionID` int NOT NULL,
  `DiagnosedSymptomID` int NOT NULL,
  PRIMARY KEY (`PrescriptionID`,`DiagnosedSymptomID`),
  KEY `PrescriptionTreatSymptom_FK2` (`DiagnosedSymptomID`),
  CONSTRAINT `PrescriptionTreatSymptom_FK1` FOREIGN KEY (`PrescriptionID`) REFERENCES `tbl_prescription` (`PrescriptionID`),
  CONSTRAINT `PrescriptionTreatSymptom_FK2` FOREIGN KEY (`DiagnosedSymptomID`) REFERENCES `tbl_diagnosed_symptom` (`DiagnosedSymptomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_prescription_treat_symptom`
--

LOCK TABLES `tbl_prescription_treat_symptom` WRITE;
/*!40000 ALTER TABLE `tbl_prescription_treat_symptom` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_prescription_treat_symptom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_review`
--

DROP TABLE IF EXISTS `tbl_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_review` (
  `ReviewID` int NOT NULL,
  `Stars` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Date` date NOT NULL,
  `Description` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ReviewID`),
  CONSTRAINT `tbl_review_chk_1` CHECK ((`Stars` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_review`
--

LOCK TABLES `tbl_review` WRITE;
/*!40000 ALTER TABLE `tbl_review` DISABLE KEYS */;
INSERT INTO `tbl_review` VALUES (60000001,'Y','2024-01-01','Excellent service'),(60000002,'N','2024-02-02','Needs improvement'),(60000003,'Y','2024-03-03','Very satisfied'),(60000004,'N','2024-04-04','Average experience'),(60000005,'Y','2024-05-05','Highly recommend'),(60000006,'y','2024-05-05','GOOD'),(60000007,'y','2024-05-05','Best'),(60000008,'Y','2020-01-01','This is a test review'),(60000009,'y','2020-01-01','great');
/*!40000 ALTER TABLE `tbl_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-13 18:20:51
