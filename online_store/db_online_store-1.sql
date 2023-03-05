-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2022 at 06:38 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_online_store`
--
CREATE DATABASE IF NOT EXISTS `db_online_store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_online_store`;

-- --------------------------------------------------------

--
-- Table structure for table `chi_muc_gio_hang`
--

CREATE TABLE `chi_muc_gio_hang` (
  `id` bigint(20) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `id_gio_hang` bigint(20) DEFAULT NULL,
  `id_san_pham` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chi_muc_gio_hang`
--

INSERT INTO `chi_muc_gio_hang` (`id`, `so_luong`, `id_gio_hang`, `id_san_pham`) VALUES
(2, 1, 2, 14),
(15, 1, 1, 20);

-- --------------------------------------------------------

--
-- Table structure for table `chi_tiet_don_hang`
--

CREATE TABLE `chi_tiet_don_hang` (
  `id` bigint(20) NOT NULL,
  `don_gia` bigint(20) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `id_don_hang` bigint(20) DEFAULT NULL,
  `id_san_pham` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `chi_tiet_don_hang`
--

INSERT INTO `chi_tiet_don_hang` (`id`, `don_gia`, `so_luong`, `id_don_hang`, `id_san_pham`) VALUES
(1, 25000000, 1, 1, 20),
(2, 2600000, 1, 2, 12),
(3, 3200000, 1, 2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id` bigint(20) NOT NULL,
  `ten` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `danh_muc`
--

INSERT INTO `danh_muc` (`id`, `ten`) VALUES
(1, 'Giày da'),
(3, 'Giày thể thao'),
(4, 'Giày tennis');

-- --------------------------------------------------------

--
-- Table structure for table `don_hang`
--

CREATE TABLE `don_hang` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `total_price` bigint(20) NOT NULL,
  `id_nguoi_dung` bigint(20) DEFAULT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `ho_ten` varchar(255) DEFAULT NULL,
  `ngay_dat` datetime DEFAULT NULL,
  `ngay_giao` datetime DEFAULT NULL,
  `ngay_nhan` datetime DEFAULT NULL,
  `so_dien_thoai` varchar(255) DEFAULT NULL,
  `tong_gia` bigint(20) NOT NULL,
  `trang_thai` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `don_hang`
--

INSERT INTO `don_hang` (`id`, `address`, `delivery_date`, `full_name`, `order_date`, `order_status`, `phone_number`, `received_date`, `total_price`, `id_nguoi_dung`, `dia_chi`, `ho_ten`, `ngay_dat`, `ngay_giao`, `ngay_nhan`, `so_dien_thoai`, `tong_gia`, `trang_thai`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, '2022-05-08 14:06:47', NULL, '2022-05-08 15:41:18', NULL, 25000000, 'hoanthanh'),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 2, NULL, NULL, '2022-05-08 14:12:08', NULL, '2022-05-08 15:46:56', NULL, 5800000, 'hoanthanh');

-- --------------------------------------------------------

--
-- Table structure for table `gio_hang`
--

CREATE TABLE `gio_hang` (
  `id` bigint(20) NOT NULL,
  `tong_gia` bigint(20) NOT NULL,
  `id_nguoi_dung` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gio_hang`
--

INSERT INTO `gio_hang` (`id`, `tong_gia`, `id_nguoi_dung`) VALUES
(1, 0, 2),
(2, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lien_he`
--

CREATE TABLE `lien_he` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ho_ten` varchar(255) DEFAULT NULL,
  `loi_nhan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nguoi_dung`
--

CREATE TABLE `nguoi_dung` (
  `id` bigint(20) NOT NULL,
  `dia_chi` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ho_ten` varchar(255) DEFAULT NULL,
  `mat_khau` varchar(255) DEFAULT NULL,
  `ten_dang_nhap` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nguoi_dung`
--

INSERT INTO `nguoi_dung` (`id`, `dia_chi`, `email`, `ho_ten`, `mat_khau`, `ten_dang_nhap`) VALUES
(1, 'Nam Định', 'loitran299@gmail.com', 'Trần Văn Lợi', '$2a$10$N7iNNoxbX1JE7Xiv9W11uO34UFws.Cl.5YTuTBMcxYSCMoBfLIRFi', 'admin'),
(2, 'ND', 'user@gmail.com', 'Trần Văn Thắng', '$2a$10$SgrBeB85sGtEQ4GTXoGypOCG25gym6ania2DKnkCjBoulnvHCn60S', 'user1'),
(3, 'Nam Định', 'loitran2909@gmail.com', '', '$2a$10$C6/q9JKVTwkW2ekPJRskD.WGHAjhMihSbvAvLIDtRow5Etb0Q1YXi', 'user2');

-- --------------------------------------------------------

--
-- Table structure for table `nhan_hieu`
--

CREATE TABLE `nhan_hieu` (
  `id` bigint(20) NOT NULL,
  `ten` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nhan_hieu`
--

INSERT INTO `nhan_hieu` (`id`, `ten`) VALUES
(3, 'Adidas'),
(2, 'Balenciaga'),
(1, 'Bitis'),
(5, 'Gucci'),
(4, 'Nike');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(2, 2),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `san_pham`
--

CREATE TABLE `san_pham` (
  `id` bigint(20) NOT NULL,
  `gia` bigint(20) NOT NULL,
  `gioi_tinh` varchar(255) DEFAULT NULL,
  `mau_sac` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  `id_danh_muc` bigint(20) DEFAULT NULL,
  `id_nhan_hieu` bigint(20) DEFAULT NULL,
  `so_luong` int(11) NOT NULL,
  `path_anh` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `san_pham`
--

INSERT INTO `san_pham` (`id`, `gia`, `gioi_tinh`, `mau_sac`, `mo_ta`, `ten`, `id_danh_muc`, `id_nhan_hieu`, `so_luong`, `path_anh`) VALUES
(12, 2600000, 'Nam', 'Trắng', 'Giày Thể Thao Nike Fw Air Max 2090 CV8835-100 Phối Màu là đôi giày đến từ thương hiệu Nike nổi tiếng của Mỹ. Nike Fw Air Max 2090 CV8835-100 là phiên bản dành riêng cho phái mạnh với phối màu mang thiết kế đẹp mắt, kiểu dáng hiện đại, với đôi giày thời tr', 'Nike Fw Air Max 2090', 3, 4, 20, '/img/12airmax.jpg'),
(13, 5800000, 'Nam/Nữ', 'Đen', 'Giày Thể Thao Nike Wmns Air Jordan 1 Low Gym Red Black DC0774-016 Màu Đen Đỏ là phiên bản mới nhất của Nike với thiết kế hiện đại vô cùng thời trang. Ngay từ khi có mặt trên thị trường Nike Wmns Air Jordan 1 Low Gym Red Black DC0774-016 được nhiều tín đồ ', 'Wmns Air Jordan 1 Low Gym Red Black', 3, 4, 20, '/img/13nike.jpg'),
(14, 3200000, 'Nam', 'Trắng', 'Giày Thể Thao Nike Lebron Lebron Soldier 14 \'USA\' CK6024-100 có thiết kế trẻ trung, năng động đến từ thương hiệu Nike nổi tiếng của Mỹ. Giày Thể Thao Nike Lebron Lebron Soldier 14 \'USA\' CK6024-100 được làm từ chất liệu cao cấp, bền đẹp nâng niu đôi chân t', 'Lebron Lebron Soldier 14', 3, 4, 20, '/img/14nike1.jpg'),
(15, 4200000, 'Nam', 'Đen', 'Giày Thể Thao Nike W Air Max 270 React CV8818-500 Phối Màu được thiết kế với phong cách trẻ trung, năng động đặc trưng của thương hiệu Nike nổi tiếng của Mỹ. Nike W Air Max 270 React CV8818-500 hoàn hảo về chất lượng và vô cùng đẹp mắt chắc hẳn bạn sẽ khó', 'W Air Max 270 React', 3, 4, 20, '/img/15nike2.jpg'),
(16, 2200000, 'Nam', 'Đen', 'Giày Thể Thao Adidas NMD R1 FV8732 Màu Đen là đôi giày thời trang với thiết kế mang nét thể thao năng động. Giày Thể Thao Adidas NMD R1 FV8732 mang trên mình gam màu thanh lịch cho bạn thêm trẻ trung.', 'NMD R1 FV8732', 3, 3, 20, '/img/16adidas.jpg'),
(17, 3800000, 'Nam', 'Phối màu', 'Giày Tennis Adidas Adizero Ubersonic 4 GZ8464 Màu Xanh Blue Phối Trắng được thiết kế hiện đại đến từ thương hiệu Adidas nổi tiếng. Với gam màu thanh lịch cho bạn trở nên sành điệu và thật phong cách khi đi lên chân.', 'Adizero Ubersonic 4 GZ8464', 4, 3, 20, '/img/17adidas1.jpg'),
(18, 3400000, 'Unisex', 'Phối màu', 'Giày Tennis Adidas Solematch Bounce GY7644 Màu Xám Xanh thiết kế đẹp mắt, kiểu dáng hiện đại đến từ thương hiệu Adidas của Đức. Với đôi giày tennis thời trang này bạn sẽ thoải mái di chuyển, vận động đa hướng khi chơi thể thao.', 'Solematch Bounce GY7644', 4, 3, 20, '/img/18adidas2.jpg'),
(19, 13600000, 'Nam', 'Đen', 'Giày Balenciaga Speed Sneaker Màu Đen có thiết kế trẻ trung năng động, với đôi giày thời trang này chắc hẳn bạn sẽ trở nên tự tin và nổi bật hơn.\r\n\r\nGiày được cấu tạo chắc chắn, dành cho bàn chân nam giới. Mặt trên ôm khít như đi tất với độ bền cao và thô', 'Speed Sneaker', 3, 2, 20, '/img/19balenciaga.jpg'),
(20, 25000000, 'Nam', 'Phối màu', 'Giày Thể Thao Nam Gucci Screener Pineapple-Print GG-Logo Trainers SS2022 Màu Nâu Xanh thiết kế hiện đại với phong cách trẻ trung, năng động. Với tông màu nổi bật làm điểm nhấn. giày được làm từ chất liệu vải cao cấp bền đẹp, thời gian sử dụng lâu dài.', 'Screener Pineapple-Print GG-Logo Trainers SS2022', 3, 5, 20, '/img/20gucci.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `address`, `email`, `full_name`, `password`, `username`) VALUES
(1, NULL, 'loitran299@gmail.com', NULL, '$2a$10$pjj8hr9AaFj1OiViZlLfw.yuWQeoVC8vWHXvKEIFHLft7r0hIdcoi', 'admin'),
(2, NULL, 'user@gmail.com', NULL, '$2a$10$y8kLplfQe5TdF9ZzVKs9qO2qBD8I5OG5sk/FrSDNBKaeRDOOykm/q', 'user1'),
(5, '', '', NULL, '$2a$10$kOgz3zikLINdaLCwx8h8NuSBkAQHxQFB6.mZjZBcOVM0ZNBTi/BoO', 'user2');

-- --------------------------------------------------------

--
-- Table structure for table `vai_tro`
--

CREATE TABLE `vai_tro` (
  `id` bigint(20) NOT NULL,
  `ten_vai_tro` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vai_tro`
--

INSERT INTO `vai_tro` (`id`, `ten_vai_tro`) VALUES
(1, 'ROLE_ADMIN'),
(2, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `vai_tro_nguoi_dung`
--

CREATE TABLE `vai_tro_nguoi_dung` (
  `id_nguoi_dung` bigint(20) NOT NULL,
  `id_vai_tro` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vai_tro_nguoi_dung`
--

INSERT INTO `vai_tro_nguoi_dung` (`id_nguoi_dung`, `id_vai_tro`) VALUES
(1, 1),
(2, 2),
(3, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chi_muc_gio_hang`
--
ALTER TABLE `chi_muc_gio_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKpvvjv3lef9t19k6yihq5iutdd` (`id_gio_hang`),
  ADD KEY `FK5weampam2mr6ojw8n1oloek7y` (`id_san_pham`);

--
-- Indexes for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK982ljo9jq79lss9cepu8hhcqd` (`id_don_hang`),
  ADD KEY `FK13u3cfd9wve8h3abw3ip6kqwe` (`id_san_pham`);

--
-- Indexes for table `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKc5tkognwtgw8fw3dnpylmoad0` (`id_nguoi_dung`);

--
-- Indexes for table `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2u78fj8dii7flm08i96u70nbo` (`id_nguoi_dung`);

--
-- Indexes for table `lien_he`
--
ALTER TABLE `lien_he`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_o0s268lrp9is6o1e4ek6m1lc6` (`ten_dang_nhap`);

--
-- Indexes for table `nhan_hieu`
--
ALTER TABLE `nhan_hieu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_3r37m3a53iukjddqvvpti9swk` (`ten`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FKgvm3rv48rh70spyinao292s84` (`role_id`);

--
-- Indexes for table `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKk8b4wwituxbxbcudtvqie796j` (`id_danh_muc`),
  ADD KEY `FK4mlqtuj0g3iqh4t92jdiknmw1` (`id_nhan_hieu`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`);

--
-- Indexes for table `vai_tro`
--
ALTER TABLE `vai_tro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vai_tro_nguoi_dung`
--
ALTER TABLE `vai_tro_nguoi_dung`
  ADD PRIMARY KEY (`id_nguoi_dung`,`id_vai_tro`),
  ADD KEY `FKssegbsn76pdkixpf0cc4vmtj1` (`id_vai_tro`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chi_muc_gio_hang`
--
ALTER TABLE `chi_muc_gio_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `don_hang`
--
ALTER TABLE `don_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gio_hang`
--
ALTER TABLE `gio_hang`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `lien_he`
--
ALTER TABLE `lien_he`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `nguoi_dung`
--
ALTER TABLE `nguoi_dung`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `nhan_hieu`
--
ALTER TABLE `nhan_hieu`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vai_tro`
--
ALTER TABLE `vai_tro`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chi_muc_gio_hang`
--
ALTER TABLE `chi_muc_gio_hang`
  ADD CONSTRAINT `FK5weampam2mr6ojw8n1oloek7y` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`),
  ADD CONSTRAINT `FKpvvjv3lef9t19k6yihq5iutdd` FOREIGN KEY (`id_gio_hang`) REFERENCES `gio_hang` (`id`);

--
-- Constraints for table `chi_tiet_don_hang`
--
ALTER TABLE `chi_tiet_don_hang`
  ADD CONSTRAINT `FK13u3cfd9wve8h3abw3ip6kqwe` FOREIGN KEY (`id_san_pham`) REFERENCES `san_pham` (`id`),
  ADD CONSTRAINT `FK982ljo9jq79lss9cepu8hhcqd` FOREIGN KEY (`id_don_hang`) REFERENCES `don_hang` (`id`);

--
-- Constraints for table `don_hang`
--
ALTER TABLE `don_hang`
  ADD CONSTRAINT `FKc5tkognwtgw8fw3dnpylmoad0` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`),
  ADD CONSTRAINT `FKsh70s19t63rqhikx7u4sueay9` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `user` (`id`);

--
-- Constraints for table `gio_hang`
--
ALTER TABLE `gio_hang`
  ADD CONSTRAINT `FK2u78fj8dii7flm08i96u70nbo` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`),
  ADD CONSTRAINT `FK5lt6k83m525dusstja1p5ud9j` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `user` (`id`);

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `FK4320p8bgvumlxjkohtbj214qi` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKgvm3rv48rh70spyinao292s84` FOREIGN KEY (`role_id`) REFERENCES `vai_tro` (`id`),
  ADD CONSTRAINT `FKiqpmjd2qb4rdkej916ymonic6` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `FK4mlqtuj0g3iqh4t92jdiknmw1` FOREIGN KEY (`id_nhan_hieu`) REFERENCES `nhan_hieu` (`id`),
  ADD CONSTRAINT `FKk8b4wwituxbxbcudtvqie796j` FOREIGN KEY (`id_danh_muc`) REFERENCES `danh_muc` (`id`);

--
-- Constraints for table `vai_tro_nguoi_dung`
--
ALTER TABLE `vai_tro_nguoi_dung`
  ADD CONSTRAINT `FK7kl3ypa2c6i3w9vfsorjg6ivf` FOREIGN KEY (`id_nguoi_dung`) REFERENCES `nguoi_dung` (`id`),
  ADD CONSTRAINT `FKssegbsn76pdkixpf0cc4vmtj1` FOREIGN KEY (`id_vai_tro`) REFERENCES `vai_tro` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
