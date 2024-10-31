-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2024 at 06:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_credentials`
--

CREATE TABLE `admin_credentials` (
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `admin_credentials`
--

INSERT INTO `admin_credentials` (`USERNAME`, `PASSWORD`) VALUES
('admin', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `CONTACT_NUMBER` varchar(10) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL,
  `DOCTOR_NAME` varchar(20) NOT NULL,
  `DOCTOR_ADDRESS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`ID`, `NAME`, `CONTACT_NUMBER`, `ADDRESS`, `DOCTOR_NAME`, `DOCTOR_ADDRESS`) VALUES
(4, 'Kiran Suthar', '1234567690', 'Andheri East', 'Anshari', 'Andheri East'),
(11, 'Shivam Tiwari', '6862369896', 'Dadar West', 'Dr Kapoor', 'Dadar East'),
(13, 'Varsha Suthar', '7622369694', 'Rani Station', 'Dr Ramesh', 'Rani Station'),
(14, 'Prakash Bhattarai', '9802851472', 'Pokhara-16, Dhikidada', 'Hari Bahadur', 'Matepani-12'),
(15, 'Samruddhi Shinde', '9370679906', 'C-18, Ambrossia BuildingMalpani Nagar, Ghulewadi', 'Dr Patil ', 'Rutunagari, Pune'),
(16, 'Shreyas Chulliyan', '7820868371', 'Katraj, Pune', 'Dr Shelke', 'Sangamner, Maharashtra'),
(17, 'Shlok Bam', '8652374150', 'Ratlam, MP', 'Dr Jain', 'Bibwewadi, Pune'),
(18, 'Kuldeep', '0000000000', 'C-18, Ambrossia BuildingMalpani Nagar, Ghulewadi', 'Dshfgk', 'Sukhsagar Nagar, Katraj, PuneSukhsagar Nagar, Katraj, Pune'),
(20, 'Amit Sharma', '9876543210', '123 MG Road, Mumbai', 'Dr. Arvind Mehta', '45 Apollo Hospital, Mumbai'),
(21, 'Sneha Patil', '8765432109', '456 FC Road, Pune', 'Dr. Neha Kulkarni', '78 Ruby Hall, Pune'),
(22, 'Ravi Kumar', '7654321098', '789 Brigade Road, Bangalore', 'Dr. Suresh Reddy', '99 Fortis Hospital, Bangalore'),
(23, 'Priya Desai', '6543210987', '159 T Nagar, Chennai', 'Dr. Anitha Iyer', '102 Apollo Hospital, Chennai'),
(24, 'Vikram Singh', '5432109876', '753 Jayanagar, Bangalore', 'Dr. Rajesh Gupta', '145 Manipal Hospital, Bangalore'),
(25, 'Rohit Verma', '4321098765', '852 Andheri East, Mumbai', 'Dr. Pooja Deshmukh', '201 Nanavati Hospital, Mumbai'),
(26, 'Anjali Nair', '3210987654', '951 Anna Nagar, Chennai', 'Dr. Kavitha Nair', '65 Vijaya Hospital, Chennai'),
(27, 'Suresh Menon', '2109876543', '369 Baner, Pune', 'Dr. Nitin Patil', '109 Deenanath Hospital, Pune'),
(28, 'Kavita Rao', '1098765432', '258 Banjara Hills, Hyderabad', 'Dr. Aditi Sharma', '56 Yashoda Hospital, Hyderabad'),
(29, 'Ashok Chawla', '9876123456', '147 Connaught Place, Delhi', 'Dr. Vivek Gupta', '32 AIIMS, Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `INVOICE_ID` int(11) NOT NULL,
  `NET_TOTAL` double NOT NULL DEFAULT 0,
  `INVOICE_DATE` date NOT NULL DEFAULT current_timestamp(),
  `CUSTOMER_ID` int(11) NOT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `TOTAL_DISCOUNT` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`INVOICE_ID`, `NET_TOTAL`, `INVOICE_DATE`, `CUSTOMER_ID`, `TOTAL_AMOUNT`, `TOTAL_DISCOUNT`) VALUES
(1, 30, '2021-10-19', 14, 30, 0),
(2, 2626, '2021-10-19', 6, 2626, 0),
(3, 114, '2024-09-05', 11, 120, 6),
(4, 5252, '2024-09-08', 13, 5252, 0),
(5, 30, '2024-09-05', 11, 30, 0),
(6, 750, '2024-09-05', 4, 750, 0),
(7, 1500, '2023-07-18', 14, 1500, 0),
(8, 5000, '2024-09-12', 14, 5000, 0),
(9, 3150, '2024-09-13', 15, 3150, 0),
(10, 2145, '2024-09-14', 16, 2145, 0),
(11, 450, '2024-09-15', 17, 450, 0),
(12, 6820, '2024-09-16', 14, 6820, 0),
(13, 3000, '2024-09-17', 11, 3000, 0),
(14, 2970, '2024-09-18', 16, 2970, 0),
(15, 1650, '2024-09-17', 16, 1650, 0),
(16, 3150, '2024-09-18', 4, 3150, 0),
(17, 3500, '2024-09-19', 4, 3500, 0),
(18, 950, '2024-10-01', 20, 1000, 50),
(19, 850, '2024-10-02', 21, 900, 50),
(20, 600, '2024-10-03', 22, 650, 50),
(21, 1100, '2024-10-04', 23, 1150, 50),
(22, 780, '2024-10-05', 24, 800, 20),
(23, 1200, '2024-10-06', 25, 1250, 50),
(24, 670, '2024-10-07', 26, 700, 30),
(25, 540, '2024-10-08', 27, 600, 60),
(26, 720, '2024-10-09', 28, 750, 30),
(27, 1050, '2024-10-10', 29, 1100, 50),
(28, 980, '2024-10-11', 20, 1000, 20),
(29, 1150, '2024-10-12', 21, 1200, 50),
(30, 890, '2024-10-13', 22, 920, 30),
(31, 1010, '2024-10-14', 23, 1050, 40),
(32, 630, '2024-10-15', 24, 650, 20),
(33, 1305, '2024-10-15', 25, 1450, 145),
(34, 1018.5, '2024-10-14', 25, 1050, 31.5),
(35, 700, '2024-10-17', 15, 700, 0);

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `PACKING` varchar(20) NOT NULL,
  `GENERIC_NAME` varchar(100) NOT NULL,
  `SUPPLIER_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`ID`, `NAME`, `PACKING`, `GENERIC_NAME`, `SUPPLIER_NAME`) VALUES
(1, 'Nicip Plus', '10tab', 'Paracetamole', 'BDPL PHARMA'),
(2, 'Crosin', '10tab', 'Hdsgvkvajkcbja', 'Kiran Pharma'),
(4, 'Dolo 650', '15tab', 'paracetamole', 'BDPL PHARMA'),
(5, 'Gelusil', '10tab', 'mint fla', 'Desai Pharma'),
(7, 'Paracetamol', '10 TAB', 'ITC', 'Desai Pharma'),
(12, 'Zoloft', '10 TAB', 'Sertraline', 'Cipla Ltd'),
(13, 'Lipitor', '10 TAB', 'Atorvastatin', 'Aurobindo Pharma '),
(33, 'Glucophage', '10 TAB', 'Metformin', 'Desai Pharma'),
(35, 'Nexium', '10 TAB', 'Esomeprazole', 'Kiran Pharma'),
(38, 'Zocor', '10 TAB', 'Sertraline', 'BDPL PHARMA'),
(39, 'Advil', '10 TAB', 'Ibuprofen', 'Desai Pharma'),
(41, 'Tylenol', '10 TAB', 'Acetaminophen', 'Kiran Pharma'),
(42, 'Lipitor', '10 TAB', 'Atorvastatin', 'Cipla Ltd'),
(101, 'Hydride', '10 TAB', 'Hydrochlorothiazide', 'Aurobindo Pharma'),
(102, 'Augmentin', '10 TAB', 'Amoxicillin + Clavulanic Acid', 'Cipla Ltd'),
(103, 'Ciplox', '15 TAB', 'Ciprofloxacin', 'Desai Pharma'),
(104, 'Brufen', '10 TAB', 'Ibuprofen', 'Kiran Pharma'),
(105, 'Gluconorm', '10 TAB', 'Metformin', 'BDPL PHARMA'),
(106, 'Ecosprin', '15 TAB', 'Aspirin', 'Aurobindo Pharma'),
(107, 'Allegra', '10 TAB', 'Fexofenadine', 'Cipla Ltd'),
(108, 'Pan 40', '15 TAB', 'Pantoprazole', 'Cipla Ltd'),
(109, 'Losacar', '10 TAB', 'Losartan', 'Desai Pharma'),
(110, 'Atorlip', '10 TAB', 'Atorvastatin', 'BDPL PHARMA'),
(111, 'Listril', '10 TAB', 'Lisinopril', 'Desai Pharma'),
(113, 'Simvotin', '15 TAB', 'Simvastatin', 'BDPL PHARMA'),
(114, 'Omez', '10 TAB', 'Omeprazole', 'Kiran Pharma');

-- --------------------------------------------------------

--
-- Table structure for table `medicines_stock`
--

CREATE TABLE `medicines_stock` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `BATCH_ID` varchar(20) NOT NULL,
  `EXPIRY_DATE` varchar(10) NOT NULL,
  `QUANTITY` int(11) NOT NULL,
  `MRP` double NOT NULL,
  `RATE` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `medicines_stock`
--

INSERT INTO `medicines_stock` (`ID`, `NAME`, `BATCH_ID`, `EXPIRY_DATE`, `QUANTITY`, `MRP`, `RATE`) VALUES
(1, 'Crosin', 'CROS12', '12/34', 10000, 2626, 26),
(2, 'Gelusil', 'G327', '12/42', 9800, 15, 12),
(3, 'Dolo 650', 'DOLO327', '01/25', 500, 30, 24),
(4, 'Nicip Plus', 'NI325', '05/22', 300, 32.65, 28),
(12, 'Zoloft', 'ZFT03456', '06/30', 8203, 25, 9),
(13, 'Lipitor', 'LPT05678', '06/30', 10203, 25, 9),
(16, 'Crestor', 'CRT04567', '05/30', 7715, 29, 10),
(17, 'Prozac', 'PZC01123', '03/30', 6674, 25, 9),
(30, 'Lasix', 'LSX07890', '11/30', 5067, 28, 9),
(33, 'Glucophage', 'GLC00987', '11/28', 9680, 31, 11),
(35, 'Nexium', 'NXM01234', '10/29', 1600, 30, 17),
(38, 'Zocor', 'ZCR00789', '12/29', 370, 35, 19),
(39, 'Advil', 'ADV00456', '12/27', 995, 33, 15),
(41, 'Tylenol', 'TYN00123', '10/27', 985, 30, 20),
(101, 'Hydride', 'BATCH015', '2025-10-20', 280, 45, 40),
(102, 'Augmentin', 'BATCH002', '2024-12-05', 300, 180, 150),
(103, 'Ciplox', 'BATCH003', '2025-01-15', 400, 100, 90),
(104, 'Brufen', 'BATCH004', '2026-06-20', 600, 75, 65),
(105, 'Gluconorm', 'BATCH005', '2025-08-10', 200, 150, 130),
(106, 'Ecosprin', 'BATCH006', '2024-11-01', 250, 30, 25),
(107, 'Allegra', 'BATCH007', '2025-04-18', 300, 120, 100),
(108, 'Pan 40', 'BATCH008', '2026-01-25', 400, 90, 80),
(109, 'Losacar', 'BATCH009', '2025-02-14', 350, 140, 120),
(110, 'Atorlip', 'BATCH010', '2026-03-30', 180, 95, 85),
(111, 'Listril', 'BATCH011', '2025-12-10', 300, 70, 60),
(112, 'Clopitab', 'BATCH012', '2024-09-25', 200, 110, 95);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `SUPPLIER_NAME` varchar(100) NOT NULL,
  `INVOICE_NUMBER` int(11) NOT NULL,
  `VOUCHER_NUMBER` int(11) NOT NULL,
  `PURCHASE_DATE` varchar(10) NOT NULL,
  `TOTAL_AMOUNT` double NOT NULL,
  `PAYMENT_STATUS` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`SUPPLIER_NAME`, `INVOICE_NUMBER`, `VOUCHER_NUMBER`, `PURCHASE_DATE`, `TOTAL_AMOUNT`, `PAYMENT_STATUS`) VALUES
('Desai Pharma', 1, 1, '2024-09-05', 80, 'PAID'),
('Kiran Pharma', 3, 2, '2024-09-08', 8000, 'PAID'),
('Kiran Pharma', 4, 3, '2024-09-12', 8000, 'PAID'),
('Cipla Ltd', 30, 4, '2024-10-01', 18000, 'PAID');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `CONTACT_NUMBER` varchar(10) NOT NULL,
  `ADDRESS` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_bin;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`ID`, `NAME`, `EMAIL`, `CONTACT_NUMBER`, `ADDRESS`) VALUES
(1, 'Desai Pharma', 'desai@gmail.com', '9948724242', 'Mahim East'),
(2, 'BDPL PHARMA', 'bdpl@gmail.com', '8645632963', 'Santacruz West'),
(9, 'Kiran Pharma', 'kiranpharma@gmail.com', '7638683637', 'Andheri East'),
(31, 'Cipla Ltd', 'ciplaltd@gmail.com', '9370679906', 'Sun House, Plot No. 201 B/1, Western Express Highway, Goregaon (East), Mumbai – 400063, Maharashtra,'),
(32, 'Aurobindo Pharma', 'aurobindopharma@gmail.com', '4066725000', 'Plot No. 2, Maithrivihar, Ameerpet, Hyderabad – 500038, Telangana, India');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_credentials`
--
ALTER TABLE `admin_credentials`
  ADD PRIMARY KEY (`USERNAME`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`INVOICE_ID`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `medicines_stock`
--
ALTER TABLE `medicines_stock`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `BATCH_ID` (`BATCH_ID`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`VOUCHER_NUMBER`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `INVOICE_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `medicines_stock`
--
ALTER TABLE `medicines_stock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `VOUCHER_NUMBER` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
