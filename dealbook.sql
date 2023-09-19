-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 19, 2023 lúc 10:51 AM
-- Phiên bản máy phục vụ: 10.4.27-MariaDB
-- Phiên bản PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `dealbook`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', '2023-05-20 15:30:26', '$2y$10$YVJBKUvysXjPCtHed8CjYuCwA2oLT4Ww3v2hQa6JmaEUwo/diJ1yq', 0, 'fQxMGCuH32I6FBOtUVR6m89t0BGrbZnNX40l8w6EYZftAcTP7uVcGggFqtHY', '2023-05-20 15:30:26', '2023-05-20 15:30:26'),
(3, 'Nhân viên 2', 'admin2@gmail.com', NULL, '$2y$10$pziIfbRdJFrzLwqFLKOdAeg1kiXyL6o1SigIWDk0O8Y9HmPpJllly', 1, NULL, '2023-07-30 01:47:43', '2023-07-30 01:47:43');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `authors`
--

INSERT INTO `authors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(4, 'Hồ Anh Thái', '2023-08-04 15:07:15', '2023-08-04 15:07:15'),
(5, 'Nguyễn Trương Quý', '2023-08-04 15:07:51', '2023-08-04 15:07:51'),
(6, 'Nguyễn Vĩnh Nguyên', '2023-08-04 15:08:03', '2023-08-04 15:08:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `created_at`, `updated_at`) VALUES
(4, 'Nhà xuất bản Kim Đồng', '2023-08-04 14:57:54', '2023-08-04 14:57:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `parent_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `url`, `parent_category_id`, `created_at`, `updated_at`) VALUES
(7, 'Danh mục con 1', 'storage/images/categories/search-inder-your-self.jpg', 5, '2023-07-30 01:56:33', '2023-07-30 01:56:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `product_id`, `content`, `created_at`, `updated_at`) VALUES
(3, 2, 9, 'aa', '2023-09-08 17:01:21', '2023-09-08 17:01:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `medias`
--

CREATE TABLE `medias` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` text NOT NULL,
  `imageable_id` int(11) NOT NULL,
  `imageable_type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `medias`
--

INSERT INTO `medias` (`id`, `url`, `imageable_id`, `imageable_type`, `created_at`, `updated_at`) VALUES
(1, 'storage/images/products/lap-ke-hoach-kinh-doanh-hieu-qua.jpg', 1, 'App\\Models\\Product', '2022-05-21 18:26:41', '2022-05-21 18:26:41'),
(2, 'storage/images/products/lap-ke-hoach-kinh-doanh-hieu-qua-ms.jpg', 1, 'App\\Models\\Product', '2022-05-21 18:26:41', '2022-05-21 18:26:41'),
(3, 'storage/images/products/bank-4.0.jpg', 2, 'App\\Models\\Product', '2022-05-21 18:28:17', '2022-05-21 18:28:17'),
(4, 'storage/images/products/combo-dinh-duong-than-duoc-xanh.jpg', 3, 'App\\Models\\Product', '2022-05-21 18:33:56', '2022-05-21 18:33:56'),
(6, 'storage/images/products/ma-bun-luu-manh.jpg', 4, 'App\\Models\\Product', '2022-05-21 18:58:59', '2022-05-21 18:58:59'),
(7, 'storage/images/products/lich-su-the-gioi.jpg', 1, 'App\\Models\\Product', '2022-05-27 10:27:20', '2022-05-27 10:27:20'),
(8, 'storage/images/products/9786040288271.jpg', 5, 'App\\Models\\Product', '2022-12-23 17:03:06', '2022-12-23 17:03:06'),
(9, 'storage/images/products/search-inder-your-self.jpg', 6, 'App\\Models\\Product', '2023-07-28 11:28:57', '2023-07-28 11:28:57'),
(10, 'storage/images/products/search-inder-your-self.jpg', 7, 'App\\Models\\Product', '2023-07-30 01:57:57', '2023-07-30 01:57:57'),
(11, 'storage/images/products/Thay đổi cuộc đời.webp', 8, 'App\\Models\\Product', '2023-08-04 15:50:54', '2023-08-04 15:50:54'),
(12, 'storage/images/products/Khéo ăn khéo nói sẽ được lòng thiên hạ.webp', 9, 'App\\Models\\Product', '2023-08-04 15:53:02', '2023-08-04 15:53:02'),
(13, 'storage/images/products/8935278607311-1.jpg', 10, 'App\\Models\\Product', '2023-08-04 15:57:01', '2023-08-04 15:57:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_20_132229_create_admins_table', 1),
(6, '2022_05_20_132330_create_parent_categories_table', 1),
(7, '2022_05_20_132406_create_categories_table', 1),
(8, '2022_05_20_132702_create_suppliers_table', 1),
(9, '2022_05_20_133025_create_brands_table', 1),
(10, '2022_05_20_133026_create_authors_table', 1),
(11, '2022_05_20_133057_create_products_table', 1),
(12, '2022_05_20_133738_create_vouchers_table', 1),
(13, '2022_05_20_134018_create_comments_table', 1),
(14, '2022_05_20_134027_create_replies_table', 1),
(15, '2022_05_20_134409_create_ratings_table', 1),
(16, '2022_05_20_134455_create_orders_table', 1),
(17, '2022_05_20_134502_create_order_details_table', 1),
(18, '2022_05_20_134629_create_setting_table', 1),
(19, '2022_05_20_210939_create_medias_table', 1),
(20, '2023_05_13_224447_create_wishlists_table', 2),
(21, '2023_08_14_233527_add_google_columns_to_users_table', 3),
(22, '2023_09_19_153305_create_user_click_products_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` varchar(50) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `voucher_code` varchar(50) DEFAULT NULL,
  `total` int(11) NOT NULL,
  `address` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `voucher_code`, `total`, `address`, `status`, `created_at`, `updated_at`) VALUES
('order_61HmyVlsVmKOKoFZ1ljUx1xW', 1, 'km1', 2100000, 'Hà Nội', 2, '2023-07-19 04:50:16', '2023-07-19 05:00:05'),
('order_9qZcmXD2ADDUvFs9Gc8bMX8V', 1, NULL, 200000, 'TPHCM', 0, '2023-04-16 03:42:08', '2023-04-16 03:42:08'),
('order_KE6WaypKvlXW2FcJ2eOn4j26', 2, NULL, 104000, 'Ha Noi', 2, '2023-09-16 02:35:40', '2023-09-16 02:39:24'),
('order_UnjwzF65FEZqNCKoy0Owupfk', 2, NULL, 100000, 'Hà Nội', 0, '2023-07-30 02:10:57', '2023-07-30 02:10:57'),
('order_vWTy8jN5J0px0I19xcyCI22n', 2, NULL, 104000, 'aaa', 0, '2023-08-21 07:23:14', '2023-08-21 07:23:14'),
('order_Y2pQ5FY9ZYWOSotKUP0lfFqr', 2, NULL, 620000, 'aaaaaaaaa', 1, '2023-08-12 02:26:55', '2023-08-12 02:36:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `qty`, `created_at`, `updated_at`) VALUES
(18, 'order_Y2pQ5FY9ZYWOSotKUP0lfFqr', 10, 2, '2023-08-12 02:26:55', '2023-08-12 02:26:55'),
(19, 'order_Y2pQ5FY9ZYWOSotKUP0lfFqr', 9, 1, '2023-08-12 02:26:56', '2023-08-12 02:26:56'),
(20, 'order_vWTy8jN5J0px0I19xcyCI22n', 9, 1, '2023-08-21 07:23:14', '2023-08-21 07:23:14'),
(21, 'order_KE6WaypKvlXW2FcJ2eOn4j26', 9, 1, '2023-09-16 02:35:41', '2023-09-16 02:35:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `parent_categories`
--

CREATE TABLE `parent_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `parent_categories`
--

INSERT INTO `parent_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(5, 'Sách tư duy', '2023-07-30 01:52:02', '2023-08-04 15:54:42'),
(6, 'Danh mục cha 2', '2023-07-30 01:52:19', '2023-07-30 01:52:19'),
(7, 'Danh mục cha 3', '2023-07-30 01:52:40', '2023-07-30 01:52:40'),
(8, 'Danh mục cha 4', '2023-07-30 01:52:52', '2023-07-30 01:52:52'),
(9, 'Sách Giáo Dục', '2023-08-04 15:54:23', '2023-08-04 15:54:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `description` text DEFAULT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `qty_buy` int(11) NOT NULL DEFAULT 0,
  `public_date` date DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `page` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `sale_price` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `category_id`, `brand_id`, `supplier_id`, `author_id`, `description`, `qty`, `qty_buy`, `public_date`, `size`, `cover`, `page`, `status`, `created_at`, `updated_at`, `start_date`, `end_date`, `sale_price`, `type`) VALUES
(8, 'Thay đổi một suy nghĩ - Thay đổi cả cuộc đời', 200000, 7, 4, 3, 4, 'Sách: Thay Đổi Một Suy Nghĩ Thay Đổi Cả Cuộc Đời\r\nMã sản phẩm: 8936067604191\r\nTác giả : Hoàng Khải Đoàn\r\nDịch giả :Phương Linh\r\nNXB: NXB Thanh Niên\r\nKích thước : 16x23 cm\r\nNăm xuất bản : 2021\r\nSố trang : 400\r\nKhối lượng : 400 grams\r\nBìa : bìa mềm', 10, 0, '2002-10-09', '16x23 cm', 'Bìa mềm', 400, 1, '2023-08-04 15:50:53', '2023-08-04 15:50:53', '2023-08-08', '2023-09-08', 128000, 1),
(9, 'Khéo Ăn Nói Sẽ Có Được Thiên Hạ (Tái Bản)', 104000, 7, 4, 6, 6, 'Trong xã hội thông tin hiện đại, sự im lặng không còn là vàng nữa, nếu không biết cách giao tiếp thì dù là vàng cũng sẽ bị chôn vùi. Trong cuộc đời một con người, từ xin việc đến thăng tiến, từ tình yêu đến hôn nhân, từ tiếp thị cho đến đàm phán, từ xã giao đến làm việc… không thể không cần đến kĩ năng và khả năng giao tiếp. Khéo ăn khéo nói thì đi đâu, làm gì cũng gặp thuận lợi. Không khéo ăn nói, bốn bề đều là trở ngại khó khăn.\r\n \r\n\r\nĐã bao giờ đánh mất một công việc, bạn bỏ lỡ một mối quan hệ tuyệt vời, hay đơn giản là bạn cảm thấy khó nói chuyện với mọi người. Bạn có bao giờ nghĩ là do kĩ năng nói chuyện của mình chưa tốt, chưa thuyết phục được mọi người. Bạn đổ lỗi cho số phận và vận may của mình chưa đến. Hãy dừng việc than thân trách phận và hành động để thay đòi chính mình.\r\n\r\n \r\n\r\nVậy làm thế nào để cải thiện và tránh gặp phải những tình huống như trên? Làm thế nào để ăn nói khéo léo? Có phương pháp và quy luật nào được áp dụng khi giao tiếp không? Có nguyên tắc và bí quyết nào cho các cuộc nói chuyện không? Trong những tình huống khác nhau, với những người khác nhau thì phải nói chuyện như thế nào, và làm sao để trình bày những điều khó nói?  \r\n\r\n \r\n\r\nCuốn sách Khéo ăn nói sẽ có được thiên hạ của Trác Nhã sẽ giải đáp cho bạn đọc những câu hỏi đó. Cuốn sách với ngôn từ rõ ràng, gần gũi với cuộc sống sẽ mang đến những kĩ năng và phương pháp giao tiếp thực dụng, chắc chắn sẽ giúp ích được cho bạn đọc.\r\n\r\n \r\n\r\nGiá trị của cuốn sách nằm ở chỗ tác giả đã dốc hết tâm sức nghiên cứu về các kĩ năng và quy tắc giao tiếp để đúc kết, truyền tải vào trong những trang sách khiến cho người đọc cảm thấy cuốn hút, và học hỏi được nhiều kĩ năng giúp cho bạn đọc tự tin và thành công trong việc giao tiếp.\r\n\r\n \r\n\r\nXây dựng mối quan hệ nhờ tài ăn nói\r\nTừ trước đến nay, trong xã hội, giao tiếp đang là một trong những điều mà ai cũng phải đối mặt, đặc biệt là các bạn trẻ, những bạn đang bước chân đang cần chứng tỏ năng lực của mình trước cuộc sống, mọi người. Chúng ta ngày càng phải giao tiếp với rất nhiều người. Sử dụng ngôn ngữ khéo léo, thân thiện chính là cách quan trọng nhất để xóa bỏ tâm lí đề phòng của đối phương và rút ngắn khoảng cách giữa hai bên, giúp cho mọi người tin tưởng bạn hơn và từ đó sẵn sàng giúp đỡ bạn trong công việc và học  tập.\r\n\r\n \r\n\r\nHơn nữa để thành công, bạn không được bỏ qua một mối quan hệ nào trong xã hội, mỗi một người đến và đi trong cuộc đời bạn đều có thể cho bạn nhiều bài học, kinh nghiệm quý báu mà nó sẽ chắc chắn sẽ giúp ích cho bạn trong cuộc đời. Điều quan trọng là bạn phải ăn nói, giao tiếp như nào để người đó yêu quý bạn và sẵn sàng chia sẻ cho bạn những kinh nghiệm quý báu của bản thân họ. Cuốn sách “ Khéo ăn nói sẽ có được thiên hạ” chắc chắn sẽ không làm bạn thất vọng.', 7, 3, '2023-08-25', '14.5x20.5 cm', 'Bìa mềm', 346, 1, '2023-08-04 15:53:02', '2023-09-16 02:35:41', NULL, NULL, NULL, 0),
(10, 'Không Diệt Không Sinh Đừng Sợ Hãi (Tái Bản 2022)', 129000, 7, 4, 5, 5, 'Nhiều người trong chúng ta tin rằng cuộc đời của ta bắt đầu từ lúc chào đời và kết thúc khi ta chết. Chúng ta tin rằng chúng ta tới từ cái Không, nên khi chết chúng ta cũng không còn lại gì hết. Và chúng ta lo lắng vì sẽ trở thành hư vô.\r\n\r\nBụt có cái hiểu rất khác về cuộc đời. Ngài hiểu rằng sống và chết chỉ là những ý niệm không có thực. Coi đó là sự thực, chính là nguyên do gây cho chúng ta khổ não. Bụt dạy không có sinh, không có diệt, không tới cũng không đi, không giống nhau cũng không khác nhau, không có cái ngã thường hằng cũng không có hư vô. Chúng ta thì coi là Có hết mọi thứ. Khi chúng ta hiểu rằng mình không bị hủy diệt thì chúng ta không còn lo sợ. Đó là sự giải thoát. Chúng ta có thể an hưởng và thưởng thức đời sống một cách mới mẻ.', 0, 2, '2023-07-31', '14.5x20.5 cm', 'Bìa mềm', 289, 1, '2023-08-04 15:57:01', '2023-08-12 02:26:56', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `star` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `replies`
--

CREATE TABLE `replies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `setting`
--

CREATE TABLE `setting` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `setting`
--

INSERT INTO `setting` (`id`, `title`, `email`, `tel`, `address`, `created_at`, `updated_at`) VALUES
(1, 'DealBook', 'DealBook@gmail.com', '+0971208091', 'Hà Nội', '2022-05-20 15:30:26', '2023-07-30 01:46:15');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'Nhà Xuất Bản Giáo Dục', '2023-08-04 14:58:41', '2023-08-04 14:58:41'),
(4, 'Nhà xuất bản CENGAGE', '2023-08-04 15:04:26', '2023-08-04 15:04:26'),
(5, 'Nhà xuất bản SAGE', '2023-08-04 15:04:50', '2023-08-04 15:04:50'),
(6, 'Nhà xuất bản tổng hợp TP HCM', '2023-08-04 15:05:19', '2023-08-04 15:05:19');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `avatar` text DEFAULT NULL,
  `provider` text DEFAULT NULL,
  `provider_id` text DEFAULT NULL,
  `access_token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `remember_token`, `created_at`, `updated_at`, `status`, `avatar`, `provider`, `provider_id`, `access_token`) VALUES
(1, 'Test', 'test@gmail.com', NULL, '123456', '0123456789', '', '2023-05-21 19:05:39', '2023-07-23 16:47:37', 1, NULL, NULL, NULL, NULL),
(2, 'NGUYỄN NGỌC ÁNH', 'anhnn.ptit17@gmail.com', NULL, '$2y$10$z4F8HzYWeMOCQbYG3zyNueAM0tFK6GAKPO9zMbCtKM7IIaEkieKAu', '0971208091', 'GeGfpoQm2BaMlXJG2aWfeCJqIGex188ADQFWPlET9NuiBhhKCFl6bxXKjHuD', '2023-07-30 02:10:01', '2023-08-21 07:07:42', 1, 'https://lh3.googleusercontent.com/a/AAcHTtfUdVasy0qSdXEITL-pxXDHtUmiFKowAH73OwktcNedpw=s96-c', 'google', '118354699430352897110', 'ya29.a0AfB_byBCgtSOzFGl3CTt2y-2aD_8_NRzUX6Ql4ows_4tOTRmnxe_L-xhUx9drMJffyCcYADBO4peJ7WTNE77WJ2PJ2E6_pNcf-Qqkazo1CVVQwXKz0v6XY_8opPPyYtlNf54xrAKNEirKiBh6seCYGTeDjzJ5Xf1WL8rOgaCgYKAdsSARASFQHsvYls7X5Y3V9KVFdv8m1h6J6gFA0173'),
(3, 'Nguyễn Ngọc B19DCCN052-Ánh', 'nguyenngocanh1982001@gmail.com', NULL, '', NULL, 'IMRpsevYprDWgqhEeDcEwe5xDRs65Bwwg0Ta9BFsdfNYFmQ3eKxKvl2xTGay', '2023-08-14 16:53:24', '2023-08-14 16:55:52', 1, 'https://lh3.googleusercontent.com/a/AAcHTtcnOo3DmFsZKN2uOO3Vj6CS2qoNsF9CdzjyYIDFH6dWPU0=s96-c', 'google', '105321784305426441212', 'ya29.a0AfB_byCyyidpIfxQ1IU4EU4C8n1ty2ffIVreDlsG7UqpnozUG1OlKHU7t8PMaMImnRBmUVjZdqrgDckvh6RwwXmXwYds8kxOUMFYAPGGlW5Wcdfii9T7u47-Sx_3aVbW_4ZPRoSwZrJWzOFFZ2ta0aq81YN0aCgYKAbISARISFQHsvYlsNYneAWyBCvuj_DUjcJ3YMQ0163');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_click_products`
--

CREATE TABLE `user_click_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_token` text NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `click` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user_click_products`
--

INSERT INTO `user_click_products` (`id`, `user_token`, `product_id`, `click`, `created_at`, `updated_at`) VALUES
(1, '005fa00ec22b9deb52b0300acbdbe4bfd419f0df604b9e86929c57db0aed73ab', 10, 2, '2023-09-19 08:44:19', '2023-09-19 08:49:07'),
(2, '005fa00ec22b9deb52b0300acbdbe4bfd419f0df604b9e86929c57db0aed73ab', 9, 1, '2023-09-19 08:45:14', '2023-09-19 08:45:14'),
(3, '005fa00ec22b9deb52b0300acbdbe4bfd419f0df604b9e86929c57db0aed73ab', 8, 1, '2023-09-19 08:45:29', '2023-09-19 08:45:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vouchers`
--

CREATE TABLE `vouchers` (
  `code` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vouchers`
--

INSERT INTO `vouchers` (`code`, `price`, `qty`, `created_at`, `updated_at`) VALUES
('km1', 100000, 98, '2022-06-16 04:22:42', '2023-07-19 04:50:16'),
('km2', 50000, 200, '2022-06-16 04:23:30', '2022-06-16 04:23:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `user_id`, `created_at`, `updated_at`) VALUES
(11, 10, 2, '2023-08-12 02:29:36', '2023-08-12 02:29:36');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Chỉ mục cho bảng `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_category_id_index` (`parent_category_id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_index` (`user_id`),
  ADD KEY `comments_product_id_index` (`product_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `medias`
--
ALTER TABLE `medias`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_index` (`user_id`),
  ADD KEY `orders_voucher_code_index` (`voucher_code`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_index` (`order_id`),
  ADD KEY `order_details_product_id_index` (`product_id`);

--
-- Chỉ mục cho bảng `parent_categories`
--
ALTER TABLE `parent_categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_index` (`category_id`),
  ADD KEY `products_brand_id_index` (`brand_id`),
  ADD KEY `products_supplier_id_index` (`supplier_id`),
  ADD KEY `products_author_id_index` (`author_id`);

--
-- Chỉ mục cho bảng `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_user_id_index` (`user_id`),
  ADD KEY `ratings_product_id_index` (`product_id`);

--
-- Chỉ mục cho bảng `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `replies_comment_id_index` (`comment_id`);

--
-- Chỉ mục cho bảng `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_click_products`
--
ALTER TABLE `user_click_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_click_products_product_id_index` (`product_id`);

--
-- Chỉ mục cho bảng `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`code`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_index` (`product_id`),
  ADD KEY `wishlists_user_id_index` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `medias`
--
ALTER TABLE `medias`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `parent_categories`
--
ALTER TABLE `parent_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `replies`
--
ALTER TABLE `replies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `setting`
--
ALTER TABLE `setting`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user_click_products`
--
ALTER TABLE `user_click_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_category_id_foreign` FOREIGN KEY (`parent_category_id`) REFERENCES `parent_categories` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_voucher_code_foreign` FOREIGN KEY (`voucher_code`) REFERENCES `vouchers` (`code`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_comment_id_foreign` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `user_click_products`
--
ALTER TABLE `user_click_products`
  ADD CONSTRAINT `user_click_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
