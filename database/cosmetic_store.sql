-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2023 at 06:42 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

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
(3, 'staff'),
(4, 'manager');

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
(3, 1, '', 'update', 1),
(4, 1, '', 'add', 1),
(4, 1, '', 'delete', 1),
(4, 1, '', 'update', 1);

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
(9, 'Nhân viên');

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
(1, 1, 1, 'Nước Tẩy Trang L\'Oreal Tươi Mát Cho Da Dầu, Hỗn Hợp', '1.jpg', 'Nước Tẩy Trang L\'Oréal Paris 3-in-1 Micellar Water Refreshing (xanh dương nhạt) ứng dụng công nghệ Micellar mới chứa các phân tử mi-xen độc đáo hoạt động như một thỏi nam châm giúp loại bỏ hoàn toàn bụi bẩn và lớp trang điểm, đồng thời làm dịu da nhờ thành phần nước khoáng từ những ngọn núi ở Pháp, mang lại làn da tươi tắn hơn sau khi tẩy trang. Kết cấu dạng nước tươi mát, dễ sử dụng, không cần rửa lại với nước mà vẫn không gây nhờn dính da.', 'Aqua / Water, Hexylene Glycol, Glycerin, Poloxamer 184, Disodium Cocoamphodiacetate, Disodium Edta, BHT , Polyaminopropyl Biguanide', 'oil', 400, 159000, 0, 1),
(2, 1, 1, 'Nước Tẩy Trang L\'Oreal Làm Sạch Sâu Trang Điểm', '2.jpg', 'Nước Tẩy Trang L\'Oreal Micellar Water 3-in-1 Deep Cleansing Even For Sensitive Skin có hai lớp chất lỏng giúp hòa tan chất bẩn và loại bỏ toàn bộ lớp trang điểm hiệu quả, kể cả lớp trang điểm lâu trôi và không thấm nước chỉ trong một bước.', 'Aqua / Water, Cyclopentasiloxane, Isohexadecane, Potassium Phosphate, Sodium Chloride, Dipotassium Phosphate, Disodium Edta, Decyl Glucoside, Hexylene Glycol, Polyaminopropyl Biguanide, CI 61565 / Green 6', 'all', 400, 159000, 0, 1),
(3, 1, 1, 'Nước Tẩy Trang L\'Oreal Dưỡng Ẩm Cho Da Thường, Khô', '3.jpg', 'Nước Tẩy Trang L\'Oreal Micellar Water 3-in-1 Moisturizing Even For Sensitive Skin ứng dụng công nghệ Micellar mới chứa các phân tử mi-xen độc đáo hoạt động như một thỏi nam châm giúp loại bỏ hoàn toàn bụi bẩn và lớp trang điểm, đồng thời dưỡng da ẩm mượt nhờ thành phần chiết xuất hoa hồng Pháp, giúp duy trì độ ẩm cần thiết cho da sau khi tẩy trang. Kết cấu dạng nước tươi mát, dễ sử dụng, không cần rửa lại với nước, giúp da trở nên sạch sẽ, tươi sáng và có đủ độ ẩm.', ' Aqua / Water, Hexylene Glycol, Glycerin, Rosa Gallica Flower Extract, Sorbitol, Poloxamer 184, Disodium Cocoamphodiacetate, Disodium Edta, Propylene Glycol, BHT , Polyaminopropyl Biguanide', 'dry', 400, 159000, 0, 1),
(4, 1, 1, 'Nước Tẩy Trang L\'Oréal Làm Sạch Sâu Cho Da Dầu', '4.jpg', 'Nước Tẩy Trang L\'Oréal Paris Revitalift Crystal Purifying Micellar Water là dòng nước tẩy trang được thương hiệu L\'Oréal thiết kế dành riêng cho làn da dầu, với công nghệ đột phá Oil-free đem đến sức mạnh làm sạch sâu gấp 5 lần. Sản phẩm chứa các phân tử mixen hoạt động như một nam châm làm sạch, loại bỏ 5 loại tạp chất có trên da bạn hằng ngày, giúp lỗ chân lông thoáng sạch.', 'Aqua / Water, Hexylene Glycol, Glycerin, Rosa Gallica Flower Extract, Sorbitol, Poloxamer 184, Disodium Cocoamphodiacetate, Disodium Edta, Propylene Glycol, BHT , Polyaminopropyl Biguanide', 'oil', 400, 209000, 0, 1),
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
(19, 2, 7, 'Combo Tẩy Tế Bào Chết Toàn Thân Cocoon Cà Phê Đắk Lắk', '19.jpg', 'Tẩy Da Chết Toàn Thân Cocoon Cà Phê Đắk Lắk là dòng tẩy tế bào chết toàn thân từ thương hiệu mỹ phẩm Cocoon của Việt Nam là một trong những sản phẩm với thành phần tự nhiên có nguồn gốc trong nước như hạt cà phê Đắk Lắk nguyên chất xay nhuyễn, hòa quyện cùng bơ cacao Tiền Giang giúp loại bỏ tế bào chết hiệu quả, làm đều màu da, mang lại năng lượng, giúp da trở nên mềm mại và rạng rỡ giúp mang đến cho bạn sản phẩm thuần chay tốt nhất với niềm tự hào từ nguyên liệu thuần Việt.', 'Aqua/Water, Coffea Arabica (coffee) Seed Powder, Cetearyl Alcohol, Cocos Nucifera (coconut) Oil, Cocamidopropyl Betaine, Glyceryl Stearate, C15-19 Alkane, Glycerin, Ceteareth-20, Ceteareth-12, Theobroma Cacao (Cocoa) Seed Butter, Butyrospermum Parkii (shea) butter, Cetyl Palmitate, Glycine Soja (soybean) Sterols, Phospholipids, Crosspolymer, Tocopheryl Acetate, Xanthan gum, Phenoxyethanol, Sodium Hydroxide, BHT, Ethylhexylglycerin, Trisodium Ethylenediamine Disuccinate.', 'all', 400, 184000, 100, 1),
(20, 2, 7, 'Tẩy Da Chết Toàn Thân Cocoon Đường Thốt Nốt An Giang', '20.jpg', 'Tẩy Da Chết Cơ Thể Cocoon Đường Thốt Nốt An Giang là sản phẩm tẩy tế bào chết toàn thân đến từ thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam, với tinh thể đường thốt nốt mềm mịn từ vùng đất An Giang kết hợp cùng dưỡng chất vitamin B5 và dầu mắc-ca giúp nhẹ nhàng lấy đi các tế bào chết sần sùi mang đến làn da mềm mịn, sáng mượt và khỏe khoắn.', 'Sucrose, Borassus Flabellifer Sap, Aqua/Water, Panthenol, Carthamus Tinctorius (Safflower) Seed Oil, Macadamia Integrifolia Seed Oil, Argania Spinosa Kernel Oil, Cocos Nucifera (Coconut) Oil, Olea Europaea (Olive) Fruit Oil, Oryza Sativa (Rice) Bran Oil, Ethylhexylglycerin, Tocopherol, Magnesium Aluminum Silicate, Citrus Aurantium Dulcis (Orange) Peel Oil, Mentha Piperita Oil, Cymbopogon Citratus Leaf Oil, Parfum, BHT, Caramel, Phenoxyethanol', 'all', 200, 130000, 50, 1),
(21, 2, 7, 'Tẩy Tế Bào Chết Toàn Thân Cocoon Bản Giới Hạn Con Voi', '21.jpg', 'Tẩy Tế Bào Chết Toàn Thân Cocoon Bản Giới Hạn Con Voi 200ml là dòng tẩy tế bào chết toàn thân từ thương hiệu mỹ phẩm Cocoon của Việt Nam là một trong những sản phẩm với thành phần tự nhiên có nguồn gốc trong nước như hạt cà phê Đắk Lắk nguyên chất xay nhuyễn, hòa quyện cùng bơ cacao Tiền Giang giúp loại bỏ tế bào chết hiệu quả, làm đều màu da, mang lại năng lượng, giúp da trở nên mềm mại và rạng rỡ giúp mang đến cho bạn sản phẩm thuần chay tốt nhất với niềm tự hào từ nguyên liệu thuần Việt.', 'Aqua/Water, Coffea Arabica (coffee) Seed Powder, Cetearyl Alcohol, Cocos Nucifera (coconut) Oil, Cocamidopropyl Betaine, Glyceryl Stearate, C15-19 Alkane, Glycerin, Ceteareth-20, Ceteareth-12, Theobroma Cacao (Cocoa) Seed Butter, Butyrospermum Parkii (shea) butter, Cetyl Palmitate, Glycine Soja (soybean) Sterols, Phospholipids, Crosspolymer, Tocopheryl Acetate, Xanthan gum, Phenoxyethanol, Sodium Hydroxide, BHT, Ethylhexylglycerin, Trisodium Ethylenediamine Disuccinate.', 'all', 200, 102000, 100, 1),
(22, 2, 4, 'Thạch Bí Đao Cocoon Cung Cấp Ẩm Và Ngăn Ngừa Mụn', '22.jpg', 'Thạch Bí Đao Cocoon Cung Cấp Ẩm Và Ngăn Ngừa Mụn là sản phẩm kem dưỡng da đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, với sự kết hợp giữa chiết xuất bí đao thanh mát, 5α-AVOCUTA® được chưng cất phân tử từ dầu quả bơ và TECA™ trích ly từ rau má, mang lại độ ẩm cân bằng, giảm lượng dầu thừa và cải thiện tình trạng mụn. Kết cấu mỏng nhẹ tan nhanh vào da tạo cảm giác thông thoáng, dễ chịu không gây nặng mặt hay bí bách trên da.', 'Aqua/Water, Niacinamide, Butyl Avocadate, Butylene Glycol, Sodium Acrylates Copolymer, Betaine, Benincasa Cerifera Fruit Extract, Glycerin, Propanediol, Madecassic Acid, Asiatic Acid, Asiaticoside, Centella Asiatica Extract, Pentylene Glycol, Ferulic Acid, Potassium Azeloyl Diglycinate, Oleyl Erucate, Coco-Caprylate/Caprate, Dicaprylyl Carbonate, Epilobium Angustifolium Flower/Leaf/Stem Extract, Caprylic/Capric Triglyceride, Aloe Barbadensis Leaf Juice, Bisabolol, Glycereth-26, Lecithin, Phellodendron Amurense Bark Extract, Allantoin, Ethylhexylglycerin, Tocopherol, Hydroxyacetophenone, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol, Melaleuca Alternifolia Leaf Oil, Rosmarinus Officinalis Leaf Oil.', 'all', 30, 175000, 1000, 1),
(24, 2, 4, 'Kem Dưỡng Cocoon Dưỡng Ẩm Dạng Thạch Từ Hoa Hồng', '24.jpg', 'Kem Dưỡng Cocoon Dưỡng Ẩm Dạng Thạch Từ Hoa Hồng là dòng kem dưỡng da đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, chiết xuất từ nước hoa hồng hữu cơ kết hợp với thành phần dưỡng ẩm Pentavitin, các Axit Amin và Hyaluronic Acid, giúp nuôi dưỡng và khóa ẩm suốt 24 giờ, mang lại làn da mềm mượt và mịn màng, hỗ trợ se khít lỗ chân lông và làm đầy đặn da.\r\n\r\n', 'Aqua/Water, Rosa Damascena Flower Water, Dicaprylyl Carbonate, Hydroxyethyl Ac Rylate/Sodium Acryloyldimethyl Taurate Copolymer, Betaine, Olus Oil, Oleyl Erucate, Coco-Caprylate/Caprate, Caprylic/Capric Triglyceride, Propanediol, Glyc Erin, Sodium Hyaluronate, Panthenol, Bisabolol, Alanine, Arginine, Glycine, Histidine, Proline, Serine, Isoleucine, Threonine, Phenylalanine, Valine, Pca, Sodium Pca, Aspar Tic Acid, Argania Spinosa Kernel Oil, Xylitol, Allantoin, Tocopherol, Anhydroxylitol, Butylene Glycol, Saccharide Isomerate, Xylitylglucoside, Sodium Lactate, Bis-Peg-18 Methyl Ether Dimethyl Silane, Ethylhexylglycerin, Xanthan Gum, Caramel, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol, Farnesol, Lactic Acid\r\n\r\n', 'all', 30, 156000, 1000, 1),
(26, 2, 4, 'Kem Dưỡng Cocoon Sáng Da Dạng Thạch Từ Nghệ Hưng', '26.jpg', 'Kem Dưỡng Cocoon Sáng Da Dạng Thạch Từ Nghệ Hưng Yên là sản phẩm kem dưỡng đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, chứa các dưỡng chất gồm chiết xuất Nghệ, Curcuminoid, Hexylresorcinol và Niacinamide có công dụng dưỡng sáng, đều màu da, làm mờ các vết thâm do mụn để lại. Ngoài ra sản phẩm giúp da mềm mại, ẩm mượt trông thấy. ', 'Aqua/Water, Coco-Caprylate/Caprate, Dicaprylyl Carbonate, Butylene Glycol, Sodium Acrylates Copolymer, Niacinamide, Betaine, Glycereth-26, Oleyl Erucate, Hexylresorcinol, Tetrahydrodiferuloylmethane,Tetrahydrodemethoxydiferuloylmethane, Tetrahydrobisdemethoxydiferuloylmethane, Curcuma Longa (Turmeric) Root Extract, Curcuma Longa (Turmeric) Root Oil, Curcuma Longa (Turmeric) Root Powder, Tetrahexyldecyl Ascorbate, Ferulic Acid, Glycerin, Propanediol, Pentylene Glycol, Caprylic/Capric Triglyceride, Daucus Carota Sativa (Carrot) Root Extract, Lecithin, Glycine Soja (Soybean) Oil, Allantoin, Beta-Carotene, Ethylhexylglycerin, Tocopherol, Hydroxyacetophenone, Trisodium Ethylenediamine Disuccinate, Caramel, Phenoxyethanol, Sodium Benzoate, Potassium Sorbate.', 'all', 30, 155000, 100, 1),
(28, 2, 3, 'Serum Bí Đao Cocoon Làm Giảm Mụn, Mờ Thâm', '28.jpg', 'Tinh Chất Bí Đao Cocoon Winter Melon Serum 70ml là dòng sản phẩm chăm sóc da mụn của thương hiệu mỹ phẩm thuần chay Cocoon xuất xứ Việt Nam. Sản phẩm chứa các thành phần từ thực vật làm chủ đạo gồm chiết xuất bí đao, rau má, tràm trà và được bổ sung thêm 7% Niacinamide (vitamin B3) giúp hỗ trợ phục hồi tình trạng da mụn viêm và ửng đỏ hiệu quả, mang lại làn da thông thoáng và sáng mịn màng.', 'Aqua/Water, Niacinamide, Salicylic Acid, Cocamidopropyl Dimethylamine, Benincasa Cerifera Fruit Extract, Centella Asiatica Extract, Butylene Glycol, Pentylene Glycol, Bisabolol, Zinc PCA, Phellodendron Amurense Bark Extract, Glycereth-26, Bis-PEG-18 Methyl Ether Dimethyl Silane, Melaleuca Alternifolia Leaf Oil, Lavandula Angustifolia Flower Oil, Rosmarinus Officinalis Leaf Oil, Phenoxyethanol, Trisodium Ethylenediamine Disuccinate, Ethylhexylglycerin, Farnesol.', 'all', 70, 238000, 1000, 1),
(29, 2, 3, 'Serum Cocoon Chiết Xuất Từ Nghệ Hưng Yên ', '29.jpg', 'Tinh Chất Cocoon Chiết Xuất Từ Nghệ Hưng Yên 30ml là dòng tinh chất dưỡng da đến từ thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam, với thành phần dầu nghệ chiết xuất từ củ nghệ Hưng Yên rất giàu turmerone, được xé nhỏ và lơ lửng trong một hỗn hợp kết cấu mọng nước chứa 5% vitamin C (3-O-Ethyl Ascorbic Acid), 4% vitamin B3 và 2% NAG. Sản phẩm có tác dụng làm sáng, làm mờ vết thâm sạm, cung cấp độ ẩm, tăng cường độ đàn hồi, săn chắc đồng thời có khả năng chống oxy hoá cao và ngăn ngừa lão hoá.', 'Aqua/Water,  3-O-Ethyl Ascorbic Acid, Caprylic/Capric/Succinic Triglyceride, Niacinamide, Potassium Azeloyl Diglycinate, Acetyl Glucosamine, Dimethyl Isosorbide, 1-Methylhydantoin-2-Imide, Propanediol, Curcuma Longa (Turmeric) Root Oil, Curcuma Longa (Turmeric) Root Extract, Daucus Carota Sativa (Carrot) Root Extract, Betaine, Glycerin, Hydroxyacetophenone, Butylene Glycol, Beta-Carotene, Glycine Soja (Soybean) Oil, Tocopherol, Xanthan Gum, Ethylhexylglycerin, Sodium Chloride, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol.', 'all', 30, 292000, 500, 1),
(30, 2, 3, 'Serum Cocoon Nghệ Hưng Yên x2.2 Sáng Da Chuyên Sâu', '30.jpg', 'Tinh Chất Cocoon Nghệ Hưng Yên x2.2 Sáng Da Chuyên Sâu 30ml là sản phẩm tinh chất đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, vận dụng nguồn năng lượng dồi dào từ củ nghệ Hưng Yên và các thành phần hoạt tính nổi bật gồm 22% Vitamin C, 1% Hexylresorcinol, 4% Niacinamide và 2% NAG giúp làm sáng các làn da ngăm đen, tối màu, cháy nắng, có tác dụng tốt trên vết thâm đậm và vết thâm đỏ do mụn để lại, chống oxy hóa giúp ngăn ngừa lão hoá da, cải thiện bề mặt giúp da trở nên mịn màng, căng bóng.', 'Aqua/Water, 3-O-Ethyl Ascorbic Acid, Propanediol, Niacinamide, Acetyl Glucosamine, Dimethyl Isosorbide, Hexylresorcinol, Glycerin, Betaine, Ethoxydiglycol, Butylene Glycol, Pentylene Glycol, Curcuma Longa (Turmeric) Root Extract, Ferulic Acid, Potassium Azeloyl Diglycinate, Trisodium Ethylenediamine Disuccinate, Sodium Benzoate, Potassium Sorbate.', 'all', 30, 371000, 1000, 1),
(31, 2, 4, 'Serum Cocoon Cấp Nước & Cấp Ẩm Sâu Từ Hoa Hồng', '31.jpg', 'Tinh Chất Cocoon Cấp Nước & Cấp Ẩm Sâu Từ Hoa Hồng 30ml dòng tinh chất dưỡng da đến từ thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam, kết hợp những hoạt chất như 5% Vitamin B5, 5% Betaine, 5% Urea, Ectoin & HA, tinh chất hoa hồng cung cấp ẩm dồi dào giúp dưỡng ẩm sâu, phục hồi những tổn thương do sự mất nước gây ra. Làn da sau khi ngậm nước sẽ nhanh chóng trở nên tươi mới, căng mọng và ẩm mượt như được phủ sương', 'Aqua/Water, Rosa Damascena Flower Water, Panthenol, Betaine, Hydroxyethyl Urea, Biosaccharide Gum-1, Arginine,  Glycine, Alanine, Serine, Valine, Proline, Threonine, Isoleucine, Histidine, Phenylalanine,  Aspartic Acid, PCA, Sodium PCA, Rosa Damascena Extract, Ectoin, Sodium Hyaluronate, Hydrolyzed Hyaluronic Acid, Saccharide Isomerate, Aloe Barbadensis Leaf Juice, Allantoin, Glycerin, Propanediol, Glycereth-26, Pentylene Glycol, Butylene Glycol, Xylitol, Hydroxyacetophenone, Xylitylglucoside, Ethylhexylglycerin, Anhydroxylitol, Hydroxyethylcellulose, Xanthan Gum, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol, Sodium Lactate.', 'all', 30, 212000, 1000, 1),
(32, 2, 5, 'Gel Rửa Mặt Bí Đao Cocoon Làm Giảm Dầu & Mụn ', '32.jpg', 'Gel Bí Đao Rửa Mặt Cocoon Winter Melon Cleanser là sản phẩm sữa rửa mặt độc đáo đến từ thương hiệu mỹ phẩm Việt Nam Cocoon, được chiết xuất từ thành phần tự nhiên phù hợp với làn da dầu mụn như bí đao, rau má, tràm trà... Công thức dạng gel tạo bọt nhẹ nhàng nhưng lại có khả năng làm sạch sâu, ngăn ngừa các tác nhân gây mụn, đặc biệt là mụn ẩn dưới da, mang đến cho sự ẩm mịn tự nhiên cùng cảm giác vô cùng tươi mới và sạch sẽ. Độ pH 5.5 cân bằng lý tưởng, an toàn cho làn da dầu, mụn & nhạy cảm.', 'Water/Aqua, Potassium Laureth Phosphate, Cocamidopropyl Betaine, Acrylates/Steareth-20 Methacrylate Copolymer, Sodium Cocoyl Glycinate, Cocoyl Methyl Glucamide, PEG-7-Glyceryl Cocoate, Glycerin, Benincasa Cerifera (Bí đao) Fruit Extract, Salicylic Acid, Niacinamide (Vitamin B3), Panthenol (Vitamin B5), Centella Asiatica Extract (Rau má), Betaine, Propanediol, Butylene Glycol, PEG-120 Methyl Glucose Dioleate, Molasses, Glycereth-26, Sodium Lactate, Sodium Hydroxide, Polysorbate 20, Melaleuca Alternifolia (Tràm trà) Leaf Oil, Rosmarinus Officinalis (Hương thảo) Leaf Oil, Lavandula Angustifolia (Oải hương) Flower Oil, Allantoin, Ethylhexylglycerin, Phenoxyethanol, Xanthan gum, Menthyl Lactate, Sodium Phytate, Alcohol (0.01% - là dung môi trong hoạt chất càng hóa nước cứng, bắt các icon kim loại, bảo vệ sản phầm khỏi tác nhân oxi hóa).', 'all', 310, 236000, 1000, 1),
(33, 2, 5, 'Sữa Rửa Mặt Cocoon Chiết Xuất Từ Nghệ Hưng Yên ', '33.jpg', 'Sữa Rửa Mặt Cocoon Chiết Xuất Từ Nghệ Hưng Yên là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam, với công thức dịu nhẹ không sulfate và thành phần chính từ nghệ của vùng đất Hưng Yên, cà rốt và nồng độ 4% AHA nhẹ nhàng loại bỏ các bụi bẩn, tế bào chết, cấp ẩm và làm mềm da giúp da sáng mịn, đều màu.', 'Aqua/Water, Disodium Cocoyl Glutamate, Potassium Laureth Phosphate, Sodium Laurylglucosides Hydroxypropylsulfonate, Lactic Acid, Glycerin, Polysorbate 20, PEG-120 Methyl Glucose Dioleate, Cetearyl Alcohol, Curcuma Longa (Turmeric) Root Extract, Glycolic Acid, Beta-Carotene, Daucus Carota Sativa (Carrot) Root Extract, Betaine, Allantoin, Propanediol, Glycereth-26, Cocoyl Methyl Glucamide, Ethylhexylglycerin, Xanthan Gum, Tocopherol, Glycine Soja (Soybean) Oil, Trisodium Ethylenediamine Disuccinate, Sodium Benzoate, Eucalyptus Globulus Leaf Oil,  Potassium Sorbate, Phenoxyethanol.\r\n\r\n', 'all', 140, 175000, 500, 1),
(35, 2, 5, 'Gel Rửa Mặt Cocoon Chiết Xuất Từ Hoa Hồng', '35.jpg', 'Gel Rửa Mặt Cocoon Chiết Xuất Từ Hoa Hồng 140ml là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm thuần chay Cocoon của Việt Nam, thành phần kết hợp từ chiết xuất hoa hồng và nước cất hoa hồng hữu cơ, bổ sung thêm hoạt chất dưỡng ẩm bentaine và allantoin. Với công thức dịu nhẹ không chứa sulfate, đây là sản phẩm rửa mặt lý tưởng giúp làm sạch sâu bụi bẩn mà không gây cảm giác khô căng đem đến làn da mềm mại, mịn mượt.', 'Aqua/Water, Sodium Cocoyl Glycinate, Disodium Laureth Sulfosuccinate, Cocamidopropyl Betaine, Glycerin, Rosa Damascena Flower Water, Coco-Glucoside, PEG-120 Methyl Glucose Triisostearate, Cocoyl Methyl Glucamide, Sodium PEG-7 Olive Oil Carboxylate, PEG-7 Glyceryl Cocoate, Rosa Damascena Extract, Betaine, Propanediol, Glycereth-26, Allantoin, Butylene Glycol, PEG-120 Methyl Glucose Dioleate, Ethylhexylglycerin, Trisodium Ethylenediamine Disuccinate, Citric Acid, Phenoxyethanol, Caramel.', 'all', 140, 175000, 3000, 1),
(36, 2, 5, 'Gel Rửa Mặt Cocoon Cà Phê Đắk Lắk Cho Làn Da Tươi Mới', '36.jpg', 'Gel Rửa Mặt Cocoon Cà Phê Đắk Lắk Cho Làn Da Tươi Mới 140ml là sản phẩm sữa rửa mặt đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, với công thức dịu nhẹ không chứa sulfate, có khả năng làm sạch hiệu quả mà không gây khô da, mang lại cảm giác sảng khoái cùng một làn da tươi mới, sạch thoáng và trông tràn đầy sinh lực để bắt đầu một ngày mới.', 'Aqua/Water, Coffea Robusta Seed Extract, Sodium Cocoyl Glycinate, Sodium Cocoyl Isethionate, Cocamidopropyl Betaine, Glycerin, Peg-7 Glyceryl Cocoate, Peg-120 Methyl Glucose Triisostearate, Polyquaternium-39, Coffea Arabica Seed Oil, Caffeine, Sodium Pca, Pca, Arginine, Glycine, Alanine, Aspartic Acid, Serine, Valine, Proline, Threonine, Ethylhexylglycerin, Isoleucine, Sodium Lactate, Histidine, Phenylalanine, Hydroxypropyl Starch Phosphate, Maltodextrin, Xanthan Gum, Hydroxyethylcellulose, Polysorbate 20, Trisodium Ethylenediamine Disuccinate, Phenoxyethanol, Menthyl Lactate', 'all', 140, 155000, 200, 1),
(37, 2, 6, 'Nước Cân Bằng Cocoon Chiết Xuất Bí Đao', '37.jpg', 'Là bước tiếp nối sau khi dùng Gel Bí Đao Rửa Mặt Cocoon Winter Melon Cleanser, nước bí đao Cocoon với công thức không chứa cồn cùng thành phần giàu các chiết xuất tự nhiên bao gồm chiết xuất bí đao, chiết xuất rau má và tinh dầu tràm trà sẽ giúp cân bằng độ pH cho da, làm sạch sâu lỗ chân lông, giảm dầu thừa và mụn ẩn dưới da hiệu quả. Ngoài ra sản phẩm còn được bổ sung thêm Vitamin B3, HA và chiết xuất cam thảo cung cấp độ ẩm giúp da luôn mịn màng và giảm thiểu các vết đỏ trên da. Nước Bí Đao Cân Bằng Da Cocoon Winter Melon Toner sẽ là sự lựa chọn tuyệt vời cho những làn da dầu bị mụn.', 'Water, Niacinamide, Benincasa Cerifera Fruit Extract, Propanediol, Glycerin, Betaine, Glycereth-26, Centella Asiatica Extract, Allantoin, Dipotassium Glycyrrhizate, Butylene Glycol, Pentylene Glycol, Sodium Hyaluronate, Zinc Pca, Melaleuca Alternifolia Leaf Oil, Rosmarinus Officinalis Leaf Oil (Hương thảo), Lavandula Angustifolia Flower Oil (Oải hương), Sodium Lactate, Sodium Gluconate, PEG-40 Hydrogenated Castor Oil, Menthyl Lactate, Xanthan gum, Phenoxyethanol, Ethylhexylglycerin.', 'all', 310, 236000, 1000, 1),
(39, 2, 6, 'Nước Cân Bằng Da Cocoon Chiết Xuất Hoa Hồng', '39.jpg', 'Nước Cân Bằng Da Cocoon Chiết Xuất Hoa Hồng Rose Water Toner with Organic Rose Water & HA 140ml là dòng nước hoa hồng đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, bổ sung Vitamin B3, HA và chiết xuất cam thảo giúp cung cấp độ ẩm cần thiết cho da và giảm các tình trạng tấy đỏ do mụn sưng, mụn viêm gây ra. Đặc biệt, sản phẩm chứa công thức không chứa cồn và có tác dụng cân bằng độ pH, giảm dầu, làm sạch lỗ chân lông, cải thiện tình trạng mụn ẩn đáng kể. ', 'Aqua/Water, Rosa Damascena Flower Water, Glycerin,1,2-Hexanediol, Butylene Glycol, Sodium Hyaluronate, betaine, Glycine, Alanine, Histidine, Valine, Serine, Proline, Threonine, Isoleucine, Arginine, Phenylalanine, Sodium PCA, Aspartic Acid, PCA, Xylitol, Xylitylglucoside, Anhydroxylitol, Rosa Damascena Flower, Saccharide Isomerate, Sodium Gluconate, Propanediol, Sodium Lactate, Panthenol, Pentylene Glycol, Polysorbate 20, Xanthan Gum, Ethylhexylglycerin, PEG-40 Hydrogenated Castor Oil, Trisodium Ethylenediamine Disuccinate, Caramel, Phenoxyethanol\r\n\r\n', 'all', 140, 156000, 1000, 1),
(40, 2, 6, 'Nước Hoa Hồng Cocoon Chiết Xuất Từ Nghệ Hưng Yên', '40.jpg', 'Nước Hoa Hồng Cocoon Chiết Xuất Từ Nghệ Hưng Yên là dòng toner đến từ thương hiệu mỹ phẩm Cocoon của Việt Nam, với thành phần chính từ nghệ của vùng đất Hưng Yên 100% thuần chay giàu curcumin kết hợp cùng 5% AHA và hoạt chất dưỡng ẩm Betaine giúp làm sạch các lớp sừng, tế bào chết, cung cấp độ ẩm cho làn da mềm mại và sáng mịn. Ngoài ra, sản phẩm có khả năng chống oxy hoá, hỗ trợ kháng viêm và làm lành các vết thương nhanh chóng', 'Aqua/Water, Lactic Acid, Glycerin, Propanediol, Sodium Hydroxide, Curcuma Longa (Turmeric) Root Extract, Glycolic Acid, Betaine, Allantoin, Pentylene Glycol, Hydroxyacetophenone, Bis-PEG-18 Methyl Ether Dimethyl Silane, PEG-40 Hydrogenated Castor Oil, Xanthan Gum, Trisodium Ethylenediamine Disuccinate, Curcuma Longa (Turmeric) Root Oil, Sodium Benzoate, Potassium Sorbate.', 'all', 310, 265000, 1000, 1),
(42, 3, 8, 'Sữa Tắm & Rửa Mặt La Roche-Posay Cho Da Khô Nhạy Cảm', '42.jpg', 'Sữa Rửa Mặt Và Tắm La Roche-Posay Lipikar Syndet AP+ có công thức chứa 10% Glycerin, chiết xuất bơ hạt mỡ và Niacinamide giúp khôi phục hàng rào bảo vệ da khỏe mạnh, làm sạch sâu nhưng không làm tổn thương lớp biểu bì đang suy yếu hoặc bị khô của làn da. ', 'Aqua / Water, Glycerin, Sodium Laureth Sulfate, Peg-200 Hydrogenated Glyceryl Palmate, Coco-Betaine, Polysorbate 20, Peg-7 Glyceryl Cocoate, Niacinamide, Acrylates Copolymer, Butyrospermum Parkii Butter / Shea Butter, Citric Acid, Cocamide Mea, Disodium Edta, Mannose, Polyquaternium-11, Sodium Benzoate, Sodium Chloride, Sodium Hydroxide, Styrene/Acrylates Copolymer, Vitreoscilla Ferment', 'dry', 200, 398000, 100, 1),
(43, 3, 8, 'Gel Tắm La Roche-Posay Làm Sạch Và Bảo Vệ Da Nhạy Cảm', '43.jpg', 'Gel tắm làm sạch làm dịu và bảo vệ da nhạy cảm La Roche-Posay Lipikar Lavant Shower Gel là sản phẩm sữa tắm hằng ngày dạng gel của thương hiệu La Roche-Posay giúp nhẹ nhàng làm sạch, làm dịu và bảo vệ cho làn da nhạy cảm, phù hợp với cả trẻ em và trẻ sơ sinh. Công thức sản phẩm chứa Niacinamide giúp làm dịu & bơ hạt mỡ giúp khôi phục hàng rào bảo vệ của da, làm dịu các cảm giác khó chịu, đồng thời không gây mất cân bằng độ pH trên da.', 'Aqua / Water, Sodium Laureth Sulfate, Peg-200 Hydrogenated Glyceryl Palmate, Glycerin, Coco-Betaine, Polysorbate 20, Peg-7 Glyceryl Cocoate, Citric Acid, Cocamide Mea, Niacinamide, Parfum / Fragrance, Peg-55 Propylene Glycol Oleate, Peg-60 Hydrogenated Castor Oil, Peg-75 Shea Butter Glycerides, Polyquaternium-11, Ppg-5-Ceteth-20, Propylene Glycol, Prunus Amygdalus Dulcis Oil / Sweet Almond Oil, Sodium Benzoate, Sodium Chloride, Sodium Hydroxide.', 'all', 400, 398000, 1000, 1),
(45, 3, 4, 'Kem Dưỡng La Roche-Posay Làm Dịu, Hỗ Trợ Phục Hồi Da', '45.jpg', 'Kem Dưỡng La Roche-Posay Cicaplast Baume B5 Soothing Repairing Balm là sản phẩm kem dưỡng dành cho da nhạy cảm đến từ thương hiệu La Roche-Posay, giúp dưỡng ẩm và làm dịu tình trạng da kích ứng, tổn thương, hỗ trợ phục hồi làn da. Sản phẩm được khuyên dùng sau các liệu trình điều trị thẩm mỹ & kích ứng da nhẹ ở người lớn, trẻ em và trẻ sơ sinh.\r\n\r\n', 'Aqua/Water, Hydrogenated Polyisobutene, Dimethicone, Glycerin, Butyrospermum Parkii Butter/Shea Butter, Panthenol, Butylene Glycol, Aluminum Starch Octenylsuccinate, Propanediol, Cetyl Pef/PPG-10/1 Dimethicone, Tristearin, Zinc Gluconate, Madecassoside, Manganese Gluconate, Magnesium Sulfate, Disodium Edta, Copper Gluconate, Acetylated Glycol Stearate, Polyglyceryl-4 Isostearate, Sodium Benzonate, Phenoxyethanol, Chlorhexidine Digluconate, CI 77891 / Titanium Dioxide', 'all', 40, 292000, 1000, 1),
(47, 3, 2, 'Kem Chống Nắng La Roche-Posay Kiểm Soát Dầu', '47.jpg', 'Kem Chống Nắng La Roche-Posay Anthelios Anti-Shine Gel-Cream Dry Touch Finish Mattifying Effect SPF50+ đến từ thương hiệu dược mỹ phẩm La Roche-Posay là sản phẩm kem chống nắng dành cho làn da dầu mụn, sở hữu công nghệ cải tiến XL-Protect cùng kết cấu kem gel dịu nhẹ & không nhờn rít, giúp ngăn ngừa tia UVA/UVB + tia hồng ngoại + tác hại từ ô nhiễm, bảo vệ toàn diện cho làn da luôn khỏe mạnh.', 'Aqua / Water, Homosalate, Silica, Octocrylene, Ethylhexyl Salicylate, Butyl Methoxydibenzoylmethane, Ethylhexyl Triazone, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Drometrizole Trisiloxane, Aluminum Starch Octenylsuccinate, Glycerin, Pentylene Glycol, Styrene/Acrylates Copolymer, Potassium Cetyl Phosphate, Dimethicone, Perlite, Propylene Glycol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Aluminum Hydroxide, P-Anisic Acid, Caprylyl Glycol, Disodium Edta, Inulin Lauryl Carbamate, Isopropyl Lauroyl Sarcosinate, Peg-8 Laurate, Phenoxyethanol, Scutellaria Baicalensis Extract / Scutellaria Baicalensis Root Extract, Silica Silylate, Stearic Acid, Stearyl Alcohol, Terephthalylidene Dicamphor Sulfonic Acid, Titanium Dioxide, Tocopherol, Triethanolamine, Xanthan Gum, Zinc Gluconate.', 'oil', 50, 424000, 3000, 1),
(49, 3, 2, 'Sữa Chống Nắng La Roche-Posay Bảo Vệ Da Tối Ưu SPF50+', '49.jpg', 'Sữa Chống Nắng La Roche-Posay Anthelios UVMune 400 Fluide Invisible Fluid SPF50+ là phiên bản cải tiến của Anthelios Invisible Fluid – dòng sản phẩm chống nắng rất được yêu thích và được đánh giá cao từ thương hiệu dược mỹ phẩm La Roche-Posay. Sản phẩm cung cấp khả năng bảo vệ da vượt trội khỏi tia UVB & UVA dài – ngay cả các tia ở bước sóng 380 – 400 NM – thủ phạm tiềm ẩn hình thành các gốc thâm nám nằm sâu dưới ', 'Aqua/Water/Eau, Alcohol Denat, Triethyl Citrate, Diisopropyl Sebacate, Silica, Ethylhexyl Salicylate, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Ethylhexyl Triazone, Butyl Methoxydibenzoylmethane, Glycerin, Propanediol, C12-22 Alkyl Acrylate/Hydroxyethylacrylate Copolymer, Methoxypropylamino Cyclohexenylidene Ethoxyethylcyanoacetate, Perlite, Tocopherol, Caprylic/Capric Triglyceride, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Caprylyl Glycol, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Drometrizole Trisiloxane, Hydroxyethylcellulose, Terephthalylidene Dicamphor Sulfonic Acid, Triethanolamine, Trisodium Ethylenediamine Disuccinate, Parfum/Fragrance', 'all', 50, 428000, 3000, 1),
(50, 3, 5, 'Mini] Gel Rửa Mặt La Roche-Posay Dành Cho Da Dầu, Nhạy Cảm', '50.jpg', 'Gel Rửa Mặt La Roche-Posay Effaclar Purifying Foaming Gel For Oily Sensitive Skin là dòng sản phẩm sữa rửa mặt chuyên biệt dành cho làn da dầu, mụn, nhạy cảm đến từ thương hiệu dược mỹ phẩm La Roche-Posay nổi tiếng của Pháp, với kết cấu dạng gel tạo bọt nhẹ nhàng giúp loại bỏ bụi bẩn, tạp chất và bã nhờn dư thừa trên da hiệu quả, mang đến làn da sạch mịn, thoáng nhẹ và tươi mát. Công thức sản phẩm an toàn, lành tính, giảm thiểu tình trạng kích ứng đối với làn da nhạy cảm.', 'Aqua / Water, Sodium Laureth Sulfate, Peg-8, Coco-Betaine, Hexylene Glycol, Sodium Chloride, Peg-120 Methyl Glucose Dioleate, Zinc Pca, Sodium Hydroxide, Citric Acid, Sodium Benzoate, Phenoxyethanol, Caprylyl Glycol, Parfum / Fragrance', 'oil', 50, 79000, 3000, 1),
(51, 3, 5, 'Gel Rửa Mặt La Roche-Posay Dành Cho Da Dầu, Nhạy Cảm', '51.jpg', 'Gel Rửa Mặt La Roche-Posay Effaclar Purifying Foaming Gel For Oily Sensitive Skin là dòng sản phẩm sữa rửa mặt chuyên biệt dành cho làn da dầu, mụn, nhạy cảm đến từ thương hiệu dược mỹ phẩm La Roche-Posay nổi tiếng của Pháp, với kết cấu dạng gel tạo bọt nhẹ nhàng giúp loại bỏ bụi bẩn, tạp chất và bã nhờn dư thừa trên da hiệu quả, mang đến làn da sạch mịn, thoáng nhẹ và tươi mát. Công thức sản phẩm an toàn, lành tính, giảm thiểu tình trạng kích ứng đối với làn da nhạy cảm.', 'Aqua / Water, Sodium Laureth Sulfate, Peg-8, Coco-Betaine, Hexylene Glycol, Sodium Chloride, Peg-120 Methyl Glucose Dioleate, Zinc Pca, Sodium Hydroxide, Citric Acid, Sodium Benzoate, Phenoxyethanol, Caprylyl Glycol, Parfum / Fragrance', 'oil', 200, 308000, 3000, 1),
(53, 3, 5, 'Gel Rửa Mặt & Tắm La Roche-Posay Làm Sạch & Giảm Mụn', '53.jpg', 'Gel Rửa Mặt & Tắm La Roche-Posay Effaclar Micro-Peeling Purifying Gel là sản phẩm rửa mặt và sữa tắm 2 trong 1 mới nhất vừa được ra mắt từ thương hiệu dược mỹ phẩm La Roche-Posay, thuộc dòng Effaclar chăm sóc da dầu mụn, với tác động kép - hiệu quả 2 trong 1 dùng được cho mặt và toàn thân, không chỉ giúp làm sạch dịu nhẹ mà còn hỗ trợ giảm mụn, vết thâm và ngăn ngừa mụn tái phát.\r\n\r\n', 'Aqua / Water, Sodium Laureth Sulfate, Decyl Glucoside, Glycerin, Sodium Chloride, Coco-betaine, Salicylic Acid, Peg-150 Pentaerythrityl Tetrastearate, Peg-6 Caprylic/capric Glycerides, Zinc Gluconate, Sodium Hydroxide, Capryloyl Salicylic Acid, Tetrasodium Edta, Citric Acid, Menthol, Polyquaternium-47, Hexylene Glycol, Sodium Benzoate.', 'all', 400, 492000, 1000, 1),
(55, 3, 5, 'Sữa Rửa Mặt La Roche-Posay Cho Da Hỗn Hợp Rất Nhạy', '55.jpg', 'Sữa Rửa Mặt La Roche-Posay Toleriane Purifying Foaming Cream được thiết kế chuyên biệt dành riêng cho những làn da rất nhạy cảm, dễ bị kích ứng khi sử dụng các loại sữa rửa mặt thông thường. Sản phẩm có kết cấu dạng kem mịn dễ dàng tạo bọt cùng công thức tối giản: không chứa paraben, không sulfate, không hương liệu & không chất bảo quản, an toàn cho làn da. Sản phẩm nhẹ nhàng làm sạch da từ sâu trong lỗ chân lông, loại bỏ bụi bẩn cùng dầu thừa, đồng thời giữ độ PH luôn ở mức cân bằng 5.5 nên sau khi rửa mặt xong, da không hề khô rít, căng rát, mà vẫn mềm mịn, sạch thoáng và đầy sức sống', 'Aqua / Water, Glycerin, Myristic Acid, Potassium Hydroxide, Glyceryl Stearate Se, Stearic Acid, Lauric Acid, Palmitic Acid, Coco-Glucoside, Tetrasodium Edta.', 'oil', 50, 205000, 3000, 1),
(57, 3, 5, 'Sữa Rửa Mặt La Roche-Posay Cho Da Quá Nhạy Cảm ', '57.jpg', 'Sữa Rửa Mặt Tẩy Trang La Roche-Posay Cho Da Quá Nhạy Cảm Toleriane Dermo Nettoyant Cleanser là sản phẩm đến từ thương hiệu La Roche-Posay đình đám của nước Pháp. Sản phẩm thích hợp cho mọi loại da kể cả da nhạy cảm, không gây kích ứng, không paraben và hương liệu.', 'Wate/Aqua, Ethylhexyl Palmitate, Glycerin, Dipropylene Glycol, Carbomer, Sodium Hydroxide, Capryl Glycol/Caprylyl Glycol, Ethylhexylglycerin.', 'all', 200, 422000, 3000, 1),
(59, 4, 4, 'Kem Dưỡng Bioderma Giúp Se Khít Lỗ Chân Lông', '59.jpg', 'Kem Dưỡng Bioderma Sébium Pore Refiner là sản phẩm kem dưỡng chuyên biệt dành cho làn da dầu, lỗ chân lông to đến từ thương hiệu dược mỹ phẩm Bioderma. Với kết cấu mỏng nhẹ, thẩm thấu tức thì, sản phẩm giúp tạo lớp lót trên bề mặt da giúp che phủ lỗ chân lông, hỗ trợ cân bằng bã nhờn đồng thời giúp làm giảm kích thước lỗ chân lông, để lại làn da khô thoáng sau khi sử dụng. Đặc biệt phù hợp cho da dầu và da mụn.', 'Aqua/Water/Eau, Methyl Methacrylate Crosspolymer, Dipropylene Glycol, Cyclopentasiloxane, Cyclohexasiloxane, Dimethicone, Glycerin, Butylene Glycol, Fomes Officinalis (Mushroom) Extract, Sodium Polyacrylate, Salicylic Acid, Dodecyl Gallate, Ginkgo Biloba Leaf Extract, Mannitol, Xylitol, Rhamnose, Fructooligosaccharides, Laminaria Ochroleuca Extract, Silica, Trideceth-6, C30-45 Alkyl Cetearyl Dimethicone Crosspolymer, Lauryl Peg/Ppg-18/18 Methicone, Caprylic/Capric Triglyceride, Mineral Oil (Paraffinum Liquidum), Pentylene Glycol, 1,2-Hexanediol, Peg/Ppg-18/18 Dimethicone, Caprylyl Glycol, Propylene Glycol, Sodium Hydroxide, Citric Acid, Disodium Edta, Fragrance (Parfum).', 'oil', 30, 368000, 1000, 1),
(61, 4, 4, 'Kem Dưỡng Bioderma Hỗ Trợ Phục Hồi Da Tổn Thương ', '61.jpg', 'Bioderma Cicabio Crème là sản phẩm kem dưỡng ẩm hỗ trợ phục hồi và làm dịu làn da tổn thương, da nhạy cảm - kích ứng đến từ thương hiệu dược mỹ phẩm Bioderma nổi tiếng của Pháp, được các bác sĩ da liễu Pháp tin dùng. Sản phẩm có khả năng làm giảm các triệu chứng ngứa và khó chịu gần như ngay lập tức, đồng thời dưỡng ẩm và khôi phục lớp biểu bì, tạo lớp màng bảo vệ da tối ưu mà vẫn mỏng nhẹ và thoáng khí, giúp da luôn thoải mái dễ chịu.', 'Aqua (Water), Glycerin (Khóa Ẩm), Ethylhexyl Palmitate (Làm Mềm Da), Fructooligosaccharides, Zinc Oxide (Làm Làm Vết Thương, Chống Uva, Kháng Khuẩn), Octyldodecanol, Butylene Glycol, Polyacrylamide, Mannitol, Xylitol, Rhamnose, Laminaria Ochroleuca Extract, Copper Sulfate (Trị Thương), Zinc Sulfate (Ngăn, Sodium Hyaluronate (Cấp Ẩm, Giảm Sự Mất Nước Qua Da), Vitis Vinifera (Grape) Vine Extract (Resveratrol: Giảm Thương Tổn Tế Bào), Asiaticoside (Centella Asiatica: Kháng Khuẩn, Trị Thương), Asiatic Acid, Madecassic Acid, C13-14 Isoparaffin, Octyldodecyl Xyloside, Peg-30 Dipolyhydroxystearate, Caprylic/Capric Triglyceride, Laureth-7, Laureth-3, Hydroxyethylcellulose, Acetyl Dipeptide-1 Cetyl Ester, Potassium Sorbate.', 'all', 40, 293000, 1000, 1);
INSERT INTO `product` (`product_id`, `brand_id`, `product_type`, `product_name`, `img`, `info`, `ingredient`, `skin_type`, `volume`, `price`, `quantity`, `state`) VALUES
(62, 4, 4, 'Kem Dưỡng Ẩm Bioderma Cho Da Khô Nhạy Cảm', '62.jpg', 'Bioderma Atoderm Crème là sản phẩm kem dưỡng ẩm chăm sóc hàng ngày, bảo vệ và dưỡng ẩm chuyên sâu đến từ thương hiệu dược mỹ phẩm Bioderma của Pháp. Nhờ các thành phần dưỡng chất và tái cấu trúc, kem dưỡng Atoderm Crème giúp tăng cường hàng rào sinh học bảo vệ da và do đó ngăn ngừa các tác nhân gây kích ứng xâm nhập. Với các thành phần dưỡng ẩm, Atoderm Crème giữ nước ở lớp da trên và ngăn chặn quá trình bay hơi. Dùng cho da thường và da khô nhạy cảm.', 'Aqua/Water/Eau, Paraffinum Liquidum/Mineral Oil/Huile Minerale, Glycerin, Brassica Campestris (Rapeseed) Seed Oil, Sodium Polyacrylate, Pentylene Glycol, Cetearyl Alcohol, 1,2-Hexanediol, Caprylyl Glycol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Sodium Citrate, Xylitol, Cetearyl Glucoside, Mannitol, Tocopherol, Rhamnose, Xylitylglucoside, Helianthus Annuus (Sunflower) Seed Oil, Anhydroxylitol, Niacinamide, Glucose, Fructooligosaccharides, Caprylic/Capric Triglyceride, Laminaria Ochroleuca Extract. [Bi 475]', 'dry', 200, 293000, 1000, 1),
(63, 4, 4, 'Kem Dưỡng Bioderma Cấp Ẩm Và Làm Dịu Cho Da Nhạy', '63.jpg', 'Kem Dưỡng Bioderma Cấp Ẩm Và Làm Dịu Cho Da Nhạy Cảm 40ml là sản phẩm kem dưỡng ẩm đến từ thương hiệu mỹ phẩm Bioderma của Pháp, chứa đựng khả năng dưỡng ẩm đột phá lên đến 12 giờ, tự bảo vệ trước tác nhân kích ứng, tăng cường đề kháng, hiệu quả lâu dài và rõ ràng cho mỗi tình trạng nhạy cảm của làn da.', 'Aqua/Water/Eau, Glycerin, Dicaprylyl Ether, Propylheptyl Caprylate, Butylene Glycol, Glyceryl Stearate Citrate, Glycol Palmitate, Squalane, Sucrose Stearate, Mangifera Indica (Mango) Seed Butter, Pentylene Glycol, Acrylates/C10-30 Alkyl Acrylate Crosspolymer, Caprylyl Glycol, Carnosine, Hydroxyethyl Acrylate/Sodium Acryloyldimethyl Taurate Copolymer, Mannitol, Xylitol, Tocopherol, Salvia Miltiorrhiza Flower/Leaf/Root Extract, Rhamnose, Glycine Soja (Soybean) Oil, Polysorbate 60, Sorbitan Isostearate, Palmitoyl Tetrapeptide-10. [Bi 2012]', 'all', 40, 401000, 500, 1),
(64, 4, 4, 'Gel Dưỡng Ẩm Bioderma Làm Dịu Cho Da Rất Khô ', '64.jpg', 'Gel Dưỡng Ẩm Làm Dịu Cho Da Rất Khô Bioderma Atoderm Intensive gel-crème là sản phẩm kem dưỡng đến từ thương hiệu dược mỹ phẩm Bioderma, giúp làm dịu da tức thì, giảm ngay cảm giác ngứa rát khó chịu và dưỡng ẩm suốt 24h. Đây món quà Bioderma dành tặng riêng cho làn da khô đến rất khô, dị ứng.', 'Aqua/Water/Eau, Glycerin, Niacinamide, Sodium Polyacrylate, Dipotassium Glycyrrhizate, Hydrogenated Polydecene, Pentylene Glycol, 1,2-Hexanediol, Caprylyl Glycol, Mannitol, Polysorbate 20, Xylitol, Rhamnose, Sodium Citrate, Polyquaternium-51, Fructooligosaccharides, Caprylic/Capric Triglyceride, Laminaria Ochroleuca Extract. [Bi 479]', 'dry', 75, 293000, 100, 1),
(65, 4, 4, 'Gel Dưỡng Ẩm Bioderma Làm Dịu Cho Da Rất Khô ', '65.jpg', 'Gel Dưỡng Ẩm Làm Dịu Cho Da Rất Khô Bioderma Atoderm Intensive gel-crème là sản phẩm kem dưỡng đến từ thương hiệu dược mỹ phẩm Bioderma, giúp làm dịu da tức thì, giảm ngay cảm giác ngứa rát khó chịu và dưỡng ẩm suốt 24h. Đây món quà Bioderma dành tặng riêng cho làn da khô đến rất khô, dị ứng.', 'Aqua/Water/Eau, Glycerin, Niacinamide, Sodium Polyacrylate, Dipotassium Glycyrrhizate, Hydrogenated Polydecene, Pentylene Glycol, 1,2-Hexanediol, Caprylyl Glycol, Mannitol, Polysorbate 20, Xylitol, Rhamnose, Sodium Citrate, Polyquaternium-51, Fructooligosaccharides, Caprylic/Capric Triglyceride, Laminaria Ochroleuca Extract. [Bi 479]', 'dry', 500, 561000, 1000, 1),
(66, 4, 1, 'Nước Tẩy Trang Bioderma Dành Cho Da Nhạy Cảm', '66.jpg', 'Nước Tẩy Trang Dành Cho Da Nhạy Cảm Bioderma Sensibio H2O là sản phẩm nước tẩy trang công nghệ Micellar đầu tiên trên thế giới, do thương hiệu dược mỹ phẩm Bioderma nổi tiếng của Pháp phát minh. Dung dịch giúp làm sạch sâu da và loại bỏ lớp trang điểm nhanh chóng mà không cần rửa lại bằng nước. Công thức dịu nhẹ, không kích ứng, không gây khô căng da, đặc biệt phù hợp với làn da nhạy cảm', 'Aqua/Water/Eau, Peg-6 Caprylic/Capric Glycerides, Fructooligosaccharides, Mannitol, Xylitol, Rhamnose, Cucumis Sativus (Cucumber) Fruit Extract, Propylene Glycol, Cetrimonium Bromide, Disodium Edta. [Bi 446]', 'all', 250, 331000, 500, 1),
(68, 4, 1, 'Nước Tẩy Trang Bioderma Dành Cho Da Dầu & Hỗn Hợp', '68.jpg', 'Nước Tẩy Trang Bioderma Sébium H2O là sản phẩm tẩy trang dành cho da dầu, da hỗn hợp đến từ thương hiệu dược mỹ phẩm Bioderma, được ứng dụng công nghệ Micellar đình đám giúp loại bỏ lớp trang điểm cùng bụi bẩn và dầu thừa trên da hiệu quả mà không gây khô căng hay nhờn rít, tạo cảm giác thông thoáng cho da sau một ngày dài mệt mỏi.', 'Water (Aqua), Peg-6 Caprylic/Capric Glycerides, Sodium Citrate , Zinc Gluconate, Copper Sulfate, Ginkgo Biloba Extract – Chiết Xuất Lá Bạch Quả, Mannitol, Xylitol, Rhamnose, Fructooligosaccharides, Propylene Glycol, Citric Acid, Disodium Edta, Cetrimonium Bromide, Fragrance (Parfum).', 'oil', 250, 331000, 1000, 1),
(70, 4, 8, 'Dầu Tắm Bioderma Làm Sạch & Làm Dịu Da Khô, Nhạy Cảm', '70.jpg', 'Bioderma Atoderm Huile De Douche từ thương hiệu dược mỹ phẩm Bioderma là sản phẩm dầu tắm chăm sóc và làm sạch dành cho cả gia đình. Với kết cấu dạng dầu giàu độ ẩm, dầu tắm Bioderma sẽ giúp nhẹ nhàng làm sạch, đồng thời nuôi dưỡng và làm dịu tình trạng da khô đến rất khô, da nhạy cảm, kích ứng. Làn da sau khi sử dụng trở nên mềm mại và thoải mái, không khô căng.', 'Aqua/Water/Eau, Glycerin, PEG-7 Glyceryl Cocoate, Sodium Cocoamphoacetate, Lauryl Glucoside, Coco-Glucoside, Glyceryl Oleate, Citric Acid, PEG-90 Glyceryl Isostearate, Fragrance (Parfum), Mannitol, Polysorbate 20, Xylitol, Laureth-2, Rhamnose, Niacinamide, Fructooligosaccharides, Tocopherol, Hydrogenated Palm Glycerides Citrate, Lecithin, Ascorbyl Palmitate.', 'dry', 1000, 419000, 1000, 1),
(72, 4, 8, 'Gel Tắm Bioderma Dịu Nhẹ Cho Da Thường & Khô Nhạy Cảm', '72.jpg', 'Gel Tắm Bioderma Dịu Nhẹ Cho Da Thường & Khô Nhạy Cảm Atoderm Gel Douche là dòng sữa tắm đến từ thương hiệu mỹ phẩm Bioderma của Pháp, với công thức dưỡng ẩm sản phẩm giúp làm sạch da mà vẫn giữ độ ẩm hỗ trợ làm mềm da, dịu da tránh tình trạng khô căng, khó chịu. Hiện sản phẩm Gel Tắm Bioderma Dịu Nhẹ Cho Da Thường & Khô Nhạy Cảm Atoderm Gel Douche đã có mặt tại Hasaki với 2 dung tích:', 'Aqua/Water/Eau, Sodium Laureth Sulfate, Coco-Betaine, Sodium Lauroyl Sarcosinate, Glycerin, Methylpropanediol, Coco-Glucoside, Glyceryl Oleate, Disodium Edta, Citric Acid, Capryloyl Glycine, Copper Sulfate, Xylitylglucoside, Anhydroxylitol, Xylitol, Niacinamide, Glucose, Fructooligosaccharides, Mannitol, Tocopherol, Hydrogenated Palm Glycerides Citrate, Lecithin, Rhamnose, Ascorbyl Palmitate, Fragrance (Parfum). [Bi 548]', 'dry', 500, 412000, 1000, 1),
(74, 4, 5, 'Gel Rửa Mặt Bioderma Dành Cho Da Dầu & Hỗn Hợp ', '74.jpg', 'Gel Rửa Mặt Bioderma Sébium Gel Moussant là sữa rửa mặt thanh lọc dịu nhẹ được thương hiệu dược mỹ phẩm Bioderma thiết kế chuyên biệt dành cho làn da dầu & hỗn hợp, giúp loại bỏ các tạp chất trên da, giải phóng bít tắc và làm thông thoáng lỗ chân lông, đồng thời kiểm soát dầu thừa, ngăn ngừa mụn hiệu quả mà vẫn duy trì pH tự nhiên trên da.', 'Aqua/Water/Eau, Sodium Cocoamphoacetate, Sodium Laureth Sulfate, Methylpropanediol, Disodium Edta, Mannitol, Xylitol, Rhamnose, Fructooligosaccharides, Zinc Sulfate, Copper Sulfate, Ginkgo Biloba Leaf Extract, Peg-90 Glyceryl Isostearate, Lactic Acid, Laureth-2, Potassium Sorbate, Sodium Chloride, Propylene Glycol, Sodium Hydroxide, Fragrance (Parfum). [Bi 418].', 'oil', 100, 185000, 500, 1),
(76, 4, 5, 'Gel Rửa Mặt Bioderma Tạo Bọt Cho Da Nhạy Cảm ', '76.jpg', 'Gel Rửa Mặt Bioderma Tạo Bọt Cho Da Nhạy Cảm 100mlSensibio Gel Moussant là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm Bioderma của Pháp, làm sạch sâu, dịu nhẹ với công nghệ micellar loại bỏ các bụi bẩn, bã nhờn dễ dàng mà không tác động mạnh lực mạnh lên da, tạo nên hàng rào bảo vệ da vững chắc cho da, cân bằng độ pH và độ ẩm cho làn da.', 'Aqua/Water/Eau, Sodium Cocoamphoacetate, Propanediol, Sodium Lauroyl Sarcosinate, Citric Acid, Coco-Glucoside, Glyceryl Oleate, Sodium Citrate, Peg-90 Glyceryl Isostearate, Mannitol, Xylitol, Laureth-2, Rhamnose, Fructooligosaccharides, Tocopherol, Hydrogenated Palm Glycerides Citrate, Lecithin, Ascorbyl Palmitate. [Bi 722]', 'all', 100, 219000, 500, 1),
(78, 4, 2, 'Kem Chống Nắng Bioderma Dành Cho Da Dầu, Mụn SPF30', '78.jpg', 'Bioderma Photoderm AKN Mat SPF30 là sản phẩm kem chống nắng chuyên biệt dành cho làn da dầu, mụn, nhạy cảm từ thương hiệu dược mỹ phẩm Bioderma, mang lại hiệu quả 2 trong 1 chỉ số chống nắng cao và ngăn ngừa sự phát triển của mụn. Kết cấu mịn màng, không màu, không bết dính hay để lại vệt trắng.', 'Silica, C12-15 Alkyl Benzoate, Methylene Bis-Benzotriazolyl Tetramethylbutylphenol [Nano], Corn Starch Modified, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Ethylhexyl Triazone, Potassium Cetyl Phosphate, Brassica Campestris/Aleurites Fordii Oil Copolymer, Hydroxyethyl Acrylate/ Sodium Acryloyldimethyl Taurate Copolymer, 1, 2-Hexanediol, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Silica, Decyl Glucoside, Glycolic Acid, Boron Nitride, Salicylic Acid, Tocopheryl Acetate, Propylene Glycol, Xanthan Gum, Sodium Hydroxide, Polysorbate 60, Sorbitan Isostearate, Ectoin, Mannitol, Xylitol, Rhamnosis, Ginkgo Biloba Leaf Extract, Fructooligosaccharides, Propyl Gallate, Caprylic/Capric Triglyceride, Tocopherol, Laminaria Ochroleuca Extract, Fragrance (Perfume). [Bi 573]', 'oil', 40, 427000, 500, 1),
(79, 4, 2, '[Mini] Kem Chống Nắng Bioderma Dành Cho Da Dầu, Mụn', '79.jpg', 'Bioderma Photoderm AKN Mat SPF30 là sản phẩm kem chống nắng chuyên biệt dành cho làn da dầu, mụn, nhạy cảm từ thương hiệu dược mỹ phẩm Bioderma, mang lại hiệu quả 2 trong 1 chỉ số chống nắng cao và ngăn ngừa sự phát triển của mụn. Kết cấu mịn màng, không màu, không bết dính hay để lại vệt trắng.', 'Silica, C12-15 Alkyl Benzoate, Methylene Bis-Benzotriazolyl Tetramethylbutylphenol [Nano], Corn Starch Modified, Diethylamino Hydroxybenzoyl Hexyl Benzoate, Ethylhexyl Triazone, Potassium Cetyl Phosphate, Brassica Campestris/Aleurites Fordii Oil Copolymer, Hydroxyethyl Acrylate/ Sodium Acryloyldimethyl Taurate Copolymer, 1, 2-Hexanediol, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Silica, Decyl Glucoside, Glycolic Acid, Boron Nitride, Salicylic Acid, Tocopheryl Acetate, Propylene Glycol, Xanthan Gum, Sodium Hydroxide, Polysorbate 60, Sorbitan Isostearate, Ectoin, Mannitol, Xylitol, Rhamnosis, Ginkgo Biloba Leaf Extract, Fructooligosaccharides, Propyl Gallate, Caprylic/Capric Triglyceride, Tocopherol, Laminaria Ochroleuca Extract, Fragrance (Perfume). [Bi 573]', 'oil', 5, 19000, 1000, 1),
(80, 4, 2, 'Kem Chống Nắng Bioderma Giảm Bóng Nhờn (Không màu)\r\n', '80.jpg', 'Kem Chống Nắng Bioderma Photoderm MAX Aquafluide SPF 50+ là dòng sản phẩm chống nắng da mặt đến từ thương hiệu mỹ phẩm Bioderma của Pháp, với chỉ số chống nắng cao giúp bảo vệ da khỏi tác hại của tia UVA/UVB. Kết cấu lỏng nhẹ, với công thức kiểm soát dầu mang lại cảm giác khô thoáng, thấm nhanh và không để lại vệt trắng. Sản phẩm không gây kích ứng, không mùi hương, chống nước, phù hợp cho mọi loai da, đặc biệt là da nhạy cảm.', 'Aqua/Water/Eau, Dicaprylyl Carbonate, Octocrylene, Methylene Bis-Benzotriazolyl Tetramethylbutylphenol [Nano], Butyl Methoxydibenzoylmethane, Glycerin, Methyl Methacrylate Crosspolymer, Cyclohexasiloxane, Cyclopentasiloxane, Bis- Ethylhexyloxyphenol Methoxyphenyl Triazine, Polymethylsilsesquioxane, Methylpropanediol, Hdi/Trimethylol Hexyllactone Crosspolymer, C20-22 Alkyl Phosphate, C20-22 Alcohols, Decyl Glucoside, Glyceryl Stearate Citrate, Pentylene Glycol, Microcrystalline Cellulose, C30-45 Alkyl Cetearyl Dimethicone Crosspolymer, 1,2-Hexanediol, Caprylyl Glycol, Disodium Edta, Xanthan Gum, Mannitol, Xylitol, Sodium Hydroxide, Cellulose Gum, Rhamnose, Propylene Glycol, Citric Acid, Ectoin, Tocopherol. [BI 642]', 'all', 40, 428000, 1000, 1),
(81, 4, 2, 'Kem Chống Nắng Bioderma Giảm Bóng Nhờn (Màu Light)', '81.jpg', 'Kem Chống Nắng Bioderma Photoderm MAX Aquafluide SPF 50+ là dòng sản phẩm chống nắng da mặt đến từ thương hiệu mỹ phẩm Bioderma của Pháp, với chỉ số chống nắng cao giúp bảo vệ da khỏi tác hại của tia UVA/UVB. Kết cấu lỏng nhẹ, với công thức kiểm soát dầu mang lại cảm giác khô thoáng, thấm nhanh và không để lại vệt trắng. Sản phẩm không gây kích ứng, không mùi hương, chống nước, phù hợp cho mọi loai da, đặc biệt là da nhạy cảm.', 'Dicaprylyl Carbonate, Octocrylene, Methylene Bis-Benzotriazolyl Tetramethylbutylphenol [Nano], Butyl Methoxydibenzoylmethane, Glycerin, Methyl Methacrylate Crosspolymer, Cyclohexasiloxane, Cyclopentasiloxane, Bis-Ethylhexyloxyphenol Methoxyphenyl Triazine, Glyceryl Stearate Citrate, Potassium Cetyl Phosphate, Titanium Dioxide (Ci 77891), Methylpropanediol, Polymethylsilsesquioxane, Decyl Glucoside, Hdi/Trimethylol Hexyllactone Crosspolymer, Iron Oxides (Ci 77492), Pentylene Glycol, Microcrystalline Cellulose, C30-45 Alkyl Cetearyl Dimethicone Crosspolymer, 1,2-Hexanediol, Caprylyl Glycol, Disodium Edta, Xanthan Gum, Iron Oxides (Ci 77491), Mannitol, Xylitol, Citric Acid, Hydrogenated Lecithin, Cellulose Gum, Rhamnose, Iron Oxides (Ci 77499), Propylene Glycol, Ectoin, Tocopherol. [Bi 640]', 'all', 40, 428000, 1000, 1),
(82, 4, 6, 'Dung Dịch Cân Bằng Da Bioderma Cho Da Dầu, Hỗn Hợp', '82.jpg', 'Dung Dịch Cân Bằng Da Bioderma Sebium Lotion là sản phẩm nước cân bằng da (toner) dạng lỏng dành cho da hỗn hợp/ da dầu đến từ thương hiệu dược mỹ phẩm Bioderma, giúp điều chỉnh độ pH của da và kiểm soát lượng dầu thừa, cân bằng độ ẩm, hỗ trợ se nhỏ lỗ chân lông và hạn chế hình thành mụn.', 'Aqua/Water/Eau, Peg-11 Methyl Ether Dimethicone, Butylene Glycol, Glycerin, Fomes Officinalis (Mushroom) Extract, Capryloyl Glycine, Polysorbate 20, Sodium Citrate, Zinc Gluconate, Salicylic Acid, Sodium Hydroxide, Mannitol, Sodium Metabisulfite, Xylitol, Rhamnose, Pyridoxine Hcl, Propyl Gallate, Peg-40 Hydrogenated Castor Oil, Fructooligosaccharides, Phenoxyethanol, Fragrance (Parfum). [Bi 727', 'oil', 200, 378000, 1000, 1),
(83, 4, 6, 'Nước Hoa Hồng Bioderma Dành Cho Da Nhạy Cảm', '83.jpg', 'Nước Hoa Hồng Dành Cho Da Nhạy Cảm Bioderma Sensibio Tonique là sản phẩm đến từ thương hiệu Bioderma nổi tiếng tại Pháp, với các chức năng chính là chăm sóc tăng cường độ ẩm cho da khỏe mạnh, nuôi dưỡng làn da giúp da trở nên tươi sáng hơn ngay sau khi sử dụng. Bênh cạnh đó, sản phẩm còn loại bỏ tạp chất dư thừa trên da, khôi phục và mang đến làn da rạng rỡ, đầy sức sống!', 'Aqua/Water/Eau, Glycerin, Xylitol, Polysorbate 20, Mannitol, Rhamnose, Fructooligosaccharides, Cucumis Sativus (Cucumber) Fruit Extract, Peg-40 Hydrogenated Castor Oil, Allantoin, Propylene Glycol, Disodium Edta, Cetrimonium Bromide, Sodium Hydroxide, Citric Acid.', 'all', 250, 361000, 1000, 1),
(85, 5, 11, 'Kem Nền Maybelline Mịn Nhẹ Kiềm Dầu Chống Nắng', '85.jpg', 'Kem Nền Fit Me Matte Poreless Foundation SPF 22 gây ấn tượng với khả năng kiềm dầu hiệu quả suốt cả ngày dài nhờ thành phần đất sét khoáng, cho lớp nền mịn lì tự nhiên, đồng thời che phủ tốt mọi khuyết điểm trên bề mặt da.', 'Water, Cyclohexasiloxane, Nylon-12, Isododecane, Alcohol Denat., Cyclopentasiloxane, Peg-10 Dimethicone, Cetyl Peg/Ppg-10/1 Dimethicone, Peg-20, Polyglyceryl-4 Isostearate, Disteardimonium Hectorite, Phenoxyethanol, Magnesium Sulfate, Disodium Stearoyl Glutamate, Hdi/Trimethylol Hexyllactone Crosspolymer, Titanium Dioxide [Nano] / Titanium Dioxide, Methylparaben, Acrylates Copolymer, Tocopherol, Butylparaben, Aluminum Hydroxide, Alumina, Silica, Glycerin, Ci 77891 / Titanium Dioxide, Ci 77491, Ci 77492, Ci 77499', 'oil', 30, 198000, 1000, 1);

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
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` varchar(20) NOT NULL,
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
('S001', 1, 'Thiên Hương', 'thienhuong6935@gmail.com', '0329947740', 'HCM');

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
  MODIFY `account_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `feature_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

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
