-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2023 at 07:08 PM
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
-- Database: `cosmetic_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `date` datetime NOT NULL,
  `decent_id` int(10) UNSIGNED NOT NULL,
  `state` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`account_id`, `username`, `password`, `date`, `decent_id`, `state`) VALUES
(1, 'josie', '123456', '2023-03-15 08:19:07', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` int(10) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `bill_state` int(1) UNSIGNED NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `bill_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `product_price` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `brand_id` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `display_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`, `img`, `display_name`) VALUES
(1, 'loreal', 'loreal-logo.jpg', 'L\'OREAL'),
(2, 'cocoon', 'cocoon-logo.jpg', 'Cocoon'),
(3, 'larocheposay', 'larocheposay-logo.jpg', 'LA ROCHE-POSAY'),
(4, 'bioderma', 'bioderma-logo.jpg', 'BIODERMA'),
(5, 'maybelline', 'maybelline-logo.jpg', 'MAYBELLINE'),
(6, 'mac', 'mac-logo.jpg', 'M.A.C');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `account_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(0, ''),
(1, 'Chăm sóc da mặt'),
(2, 'Chăm sóc cơ thể'),
(3, 'Makeup');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cusotmer_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `decentralization`
--

CREATE TABLE `decentralization` (
  `decent_id` int(10) UNSIGNED NOT NULL,
  `decent_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `decentralization`
--

INSERT INTO `decentralization` (`decent_id`, `decent_name`) VALUES
(1, 'customer'),
(2, 'admin'),
(3, 'staff');

-- --------------------------------------------------------

--
-- Table structure for table `decent_detail`
--

CREATE TABLE `decent_detail` (
  `decent_id` int(10) UNSIGNED NOT NULL,
  `feature_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(20) NOT NULL,
  `action` varchar(100) NOT NULL,
  `isDisplayed` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `decent_detail`
--

INSERT INTO `decent_detail` (`decent_id`, `feature_id`, `url`, `action`, `isDisplayed`) VALUES
(2, 1, '', 'add', 1),
(2, 1, '', 'delete', 1),
(2, 1, '', 'update', 1),
(3, 1, '', 'add', 1),
(3, 1, '', 'delete', 1),
(3, 1, '', 'update', 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `account_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feature`
--

CREATE TABLE `feature` (
  `feature_id` int(10) UNSIGNED NOT NULL,
  `feature_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feature`
--

INSERT INTO `feature` (`feature_id`, `feature_name`) VALUES
(1, 'Tài khoản'),
(2, 'Sản phẩm'),
(3, 'Quyền'),
(5, 'Hóa đơn'),
(6, 'Đơn hàng'),
(7, 'Nhãn hàng'),
(8, 'Khách hàng'),
(9, 'Nhân viên'),
(10, 'Thống kê');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `product_type` int(5) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `img` varchar(50) NOT NULL,
  `info` varchar(2000) NOT NULL,
  `ingredient` varchar(2000) NOT NULL,
  `skin_type` varchar(50) NOT NULL,
  `volume` int(5) UNSIGNED NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `state` int(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `brand_id`, `product_type`, `product_name`, `img`, `info`, `ingredient`, `skin_type`, `volume`, `price`, `quantity`, `state`) VALUES
(1, 1, 1, 'Nước Tẩy Trang L\'Oreal Tươi Mát Cho Da Dầu, Hỗn Hợp', '1.jpg', 'Nước Tẩy Trang L\'Oréal Paris 3-in-1 Micellar Water Refreshing (xanh dương nhạt) ứng dụng công nghệ Micellar mới chứa các phân tử mi-xen độc đáo hoạt động như một thỏi nam châm giúp loại bỏ hoàn toàn bụi bẩn và lớp trang điểm, đồng thời làm dịu da nhờ thành phần nước khoáng từ những ngọn núi ở Pháp, mang lại làn da tươi tắn hơn sau khi tẩy trang. Kết cấu dạng nước tươi mát, dễ sử dụng, không cần rửa lại với nước mà vẫn không gây nhờn dính da.', 'Aqua / Water, Hexylene Glycol, Glycerin, Poloxamer 184, Disodium Cocoamphodiacetate, Disodium Edta, BHT , Polyaminopropyl Biguanide', 'oil', 400, 159000, 15000, 1),
(2, 1, 1, 'Nước Tẩy Trang L\'Oreal Làm Sạch Sâu Trang Điểm', '2.jpg', 'Nước Tẩy Trang L\'Oreal Micellar Water 3-in-1 Deep Cleansing Even For Sensitive Skin có hai lớp chất lỏng giúp hòa tan chất bẩn và loại bỏ toàn bộ lớp trang điểm hiệu quả, kể cả lớp trang điểm lâu trôi và không thấm nước chỉ trong một bước.', 'Aqua / Water, Cyclopentasiloxane, Isohexadecane, Potassium Phosphate, Sodium Chloride, Dipotassium Phosphate, Disodium Edta, Decyl Glucoside, Hexylene Glycol, Polyaminopropyl Biguanide, CI 61565 / Green 6', 'all', 400, 159000, 15000, 1),
(3, 1, 1, 'Nước Tẩy Trang L\'Oreal Dưỡng Ẩm Cho Da Thường, Khô', '3.jpg', 'Nước Tẩy Trang L\'Oreal Micellar Water 3-in-1 Moisturizing Even For Sensitive Skin ứng dụng công nghệ Micellar mới chứa các phân tử mi-xen độc đáo hoạt động như một thỏi nam châm giúp loại bỏ hoàn toàn bụi bẩn và lớp trang điểm, đồng thời dưỡng da ẩm mượt nhờ thành phần chiết xuất hoa hồng Pháp, giúp duy trì độ ẩm cần thiết cho da sau khi tẩy trang. Kết cấu dạng nước tươi mát, dễ sử dụng, không cần rửa lại với nước, giúp da trở nên sạch sẽ, tươi sáng và có đủ độ ẩm.', ' Aqua / Water, Hexylene Glycol, Glycerin, Rosa Gallica Flower Extract, Sorbitol, Poloxamer 184, Disodium Cocoamphodiacetate, Disodium Edta, Propylene Glycol, BHT , Polyaminopropyl Biguanide', 'dry', 400, 159000, 10000, 1),
(4, 1, 1, 'Nước Tẩy Trang L\'Oréal Làm Sạch Sâu Cho Da Dầu', '4.jpg', 'Nước Tẩy Trang L\'Oréal Paris Revitalift Crystal Purifying Micellar Water là dòng nước tẩy trang được thương hiệu L\'Oréal thiết kế dành riêng cho làn da dầu, với công nghệ đột phá Oil-free đem đến sức mạnh làm sạch sâu gấp 5 lần. Sản phẩm chứa các phân tử mixen hoạt động như một nam châm làm sạch, loại bỏ 5 loại tạp chất có trên da bạn hằng ngày, giúp lỗ chân lông thoáng sạch.', 'Aqua / Water, Hexylene Glycol, Glycerin, Rosa Gallica Flower Extract, Sorbitol, Poloxamer 184, Disodium Cocoamphodiacetate, Disodium Edta, Propylene Glycol, BHT , Polyaminopropyl Biguanide', 'oil', 400, 209000, 6000, 1),
(5, 1, 2, 'Kem Chống Nắng L\'Oreal Mịn Nhẹ Che Phủ Đều Màu Da', '5.jpg', 'Kem Chống Nắng L’Oreal Paris UV Defender Correct & Protect UV Serum Protector SPF 50+ PA++++ chứa thành phần chống oxy hóa mạnh mẽ Vitamin CG - giúp chống lại tác hại của gốc tự do một cách tối ưu, kết hợp cùng sắc tố màu quả mơ dễ dàng tiệp vào da thật tự nhiên, mang lại hiệu ứng da trông đều màu và rạng rỡ hơn.', 'Aqua / Water, Alcohol Denat, Ethylhexyl Triazone, Drometrizole Trisiloxane, Isononyl Isononanoate, Isopropyl Lauroyl Sarcosinate, Butyl Methoxydibenzoylmethane, Diisopropyl Sebacate, Bis Ethylhexyloxyphenol Methoxyphenyl Triazine, Dimethicone, Methylene Bis Benzotriazolyl Tetramethylbutylphenol [Nano] / Me Thylene Bis Benzotriazolyl Tetramethylbutylphenol, Octocrylene, Propanediol, Ethylhexyl Salicylate, Silica, Cetearyl Alcohol, T Butyl Alcohol, Tocopherol, Sodium Stearoyl Glutamate, Hydrolyzed Hyaluronic Acid, Phenoxyethanol, Peg 10 Dimethicone, Peg 20, Trisodium Ethylenediamine Disuccinate Polyglyceryl 10 Laurate Ammonium Acryloyldimethyltaurate / Vp Copolymer, Limonene, Linalool Caprylyl Glycol Alpha Isomethyl Ionone Carbomer Acrylates / C10 30 Alkyl Acrylate Crosspolymer Butylene Glycol Cetearyl Glucoside Potassium Hydroxideinulin Lauryl Carbamate Hexyl Glycerin, Parfum / Fragrance.', 'oil', 50, 208000, 100, 1),
(6, 1, 2, 'Kem Chống Nắng L\'Oreal Mịn Nhẹ Nâng Tông Giảm Thâm', '6.jpg', 'Kem Chống Nắng L’Oreal Paris UV Defender Bright & Clear UV Serum Protector SPF 50+ PA++++ chứa hàm lượng cao Niacinamide có khả năng dưỡng sáng da, mờ đốm nâu & sạm nám, đồng thời củng cố hàng rào bảo vệ da, góp phần ngăn ngừa tác hại của tia UV. Đặc biệt, hiệu ứng làm sáng da tức thì sẽ giúp làn da xỉn màu trông bừng sáng và rạng rỡ hơn bao giờ hết.', 'Aqua / Water, Ethylhexyl Methoxycinnamate, Titanium Dioxide, Squalane, Glycerin, Drometrizole Trisiloxane, Terephthalylidene Dicamphor Sulfonic Acid, Propylene Glycol, Alcohol Dlenate Glycol, Alcohol Dlenate Glycol., Triethanolamine, Dipropylene Glycol, Mica, Stearic Acid, Potassium Cetyl Phosphate, Tocopherol, Nylon 12, Ci 77891 / Titanium Dioxide, Niacinamide, Sodium Cocoyl Sarcosinate, Sodium Chloride, Phenoxyethanol, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Paeonia Suffruticosa Root Extract, Thermus Thermophillus Ferment, Peg 100 Stearate, Ethylhexyl Triazone, Trisodium Ethylenediamine Disuccinate, Palmitic Acid, Polysorbate 80, Limonene, Xanthan Gum, Linalool, Tromethamine, Isohexadecane, Caprylyl Glycol, Alpha Isomethyl Ionone, Barium Sulfate, Carbomer, Acrylamide / Sodium Acryloyldimethyltaurate Copolymer, Myristic Acid, Sorbitan Oleate, Bis Ethylhexyloxyphenol Methoxyphenyl Triazine, Cetyl Alcohol, Butylene Glycol, Bht, Butyrospermum Parkii Seedcake Extract / Shea Seedcake Extract, Potassiumhydroxide Hexyl Cinnamal Glyceryl Stearate Parfum / Fragrance.', 'all', 50, 224000, 100, 1),
(7, 1, 2, 'Kem Chống Nắng L\'Oreal Mịn Nhẹ Kiềm Dầu Thoáng Mịn Da', '7.jpg', 'Kem Chống Nắng L’Oreal Paris UV Defender Matte & Fresh UV Serum Protector SPF 50+ PA++++ chứa hoạt chất Airlicium giúp kiểm soát lượng dầu thừa trên da hiệu quả, giúp làn da không còn bóng nhờn mà trở nên thoáng mịn nhẹ tênh, ngay cả trong điều kiện thời tiết nóng ẩm.', 'Aqua / Water, Glycerin, Alcohol Denat, Dimethicone, Ethylhexyl Salicylate, Propylene Glycol, Terephthalylidene Dicamphor Sulfonic Acid, Silica, Titanium Dioxide, Triethanolamine, Drometrizole Trisiloxane, Phenylbenzimidazole Sulfonic Acid, Octocrylene, Ethylhexyl Triazone, Butyl Methoxydibenzoylmethane, Tromethamine, Stearic Acid, Potassium Cetyl Phosphate, Tocopherol, Phenoxyethanol, Peg 100 Stearate, Palmitic Acid, Silica Silylate, Ammonium Polyacryloyldimethyl Taurate, Limonene, Menthoxypropanediol, Linalool, Sanguisorba Officinalis Root Extract, Zingiber Officinale Root Extract / Ginger Root Extract, Cinnamomum Cassia Bark Extract, Kaolin, Alpha Isomethyl Ionone, Carbomer, Myristic Acid, Disodium Edta Cetyl Alcohol Butylene Glycol Butyrospermum Parkii Seedcake Extract / Shea Seedcake Extract Hexyl Cinnamal Glyceryl Stearate Parfum /Fragrance.', 'oil', 50, 223000, 1000, 1),
(8, 1, 2, 'Kem Chống Nắng L\'Oreal Dưỡng Ẩm Mịn Mượt Da', '8.jpg', 'Kem Chống Nắng L’Oreal UV Defender Moist & Fresh SPF 50+ PA ++++ chứa hoạt chất Hyaluronic Acid giúp cung cấp độ ẩm làm mềm mượt da, giữ da luôn mịn màng tránh gây khô căng, bong tróc, sần sùi và ngăn tình trạng cakey trên làn da trang điểm.', 'Aqua / Water, Alcohol Denat, Ethylhexyl Triazone, Drometrizole Trisiloxane, Isononyl Isononanoate, Isopropyl Lauroyl Sarcosinate, Butyl Methoxydibenzoylmethane, Diisopropyl Sebacate, Bis Ethylhexyloxyphenol Methoxyphenyl Triazine, Dimethicone, Methylene Bis Benzotriazolyl Tetramethylbutylphenol [Nano] / Me Thylene Bis Benzotriazolyl Tetramethylbutylphenol, Octocrylene, Propanediol, Ethylhexyl Salicylate, Silica, Cetearyl Alcohol, T Butyl Alcohol, Tocopherol, Sodium Stearoyl Glutamate, Hydrolyzed Hyaluronic Acid, Phenoxyethanol, Peg 10 Dimethicone, Peg 20, Trisodium Ethylenediamine Disuccinate, Polyglyceryl 10 Laurate, Ammonium Acryloyldimethyltaurate/Vp Copolymer, Limonene, Linalool, Caprylyl Glycol, Alpha Isomethyl Ionone, Carbomer, Acrylates/C10 30 Alkyl Acrylate Crosspolymer, Butylene Glycol, Cetearyl Glucoside, Potassium Hydroxide, Inulin Lauryl Carbamate, Hexyl Cinnamal, Glycerin, Parfum / Fragrance\r\n\r\n', 'all', 50, 238000, 80, 1),
(9, 1, 2, 'Kem Chống Nắng L\'Oreal Paris X20 Thoáng Da Mỏng Nhẹ', '9.jpg', 'Kem Chống Nắng L’Oreal Paris UV Defender Serum Invisible Fluid SPF50+ PA++++ x20 Mỏng Nhẹ (Mới) sở hữu màng bảo vệ UV mạnh mẽ, giúp cản nắng tối đa nhưng vẫn nhẹ nhàng trên da. Với chỉ số chống nắng SPF50+ và khả năng chống lại tia UVA dài, sản phẩm giúp bảo vệ da hiệu quả khỏi các dấu hiệu lão hoá do tia UV gây ra như: đốm nâu, da xỉn màu và nếp nhăn.', 'Aqua / Water, Alcohol Denat., Diisopropyl Sebacate, Silica, Isopropyl Myristate, Ethylhexyl Salicylate, Ethylhexyl Triazone, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Butyl Methoxydibenzoylmethane, Glycerin, Propanediol, C12-22 Alkyl Acrylate/Hydroxyethylacrylate Copolymer, Drometrizole Trisiloxane, Perlite, Caprylic/Capric Triglyceride, Tocopherol, Hydroxyacetophenone, Hydroxyethylcellulose, Sodium Hyaluronate, Triethanolamine, Trisodium Ethylenediamine Disuccinate, Silica Silylate, Limonene, Linalool, Caprylyl Glycol, Alpha-Isomethyl Ionone, Terephthalylidene Dicamphor Sulfonic Acid, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Hexyl Cinnamal, Parfum / Fragrance.', 'all', 50, 269000, 100, 1),
(10, 1, 3, 'Serum L\'Oreal Hyaluronic Acid Cấp Ẩm Sáng Da', '10.jpg', 'Tinh Chất Siêu Cấp Ẩm Sáng Da L\'Oreal Paris Revitalift 1.5% Hyaluronic Acid Serum là dòng sản phẩm serum đến từ thương hiệu L\'Oréal Paris nổi tiếng của Pháp, với sự kết hợp không chỉ 1 mà đến 2 loại Hyaluronic Acid ưu việt ở nồng độ 1.5% sẽ là giải pháp chăm sóc da hiệu quả dành cho làn da khô & lão hóa, giúp cung cấp độ ẩm tối đa cho da căng mịn và tươi sáng tức thì. Với Revitalift HA đậm đặc, làn da sẽ có sự thay đổi rõ rệt, mang đến vẻ ngoài rạng rỡ cho bạn.', 'Aqua / Water, Glycerin, Hydroxyethylpiperazine Ethane Sulfonic Acid, Sodium Hyaluronate, Peg-60 Hydrogenated Castor Oil, Secale Cereale Seed Extract / Rye Seed Extract, Calcium Pantothenate, Dipeptide Diaminobutyroyl Benzylamide Diacetate, Ascorbyl Glucoside, Disodium Edta, Pentylene Glycol, Phenoxyethanol, Chlorphenesin', 'all', 30, 359000, 50, 1),
(11, 1, 3, 'Serum L\'Oréal Dưỡng Sáng Và Mờ Thâm Nám ', '11.jpg', 'Serum L\'Oreal Paris Dưỡng Sáng Và Mờ Thâm Nám là sản phẩm tinh chất dưỡng da đến từ thương hiệu mỹ phẩm L’Oreal Paris của Pháp, với phức hợp làm sáng 4 trong 1 trong đó chứa 1% Glycolic Acid có khả năng loại bỏ loại bỏ tế bào chết nhẹ nhàng, tái tạo da giúp các dưỡng chất thẩm thấu sâu vào da đem lại hiệu quả dưỡng sáng mịn, ức chế sản sinh melanin giảm các vết thâm nám. ', 'Aqua / Water, Glycerin, Alcohol, Dipropylene Glycol, Butylene Glycol, Peg/Ppg/Polybutylene Glycol-8/5/3 Glycerin, Niacinamide, Hydroxethylpiperazine Ethane Sulfonic Acid, Bis-Peg-18 Methyl Ether Dimethyl Silane, Glycolic Acid, 3-0-Ethyl Ascorbic Acid, Isononyl Isononanoate, Linalool, Geranoil, Sobbritan Isosteate, Eugenol, Parfum/Frgrance, Salicylic Acid, Sodium Hydroxide, Sodium Citrate, Sodium Hyaluronate, Phenoxyethanol, Phenylthyl Resorcinol, Adenosine, Ammonium Polyacryloyldimethyl Taurate, Tocopheryl Acetate, Disodium Edta, Limonene Tocopherol, Hydroxyethyl Acrylate/Sodiumm Acryloyldimethyl Taurate Copolymer, Hydrogenated Lecithin, Citric Acid, Citronellol, Xanthuum Gum, Acetyl Trifluoromethylphenyl Valylglycine, Oxothiazolidinecarboxylic Acid, Polysorbate 60, Hexyl Cinnamal, Benzyl Alochol (F.I.L. C26904/1)', 'all', 30, 319000, 40, 1),
(12, 1, 4, 'Kem Dưỡng L\'Oreal Paris Sáng Mịn Mờ Thâm Nám Ban Đêm', '12.jpg', 'Kem Dưỡng L\'Oreal Paris Sáng Mịn Mờ Thâm Nám Ban Đêm 50ml là sản phẩm kem dưỡng da ban đêm đến từ thương hiệu mỹ phẩm L’Oreal Paris của Pháp, công thức đặc biệt với Axit Glycolic làm sáng và Vitamin E chống oxy hóa, loại bỏ tế bào chết xỉn màu, ức chế sản sinh melanin làm giảm các vết thâm nám cho làn da sáng đều màu rõ rệt.', 'Aqua / Water, Glycerin, Niacinamide, Alcohol, Dipropylene Glycol, Dimethicone, Butylene Glycol, Peg/Ppg/Polybutylene Glyol-8/5/3 Glycerin, Peg-8, Zea Mays Starch/Corn Starch, Linalook, Carbomer, Glycolic Acid, Dimethiconol, Parfum/Fragrance, Sodium Hyroxide, Sodium Citrate, Sodium Hyaluronate, Sodium Benzoate, Phenoxyethanol, Mannitol, Phenylethyl Resorcinol, Ammonium Polyacryolydimethyl Taurate, Ascorbyl Glucoside, Tocopheryl Acetate, Limonene, Paeonia Suffruticosa Root Extract, Caprylyl Glycol, Microcrystalline Cellulose, Captryloyl Salicyclic Acid, Tertrasodium Edta, Hydrolyzed Lipine Protein, Hexyl Cinnamal, Benzyl Alcohol, Ci16035/Red 4. (F.I.L. Y292059/1)', 'all', 50, 259000, 100, 1),
(13, 1, 4, 'Kem Dưỡng L\'Oreal Paris Sáng Mịn Mờ Thâm Nám Ban Ngày', '13.jpg', 'Kem Dưỡng L\'Oreal Paris Sáng Mịn Mờ Thâm Nám Ban Ngày 50ml là sản phẩm kem dưỡng da ban ngày đến từ thương hiệu mỹ phẩm L’Oreal Paris của Pháp, công thức đặc biệt với Axit Glycolic làm sáng và Vitamin E chống oxy hóa, loại bỏ tế bào chết xỉn màu, ức chế sản sinh melanin làm giảm các vết thâm nám cho làn da sáng đều màu rõ rệt. Ngoài ra, sản phẩm có chỉ số chống nắng SPF 17 hỗ trợ bảo vệ da khỏi các tác hại của ánh nắng mặt trời.', 'Aqua / Water, Ethylexhyl Methoxycinamate, Glycerin, Isohexadecane, Cyclohexasiloxane, Ammonium Polyacryloyldmethyl Taurate, Pentaerythrityl Tetraethylhexanoate, Titanium Dioxide [Nano] / Titanium Dioxide, Glyceryl Sterate, Peg-100 Stearate, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Synthetic Wax, Bht, Potassiumcetyl Phsphate, Stearic Acid, Linalool, Geranoil, Glycolic Acid, Eugenol, Parfum/Fragrance, Manganese Gluconate, Methylparben, Silica, Myristic Acid, Sodium Hydroxide, Palmitic Acid, Aluminum Hydroxide, Phenoxyethanol, Phenylethyl Resoorcinol, Ascorbyl Glucoside, Limonene, Caprylyl Glycol, Tetrasdoium Edta, Capryloyl Salicylic Acid, Citrus Limon Fruit Extract / Lemon Fruit Extract, Citric Acid, Tourmaline, Citronellol, Biosaccharide Gum-1, Octyldodecanol, Cetyl Alcohol, Ethylparaben, Hexyl Cinnamal, Benzyl Alochol, Ci 14700 / Red 4, Ci 77891 / Titanium Dioxide.. (F.I.L. Z283405/1)', 'all', 50, 259000, 100, 1),
(14, 1, 4, 'Kem Dưỡng Ngày L\'Oréal Ngừa Lão Hóa SPF35 PA++', '14.jpg', 'Kem Dưỡng Ngày L\'Oréal Ngừa Lão Hóa Revitalift Day Cream SPF35 PA++ là kem dưỡng ban ngày chuyên biệt cho làn da lão hóa của thương hiệu mỹ phẩm L\'Oréal Paris, với công nghệ Dermalift độc đáo giúp làm săn chắc da, kết hợp cùng hoạt chất Pro-Retinol A giúp làm giảm nếp nhăn, mờ thâm sạm & đốm nâu, đẩy lùi các dấu hiệu lão hóa hiệu quả. Đặc biệt, sản phẩm có chỉ số chống nắng cao SPF35/PA++ sẽ giúp bảo vệ da trước tác hại của tia UV.', 'Aqua / Water, Glycerin, Ethylhexyl Salicylate, Niacinamide, Dimethicone, Alcohol Denat., Octocrylene, Butyl Methoxydibenzoylmethane, Isopropyl Isostearate, Phenylbenzimidazole Sulfonic Acid, C13-14 Isoparaffin, Peg-100 Stearate , Stearic Acid, Titanium Dioxide, Carbomer, Arachidyl Alcohol, PTFE, Behenyl Alcohol, Triethanolamine, Dimethiconol, Cetearyl Alcohol, Cetearyl Glucoside, Sodium Acrylates Copolymer, Alumina, Ammonium Polyacryldimethyltauramide / Ammonium Polyacryloyldimethyl Taurate, Disodium Edta, Disodium Stearoyl Glutamate, Hydrolyzed Elastin, Hydrolyzed Soy Protein, Caprylic / Caprictriglyceride, Capryloyl Salicylic Acid, Laureth-7, Acetyl Trifluoromethylphenyl Valylglycine, Panthenol, Faex Extract/ Yeast Extract, Polycarylamide, Cetyl Alcohol, Octyldodecanol, Retinyl Palmitate, Tocopheryl Acetate, Methylisothiazolinone, Methylparaben, Phenoxyethanol, CI 15510 / Orange 4, Linalool, Geraniol, Alpha-isomethyl Ionone, Coumarin, Limonene, Hydroxyisohexyl 3¨CCyclohexene Carboxaldehyde, Citronellol, Benzyl Alcohol, Benzyl Salicylate, Parfum / Fragrance.', 'all', 50, 328000, 50, 1),
(15, 1, 4, 'Kem Dưỡng L\'Oréal Paris Siêu Cấp Ẩm Căng Mịn Da ', '15.jpg', 'Kem Dưỡng L\'Oréal Paris Revitalift Hyaluronic Acid Plumping Day Cream là sản phẩm kem dưỡng da ban ngày mới ra mắt từ thương hiệu L\'Oréal Paris, với sự kết hợp không chỉ 1 mà đến 2 loại Hyaluronic Acid ưu việt ở nồng độ cao nhất, giúp hỗ trợ làm đầy các nếp nhăn và tái tạo làn da căng mọng. Bên cạnh đó, công thức kem dưỡng còn được làm giàu với chiết xuất thực vật Fibroxyl có đặc tính làm săn chắc da và làm giảm sự xuất hiện của các nếp nhăn. Với Revitalift, làn da của bạn sẽ có sự thay đổi rõ rệt, trở nên căng mọng, ẩm mượt và rạng rỡ hơn bao giờ hết.', 'Aqua / Water, Glycerin, Dimethicone, Isohexadecane, Silica, Hydroxyethylpiperazine Ethane Sulfonic Acid, Alcohol Denat., Dipropylene Glycol, Synthetic Wax, Ci 77163 / Bismuth Oxychloride, Ci 77891 / Titanium Dioxide, Secale Cereale Extract / Rye Seed Extract, Sodium Acrylates Copolymer, Sodium Hyaluronate, Phenoxyethanol, Adenosine, Peg-10 Dimethicone, Ethylhexyl Hydroxystearate, Nylon-12, Dimethicone/Peg-10/15 Crosspolymer, Dimethicone/Polyglycerin-3 Crosspolymer, Pentylene Glycol, Synthetic Fluorphlogopite, Benzyl Salicylate, Benzyl Alcohol, Linalool, Benzyl Benzoate, Caprylic/Capric Triglyceride, Caprylyl Glycol, Dipotassium Glycyrrhizate, Alpinia Galanga Leaf Extract, Disteardimonium Hectorite, Disodium Edta, Citronellol, Parfum / Fragrance. (F.I.L. B166675/2).', 'dry', 50, 298000, 100, 1),
(16, 1, 4, 'Kem Dưỡng L\'Oréal Paris Làm Sáng Da Ban Ngày', '16.jpg', 'Kem Dưỡng L\'Oréal Paris Aura Perfect Day Cream SPF19/PA++ với kết cấu mỏng nhẹ không nhờn sẽ là giải pháp dưỡng sáng lý tưởng dành cho ban ngày. Công thức chứa thành phần Melanin-Vanish giúp giảm đốm nâu và làm sáng da rõ rệt, cùng tinh thể đá quý Tourmaline hỗ trợ thúc đẩy quá trình tuần hoàn dưới da, mang lại làn da sáng hồng tự nhiên và tràn đầy sức sống. Bên cạnh đó, chỉ số chống nắng SPF19/PA++ giúp bảo vệ làn da trước tác hại của ánh nắng mặt trời, ngăn ngừa sạm nám trong tương lai.', 'Aqua / Water, Ethylhexyl Methoxycinnamate, Glycerin, Isohexadecane, Cyclohexasiloxane, Ammonium Polyacryldimethyltaumaride / Ammonium Polyacryloyldimethyl Taurate, Pentaerythrityl Tetraethylhexanoate, Titanium Dioxide, Peg-100 Stearate, Glyceryl Stearate, Diethylamino Hydroxybenzoyl, Hexyl Benzoate, Synthetic Wax, Stearic Acid, Potassium Cetyl Phosphate, Manganese Gluconate, Silica, Palmitic Acid, Aluminum Hydroxide, Phenylethyl Resorcinol, Ascorbyl Glucoside, Capryloyl Salicyclic Acid, Tetrasodium Edta, Citric Acid, Citrus Medica Limonum Extract/Lemon Fruit Extract, Tourmaline, Biosaccharide Gum-1, Cetyl Alcohol, Octyldodecanol Methylparaben, Phenoxyethanol Caprylyl Glycol, Ethylparaben, Ci 77891 / Titanium Dioxide, Linalool, Geraniol, Eugenol, Limonene, Citronellol, Butylphenyl Methylpropional, Hexyl Cinnamal,Benzyl Alcohol, Parfum / Fragrance. (Fil B42074/1)', 'normal', 50, 188000, 15, 1),
(17, 2, 7, 'Tẩy Tế Bào Chết Toàn Thân Cocoon Cà Phê Đắk Lắk', '17.jpg', 'Tẩy Da Chết Toàn Thân Cocoon Cà Phê Đắk Lắk là dòng tẩy tế bào chết toàn thân từ thương hiệu mỹ phẩm Cocoon của Việt Nam là một trong những sản phẩm với thành phần tự nhiên có nguồn gốc trong nước như hạt cà phê Đắk Lắk nguyên chất xay nhuyễn, hòa quyện cùng bơ cacao Tiền Giang giúp loại bỏ tế bào chết hiệu quả, làm đều màu da, mang lại năng lượng, giúp da trở nên mềm mại và rạng rỡ giúp mang đến cho bạn sản phẩm thuần chay tốt nhất với niềm tự hào từ nguyên liệu thuần Việt.', ' Aqua/Water, Coffea Arabica (coffee) Seed Powder, Cetearyl Alcohol, Cocos Nucifera (coconut) Oil, Cocamidopropyl Betaine, Glyceryl Stearate, C15-19 Alkane, Glycerin, Ceteareth-20, Ceteareth-12, Theobroma Cacao (Cocoa) Seed Butter, Butyrospermum Parkii (shea) butter, Cetyl Palmitate, Glycine Soja (soybean) Sterols, Phospholipids, Crosspolymer, Tocopheryl Acetate, Xanthan gum, Phenoxyethanol, Sodium Hydroxide, BHT, Ethylhexylglycerin, Trisodium Ethylenediamine Disuccinate.', 'all', 200, 100000, 300, 1),
(18, 2, 7, 'Túi Refill Tẩy Tế Bào Chết Toàn Thân Cocoon Sạch Da', '18.jpg', 'Túi Refill Tẩy Tế Bào Chết Toàn Thân Cocoon Sạch Da 600ml là dòng tẩy tế bào chết toàn thân từ thương hiệu mỹ phẩm Cocoon của Việt Nam là một trong những sản phẩm với thành phần tự nhiên có nguồn gốc trong nước như hạt cà phê Đắk Lắk nguyên chất xay nhuyễn, hòa quyện cùng bơ cacao Tiền Giang giúp loại bỏ tế bào chết hiệu quả, làm đều màu da, mang lại năng lượng, giúp da trở nên mềm mại và rạng rỡ giúp mang đến cho bạn sản phẩm thuần chay tốt nhất với niềm tự hào từ nguyên liệu thuần Việt.', 'Thành phần chi tiết: Aqua/Water, Coffea Arabica (coffee) Seed Powder, Cetearyl Alcohol, Cocos Nucifera (coconut) Oil, Cocamidopropyl Betaine, Glyceryl Stearate, C15-19 Alkane, Glycerin, Ceteareth-20, Ceteareth-12, Theobroma Cacao (Cocoa) Seed Butter, Butyrospermum Parkii (shea) butter, Cetyl Palmitate, Glycine Soja (soybean) Sterols, Phospholipids, Crosspolymer, Tocopheryl Acetate, Xanthan gum, Phenoxyethanol, Sodium Hydroxide, BHT, Ethylhexylglycerin, Trisodium Ethylenediamine Disuccinate.', 'all', 600, 255000, 1000, 1),
(19, 2, 7, 'Combo Tẩy Tế Bào Chết Toàn Thân Cocoon Cà Phê Đắk Lắk', '19.jpg', 'Tẩy Da Chết Toàn Thân Cocoon Cà Phê Đắk Lắk là dòng tẩy tế bào chết toàn thân từ thương hiệu mỹ phẩm Cocoon của Việt Nam là một trong những sản phẩm với thành phần tự nhiên có nguồn gốc trong nước như hạt cà phê Đắk Lắk nguyên chất xay nhuyễn, hòa quyện cùng bơ cacao Tiền Giang giúp loại bỏ tế bào chết hiệu quả, làm đều màu da, mang lại năng lượng, giúp da trở nên mềm mại và rạng rỡ giúp mang đến cho bạn sản phẩm thuần chay tốt nhất với niềm tự hào từ nguyên liệu thuần Việt.', 'Aqua/Water, Coffea Arabica (coffee) Seed Powder, Cetearyl Alcohol, Cocos Nucifera (coconut) Oil, Cocamidopropyl Betaine, Glyceryl Stearate, C15-19 Alkane, Glycerin, Ceteareth-20, Ceteareth-12, Theobroma Cacao (Cocoa) Seed Butter, Butyrospermum Parkii (shea) butter, Cetyl Palmitate, Glycine Soja (soybean) Sterols, Phospholipids, Crosspolymer, Tocopheryl Acetate, Xanthan gum, Phenoxyethanol, Sodium Hydroxide, BHT, Ethylhexylglycerin, Trisodium Ethylenediamine Disuccinate.', 'all', 400, 184000, 100, 1),
(20, 2, 7, 'Tẩy Da Chết Toàn Thân Cocoon Đường Thốt Nốt An Giang', '20.jpg', 'Tẩy Da Chết Cơ Thể Cocoon Đường Thốt Nốt An Giang là sản phẩm tẩy tế bào chết toàn thân đến từ thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam, với tinh thể đường thốt nốt mềm mịn từ vùng đất An Giang kết hợp cùng dưỡng chất vitamin B5 và dầu mắc-ca giúp nhẹ nhàng lấy đi các tế bào chết sần sùi mang đến làn da mềm mịn, sáng mượt và khỏe khoắn.', 'Sucrose, Borassus Flabellifer Sap, Aqua/Water, Panthenol, Carthamus Tinctorius (Safflower) Seed Oil, Macadamia Integrifolia Seed Oil, Argania Spinosa Kernel Oil, Cocos Nucifera (Coconut) Oil, Olea Europaea (Olive) Fruit Oil, Oryza Sativa (Rice) Bran Oil, Ethylhexylglycerin, Tocopherol, Magnesium Aluminum Silicate, Citrus Aurantium Dulcis (Orange) Peel Oil, Mentha Piperita Oil, Cymbopogon Citratus Leaf Oil, Parfum, BHT, Caramel, Phenoxyethanol', 'all', 200, 130000, 50, 1),
(21, 2, 7, 'Tẩy Tế Bào Chết Toàn Thân Cocoon Bản Giới Hạn Con Voi', '21.jpg', 'Tẩy Tế Bào Chết Toàn Thân Cocoon Bản Giới Hạn Con Voi 200ml là dòng tẩy tế bào chết toàn thân từ thương hiệu mỹ phẩm Cocoon của Việt Nam là một trong những sản phẩm với thành phần tự nhiên có nguồn gốc trong nước như hạt cà phê Đắk Lắk nguyên chất xay nhuyễn, hòa quyện cùng bơ cacao Tiền Giang giúp loại bỏ tế bào chết hiệu quả, làm đều màu da, mang lại năng lượng, giúp da trở nên mềm mại và rạng rỡ giúp mang đến cho bạn sản phẩm thuần chay tốt nhất với niềm tự hào từ nguyên liệu thuần Việt.', 'Aqua/Water, Coffea Arabica (coffee) Seed Powder, Cetearyl Alcohol, Cocos Nucifera (coconut) Oil, Cocamidopropyl Betaine, Glyceryl Stearate, C15-19 Alkane, Glycerin, Ceteareth-20, Ceteareth-12, Theobroma Cacao (Cocoa) Seed Butter, Butyrospermum Parkii (shea) butter, Cetyl Palmitate, Glycine Soja (soybean) Sterols, Phospholipids, Crosspolymer, Tocopheryl Acetate, Xanthan gum, Phenoxyethanol, Sodium Hydroxide, BHT, Ethylhexylglycerin, Trisodium Ethylenediamine Disuccinate.', 'all', 200, 102000, 100, 1),
(22, 2, 4, 'Thạch Bí Đao Cocoon Cung Cấp Ẩm Và Ngăn Ngừa Mụn', '22.jpg', 'Thạch Bí Đao Cocoon Cung Cấp Ẩm Và Ngăn Ngừa Mụn là sản phẩm kem dưỡng da đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, với sự kết hợp giữa chiết xuất bí đao thanh mát, 5α-AVOCUTA® được chưng cất phân tử từ dầu quả bơ và TECA™ trích ly từ rau má, mang lại độ ẩm cân bằng, giảm lượng dầu thừa và cải thiện tình trạng mụn. Kết cấu mỏng nhẹ tan nhanh vào da tạo cảm giác thông thoáng, dễ chịu không gây nặng mặt hay bí bách trên da.', 'Aqua/Water, Niacinamide, Butyl Avocadate, Butylene Glycol, Sodium Acrylates Copolymer, Betaine, Benincasa Cerifera Fruit Extract, Glycerin, Propanediol, Madecassic Acid, Asiatic Acid, Asiaticoside, Centella Asiatica Extract, Pentylene Glycol, Ferulic Acid, Potassium Azeloyl Diglycinate, Oleyl Erucate, Coco-Caprylate/Caprate, Dicaprylyl Carbonate, Epilobium Angustifolium Flower/Leaf/Stem Extract, Caprylic/Capric Triglyceride, Aloe Barbadensis Leaf Juice, Bisabolol, Glycereth-26, Lecithin, Phellodendron Amurense Bark Extract, Allantoin, Ethylhexylglycerin, Tocopherol, Hydroxyacetophenone, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol, Melaleuca Alternifolia Leaf Oil, Rosmarinus Officinalis Leaf Oil.', 'all', 30, 175000, 1000, 1),
(23, 2, 4, 'Thạch Bí Đao Cocoon Cung Cấp Ẩm Và Ngăn Ngừa Mụn', '23.jpg', 'Thạch Bí Đao Cocoon Cung Cấp Ẩm Và Ngăn Ngừa Mụn là sản phẩm kem dưỡng da đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, với sự kết hợp giữa chiết xuất bí đao thanh mát, 5α-AVOCUTA® được chưng cất phân tử từ dầu quả bơ và TECA™ trích ly từ rau má, mang lại độ ẩm cân bằng, giảm lượng dầu thừa và cải thiện tình trạng mụn. Kết cấu mỏng nhẹ tan nhanh vào da tạo cảm giác thông thoáng, dễ chịu không gây nặng mặt hay bí bách trên da.', 'Aqua/Water, Niacinamide, Butyl Avocadate, Butylene Glycol, Sodium Acrylates Copolymer, Betaine, Benincasa Cerifera Fruit Extract, Glycerin, Propanediol, Madecassic Acid, Asiatic Acid, Asiaticoside, Centella Asiatica Extract, Pentylene Glycol, Ferulic Acid, Potassium Azeloyl Diglycinate, Oleyl Erucate, Coco-Caprylate/Caprate, Dicaprylyl Carbonate, Epilobium Angustifolium Flower/Leaf/Stem Extract, Caprylic/Capric Triglyceride, Aloe Barbadensis Leaf Juice, Bisabolol, Glycereth-26, Lecithin, Phellodendron Amurense Bark Extract, Allantoin, Ethylhexylglycerin, Tocopherol, Hydroxyacetophenone, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol, Melaleuca Alternifolia Leaf Oil, Rosmarinus Officinalis Leaf Oil.', 'all', 100, 308000, 1000, 1),
(24, 2, 4, 'Kem Dưỡng Cocoon Dưỡng Ẩm Dạng Thạch Từ Hoa Hồng', '24.jpg', 'Kem Dưỡng Cocoon Dưỡng Ẩm Dạng Thạch Từ Hoa Hồng là dòng kem dưỡng da đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, chiết xuất từ nước hoa hồng hữu cơ kết hợp với thành phần dưỡng ẩm Pentavitin, các Axit Amin và Hyaluronic Acid, giúp nuôi dưỡng và khóa ẩm suốt 24 giờ, mang lại làn da mềm mượt và mịn màng, hỗ trợ se khít lỗ chân lông và làm đầy đặn da.\r\n\r\n', 'Aqua/Water, Rosa Damascena Flower Water, Dicaprylyl Carbonate, Hydroxyethyl Ac Rylate/Sodium Acryloyldimethyl Taurate Copolymer, Betaine, Olus Oil, Oleyl Erucate, Coco-Caprylate/Caprate, Caprylic/Capric Triglyceride, Propanediol, Glyc Erin, Sodium Hyaluronate, Panthenol, Bisabolol, Alanine, Arginine, Glycine, Histidine, Proline, Serine, Isoleucine, Threonine, Phenylalanine, Valine, Pca, Sodium Pca, Aspar Tic Acid, Argania Spinosa Kernel Oil, Xylitol, Allantoin, Tocopherol, Anhydroxylitol, Butylene Glycol, Saccharide Isomerate, Xylitylglucoside, Sodium Lactate, Bis-Peg-18 Methyl Ether Dimethyl Silane, Ethylhexylglycerin, Xanthan Gum, Caramel, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol, Farnesol, Lactic Acid\r\n\r\n', 'all', 30, 156000, 1000, 1),
(25, 2, 4, 'Kem Dưỡng Cocoon Dưỡng Ẩm Dạng Thạch Từ Hoa Hồng', '25.jpg', 'Kem Dưỡng Cocoon Dưỡng Ẩm Dạng Thạch Từ Hoa Hồng là dòng kem dưỡng da đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, chiết xuất từ nước hoa hồng hữu cơ kết hợp với thành phần dưỡng ẩm Pentavitin, các Axit Amin và Hyaluronic Acid, giúp nuôi dưỡng và khóa ẩm suốt 24 giờ, mang lại làn da mềm mượt và mịn màng, hỗ trợ se khít lỗ chân lông và làm đầy đặn da.', 'Aqua/Water, Rosa Damascena Flower Water, Dicaprylyl Carbonate, Hydroxyethyl Ac Rylate/Sodium Acryloyldimethyl Taurate Copolymer, Betaine, Olus Oil, Oleyl Erucate, Coco-Caprylate/Caprate, Caprylic/Capric Triglyceride, Propanediol, Glyc Erin, Sodium Hyaluronate, Panthenol, Bisabolol, Alanine, Arginine, Glycine, Histidine, Proline, Serine, Isoleucine, Threonine, Phenylalanine, Valine, Pca, Sodium Pca, Aspar Tic Acid, Argania Spinosa Kernel Oil, Xylitol, Allantoin, Tocopherol, Anhydroxylitol, Butylene Glycol, Saccharide Isomerate, Xylitylglucoside, Sodium Lactate, Bis-Peg-18 Methyl Ether Dimethyl Silane, Ethylhexylglycerin, Xanthan Gum, Caramel, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol, Farnesol, Lactic Acid', 'all', 100, 308000, 1000, 1),
(26, 2, 4, 'Kem Dưỡng Cocoon Sáng Da Dạng Thạch Từ Nghệ Hưng', '26.jpg', 'Kem Dưỡng Cocoon Sáng Da Dạng Thạch Từ Nghệ Hưng Yên là sản phẩm kem dưỡng đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, chứa các dưỡng chất gồm chiết xuất Nghệ, Curcuminoid, Hexylresorcinol và Niacinamide có công dụng dưỡng sáng, đều màu da, làm mờ các vết thâm do mụn để lại. Ngoài ra sản phẩm giúp da mềm mại, ẩm mượt trông thấy. ', 'Aqua/Water, Coco-Caprylate/Caprate, Dicaprylyl Carbonate, Butylene Glycol, Sodium Acrylates Copolymer, Niacinamide, Betaine, Glycereth-26, Oleyl Erucate, Hexylresorcinol, Tetrahydrodiferuloylmethane,Tetrahydrodemethoxydiferuloylmethane, Tetrahydrobisdemethoxydiferuloylmethane, Curcuma Longa (Turmeric) Root Extract, Curcuma Longa (Turmeric) Root Oil, Curcuma Longa (Turmeric) Root Powder, Tetrahexyldecyl Ascorbate, Ferulic Acid, Glycerin, Propanediol, Pentylene Glycol, Caprylic/Capric Triglyceride, Daucus Carota Sativa (Carrot) Root Extract, Lecithin, Glycine Soja (Soybean) Oil, Allantoin, Beta-Carotene, Ethylhexylglycerin, Tocopherol, Hydroxyacetophenone, Trisodium Ethylenediamine Disuccinate, Caramel, Phenoxyethanol, Sodium Benzoate, Potassium Sorbate.', 'all', 30, 155000, 100, 1),
(27, 2, 4, 'Kem Dưỡng Cocoon Sáng Da Dạng Thạch Từ Nghệ Hưng', '27.jpg', 'Kem Dưỡng Cocoon Sáng Da Dạng Thạch Từ Nghệ Hưng Yên là sản phẩm kem dưỡng đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, chứa các dưỡng chất gồm chiết xuất Nghệ, Curcuminoid, Hexylresorcinol và Niacinamide có công dụng dưỡng sáng, đều màu da, làm mờ các vết thâm do mụn để lại. Ngoài ra sản phẩm giúp da mềm mại, ẩm mượt trông thấy. ', 'Aqua/Water, Coco-Caprylate/Caprate, Dicaprylyl Carbonate, Butylene Glycol, Sodium Acrylates Copolymer, Niacinamide, Betaine, Glycereth-26, Oleyl Erucate, Hexylresorcinol, Tetrahydrodiferuloylmethane,Tetrahydrodemethoxydiferuloylmethane, Tetrahydrobisdemethoxydiferuloylmethane, Curcuma Longa (Turmeric) Root Extract, Curcuma Longa (Turmeric) Root Oil, Curcuma Longa (Turmeric) Root Powder, Tetrahexyldecyl Ascorbate, Ferulic Acid, Glycerin, Propanediol, Pentylene Glycol, Caprylic/Capric Triglyceride, Daucus Carota Sativa (Carrot) Root Extract, Lecithin, Glycine Soja (Soybean) Oil, Allantoin, Beta-Carotene, Ethylhexylglycerin, Tocopherol, Hydroxyacetophenone, Trisodium Ethylenediamine Disuccinate, Caramel, Phenoxyethanol, Sodium Benzoate, Potassium Sorbate.', 'all', 100, 327000, 1000, 1),
(28, 2, 3, 'Serum Bí Đao Cocoon Làm Giảm Mụn, Mờ Thâm', '28.jpg', 'Tinh Chất Bí Đao Cocoon Winter Melon Serum 70ml là dòng sản phẩm chăm sóc da mụn của thương hiệu mỹ phẩm thuần chay Cocoon xuất xứ Việt Nam. Sản phẩm chứa các thành phần từ thực vật làm chủ đạo gồm chiết xuất bí đao, rau má, tràm trà và được bổ sung thêm 7% Niacinamide (vitamin B3) giúp hỗ trợ phục hồi tình trạng da mụn viêm và ửng đỏ hiệu quả, mang lại làn da thông thoáng và sáng mịn màng.', 'Aqua/Water, Niacinamide, Salicylic Acid, Cocamidopropyl Dimethylamine, Benincasa Cerifera Fruit Extract, Centella Asiatica Extract, Butylene Glycol, Pentylene Glycol, Bisabolol, Zinc PCA, Phellodendron Amurense Bark Extract, Glycereth-26, Bis-PEG-18 Methyl Ether Dimethyl Silane, Melaleuca Alternifolia Leaf Oil, Lavandula Angustifolia Flower Oil, Rosmarinus Officinalis Leaf Oil, Phenoxyethanol, Trisodium Ethylenediamine Disuccinate, Ethylhexylglycerin, Farnesol.', 'all', 70, 238000, 1000, 1),
(29, 2, 3, 'Serum Cocoon Chiết Xuất Từ Nghệ Hưng Yên ', '29.jpg', 'Tinh Chất Cocoon Chiết Xuất Từ Nghệ Hưng Yên 30ml là dòng tinh chất dưỡng da đến từ thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam, với thành phần dầu nghệ chiết xuất từ củ nghệ Hưng Yên rất giàu turmerone, được xé nhỏ và lơ lửng trong một hỗn hợp kết cấu mọng nước chứa 5% vitamin C (3-O-Ethyl Ascorbic Acid), 4% vitamin B3 và 2% NAG. Sản phẩm có tác dụng làm sáng, làm mờ vết thâm sạm, cung cấp độ ẩm, tăng cường độ đàn hồi, săn chắc đồng thời có khả năng chống oxy hoá cao và ngăn ngừa lão hoá.', 'Aqua/Water,  3-O-Ethyl Ascorbic Acid, Caprylic/Capric/Succinic Triglyceride, Niacinamide, Potassium Azeloyl Diglycinate, Acetyl Glucosamine, Dimethyl Isosorbide, 1-Methylhydantoin-2-Imide, Propanediol, Curcuma Longa (Turmeric) Root Oil, Curcuma Longa (Turmeric) Root Extract, Daucus Carota Sativa (Carrot) Root Extract, Betaine, Glycerin, Hydroxyacetophenone, Butylene Glycol, Beta-Carotene, Glycine Soja (Soybean) Oil, Tocopherol, Xanthan Gum, Ethylhexylglycerin, Sodium Chloride, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol.', 'all', 30, 292000, 500, 1),
(30, 2, 3, 'Serum Cocoon Nghệ Hưng Yên x2.2 Sáng Da Chuyên Sâu', '30.jpg', 'Tinh Chất Cocoon Nghệ Hưng Yên x2.2 Sáng Da Chuyên Sâu 30ml là sản phẩm tinh chất đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, vận dụng nguồn năng lượng dồi dào từ củ nghệ Hưng Yên và các thành phần hoạt tính nổi bật gồm 22% Vitamin C, 1% Hexylresorcinol, 4% Niacinamide và 2% NAG giúp làm sáng các làn da ngăm đen, tối màu, cháy nắng, có tác dụng tốt trên vết thâm đậm và vết thâm đỏ do mụn để lại, chống oxy hóa giúp ngăn ngừa lão hoá da, cải thiện bề mặt giúp da trở nên mịn màng, căng bóng.', 'Aqua/Water, 3-O-Ethyl Ascorbic Acid, Propanediol, Niacinamide, Acetyl Glucosamine, Dimethyl Isosorbide, Hexylresorcinol, Glycerin, Betaine, Ethoxydiglycol, Butylene Glycol, Pentylene Glycol, Curcuma Longa (Turmeric) Root Extract, Ferulic Acid, Potassium Azeloyl Diglycinate, Trisodium Ethylenediamine Disuccinate, Sodium Benzoate, Potassium Sorbate.', 'all', 30, 371000, 1000, 1),
(31, 2, 4, 'Serum Cocoon Cấp Nước & Cấp Ẩm Sâu Từ Hoa Hồng', '31.jpg', 'Tinh Chất Cocoon Cấp Nước & Cấp Ẩm Sâu Từ Hoa Hồng 30ml dòng tinh chất dưỡng da đến từ thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam, kết hợp những hoạt chất như 5% Vitamin B5, 5% Betaine, 5% Urea, Ectoin & HA, tinh chất hoa hồng cung cấp ẩm dồi dào giúp dưỡng ẩm sâu, phục hồi những tổn thương do sự mất nước gây ra. Làn da sau khi ngậm nước sẽ nhanh chóng trở nên tươi mới, căng mọng và ẩm mượt như được phủ sương', 'Aqua/Water, Rosa Damascena Flower Water, Panthenol, Betaine, Hydroxyethyl Urea, Biosaccharide Gum-1, Arginine,  Glycine, Alanine, Serine, Valine, Proline, Threonine, Isoleucine, Histidine, Phenylalanine,  Aspartic Acid, PCA, Sodium PCA, Rosa Damascena Extract, Ectoin, Sodium Hyaluronate, Hydrolyzed Hyaluronic Acid, Saccharide Isomerate, Aloe Barbadensis Leaf Juice, Allantoin, Glycerin, Propanediol, Glycereth-26, Pentylene Glycol, Butylene Glycol, Xylitol, Hydroxyacetophenone, Xylitylglucoside, Ethylhexylglycerin, Anhydroxylitol, Hydroxyethylcellulose, Xanthan Gum, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol, Sodium Lactate.', 'all', 30, 212000, 1000, 1),
(32, 2, 5, 'Gel Rửa Mặt Bí Đao Cocoon Làm Giảm Dầu & Mụn ', '32.jpg', 'Gel Bí Đao Rửa Mặt Cocoon Winter Melon Cleanser là sản phẩm sữa rửa mặt độc đáo đến từ thương hiệu mỹ phẩm Việt Nam Cocoon, được chiết xuất từ thành phần tự nhiên phù hợp với làn da dầu mụn như bí đao, rau má, tràm trà... Công thức dạng gel tạo bọt nhẹ nhàng nhưng lại có khả năng làm sạch sâu, ngăn ngừa các tác nhân gây mụn, đặc biệt là mụn ẩn dưới da, mang đến cho sự ẩm mịn tự nhiên cùng cảm giác vô cùng tươi mới và sạch sẽ. Độ pH 5.5 cân bằng lý tưởng, an toàn cho làn da dầu, mụn & nhạy cảm.', 'Water/Aqua, Potassium Laureth Phosphate, Cocamidopropyl Betaine, Acrylates/Steareth-20 Methacrylate Copolymer, Sodium Cocoyl Glycinate, Cocoyl Methyl Glucamide, PEG-7-Glyceryl Cocoate, Glycerin, Benincasa Cerifera (Bí đao) Fruit Extract, Salicylic Acid, Niacinamide (Vitamin B3), Panthenol (Vitamin B5), Centella Asiatica Extract (Rau má), Betaine, Propanediol, Butylene Glycol, PEG-120 Methyl Glucose Dioleate, Molasses, Glycereth-26, Sodium Lactate, Sodium Hydroxide, Polysorbate 20, Melaleuca Alternifolia (Tràm trà) Leaf Oil, Rosmarinus Officinalis (Hương thảo) Leaf Oil, Lavandula Angustifolia (Oải hương) Flower Oil, Allantoin, Ethylhexylglycerin, Phenoxyethanol, Xanthan gum, Menthyl Lactate, Sodium Phytate, Alcohol (0.01% - là dung môi trong hoạt chất càng hóa nước cứng, bắt các icon kim loại, bảo vệ sản phầm khỏi tác nhân oxi hóa).', 'all', 310, 236000, 1000, 1),
(33, 2, 5, 'Sữa Rửa Mặt Cocoon Chiết Xuất Từ Nghệ Hưng Yên ', '33.jpg', 'Sữa Rửa Mặt Cocoon Chiết Xuất Từ Nghệ Hưng Yên là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam, với công thức dịu nhẹ không sulfate và thành phần chính từ nghệ của vùng đất Hưng Yên, cà rốt và nồng độ 4% AHA nhẹ nhàng loại bỏ các bụi bẩn, tế bào chết, cấp ẩm và làm mềm da giúp da sáng mịn, đều màu.', 'Aqua/Water, Disodium Cocoyl Glutamate, Potassium Laureth Phosphate, Sodium Laurylglucosides Hydroxypropylsulfonate, Lactic Acid, Glycerin, Polysorbate 20, PEG-120 Methyl Glucose Dioleate, Cetearyl Alcohol, Curcuma Longa (Turmeric) Root Extract, Glycolic Acid, Beta-Carotene, Daucus Carota Sativa (Carrot) Root Extract, Betaine, Allantoin, Propanediol, Glycereth-26, Cocoyl Methyl Glucamide, Ethylhexylglycerin, Xanthan Gum, Tocopherol, Glycine Soja (Soybean) Oil, Trisodium Ethylenediamine Disuccinate, Sodium Benzoate, Eucalyptus Globulus Leaf Oil,  Potassium Sorbate, Phenoxyethanol.\r\n\r\n', 'all', 140, 175000, 500, 1),
(34, 2, 5, 'Sữa Rửa Mặt Cocoon Chiết Xuất Từ Nghệ Hưng Yên', '34.jpg', 'Sữa Rửa Mặt Cocoon Chiết Xuất Từ Nghệ Hưng Yên là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam, với công thức dịu nhẹ không sulfate và thành phần chính từ nghệ của vùng đất Hưng Yên, cà rốt và nồng độ 4% AHA nhẹ nhàng loại bỏ các bụi bẩn, tế bào chết, cấp ẩm và làm mềm da giúp da sáng mịn, đều màu.', 'Aqua/Water, Disodium Cocoyl Glutamate, Potassium Laureth Phosphate, Sodium Laurylglucosides Hydroxypropylsulfonate, Lactic Acid, Glycerin, Polysorbate 20, PEG-120 Methyl Glucose Dioleate, Cetearyl Alcohol, Curcuma Longa (Turmeric) Root Extract, Glycolic Acid, Beta-Carotene, Daucus Carota Sativa (Carrot) Root Extract, Betaine, Allantoin, Propanediol, Glycereth-26, Cocoyl Methyl Glucamide, Ethylhexylglycerin, Xanthan Gum, Tocopherol, Glycine Soja (Soybean) Oil, Trisodium Ethylenediamine Disuccinate, Sodium Benzoate, Eucalyptus Globulus Leaf Oil,  Potassium Sorbate, Phenoxyethanol.', 'all', 310, 235000, 1000, 1),
(35, 2, 5, 'Gel Rửa Mặt Cocoon Chiết Xuất Từ Hoa Hồng', '35.jpg', 'Gel Rửa Mặt Cocoon Chiết Xuất Từ Hoa Hồng 140ml là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam, thành phần kết hợp từ chiết xuất hoa hồng và nước cất hoa hồng hữu cơ, bổ sung thêm hoạt chất dưỡng ẩm bentaine và allantoin. Với công thức dịu nhẹ không chứa sulfate, đây là sản phẩm rửa mặt lý tưởng giúp làm sạch sâu bụi bẩn mà không gây cảm giác khô căng đem đến làn da mềm mại, mịn mượt.', 'Aqua/Water, Sodium Cocoyl Glycinate, Disodium Laureth Sulfosuccinate, Cocamidopropyl Betaine, Glycerin, Rosa Damascena Flower Water, Coco-Glucoside, PEG-120 Methyl Glucose Triisostearate, Cocoyl Methyl Glucamide, Sodium PEG-7 Olive Oil Carboxylate, PEG-7 Glyceryl Cocoate, Rosa Damascena Extract, Betaine, Propanediol, Glycereth-26, Allantoin, Butylene Glycol, PEG-120 Methyl Glucose Dioleate, Ethylhexylglycerin, Trisodium Ethylenediamine Disuccinate, Citric Acid, Phenoxyethanol, Caramel.', 'all', 140, 175000, 3000, 1),
(36, 2, 5, 'Gel Rửa Mặt Cocoon Cà Phê Đắk Lắk Cho Làn Da Tươi Mới', '36.jpg', 'Gel Rửa Mặt Cocoon Cà Phê Đắk Lắk Cho Làn Da Tươi Mới 140ml là sản phẩm sữa rửa mặt đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, với công thức dịu nhẹ không chứa sulfate, có khả năng làm sạch hiệu quả mà không gây khô da, mang lại cảm giác sảng khoái cùng một làn da tươi mới, sạch thoáng và trông tràn đầy sinh lực để bắt đầu một ngày mới.', 'Aqua/Water, Coffea Robusta Seed Extract, Sodium Cocoyl Glycinate, Sodium Cocoyl Isethionate, Cocamidopropyl Betaine, Glycerin, Peg-7 Glyceryl Cocoate, Peg-120 Methyl Glucose Triisostearate, Polyquaternium-39, Coffea Arabica Seed Oil, Caffeine, Sodium Pca, Pca, Arginine, Glycine, Alanine, Aspartic Acid, Serine, Valine, Proline, Threonine, Ethylhexylglycerin, Isoleucine, Sodium Lactate, Histidine, Phenylalanine, Hydroxypropyl Starch Phosphate, Maltodextrin, Xanthan Gum, Hydroxyethylcellulose, Polysorbate 20, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol, Menthyl Lactate', 'all', 140, 155000, 200, 1),
(37, 2, 6, 'Nước Cân Bằng Cocoon Chiết Xuất Bí Đao', '37.jpg', 'Là bước tiếp nối sau khi dùng Gel Bí Đao Rửa Mặt Cocoon Winter Melon Cleanser, nước bí đao Cocoon với công thức không chứa cồn cùng thành phần giàu các chiết xuất tự nhiên bao gồm chiết xuất bí đao, chiết xuất rau má và tinh dầu tràm trà sẽ giúp cân bằng độ pH cho da, làm sạch sâu lỗ chân lông, giảm dầu thừa và mụn ẩn dưới da hiệu quả. Ngoài ra sản phẩm còn được bổ sung thêm Vitamin B3, HA và chiết xuất cam thảo cung cấp độ ẩm giúp da luôn mịn màng và giảm thiểu các vết đỏ trên da. Nước Bí Đao Cân Bằng Da Cocoon Winter Melon Toner sẽ là sự lựa chọn tuyệt vời cho những làn da dầu bị mụn.', 'Water, Niacinamide, Benincasa Cerifera Fruit Extract, Propanediol, Glycerin, Betaine, Glycereth-26, Centella Asiatica Extract, Allantoin, Dipotassium Glycyrrhizate, Butylene Glycol, Pentylene Glycol, Sodium Hyaluronate, Zinc Pca, Melaleuca Alternifolia Leaf Oil, Rosmarinus Officinalis Leaf Oil (Hương thảo), Lavandula Angustifolia Flower Oil (Oải hương), Sodium Lactate, Sodium Gluconate, PEG-40 Hydrogenated Castor Oil, Menthyl Lactate, Xanthan gum, Phenoxyethanol, Ethylhexylglycerin.', 'all', 310, 236000, 1000, 1),
(38, 2, 6, 'Nước Cân Bằng Cocoon Chiết Xuất Bí Đao', '38.jpg', 'Là bước tiếp nối sau khi dùng Gel Bí Đao Rửa Mặt Cocoon Winter Melon Cleanser, nước bí đao Cocoon với công thức không chứa cồn cùng thành phần giàu các chiết xuất tự nhiên bao gồm chiết xuất bí đao, chiết xuất rau má và tinh dầu tràm trà sẽ giúp cân bằng độ pH cho da, làm sạch sâu lỗ chân lông, giảm dầu thừa và mụn ẩn dưới da hiệu quả. Ngoài ra sản phẩm còn được bổ sung thêm Vitamin B3, HA và chiết xuất cam thảo cung cấp độ ẩm giúp da luôn mịn màng và giảm thiểu các vết đỏ trên da. Nước Bí Đao Cân Bằng Da Cocoon Winter Melon Toner sẽ là sự lựa chọn tuyệt vời cho những làn da dầu bị mụn.', 'Water, Niacinamide, Benincasa Cerifera Fruit Extract, Propanediol, Glycerin, Betaine, Glycereth-26, Centella Asiatica Extract, Allantoin, Dipotassium Glycyrrhizate, Butylene Glycol, Pentylene Glycol, Sodium Hyaluronate, Zinc Pca, Melaleuca Alternifolia Leaf Oil, Rosmarinus Officinalis Leaf Oil (Hương thảo), Lavandula Angustifolia Flower Oil (Oải hương), Sodium Lactate, Sodium Gluconate, PEG-40 Hydrogenated Castor Oil, Menthyl Lactate, Xanthan gum, Phenoxyethanol, Ethylhexylglycerin.', 'all', 140, 175000, 1000, 1),
(39, 2, 6, 'Nước Cân Bằng Da Cocoon Chiết Xuất Hoa Hồng', '39.jpg', 'Nước Cân Bằng Da Cocoon Chiết Xuất Hoa Hồng Rose Water Toner with Organic Rose Water & HA 140ml là dòng nước hoa hồng đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, bổ sung Vitamin B3, HA và chiết xuất cam thảo giúp cung cấp độ ẩm cần thiết cho da và giảm các tình trạng tấy đỏ do mụn sưng, mụn viêm gây ra. Đặc biệt, sản phẩm chứa công thức không chứa cồn và có tác dụng cân bằng độ pH, giảm dầu, làm sạch lỗ chân lông, cải thiện tình trạng mụn ẩn đáng kể. ', 'Aqua/Water, Rosa Damascena Flower Water, Glycerin,1,2-Hexanediol, Butylene Glycol, Sodium Hyaluronate, betaine, Glycine, Alanine, Histidine, Valine, Serine, Proline, Threonine, Isoleucine, Arginine, Phenylalanine, Sodium PCA, Aspartic Acid, PCA, Xylitol, Xylitylglucoside, Anhydroxylitol, Rosa Damascena Flower, Saccharide Isomerate, Sodium Gluconate, Propanediol, Sodium Lactate, Panthenol, Pentylene Glycol, Polysorbate 20, Xanthan Gum, Ethylhexylglycerin, PEG-40 Hydrogenated Castor Oil, Trisodium Ethylenediamine Disuccinate, Caramel, Phenoxyethanol\r\n\r\n', 'all', 140, 156000, 1000, 1),
(40, 2, 6, 'Nước Hoa Hồng Cocoon Chiết Xuất Từ Nghệ Hưng Yên', '40.jpg', 'Nước Hoa Hồng Cocoon Chiết Xuất Từ Nghệ Hưng Yên là dòng toner đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, với thành phần chính từ nghệ của vùng đất Hưng Yên 100% thuần chay giàu curcumin kết hợp cùng 5% AHA và hoạt chất dưỡng ẩm Betaine giúp làm sạch các lớp sừng, tế bào chết, cung cấp độ ẩm cho làn da mềm mại và sáng mịn. Ngoài ra, sản phẩm có khả năng chống oxy hoá, hỗ trợ kháng viêm và làm lành các vết thương nhanh chóng', 'Aqua/Water, Lactic Acid, Glycerin, Propanediol, Sodium Hydroxide, Curcuma Longa (Turmeric) Root Extract, Glycolic Acid, Betaine, Allantoin, Pentylene Glycol, Hydroxyacetophenone, Bis-PEG-18 Methyl Ether Dimethyl Silane, PEG-40 Hydrogenated Castor Oil, Xanthan Gum, Trisodium Ethylenediamine Disuccinate, Curcuma Longa (Turmeric) Root Oil, Sodium Benzoate, Potassium Sorbate.', 'all', 310, 265000, 1000, 1),
(41, 2, 6, 'Nước Hoa Hồng Cocoon Chiết Xuất Từ Nghệ Hưng Yên', '41.jpg', 'Nước Hoa Hồng Cocoon Chiết Xuất Từ Nghệ Hưng Yên là dòng toner đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, với thành phần chính từ nghệ của vùng đất Hưng Yên 100% thuần chay giàu curcumin kết hợp cùng 5% AHA và hoạt chất dưỡng ẩm Betaine giúp làm sạch các lớp sừng, tế bào chết, cung cấp độ ẩm cho làn da mềm mại và sáng mịn. Ngoài ra, sản phẩm có khả năng chống oxy hoá, hỗ trợ kháng viêm và làm lành các vết thương nhanh chóng', 'Aqua/Water, Lactic Acid, Glycerin, Propanediol, Sodium Hydroxide, Curcuma Longa (Turmeric) Root Extract, Glycolic Acid, Betaine, Allantoin, Pentylene Glycol, Hydroxyacetophenone, Bis-PEG-18 Methyl Ether Dimethyl Silane, PEG-40 Hydrogenated Castor Oil, Xanthan Gum, Trisodium Ethylenediamine Disuccinate, Curcuma Longa (Turmeric) Root Oil, Sodium Benzoate, Potassium Sorbate.', 'all', 140, 165000, 1000, 1),
(42, 3, 8, 'Sữa Tắm & Rửa Mặt La Roche-Posay Cho Da Khô Nhạy Cảm', '42.jpg', 'Sữa Rửa Mặt Và Tắm La Roche-Posay Lipikar Syndet AP+ có công thức chứa 10% Glycerin, chiết xuất bơ hạt mỡ và Niacinamide giúp khôi phục hàng rào bảo vệ da khỏe mạnh, làm sạch sâu nhưng không làm tổn thương lớp biểu bì đang suy yếu hoặc bị khô của làn da. ', 'Aqua / Water, Glycerin, Sodium Laureth Sulfate, Peg-200 Hydrogenated Glyceryl Palmate, Coco-Betaine, Polysorbate 20, Peg-7 Glyceryl Cocoate, Niacinamide, Acrylates Copolymer, Butyrospermum Parkii Butter / Shea Butter, Citric Acid, Cocamide Mea, Disodium Edta, Mannose, Polyquaternium-11, Sodium Benzoate, Sodium Chloride, Sodium Hydroxide, Styrene/Acrylates Copolymer, Vitreoscilla Ferment', 'dry', 200, 398000, 100, 1),
(43, 3, 8, 'Gel Tắm La Roche-Posay Làm Sạch Và Bảo Vệ Da Nhạy Cảm', '43.jpg', 'Gel tắm làm sạch làm dịu và bảo vệ da nhạy cảm La Roche-Posay Lipikar Lavant Shower Gel là sản phẩm sữa tắm hằng ngày dạng gel của thương hiệu La Roche-Posay giúp nhẹ nhàng làm sạch, làm dịu và bảo vệ cho làn da nhạy cảm, phù hợp với cả trẻ em và trẻ sơ sinh. Công thức sản phẩm chứa Niacinamide giúp làm dịu & bơ hạt mỡ giúp khôi phục hàng rào bảo vệ của da, làm dịu các cảm giác khó chịu, đồng thời không gây mất cân bằng độ pH trên da.', 'Aqua / Water, Sodium Laureth Sulfate, Peg-200 Hydrogenated Glyceryl Palmate, Glycerin, Coco-Betaine, Polysorbate 20, Peg-7 Glyceryl Cocoate, Citric Acid, Cocamide Mea, Niacinamide, Parfum / Fragrance, Peg-55 Propylene Glycol Oleate, Peg-60 Hydrogenated Castor Oil, Peg-75 Shea Butter Glycerides, Polyquaternium-11, Ppg-5-Ceteth-20, Propylene Glycol, Prunus Amygdalus Dulcis Oil / Sweet Almond Oil, Sodium Benzoate, Sodium Chloride, Sodium Hydroxide.', 'all', 400, 398000, 1000, 1),
(45, 3, 4, 'Kem Dưỡng La Roche-Posay Làm Dịu, Hỗ Trợ Phục Hồi Da', '45.jpg', 'Kem Dưỡng La Roche-Posay Cicaplast Baume B5 Soothing Repairing Balm là sản phẩm kem dưỡng dành cho da nhạy cảm đến từ thương hiệu La Roche-Posay, giúp dưỡng ẩm và làm dịu tình trạng da kích ứng, tổn thương, hỗ trợ phục hồi làn da. Sản phẩm được khuyên dùng sau các liệu trình điều trị thẩm mỹ & kích ứng da nhẹ ở người lớn, trẻ em và trẻ sơ sinh.\r\n\r\n', 'Aqua/Water, Hydrogenated Polyisobutene, Dimethicone, Glycerin, Butyrospermum Parkii Butter/Shea Butter, Panthenol, Butylene Glycol, Aluminum Starch Octenylsuccinate, Propanediol, Cetyl Pef/PPG-10/1 Dimethicone, Tristearin, Zinc Gluconate, Madecassoside, Manganese Gluconate, Magnesium Sulfate, Disodium Edta, Copper Gluconate, Acetylated Glycol Stearate, Polyglyceryl-4 Isostearate, Sodium Benzonate, Phenoxyethanol, Chlorhexidine Digluconate, CI 77891 / Titanium Dioxide', 'all', 40, 292000, 1000, 1),
(46, 3, 4, 'Kem Dưỡng La Roche-Posay Làm Dịu, Hỗ Trợ Phục Hồi Da', '46.jpg', 'Kem Dưỡng La Roche-Posay Cicaplast Baume B5 Soothing Repairing Balm là sản phẩm kem dưỡng dành cho da nhạy cảm đến từ thương hiệu La Roche-Posay, giúp dưỡng ẩm và làm dịu tình trạng da kích ứng, tổn thương, hỗ trợ phục hồi làn da. Sản phẩm được khuyên dùng sau các liệu trình điều trị thẩm mỹ & kích ứng da nhẹ ở người lớn, trẻ em và trẻ sơ sinh.\r\n\r\n', 'Aqua/Water, Hydrogenated Polyisobutene, Dimethicone, Glycerin, Butyrospermum Parkii Butter/Shea Butter, Panthenol, Butylene Glycol, Aluminum Starch Octenylsuccinate, Propanediol, Cetyl Pef/PPG-10/1 Dimethicone, Tristearin, Zinc Gluconate, Madecassoside, Manganese Gluconate, Magnesium Sulfate, Disodium Edta, Copper Gluconate, Acetylated Glycol Stearate, Polyglyceryl-4 Isostearate, Sodium Benzonate, Phenoxyethanol, Chlorhexidine Digluconate, CI 77891 / Titanium Dioxide', 'all', 100, 507000, 1000, 1);
INSERT INTO `product` (`product_id`, `brand_id`, `product_type`, `product_name`, `img`, `info`, `ingredient`, `skin_type`, `volume`, `price`, `quantity`, `state`) VALUES
(47, 3, 2, 'Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu', '47.jpg', 'Kem Chống Nắng La Roche-Posay Anthelios Anti-Shine Gel-Cream Dry Touch Finish Mattifying Effect SPF50+ đến từ thương hiệu dược mỹ phẩm La Roche-Posay là sản phẩm kem chống nắng dành cho làn da dầu mụn, sở hữu công nghệ cải tiến XL-Protect cùng kết cấu kem gel dịu nhẹ & không nhờn rít, giúp ngăn ngừa tia UVA/UVB + tia hồng ngoại + tác hại từ ô nhiễm, bảo vệ toàn diện cho làn da luôn khỏe mạnh.', 'Aqua / Water, Homosalate, Silica, Octocrylene, Ethylhexyl Salicylate, Butyl Methoxydibenzoylmethane, Ethylhexyl Triazone, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Drometrizole Trisiloxane, Aluminum Starch Octenylsuccinate, Glycerin, Pentylene Glycol, Styrene/Acrylates Copolymer, Potassium Cetyl Phosphate, Dimethicone, Perlite, Propylene Glycol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Aluminum Hydroxide, P-Anisic Acid, Caprylyl Glycol, Disodium Edta, Inulin Lauryl Carbamate, Isopropyl Lauroyl Sarcosinate, Peg-8 Laurate, Phenoxyethanol, Scutellaria Baicalensis Extract / Scutellaria Baicalensis Root Extract, Silica Silylate, Stearic Acid, Stearyl Alcohol, Terephthalylidene Dicamphor Sulfonic Acid, Titanium Dioxide, Tocopherol, Triethanolamine, Xanthan Gum, Zinc Gluconate.', 'oil', 50, 424000, 3000, 1),
(48, 3, 2, 'Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu', '48.jpg', 'Kem Chống Nắng La Roche-Posay Anthelios Anti-Shine Gel-Cream Dry Touch Finish Mattifying Effect SPF50+ đến từ thương hiệu dược mỹ phẩm La Roche-Posay là sản phẩm kem chống nắng dành cho làn da dầu mụn, sở hữu công nghệ cải tiến XL-Protect cùng kết cấu kem gel dịu nhẹ & không nhờn rít, giúp ngăn ngừa tia UVA/UVB + tia hồng ngoại + tác hại từ ô nhiễm, bảo vệ toàn diện cho làn da luôn khỏe mạnh.', 'Aqua / Water, Homosalate, Silica, Octocrylene, Ethylhexyl Salicylate, Butyl Methoxydibenzoylmethane, Ethylhexyl Triazone, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Drometrizole Trisiloxane, Aluminum Starch Octenylsuccinate, Glycerin, Pentylene Glycol, Styrene/Acrylates Copolymer, Potassium Cetyl Phosphate, Dimethicone, Perlite, Propylene Glycol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Aluminum Hydroxide, P-Anisic Acid, Caprylyl Glycol, Disodium Edta, Inulin Lauryl Carbamate, Isopropyl Lauroyl Sarcosinate, Peg-8 Laurate, Phenoxyethanol, Scutellaria Baicalensis Extract / Scutellaria Baicalensis Root Extract, Silica Silylate, Stearic Acid, Stearyl Alcohol, Terephthalylidene Dicamphor Sulfonic Acid, Titanium Dioxide, Tocopherol, Triethanolamine, Xanthan Gum, Zinc Gluconate.', 'oil', 15, 205000, 3000, 1),
(49, 3, 2, 'Sữa Chống Nắng La Roche-Posay Bảo Vệ Da Tối Ưu SPF50+', '49.jpg', 'Sữa Chống Nắng La Roche-Posay Anthelios UVMune 400 Fluide Invisible Fluid SPF50+ là phiên bản cải tiến của Anthelios Invisible Fluid – dòng sản phẩm chống nắng rất được yêu thích và được đánh giá cao từ thương hiệu dược mỹ phẩm La Roche-Posay. Sản phẩm cung cấp khả năng bảo vệ da vượt trội khỏi tia UVB & UVA dài – ngay cả các tia ở bước sóng 380 – 400 NM – thủ phạm tiềm ẩn hình thành các gốc thâm nám nằm sâu dưới ', 'Aqua/Water/Eau, Alcohol Denat, Triethyl Citrate, Diisopropyl Sebacate, Silica, Ethylhexyl Salicylate, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Ethylhexyl Triazone, Butyl Methoxydibenzoylmethane, Glycerin, Propanediol, C12-22 Alkyl Acrylate/Hydroxyethylacrylate Copolymer, Methoxypropylamino Cyclohexenylidene Ethoxyethylcyanoacetate, Perlite, Tocopherol, Caprylic/Capric Triglyceride, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Caprylyl Glycol, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Drometrizole Trisiloxane, Hydroxyethylcellulose, Terephthalylidene Dicamphor Sulfonic Acid, Triethanolamine, Trisodium Ethylenediamine Disuccinate, Parfum/Fragrance', 'all', 50, 428000, 3000, 1),
(50, 3, 5, 'Mini] Gel Rửa Mặt La Roche-Posay Dành Cho Da Dầu, Nhạy Cảm', '50.jpg', 'Gel Rửa Mặt La Roche-Posay Effaclar Purifying Foaming Gel For Oily Sensitive Skin là dòng sản phẩm sữa rửa mặt chuyên biệt dành cho làn da dầu, mụn, nhạy cảm đến từ thương hiệu dược mỹ phẩm La Roche-Posay nổi tiếng của Pháp, với kết cấu dạng gel tạo bọt nhẹ nhàng giúp loại bỏ bụi bẩn, tạp chất và bã nhờn dư thừa trên da hiệu quả, mang đến làn da sạch mịn, thoáng nhẹ và tươi mát. Công thức sản phẩm an toàn, lành tính, giảm thiểu tình trạng kích ứng đối với làn da nhạy cảm.', 'Aqua / Water, Sodium Laureth Sulfate, Peg-8, Coco-Betaine, Hexylene Glycol, Sodium Chloride, Peg-120 Methyl Glucose Dioleate, Zinc Pca, Sodium Hydroxide, Citric Acid, Sodium Benzoate, Phenoxyethanol, Caprylyl Glycol, Parfum / Fragrance', 'oil', 50, 79000, 3000, 1),
(51, 3, 5, 'Gel Rửa Mặt La Roche-Posay Dành Cho Da Dầu, Nhạy Cảm', '51.jpg', 'Gel Rửa Mặt La Roche-Posay Effaclar Purifying Foaming Gel For Oily Sensitive Skin là dòng sản phẩm sữa rửa mặt chuyên biệt dành cho làn da dầu, mụn, nhạy cảm đến từ thương hiệu dược mỹ phẩm La Roche-Posay nổi tiếng của Pháp, với kết cấu dạng gel tạo bọt nhẹ nhàng giúp loại bỏ bụi bẩn, tạp chất và bã nhờn dư thừa trên da hiệu quả, mang đến làn da sạch mịn, thoáng nhẹ và tươi mát. Công thức sản phẩm an toàn, lành tính, giảm thiểu tình trạng kích ứng đối với làn da nhạy cảm.', 'Aqua / Water, Sodium Laureth Sulfate, Peg-8, Coco-Betaine, Hexylene Glycol, Sodium Chloride, Peg-120 Methyl Glucose Dioleate, Zinc Pca, Sodium Hydroxide, Citric Acid, Sodium Benzoate, Phenoxyethanol, Caprylyl Glycol, Parfum / Fragrance', 'oil', 200, 308000, 3000, 1),
(52, 3, 5, 'Gel Rửa Mặt La Roche-Posay Dành Cho Da Dầu, Nhạy Cảm', '52.jpg', 'Gel Rửa Mặt La Roche-Posay Effaclar Purifying Foaming Gel For Oily Sensitive Skin là dòng sản phẩm sữa rửa mặt chuyên biệt dành cho làn da dầu, mụn, nhạy cảm đến từ thương hiệu dược mỹ phẩm La Roche-Posay nổi tiếng của Pháp, với kết cấu dạng gel tạo bọt nhẹ nhàng giúp loại bỏ bụi bẩn, tạp chất và bã nhờn dư thừa trên da hiệu quả, mang đến làn da sạch mịn, thoáng nhẹ và tươi mát. Công thức sản phẩm an toàn, lành tính, giảm thiểu tình trạng kích ứng đối với làn da nhạy cảm.', 'Aqua / Water, Sodium Laureth Sulfate, Peg-8, Coco-Betaine, Hexylene Glycol, Sodium Chloride, Peg-120 Methyl Glucose Dioleate, Zinc Pca, Sodium Hydroxide, Citric Acid, Sodium Benzoate, Phenoxyethanol, Caprylyl Glycol, Parfum / Fragrance', 'oil', 400, 476000, 3000, 1),
(53, 3, 5, 'Gel Rửa Mặt & Tắm La Roche-Posay Làm Sạch & Giảm Mụn', '53.jpg', 'Gel Rửa Mặt & Tắm La Roche-Posay Effaclar Micro-Peeling Purifying Gel là sản phẩm rửa mặt và sữa tắm 2 trong 1 mới nhất vừa được ra mắt từ thương hiệu dược mỹ phẩm La Roche-Posay, thuộc dòng Effaclar chăm sóc da dầu mụn, với tác động kép - hiệu quả 2 trong 1 dùng được cho mặt và toàn thân, không chỉ giúp làm sạch dịu nhẹ mà còn hỗ trợ giảm mụn, vết thâm và ngăn ngừa mụn tái phát.\r\n\r\n', 'Aqua / Water, Sodium Laureth Sulfate, Decyl Glucoside, Glycerin, Sodium Chloride, Coco-betaine, Salicylic Acid, Peg-150 Pentaerythrityl Tetrastearate, Peg-6 Caprylic/capric Glycerides, Zinc Gluconate, Sodium Hydroxide, Capryloyl Salicylic Acid, Tetrasodium Edta, Citric Acid, Menthol, Polyquaternium-47, Hexylene Glycol, Sodium Benzoate.', 'all', 400, 492000, 1000, 1),
(54, 3, 5, 'Gel Rửa Mặt & Tắm La Roche-Posay Làm Sạch & Giảm Mụn', '54.jpg', 'Gel Rửa Mặt & Tắm La Roche-Posay Effaclar Micro-Peeling Purifying Gel là sản phẩm rửa mặt và sữa tắm 2 trong 1 mới nhất vừa được ra mắt từ thương hiệu dược mỹ phẩm La Roche-Posay, thuộc dòng Effaclar chăm sóc da dầu mụn, với tác động kép - hiệu quả 2 trong 1 dùng được cho mặt và toàn thân, không chỉ giúp làm sạch dịu nhẹ mà còn hỗ trợ giảm mụn, vết thâm và ngăn ngừa mụn tái phát.\r\n\r\n', 'Aqua / Water, Sodium Laureth Sulfate, Decyl Glucoside, Glycerin, Sodium Chloride, Coco-betaine, Salicylic Acid, Peg-150 Pentaerythrityl Tetrastearate, Peg-6 Caprylic/capric Glycerides, Zinc Gluconate, Sodium Hydroxide, Capryloyl Salicylic Acid, Tetrasodium Edta, Citric Acid, Menthol, Polyquaternium-47, Hexylene Glycol, Sodium Benzoate.', 'all', 50, 132000, 1000, 1),
(55, 3, 5, 'Sữa Rửa Mặt La Roche-Posay Cho Da Hỗn Hợp Rất Nhạy', '55.jpg', 'Sữa Rửa Mặt La Roche-Posay Toleriane Purifying Foaming Cream được thiết kế chuyên biệt dành riêng cho những làn da rất nhạy cảm, dễ bị kích ứng khi sử dụng các loại sữa rửa mặt thông thường. Sản phẩm có kết cấu dạng kem mịn dễ dàng tạo bọt cùng công thức tối giản: không chứa paraben, không sulfate, không hương liệu & không chất bảo quản, an toàn cho làn da. Sản phẩm nhẹ nhàng làm sạch da từ sâu trong lỗ chân lông, loại bỏ bụi bẩn cùng dầu thừa, đồng thời giữ độ PH luôn ở mức cân bằng 5.5 nên sau khi rửa mặt xong, da không hề khô rít, căng rát, mà vẫn mềm mịn, sạch thoáng và đầy sức sống', 'Aqua / Water, Glycerin, Myristic Acid, Potassium Hydroxide, Glyceryl Stearate Se, Stearic Acid, Lauric Acid, Palmitic Acid, Coco-Glucoside, Tetrasodium Edta.', 'oil', 50, 205000, 3000, 1),
(56, 3, 5, 'Sữa Rửa Mặt La Roche-Posay Cho Da Hỗn Hợp Rất Nhạy', '56.jpg', 'Sữa Rửa Mặt La Roche-Posay Toleriane Purifying Foaming Cream được thiết kế chuyên biệt dành riêng cho những làn da rất nhạy cảm, dễ bị kích ứng khi sử dụng các loại sữa rửa mặt thông thường. Sản phẩm có kết cấu dạng kem mịn dễ dàng tạo bọt cùng công thức tối giản: không chứa paraben, không sulfate, không hương liệu & không chất bảo quản, an toàn cho làn da. Sản phẩm nhẹ nhàng làm sạch da từ sâu trong lỗ chân lông, loại bỏ bụi bẩn cùng dầu thừa, đồng thời giữ độ PH luôn ở mức cân bằng 5.5 nên sau khi rửa mặt xong, da không hề khô rít, căng rát, mà vẫn mềm mịn, sạch thoáng và đầy sức sống', 'Aqua / Water, Glycerin, Myristic Acid, Potassium Hydroxide, Glyceryl Stearate Se, Stearic Acid, Lauric Acid, Palmitic Acid, Coco-Glucoside, Tetrasodium Edta.', 'oil', 125, 434000, 3000, 1),
(57, 3, 5, 'Sữa Rửa Mặt La Roche-Posay Cho Da Quá Nhạy Cảm ', '57.jpg', 'Sữa Rửa Mặt Tẩy Trang La Roche-Posay Cho Da Quá Nhạy Cảm Toleriane Dermo Nettoyant Cleanser là sản phẩm đến từ thương hiệu La Roche-Posay đình đám của nước Pháp. Sản phẩm thích hợp cho mọi loại da kể cả da nhạy cảm, không gây kích ứng, không paraben và hương liệu.', 'Wate/Aqua, Ethylhexyl Palmitate, Glycerin, Dipropylene Glycol, Carbomer, Sodium Hydroxide, Capryl Glycol/Caprylyl Glycol, Ethylhexylglycerin.', 'all', 200, 422000, 3000, 1),
(58, 3, 5, 'Sữa Rửa Mặt La Roche-Posay Cho Da Quá Nhạy Cảm ', '58.jpg', 'Sữa Rửa Mặt Tẩy Trang La Roche-Posay Cho Da Quá Nhạy Cảm Toleriane Dermo Nettoyant Cleanser là sản phẩm đến từ thương hiệu La Roche-Posay đình đám của nước Pháp. Sản phẩm thích hợp cho mọi loại da kể cả da nhạy cảm, không gây kích ứng, không paraben và hương liệu.', 'Wate/Aqua, Ethylhexyl Palmitate, Glycerin, Dipropylene Glycol, Carbomer, Sodium Hydroxide, Capryl Glycol/Caprylyl Glycol, Ethylhexylglycerin.', 'all', 50, 75000, 3000, 1),
(59, 4, 4, 'Kem Dưỡng Bioderma Giúp Se Khít Lỗ Chân Lông', '59.jpg', 'Kem Dưỡng Bioderma Sébium Pore Refiner là sản phẩm kem dưỡng chuyên biệt dành cho làn da dầu, lỗ chân lông to đến từ thương hiệu dược mỹ phẩm Bioderma. Với kết cấu mỏng nhẹ, thẩm thấu tức thì, sản phẩm giúp tạo lớp lót trên bề mặt da giúp che phủ lỗ chân lông, hỗ trợ cân bằng bã nhờn đồng thời giúp làm giảm kích thước lỗ chân lông, để lại làn da khô thoáng sau khi sử dụng. Đặc biệt phù hợp cho da dầu và da mụn.', 'Aqua/Water/Eau, Methyl Methacrylate Crosspolymer, Dipropylene Glycol, Cyclopentasiloxane, Cyclohexasiloxane, Dimethicone, Glycerin, Butylene Glycol, Fomes Officinalis (Mushroom) Extract, Sodium Polyacrylate, Salicylic Acid, Dodecyl Gallate, Ginkgo Biloba Leaf Extract, Mannitol, Xylitol, Rhamnose, Fructooligosaccharides, Laminaria Ochroleuca Extract, Silica, Trideceth-6, C30-45 Alkyl Cetearyl Dimethicone Crosspolymer, Lauryl Peg/Ppg-18/18 Methicone, Caprylic/Capric Triglyceride, Mineral Oil (Paraffinum Liquidum), Pentylene Glycol, 1,2-Hexanediol, Peg/Ppg-18/18 Dimethicone, Caprylyl Glycol, Propylene Glycol, Sodium Hydroxide, Citric Acid, Disodium Edta, Fragrance (Parfum).', 'oil', 30, 368000, 1000, 1),
(60, 4, 4, 'Kem Dưỡng Bioderma Giúp Se Khít Lỗ Chân Lông', '60.jpg', 'Kem Dưỡng Bioderma Sébium Pore Refiner là sản phẩm kem dưỡng chuyên biệt dành cho làn da dầu, lỗ chân lông to đến từ thương hiệu dược mỹ phẩm Bioderma. Với kết cấu mỏng nhẹ, thẩm thấu tức thì, sản phẩm giúp tạo lớp lót trên bề mặt da giúp che phủ lỗ chân lông, hỗ trợ cân bằng bã nhờn đồng thời giúp làm giảm kích thước lỗ chân lông, để lại làn da khô thoáng sau khi sử dụng. Đặc biệt phù hợp cho da dầu và da mụn.', 'Aqua/Water/Eau, Methyl Methacrylate Crosspolymer, Dipropylene Glycol, Cyclopentasiloxane, Cyclohexasiloxane, Dimethicone, Glycerin, Butylene Glycol, Fomes Officinalis (Mushroom) Extract, Sodium Polyacrylate, Salicylic Acid, Dodecyl Gallate, Ginkgo Biloba Leaf Extract, Mannitol, Xylitol, Rhamnose, Fructooligosaccharides, Laminaria Ochroleuca Extract, Silica, Trideceth-6, C30-45 Alkyl Cetearyl Dimethicone Crosspolymer, Lauryl Peg/Ppg-18/18 Methicone, Caprylic/Capric Triglyceride, Mineral Oil (Paraffinum Liquidum), Pentylene Glycol, 1,2-Hexanediol, Peg/Ppg-18/18 Dimethicone, Caprylyl Glycol, Propylene Glycol, Sodium Hydroxide, Citric Acid, Disodium Edta, Fragrance (Parfum).', 'oil', 15, 149000, 1000, 1),
(61, 4, 4, 'Kem Dưỡng Bioderma Hỗ Trợ Phục Hồi Da Tổn Thương ', '61.jpg', 'Bioderma Cicabio Crème là sản phẩm kem dưỡng ẩm hỗ trợ phục hồi và làm dịu làn da tổn thương, da nhạy cảm - kích ứng đến từ thương hiệu dược mỹ phẩm Bioderma nổi tiếng của Pháp, được các bác sĩ da liễu Pháp tin dùng. Sản phẩm có khả năng làm giảm các triệu chứng ngứa và khó chịu gần như ngay lập tức, đồng thời dưỡng ẩm và khôi phục lớp biểu bì, tạo lớp màng bảo vệ da tối ưu mà vẫn mỏng nhẹ và thoáng khí, giúp da luôn thoải mái dễ chịu.', 'Aqua (Water), Glycerin (Khóa Ẩm), Ethylhexyl Palmitate (Làm Mềm Da), Fructooligosaccharides, Zinc Oxide (Làm Làm Vết Thương, Chống Uva, Kháng Khuẩn), Octyldodecanol, Butylene Glycol, Polyacrylamide, Mannitol, Xylitol, Rhamnose, Laminaria Ochroleuca Extract, Copper Sulfate (Trị Thương), Zinc Sulfate (Ngăn, Sodium Hyaluronate (Cấp Ẩm, Giảm Sự Mất Nước Qua Da), Vitis Vinifera (Grape) Vine Extract (Resveratrol: Giảm Thương Tổn Tế Bào), Asiaticoside (Centella Asiatica: Kháng Khuẩn, Trị Thương), Asiatic Acid, Madecassic Acid, C13-14 Isoparaffin, Octyldodecyl Xyloside, Peg-30 Dipolyhydroxystearate, Caprylic/Capric Triglyceride, Laureth-7, Laureth-3, Hydroxyethylcellulose, Acetyl Dipeptide-1 Cetyl Ester, Potassium Sorbate.', 'all', 40, 293000, 1000, 1),
(62, 4, 4, 'Kem Dưỡng Ẩm Bioderma Cho Da Khô Nhạy Cảm', '62.jpg', 'Bioderma Atoderm Crème là sản phẩm kem dưỡng ẩm chăm sóc hàng ngày, bảo vệ và dưỡng ẩm chuyên sâu đến từ thương hiệu dược mỹ phẩm Bioderma của Pháp. Nhờ các thành phần dưỡng chất và tái cấu trúc, kem dưỡng Atoderm Crème giúp tăng cường hàng rào sinh học bảo vệ da và do đó ngăn ngừa các tác nhân gây kích ứng xâm nhập. Với các thành phần dưỡng ẩm, Atoderm Crème giữ nước ở lớp da trên và ngăn chặn quá trình bay hơi. Dùng cho da thường và da khô nhạy cảm.', 'Aqua/Water/Eau, Paraffinum Liquidum/Mineral Oil/Huile Minerale, Glycerin, Brassica Campestris (Rapeseed) Seed Oil, Sodium Polyacrylate, Pentylene Glycol, Cetearyl Alcohol, 1,2-Hexanediol, Caprylyl Glycol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Sodium Citrate, Xylitol, Cetearyl Glucoside, Mannitol, Tocopherol, Rhamnose, Xylitylglucoside, Helianthus Annuus (Sunflower) Seed Oil, Anhydroxylitol, Niacinamide, Glucose, Fructooligosaccharides, Caprylic/Capric Triglyceride, Laminaria Ochroleuca Extract. [Bi 475]', 'dry', 200, 293000, 1000, 1),
(63, 4, 4, 'Kem Dưỡng Bioderma Cấp Ẩm Và Làm Dịu Cho Da Nhạy', '63.jpg', 'Kem Dưỡng Bioderma Cấp Ẩm Và Làm Dịu Cho Da Nhạy Cảm 40ml là sản phẩm kem dưỡng ẩm đến từ thương hiệu mỹ phẩm Bioderma của Pháp, chứa đựng khả năng dưỡng ẩm đột phá lên đến 12 giờ, tự bảo vệ trước tác nhân kích ứng, tăng cường đề kháng, hiệu quả lâu dài và rõ ràng cho mỗi tình trạng nhạy cảm của làn da.', 'Aqua/Water/Eau, Glycerin, Dicaprylyl Ether, Propylheptyl Caprylate, Butylene Glycol, Glyceryl Stearate Citrate, Glycol Palmitate, Squalane, Sucrose Stearate, Mangifera Indica (Mango) Seed Butter, Pentylene Glycol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Caprylyl Glycol, Carnosine, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Mannitol, Xylitol, Tocopherol, Salvia Miltiorrhiza Flower/Leaf/Root Extract, Rhamnose, Glycine Soja (Soybean) Oil, Polysorbate 60, Sorbitan Isostearate, Palmitoyl Tetrapeptide-10. [Bi 2012]', 'all', 40, 401000, 500, 1),
(64, 4, 4, 'Gel Dưỡng Ẩm Bioderma Làm Dịu Cho Da Rất Khô ', '64.jpg', 'Gel Dưỡng Ẩm Làm Dịu Cho Da Rất Khô Bioderma Atoderm Intensive gel-crème là sản phẩm kem dưỡng đến từ thương hiệu dược mỹ phẩm Bioderma, giúp làm dịu da tức thì, giảm ngay cảm giác ngứa rát khó chịu và dưỡng ẩm suốt 24h. Đây món quà Bioderma dành tặng riêng cho làn da khô đến rất khô, dị ứng.', 'Aqua/Water/Eau, Glycerin, Niacinamide, Sodium Polyacrylate, Dipotassium Glycyrrhizate, Hydrogenated Polydecene, Pentylene Glycol, 1,2-Hexanediol, Caprylyl Glycol, Mannitol, Polysorbate 20, Xylitol, Rhamnose, Sodium Citrate, Polyquaternium-51, Fructooligosaccharides, Caprylic/Capric Triglyceride, Laminaria Ochroleuca Extract. [Bi 479]', 'dry', 75, 293000, 100, 1),
(65, 4, 4, 'Gel Dưỡng Ẩm Bioderma Làm Dịu Cho Da Rất Khô ', '65.jpg', 'Gel Dưỡng Ẩm Làm Dịu Cho Da Rất Khô Bioderma Atoderm Intensive gel-crème là sản phẩm kem dưỡng đến từ thương hiệu dược mỹ phẩm Bioderma, giúp làm dịu da tức thì, giảm ngay cảm giác ngứa rát khó chịu và dưỡng ẩm suốt 24h. Đây món quà Bioderma dành tặng riêng cho làn da khô đến rất khô, dị ứng.', 'Aqua/Water/Eau, Glycerin, Niacinamide, Sodium Polyacrylate, Dipotassium Glycyrrhizate, Hydrogenated Polydecene, Pentylene Glycol, 1,2-Hexanediol, Caprylyl Glycol, Mannitol, Polysorbate 20, Xylitol, Rhamnose, Sodium Citrate, Polyquaternium-51, Fructooligosaccharides, Caprylic/Capric Triglyceride, Laminaria Ochroleuca Extract. [Bi 479]', 'dry', 500, 561000, 1000, 1),
(66, 4, 1, 'Nước Tẩy Trang Bioderma Dành Cho Da Nhạy Cảm', '66.jpg', 'Nước Tẩy Trang Dành Cho Da Nhạy Cảm Bioderma Sensibio H2O là sản phẩm nước tẩy trang công nghệ Micellar đầu tiên trên thế giới, do thương hiệu dược mỹ phẩm Bioderma nổi tiếng của Pháp phát minh. Dung dịch giúp làm sạch sâu da và loại bỏ lớp trang điểm nhanh chóng mà không cần rửa lại bằng nước. Công thức dịu nhẹ, không kích ứng, không gây khô căng da, đặc biệt phù hợp với làn da nhạy cảm', 'Aqua/Water/Eau, Peg-6 Caprylic/Capric Glycerides, Fructooligosaccharides, Mannitol, Xylitol, Rhamnose, Cucumis Sativus (Cucumber) Fruit Extract, Propylene Glycol, Cetrimonium Bromide, Disodium Edta. [Bi 446]', 'all', 250, 331000, 500, 1),
(67, 4, 1, 'Nước Tẩy Trang Bioderma Dành Cho Da Nhạy Cảm', '67.jpg', 'Nước Tẩy Trang Dành Cho Da Nhạy Cảm Bioderma Sensibio H2O là sản phẩm nước tẩy trang công nghệ Micellar đầu tiên trên thế giới, do thương hiệu dược mỹ phẩm Bioderma nổi tiếng của Pháp phát minh. Dung dịch giúp làm sạch sâu da và loại bỏ lớp trang điểm nhanh chóng mà không cần rửa lại bằng nước. Công thức dịu nhẹ, không kích ứng, không gây khô căng da, đặc biệt phù hợp với làn da nhạy cảm', 'Aqua/Water/Eau, Peg-6 Caprylic/Capric Glycerides, Fructooligosaccharides, Mannitol, Xylitol, Rhamnose, Cucumis Sativus (Cucumber) Fruit Extract, Propylene Glycol, Cetrimonium Bromide, Disodium Edta. [Bi 446]', 'all', 500, 393000, 500, 1),
(68, 4, 1, 'Nước Tẩy Trang Bioderma Dành Cho Da Dầu & Hỗn Hợp', '68.jpg', 'Nước Tẩy Trang Bioderma Sébium H2O là sản phẩm tẩy trang dành cho da dầu, da hỗn hợp đến từ thương hiệu dược mỹ phẩm Bioderma, được ứng dụng công nghệ Micellar đình đám giúp loại bỏ lớp trang điểm cùng bụi bẩn và dầu thừa trên da hiệu quả mà không gây khô căng hay nhờn rít, tạo cảm giác thông thoáng cho da sau một ngày dài mệt mỏi.', 'Water (Aqua), Peg-6 Caprylic/Capric Glycerides, Sodium Citrate , Zinc Gluconate, Copper Sulfate, Ginkgo Biloba Extract – Chiết Xuất Lá Bạch Quả, Mannitol, Xylitol, Rhamnose, Fructooligosaccharides, Propylene Glycol, Citric Acid, Disodium Edta, Cetrimonium Bromide, Fragrance (Parfum).', 'oil', 250, 331000, 1000, 1),
(69, 4, 1, 'Nước Tẩy Trang Bioderma Dành Cho Da Dầu & Hỗn Hợp', '69.jpg', 'Nước Tẩy Trang Bioderma Sébium H2O là sản phẩm tẩy trang dành cho da dầu, da hỗn hợp đến từ thương hiệu dược mỹ phẩm Bioderma, được ứng dụng công nghệ Micellar đình đám giúp loại bỏ lớp trang điểm cùng bụi bẩn và dầu thừa trên da hiệu quả mà không gây khô căng hay nhờn rít, tạo cảm giác thông thoáng cho da sau một ngày dài mệt mỏi.', 'Water (Aqua), Peg-6 Caprylic/Capric Glycerides, Sodium Citrate , Zinc Gluconate, Copper Sulfate, Ginkgo Biloba Extract – Chiết Xuất Lá Bạch Quả, Mannitol, Xylitol, Rhamnose, Fructooligosaccharides, Propylene Glycol, Citric Acid, Disodium Edta, Cetrimonium Bromide, Fragrance (Parfum).', 'oil', 500, 393000, 1000, 1),
(70, 4, 8, 'Dầu Tắm Bioderma Làm Sạch & Làm Dịu Da Khô, Nhạy Cảm', '70.jpg', 'Bioderma Atoderm Huile De Douche từ thương hiệu dược mỹ phẩm Bioderma là sản phẩm dầu tắm chăm sóc và làm sạch dành cho cả gia đình. Với kết cấu dạng dầu giàu độ ẩm, dầu tắm Bioderma sẽ giúp nhẹ nhàng làm sạch, đồng thời nuôi dưỡng và làm dịu tình trạng da khô đến rất khô, da nhạy cảm, kích ứng. Làn da sau khi sử dụng trở nên mềm mại và thoải mái, không khô căng.', 'Aqua/Water/Eau, Glycerin, PEG-7 Glyceryl Cocoate, Sodium Cocoamphoacetate, Lauryl Glucoside, Coco-Glucoside, Glyceryl Oleate, Citric Acid, PEG-90 Glyceryl Isostearate, Fragrance (Parfum), Mannitol, Polysorbate 20, Xylitol, Laureth-2, Rhamnose, Niacinamide, Fructooligosaccharides, Tocopherol, Hydrogenated Palm Glycerides Citrate, Lecithin, Ascorbyl Palmitate.', 'dry', 1000, 419000, 1000, 1),
(71, 4, 8, 'Dầu Tắm Bioderma Làm Sạch & Làm Dịu Da Khô, Nhạy Cảm', '71.jpg', 'Bioderma Atoderm Huile De Douche từ thương hiệu dược mỹ phẩm Bioderma là sản phẩm dầu tắm chăm sóc và làm sạch dành cho cả gia đình. Với kết cấu dạng dầu giàu độ ẩm, dầu tắm Bioderma sẽ giúp nhẹ nhàng làm sạch, đồng thời nuôi dưỡng và làm dịu tình trạng da khô đến rất khô, da nhạy cảm, kích ứng. Làn da sau khi sử dụng trở nên mềm mại và thoải mái, không khô căng.', 'Aqua/Water/Eau, Glycerin, PEG-7 Glyceryl Cocoate, Sodium Cocoamphoacetate, Lauryl Glucoside, Coco-Glucoside, Glyceryl Oleate, Citric Acid, PEG-90 Glyceryl Isostearate, Fragrance (Parfum), Mannitol, Polysorbate 20, Xylitol, Laureth-2, Rhamnose, Niacinamide, Fructooligosaccharides, Tocopherol, Hydrogenated Palm Glycerides Citrate, Lecithin, Ascorbyl Palmitate.', 'dry', 200, 329000, 1000, 1),
(72, 4, 8, 'Gel Tắm Bioderma Dịu Nhẹ Cho Da Thường & Khô Nhạy Cảm', '72.jpg', 'Gel Tắm Bioderma Dịu Nhẹ Cho Da Thường & Khô Nhạy Cảm Atoderm Gel Douche là dòng sữa tắm đến từ thương hiệu mỹ phẩm Bioderma của Pháp, với công thức dưỡng ẩm sản phẩm giúp làm sạch da mà vẫn giữ độ ẩm hỗ trợ làm mềm da, dịu da tránh tình trạng khô căng, khó chịu. Hiện sản phẩm Gel Tắm Bioderma Dịu Nhẹ Cho Da Thường & Khô Nhạy Cảm Atoderm Gel Douche đã có mặt tại Hasaki với 2 dung tích:', 'Aqua/Water/Eau, Sodium Laureth Sulfate, Coco-Betaine, Sodium Lauroyl Sarcosinate, Glycerin, Methylpropanediol, Coco-Glucoside, Glyceryl Oleate, Disodium Edta, Citric Acid, Capryloyl Glycine, Copper Sulfate, Xylitylglucoside, Anhydroxylitol, Xylitol, Niacinamide, Glucose, Fructooligosaccharides, Mannitol, Tocopherol, Hydrogenated Palm Glycerides Citrate, Lecithin, Rhamnose, Ascorbyl Palmitate, Fragrance (Parfum). [Bi 548]', 'dry', 500, 412000, 1000, 1),
(73, 4, 8, 'Gel Tắm Bioderma Dịu Nhẹ Cho Da Thường & Khô Nhạy Cảm', '73.jpg', 'Gel Tắm Bioderma Dịu Nhẹ Cho Da Thường & Khô Nhạy Cảm Atoderm Gel Douche là dòng sữa tắm đến từ thương hiệu mỹ phẩm Bioderma của Pháp, với công thức dưỡng ẩm sản phẩm giúp làm sạch da mà vẫn giữ độ ẩm hỗ trợ làm mềm da, dịu da tránh tình trạng khô căng, khó chịu. Hiện sản phẩm Gel Tắm Bioderma Dịu Nhẹ Cho Da Thường & Khô Nhạy Cảm Atoderm Gel Douche đã có mặt tại Hasaki với 2 dung tích:', 'Aqua/Water/Eau, Sodium Laureth Sulfate, Coco-Betaine, Sodium Lauroyl Sarcosinate, Glycerin, Methylpropanediol, Coco-Glucoside, Glyceryl Oleate, Disodium Edta, Citric Acid, Capryloyl Glycine, Copper Sulfate, Xylitylglucoside, Anhydroxylitol, Xylitol, Niacinamide, Glucose, Fructooligosaccharides, Mannitol, Tocopherol, Hydrogenated Palm Glycerides Citrate, Lecithin, Rhamnose, Ascorbyl Palmitate, Fragrance (Parfum). [Bi 548]', 'dry', 200, 276000, 1000, 1),
(74, 4, 5, 'Gel Rửa Mặt Bioderma Dành Cho Da Dầu & Hỗn Hợp ', '74.jpg', 'Gel Rửa Mặt Bioderma Sébium Gel Moussant là sữa rửa mặt thanh lọc dịu nhẹ được thương hiệu dược mỹ phẩm Bioderma thiết kế chuyên biệt dành cho làn da dầu & hỗn hợp, giúp loại bỏ các tạp chất trên da, giải phóng bít tắc và làm thông thoáng lỗ chân lông, đồng thời kiểm soát dầu thừa, ngăn ngừa mụn hiệu quả mà vẫn duy trì pH tự nhiên trên da.', 'Aqua/Water/Eau, Sodium Cocoamphoacetate, Sodium Laureth Sulfate, Methylpropanediol, Disodium Edta, Mannitol, Xylitol, Rhamnose, Fructooligosaccharides, Zinc Sulfate, Copper Sulfate, Ginkgo Biloba Leaf Extract, Peg-90 Glyceryl Isostearate, Lactic Acid, Laureth-2, Potassium Sorbate, Sodium Chloride, Propylene Glycol, Sodium Hydroxide, Fragrance (Parfum). [Bi 418].', 'oil', 100, 185000, 500, 1),
(75, 4, 5, 'Gel Rửa Mặt Bioderma Dành Cho Da Dầu & Hỗn Hợp ', '75.jpg', 'Gel Rửa Mặt Bioderma Sébium Gel Moussant là sữa rửa mặt thanh lọc dịu nhẹ được thương hiệu dược mỹ phẩm Bioderma thiết kế chuyên biệt dành cho làn da dầu & hỗn hợp, giúp loại bỏ các tạp chất trên da, giải phóng bít tắc và làm thông thoáng lỗ chân lông, đồng thời kiểm soát dầu thừa, ngăn ngừa mụn hiệu quả mà vẫn duy trì pH tự nhiên trên da.', 'Aqua/Water/Eau, Sodium Cocoamphoacetate, Sodium Laureth Sulfate, Methylpropanediol, Disodium Edta, Mannitol, Xylitol, Rhamnose, Fructooligosaccharides, Zinc Sulfate, Copper Sulfate, Ginkgo Biloba Leaf Extract, Peg-90 Glyceryl Isostearate, Lactic Acid, Laureth-2, Potassium Sorbate, Sodium Chloride, Propylene Glycol, Sodium Hydroxide, Fragrance (Parfum). [Bi 418].', 'oil', 500, 509000, 500, 1),
(76, 4, 5, 'Gel Rửa Mặt Bioderma Tạo Bọt Cho Da Nhạy Cảm ', '76.jpg', 'Gel Rửa Mặt Bioderma Tạo Bọt Cho Da Nhạy Cảm 100mlSensibio Gel Moussant là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm Bioderma của Pháp, làm sạch sâu, dịu nhẹ với công nghệ micellar loại bỏ các bụi bẩn, bã nhờn dễ dàng mà không tác động mạnh lực mạnh lên da, tạo nên hàng rào bảo vệ da vững chắc cho da, cân bằng độ pH và độ ẩm cho làn da.', 'Aqua/Water/Eau, Sodium Cocoamphoacetate, Propanediol, Sodium Lauroyl Sarcosinate, Citric Acid, Coco-Glucoside, Glyceryl Oleate, Sodium Citrate, Peg-90 Glyceryl Isostearate, Mannitol, Xylitol, Laureth-2, Rhamnose, Fructooligosaccharides, Tocopherol, Hydrogenated Palm Glycerides Citrate, Lecithin, Ascorbyl Palmitate. [Bi 722]', 'all', 100, 219000, 500, 1),
(77, 4, 5, 'Gel Rửa Mặt Bioderma Tạo Bọt Cho Da Nhạy Cảm ', '77.jpg', 'Gel Rửa Mặt Bioderma Tạo Bọt Cho Da Nhạy Cảm 100mlSensibio Gel Moussant là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm Bioderma của Pháp, làm sạch sâu, dịu nhẹ với công nghệ micellar loại bỏ các bụi bẩn, bã nhờn dễ dàng mà không tác động mạnh lực mạnh lên da, tạo nên hàng rào bảo vệ da vững chắc cho da, cân bằng độ pH và độ ẩm cho làn da.', 'Aqua/Water/Eau, Sodium Cocoamphoacetate, Propanediol, Sodium Lauroyl Sarcosinate, Citric Acid, Coco-Glucoside, Glyceryl Oleate, Sodium Citrate, Peg-90 Glyceryl Isostearate, Mannitol, Xylitol, Laureth-2, Rhamnose, Fructooligosaccharides, Tocopherol, Hydrogenated Palm Glycerides Citrate, Lecithin, Ascorbyl Palmitate. [Bi 722]', 'all', 200, 349000, 500, 1),
(78, 4, 2, 'Kem Chống Nắng Bioderma Dành Cho Da Dầu, Mụn SPF30', '78.jpg', 'Bioderma Photoderm AKN Mat SPF30 là sản phẩm kem chống nắng chuyên biệt dành cho làn da dầu, mụn, nhạy cảm từ thương hiệu dược mỹ phẩm Bioderma, mang lại hiệu quả 2 trong 1 chỉ số chống nắng cao và ngăn ngừa sự phát triển của mụn. Kết cấu mịn màng, không màu, không bết dính hay để lại vệt trắng.', 'Silica, C12-15 Alkyl Benzoate, Methylene Bis-Benzotriazolyl Tetramethylbutylphenol [Nano], Corn Starch Modified, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Ethylhexyl Triazone, Potassium Cetyl Phosphate, Brassica Campestris/Aleurites Fordii Oil Copolymer, Hydroxyethyl Acrylate/ Sodium Acryloyldimethyl Taurate Copolymer, 1, 2-Hexanediol, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Silica, Decyl Glucoside, Glycolic Acid, Boron Nitride, Salicylic Acid, Tocopheryl Acetate, Propylene Glycol, Xanthan Gum, Sodium Hydroxide, Polysorbate 60, Sorbitan Isostearate, Ectoin, Mannitol, Xylitol, Rhamnosis, Ginkgo Biloba Leaf Extract, Fructooligosaccharides, Propyl Gallate, Caprylic/Capric Triglyceride, Tocopherol, Laminaria Ochroleuca Extract, Fragrance (Perfume). [Bi 573]', 'oil', 40, 427000, 500, 1),
(79, 4, 2, '[Mini] Kem Chống Nắng Bioderma Dành Cho Da Dầu, Mụn', '79.jpg', 'Bioderma Photoderm AKN Mat SPF30 là sản phẩm kem chống nắng chuyên biệt dành cho làn da dầu, mụn, nhạy cảm từ thương hiệu dược mỹ phẩm Bioderma, mang lại hiệu quả 2 trong 1 chỉ số chống nắng cao và ngăn ngừa sự phát triển của mụn. Kết cấu mịn màng, không màu, không bết dính hay để lại vệt trắng.', 'Silica, C12-15 Alkyl Benzoate, Methylene Bis-Benzotriazolyl Tetramethylbutylphenol [Nano], Corn Starch Modified, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Ethylhexyl Triazone, Potassium Cetyl Phosphate, Brassica Campestris/Aleurites Fordii Oil Copolymer, Hydroxyethyl Acrylate/ Sodium Acryloyldimethyl Taurate Copolymer, 1, 2-Hexanediol, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Silica, Decyl Glucoside, Glycolic Acid, Boron Nitride, Salicylic Acid, Tocopheryl Acetate, Propylene Glycol, Xanthan Gum, Sodium Hydroxide, Polysorbate 60, Sorbitan Isostearate, Ectoin, Mannitol, Xylitol, Rhamnosis, Ginkgo Biloba Leaf Extract, Fructooligosaccharides, Propyl Gallate, Caprylic/Capric Triglyceride, Tocopherol, Laminaria Ochroleuca Extract, Fragrance (Perfume). [Bi 573]', 'oil', 5, 19000, 1000, 1),
(80, 4, 2, 'Kem Chống Nắng Bioderma Giảm Bóng Nhờn (Không màu)\r\n', '80.jpg', 'Kem Chống Nắng Bioderma Photoderm MAX Aquafluide SPF 50+ là dòng sản phẩm chống nắng da mặt đến từ thương hiệu mỹ phẩm Bioderma của Pháp, với chỉ số chống nắng cao giúp bảo vệ da khỏi tác hại của tia UVA/UVB. Kết cấu lỏng nhẹ, với công thức kiểm soát dầu mang lại cảm giác khô thoáng, thấm nhanh và không để lại vệt trắng. Sản phẩm không gây kích ứng, không mùi hương, chống nước, phù hợp cho mọi loai da, đặc biệt là da nhạy cảm.', 'Aqua/Water/Eau, Dicaprylyl Carbonate, Octocrylene, Methylene Bis-Benzotriazolyl Tetramethylbutylphenol [Nano], Butyl Methoxydibenzoylmethane, Glycerin, Methyl Methacrylate Crosspolymer, Cyclohexasiloxane, Cyclopentasiloxane, Bis- Ethylhexyloxyphenol Methoxyphenyl Triazine, Polymethylsilsesquioxane, Methylpropanediol, Hdi/Trimethylol Hexyllactone Crosspolymer, C20-22 Alkyl Phosphate, C20-22 Alcohols, Decyl Glucoside, Glyceryl Stearate Citrate, Pentylene Glycol, Microcrystalline Cellulose, C30-45 Alkyl Cetearyl Dimethicone Crosspolymer, 1,2-Hexanediol, Caprylyl Glycol, Disodium Edta, Xanthan Gum, Mannitol, Xylitol, Sodium Hydroxide, Cellulose Gum, Rhamnose, Propylene Glycol, Citric Acid, Ectoin, Tocopherol. [BI 642]', 'all', 40, 428000, 1000, 1),
(81, 4, 2, 'Kem Chống Nắng Bioderma Giảm Bóng Nhờn (Màu Light)', '81.jpg', 'Kem Chống Nắng Bioderma Photoderm MAX Aquafluide SPF 50+ là dòng sản phẩm chống nắng da mặt đến từ thương hiệu mỹ phẩm Bioderma của Pháp, với chỉ số chống nắng cao giúp bảo vệ da khỏi tác hại của tia UVA/UVB. Kết cấu lỏng nhẹ, với công thức kiểm soát dầu mang lại cảm giác khô thoáng, thấm nhanh và không để lại vệt trắng. Sản phẩm không gây kích ứng, không mùi hương, chống nước, phù hợp cho mọi loai da, đặc biệt là da nhạy cảm.', 'Dicaprylyl Carbonate, Octocrylene, Methylene Bis-Benzotriazolyl Tetramethylbutylphenol [Nano], Butyl Methoxydibenzoylmethane, Glycerin, Methyl Methacrylate Crosspolymer, Cyclohexasiloxane, Cyclopentasiloxane, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Glyceryl Stearate Citrate, Potassium Cetyl Phosphate, Titanium Dioxide (Ci 77891), Methylpropanediol, Polymethylsilsesquioxane, Decyl Glucoside, Hdi/Trimethylol Hexyllactone Crosspolymer, Iron Oxides (Ci 77492), Pentylene Glycol, Microcrystalline Cellulose, C30-45 Alkyl Cetearyl Dimethicone Crosspolymer, 1,2-Hexanediol, Caprylyl Glycol, Disodium Edta, Xanthan Gum, Iron Oxides (Ci 77491), Mannitol, Xylitol, Citric Acid, Hydrogenated Lecithin, Cellulose Gum, Rhamnose, Iron Oxides (Ci 77499), Propylene Glycol, Ectoin, Tocopherol. [Bi 640]', 'all', 40, 428000, 1000, 1),
(82, 4, 6, 'Dung Dịch Cân Bằng Da Bioderma Cho Da Dầu, Hỗn Hợp', '82.jpg', 'Dung Dịch Cân Bằng Da Bioderma Sebium Lotion là sản phẩm nước cân bằng da (toner) dạng lỏng dành cho da hỗn hợp/ da dầu đến từ thương hiệu dược mỹ phẩm Bioderma, giúp điều chỉnh độ pH của da và kiểm soát lượng dầu thừa, cân bằng độ ẩm, hỗ trợ se nhỏ lỗ chân lông và hạn chế hình thành mụn.', 'Aqua/Water/Eau, Peg-11 Methyl Ether Dimethicone, Butylene Glycol, Glycerin, Fomes Officinalis (Mushroom) Extract, Capryloyl Glycine, Polysorbate 20, Sodium Citrate, Zinc Gluconate, Salicylic Acid, Sodium Hydroxide, Mannitol, Sodium Metabisulfite, Xylitol, Rhamnose, Pyridoxine Hcl, Propyl Gallate, Peg-40 Hydrogenated Castor Oil, Fructooligosaccharides, Phenoxyethanol, Fragrance (Parfum). [Bi 727', 'oil', 200, 378000, 1000, 1),
(83, 4, 6, 'Nước Hoa Hồng Bioderma Dành Cho Da Nhạy Cảm', '83.jpg', 'Nước Hoa Hồng Dành Cho Da Nhạy Cảm Bioderma Sensibio Tonique là sản phẩm đến từ thương hiệu Bioderma nổi tiếng tại Pháp, với các chức năng chính là chăm sóc tăng cường độ ẩm cho da khỏe mạnh, nuôi dưỡng làn da giúp da trở nên tươi sáng hơn ngay sau khi sử dụng. Bênh cạnh đó, sản phẩm còn loại bỏ tạp chất dư thừa trên da, khôi phục và mang đến làn da rạng rỡ, đầy sức sống!', 'Aqua/Water/Eau, Glycerin, Xylitol, Polysorbate 20, Mannitol, Rhamnose, Fructooligosaccharides, Cucumis Sativus (Cucumber) Fruit Extract, Peg-40 Hydrogenated Castor Oil, Allantoin, Propylene Glycol, Disodium Edta, Cetrimonium Bromide, Sodium Hydroxide, Citric Acid.', 'all', 250, 361000, 1000, 1),
(84, 4, 6, 'Nước Hoa Hồng Bioderma Dành Cho Da Nhạy Cảm', '84.jpg', 'Nước Hoa Hồng Dành Cho Da Nhạy Cảm Bioderma Sensibio Tonique là sản phẩm đến từ thương hiệu Bioderma nổi tiếng tại Pháp, với các chức năng chính là chăm sóc tăng cường độ ẩm cho da khỏe mạnh, nuôi dưỡng làn da giúp da trở nên tươi sáng hơn ngay sau khi sử dụng. Bênh cạnh đó, sản phẩm còn loại bỏ tạp chất dư thừa trên da, khôi phục và mang đến làn da rạng rỡ, đầy sức sống!', 'Aqua/Water/Eau, Glycerin, Xylitol, Polysorbate 20, Mannitol, Rhamnose, Fructooligosaccharides, Cucumis Sativus (Cucumber) Fruit Extract, Peg-40 Hydrogenated Castor Oil, Allantoin, Propylene Glycol, Disodium Edta, Cetrimonium Bromide, Sodium Hydroxide, Citric Acid.', 'all', 100, 225000, 1000, 1),
(85, 2, 9, 'Bơ Dưỡng Thể Cocoon Chiết Xuất Cà Phê Đắk Lắk \r\n', '85.jpg', 'Bơ Dưỡng Thể Cocoon Chiết Xuất Cà Phê Đắk Lắk 200ml là dòng dưỡng ẩm toàn thân đến từ thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam, với thành phần chính từ dầu cà phê Đắk Lắk giàu cafein giúp chống oxy hoá, phục hồi và giữ lại độ ẩm cho làn da, làm đều màu da và mang đến sự khỏe khoắn, tươi mới.\r\n\r\n', 'Aqua/Water, Caprylic/Capric Triglyceride, Glyceryl Stearate, Cetearyl Alcohol, C10-18 Triglycerides, Ceteareth-20, Ceteareth-12, Glycerin, Dicaprylyl Carbonate, Cetyl Palmitate, Cyclopentasiloxane, Coffea Arabica (Coffee) Seed Oil, Calophyllum Inophyllum Seed Oil, Theobroma Cacao (Cocoa) Seed Butter, Behenyl Alcohol, Niacinamide, Butyrospermum Parkii (Shea) Butter, Pentylene Glycol, Cetyl Alcohol, Macadamia Ternifolia Seed Oil, Carthamus Tinctorius (Safflower) Seed Oil, C15-19 Alkane, Tocopherol, Dimethiconol, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Xanthan Gum, BHT, Ethylhexylglycerin, Parfum, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol, Caramel, Lactic Acid.\r\n\r\n', 'all', 200, 172000, 1000, 1),
(86, 5, 10, 'Kem Lót Maybelline Mịn Da Che Khuyết Điểm 22ml\r\n', '86.jpg', 'Kem Lót Trang Điểm Maybelline Baby Skin Instant Pore Eraser 22ml chắc chắn sẽ là phương pháp cứu nguy cho lớp nền của bạn. Mau trôi, nhanh xuống tông, lộ khuyết điểm: mụn đỏ và lỗ chân lông to chỉ cò là chuyện nhỏ nếu bạn sử dụng em kem lót trang điểm kiềm dầu Maybelline Baby Skin Instant Pore Eraser này!', 'Dimethicone, Dimethicone Crosspolymer, Stearyl Heptanoate, Caprylyl Glycol, Silica Silylate, Propylene Glycol, Pentaerythrityl Tetraisostearate, Prunus Cerasus Extract / Bitter Cherry Extract. May Contain: CI 73360 / Red 30, CI 77492 / Iron Oxides.\r\n\r\n', 'all', 22, 149000, 1000, 1),
(87, 1, 10, 'Kem Lót L\'Oréal Infallible Kiềm Dầu Bền Màu Lâu Trôi 30ml\r\n', '87.jpg', 'Kem Lót L\'Oréal Infallible Kiềm Dầu Bền Màu Lâu Trôi 30ml là sản phẩm kem lót đến từ thương hiệu mỹ phẩm L\'Oréal của Pháp, với công dụng giảm bóng nhờn, kiểm soát dầu thừa suốt 24 giờ đồng thời dưỡng ẩm, làm mịn và đều màu da cho cảm giác thoải mái. Sản phẩm có độ chống nắng SPF 16 PA+++ hỗ trợ bảo vệ da khỏi tác hại ánh nắng mặt trời.\r\n\r\n', 'Nội dung đang được cập nhật', 'all', 30, 157000, 1000, 1),
(88, 5, 10, 'Kem Lót Maybelline Kiềm Dầu Ngăn Xuống Tông SPF 20 30ml\r\n', '88.jpg', 'Kem lót Fit Me Primer Matte+Poreless SPF 20 đến từ thương hiệu Maybelline New York có thành phần tích hợp đất sét khoáng giúp kiềm dầu, ngăn nền xuống tông hiệu quả suốt 16H. Chất kem dạng sữa dễ tán, đem lại hiệu ứng làm mềm da, làm mờ lỗ chân lông ngay sau khi sử dụng. Ngoài ra, sản phẩm có thêm SPF 20 giúp bảo vệ da khỏi tác hại của ánh nắng mặt trời. Sản phẩm được khuyên dùng trước bước đánh kem nền để đem lại lớp nền mịn lì, không bóng dầu, không xuống tông suốt ngày dài.\r\n\r\n', 'Aqua / Water, Dimethicone, Glycerin, Isododecane, Trimethylsiloxysilicate, Alcohol, Butylene Glycol, Undecane, Silica, Aluminum Starch Octenylsuccinate, Peg-10 Dimethicone, Boron Nitride, Tridecane, Peg-9 Polydimethylsiloxyethyl Dimethicone, Isopropyl Lauroyl Sarcosinate, Diisopropyl Sebacate, Disteardimonium Hectorite, Bis-Peg/Ppg-14/14 Dimethicone, Magnesium Sulfate, Silica Silylate, Phenoxyethanol, Dipentaerythrityl Tetrahydroxystearate/Tetraisostearate, Tocopherol, Tin Oxide, Parfum / Fragrance, Isopropyl Titanium Triisostearate, Alumina, Linalool, Limonene, Helianthus Annuus Seed Oil / Sunflower Seed Oil, [+/- May ContainCi 77891 / Titanium Dioxide, Mica, Ci 77491, Ci 77492 / Iron Oxides\r\n\r\n', 'oil', 30, 189000, 1000, 1),
(89, 6, 10, 'Kem Lót Bắt Sáng MAC Màu Silverlite - Trắng Bạc 50ml\r\n', '89.jpg', 'Kem Lót Bắt Sáng MAC Strobe Cream là sản phẩm kem lót trang điểm đến từ thương hiệu M.A.C, giúp mang đến vẻ ngoài toàn diện cho làn da, cho gương mặt trong như sương, tạo hiệu ứng làn da căng bóng và tỏa sáng. Nhờ thành phần chứa các chất chống oxy hóa, vitamin, trà xanh... sản phẩm giúp cung cấp ẩm cho làn da, tạo cảm giác tươi mát và tăng cường độ bắt sáng cho da trong mọi điều kiện ánh sáng.\r\n\r\n', 'Water\\Aqua\\Eau, Dimethicone, Butylene Glycol, Cetyl Ricinoleate, Glyceryl Distearate, Trisiloxane, Glyceryl Stearate Se, Cholesterol, Steareth-10, Simmondsia Chinensis (Jojoba) Seed Oil, Cetyl Esters, Cetyl Alcohol, Tocopheryl Acetate, Sodium Hyaluronate, Camellia Sinensis (Green Tea) Leaf Extract, Morus Bombycis (Mulberry) Root Extract, Pyrus Malus (Apple) Fruit Extract, Scutellaria Baicalensis Root Extract, Vitis Vinifera (Grape) Fruit Extract, Ceramide Ng, Cyanocobalamin, Glycerin, Isohexadecane, Silica, Tin Oxide, Sucrose, Polysorbate 80, Acrylamide/Sodium Acryloyldimethyltaurate Copolymer, Xanthan Gum, Caprylyl Glycol, Hexylene Glycol, Citric Acid, Linoleic Acid, Panthenol, Fragrance (Parfum), Disodium Edta, Edta, Magnesium Ascorbyl Phosphate, Sodium Citrate, Phenoxyethanol, Sodium Metabisulfite, Sodium Sulfite, [+/- Mica, Titanium Dioxide (Ci 77891), Red 4 (Ci 14700)]\r\n\r\n', 'all', 50, 1100000, 100, 1),
(90, 5, 11, 'Kem Nền Maybelline Mịn Nhẹ Kiềm Dầu Chống Nắng #115 30ml\r\n', '90.jpg', 'Kem Nền Mịn Nhẹ, Kiềm Dầu Maybelline Fit Me 30ml là dòng sản phẩm kem nền đến từ thương hiệu mỹ phẩm MAYBELLINE của Mỹ, gây tiếng vang trong giới làm đẹp toàn thế giới và được mệnh danh là kem nền \'quốc dân\' khi có mặt tại Việt Nam.\r\n\r\nKem Nền Fit Me Matte Poreless Foundation SPF 22 gây ấn tượng với khả năng kiềm dầu hiệu quả suốt cả ngày dài nhờ thành phần đất sét khoáng, cho lớp nền mịn lì tự nhiên, đồng thời che phủ tốt mọi khuyết điểm trên bề mặt da.', 'Water, Cyclohexasiloxane, Nylon-12, Isododecane, Alcohol Denat., Cyclopentasiloxane, Peg-10 Dimethicone, Cetyl Peg/Ppg-10/1 Dimethicone, Peg-20, Polyglyceryl-4 Isostearate, Disteardimonium Hectorite, Phenoxyethanol, Magnesium Sulfate, Disodium Stearoyl Glutamate, Hdi/Trimethylol Hexyllactone Crosspolymer, Titanium Dioxide [Nano] / Titanium Dioxide, Methylparaben, Acrylates Copolymer, Tocopherol, Butylparaben, Aluminum Hydroxide, Alumina, Silica, Glycerin, Ci 77891 / Titanium Dioxide, Ci 77491, Ci 77492, Ci 77499\r\n\r\n', 'oil', 30, 204000, 1000, 1),
(91, 5, 11, 'Kem Nền Maybelline Mịn Nhẹ Kiềm Dầu Chống Nắng #118 30ml\r\n', '91.jpg', 'Kem Nền Mịn Nhẹ, Kiềm Dầu Maybelline Fit Me 30ml là dòng sản phẩm kem nền đến từ thương hiệu mỹ phẩm MAYBELLINE của Mỹ, gây tiếng vang trong giới làm đẹp toàn thế giới và được mệnh danh là kem nền \'quốc dân\' khi có mặt tại Việt Nam.\r\n\r\nKem Nền Fit Me Matte Poreless Foundation SPF 22 gây ấn tượng với khả năng kiềm dầu hiệu quả suốt cả ngày dài nhờ thành phần đất sét khoáng, cho lớp nền mịn lì tự nhiên, đồng thời che phủ tốt mọi khuyết điểm trên bề mặt da.', 'Water, Cyclohexasiloxane, Nylon-12, Isododecane, Alcohol Denat., Cyclopentasiloxane, Peg-10 Dimethicone, Cetyl Peg/Ppg-10/1 Dimethicone, Peg-20, Polyglyceryl-4 Isostearate, Disteardimonium Hectorite, Phenoxyethanol, Magnesium Sulfate, Disodium Stearoyl Glutamate, Hdi/Trimethylol Hexyllactone Crosspolymer, Titanium Dioxide [Nano] / Titanium Dioxide, Methylparaben, Acrylates Copolymer, Tocopherol, Butylparaben, Aluminum Hydroxide, Alumina, Silica, Glycerin, Ci 77891 / Titanium Dioxide, Ci 77491, Ci 77492, Ci 77499\r\n\r\n', 'oil', 30, 204000, 1000, 1),
(92, 5, 11, 'Kem Nền Maybelline Mịn Nhẹ Kiềm Dầu Chống Nắng #118 30ml\r\n', '92.jpg', 'Kem Nền Mịn Nhẹ, Kiềm Dầu Maybelline Fit Me 30ml là dòng sản phẩm kem nền đến từ thương hiệu mỹ phẩm MAYBELLINE của Mỹ, gây tiếng vang trong giới làm đẹp toàn thế giới và được mệnh danh là kem nền \'quốc dân\' khi có mặt tại Việt Nam.\r\n\r\nKem Nền Fit Me Matte Poreless Foundation SPF 22 gây ấn tượng với khả năng kiềm dầu hiệu quả suốt cả ngày dài nhờ thành phần đất sét khoáng, cho lớp nền mịn lì tự nhiên, đồng thời che phủ tốt mọi khuyết điểm trên bề mặt da.', 'Water, Cyclohexasiloxane, Nylon-12, Isododecane, Alcohol Denat., Cyclopentasiloxane, Peg-10 Dimethicone, Cetyl Peg/Ppg-10/1 Dimethicone, Peg-20, Polyglyceryl-4 Isostearate, Disteardimonium Hectorite, Phenoxyethanol, Magnesium Sulfate, Disodium Stearoyl Glutamate, Hdi/Trimethylol Hexyllactone Crosspolymer, Titanium Dioxide [Nano] / Titanium Dioxide, Methylparaben, Acrylates Copolymer, Tocopherol, Butylparaben, Aluminum Hydroxide, Alumina, Silica, Glycerin, Ci 77891 / Titanium Dioxide, Ci 77491, Ci 77492, Ci 77499\r\n\r\n', 'oil', 30, 199000, 1000, 1),
(93, 1, 11, 'Kem Nền Maybelline Lâu Trôi 112 Tông Da Sáng 30ml\r\n', '93.jpg', 'Kem Nền Lâu Trôi Maybelline SuperStay Long Lasting Full Coverage Foundation 30ml là dòng sản phẩm kem nền vượt trội mới ra mắt từ Maybelline New York. Với công nghệ hạt màu giúp che phủ mọi khuyết điểm trên da và hạt phấn mỏng, mịn, siêu nhẹ, siêu lâu trôi giúp lớp nền của bạn hoàn hảo lên tới 24H mà không bị chảy hay xuống tông, kể cả khi gặp nước. Kem nền kiềm dầu, không làm bít tắc lỗ chân lông, phù hợp với mọi loại da. Sản phẩm được kiểm nghiệm bởi bác sĩ da liễu.\r\n\r\n', 'Cyclopentasiloxane, Aqua / Water, Polypropylsilsesquioxane, Isododecane, Dimethicone, C30-45 Alkyldimethylsilyl Polypropylsilsesquioxane, Peg-10 Dimethicone, Glycerin, Silica, Dimethicone/Polyglycerin-3 Crosspolymer, Sodium Chloride, Nylon-12, Phenoxyethanol, Disteardimonium Hectorite, Disodium Stearoyl Glutamate, Cyclomethicone, Chlorphenesin, Ethylparaben, Disodium Edta, Acrylonitrile/Methyl Methacrylate/Vinylidene Chloride Copolymer, Aluminum Hydroxide, Dipropylene Glycol, Isobutane, Paraffin, Sodium Citrate, Tocopherol, Isopropyl Alcohol, [+/- May Contain Ci 77891 / Titanium Dioxide, Ci 77491, Ci 77492, Ci 77499 / Iron Oxides ] G854042\r\n\r\n', 'all', 30, 229000, 1000, 1),
(94, 1, 11, 'Kem Nền Maybelline Lâu Trôi 120 Tông Da Sáng 30ml\r\n', '94.jpg', 'Kem Nền Lâu Trôi Maybelline SuperStay Long Lasting Full Coverage Foundation 30ml là dòng sản phẩm kem nền vượt trội mới ra mắt từ Maybelline New York. Với công nghệ hạt màu giúp che phủ mọi khuyết điểm trên da và hạt phấn mỏng, mịn, siêu nhẹ, siêu lâu trôi giúp lớp nền của bạn hoàn hảo lên tới 24H mà không bị chảy hay xuống tông, kể cả khi gặp nước. Kem nền kiềm dầu, không làm bít tắc lỗ chân lông, phù hợp với mọi loại da. Sản phẩm được kiểm nghiệm bởi bác sĩ da liễu.\r\n\r\n', 'Cyclopentasiloxane, Aqua / Water, Polypropylsilsesquioxane, Isododecane, Dimethicone, C30-45 Alkyldimethylsilyl Polypropylsilsesquioxane, Peg-10 Dimethicone, Glycerin, Silica, Dimethicone/Polyglycerin-3 Crosspolymer, Sodium Chloride, Nylon-12, Phenoxyethanol, Disteardimonium Hectorite, Disodium Stearoyl Glutamate, Cyclomethicone, Chlorphenesin, Ethylparaben, Disodium Edta, Acrylonitrile/Methyl Methacrylate/Vinylidene Chloride Copolymer, Aluminum Hydroxide, Dipropylene Glycol, Isobutane, Paraffin, Sodium Citrate, Tocopherol, Isopropyl Alcohol, [+/- May Contain Ci 77891 / Titanium Dioxide, Ci 77491, Ci 77492, Ci 77499 / Iron Oxides ] G854042\r\n\r\n', 'all', 30, 229000, 1000, 1),
(95, 1, 11, 'Kem Nền L\'Oréal Mịn Nhẹ Dưỡng Da Dạng Lỏng G2 30ml\r\n', '95.jpg', 'Kem Nền L\'Oréal Paris Mịn Nhẹ Dưỡng Da Dạng Lỏng True Match Super-Blendable Foundation 30ml chính là sản phẩm rất phù hợp với làn da châu Á. Được tích hợp các thành phần dưỡng ẩm giúp bổ sung độ ẩm đầy đủ cho làn da cùng với các hạt màu siêu mềm mịn, sản phẩm sẽ tạo độ che phủ và mang đến cho bạn làn da mịn màng, tươi sáng thật tự nhiên. Đặc biệt, lớp phấn còn có khả năng kiềm dầu hiệu quả cho bạn sự thông thoáng suốt cả ngày. \r\n\r\n', 'Nội dung đang được cập nhật', 'oil', 30, 262000, 1000, 1),
(96, 6, 11, 'Kem Nền MAC Lâu Trôi #NC20 Màu Be Vàng Cho Da Sáng 30ml\r\n', '96.jpg', 'Kem Nền Lâu Trôi MAC Studio Fix Fluid SPF 15 là dòng sản phẩm kem nền bán chạy nhất của thương hiệu mỹ phẩm trang điểm chuyên nghiệp M·A·C xuất xứ từ Mỹ, nổi tiếng với lớp finish mịn lì cùng độ che phủ cao, kết hợp chỉ số chống nắng phổ rộng SPF 15 và khả năng bền màu lâu trôi đến 24h, kể cả trên nền da dầu vào mùa hè, chắc chắn sẽ mang đến cho bạn gái một vẻ ngoài hoàn hảo suốt cả ngày lẫn đêm.\r\n\r\n', 'Octinoxate 2.50%, Titanium Dioxide 1.00%Ingredients: Water\\Aqua\\Eau, Cyclopentasiloxane, Peg-10 Dimethicone, Butylene Glycol, Trimethylsiloxysilicate, Dimethicone, Magnesium Sulfate, Laminaria Saccharina Extract, Algae Extract, Tocopheryl Acetate, Sodium Hyaluronate, Tocopherol, Lecithin, Hydrogenated Lecithin, Xanthan Gum, Sorbitan Sesquioleate, Methoxy Amodimethicone/Silsesquioxane Copolymer, Laureth-7, Dipropylene Glycol, Dimethicone/Peg-10/15 Crosspolymer, Dimethicone/Peg-10 Crosspolymer, Peg/Ppg-18/18 Dimethicone, Disteardimonium Hectorite, Silica, Dimethicone Crosspolymer, Triethoxycaprylylsilane, Propylene Carbonate, Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Sorbic Acid, Chloroxylenol, Phenoxyethanol, [+/- Titanium Dioxide (Ci 77891), Iron Oxides (Ci 77491, Ci 77492, Ci 77499), Chromium Oxide Greens (Ci 77288)]\r\n\r\n', 'oil', 30, 1090000, 1000, 1),
(97, 5, 12, 'Bút Cushion Che Khuyết Điểm Maybelline 120 Light 6ml\r\n', '97.jpg', 'Che Khuyết Điểm Maybelline Instant Age Rewind Treatment Concealer chính là “cứu tinh” cho những đôi mắt “gấu trúc” cần che đi quầng thâm mệt mỏi và bọng mắt “xấu xí” khi có thể che phủ những khuyết điểm chỉ trong giây lát và giữ kết quả “tuyệt vời” ấy trong nhiều giờ, để bạn có thể tự tin với đôi mắt tươi sáng và gương mặt đầy vẻ trẻ trung. Nếu bạn đang tìm một phép màu như vậy, Maybelline Instant Age Rewind Treatment Concealer chính là sản phẩm dành cho bạn.\r\n\r\n\r\n', 'Nội dung đang được cập nhật', 'all', 6, 165000, 1000, 1),
(98, 5, 12, 'Kem Che Khuyết Điểm Maybelline Mịn Lì 10 Light Leger 6.8ml\r\n', '98.jpg', 'Maybelline New York là công ty mỹ phẩm hàng đầu tại Mỹ. Khởi nguồn từ việc bán mascara qua thư điện tử, mascara Maybelline nhanh chóng trở thành món đồ không thể thiếu được của các cô gái. Ngày nay, mascara Maybelline là mascara được yêu thích của nước Mỹ và được sự tin tưởng của các chuyên gia trang điểm hàng đầu thế giới. Không chỉ dừng lại ở đấy, Maybelline còn mở rộng cung cấp bộ sưu tập trang điểm về toàn phương diện. Bạn sẽ luôn tìm thấy mọi thứ tốt nhất từ Maybelline.\r\n\r\n', 'Nội dung đang được cập nhật', 'all', 6, 121000, 1000, 1),
(99, 1, 12, 'Kem Che Khuyết Điểm L\'Oreal Màu Trung Bình 307 Cashemere 10ml\r\n', '99.jpg', 'Kem Che Khuyết Điểm L\'Oreal Infallible Full Wear More Than Concealer 10ml đến từ thương hiệu đình đám L\'Oréal Paris sẽ giúp hiệu chỉnh tông màu da, cùng với đầu tán cọ lớn sản phẩm sẽ che đi mọi khuyết điểm đồng thời giấu đi sự mệt mỏi, kém sắc trên làn da bạn. Hiện sản phẩm đã có mặt tại Hasaki.\r\n\r\n', 'Aqua / Water, Undecane, Glycerin, Dimethicone, Polyglyceryl-4 Isostearate, Synthetic Fluorphlogopite, Pentylene Glycol, Butylene Glycol, Tridecane, Cetyl Peg/Ppg-10/1 Dimethicone, Hexyl Laurate, Magnesium Sulfate, Polyhydroxystearic Acid,…\r\n\r\n', 'all', 10, 172000, 1000, 1);
INSERT INTO `product` (`product_id`, `brand_id`, `product_type`, `product_name`, `img`, `info`, `ingredient`, `skin_type`, `volume`, `price`, `quantity`, `state`) VALUES
(100, 5, 13, 'Phấn Phủ Mịn Lì Fit Me Maybelline 120 Classic Ivory\r\n', '100.jpg', 'Phấn Phủ Mịn Lì Maybelline Fit Me Matte + Poreless Powder là giải pháp tuyệt vời giúp giảm thiểu tối ưu khuyết điểm trên da nhưng không gây tình trạng bít tắc lỗ chân lông. Đặc biệt, các hạt phấn sẽ len lỏi trong các lỗ chân lông nhằm che phủ và đặc biệt hạn chế tuyến bã nhờn hiệu quả. Chính vì vậy, sản phẩm vô cùng thít hợp với những cô nàng da thường hoặc da dầu, nhờn đấy nhé!\r\n\r\n', 'Talc, Perlite, Triisostearin, Phenyl Trimethicone, Magnesium Stearate, Caprylyl Glycol, [+/- May Contain / Peut Contenir Ci 77891 / Titanium Dioxide Ci 77491, Ci 77492, Ci 77499 / Iron Oxides ] F.I.L. D166492/2.\r\n\r\n', 'all', 5, 161000, 1000, 1),
(101, 5, 13, 'Phấn Nền Maybelline Mịn Nhẹ Kiềm Dầu Chống Nắng #120\r\n', '101.jpg', 'Maybelline Fit Me Matte Poreless Compact Powder SPF28 PA+++ là dòng sản phẩm phấn nền nổi tiếng đến từ thương hiệu trang điểm Maybelline New York của Mỹ - sự lựa chọn lý tưởng dành cho các cô nàng có làn da dầu nhờn Kết cấu hạt phấn mịn nhẹ cùng khả năng kiềm dầu lên đến 12H sẽ giúp mang lại lớp trang điểm mịn màng, tự nhiên, không gây bết dính da. Ngoài ra, sản phẩm còn được tăng cường thêm chỉ số chống nắng SPF 28 PA+++ hỗ trợ bảo vệ làn da tối ưu hơn dưới ánh nắng mặt trời.\r\n\r\n', 'Nội dung đang được cập nhật', 'oil', 6, 149000, 1000, 1),
(102, 6, 13, 'Phấn Nền Phủ MAC #NC20 Màu Be Vàng Cho Da Sáng 15g\r\n', '102.jpg', 'Phấn Nền Phủ MAC Studio Fix Powder Plus Foundation là sản phẩm trang điểm tích hợp 2 trong 1: kem nền + phấn phủ chỉ trong một bước, mang đến cho bạn lớp nền hoàn hảo mịn màng, không tì vết với độ che phủ từ trung bình đến cao và kết cấu mượt mà không làm bí da. Sản phẩm có màu sắc chân thật, không vón cục, không gây hiện tượng dày phấn và bám tốt trên da trong 12 giờ. Bảng màu đa dạng phù hợp với nhiều tông da.\r\n\r\n', 'Talc, Silica, Isostearyl Palmitate, Methicone, Caprylyl Glycol, Hexylene Glycol, Phenoxyethanol, [+/- Titanium Dioxide (Ci 77891), Iron Oxides (Ci 77491, Ci 77492, Ci 77499), Chromium Oxide Greens (Ci 77288), Ultramarines (Ci 77007)]\r\n\r\n', 'all', 15, 1090000, 1000, 1),
(103, 6, 13, 'Phấn Phủ MAC Dạng Bột Kiềm Dầu 9g\r\n', '103.jpg', 'Phấn Phủ Dạng Bột Kiềm Dầu MAC Prep + Prime Transparent Finishing Powder là sản phẩm thuộc thương hiệu M.A.C nổi tiếng không chỉ ở Mỹ mà còn trên toàn thế giới. Các sản phẩm của M.A.C luôn mang đến những ưu điểm vô cùng xịn sò và sản phẩm lần này cũng như thế.\r\n\r\n', 'Zea Mays (Corn) Starch, Silica, Mica, Zinc Stearate, Caprylyl Glycol, 1,2-Hexanediol <ILN34747>\r\n\r\n', 'oil', 9, 1010000, 1000, 1),
(104, 5, 14, 'Mascara Maybelline Dài Mi và Cong Mi, Chuốt Mi Đen 9.2ml\r\n', '104.jpg', 'Mascara Maybelline Volum’ Express Hyper Curl có tác dụng giúp làm dày gấp 3 lần và hàng mi cong vút 75 độ, bền đẹp suốt 18 giờ. Sản phẩm phù hợp với hàng mi mỏng, thưa và không được dài. Nhờ công thức tối ưu kết hợp với đầu cọ được thiết kế dễ dàng chải tận gốc sợi mi, giúp mascara được bao phủ hiệu quả, cho bạn đôi mi dày ấn tượng, cong quyến rũ.\r\n\r\n', 'Isododecane, Cera Alba/ Beeswax, Copernicia Cerifera Cera/ Carnauba Wax, Disteardimonium Hectorite, Aqua/ Water, Allyl Stearate/ Va Copolymer, Oryza Sativa Cera/ Rice Bran Wax, Paraffin, Alcohol Denat, Polyvinyl Laurate, Vp/ Eicosene Copolymer, Propylene Carbonate, Talc, Ethylenediamine/ Stearyl Dimer Dilinoleate Copolymer, Peg-30 Glyceryl Stearate, Poly C10-30 Alkyl Acrylate, Propylparaben, Methylparaben, Hydrogenated Jojoba Oil, Calcium Sodium Borosilicate, Silica [+/- May Contain Ci 77491, Ci 77492, Ci 77499 / Iron Oxides, Ci 7707 / Ultramarines, Ci 77891 / Titanium Dioxide, Ci 75470 / Carmine, Ci 77288 / Chromium Oxide Greens, Ci 77510 / Ferric Ammonium Ferrocyanide, Ci 77742 / Manganese Violet, Mica, Ci 77266 / Black 2, Ci 77510 / Ferric Ferrocyanide]\r\n\r\n', '', 9, 129000, 1000, 1),
(105, 5, 14, 'Mascara Maybelline Làm Dài Và Tơi Mi Màu Đen 10ml\r\n', '105.jpg', 'Bạn muốn hàng mi dày cong ấn tượng, hay tự nhiên lôi cuốn? Mascara Làm Dài Và Tơi Mi Maybelline Lash Sensational WaterProof Mascara là dòng sản phẩm mới ra mắt năm 2015 của thương hiệu mỹ phẩm đình đám Maybelline. Nhờ đầu cọ lược độc đáo với 6 loại lược  khác nhau trong 10 lớp lược, sản phẩm này giúp bạn chải đều từng lớp mi nhỏ và ngắn nhất, cho hàng mi bạn tơi dài và xòe đều như cánh quạt, làm đôi mắt càng trở nên sâu hút hồn và quyến rũ.\r\n\r\n', 'Isododecane , Cera Alba / Beeswax, Copernicia Cerifera Cera / Carnauba Wax , Disteardimonium Hectorite , Aqua / Water, Allyl Stearate/Va Copolymer, Oryza Sativa Cera / Rice Bran Wax ,Paraffin, Alcohol Denat.,Polyvinyl Laurate ,Vp/Eicosene Copolymer ,Propylene Carbonate ,Talc , Ethylenediamine/Stearyl Dimer, Dilinoleate Copolymer, Peg-30 Glyceryl Stearate ,Propylparaben, Methylparaben, Hydrogenated Jojoba Oil, Propylene Glycol,Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Silica, Phenoxyethanol, Soluble Collagen, Bht, Trisodium Edta, Potassium Sorbate. [+/- May Contain Ci 77491, Ci 77492, Ci 77499 / Iron Oxides, Ci 77007 / Ultramarines, Ci 77891 / Titanium Dioxide, Mica, Ci 75470 / Carmine, Ci 77288 / Chromium Oxide Greens, Ci 77742 / Manganese Violet, Ci 77510 / Ferric Ferrocyanide}\r\n\r\n', '', 10, 178000, 1000, 1),
(106, 5, 14, 'Mascara Maybelline Làm Dày Mi & Ngăn Rụng Mi Màu Đen 9.2ml\r\n', '106.jpg', 'Mascara Làm Dày Mi Gấp 10 Lần & Ngăn Rụng Mi Màu Đen Mascara Maybelline Colossal Waterproof Black 9.2ml từ thương hiệu Maybelline của Mỹ ứng dụng công nghệ mới với Collagen và cọ cong độc đáo đặc biệt cho mi dày hơn đến 10 lần. Đồng thời chứa thành phần dưỡng chất nuôi dưỡng mi tránh gãy rụng. Sản phẩm giúp mi dày ấn tượng, ngay lập tức để bạn tự tin và cuốn hút hơn.\r\n\r\n', 'Isododecane, Cera Alba / Beeswax, Copernicia Cerifera Cera / Carnauba Wax, Disteardimonium Hectorite, Aqua / Water, Ci 77499 / Iron Oxides, Allyl Stearate/Va Copolymer, Oryza Sativa Cera / Rice Bran Wax\r\n\r\n', '', 9, 144000, 1000, 1),
(107, 5, 14, 'Mascara Maybelline Uốn Mi, Nâng Mi và Làm Dày Mi 8.6ml\r\n', '107.jpg', 'Mascara Maybelline Làm Cong Mi Falsies Lash Lift Mascara 8ml là dòng mascara đến từ thương hiệu mỹ phẩm MAYBELLINE của Mỹ, với thiết kế đầu cọ cong trục xoắn xen kẽ tạo hiệu ứng uốn và nâng mi đạt hiệu quả uốn cong cực đại từ chân mi cùng với công thức chống thấm nước thích hợp cho bạn gái thường xuyên có các hoạt động ngoài trời và có mí mắt dầu. Hiện sản phẩm Mascara Maybelline Làm Cong Mi Falsies Lash Lift Mascara 8ml đã có mặt tại Hasaki. \r\n\r\n', 'Aqua / Water/ Eau, Potassium Cetyl Phosphate, Paraffin, Ethylene/Va Copolymer, Copernicia Cerifera Cera / Carnauba Wax / Cire De Carnauba\r\nStyrene/Acrylates/Ammonium Methacrylate Copolymer, Cera Alba / Beeswax / Cire Dabeille, Synthetic Beeswax, Bis-Diglyceryl Polyacyladipate-2, Polybutene, Cetyl Alcohol, Steareth-20, Glyceryl Dibehenate, Steareth-2, Phenoxyethanol, Hydroxyethylcellulose, Acacia Senegal Gum, Tribehenin, Caprylyl Glycol, Glyceryl Behenate, Sodium Dehydroacetate, Hydrogenated Jojoba Oil, Hydrogenated Palm Oil, Disodium Edta, Butylene Glycol, Rayon, Sodium Laureth Sulfate, Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Tetrasodium Edta, Silica, Potassium Sorbate, Bht\r\n[+/- May Contain / Peut Contenir\r\nCi 77491, Ci 77492, Ci 77499 / Iron Oxides, Ci 77007 / Ultramarines, Ci 77891 / Titanium Dioxide, Mica, Ci 75470 / Carmine, Ci 77288 / Chromium Oxide Greens, Ci 77742 / Manganese Violet, Ci 77510 / Ferric Ferrocy Anide ] (f.i.l. D235275/1]\r\n\r\n', '', 9, 175000, 1000, 1),
(108, 5, 14, 'Mascara Maybelline Tơi Dài Mi Không Giới Hạn 6ml\r\n', '108.jpg', 'Mascara Maybelline Làm Dài Và Dày Mi Màu Very Black 6ml là sản phẩm mascara đến từ thương hiệu mỹ phẩm Maybelline của Mỹ, với công thức không thấm nước và mang lại hàng mi cong vút từ mọi góc độ, tạo độ dài và dày mi vô cùng cuốn hút.\r\n\r\n', 'G684942 Isododecane, Cera Alba / Beeswax / Cire Dabeille, Copernicia Cerifera Cera / Carnauba Wax / Cire De Carnauba, Disteardimonium Hectorite, Aqua / Water / Eau, Alcohol Denat., Allyl Stearate/Va Copolymer, Oryza Sativa Cera / Rice Bran Wax, Paraffin, Polyvinyl Laurate, Vp/Eicosene Copolymer, Propylene Carbonate, Talc, Synthetic Beeswax, Ethylenediamine/Stearyl Dimer Dilinoleate Copolymer, Peg-30 Glyceryl Stearate, Rayon, Hydrogenated Jojoba Oil, Caprylic/Capric Triglyceride, Silica, Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Bambusa Vulgaris Extract, Bht [+/- May Contain / Peut Contenir Ci 77491, Ci 77492, Ci 77499 / Iron Oxides, Ci 77007 / Ultramarines, Mica, Ci 77891 / Titanium Dioxide, Ci 75470 / Carmine, Ci 77288 / Chromium Oxide Greens, Ci 77742 / Manganese Violet, Ci 77510 / Ferric Ferrocyanide F.I.L. D250537/1\r\n\r\n', '', 6, 209000, 1000, 1),
(109, 1, 14, 'Mascara L\'Oreal Không Trôi, Làm Dày & Dài Mi 7.6ml\r\n', '109.jpg', 'Mascara L\'Oreal Không Trôi, Làm Dày & Dài Mi 7.6ml là sản phẩm mascara đến từ thương hiệu mỹ phẩm L\'Oreal của Pháp, có khả năng làm dày và cho độ dài gợi cảm. Đầu chổi được thiết kế dạng đồng hồ cát với hàng trăm sợi lông cứng, nhỏ nhằm giúp chuốt dễ dàng những sợi mi “khó nhằn”.\r\n\r\n', 'Isododecane; Cera Alba / Beeswax / Cire Dabeille; Copernicia Cerifera Cera / Carnauba Wax / Cire De Carnauba; Disteardimonium Hectorite; Dilinoleic Acid/Butanediol Copolymer; Aqua / Water / Eau; Allyl Stearate/Va Copolymer; Oryza Sativa Cera / Rice Bran Wax; Paraffin; Alcohol Denat; Polyvinyl Laurate; Vp/Eicosene Copolymer; Propylene Carbonate; Talc; Synthetic Beeswax; Ethylenediamine/Stearyl; Dimer Dilinoleate Copolymer; Peg-30 Glyceryl Stearate; Candelilla Cera / Candelilla Wax / Cire De Candelilla; Panthenol; Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate; Bht [+/- May Contain / Peut Contenir; Ci 77499 / Iron Oxides; Ci 77891 / Titanium Dioxide\r\n\r\n', '', 8, 212000, 1000, 1),
(110, 1, 14, 'Mascara Làm Cong Và Dày Mi L\'Oreal 11ml\r\n', '110.jpg', 'Mascara Làm Cong Và Dày Mi L\'OREAL Curl Impact Collagene với đầu chải xoắn làm cong mi mới, dễ dàng chạm đến những vùng vi khó chải nhất ở 2 góc mắt từ đó tạo hiệu ứng cân bằng và cong hoàn hảo cho hàng mi bạn. Hơn nữa, công thức mới chứa Collagen và Curl Fixing Complex sẽ giúp mi dày hơn đến 13 lần.\r\n\r\n', 'Aqua / Water,Styrene/Acrylates/Ammonium Methacrylate Copolymer,Cera Alba / Beeswax,Hydrogenated Jojoba Oil,Butylene Glycol,Steareth-20,Cera Carnauba / Carnauba Wax,Alcohol Denat.,Glyceryl Stearate,Sodium Laureth-12 Sulfate,Acrylamide/Sodium Acryloyldimethyltaurate Copolymer,Phenoxyethanol,Isohexadecane,Caprylyl Glycol,Methylparaben,Sodium Dehydroacetate,Disodium Edta,Pentaerythrityl Tetraisostearate,Ethylparaben,Polysorbate 80,Potassium Sorbate,Trisodium Edta,Propylene Glycol,Propylparaben,Sodium Hyaluronate,2-Oleamido-1,3-Octadecanediol,Panthenol,Silica,Soluble Collagen,Silica Dimethyl Silylate,Sodium Chondroitin Sulfate,Atelocollagen\r\n\r\n', '', 11, 221000, 1000, 1),
(111, 5, 15, 'Bút Kẻ Mắt Nước Maybelline Sắc Mảnh BK1 Đen Sắc Sảo 0.4g\r\n', '111.jpg', 'Bút Kẻ Mắt Nước Sắc Mảnh Maybelline Hyper Sharp Liner Extreme 0.4g là sản phẩm kẻ mắt nước đến từ thương hiệu mỹ phẩm Maybelline của Mỹ, áp dụng công nghệ Ink Capsule mới giúp dòng mực ra đều hơn 147% và đậm nét hơn so với phiên bản cũ đồng thời giữ đường eyeliner bền màu suốt 36 giờ. Với đầu cọ sắc mảnh 0,01mm giúp bạn linh hoạt tạo ra những đường kẻ như ý.\r\n\r\n', 'Aqua/Water, Ammonium Acrylates Copolymer, Ci 77266/Black 2, Butylene Glycol, 1,2-Hexanediol, Alcohol, Phenoxyethanol, Beheneth-30, Aminomethyl Propanol, Simethicone, Sorbitan Laurate, Sorbitan Palmitate, Hydrogenated Palm Glycerides…\r\n\r\n', '', 0, 163000, 1000, 1),
(112, 5, 15, 'Bút Kẻ Mắt Nước Maybelline Sắc Mảnh BR1 Nâu Tự Nhiên 0.4g\r\n', '112.jpg', 'Bút Kẻ Mắt Nước Sắc Mảnh Maybelline Hyper Sharp Liner Extreme 0.4g là sản phẩm kẻ mắt nước đến từ thương hiệu mỹ phẩm Maybelline của Mỹ, áp dụng công nghệ Ink Capsule mới giúp dòng mực ra đều hơn 147% và đậm nét hơn so với phiên bản cũ đồng thời giữ đường eyeliner bền màu suốt 36 giờ. Với đầu cọ sắc mảnh 0,01mm giúp bạn linh hoạt tạo ra những đường kẻ như ý.\r\n\r\n', 'Aqua / Water, Ammonium Acrylates Copolymer, Ci 77491 / Iron Oxides, Butylene Glycol, 1,2-Hexanediol, Ci 77266 / Black 2, Phenoxyethanol, Beheneth-30, Hydroxyacetophenone, Caprylyl Glycol, Titanium/Titanium Dioxide, Aminomethyl Propanol,…\r\n\r\n', '', 0, 168000, 1000, 1),
(113, 5, 15, 'Bút Kẻ Mắt Lâu Trôi Maybelline 1g\r\n', '113.jpg', 'Bút Kẻ Mắt Lâu Trôi Maybelline Line Tattoo High Impact Liner - Intense Black 1g là sản phẩm của thương hiệu Maybelline của Mỹ với đầu cọ siêu mảnh, sắc nét cực kì linh hoạt giúp bạn dễ dàng vẽ mắt từ nét mỏng tự nhiên đến dày cá tính. Công nghệ độc đáo không lem, không thấm nước, lâu trôi suốt 36h nhưng lại cực kì dễ tẩy trang. Kẻ mắt chính là tuyệt chiêu giúp đôi mắt luôn to tròn, ấn tượng cho mọi cô nàng.\r\n\r\n', 'Aqua / Water, Styrene/Acrylates Copolymer, Ci 77266 / Black 2, Propylene Glycol, Laureth-21, Pentylene Glycol, Peg-40 Hydrogenated Castor Oil, Phenoxyethanol, Ammonium Acrylates Copolymer, Caprylyl Glycol, Ppg-2-Deceth-30, Sodium Dehydroacetate, …\r\n\r\n', '', 1, 129000, 1000, 1),
(114, 1, 15, 'Kẻ Mắt Nước Mắt Mèo L\'Oreal Màu Đen 9g\r\n', '114.jpg', 'Kẻ Mắt Nước Mắt Mèo L\'Oreal Màu Đen Super Liner Flash Cat Eye - Black đến từ thương hiệu mỹ phẩm trang điểm L\'Oreal Paris nổi tiếng của Pháp, sản phẩm được sản xuất theo công nghệ tiên tiến giúp bạn nhanh chóng có được các đường kẻ mắt chính xác, sắc sảo mà không sợ lem. Đồng thời, màu sắc được đổ ra rất đậm và sắc nét, góp phần trang điểm hoàn thiện nên đôi mắt cá tính và hiện đại trên gương mặt bạn. Hiện sản phẩm đã có mặt tại Hasaki.\r\n\r\n', 'Aqua / Water, Styrene/Acrylates Copolymer, Propylene Glycol, Laureth-21, Pentylene Glycol, Peg-40 Hydrogenated Castor Oil, Phenoxyethanol, Ammonium Acrylates Copolymer, Caprylyl Glycol, Ppg-2-Deceth-30, Sodium Dehydroacetate, Sodium Lauryl Sulfate, Disodium Laureth Sulfosuccinate\r\n\r\n', '', 9, 213000, 1000, 1),
(115, 1, 15, 'Bút Kẻ Mắt L\'Oreal 2 Đầu 1.6g\r\n', '115.jpg', 'Một đôi mắt quyến rũ, sắc nét luôn tạo được ấn tượng đặc biệt cho người đối diện và giúp chúng ta tự tin hơn. Bút Kẻ Mắt 2 Đầu Super Liner Duo Metallics của L’Oreal được sản xuất theo công nghệ tiên tiến nên rất an toàn cho làn da và sức khỏe của người sử dụng. Hơn nữa, bút được thiết kế thông minh với 2 đầu gồm một đầu dạ và một đầu chì để bạn có thể linh động chọn cách kẻ phù hợp nhất với phong cách trang điểm của mình, giúp bạn nhanh chóng có được các đường kẻ mắt chính xác, sắc sảo mà không sợ lem. Đồng thời, màu sắc được đổ ra rất đậm và sắc nét, góp phần hoàn thiện nên đôi mắt cá tính và hiện đại trên gương mặt bạn.\r\n\r\n', 'TRIMETHYLSILOXYSILICATE, CYCLOPENTASILOXANE, ISODODECANE, OZOKERITE, CYCLOHEXASILOXANE, POLYETHYLENE, POLYGLYCERYL-2 TRIISOSTEARATE, COPERNICIA CERIFERA CERA / CARNAUBA WAX, CERA MICROCRISTALLINA / MICROCRYSTALLINE WAX, SILICA, SYNTHETIC FLUORPHLOGOPITE, SORBITAN ISOSTEARATE, BHT, [+/- MAY CONTAIN CI 77499 / IRON OXIDES, CI 77266 / BLACK 2, AQUA / WATER, PROPYLENE GLYCOL, ACRYLATES/ETHYLHEXYL ACRYLATE COPOLYMER, LAURETH-21, ACRYLATES/DIMETHYLAMINOETHYL METHACRYLATE COPOLYMER, PEG-40 HYDROGENATED CASTOR OIL, PHENOXYETHANOL, AMMONIUM ACRYLATES COPOLYMER, CAPRYLYL GLYCOL, SODIUM LAURETH-12 SULFATE, C11-15 PARETH-7, SODIUM DEHYDROACETATE, BUTYLENE GLYCOL, SODIUM LAURYL SULFATE, DISODIUM LAURETH SULFOSUCCINATE, POTASSIUM SORBATE, [+/- MAY CONTAIN CI 77266 / BLACK 2].\r\n\r\n', '', 2, 256000, 1000, 1),
(116, 6, 16, 'Son Thỏi MAC Siêu Lì 707 Ruby Woo - Đỏ Cổ Điển 3g\r\n', '116.jpg', 'Son thỏi siêu lì Retro Matte Lipstick là một trong những dòng son môi mang tính biểu tượng đã làm nên tên tuổi của M·A·C. Nổi tiếng với chất son siêu lì, che khuyết điểm rãnh môi và khả năng lên màu cực chuẩn, Retro Matte mang đến phong cách đậm chất cá tính, quyến rũ nhưng không kém phần thời thượng.\r\n707 Ruby Woo: Sắc đỏ ánh xanh. Là thỏi son nổi tiếng nhất và bán chạy nhất của MAC. Tone màu đỏ chuẩn và sắc nét giúp gương mặt bạn luôn rạng rỡ và tươi trẻ.\r\n', 'Dimethicone, Isoeicosane, Kaolin, Ceresin, Paraffin, Isononyl Isononanoate, Microcrystalline Wax \\Cera Microcristallina\\Cire Microcristalline, Silica, Caprylic/Capric Triglyceride, Copernicia Cerifera (Carnauba) Wax\\Cera Carnauba\\Cire De Carnauba, Hydrogenated Polyisobutene, Vanillin, Tocopherol, Glyceryl Linoleate, Glyceryl Linolenate, Pvp/Hexadecene Copolymer, Methicone, Triethoxycaprylylsilane, [+/- Mica, Titanium Dioxide (Ci 77891), Iron Oxides (Ci 77491, Ci 77492, Ci 77499), Blue 1 Lake (Ci 42090), Bismuth Oxychloride (Ci 77163), Carmine (Ci 75470), Orange 5 Lake (Ci 45370), Red 6 (Ci 15850), Red 6 Lake (Ci 15850), Red 7 Lake (Ci 15850), Red 28 Lake (Ci 45410), Red 30 Lake (Ci 73360), Red 33 Lake (Ci 17200), Yellow 5 Lake (Ci 19140), Yellow 6 Lake (Ci 15985), Yellow 10 Lake (Ci 47005)]\r\n\r\n', '', 3, 650000, 1000, 1),
(117, 6, 16, 'Son Thỏi MAC Mịn Lì 646 Marrakesh - Đỏ Đất 3g\r\n', '117.jpg', 'Son môi MAC Matte Lipstick 3g thuộc dòng \"Matte\" - Lì là một trong những dòng son mang tính biểu tượng đã làm nên tên tuổi của M·A·C bên cạnh dòng Retro Matte trứ danh. Công thức son dạng kem đậm đặc cho độ lên màu cao với một bề mặt lì không bóng.\r\n646 Marrakesh: Sắc đỏ đất. Tông đỏ trầm ấm giúp tôn cả màu da và màu tóc.\r\n', 'Octyldodecanol, Ricinus Communis (Castor) Seed Oil, Silica, Tricaprylyl Citrate, Ozokerite, Isononyl Isononanoate, Paraffin, Phenyl Trimethicone, Microcrystalline Wax\\Cera Microcristallina\\Cire Microcristalline, Ethylhexyl Palmitate, Caprylic/Capric Triglyceride, Copernicia Cerifera (Carnauba) Wax\\ Copernicia Cerifera Cera \\Cire De Carnauba, Ascorbyl Palmitate, Tocopherol, Stearyl Stearoyl Stearate, Vanillin, Bht, [+/- Mica, Titanium Dioxide (Ci 77891), Iron Oxides (Ci 77491), Iron Oxides (Ci 77492), Iron Oxides (Ci 77499), Blue 1 Lake (Ci 42090), Carmine (Ci 75470), Red 6 (Ci 15850), Red 6 Lake (Ci 15850), Red 7 Lake (Ci 15850), Red 21 Lake (Ci 45380), Red 28 Lake (Ci 45410), Red 30 Lake (Ci 73360), Red 33 Lake (Ci 17200), Yellow 5 Lake (Ci 19140), Yellow 6 Lake (Ci 15985)]  ILN46425 \r\n\r\n', '', 3, 650000, 1000, 1),
(118, 6, 16, 'Son Thỏi MAC Mịn Lì 602 Chili - Đỏ Gạch 3g\r\n', '118.jpg', 'Son môi MAC Matte Lipstick 3g thuộc dòng \"Matte\" - Lì là một trong những dòng son mang tính biểu tượng đã làm nên tên tuổi của M·A·C bên cạnh dòng Retro Matte trứ danh. Công thức son dạng kem đậm đặc cho độ lên màu cao với một bề mặt lì không bóng.\r\n\r\n602 Chili: Sắc đỏ gạch. Thỏi son thiên nhiều về sắc đỏ cổ điển nhưng vẫn mang lại cảm giác tươi trẻ ngọt ngào khi thoa lên môi. Là màu son tôn da và quyến rũ, thu hút mọi ánh nhìn', 'Octyldodecanol, Ricinus Communis (Castor) Seed Oil, Silica, Tricaprylyl Citrate, Ozokerite, Isononyl Isononanoate, Paraffin, Phenyl Trimethicone, Microcrystalline Wax\\Cera Microcristallina\\Cire Microcristalline, Ethylhexyl Palmitate, Caprylic/Capric Triglyceride, Copernicia Cerifera (Carnauba) Wax\\ Copernicia Cerifera Cera \\Cire De Carnauba, Ascorbyl Palmitate, Tocopherol, Stearyl Stearoyl Stearate, Vanillin, Bht, [+/- Mica, Titanium Dioxide (Ci 77891), Iron Oxides (Ci 77491), Iron Oxides (Ci 77492), Iron Oxides (Ci 77499), Blue 1 Lake (Ci 42090), Carmine (Ci 75470), Red 6 (Ci 15850), Red 6 Lake (Ci 15850), Red 7 Lake (Ci 15850), Red 21 Lake (Ci 45380), Red 28 Lake (Ci 45410), Red 30 Lake (Ci 73360), Red 33 Lake (Ci 17200), Yellow 5 Lake (Ci 19140), Yellow 6 Lake (Ci 15985)]  ILN46425 \r\n\r\n', '', 3, 650000, 1000, 1),
(119, 5, 16, 'Son Lì Maybelline Mịn Môi Siêu Nhẹ 899 Đỏ Gạch 1.7g\r\n', '119.jpg', 'Son Lì Mịn Môi Siêu Nhẹ Maybelline Color Sensational Ultimatte là dòng son lì cao cấp mới nhất từ thương hiệu Maybelline New York, cho bạn 3 tính năng vượt trội \"Mịn - Mờ - Nhẹ tênh\". Với công nghệ làm mờ rãnh môi mang đến lớp finish mịn mờ sang trọng kết hợp công nghệ ultrafine powder cho son mịn lì nhẹ tênh. Thiết kế đầu son hình giọt sương nhỏ giúp son dễ dàng lướt nhẹ và chuẩn màu trên môi bạn. Đặc biệt, vỏ son “mảnh mai thon gọn” cùng màu sắc bắt mắt, khơi gợi hơi thở sang trọng, thời thượng và trẻ trung.\r\n899 More Rust: Đỏ gạch\r\n\r\n\r\n', 'G2033801 Dimethicone, Bis-Diglyceryl Polyacyladipate-2, Hydrogenated Polyisobutene, Phenyl Trimethicone, Tridecyl Trimellitate, Hydrogenated Jojoba Oil, Dimethicone Crosspolymer, Vinyl Dimethicone/Methicone Silsesquioxane Crosspolymer, Kaolin, Isostearyl Isostearate, Paraffin, Isohexadecane, Nylon-12, Cera Microcristallina / Microcrystalline Wax / Cire, Microcristalline, Polyethylene, Alumina, Synthetic Wax, Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Aluminum Hydroxide, Benzyl Alcohol, Silica, Tocopherol, Parfum / Fragrance,\r\n\r\n', '', 2, 174000, 1000, 1),
(120, 5, 16, 'Son Lì Maybelline Mịn Môi Siêu Nhẹ 299 Đỏ Thuần 1.7g\r\n', '120.jpg', 'Son Lì Mịn Môi Siêu Nhẹ Maybelline Color Sensational Ultimatte là dòng son lì cao cấp mới nhất từ thương hiệu Maybelline New York, cho bạn 3 tính năng vượt trội \"Mịn - Mờ - Nhẹ tênh\". Với công nghệ làm mờ rãnh môi mang đến lớp finish mịn mờ sang trọng kết hợp công nghệ ultrafine powder cho son mịn lì nhẹ tênh. Thiết kế đầu son hình giọt sương nhỏ giúp son dễ dàng lướt nhẹ và chuẩn màu trên môi bạn. Đặc biệt, vỏ son “mảnh mai thon gọn” cùng màu sắc bắt mắt, khơi gợi hơi thở sang trọng, thời thượng và trẻ trung.\r\n299 More Scarlet: Đỏ thuần\r\n\r\n\r\n', 'G2033801 Dimethicone, Bis-Diglyceryl Polyacyladipate-2, Hydrogenated Polyisobutene, Phenyl Trimethicone, Tridecyl Trimellitate, Hydrogenated Jojoba Oil, Dimethicone Crosspolymer, Vinyl Dimethicone/Methicone Silsesquioxane Crosspolymer, Kaolin, Isostearyl Isostearate, Paraffin, Isohexadecane, Nylon-12, Cera Microcristallina / Microcrystalline Wax / Cire, Microcristalline, Polyethylene, Alumina, Synthetic Wax, Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Aluminum Hydroxide, Benzyl Alcohol, Silica, Tocopherol, Parfum / Fragrance,\r\n\r\n', '', 2, 179000, 1000, 1),
(121, 5, 16, 'Son Lì Maybelline Mịn Môi Siêu Nhẹ 1288 Gạch Da 1.7g\r\n', '121.jpg', 'Son Lì Mịn Môi Siêu Nhẹ Maybelline Color Sensational Ultimatte là dòng son lì cao cấp mới nhất từ thương hiệu Maybelline New York, cho bạn 3 tính năng vượt trội \"Mịn - Mờ - Nhẹ tênh\". Với công nghệ làm mờ rãnh môi mang đến lớp finish mịn mờ sang trọng kết hợp công nghệ ultrafine powder cho son mịn lì nhẹ tênh. Thiết kế đầu son hình giọt sương nhỏ giúp son dễ dàng lướt nhẹ và chuẩn màu trên môi bạn. Đặc biệt, vỏ son “mảnh mai thon gọn” cùng màu sắc bắt mắt, khơi gợi hơi thở sang trọng, thời thượng và trẻ trung.\r\n1288 More Brick: Gạch Nude\r\n\r\n\r\n', 'G2033801 Dimethicone, Bis-Diglyceryl Polyacyladipate-2, Hydrogenated Polyisobutene, Phenyl Trimethicone, Tridecyl Trimellitate, Hydrogenated Jojoba Oil, Dimethicone Crosspolymer, Vinyl Dimethicone/Methicone Silsesquioxane Crosspolymer, Kaolin, Isostearyl Isostearate, Paraffin, Isohexadecane, Nylon-12, Cera Microcristallina / Microcrystalline Wax / Cire, Microcristalline, Polyethylene, Alumina, Synthetic Wax, Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Aluminum Hydroxide, Benzyl Alcohol, Silica, Tocopherol, Parfum / Fragrance,\r\n\r\n', '', 2, 179000, 1000, 1),
(122, 5, 16, 'Son Lì Maybelline Mịn Môi Siêu Nhẹ 1188 Đồng Ánh Cam 1.7g\r\n', '122.jpg', 'Son Lì Mịn Môi Siêu Nhẹ Maybelline Color Sensational Ultimatte là dòng son lì cao cấp mới nhất từ thương hiệu Maybelline New York, cho bạn 3 tính năng vượt trội \"Mịn - Mờ - Nhẹ tênh\". Với công nghệ làm mờ rãnh môi mang đến lớp finish mịn mờ sang trọng kết hợp công nghệ ultrafine powder cho son mịn lì nhẹ tênh. Thiết kế đầu son hình giọt sương nhỏ giúp son dễ dàng lướt nhẹ và chuẩn màu trên môi bạn. Đặc biệt, vỏ son “mảnh mai thon gọn” cùng màu sắc bắt mắt, khơi gợi hơi thở sang trọng, thời thượng và trẻ trung.\r\n1188 More Terracota: Đồng Ánh Cam\r\n\r\n\r\n', 'G2033801 Dimethicone, Bis-Diglyceryl Polyacyladipate-2, Hydrogenated Polyisobutene, Phenyl Trimethicone, Tridecyl Trimellitate, Hydrogenated Jojoba Oil, Dimethicone Crosspolymer, Vinyl Dimethicone/Methicone Silsesquioxane Crosspolymer, Kaolin, Isostearyl Isostearate, Paraffin, Isohexadecane, Nylon-12, Cera Microcristallina / Microcrystalline Wax / Cire, Microcristalline, Polyethylene, Alumina, Synthetic Wax, Pentaerythrityl Tetra-Di-T-Butyl Hydroxyhydrocinnamate, Aluminum Hydroxide, Benzyl Alcohol, Silica, Tocopherol, Parfum / Fragrance,\r\n\r\n', '', 2, 179000, 1000, 1),
(124, 1, 4, 'test\r\n', '', '', '', '', 0, 0, 0, 1),
(125, 1, 1, 'Tẩy trang', '', 'Tẩy trang loreal', '', 'oil', 500, 159000, 12, 1),
(126, 1, 1, 'Tẩy trang', '', 'Tẩy trang loreal', '', 'oil', 500, 159000, 20, 1),
(127, 1, 2, 'Chống nắng', '', 'Chống nắng loreal', '', 'normal', 150, 200000, 1000, 1),
(128, 2, 2, 'Chống nắng', 'pur-pur atelier (4).jpg', 'Chống nắng cocoon', '', 'all', 200, 300000, 1500, 1),
(129, 2, 2, 'Chống nắng', 'pur-pur atelier (2).jpg', 'Chống nắng cocoon', '', 'all', 500, 159000, 200, 1),
(130, 2, 2, 'Chống nắng', 'FrequencyHopping4.jpg', 'Chống nắng cocoon', '', 'all', 500, 159000, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE `product_attribute` (
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `attribute_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_attribute`
--

INSERT INTO `product_attribute` (`attribute_id`, `attribute_name`) VALUES
(1, 'color'),
(2, 'volume');

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `product_type_id` int(5) NOT NULL,
  `product_type_name` varchar(20) NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`product_type_id`, `product_type_name`, `category_id`) VALUES
(1, 'Tẩy trang', 1),
(2, 'Chống nắng', 1),
(3, 'Serum', 1),
(4, 'Kem dưỡng', 1),
(5, 'Sữa rửa mặt', 1),
(6, 'Toner', 1),
(7, 'Tẩy tế bào chết', 2),
(8, 'Sữa tắm', 2),
(9, 'Dưỡng thể', 2),
(10, 'Kem lót', 3),
(11, 'Kem nền', 3),
(12, 'Che khuyết điểm', 3),
(13, 'Phấn phủ', 3),
(14, 'Mascara', 3),
(15, 'Kẻ mắt', 3),
(16, 'Son môi', 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_values`
--

CREATE TABLE `product_values` (
  `product_values_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `value` varchar(50) NOT NULL,
  `img` varchar(50) NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_values`
--

INSERT INTO `product_values` (`product_values_id`, `product_id`, `attribute_id`, `value`, `img`, `price`, `quantity`) VALUES
(1, 17, 2, '200', 'img/17.jpg', 100000, 1000),
(2, 17, 2, '600', 'img/18,jpg', 260000, 1000),
(4, 22, 2, '30', 'img/22.jpg', 175000, 1000),
(5, 22, 2, '100', 'img/23,jpg', 346000, 1000),
(6, 24, 2, '30', 'img/24.jpg', 156000, 1000),
(7, 24, 2, '100', 'img/25,jpg', 337000, 1000),
(8, 26, 2, '30', 'img/26.jpg', 155000, 100),
(9, 26, 2, '100', 'img/27,jpg', 307000, 1000),
(10, 33, 2, '140', 'img/33,jpg', 175000, 1000),
(11, 33, 2, '310', 'img/34,jpg', 235000, 1000),
(12, 37, 2, '310', 'img/37.jpg', 236000, 1000),
(13, 37, 2, '140', 'img/38,jpg', 165000, 1000),
(14, 40, 2, '310', 'img/40.jpg', 265000, 1000),
(15, 40, 2, '140', 'img/41,jpg', 156000, 1000),
(16, 43, 2, '400', 'img/43.jpg', 398000, 1000),
(17, 43, 2, '200', 'img/44.jpg', 225000, 1000),
(18, 45, 2, '40', 'img/45.jpg', 292000, 1000),
(19, 45, 2, '100', 'img/46,jpg', 511000, 1000),
(20, 47, 2, '50', 'img/47.jpg', 424000, 3000),
(21, 47, 2, '15', 'img/48,jpg', 174000, 1000),
(22, 51, 2, '200', 'img/51.jpg', 308000, 3000),
(23, 51, 2, '400', 'img/52,jpg', 476000, 1000),
(24, 53, 2, '400', 'img/53.jpg', 492000, 3000),
(25, 53, 2, '50', 'img/54,jpg', 132000, 1000),
(26, 55, 2, '50', 'img/55.jpg', 205000, 1000),
(27, 55, 2, '125', 'img/56.jpg', 418000, 1000),
(28, 57, 2, '200', 'img/57.jpg', 422000, 1000),
(29, 57, 2, '50', 'img/58,jpg', 75000, 1000),
(31, 59, 2, '30', 'img/59.jpg', 368000, 1000),
(32, 59, 2, '15', 'img/60,jpg', 149000, 1000),
(33, 66, 2, '250', 'img/66.jpg', 331000, 1000),
(34, 66, 2, '500', 'img/67,jpg', 393000, 1000),
(35, 68, 2, '250', 'img/68.jpg', 331000, 1000),
(36, 68, 2, '500', 'img/69,jpg', 393000, 1000),
(37, 70, 2, '1000', 'img/70.jpg', 419000, 1000),
(38, 70, 2, '200', 'img/71,jpg', 329000, 1000),
(39, 72, 2, '500', 'img/72.jpg', 412000, 1000),
(40, 72, 2, '100', 'img/73,jpg', 216000, 1000),
(41, 74, 2, '100', 'img/74.jpg', 185000, 1000),
(42, 74, 2, '500', 'img/75,jpg', 252000, 1000),
(43, 76, 2, '100', 'img/76.jpg', 219000, 1000),
(44, 76, 2, '200', 'img/77.jpg', 378000, 1000),
(45, 83, 2, '250', 'img/83.jpg', 361000, 1000),
(46, 83, 2, '100', 'img/84,jpg', 216000, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `skin_type`
--

CREATE TABLE `skin_type` (
  `skin_type_id` varchar(50) NOT NULL,
  `skin_type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skin_type`
--

INSERT INTO `skin_type` (`skin_type_id`, `skin_type_name`) VALUES
('all', 'Mọi loại da'),
('dry', 'Da khô'),
('normal', 'Da thường'),
('oil', 'Da dầu');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `staff_name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `account_id`, `staff_name`, `email`, `phone`, `address`) VALUES
(1, 1, 'Thiên Hương', 'thienhuong6935@gmail.com', '0329947740', 'HCM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_id`),
  ADD KEY `fk_account_decent_id` (`decent_id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `fk_bill_customerID` (`customer_id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`bill_id`,`product_id`),
  ADD KEY `fk_billDetail_productID` (`product_id`);

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`account_id`,`product_id`),
  ADD KEY `fk_cart_productID` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cusotmer_id`),
  ADD KEY `fk_customer_accountID` (`account_id`);

--
-- Indexes for table `decentralization`
--
ALTER TABLE `decentralization`
  ADD PRIMARY KEY (`decent_id`);

--
-- Indexes for table `decent_detail`
--
ALTER TABLE `decent_detail`
  ADD PRIMARY KEY (`decent_id`,`feature_id`,`action`),
  ADD KEY `fk_decentDetail_featureID` (`feature_id`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`account_id`,`product_id`),
  ADD KEY `fk_favorite_productID` (`product_id`);

--
-- Indexes for table `feature`
--
ALTER TABLE `feature`
  ADD PRIMARY KEY (`feature_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_type` (`product_type`),
  ADD KEY `fk_product_brandID` (`brand_id`);

--
-- Indexes for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`product_type_id`),
  ADD KEY `fk_productType_categoryID` (`category_id`);

--
-- Indexes for table `product_values`
--
ALTER TABLE `product_values`
  ADD PRIMARY KEY (`product_values_id`),
  ADD KEY `fk_productValues_attributeId` (`attribute_id`),
  ADD KEY `fk_productValues_productId` (`product_id`);

--
-- Indexes for table `skin_type`
--
ALTER TABLE `skin_type`
  ADD PRIMARY KEY (`skin_type_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD KEY `fk_staff_accountID` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `bill`
--
ALTER TABLE `bill`
  MODIFY `bill_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `brand_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `account_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cusotmer_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `decentralization`
--
ALTER TABLE `decentralization`
  MODIFY `decent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feature`
--
ALTER TABLE `feature`
  MODIFY `feature_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `product_attribute`
--
ALTER TABLE `product_attribute`
  MODIFY `attribute_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `product_type_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_values`
--
ALTER TABLE `product_values`
  MODIFY `product_values_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `fk_account_decentID` FOREIGN KEY (`decent_id`) REFERENCES `decentralization` (`decent_id`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_bill_customerID` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`cusotmer_id`);

--
-- Constraints for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `fk_billDetail_billID` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`),
  ADD CONSTRAINT `fk_billDetail_productID` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_cart_accoutnID` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `fk_cart_productID` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_customer_accountID` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);

--
-- Constraints for table `decent_detail`
--
ALTER TABLE `decent_detail`
  ADD CONSTRAINT `fk_decentDetail_decentID` FOREIGN KEY (`decent_id`) REFERENCES `decentralization` (`decent_id`),
  ADD CONSTRAINT `fk_decentDetail_featureID` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`);

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `fk_favorite_accountID` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`),
  ADD CONSTRAINT `fk_favorite_productID` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_product_brandID` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  ADD CONSTRAINT `fk_product_type` FOREIGN KEY (`product_type`) REFERENCES `product_type` (`product_type_id`);

--
-- Constraints for table `product_type`
--
ALTER TABLE `product_type`
  ADD CONSTRAINT `fk_productType_categoryID` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `product_values`
--
ALTER TABLE `product_values`
  ADD CONSTRAINT `fk_productValues_attributeId` FOREIGN KEY (`attribute_id`) REFERENCES `product_attribute` (`attribute_id`),
  ADD CONSTRAINT `fk_productValues_productId` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `fk_staff_accountID` FOREIGN KEY (`account_id`) REFERENCES `account` (`account_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
