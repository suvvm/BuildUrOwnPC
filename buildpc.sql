/*
 Navicat Premium Data Transfer

 Source Server         : localhost_root
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : buildpc

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 17/06/2019 15:01:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cpu_inf
-- ----------------------------
DROP TABLE IF EXISTS `cpu_inf`;
CREATE TABLE `cpu_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpuName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cpuSlot` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `core_number` int(11) NULL DEFAULT NULL,
  `cpu_frequency` double NULL DEFAULT NULL,
  `bits64` tinyint(1) NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `imgPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20000020 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cpu_inf
-- ----------------------------
INSERT INTO `cpu_inf` VALUES (20000001, 'Intel 酷睿i5 9400F', 'LGA', 6, 2.9, 1, 1299, 500, '../images/cpu/1.jpg');
INSERT INTO `cpu_inf` VALUES (20000002, 'AMD Ryzen 7 2700X', 'Socket AM4', 8, 3.7, 1, 2399, 600, '../images/cpu/2.jpg');
INSERT INTO `cpu_inf` VALUES (20000003, 'Intel 酷睿i7 8700', 'LGA', 6, 3.2, 1, 2499, 600, '../images/cpu/3.jpg');
INSERT INTO `cpu_inf` VALUES (20000004, 'Intel 酷睿i7 8700K', 'LGA', 6, 3.7, 1, 2799, 500, '../images/cpu/4.jpg');
INSERT INTO `cpu_inf` VALUES (20000005, 'Intel 酷睿i5 8400', 'LGA', 6, 2.8, 1, 1599, 500, '../images/cpu/5.jpg');
INSERT INTO `cpu_inf` VALUES (20000006, 'AMD Athlon 200GE', 'Socket AM4', 2, 3.2, 1, 349, 700, '../images/cpu/6.jpg');
INSERT INTO `cpu_inf` VALUES (20000007, 'AMD Ryzen Threadripper 2990WX', 'LGA', 32, 3, 1, 13000, 100, '../images/cpu/7.jpg');
INSERT INTO `cpu_inf` VALUES (20000008, 'Intel 酷睿i9 9900K', 'LGA', 8, 3.6, 1, 4199, 300, '../images/cpu/8.jpg');
INSERT INTO `cpu_inf` VALUES (20000009, 'Intel 奔腾 G4560', 'LGA', 2, 3.5, 1, 599, 700, '../images/cpu/9.jpg');
INSERT INTO `cpu_inf` VALUES (20000010, 'AMD Ryzen 5 2600X', 'Socket AM4', 6, 3.6, 1, 1499, 400, '../images/cpu/10.jpg');
INSERT INTO `cpu_inf` VALUES (20000011, 'AMD Ryzen 7 1700', 'Socket AM4', 8, 3, 1, 1349, 700, '../images/cpu/11.jpg');
INSERT INTO `cpu_inf` VALUES (20000012, 'AMD FX-8300', 'Socket AM4', 8, 3.3, 1, 439, 700, '../images/cpu/12.jpg');
INSERT INTO `cpu_inf` VALUES (20000013, 'AMD Ryzen 3 2200G', 'Socket AM4', 4, 3.5, 1, 649, 600, '../images/cpu/13.jpg');
INSERT INTO `cpu_inf` VALUES (20000014, 'Intel 奔腾双核 G4400', 'LGA', 2, 3.3, 1, 549, 500, '../images/cpu/14.jpg');
INSERT INTO `cpu_inf` VALUES (20000015, 'AMD Ryzen 7 1700X', 'Socket AM4', 8, 3.4, 1, 1639, 400, '../images/cpu/15.jpg');
INSERT INTO `cpu_inf` VALUES (20000016, 'Intel 赛扬 G3930', 'LGA', 2, 2.9, 1, 459, 500, '../images/cpu/16.jpg');
INSERT INTO `cpu_inf` VALUES (20000017, 'Intel 酷睿i3 8350K', 'LGA', 4, 4, 1, 1199, 200, '../images/cpu/17.jpg');
INSERT INTO `cpu_inf` VALUES (20000018, 'AMD APU系列 A8-7650K', 'Socket AM4', 4, 3.3, 1, 569, 100, '../images/cpu/18.jpg');
INSERT INTO `cpu_inf` VALUES (20000019, 'Intel 奔腾 G4600', 'LGA', 2, 3.6, 1, 649, 500, '../images/cpu/19.jpg');

-- ----------------------------
-- Table structure for graphics_inf
-- ----------------------------
DROP TABLE IF EXISTS `graphics_inf`;
CREATE TABLE `graphics_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `directX` double NULL DEFAULT NULL,
  `OpenGL` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Interface` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `maxResolution` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `imgPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40000029 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of graphics_inf
-- ----------------------------
INSERT INTO `graphics_inf` VALUES (40000001, 'TITAN V', 'NVIDIA', 12, 'OpenGL 4.5', 'PCI Express 3.0 16X', '7680×4320', 25000, 999, '../images/Graphics/titan V.jpg');
INSERT INTO `graphics_inf` VALUES (40000002, 'TITAN Xp', 'NVIDIA', 12.1, 'OpenGL 4.5', 'PCI Express 3.0 16X', '7680×4320', 10000, 999, '../images/Graphics/titan XP.jpg');
INSERT INTO `graphics_inf` VALUES (40000003, 'GTX 1080Ti', 'NVIDIA', 12.1, 'OpenGL 4.5', 'PCI Express 3.0 16X', '7680×4320', 8500, 999, '../images/Graphics/gtx1080ti.jpg');
INSERT INTO `graphics_inf` VALUES (40000004, 'Radeon Pro Duo', 'AMD', 12, 'OpenGL 4.5', 'DP', '4096×2160', 14000, 999, '../images/Graphics/Radeon pro due.jpg');
INSERT INTO `graphics_inf` VALUES (40000005, 'GTX 1070', 'NVIDIA', 12, 'OpenGL 4.5', 'PCI Express 3.0 16X', '7680×4320', 3000, 999, '../images/Graphics/gtx1070.jpg');
INSERT INTO `graphics_inf` VALUES (40000006, 'GTX 1660', 'NVIDIA', 12, 'OpenGL 4.5', 'PCI Express 3.0 16X', '7680×4321', 2600, 999, '../images/Graphics/gtx1660.jpg');
INSERT INTO `graphics_inf` VALUES (40000007, 'GTX 1060', 'NVIDIA', 12, 'OpenGL 4.5', 'PCI Express 3.0 16X', '7680×4322', 2100, 999, '../images/Graphics/gtx1060.jpg');
INSERT INTO `graphics_inf` VALUES (40000008, 'GTX 1050', 'NVIDIA', 12, 'OpenGL 4.5', 'PCI Express 3.0 16X', '7680×4323', 1100, 999, '../images/Graphics/gtx1050.jpg');
INSERT INTO `graphics_inf` VALUES (40000009, 'Radeon R9 FURY X', 'AMD', 12, 'OpenGL 4.4', 'DVI', '7680×4324', 5300, 999, '../images/Graphics/radeon R9 fury.jpg');
INSERT INTO `graphics_inf` VALUES (40000010, 'GTX 980', 'NVIDIA', 11.2, 'null', 'PCI Express 3.0 16X', '7680×4325', 4000, 999, '../images/Graphics/gtx980.jpg');
INSERT INTO `graphics_inf` VALUES (40000011, 'HD 7990', 'AMD', 11.1, 'null', 'PCI Express 3.0 16X', '7680×4326', 800, 999, '../images/Graphics/hd7990.jpg');
INSERT INTO `graphics_inf` VALUES (40000012, 'HD 6870', 'AMD', 11, 'null', 'PCI Express 3.0 16X', '7680×4327', 1600, 999, '../images/Graphics/hd6870.jpg');
INSERT INTO `graphics_inf` VALUES (40000013, 'GTX 780', 'NVIDIA', 11.1, 'null', 'PCI Express 3.0 16X', '7680×4328', 2300, 999, '../images/Graphics/gtx780.jpg');
INSERT INTO `graphics_inf` VALUES (40000014, 'GTX 970', 'NVIDIA', 12, 'OpenGL 4.5', 'PCI Express 3.0 16X', '7680×4329', 500, 999, '../images/Graphics/gtx970.jpg');
INSERT INTO `graphics_inf` VALUES (40000015, 'RX 480', 'AMD', 11, 'null', 'PCI Express 3.0 16X', '7680×4330', 800, 999, '../images/Graphics/rx480.jpg');
INSERT INTO `graphics_inf` VALUES (40000016, 'GTX 480', 'NVIDIA', 12, 'null', 'PCI Express 3.0 16X', '7680×4331', 4000, 999, '../images/Graphics/gtx480.jpg');
INSERT INTO `graphics_inf` VALUES (40000017, 'GTX 670', 'NVIDIA', 11.1, 'null', 'PCI Express 3.0 16X', '7680×4332', 2700, 999, '../images/Graphics/gtx670.jpg');
INSERT INTO `graphics_inf` VALUES (40000018, 'GTX 570', 'NVIDIA', 11.1, 'null', 'PCI Express 3.0 16X', '7680×4333', 2100, 999, '../images/Graphics/gtx570.jpg');
INSERT INTO `graphics_inf` VALUES (40000019, 'RX 560', 'AMD', 12, 'Shader Model 5.0,OpenGL 4.5', 'PCI Express 3.0 16X', '7680×4334', 1000, 999, '../images/Graphics/rx560.jpg');
INSERT INTO `graphics_inf` VALUES (40000020, 'GTX 2080Ti', 'NVIDIA', 12, 'OpenGL 4.5', 'PCI Express 3.0 16X', '7680×4335', 10000, 999, '../images/Graphics/gtx2080ti.jpg');
INSERT INTO `graphics_inf` VALUES (40000021, 'GTX 2060', 'NVIDIA', 12, 'Shader Model 5.0,OpenGL 4.5', 'PCI Express 3.0 16X', '7680×4336', 2800, 999, '../images/Graphics/gtx2060.jpg');
INSERT INTO `graphics_inf` VALUES (40000022, 'R9 370X', 'AMD', 12, 'null', 'PCI Express 3.0 16X', '7680×4337', 1100, 999, '../images/Graphics/r9 250x.jpg');
INSERT INTO `graphics_inf` VALUES (40000023, 'TITAN Z', 'NVIDIA', 11.1, 'null', 'PCI Express 3.0 16X', '7680×4338', 22000, 999, '../images/Graphics/titan z.jpg');
INSERT INTO `graphics_inf` VALUES (40000024, '9800GTX+', 'NVIDIA', 10, 'null', 'PCI Express 3.0 16X', '7680×4339', 1000, 999, '../images/Graphics/6800gt.jpg');
INSERT INTO `graphics_inf` VALUES (40000025, 'HD 7450', 'AMD', 11, 'null', 'PCI Express 3.0 16X', '7680×4340', 300, 999, '../images/Graphics/hd7990.jpg');
INSERT INTO `graphics_inf` VALUES (40000026, '6800GT', 'NVIDIA', 9, 'null', 'DVI', '7680×4341', 1499, 999, '../images/Graphics/6800gt.jpg');
INSERT INTO `graphics_inf` VALUES (40000027, 'GTX 280', 'NVIDIA', 10, 'null', 'PCI Express 3.0 16X', '7680×4342', 1870, 999, '../images/Graphics/gtx280.jpg');
INSERT INTO `graphics_inf` VALUES (40000028, 'R9 250X', 'AMD', 12, 'OpenGL 4.3', 'PCI Express 3.0 16X', '7680×4343', 1200, 999, '../images/Graphics/r9 250x.jpg');

-- ----------------------------
-- Table structure for mainboard_inf
-- ----------------------------
DROP TABLE IF EXISTS `mainboard_inf`;
CREATE TABLE `mainboard_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chipset` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `integratedGraphics` tinyint(1) NULL DEFAULT NULL,
  `mDotTwoNum` int(11) NULL DEFAULT NULL,
  `sataNum` int(11) NULL DEFAULT NULL,
  `cpuSlot` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ramSlot` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ramSlotNum` int(11) NULL DEFAULT NULL,
  `hdmi` int(11) NULL DEFAULT NULL,
  `dvi` int(11) NULL DEFAULT NULL,
  `vga` int(11) NULL DEFAULT NULL,
  `pic` int(11) NULL DEFAULT NULL,
  `dp` int(11) NULL DEFAULT NULL,
  `usb2` int(11) NULL DEFAULT NULL,
  `usb3` int(11) NULL DEFAULT NULL,
  `networkcard` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `networkInterface` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `imgPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30000051 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mainboard_inf
-- ----------------------------
INSERT INTO `mainboard_inf` VALUES (30000001, 'B360M MORTAR', '微星', 'Intel', 'Intel B360', 0, 2, 4, 'LGA', 'DDR3', 4, 1, 1, 1, 4, 1, 6, 5, '板载Intel I219-V千兆网卡', 'RJ45', 769, 111, '../images/mainborad/1.jpg');
INSERT INTO `mainboard_inf` VALUES (30000002, 'iGame Z390 Vulcan X', '七彩虹', 'Intel', 'Intel Z390', 0, 2, 6, 'LGA', 'DDR4', 4, 0, 0, 0, 6, 0, 5, 7, '板载Intel I219V千兆网卡，Wireless Intel CNV', 'RJ45', 1599, 999, '../images/mainborad/2.jpg');
INSERT INTO `mainboard_inf` VALUES (30000003, 'TUF B360M-PLUS GAMING S', '华硕', 'Intel', 'Intel B360', 0, 2, 6, 'LGA', 'DDR4', 4, 1, 1, 0, 3, 0, 6, 5, '板载Intel I219V千兆网卡', 'RJ45', 879, 999, '../images/mainborad/3.jpg');
INSERT INTO `mainboard_inf` VALUES (30000004, 'B360M AORUS PRO', '技嘉', 'Intel', 'Intel B360', 0, 2, 6, 'LGA', 'DDR4', 4, 1, 1, 0, 2, 1, 6, 6, '板载Realtek千兆网卡', 'RJ45', 799, 999, '../images/mainborad/4.jpg');
INSERT INTO `mainboard_inf` VALUES (30000005, 'MS-挑战者 B360M', '铭瑄', 'Intel', 'Intel B360', 0, 2, 5, 'LGA', 'DDR3', 2, 1, 1, 1, 1, 0, 6, 8, '板载Realtek RTL8111F千兆网卡', 'RJ45', 379, 999, '../images/mainborad/5.jpg');
INSERT INTO `mainboard_inf` VALUES (30000006, 'B360M-M.2', '影驰', 'Intel', 'Intel B360', 0, 1, 6, 'LGA', 'DDR3', 2, 1, 1, 1, 2, 0, 6, 6, '板载Intel千兆网卡', 'RJ45', 399, 999, '../images/mainborad/6.jpg');
INSERT INTO `mainboard_inf` VALUES (30000007, 'B450M MORTAR', '微星', 'AMD', 'AMD B450', 0, 2, 4, 'Socket AM4', 'DDR4', 4, 1, 0, 0, 4, 1, 6, 8, '板载Realtek RTL8111H千兆网卡', 'RJ45', 799, 999, '../images/mainborad/7.jpg');
INSERT INTO `mainboard_inf` VALUES (30000008, 'CVN B365M GAMING PRO V20', '七彩虹', 'Intel', 'Intel B365', 0, 2, 6, 'LGA', 'DDR4', 4, 1, 1, 0, 2, 0, 2, 5, '板载Realtek RTL8111H千兆网卡', 'RJ45', 699, 999, '../images/mainborad/8.jpg');
INSERT INTO `mainboard_inf` VALUES (30000009, 'Z390 AORUS MASTER', '技嘉', 'Intel', 'Intel Z390', 0, 3, 6, 'LGA', 'DDR4', 4, 1, 0, 0, 6, 0, 8, 9, '板载Intel千兆网卡', 'RJ45', 2999, 999, '../images/mainborad/9.jpg');
INSERT INTO `mainboard_inf` VALUES (30000010, 'PRIME B250M-PLUS', '华硕', 'Intel', 'Intel B250', 0, 2, 6, 'LGA', 'DDR4', 4, 1, 1, 1, 3, 0, 6, 6, '板载Intel I219V千兆网卡', 'RJ45', 659, 999, '../images/mainborad/10.jpg');
INSERT INTO `mainboard_inf` VALUES (30000011, 'PRIME Z390-A', '华硕', 'Intel', 'Intel Z390', 0, 2, 6, 'LGA', 'DDR4', 4, 1, 0, 0, 6, 1, 6, 8, '板载Intel I219V千兆网卡', 'RJ45', 1999, 999, '../images/mainborad/11.jpg');
INSERT INTO `mainboard_inf` VALUES (30000012, 'PRIME Z370-P', '华硕', 'Intel', 'Intel Z370', 0, 2, 4, 'LGA', 'DDR4', 4, 1, 1, 0, 6, 0, 6, 8, '板载Realtek RTL8111H千兆网卡', 'RJ45', 1299, 999, '../images/mainborad/12.jpg');
INSERT INTO `mainboard_inf` VALUES (30000013, 'B450M DS3H', '技嘉', 'AMD', 'AMD B450', 0, 1, 4, 'Socket AM4', 'DDR4', 4, 1, 1, 0, 3, 0, 6, 8, '板载Realtek千兆网卡', 'RJ45', 599, 999, '../images/mainborad/13.jpg');
INSERT INTO `mainboard_inf` VALUES (30000014, 'Battle Axe C.B360M-HD DELUXE V20', '七彩虹', 'Intel', 'Intel B360', 0, 1, 4, 'LGA', 'DDR3', 2, 1, 1, 1, 3, 0, 6, 6, '板载Realtek RTL8111H千兆网卡', 'RJ45', 469, 999, '../images/mainborad/14.jpg');
INSERT INTO `mainboard_inf` VALUES (30000015, 'B450M GAMING', '技嘉', 'AMD', 'AMD B450', 0, 1, 4, 'Socket AM4', 'DDR3', 2, 1, 1, 1, 3, 0, 6, 6, '板载Realtek千兆网卡', 'RJ45', 549, 999, '../images/mainborad/15.jpg');
INSERT INTO `mainboard_inf` VALUES (30000016, 'PRIME H310M-K', '华硕', 'Intel', 'Intel H310', 0, 0, 4, 'LGA', 'DDR3', 2, 0, 1, 1, 3, 0, 6, 6, '板载Realtek RTL8111H千兆网卡', 'RJ45', 499, 999, '../images/mainborad/16.jpg');
INSERT INTO `mainboard_inf` VALUES (30000017, 'B450M MORTAR TITANIUM', '微星', 'AMD', 'AMD B450', 0, 2, 4, 'Socket AM4', 'DDR4', 4, 1, 0, 0, 0, 1, 6, 8, '板载Realtek RTL8111H千兆网卡', 'RJ45', 899, 999, '../images/mainborad/17.jpg');
INSERT INTO `mainboard_inf` VALUES (30000018, 'A320M-HDV', '华擎', 'AMD', 'AMD A320', 1, 1, 4, 'Socket AM4', 'DDR3', 2, 1, 1, 1, 2, 0, 6, 6, '板载Realtek RTL8111GR千兆网卡', 'RJ45', 339, 999, '../images/mainborad/18.jpg');
INSERT INTO `mainboard_inf` VALUES (30000019, 'B450M-PLUS GAMING', '华硕', 'AMD', 'AMD B450', 0, 1, 6, 'Socket AM4', 'DDR4', 4, 1, 1, 0, 3, 0, 6, 4, '板载Realtek RTL8111H千兆网卡', 'RJ45', 629, 999, '../images/mainborad/19.jpg');
INSERT INTO `mainboard_inf` VALUES (30000020, 'B360M-PLUS GAMING', '华硕', 'Intel', 'Intel B360', 0, 2, 6, 'LGA', 'DDR4', 4, 1, 1, 0, 3, 0, 6, 5, '板载Intel I219V千兆网卡', 'RJ45', 799, 999, '../images/mainborad/20.jpg');
INSERT INTO `mainboard_inf` VALUES (30000021, 'PRIME B365M-A', '华硕', 'Intel', 'Intel B365', 0, 2, 6, 'LGA', 'DDR4', 4, 1, 1, 1, 3, 0, 4, 7, '板载Realtek千兆网卡', 'RJ45', 849, 999, '../images/mainborad/21.jpg');
INSERT INTO `mainboard_inf` VALUES (30000022, 'PRIME B360-PLUS', '华硕', 'Intel', 'Intel B360', 0, 2, 6, 'LGA', 'DDR4', 4, 1, 1, 1, 4, 0, 6, 6, '板载Realtek RTL8111H千兆网卡', 'RJ45', 999, 999, '../images/mainborad/22.jpg');
INSERT INTO `mainboard_inf` VALUES (30000023, 'Z370 HD3', '技嘉', 'Intel', 'Intel Z370', 0, 1, 6, 'LGA', 'DDR4', 4, 1, 1, 0, 6, 0, 6, 8, '板载Intel E千兆网卡', 'RJ45', 1099, 999, '../images/mainborad/23.jpg');
INSERT INTO `mainboard_inf` VALUES (30000024, 'ROG STRIX B450-F GAMING', '华硕', 'AMD', 'AMD B450', 0, 2, 6, 'Socket AM4', 'DDR4', 4, 0, 0, 0, 6, 0, 6, 8, '板载Intel I211-AT千兆网卡', 'RJ45', 999, 999, '../images/mainborad/24.jpg');
INSERT INTO `mainboard_inf` VALUES (30000025, 'ROG STRIX Z390-I GAMING', '华硕', 'Intel', 'Intel Z390', 0, 2, 4, 'LGA', 'DDR3', 2, 1, 0, 0, 1, 1, 4, 5, '板载Intel I219V千兆网卡', 'RJ45', 2399, 999, '../images/mainborad/25.jpg');
INSERT INTO `mainboard_inf` VALUES (30000026, 'PRIME B365M-K', '华硕', 'Intel', 'Intel B365', 0, 1, 6, 'LGA', 'DDR3', 2, 0, 1, 1, 3, 0, 6, 6, '板载Realtek千兆网卡', 'RJ45', 749, 999, '../images/mainborad/26.jpg');
INSERT INTO `mainboard_inf` VALUES (30000027, 'B450 AORUS M', '技嘉', 'AMD', 'AMD B450', 0, 1, 6, 'Socket AM4', 'DDR4', 4, 1, 1, 0, 3, 0, 6, 7, '板载千兆网卡', 'RJ45', 699, 999, '../images/mainborad/27.jpg');
INSERT INTO `mainboard_inf` VALUES (30000028, 'H81M-DS2(rev.1.0)', '技嘉', 'Intel', 'Intel H81', 0, 0, 4, 'LGA', 'DDR3', 2, 0, 0, 1, 3, 0, 6, 2, '板载Realtek千兆网卡', 'RJ45', 409, 999, '../images/mainborad/28.jpg');
INSERT INTO `mainboard_inf` VALUES (30000029, 'M5A78L-M LX3 PLUS', '华硕', 'AMD', 'AMD 760G', 1, 0, 4, 'Socket AM4', 'DDR3', 2, 0, 0, 1, 1, 0, 8, 0, '板载Atheros 8161网卡', 'RJ45', 399, 999, '../images/mainborad/29.jpg');
INSERT INTO `mainboard_inf` VALUES (30000030, 'PRIME Z390M-PLUS', '华硕', 'Intel', 'Intel Z390', 0, 2, 4, 'LGA', 'DDR4', 4, 1, 1, 0, 5, 0, 4, 10, '板载Intel I219V千兆网卡', 'RJ45', 1399, 999, '../images/mainborad/30.jpg');
INSERT INTO `mainboard_inf` VALUES (30000050, 'AX370M-DS3H主板锐龙AM4', '技嘉', 'AMD', 'AMD 370', 0, 1, 4, 'Socket AM4', 'DDR4', 4, 1, 1, 1, 3, 0, 4, 4, 'RealtekR', 'RJ45', 499, 20, '../images/mainborad/5ab354e1N6f042f7b.jpg');

-- ----------------------------
-- Table structure for mechanics_inf
-- ----------------------------
DROP TABLE IF EXISTS `mechanics_inf`;
CREATE TABLE `mechanics_inf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mecName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Interface` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `speed` int(11) NULL DEFAULT NULL,
  `capacity` int(11) NULL DEFAULT NULL,
  `cache` int(11) NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `imgPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50000015 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mechanics_inf
-- ----------------------------
INSERT INTO `mechanics_inf` VALUES (50000001, 'WUH721414ALE6L4', 'HGST', 'SATA', 7200, 14336, 256, 2700, 999, '../images/Mechanics/1.jpg');
INSERT INTO `mechanics_inf` VALUES (50000002, 'HUS726T6TALE6L4', 'HGST', 'SATA', 7200, 6144, 256, 1700, 999, '../images/Mechanics/2.jpg');
INSERT INTO `mechanics_inf` VALUES (50000003, 'HUH721010ALE600', 'HGST', 'SATA', 7200, 10240, 256, 1700, 999, '../images/Mechanics/3.jpg');
INSERT INTO `mechanics_inf` VALUES (50000004, 'ST12000NE0007', 'Seagate', 'SATA', 7200, 12288, 256, 6600, 999, '../images/Mechanics/4.jpg');
INSERT INTO `mechanics_inf` VALUES (50000005, 'ST14000DM001', 'Seagate', 'SATA', 7200, 14336, 256, 5000, 999, '../images/Mechanics/5.jpg');
INSERT INTO `mechanics_inf` VALUES (50000006, 'WUH721414ALE6L4', 'WD', 'SATA', 7200, 12288, 256, 5000, 999, '../images/Mechanics/6.jpg');
INSERT INTO `mechanics_inf` VALUES (50000007, 'WD101VRYZ', 'WD', 'SATA', 7200, 10240, 256, 4000, 999, '../images/Mechanics/6.jpg');
INSERT INTO `mechanics_inf` VALUES (50000008, 'WD100EFAX', 'WD', 'SATA', 5400, 10240, 256, 2700, 999, '../images/Mechanics/7.jpg');
INSERT INTO `mechanics_inf` VALUES (50000009, 'MG07ACA14TE', 'TOSHIBA', 'SATA', 7200, 14336, 256, 3000, 999, '../images/Mechanics/8.jpg');
INSERT INTO `mechanics_inf` VALUES (50000010, 'MG05ACA800E', 'TOSHIBA', 'SATA', 7200, 8192, 128, 1250, 999, '../images/Mechanics/9.jpg');
INSERT INTO `mechanics_inf` VALUES (50000011, 'SAS', 'DELL', 'SATA', 10000, 2458, 256, 2000, 999, '../images/Mechanics/10.jpg');
INSERT INTO `mechanics_inf` VALUES (50000012, 'ST2000LM003', 'samsung', 'SATA', 5400, 2048, 16, 400, 999, '../images/Mechanics/11.jpg');
INSERT INTO `mechanics_inf` VALUES (50000013, 'ST6000NM0115', 'Seagate', 'SATA', 7200, 6144, 256, 800, 999, '../images/Mechanics/12.jpg');
INSERT INTO `mechanics_inf` VALUES (50000014, 'ST4000VN008', 'Seagate', 'SATA', 5900, 4096, 64, 600, 999, '../images/Mechanics/13.jpg');

-- ----------------------------
-- Table structure for memorychip
-- ----------------------------
DROP TABLE IF EXISTS `memorychip`;
CREATE TABLE `memorychip`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brand` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capacity` int(11) NULL DEFAULT NULL,
  `bf` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `imgPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70000018 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of memorychip
-- ----------------------------
INSERT INTO `memorychip` VALUES (70000001, 'CMD32GX4M2C3200C14T', '海盗船统治者铂金', 32, 'DDR4', 3590, 100, '../images/MemoryChip/1.jpg');
INSERT INTO `memorychip` VALUES (70000002, 'HX424C15FB/8', '金士顿骇客神条', 8, 'DDR4', 299, 50, '../images/MemoryChip/2.jpg');
INSERT INTO `memorychip` VALUES (70000003, 'HX424C12SB/8', '金士顿HyperX Savage', 8, 'DDR4', 389, 30, '../images/MemoryChip/3.jpg');
INSERT INTO `memorychip` VALUES (70000004, 'F4-3000C16D-16GTZR', '芝奇Trident Z R', 16, 'DDR4', 2218, 26, '../images/MemoryChip/4.jpg');
INSERT INTO `memorychip` VALUES (70000005, 'CMK8GX4M2B3000C15', '海盗船复仇者LPX ', 8, 'DDR4', 349, 33, '../images/MemoryChip/5.jpg');
INSERT INTO `memorychip` VALUES (70000006, 'KD48GU880-26N160T', '科赋BOLT X', 8, 'DDR4', 349, 100, '../images/MemoryChip/6.jpg');
INSERT INTO `memorychip` VALUES (70000007, 'HX424C15FB/16', '金士顿骇客神条FURY', 16, 'DDR4', 629, 155, '../images/MemoryChip/7.jpg');
INSERT INTO `memorychip` VALUES (70000008, 'KVR16N11/4', '金士顿', 4, 'DDR3', 165, 154, '../images/MemoryChip/8.jpg');
INSERT INTO `memorychip` VALUES (70000009, 'KVR16N11/8', '金士顿', 8, 'DDR3', 359, 51, '../images/MemoryChip/9.jpg');
INSERT INTO `memorychip` VALUES (70000010, 'F4-2133C15S-8GVR', '芝奇Ripjaws V', 8, 'DDR4', 699, 111, '../images/MemoryChip/10.jpg');
INSERT INTO `memorychip` VALUES (70000011, 'CMK8GX4M1A2400C14', '海盗船复仇者', 8, 'DDR4', 299, 123, '../images/MemoryChip/11.jpg');
INSERT INTO `memorychip` VALUES (70000012, 'CMK16GX4M2A2400C14', '海盗船复仇者LPX', 16, 'DDR4', 639, 122, '../images/MemoryChip/12.jpg');
INSERT INTO `memorychip` VALUES (70000013, 'KVR21N15/8', '金士顿8', 8, 'DDR4', 139, 200, '../images/MemoryChip/13.jpg');
INSERT INTO `memorychip` VALUES (70000014, 'F4-2800C15D-16GVRB', '芝奇Ripjaws V', 16, 'DDR4', 959, 54, '../images/MemoryChip/14.jpg');
INSERT INTO `memorychip` VALUES (70000015, 'F4-3200C16Q-32GTZR', '芝奇Trident Z', 32, 'DDR4', 2699, 55, '../images/MemoryChip/15.jpg');
INSERT INTO `memorychip` VALUES (70000016, 'CMD16GX4M4A3000C15', '海盗船统治者铂金', 16, 'DDR4', 1219, 2, '../images/MemoryChip/16.jpg');
INSERT INTO `memorychip` VALUES (70000017, 'KVR21S15S8/4', '金士顿4', 4, 'DDR4', 358, 10, '../images/MemoryChip/17.jpg');

-- ----------------------------
-- Table structure for radiator
-- ----------------------------
DROP TABLE IF EXISTS `radiator`;
CREATE TABLE `radiator`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `heatDissipation` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `noise` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` int(11) NULL DEFAULT NULL,
  `stock` int(11) NULL DEFAULT NULL,
  `imgPath` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60000011 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of radiator
-- ----------------------------
INSERT INTO `radiator` VALUES (60000001, '超频三偃月R240水冷', '风冷，水冷', '31±10%dB350', 499, 999, '../images/Radiator/1.jpg');
INSERT INTO `radiator` VALUES (60000002, '九州风神玄冰400', '风冷，热管', '21.4-32.1dB', 89, 999, '../images/Radiator/2.jpg');
INSERT INTO `radiator` VALUES (60000003, '酷冷至尊海魔120（RL-S12V-20PB-R1）', '风冷，水冷', '12-35dB', 279, 999, '../images/Radiator/3.jpg');
INSERT INTO `radiator` VALUES (60000004, 'Tt 零度水冷装备（Pacific RL240）', '风冷，水冷', '20.7dB', 2899, 999, '../images/Radiator/4.jpg');
INSERT INTO `radiator` VALUES (60000005, '海盗船H100i v2', '水冷', '	37.7dB	', 859, 999, '../images/Radiator/5.jpg');
INSERT INTO `radiator` VALUES (60000006, '猫头鹰NH-D15', '风冷，热管', '24.6dB', 619, 999, '../images/Radiator/6.jpg');
INSERT INTO `radiator` VALUES (60000007, '超频三东海X6', '	风冷，热管', '18-30.5dB', 129, 999, '../images/Radiator/7.jpg');
INSERT INTO `radiator` VALUES (60000008, '九州风神大霜塔', '风冷，热管', '21.4-32.1dB', 219, 999, '../images/Radiator/8.jpg');
INSERT INTO `radiator` VALUES (60000009, '酷冷至尊暴雪T400i', '风冷，热管', '9-31dB', 99, 999, '../images/Radiator/9.jpg');
INSERT INTO `radiator` VALUES (60000010, '酷冷至尊暴雪T610P R', '风冷，热管', '31dB', 219, 999, '../images/Radiator/10.jpg');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `pid` int(11) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  `score` int(11) NULL DEFAULT NULL,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_inf` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (30000018, 9, 3);
INSERT INTO `score` VALUES (30000007, 9, 4);
INSERT INTO `score` VALUES (30000009, 13, 2);

-- ----------------------------
-- Table structure for user_inf
-- ----------------------------
DROP TABLE IF EXISTS `user_inf`;
CREATE TABLE `user_inf`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uUserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uPNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uEmail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uPassword` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isAdministrator` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_inf
-- ----------------------------
INSERT INTO `user_inf` VALUES (1, '江泽民', 'livingelder', '12345678901', 'jzm@znh.com', '3805248410673a8be6aa4807e61fb5ae', 1);
INSERT INTO `user_inf` VALUES (7, '李亚宁', 'suvvm1', '123456', '123456@qq.com', 'e10adc3949ba59abbe56e057f20f883e', 0);
INSERT INTO `user_inf` VALUES (9, '习近平', 'king', '12345678902', 'xjp@znh.com', '3805248410673a8be6aa4807e61fb5ae', 0);
INSERT INTO `user_inf` VALUES (10, '1', '山东省', '12321', '124344342@qq.com', 'eb163727917cbba1eea208541a643e74', 0);
INSERT INTO `user_inf` VALUES (11, '江泽民', '221', '1', '1244921277@qq.com', '060ad92489947d410d897474079c1477', 0);
INSERT INTO `user_inf` VALUES (12, 'fzw', 'fzfw', '133333', '12234343@qq.com', '42c900e7cdf4c85830453ee9614b7d54', 0);
INSERT INTO `user_inf` VALUES (13, 'fzw', 'fzwf', '1333333', '1121313131@qq.com', '42c900e7cdf4c85830453ee9614b7d54', 0);

-- ----------------------------
-- Table structure for usercomment
-- ----------------------------
DROP TABLE IF EXISTS `usercomment`;
CREATE TABLE `usercomment`  (
  `uid` int(11) NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `content` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isshow` tinyint(1) NULL DEFAULT NULL,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `usercomment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_inf` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usercomment
-- ----------------------------
INSERT INTO `usercomment` VALUES (9, 60000001, '输入评论', 1);
INSERT INTO `usercomment` VALUES (9, 60000001, '好使', 1);

-- ----------------------------
-- View structure for vborrowinfo
-- ----------------------------
DROP VIEW IF EXISTS `vborrowinfo`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vborrowinfo` AS select `b`.`Bname` AS `Bname`,`b`.`Author` AS `Author`,`b`.`Press` AS `Press`,`b`.`Price` AS `Price`,`a`.`ReaderID` AS `ReaderID`,`a`.`Rname` AS `Rname`,`c`.`Borrowdate` AS `Borrowdate`,`c`.`Returndate` AS `Returndate` from ((`tblreaders` `a` join `tblbooks` `b`) join `tbllending` `c`) where ((`c`.`ReaderID` = `a`.`ReaderID`) and (`c`.`BookID` = `b`.`BookID`));

-- ----------------------------
-- View structure for vwtotalcount
-- ----------------------------
DROP VIEW IF EXISTS `vwtotalcount`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `vwtotalcount` AS select `a`.`ReaderID` AS `ReaderID`,`a`.`Rname` AS `Rname`,(select count(0) from `tbllending` where (`tbllending`.`ReaderID` = `a`.`ReaderID`)) AS `Name_exp_3` from `tblreaders` `a`;

SET FOREIGN_KEY_CHECKS = 1;
