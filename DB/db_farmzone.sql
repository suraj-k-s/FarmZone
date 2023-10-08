-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2023 at 03:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_farmzone`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(4, 'Administrator', 'admin@gmail.com', '123456'),
(5, 'Amir Khan', 'ak142003218@gmail.com', 'amirnaji');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

CREATE TABLE `tbl_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`) VALUES
(9, 'Nursery Items'),
(10, 'Fertlizers'),
(11, 'Milk Products'),
(12, 'Farming Equipments'),
(13, 'Seeds');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_complaint`
--

CREATE TABLE `tbl_complaint` (
  `complaint_id` int(11) NOT NULL,
  `complaint_title` varchar(100) NOT NULL,
  `complaint_content` varchar(100) NOT NULL,
  `complaint_date` date NOT NULL,
  `complaint_status` int(11) NOT NULL,
  `complaint_reply` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_complaint`
--

INSERT INTO `tbl_complaint` (`complaint_id`, `complaint_title`, `complaint_content`, `complaint_date`, `complaint_status`, `complaint_reply`, `user_id`) VALUES
(6, 'complaint 1', 'not working', '0000-00-00', 0, '', 0),
(7, 'complaint 1', 'not working', '2023-09-28', 1, 'we will contact you', 7);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_district`
--

INSERT INTO `tbl_district` (`district_id`, `district_name`) VALUES
(2, 'Ernakulam'),
(3, 'Idukki'),
(6, 'Kasarkod'),
(7, 'Kannur'),
(8, 'Wayanad'),
(9, 'Kozhikode'),
(10, 'Pathanamthitta'),
(11, 'Trivandrum'),
(12, 'Alappuzha'),
(14, 'Malappuram'),
(15, 'Kollam'),
(16, 'Kottayam'),
(17, 'Palakkad'),
(18, 'Thrissur');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_farmer`
--

CREATE TABLE `tbl_farmer` (
  `farmer_id` int(11) NOT NULL,
  `farmer_name` varchar(100) NOT NULL,
  `farmer_email` varchar(100) NOT NULL,
  `farmer_address` varchar(100) NOT NULL,
  `farmer_contact` varchar(50) NOT NULL,
  `place_id` int(11) NOT NULL,
  `farmer_photo` varchar(100) NOT NULL,
  `farmer_proof` varchar(100) NOT NULL,
  `farmer_password` varchar(100) NOT NULL,
  `farmer_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_farmer`
--

INSERT INTO `tbl_farmer` (`farmer_id`, `farmer_name`, `farmer_email`, `farmer_address`, `farmer_contact`, `place_id`, `farmer_photo`, `farmer_proof`, `farmer_password`, `farmer_status`) VALUES
(9, 'ANOOP K MOHAN', 'anoopkm@gmail.com', ' anoop house nellikuzhi po kothamangalam', '9876543210', 9, 'Screenshot_20230922_124607_WhatsApp[1].jpg', 'Screenshot_20230922_124607_WhatsApp[1].jpg', '123456', 2),
(10, 'Midilaj vk', 'midlajmuhammed75@gmail.com', 'Vattaparambil house kunnamkulam po thrissur', '907251506', 77, '20230322_195419[1].jpg', '20230322_195419[1].jpg', 'midu7', 1),
(11, 'Albert Benny', 'bennyalbert1521@gmail.com', 'Mandapathil House kurupumthara po kottayam', '8891150143', 68, 'IMG-20230413-WA0102[1].jpg', 'IMG-20230413-WA0102[1].jpg', 'dady', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_farmercart`
--

CREATE TABLE `tbl_farmercart` (
  `fcart_id` int(11) NOT NULL,
  `fcart_quantity` int(11) NOT NULL DEFAULT 1,
  `fcart_status` int(11) NOT NULL,
  `fpbooking_id` int(11) NOT NULL,
  `fproduct_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_farmercart`
--

INSERT INTO `tbl_farmercart` (`fcart_id`, `fcart_quantity`, `fcart_status`, `fpbooking_id`, `fproduct_id`) VALUES
(2, 11, 4, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_farmerproduct`
--

CREATE TABLE `tbl_farmerproduct` (
  `fproduct_id` int(11) NOT NULL,
  `fproduct_name` varchar(100) NOT NULL,
  `fproduct_details` varchar(100) NOT NULL,
  `fproduct_rate` int(11) NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `producttype_id` int(11) NOT NULL,
  `fproduct_photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_farmerproduct`
--

INSERT INTO `tbl_farmerproduct` (`fproduct_id`, `fproduct_name`, `fproduct_details`, `fproduct_rate`, `farmer_id`, `producttype_id`, `fproduct_photo`) VALUES
(2, 'txcyghj', 'rtyuihjk', 65664578, 10, 3, 'Screenshot_20230213_105501.png'),
(3, 'bjhu', '  b,ml', 45, 9, 3, 'Screenshot (2).png');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_farmerproductbooking`
--

CREATE TABLE `tbl_farmerproductbooking` (
  `fpbooking_id` int(11) NOT NULL,
  `fpbooking_date` date NOT NULL,
  `fpbooking_amount` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fpbooking_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_farmerproductbooking`
--

INSERT INTO `tbl_farmerproductbooking` (`fpbooking_id`, `fpbooking_date`, `fpbooking_amount`, `user_id`, `fpbooking_status`, `payment_status`) VALUES
(1, '2023-10-03', 722310358, 7, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_farmerstock`
--

CREATE TABLE `tbl_farmerstock` (
  `fstock_id` int(11) NOT NULL,
  `fstock_count` int(11) NOT NULL,
  `fproduct_id` int(11) NOT NULL,
  `fstock_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_farmerstock`
--

INSERT INTO `tbl_farmerstock` (`fstock_id`, `fstock_count`, `fproduct_id`, `fstock_date`) VALUES
(2, 45, 1, '0'),
(4, 100, 2, '2023-10-03');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `feedback_id` int(11) NOT NULL,
  `feedback_content` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`feedback_id`, `feedback_content`, `user_id`, `feedback_date`) VALUES
(1, 'goog', 7, '2023-09-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` int(11) NOT NULL,
  `place_name` varchar(100) NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `place_name`, `district_id`) VALUES
(2, 'Muvattupuzha', 2),
(3, 'Thodupuzha', 3),
(4, 'Paravur', 2),
(5, 'Aluva', 2),
(6, 'Kochi', 2),
(7, 'Kanayanoor', 2),
(8, 'Kunnathunadu', 2),
(9, 'Kothamangalam', 2),
(10, 'Devikulam', 3),
(13, 'Peerumade', 3),
(14, 'Idukki', 3),
(15, 'Hosdurg', 6),
(16, 'Manjeswaram', 6),
(17, 'Vellarikkundu', 6),
(18, 'Kasargod', 6),
(19, 'Kannur', 7),
(20, 'Payyanur', 7),
(21, 'Thaliparamba', 7),
(22, 'Irrity', 7),
(23, 'Thalassery', 7),
(24, 'Mananthavady', 8),
(26, 'Sulthanbathery', 8),
(27, 'Vythiri', 8),
(28, 'Kozhikkode', 9),
(29, 'Vadakara', 9),
(31, 'Koyilandy', 9),
(32, 'Thamarassery', 9),
(33, 'Adoor', 10),
(34, 'Konni', 10),
(35, 'Kozhenchery', 10),
(36, 'Mallapally', 10),
(37, 'Thirivananthapuram', 11),
(39, 'Chirayinkeezhu', 11),
(40, 'Neyyattinkara', 11),
(41, 'Nedumangadu', 11),
(42, 'Varkala', 11),
(43, 'Kattakada', 11),
(44, 'Cherthala', 12),
(45, 'Ambalapuzha', 12),
(47, 'Kuttanadu', 12),
(48, 'Karthikappally', 12),
(49, 'Chengannur', 12),
(50, 'Mavelikkara', 12),
(51, 'Eranadu', 14),
(52, 'Kondotty', 14),
(54, 'Nilambur', 14),
(55, 'Perinthalmanna', 14),
(56, 'Ponani', 14),
(57, 'Tirur', 14),
(58, 'Tirurangadi', 14),
(59, 'Pathanapuram', 15),
(60, 'Punalur', 15),
(61, 'Kunnathur', 15),
(62, 'Kottarakkara', 15),
(63, 'Karunagappally', 15),
(64, 'kollam', 15),
(65, 'Changanassery', 16),
(67, 'Kanjirappally', 16),
(68, 'kottayam', 16),
(69, 'Meenachil', 16),
(70, 'Alathur', 17),
(71, 'Chittur', 17),
(72, 'Mannarkad', 17),
(73, 'Ottappalam', 17),
(74, 'Chalakudy', 18),
(75, 'Chavakkad', 18),
(76, 'Kodungallur', 18),
(77, 'Kunnamkulam', 18);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_producttype`
--

CREATE TABLE `tbl_producttype` (
  `producttype_id` int(11) NOT NULL,
  `producttype_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_producttype`
--

INSERT INTO `tbl_producttype` (`producttype_id`, `producttype_name`) VALUES
(3, 'Tractor Trailer'),
(4, 'seeds'),
(5, 'vegitables');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_seller`
--

CREATE TABLE `tbl_seller` (
  `seller_id` int(11) NOT NULL,
  `seller_name` varchar(100) NOT NULL,
  `seller_address` varchar(100) NOT NULL,
  `seller_contact` varchar(50) NOT NULL,
  `seller_email` varchar(100) NOT NULL,
  `place_id` int(11) NOT NULL,
  `seller_photo` varchar(100) NOT NULL,
  `seller_proof` varchar(100) NOT NULL,
  `seller_password` varchar(100) NOT NULL,
  `seller_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_seller`
--

INSERT INTO `tbl_seller` (`seller_id`, `seller_name`, `seller_address`, `seller_contact`, `seller_email`, `place_id`, `seller_photo`, `seller_proof`, `seller_password`, `seller_status`) VALUES
(5, 'Sidharth N', 'Madathil House Tanur', '9656166079', 'sidharth1233246@gmail.com', 57, 'IMG-20230413-WA0110[1].jpg', 'IMG-20230413-WA0110[1].jpg', 'sidharth', 2),
(6, 'Aswin krishna babu', 'Babs House paravur po paravur', '8589078210', 'aswinbabu15@gmail.com', 4, 'IMG-20230413-WA0096[1].jpg', 'IMG-20230413-WA0096[1].jpg', 'aswin', 2),
(7, 'Mohamad Nishan', 'Madeena palace house Vedimara po Paravur', '9074131167', 'nishanichu10@gmail.com', 4, 'IMG-20230413-WA0106[1].jpg', 'IMG-20230413-WA0106[1].jpg', 'nichu', 1),
(8, 'naseef nuaim c', 'abc villa perinthalmanna po malapuram', '85472215157', 'naseef@gmail.com', 55, 'GOPR6830.JPG', 'GOPR6830.JPG', 'sithara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sellercart`
--

CREATE TABLE `tbl_sellercart` (
  `scart_id` int(11) NOT NULL,
  `scart_quantity` int(11) NOT NULL DEFAULT 1,
  `scart_status` int(11) NOT NULL,
  `spbooking_id` int(11) NOT NULL,
  `sproduct_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sellercart`
--

INSERT INTO `tbl_sellercart` (`scart_id`, `scart_quantity`, `scart_status`, `spbooking_id`, `sproduct_id`) VALUES
(3, 2, 4, 1, 8),
(4, 1, 0, 2, 2),
(5, 1, 1, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sellerproduct`
--

CREATE TABLE `tbl_sellerproduct` (
  `sproduct_id` int(11) NOT NULL,
  `sproduct_name` varchar(100) NOT NULL,
  `sproduct_details` varchar(100) NOT NULL,
  `sproduct_rate` int(11) NOT NULL,
  `sproduct_photo` varchar(100) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sellerproduct`
--

INSERT INTO `tbl_sellerproduct` (`sproduct_id`, `sproduct_name`, `sproduct_details`, `sproduct_rate`, `sproduct_photo`, `seller_id`, `subcategory_id`) VALUES
(12, 'Urea', 'Urea is the most important nitrogen Fertilizer', 499, 'urea-n46[1].jpg', 5, 42),
(13, 'Rotery Tiller ', 'Agriculture Equipment used for seedbed prepration', 105000, 'termivator-rotary-tiller[1].png', 6, 26),
(14, 'Combaine Harvester ', 'Combaine Harvester used for harvest varitey of grain crops', 1900000, 'Combine_Harvester_W70_medium_fb11e10d7f0a7ee5a0f04599c2d0e55fdf86ec30[1].avif', 6, 25);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sellerproductbooking`
--

CREATE TABLE `tbl_sellerproductbooking` (
  `spbooking_id` int(11) NOT NULL,
  `spbooking_date` date NOT NULL,
  `spbooking_amount` int(11) NOT NULL,
  `farmer_id` int(11) NOT NULL,
  `spbooking_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sellerproductbooking`
--

INSERT INTO `tbl_sellerproductbooking` (`spbooking_id`, `spbooking_date`, `spbooking_amount`, `farmer_id`, `spbooking_status`) VALUES
(1, '2023-10-03', 82, 10, 2),
(2, '2023-10-03', 0, 10, 0),
(3, '2023-10-03', 41, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sellerstock`
--

CREATE TABLE `tbl_sellerstock` (
  `sstock_id` int(11) NOT NULL,
  `sstock_count` int(11) NOT NULL,
  `sproduct_id` int(11) NOT NULL,
  `sstock_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sellerstock`
--

INSERT INTO `tbl_sellerstock` (`sstock_id`, `sstock_count`, `sproduct_id`, `sstock_date`) VALUES
(2, 100, 8, '2023-10-03'),
(3, 10, 0, '2023-10-05');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory`
--

CREATE TABLE `tbl_subcategory` (
  `subcategory_id` int(11) NOT NULL,
  `subcategory_name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_subcategory`
--

INSERT INTO `tbl_subcategory` (`subcategory_id`, `subcategory_name`, `category_id`) VALUES
(20, 'Nuclear Seed', 13),
(22, 'Breeder Seed', 13),
(23, 'Foundation Seed', 13),
(24, 'Certified Seed', 13),
(25, 'Combine Harvester', 12),
(26, 'Rottery Tiller', 12),
(27, 'Plough', 12),
(28, 'Tractor Trailer', 12),
(29, 'Power Harrow', 12),
(30, 'Leveler', 12),
(31, 'Water Bowser', 12),
(32, 'Ripper Machine', 12),
(33, 'Disk Harrow', 12),
(34, 'Annuals', 9),
(35, 'Perennials', 9),
(36, 'Herbs', 9),
(37, 'Vegitables', 9),
(38, 'Fruit Trees', 9),
(39, 'Fruit Trees', 9),
(40, 'Shrubs', 9),
(41, 'Organic Fertilizers', 10),
(42, 'Urea', 10),
(43, 'Pottasium', 10),
(44, 'Manure', 10),
(45, 'Ammoniacal Fertilizers', 10);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `user_contact` varchar(60) NOT NULL,
  `place_id` int(11) NOT NULL,
  `user_photo` varchar(100) NOT NULL,
  `user_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_name`, `user_email`, `user_address`, `user_contact`, `place_id`, `user_photo`, `user_password`) VALUES
(7, 'Toby Jose', 'tobyjn@gmail.com', 'Muvattupuzha', '9446418633', 2, 'IMG-20230413-WA0111[1].jpg', '123456'),
(8, '', '', '', '', 0, '', ''),
(9, '', '', '', '', 0, '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_category`
--
ALTER TABLE `tbl_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  ADD PRIMARY KEY (`complaint_id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`district_id`);

--
-- Indexes for table `tbl_farmer`
--
ALTER TABLE `tbl_farmer`
  ADD PRIMARY KEY (`farmer_id`);

--
-- Indexes for table `tbl_farmercart`
--
ALTER TABLE `tbl_farmercart`
  ADD PRIMARY KEY (`fcart_id`);

--
-- Indexes for table `tbl_farmerproduct`
--
ALTER TABLE `tbl_farmerproduct`
  ADD PRIMARY KEY (`fproduct_id`);

--
-- Indexes for table `tbl_farmerproductbooking`
--
ALTER TABLE `tbl_farmerproductbooking`
  ADD PRIMARY KEY (`fpbooking_id`);

--
-- Indexes for table `tbl_farmerstock`
--
ALTER TABLE `tbl_farmerstock`
  ADD PRIMARY KEY (`fstock_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_producttype`
--
ALTER TABLE `tbl_producttype`
  ADD PRIMARY KEY (`producttype_id`);

--
-- Indexes for table `tbl_seller`
--
ALTER TABLE `tbl_seller`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `tbl_sellercart`
--
ALTER TABLE `tbl_sellercart`
  ADD PRIMARY KEY (`scart_id`);

--
-- Indexes for table `tbl_sellerproduct`
--
ALTER TABLE `tbl_sellerproduct`
  ADD PRIMARY KEY (`sproduct_id`);

--
-- Indexes for table `tbl_sellerproductbooking`
--
ALTER TABLE `tbl_sellerproductbooking`
  ADD PRIMARY KEY (`spbooking_id`);

--
-- Indexes for table `tbl_sellerstock`
--
ALTER TABLE `tbl_sellerstock`
  ADD PRIMARY KEY (`sstock_id`);

--
-- Indexes for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  ADD PRIMARY KEY (`subcategory_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_category`
--
ALTER TABLE `tbl_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_complaint`
--
ALTER TABLE `tbl_complaint`
  MODIFY `complaint_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tbl_farmer`
--
ALTER TABLE `tbl_farmer`
  MODIFY `farmer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbl_farmercart`
--
ALTER TABLE `tbl_farmercart`
  MODIFY `fcart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_farmerproduct`
--
ALTER TABLE `tbl_farmerproduct`
  MODIFY `fproduct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_farmerproductbooking`
--
ALTER TABLE `tbl_farmerproductbooking`
  MODIFY `fpbooking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_farmerstock`
--
ALTER TABLE `tbl_farmerstock`
  MODIFY `fstock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `tbl_producttype`
--
ALTER TABLE `tbl_producttype`
  MODIFY `producttype_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_seller`
--
ALTER TABLE `tbl_seller`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_sellercart`
--
ALTER TABLE `tbl_sellercart`
  MODIFY `scart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_sellerproduct`
--
ALTER TABLE `tbl_sellerproduct`
  MODIFY `sproduct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tbl_sellerproductbooking`
--
ALTER TABLE `tbl_sellerproductbooking`
  MODIFY `spbooking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_sellerstock`
--
ALTER TABLE `tbl_sellerstock`
  MODIFY `sstock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_subcategory`
--
ALTER TABLE `tbl_subcategory`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
