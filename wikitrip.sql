-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2024 at 03:24 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wikitrip`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `idpengguna` int(11) NOT NULL,
  `nama` varchar(64) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`idpengguna`, `nama`, `username`, `password`) VALUES
(1, 'Admin', 'admin', '$2a$12$4ZXc5WiHren.Uf8lox.OHupMADwr76tdyzaqPY1KGfdwIDhsXFczi');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(64) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city_id`, `city_name`, `description`) VALUES
(1, 'Asahan', 'Asahan is a regency located in North Sumatra, Indonesia. Known for its stunning natural beauty, Asahan offers a variety of attractive tourist destinations, from picturesque beaches to lush landscapes.'),
(2, 'Batu Bara', 'Batu Bara is a regency in North Sumatra, Indonesia. This region is rich in culture and history, and is known for its coastal views and fishing industry.'),
(3, 'Dairi', 'Dairi is a regency in North Sumatra, Indonesia. Famous for its highlands and cool climate, it is a major producer of coffee and is home to the scenic Sidikalang region.'),
(4, 'Deli Serdang', 'Deli Serdang is a large regency located near Medan, North Sumatra. It is an important hub for agriculture and industry, with many diverse cultures living harmoniously.'),
(5, 'Humbang Hasundutan', 'Humbang Hasundutan is a regency in North Sumatra, known for its serene highlands and coffee plantations. It is a key area for Batak culture and traditions.'),
(6, 'Karo', 'Karo is a regency famous for the spectacular Mount Sinabung and its cool, fertile highlands. The region is also known for its unique Batak Karo culture.'),
(7, 'Labuhanbatu', 'Labuhanbatu is a regency in North Sumatra, known for its vast oil palm plantations and beautiful rivers, offering a variety of natural attractions.'),
(8, 'Labuhanbatu Selatan', 'Labuhanbatu Selatan is a regency in North Sumatra that is rich in natural resources and agricultural products, particularly palm oil and rubber.'),
(9, 'Labuhanbatu Utara', 'Labuhanbatu Utara is a regency in North Sumatra, famous for its plantations and beautiful natural environment, with rivers and rainforests being major features.'),
(10, 'Langkat', 'Langkat is a regency in North Sumatra, known for its rich biodiversity, particularly in the Gunung Leuser National Park, which is home to the endangered Sumatran orangutan.'),
(11, 'Mandailing Natal', 'Mandailing Natal is a regency known for its beautiful landscapes, rich Mandailing culture, and agricultural products such as coffee, rubber, and cocoa.'),
(12, 'Nias', 'Nias is an island regency off the coast of North Sumatra, famous for its unique traditional architecture, megalithic cultures, and world-class surfing beaches.'),
(13, 'Nias Barat', 'Nias Barat is a regency in the Nias Island group, known for its coastal beauty and cultural heritage, especially its traditional stone-jumping ceremonies.'),
(14, 'Nias Selatan', 'Nias Selatan is a regency in North Sumatra, renowned for its traditional villages, pristine beaches, and as a prime destination for surfers.'),
(15, 'Nias Utara', 'Nias Utara is a regency located in the northern part of Nias Island. It offers beautiful beaches, lush forests, and a rich cultural heritage.'),
(16, 'Padang Lawas', 'Padang Lawas is a regency in North Sumatra, known for its agricultural potential and historical sites, including ancient temples and archaeological relics.'),
(17, 'Padang Lawas Utara', 'Padang Lawas Utara is a regency in North Sumatra with a rich history and fertile land, home to various agricultural products like palm oil and rubber.'),
(18, 'Pakpak Bharat', 'Pakpak Bharat is a regency in North Sumatra, notable for its scenic landscapes, highland areas, and the unique Pakpak Batak culture.'),
(19, 'Samosir', 'Samosir is an island located in the middle of Lake Toba in North Sumatra. It is a popular tourist destination known for its breathtaking lake views and Batak culture.'),
(20, 'Serdang Bedagai', 'Serdang Bedagai is a regency in North Sumatra known for its agricultural output and beautiful beaches along the eastern coast.'),
(21, 'Simalungun', 'Simalungun is a regency in North Sumatra, known for its agricultural production, especially tea and palm oil, and its proximity to Lake Toba.'),
(22, 'Tapanuli Selatan', 'Tapanuli Selatan is a regency in North Sumatra known for its diverse natural landscapes, including mountains, forests, and rivers.'),
(23, 'Tapanuli Tengah', 'Tapanuli Tengah is a regency in North Sumatra known for its rich marine resources, beautiful beaches, and historic sites from the colonial era.'),
(24, 'Tapanuli Utara', 'Tapanuli Utara is a regency in North Sumatra, known for its cooler climate and rich Batak culture, as well as its coffee and rice production.'),
(25, 'Toba', 'Toba is a regency surrounding part of Lake Toba, known for its stunning lake scenery, cultural heritage, and importance in Batak history.'),
(26, 'Binjai', 'Binjai is a city located near Medan, North Sumatra. It is known for its agriculture, particularly rambutan fruit, and its rapid urban development.'),
(27, 'Gunungsitoli', 'Gunungsitoli is the largest city on Nias Island, North Sumatra, serving as a cultural and economic hub for the island.'),
(28, 'Medan', 'Medan is the capital city of North Sumatra and the largest city on Sumatra Island. It is a major economic hub and is known for its diverse culture and history.'),
(29, 'Padangsidimpuan', 'Padangsidimpuan is a city in North Sumatra, known for its agricultural products, especially salak fruit, and its location in a lush valley.'),
(30, 'Pematangsiantar', 'Pematangsiantar is the second-largest city in North Sumatra, known for its historical significance, vibrant culture, and nearby tea plantations.'),
(31, 'Sibolga', 'Sibolga is a coastal city in North Sumatra, known for its fishing industry, beautiful beaches, and role as a port city.'),
(32, 'Tanjungbalai', 'Tanjungbalai is a city located on the Asahan River, North Sumatra. It is known for its port, fishing industry, and historical sites.'),
(33, 'Tebing Tinggi', 'Tebing Tinggi is a city in North Sumatra, known for its strategic location along major transportation routes and its growing industrial sector.');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `post_id`, `user_id`, `comment`, `created_at`) VALUES
(3, 15, 5, 'bagus', '2024-11-08 01:41:40'),
(4, 15, 5, 'keren', '2024-11-08 01:41:55'),
(5, 15, 5, 'keren', '2024-11-08 02:07:52');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_liked` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`like_id`, `post_id`, `user_id`, `is_liked`, `created_at`) VALUES
(2, 15, 5, 1, '2024-11-08 02:10:56');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `content`, `image`, `created_at`) VALUES
(15, 2, 'pantainya masih sepi...', 'pantai_barat.jpg', '2024-10-22 12:16:47');

-- --------------------------------------------------------

--
-- Table structure for table `post_comments`
--

CREATE TABLE `post_comments` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `post_id`, `user_id`) VALUES
(19, 15, 5),
(20, 15, 5),
(21, 15, 5),
(22, 15, 5);

-- --------------------------------------------------------

--
-- Table structure for table `post_shares`
--

CREATE TABLE `post_shares` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shared_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `rating_id` int(11) NOT NULL,
  `tourism_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating_value` int(5) NOT NULL,
  `time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`rating_id`, `tourism_id`, `user_id`, `rating_value`, `time`) VALUES
(1, 73, 2, 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shares`
--

CREATE TABLE `shares` (
  `share_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shares`
--

INSERT INTO `shares` (`share_id`, `post_id`, `user_id`, `created_at`) VALUES
(1, 15, 5, '2024-11-08 01:46:32'),
(2, 15, 5, '2024-11-08 01:54:33');

-- --------------------------------------------------------

--
-- Table structure for table `tourismcategories`
--

CREATE TABLE `tourismcategories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(64) NOT NULL,
  `little_desc` text NOT NULL,
  `title_categories` varchar(255) DEFAULT NULL,
  `desc_categories` text DEFAULT NULL,
  `background_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tourismcategories`
--

INSERT INTO `tourismcategories` (`category_id`, `category_name`, `little_desc`, `title_categories`, `desc_categories`, `background_image`) VALUES
(1, 'Nature Destination', 'Discover breathtaking natural wonders across various destinations. From majestic mountains to serene beaches, enjoy extraordinary experiences that will rejuvenate your soul.', 'What makes North Sumatra wonderful place to visit', 'With stopovers in various locations, you can experience stunning natural beauty—untouched beaches, majestic mountains, and serene lakes. The vibrant city life of Medan, with its magnificent skyline, contrasts beautifully with the tranquil countryside. The diverse cultures of the Batak, Malay, and other local communities add to the charm, offering a unique mix of traditions, cuisine, and arts. Visiting North Sumatra means immersing yourself in a place where nature and culture come together in harmony.', 'image/background_nature.jpg'),
(2, 'Cultural Destination', 'Explore cultural destinations where rich traditions and vibrant heritage come to life. Immerse yourself in experiences that inspire and enrich your soul.', 'Cultural Highlights in North Sumatra', 'North Sumatra offers a rich blend of cultural heritage. Visitors can immerse themselves in the local traditions, art, and architecture that span centuries. The Batak culture, known for its unique dances and music, thrives here. The traditional houses, cultural festivals, and historical landmarks reflect the region\'s deep roots and vibrant community. Experience the richness of Batak, Malay, and many other ethnic groups as you travel through the region\'s cultural treasures.', 'image/Medan/istana_maimun.jpg'),
(3, 'Culinary Destination', 'Explore culinary destinations where rich flavors and traditions blend, offering unforgettable tastes that celebrate local cultures.', 'Culinary Highlights in North Sumatra', 'North Sumatra offers a rich and diverse culinary experience, influenced by various cultures and traditions. The region`s cuisine is known for its bold flavors, characterized by the use of unique spices and herbs. From the spicy and aromatic Batak dishes to the vibrant flavors of Malay and Minangkabau cuisine, food here is an adventure for the senses. Whether it\'s savory dishes or sweet treats, the food reflects a vibrant blend of local and cultural influences. With a focus on fresh ingredients and distinct preparation methods, North Sumatra\'s culinary offerings provide an unforgettable experience for food lovers.', 'image/culinary.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tourismplaces`
--

CREATE TABLE `tourismplaces` (
  `tourism_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `tourism_name` varchar(128) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `map_url` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tourismplaces`
--

INSERT INTO `tourismplaces` (`tourism_id`, `city_id`, `category_id`, `tourism_name`, `image_url`, `description`, `map_url`) VALUES
(1, 28, 1, 'Tjong A Fie', 'image/Medan/tjong_a_fie.JPG', 'Tjong A Fie Mansion is a historical landmark in Medan, Indonesia, built by Tjong A Fie, a prominent Chinese businessman and philanthropist, in 1900. This grand mansion showcases a unique blend of Chinese, Malay, and European architectural styles. It was once the home of Tjong A Fie, who played a crucial role in Medan`s development and was highly respected across various communities. Today, the mansion is a museum open to the public, offering a glimpse into the life and legacy of one of Medan`s most influential figures.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3982.009194412931!2d98.6802302!3d3.5853631!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303131c989e18467%3A0xccadef8b0cc3f8be!2sTjong%20A%20Fie%20Mansion!5e0!3m2!1sid!2sid!4v1728652767135!5m2!1sid!2sid\" width=\"600\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(2, 28, 2, 'Velangkanni', 'image/Medan/velangkanni.jpg', 'The Shri Mariamman Temple, also known as the Venkateswara Temple or Vihara Gunung Timur, is one of the oldest Hindu temples in Medan, Indonesia. Established in 1884, it is dedicated to the goddess Mariamman, believed to protect devotees from disease and harm. The temple is an important spiritual and cultural site for Medan`s Tamil Hindu community and features vibrant Dravidian-style architecture. Visitors are often captivated by its colorful sculptures and intricate designs, making it a unique attraction in the city.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3982.172905475536!2d98.608666!3d3.5475700000000003!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30312e7174d78d7b%3A0x168a135b3871de39!2sGraha%20Maria%20Annai%20Velangkanni!5e0!3m2!1sid!2sid!4v1728653011737!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(3, 28, 2, 'Maimun Palace', 'image/Medan/istana_maimun.jpg', 'Maimun Palace is a historical royal palace located in Medan, Indonesia, built in 1888 by Sultan Ma`mun Al Rasyid Perkasa Alamsyah of the Deli Sultanate. The palace is a stunning example of Malay architecture, combined with Islamic, Indian, and European influences. It features 30 rooms, with intricate carvings, grand halls, and elegant decorations that reflect the royal heritage. Maimun Palace is not only a symbol of Medan`s rich cultural history but also a popular tourist destination, offering insight into the legacy of the Deli Sultanate.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3982.05356003577!2d98.68451379999999!3d3.5751606!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303130498120d459%3A0xc80f094654f157e4!2sIstana%20Maimun%2C%20A%20U%20R%2C%20Kec.%20Medan%20Maimun%2C%20Kota%20Medan%2C%20Sumatera%20Utara%2020212!5e0!3m2!1sid!2sid!4v1728653046954!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(4, 25, 1, 'Bobocabin Kaldera', 'image/toba/bobocabin_kaldera.jpg', 'Bobocabin Kaldera Toba is a modern glamping (glamorous camping) site located near the stunning Lake Toba in North Sumatra, Indonesia. It offers a unique, eco-friendly accommodation experience with smart cabins that blend comfort and technology in the midst of nature. Surrounded by breathtaking views of the lake and lush greenery, Bobocabin Kaldera Toba provides visitors with a peaceful retreat while still offering modern amenities such as Wi-Fi and app-controlled cabin features. It`s an ideal destination for travelers seeking both adventure and relaxation in the scenic beauty of Lake Toba.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3985.688745450342!2d98.9461639!3d2.6070610999999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031efb97c62223f%3A0x2be86268c92a66e5!2sBobocabin%20Kaldera%2C%20Toba!5e0!3m2!1sid!2sid!4v1728537521301!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(5, 25, 1, 'Situmurun Waretfall', 'image/Toba/air_terjun_situmurun.jpg', 'Situmurun Waterfall, also known as Binangalom Waterfall, is a unique natural attraction located on the shores of Lake Toba in North Sumatra, Indonesia. Unlike most waterfalls, Situmurun flows directly into the lake, creating a beautiful and refreshing spectacle. The cascading water tumbles down a steep rock face from a height of around 70 meters, making it a favorite spot for boat tours and swimming in the lake`s cool waters. Surrounded by lush greenery, it offers a serene and picturesque escape for nature lovers visiting the Lake Toba region.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3985.9063545231284!2d99.00798189999999!3d2.5374301!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031e4cdf02698d9%3A0x4e813a548e5424a9!2sAir%20Terjun%20Situmurun!5e0!3m2!1sid!2sid!4v1728537605702!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(6, 25, 1, 'Lake Toba', 'image/toba/danau_toba.jpg', 'Lake Toba is the largest volcanic lake in the world, located in North Sumatra, Indonesia. Formed by a massive supervolcanic eruption around 74,000 years ago, it stretches over 100 kilometers in length and is surrounded by lush hills and traditional Batak villages. At its center lies Samosir Island, a popular destination for exploring Batak culture, traditional music, and historical sites. The lake`s stunning landscapes, clear waters, and cool climate make it a perfect spot for relaxation, sightseeing, and water activities such as boating and swimming. Lake Toba is a natural wonder and a must-visit destination for nature lovers and cultural enthusiasts.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d510166.65829215694!2d98.83596730000001!3d2.61076100000001!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031de07a843b6ad%3A0xc018edffa69c0d05!2sDanau%20Toba!5e0!3m2!1sid!2sid!4v1728658012335!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(7, 33, 1, 'Bayu Lagoon', 'image/TebingTinggi/bayu_lagoon.jpg', 'Bayu Lagoon is a serene natural attraction located in Tebing Tinggi, North Sumatra, Indonesia. It features crystal-clear water surrounded by green hills and lush vegetation, creating a peaceful and refreshing atmosphere. The lagoon offers a perfect spot for swimming, picnicking, and relaxation in a tranquil setting away from the hustle and bustle of city life. Visitors can enjoy the calm waters and scenic views, making it an ideal destination for families and nature lovers looking to unwind and connect with nature.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3983.19199996867!2d99.13070379999999!3d3.3026108999999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30316048fffffff3%3A0xdc21f4b5b827b2ef!2sBayu%20Lagoon!5e0!3m2!1sid!2sid!4v1728659188996!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(8, 33, 2, 'Tebing Tinggi Museum', 'image/TebingTinggi/museum_tebing_tinggi.JPG', 'Tebing Tinggi Museum, located in Tebing Tinggi, North Sumatra, is a cultural and historical museum that preserves the rich heritage of the region. The museum houses various artifacts, including traditional tools, historical documents, and relics from the colonial era, offering visitors insight into the local history and culture. Exhibits focus on the city`s development, including its role in the plantation economy and local governance. It`s an excellent spot for those interested in learning more about the history of Tebing Tinggi and its people.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3983.087129267511!2d99.1624282!3d3.3286498!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303161b72a92b98f%3A0x3471bdee929a2260!2sMuseum%20Kota%20Tebing%20Tinggi!5e0!3m2!1sid!2sid!4v1728659215127!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(9, 33, 2, 'Tebing Tinggi City Park', 'image/TebingTinggi/taman_kota_tebing_tinggi.JPG', 'Tebing Tinggi City Park, is a green space in the heart of Tebing Tinggi, North Sumatra. It serves as a popular recreational area for locals and visitors alike, offering a peaceful environment with walking paths, playgrounds, and seating areas. The park is beautifully landscaped with various plants and trees, providing a refreshing spot for relaxation and outdoor activities. Families often visit the park to enjoy picnics, exercise, or simply unwind in a tranquil setting.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3983.116389226419!2d99.16435989999998!3d3.3214052000000014!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303161b93334f3ab%3A0x9f15f55b40ec47c3!2sTaman%20Kota%20Tebing%20Tinggi!5e0!3m2!1sid!2sid!4v1728659246369!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(10, 24, 1, 'Hutaginjang', 'image/TapanuliUtara/huta_ginjang.jpg', 'Hutaginjang is a scenic highland located in Tapanuli Utara, North Sumatra, Indonesia, known for its breathtaking panoramic views of Lake Toba. Situated at an altitude of around 1,550 meters above sea level, it offers visitors a vantage point to admire the vast expanse of the lake, the surrounding hills, and lush landscapes. The cool, refreshing air and tranquil atmosphere make it a popular spot for photography, paragliding, and nature walks. Hutaginjang is an ideal destination for those seeking both adventure and relaxation while exploring the beauty of the Lake Toba region.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31892.495322464907!2d98.97501749999999!3d2.31504705!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302e1b023a996c47%3A0x9c5750426f12a369!2sHuta%20Ginjang%2C%20Kec.%20Muara%2C%20Kabupaten%20Tapanuli%20Utara%2C%20Sumatera%20Utara!5e0!3m2!1sid!2sid!4v1728653202371!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(11, 24, 2, 'Monument Toga Aritonang', 'image/TapanuliUtara/tugu_toga_aritonang.jpeg', 'Monument Toga Aritonang is a historical monument located in North Tapanuli, North Sumatra, Indonesia. It commemorates the Aritonang clan, one of the prominent Batak tribes in the region, and their ancestral lineage. The monument stands as a symbol of unity and pride for the Aritonang family and the Batak community. Surrounded by scenic landscapes, Tugu Toga Aritonang offers visitors a chance to learn about Batak history and culture while appreciating the beautiful natural surroundings. It is also a site for family gatherings and cultural ceremonies, reflecting the deep-rooted traditions of the Batak people.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3986.4926826012365!2d98.94188419999998!3d2.339530500000008!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302e1bec3c64b765%3A0x26feb237ac3e7d97!2zVHVndSBUb2dhIEFyaXRvbmFuZyB8IOGvluGvruGvjuGvriDhr5bhr6zhr44g4a-A4a-S4a-q4a-W4a-s4a-J4a-w!5e0!3m2!1sid!2sid!4v1728653277335!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(12, 24, 1, 'Sipolohon Crater', 'image/TapanuliUtara/kawah_sipolohon.JPG', 'Sipoholon Crater, located in North Tapanuli, North Sumatra, is a geothermal hot spring area known for its natural beauty and healing properties. The hot springs are surrounded by unique limestone formations, created by years of mineral deposits from the geothermal activity. Visitors come to enjoy the warm waters, which are believed to have therapeutic benefits for skin and relaxation. The area offers a serene atmosphere with scenic views of the surrounding hills, making it a perfect spot for unwinding and soaking in the natural hot springs. Kawah Sipoholon is a hidden gem for nature lovers and those seeking a tranquil escape in North Tapanuli.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3987.203154717033!2d98.94128991744387!3d2.0746001000000045!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302e132b7662a095%3A0xd244086262798ba1!2sWisata%20Pemandian%20Air%20Panas%20Sipoholon!5e0!3m2!1sid!2sid!4v1728653357174!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(13, 23, 1, 'Sungai Sibuluan', 'image/TapanuliTengah/sungai_sibuluan.JPG', 'The Sibuluan River is a river located in Central Tapanuli, North Sumatra. It flows through a lush tropical landscape, offering visitors serene and beautiful scenery. The river is a popular spot for locals to relax, fish, or take a dip in its clear waters. The surrounding area is rich in natural beauty, with dense vegetation and diverse wildlife, making it a peaceful retreat for nature lovers.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1020661.7440070198!2d97.62972216562503!3d2.1689383000000104!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302fc11b18fdb8ff%3A0x61dc3f5a0a59823b!2sSungai%20Sibuluan!5e0!3m2!1sen!2sid!4v1728659835170!5m2!1sen!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(14, 23, 1, 'Binasi Beach', 'image/TapanuliTengah/pantai_binasi.PNG', 'Binasi Beach is a beautiful beach located in Central Tapanuli, North Sumatra, known for its golden sands and calm sea waters. This quiet coastal area offers a peaceful retreat for visitors looking to relax and enjoy the natural beauty of the region. The beach is surrounded by coconut trees, providing plenty of shade for picnics or sunbathing. It is an ideal spot for swimming, sunbathing, and watching the sunset over the Indian Ocean.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31900.983025462923!2d98.5490333!3d1.9008243500000004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302e539320a3811b%3A0xd91d6798dc459020!2sPantai%20Binasi!5e0!3m2!1sen!2sid!4v1728659905467!5m2!1sen!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(15, 23, 2, 'Titik Nol Islam Nusantara', 'image/TapanuliTengah/titik_nol_islam_nusantara.JPG', 'Titik Nol Islam Nusantara is a historical site marking the starting point of the spread of Islam in the Nusantara (Indonesian Archipelago). Located in Central Tapanuli, this site symbolizes the long journey of Islam\'s introduction to Indonesia, particularly in the Sumatra region. With its beautiful scenery and serene surroundings, the location is often visited for historical tourism and spiritual reflection.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3987.367486436047!2d98.4030095!3d2.0083539!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302fb3d39a3b1e4f%3A0x53dfac0dfb2085e4!2sTugu%20Titik%20Nol%20Islam%20Nusantara!5e0!3m2!1sen!2sid!4v1728656001234!5m2!1sen!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(16, 22, 1, 'Sibualbuali Mountain', 'image/TapanuliSelatan/gunung_sibualbuali.PNG', 'Sibualbuali Mountain is a prominent mountain located in South Tapanuli (Tapsel), North Sumatra, Indonesia. Known for its striking natural beauty, this mountain features lush greenery, diverse flora and fauna, and breathtaking views of the surrounding landscape. It is a popular destination for hiking and trekking enthusiasts, offering trails of varying difficulty levels for adventurers of all experience.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31906.77700044312!2d99.255!3d1.55599995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302c2114e00a7639%3A0x71a26dae70c1ae5f!2sGn.%20Sibualbuali!5e0!3m2!1sid!2sid!4v1728660714826!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(17, 22, 1, 'Siais Lake', 'image/TapanuliSelatan/danau_siais.PNG', 'Siais Lake is a stunning lake located in South Tapanuli (Tapsel), North Sumatra, Indonesia. Nestled among lush hills and surrounded by vibrant greenery, the lake is known for its clear waters and picturesque scenery, making it a popular destination for nature lovers and photographers.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31910.022751179386!2d98.9986111!3d1.3241667!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302eb03ba3970b67%3A0xa744b5ad7714334b!2sDanau%20Siais!5e0!3m2!1sid!2sid!4v1728660740405!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(18, 22, 1, 'Aek Sijorni', 'image/TapanuliSelatan/aek_sijorni.PNG', 'Aek Sijorni is a beautiful waterfall located in South Tapanuli (Tapsel), North Sumatra, Indonesia. Known for its stunning natural beauty, Aek Sijorni features cascading waters that flow over rocky cliffs, creating a picturesque scene surrounded by lush greenery. The refreshing atmosphere and the sound of rushing water make it an ideal spot for relaxation and enjoying nature.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3989.0057969583772!2d99.4226297!3d1.1563421999999999!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302bf94000000001%3A0x5f35af9bf398199c!2sAek%20Sijorni!5e0!3m2!1sid!2sid!4v1728660763731!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(19, 32, 1, 'Waterfront City', 'image/TanjungBalai/waterfront_city.jpg', 'Waterfront City in Tanjung Balai, North Sumatra, is a planned urban development designed to revitalize the city`s riverfront along the Asahan River. It aims to blend modern infrastructure with natural beauty, offering a mix of recreational areas, shopping centers, and residential spaces. The project focuses on creating a vibrant riverside environment, providing locals and tourists with spaces for leisure, dining, and entertainment. With its strategic location and scenic views, Waterfront City is envisioned to become a key attraction in Tanjung Balai, enhancing the city`s appeal and economy.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1020559.850318877!2d98.97501750000002!3d2.3150470500000027!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303251955e1c3143%3A0x7372f3e545375699!2sTanjungbalai%20Waterfront%20City!5e0!3m2!1sid!2sid!4v1728537865728!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(20, 32, 2, 'Monument Tanjung Balai', 'image/TanjungBalai/tugu_tanjung_balai.jpeg', 'Monument Tanjung Balai is a monument located in the city of Tanjung Balai, North Sumatra, serving as a symbol of the city rich cultural heritage and history. The monument stands at a central point in the city and is often seen as a landmark representing the unity and resilience of the local community. It is a popular gathering place for residents and a notable site for visitors exploring Tanjung Balai. The Tugu reflects the pride and identity of the city, celebrating its historical significance and local traditions.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.486228576265!2d99.80107470000002!3d2.9624992999999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303251455e2893bd%3A0x20b1aba1846133d!2sJl.%20Tugu%2C%20Tj.%20Balai%20Kota%20II%2C%20Tanjungbalai%20Selatan%2C%20Kota%20Tanjung%20Balai%2C%20Sumatera%20Utara!5e0!3m2!1sid!2sid!4v1728538037525!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(21, 32, 1, 'Waterboom Taman Pesona Asri', 'image/TanjungBalai/waterboom_taman_pesona_asri.PNG', 'Waterboom Taman Pesona Asri, located in Tanjung Balai, North Sumatra, is a popular water park known for its family-friendly atmosphere and various water attractions. The park features a range of exciting water slides, pools, and play areas suitable for visitors of all ages, making it a great destination for families, friends, and those looking to have fun under the sun. The lush landscaping and well-maintained facilities create a pleasant environment for relaxation and enjoyment. In addition to the water attractions, Waterboom Taman Pesona Asri often hosts events and activities, ensuring that there`s always something happening for visitors.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.590858840717!2d99.77847109999999!3d2.9332827000000004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303250fd4857bcf3%3A0x94ec6c43407e3c65!2sWaterboom%20Taman%20Pesona%20Asri!5e0!3m2!1sid!2sid!4v1728661193245!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(22, 21, 1, 'Tea Gardens Bahbutong Sidamanik', 'image/Simalungun/kebun_teh_bahbutong_damanik.JPG', 'Tea Gardens Bahbutong Sidamanik is a vast and picturesque tea estate located in Simalungun Regency, North Sumatra, Indonesia. Known for its stunning green landscapes, the plantation spans over rolling hills at an altitude that provides cool, fresh air. Visitors can enjoy walking or driving through the neatly arranged tea fields, which offer a peaceful escape from the bustling city. Sidamanik is one of the largest tea producers in North Sumatra and is also a popular tourist destination for those who want to learn about tea production while enjoying the serene environment. The plantation`s beauty, combined with the scenic surrounding countryside, makes it a favorite spot for nature lovers and photographers.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63759.04874853525!2d98.87955800000005!3d2.8334538500000113!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303196dc845e63b5%3A0x9659f073bbab88f!2sKebun%20Teh%20Bahbutong%2C%20Sidamanik!5e0!3m2!1sid!2sid!4v1728653619775!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(23, 21, 1, 'beautiful Hill Simarjarunjung', 'image/Simalungun/bukit_indah_simarjarunjung.JPG', 'beautiful Hill Simarjarunjung, located in Simalungun, North Sumatra, is a popular highland destination offering breathtaking views of Lake Toba and the surrounding landscapes. Known for its cool climate and serene atmosphere, Bukit Indah Simarjarunjung is the perfect spot for those seeking relaxation and natural beauty. The hilltop area is famous for its panoramic viewpoints, where visitors can enjoy stunning vistas of the lake, lush hills, and distant mountains.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3985.009666346015!2d98.7812646!3d2.8133027!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031be7326c429cd%3A0x934e4a3527a57ab5!2sBukit%20Indah%20Simarjarunjung!5e0!3m2!1sid!2sid!4v1728667503331!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(24, 21, 1, 'Aek Manik', 'image/Simalungun/aek_manik.JPG', 'Aek Manik is a natural spring located in Simalungun, North Sumatra, known for its crystal-clear waters and serene surroundings. Tucked away in a lush forest, Aek Manik offers visitors a tranquil escape into nature, where they can swim in the cool, refreshing waters of the spring. The water is naturally sourced and remains clean and clear, providing a perfect spot for a refreshing dip.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.831221040842!2d98.9208046!3d2.8650375999999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031972b9e8f00a1%3A0x54d664c2f512aec0!2sPemandian%20alam%20Bah%20Damanik!5e0!3m2!1sid!2sid!4v1728667538117!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(25, 31, 1, 'Pandan Beach', 'image/Sibolga/pantai_pandan.jpg', 'Pandan Beach, located in Tapanuli Tengah, North Sumatra, Indonesia, is a beautiful coastal destination known for its stunning views and tranquil atmosphere. The beach features soft white sands, clear blue waters, and lush greenery that line the shoreline, making it a perfect spot for relaxation and recreation. Visitors can enjoy swimming, sunbathing, or simply taking leisurely strolls along the beach. The area is also famous for its beautiful sunsets, which attract both locals and tourists. With its serene environment and picturesque scenery, Pandan Beach is an ideal getaway for those looking to experience the natural beauty of North Sumatra`s coastline.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31904.881966102912!2d98.80810253955082!3d1.6766019999999962!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302ef3a2b77def9f%3A0xbee58d8c4bd5d321!2sPantai%20Pandan!5e0!3m2!1sid!2sid!4v1728653681639!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(26, 31, 1, 'Putri Island', 'image/Sibolga/pulau_putri.JPG', 'Putri Island, located off the coast of Sibolga, North Sumatra, is a small, picturesque island known for its clear waters, white sandy beaches, and vibrant marine life. A popular destination for snorkeling, diving, and beach activities, Pulau Putri offers a serene and tropical escape for visitors looking to enjoy the beauty of Indonesia`s coastline.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4083887.4925403805!2d96.35738916250001!3d1.6463229000000166!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302ee4c66c903343%3A0xdcbdbcb1d180851e!2sPantai%20Pulau%20Putri!5e0!3m2!1sid!2sid!4v1728667763535!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(27, 31, 1, 'Poncan Island', 'image/Sibolga/pulau_poncan.JPG', 'Poncan Island, located near Sibolga, North Sumatra, is a peaceful island known for its beautiful beaches, clear waters, and historical significance. The island, which is part of the Poncan Islands (Poncan Gadang and Poncan Ketek), offers activities like snorkeling, swimming, and sunbathing, with vibrant coral reefs ideal for underwater exploration. Visitors can also explore remnants of World War II bunkers, adding historical interest to the island`s natural beauty. Pulau Poncan provides a tranquil escape for both relaxation and adventure, making it a hidden gem for those visiting Sibolga.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31904.309087594535!2d98.76472220000001!3d1.711388900000019!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302ef3c17d95680b%3A0x7b997651d744fef6!2sPulau%20Poncan!5e0!3m2!1sid!2sid!4v1728667791246!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(28, 20, 1, 'Romantis Beach', 'image/SerdangBedagai/pantai_romantis.jpg', 'Romantic Beach in Serdang Bedagai, North Sumatra, is a charming coastal destination known for its tranquil atmosphere and beautiful landscapes. The beach features soft golden sands, clear blue waters, and scenic views, making it an ideal spot for couples and families seeking a peaceful retreat. With its serene environment, visitors can enjoy activities like swimming, sunbathing, and beachcombing, as well as romantic walks along the shore during sunset. The beach is also surrounded by lush greenery, adding to its natural beauty. Romantic Beach is a perfect getaway for those looking to relax and unwind while enjoying the picturesque coastal scenery of North Sumatra.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3982.007933678523!2d99.09950200000002!3d3.5856525999999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031512d736bbf25%3A0xa8c63fecec492c65!2sPantai%20Romantis!5e0!3m2!1sid!2sid!4v1728653724914!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(29, 20, 1, ' Mangrove Beach', 'image/SerdangBedagai/pantai_mangrove.jpg', 'Mangrove Beach in Serdang Bedagai, North Sumatra, is a unique coastal destination that showcases the beauty of mangrove ecosystems. The beach is characterized by its lush mangrove forests, which serve as natural habitats for various marine life and bird species. Visitors can explore the mangrove trails, enjoy the serene environment, and appreciate the rich biodiversity that thrives in this area. The beach features calm waters, making it suitable for activities such as kayaking and fishing. With its tranquil atmosphere and natural beauty, Mangrove Beach is an ideal spot for nature lovers and those seeking a peaceful escape in North Sumatra.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31855.858714349604!2d99.09118179999999!3d3.591524749999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303151374ce4e661%3A0x64abe74c87b35870!2sPantai%20Mangrove!5e0!3m2!1sid!2sid!4v1728653758651!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(30, 20, 1, 'Bali Lestari Beach', 'image/SerdangBedagai/pantai_bali_lestari.JPG', 'Bali Lestari Beach, located in Serdang Bedagai, North Sumatra, is a charming beach that offers a tropical getaway with a Bali-inspired atmosphere. The beach features soft sandy shores, clear waters, and scenic surroundings, perfect for relaxing and enjoying the sea breeze. Known for its beautiful sunset views and peaceful environment, Pantai Bali Lestari is popular with families, couples, and groups of friends looking to unwind. The beach also offers traditional huts, swings, and various photo spots that mimic the style of Bali, making it a favorite destination for both locals and tourists seeking a serene escape close to nature.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31853.61776993994!2d98.9791979!3d3.6551767999999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30314da62b167ab9%3A0xf7c10175ddbe825a!2sPantai%20Bali%20Lestari!5e0!3m2!1sid!2sid!4v1728668006241!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(31, 19, 2, 'Pangururan', 'image/Samosir/pangguruan.jpg', 'Pangururan is the main town on Samosir Island, located in the middle of Lake Toba, North Sumatra, Indonesia. Known for its scenic beauty and cool climate, Pangururan serves as a gateway to explore the cultural and natural wonders of Samosir. The town is famous for its natural hot springs, located at the foot of Mount Pusuk Buhit, a sacred site for the Batak people. Visitors can soak in these hot springs while enjoying panoramic views of the surrounding hills and Lake Toba. Pangururan is also a great starting point to experience the rich Batak culture, with traditional villages, stone tombs, and museums nearby. Its combination of history, culture, and natural beauty makes Pangururan a must-visit for travelers looking to immerse themselves in the heart of the Toba region.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d127540.63650914688!2d98.71228399999998!3d2.6208699500000088!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031c4fbab38115b%3A0xf7401c9e14ffebe4!2sKec.%20Pangururan%2C%20Kabupaten%20Samosir%2C%20Sumatera%20Utara!5e0!3m2!1sid!2sid!4v1728653824823!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(32, 19, 1, 'Sidihoni Hill', 'image/Samosir/bukit_sidihoni.jpg', 'Sidihoni Hill, located on Samosir Island in Lake Toba, North Sumatra, is a popular tourist destination known for its stunning panoramic views of the lake and the surrounding landscape. Rising at an altitude of approximately 1,500 meters above sea level, Bukit Sidihoni offers a refreshing escape into nature, featuring lush greenery and cool mountain air. Visitors often hike to the summit to witness breathtaking sunrises and sunsets, which paint the sky in vibrant colors over the tranquil waters of Lake Toba. The area is also rich in cultural heritage, with traditional Batak villages nearby, allowing tourists to experience local customs and traditions. Bukit Sidihoni is ideal for nature lovers, photographers, and anyone seeking a peaceful retreat in the heart of Samosir Island.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3985.69512348987!2d98.74909360000001!3d2.605046700000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031c30058d796cf%3A0x93790f677aaddf69!2sBukit%20Sidihoni!5e0!3m2!1sid!2sid!4v1728653859958!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(33, 19, 1, 'Holbung Hill', 'image/Samosir/Bukit_Holbung.jpg', 'Holbung Hill, located on Samosir Island in North Sumatra, Indonesia, is a breathtaking hill renowned for its stunning views of Lake Toba and the surrounding landscape. Rising to about 1,000 meters, it offers a rewarding hiking experience with well-marked trails that lead through lush greenery and vibrant flora. At the summit, visitors are treated to panoramic vistas of the expansive lake, dotted with small islands, and the majestic mountains beyond. This picturesque destination is especially popular for capturing sunrises and sunsets, where the natural beauty is accentuated by the colorful sky. Bukit Holbung is perfect for nature lovers and hikers seeking both adventure and tranquility on Samosir Island.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15943.717152615673!2d98.6971858!3d2.5299802!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031da4bba9d523f%3A0xf1e39423315c1cfc!2sBukit%20Holbung%20Samosir!5e0!3m2!1sid!2sid!4v1728751405946!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(34, 19, 1, 'Pasir Putih Beach', 'image/Samosir/pantai_pasir_putih.jpg', 'Pasir Putih Beach, located on Samosir Island in Lake Toba, North Sumatra, is a stunning coastal destination known for its pristine white sand and clear blue waters. This beautiful beach offers a serene atmosphere, making it an ideal spot for relaxation and leisure. Visitors can enjoy sunbathing, swimming, and beachcombing, or simply take in the breathtaking views of Lake Toba surrounded by lush hills. The calm waters are perfect for water activities like kayaking and snorkeling, allowing guests to explore the rich marine life. Pasir Putih Beach is a popular choice for families and travelers seeking a peaceful getaway amidst the natural beauty of Samosir Island, providing a perfect blend of tranquility and adventure.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31883.241561484676!2d98.6897135!3d2.69509595!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031c645a45d4f41%3A0x49aff691571c6464!2sPantai%20Pasir%20Putih%20Parbaba!5e0!3m2!1sid!2sid!4v1728653925085!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(35, 19, 1, 'Tano Ponggol Bridge', 'image/Samosir/jembatan_tano_ponggol.jpg', 'Tano Ponggol bridge is a striking bridge located in Samosir, North Sumatra, Indonesia, connecting Samosir Island to the mainland. This iconic structure is known for its unique design and scenic views of Lake Toba and the surrounding landscape. The bridge serves as an essential transportation link for both locals and tourists, facilitating access to various attractions on Samosir Island. Visitors often stop at the bridge to enjoy the picturesque surroundings and capture stunning photographs, especially during sunrise and sunset. Jembatan Tano Ponggol is not only a vital infrastructure piece but also a symbol of the connectivity and beauty of the Lake Toba region.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3985.675933350951!2d98.69194!3d2.611102900000003!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031c50e65c48cff%3A0xd68729d83338cb71!2sJembatan%20Aek%20Tano%20Ponggol%20Samosir!5e0!3m2!1sid!2sid!4v1728653960492!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(36, 19, 1, 'Efrata Waterfall', 'image/Samosir/air_terjun_efrata.jpg', 'Efrata Waterfall is a spectacular waterfall located on Samosir Island in North Sumatra, Indonesia. Nestled within a lush forest, this natural wonder is known for its serene beauty and refreshing atmosphere. The waterfall cascades down from a height of around 30 meters, creating a mesmerizing scene that draws visitors seeking to connect with nature. Surrounded by greenery, Air Terjun Efrata offers a peaceful escape from the hustle and bustle of everyday life. Visitors can enjoy a relaxing dip in the cool waters or explore the nearby trails that lead through the forest. The area is also rich in Batak culture, with traditional villages and historical sites within close proximity.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3985.675933350951!2d98.69194!3d2.611102900000003!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031c4fbab38115b%3A0x88b7fa4f13775d41!2sAir%20Terjun%20Efrata!5e0!3m2!1sid!2sid!4v1728653998494!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(37, 6, 1, 'Sarune', 'image/Karo/sarune.jpg', 'In Berastagi, a popular highland tourist destination in Karo Regency, the Sarune is often showcased as part of local cultural events, particularly in traditional Karo music performances. Visitors to Berastagi can experience the Sarune during festivals, cultural exhibitions, or special occasions like weddings and village celebrations. These performances highlight the rich Karo heritage, with the Sarune`s melodic sound accompanied by other traditional instruments, creating a vibrant and authentic musical experience.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1019872.8450597997!2d97.868780165625!3d3.126863300000003!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3030ff6cb436cf27%3A0x93eef93d5c62f8c9!2sCafe%20SARUNE!5e0!3m2!1sid!2sid!4v1728654048303!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(38, 6, 2, 'The Berastagi Fruit Market', 'image/Karo/pasar_buah.jpg', 'The Berastagi Fruit Market is one of the most popular tourist spots in the town of Berastagi, North Sumatra. Located in the cool highlands, this vibrant market offers a wide variety of fresh fruits and local produce, including the region`s famous passion fruit (markisa), oranges, bananas, and other tropical fruits. Visitors can also find vegetables, spices, and traditional Karo snacks. The market is not only a great place to buy fresh goods but also a hub for experiencing local culture, as many vendors wear traditional Karo attire and engage in friendly banter with tourists. The colorful displays of fruits and the lively atmosphere make the Berastagi Fruit Market a must-visit for anyone traveling to this area.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d509902.7408272735!2d98.22808053281251!3d3.1953891999999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303102ece329c187%3A0x7644e57f17b04bd7!2sPasar%20Buah%20Berastagi!5e0!3m2!1sid!2sid!4v1728654087754!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(39, 6, 1, 'Sinabung Mountain', 'image/Karo/gunung_sinabung.jpg', 'Mount Sinabung, located near Berastagi in Karo Regency, North Sumatra, is an active volcano that has become both a natural landmark and a subject of fascination for visitors. Rising to over 2,400 meters, Sinabung offers breathtaking views of the surrounding landscape when it is calm. However, the mountain has had multiple eruptions in recent years, making it a focus of scientific study and caution. Despite its volcanic activity, Mount Sinabung draws adventurous travelers and photographers who seek to witness the power of nature. For safety reasons, climbing the mountain is often restricted, but visitors can still enjoy its dramatic presence from nearby areas like Berastagi, where they can observe the volcano from a safe distance while exploring the region`s other natural and cultural attractions.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31869.717828115823!2d98.39303419999997!3d3.169634549999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3030fb896e2dce3d%3A0x78aa2a0b96c7f525!2sGn.%20Sinabung!5e0!3m2!1sid!2sid!4v1728654118633!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(40, 6, 1, 'Sibayak Mountain', 'image/Karo/Gunung_sibayak.jpg', 'Mount Sibayak, located near Berastagi in North Sumatra, is a dormant volcano known for its accessible hiking trails and stunning views. Standing at about 2,200 meters, it attracts both locals and tourists who enjoy the 2-3 hour trek to the summit, especially to witness the breathtaking sunrise. At the top, hikers are greeted with panoramic views of Berastagi and the nearby active Mount Sinabung. While hiking to the summit, visitors can explore fumaroles, sulfurous vents, and the beautiful surrounding landscape, making it a popular nature destination.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31867.569845634378!2d98.5047304!3d3.23861875!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303102e887075dfb%3A0x3a472ce13b073e11!2sGn.%20Sibayak!5e0!3m2!1sid!2sid!4v1728654159908!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(41, 6, 1, 'Lau Kawar Lake', 'image/Karo/Danau_lau_kawar.jpg', 'Lake Lau Kawar is a stunning natural attraction located near Berastagi in North Sumatra. This serene lake, formed by volcanic activity, sits at the foot of Mount Sinabung and is surrounded by lush forests and picturesque mountains, making it a perfect spot for nature lovers. The lake`s clear blue waters are ideal for swimming, fishing, and kayaking, offering visitors a peaceful escape from the hustle and bustle of everyday life. The area around Lake Lau Kawar is also popular for trekking and hiking, with trails that provide stunning views of the lake and the surrounding landscape. Additionally, the cool climate and tranquil atmosphere make it a great location for picnics and relaxation amidst nature.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3983.6022311625607!2d98.38038870000001!3d3.198719!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3030fb6dca43192f%3A0x98bd722235dee50b!2sDanau%20Lau%20Kawar!5e0!3m2!1sid!2sid!4v1728654217781!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(42, 6, 1, 'Kubu Hill', 'image/Karo/Bukit_kubu.jpg', ' Kubu Hill, located in Berastagi, North Sumatra, is a popular recreational area known for its vast green meadows, cool climate, and picturesque views of Mount Sibayak and Mount Sinabung. This family-friendly destination offers wide open spaces perfect for picnics, kite flying, and outdoor activities such as horseback riding and ATV rentals. The serene atmosphere, combined with fresh mountain air, makes Bukit Kubu an ideal spot for relaxation and enjoying nature. Visitors also enjoy taking leisurely walks around the park, surrounded by lush greenery and scenic landscapes, making it a refreshing escape from city life.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3983.6063705827396!2d98.5098304174438!3d3.1976535000000132!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303103986105e213%3A0x898bdde06d903257!2sBukit%20Kubu%20Berastagi!5e0!3m2!1sid!2sid!4v1728654257475!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(43, 30, 1, 'Sidamanik Tea Garden', 'image/Pematangsiantar/kebun_teh_sidamanik.jpg', 'Sidamanik Tea Garden, located near Pematang Siantar in North Sumatra, is a scenic tea plantation renowned for its lush green landscapes and cool climate. This sprawling estate offers visitors a chance to explore the beautiful rows of tea plants, enjoy the refreshing air, and learn about the tea production process. The picturesque surroundings make it an ideal spot for photography, picnics, and leisurely walks, allowing visitors to immerse themselves in the tranquility of nature.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63759.04874853525!2d98.879558!3d2.8334538499999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031977df352f595%3A0x24df9157c14bb186!2sKebun%20Teh%20Sidamanik!5e0!3m2!1sid!2sid!4v1728654305141!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(44, 18, 1, 'Lae Mbilulu', 'image/PakpakBharat/lae_mbilulu.jpg', 'Lee Mbilulu, located in Papak Barat, North Sumatra, is a captivating natural attraction known for its stunning landscapes and unique geological features. This area is characterized by lush greenery, rolling hills, and beautiful rock formations, making it an ideal spot for nature lovers and adventure seekers. Visitors to Lee Mbilulu can enjoy various outdoor activities such as hiking, photography, and exploring the rich biodiversity of the region. The tranquil atmosphere and picturesque scenery create a perfect setting for relaxation and unwinding in nature. With its breathtaking views and inviting ambiance, Lee Mbilulu is a hidden gem in Papak Barat, offering a wonderful escape into the beauty of North Sumatra`s natural environment.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3985.6766543954213!2d98.3491183!3d2.6108756000000004!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3030304a77dbc75d%3A0x1f0f29637f06b141!2sAir%20Terjun%20Lae%20Mbilulu!5e0!3m2!1sid!2sid!4v1728654352416!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(45, 29, 1, 'Silimalima Waterfall', 'image/Padangsidimpuan/air_terjun_silimalima.jpg', 'Silimalima Waterfall, located in Padang Sidempuan, North Sumatra, is a stunning waterfall celebrated for its breathtaking beauty and serene surroundings. Surrounded by lush tropical forests, this majestic waterfall features cascading waters that plunge into clear pools below, creating a picturesque and tranquil atmosphere. The area around Air Terjun Silimalima is ideal for outdoor activities such as hiking, swimming, and picnicking, allowing visitors to immerse themselves in the natural beauty of the region.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.3892280640684!2d99.1701779!3d1.533572!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302e9fcc8df38c47%3A0x3953f0fd9fd4a2b2!2sAir%20Terjun%20Silima-lima!5e0!3m2!1sid!2sid!4v1728654389918!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>');
INSERT INTO `tourismplaces` (`tourism_id`, `city_id`, `category_id`, `tourism_name`, `image_url`, `description`, `map_url`) VALUES
(46, 17, 1, 'Tao Lake', 'image/PadangLawasUtara/danau_tao.jpeg', 'Tao Lake, located in Padang Lawas Utara Regency, North Sumatra, is a stunning natural lake known for its tranquil beauty and serene environment. Surrounded by lush greenery and rolling hills, this picturesque lake offers visitors a peaceful retreat, making it ideal for relaxation and reflection. The clear waters of Danau Tao provide a perfect setting for fishing, kayaking, and enjoying the scenic views of the surrounding landscapes. The area is also rich in biodiversity, making it a great spot for birdwatching and exploring the local flora and fauna. With its breathtaking scenery and inviting atmosphere, Danau Tao is a must-visit destination for those seeking to experience the natural wonders of Padang Lawas Utara.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.8009037383026!2d99.4457504!3d1.2939566!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302c0ec3ffffffff%3A0x7244db74f5e4dd87!2sDanau%20Tao!5e0!3m2!1sid!2sid!4v1728654511377!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(47, 16, 1, 'Siranap Waterfall', 'image/PadangLawas/air_terjun_siranap.jpg', 'Siranap Waterfall, located in Padang Lawas Regency, North Sumatra, is a beautiful waterfall renowned for its stunning natural surroundings and refreshing ambiance. Nestled amidst lush greenery, this waterfall features cascading waters that create a picturesque sight and a soothing sound as the water flows over the rocks. The area around Air Terjun Siranap is perfect for outdoor activities, such as hiking and exploring the surrounding forest, where visitors can immerse themselves in the rich biodiversity of the region. The cool, clear waters invite visitors to take a refreshing dip, making it an ideal spot for relaxation and family outings. With its tranquil atmosphere and breathtaking scenery, Air Terjun Siranap is a hidden gem for nature lovers and adventure seekers exploring the natural beauty of Padang Lawas.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15951.014136604766!2d99.60512099999997!3d1.8433904999999968!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302db4f66b2367f7%3A0x3f9f18ac96b748a0!2sSiranap%2C%20Kec.%20Dolok%2C%20Kabupaten%20Padang%20Lawas%20Utara%2C%20Sumatera%20Utara!5e0!3m2!1sid!2sid!4v1728654581547!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(48, 15, 1, 'Tureloto Island', 'image/NiasUtara/pantai_tureloto.jpg', 'Tureloto Island, located in Nias Utara Regency, North Sumatra, is a stunning small island known for its natural beauty and vibrant marine life. Surrounded by crystal-clear waters and rich coral reefs, Tureloto is a popular destination for snorkeling, diving, and other water sports, attracting both adventure seekers and nature enthusiasts.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31908.61371776198!2d97.12530303955077!3d1.4294342000000098!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3025cc7918f927ad%3A0x27a99002904068b5!2sPantai%20Indah%20Tureloto!5e0!3m2!1sid!2sid!4v1728654665511!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(49, 14, 1, 'Sorake Beach', 'image/NiasSelatan/sorake_beach.png', 'Sorake Beach, located in Nias Selatan Regency, North Sumatra, is renowned for its stunning natural beauty and excellent surfing conditions. This picturesque beach features golden sands, clear blue waters, and lush greenery, making it a perfect destination for beach lovers and adventure seekers. Sorake Beach is particularly famous among surfers, as it offers consistent waves ideal for both beginners and experienced surfers. The beach`s vibrant atmosphere is enhanced by local vendors selling fresh seafood and refreshments, adding to the overall experience. Visitors can also enjoy sunbathing, swimming, and exploring the nearby natural attractions. With its breathtaking views and exhilarating activities, Sorake Beach is a must-visit destination for anyone looking to experience the charm of Nias Selatan.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31916.976471298953!2d97.71235913955074!3d0.5683035000000248!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3027d4efe4354aef%3A0x96e378b5458b3f7f!2sSorake%20Beach%20Sign%20Name!5e0!3m2!1sid!2sid!4v1728654715054!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(50, 13, 1, 'Asu Island', 'image/NiasBarat/pulau_asu.jpg', 'Asu Island, located off the western coast of Nias Island, North Sumatra, is a beautiful and relatively untouched paradise known for its stunning natural landscapes and pristine beaches. This idyllic island is famous for its crystal-clear waters, white sandy beaches, and vibrant coral reefs, making it a popular destination for snorkeling, diving, and surfing enthusiasts. The island`s tranquil atmosphere and unspoiled environment provide the perfect setting for relaxation and exploration. Visitors can enjoy various activities such as swimming, sunbathing, and hiking through lush tropical forests. Pulau Asu is also home to friendly local communities that offer insights into the island`s culture and traditions. With its breathtaking scenery and serene ambiance, Pulau Asu is a hidden gem for those seeking adventure and natural beauty in Nias Barat.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31914.557642392025!2d97.2755556!3d0.9058333!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302668052f21a37b%3A0xa941ed396488b4a1!2sPulau%20Asu!5e0!3m2!1sid!2sid!4v1728654834231!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(51, 12, 2, 'Lompat Batu', 'image/Nias/lompat_batu.jpeg', 'Lompat Batu, or the Stone Jumping tradition, is a unique cultural practice in Nias, Indonesia, particularly celebrated in the Nias Island community. This traditional event involves young men performing an impressive leap over large stones as a rite of passage, showcasing their strength, agility, and courage. The stones, often referred to as \"Ombu,\" are placed at varying heights, and the jumpers aim to clear them without assistance. This ritual is deeply rooted in the local culture and symbolizes the bravery and skills of the youth in the Nias community. In addition to its cultural significance, Lompat Batu attracts tourists and spectators, providing a fascinating insight into Nias traditions and customs, and promoting the island`s rich heritage.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63833.422973260436!2d97.73519337910159!3d0.6143915000000111!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30262abd8cadf72b%3A0xf9781496cbc9710!2sDesa%20Bawomataluo%20(Lompat%20Batu)!5e0!3m2!1sid!2sid!4v1728654905481!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(52, 11, 1, 'Beach Barat Muara Upu', 'image/MandailingNatal/PantaiBaratMuaraApu.jpg', 'Beach Barat Muara Upu, located in Mandailing Natal Regency, North Sumatra, is a stunning beach known for its pristine coastline and serene atmosphere. This beautiful beach features soft white sand and clear blue waters, making it an ideal destination for relaxation and beach activities. Visitors can enjoy sunbathing, swimming, and beachcombing while taking in the breathtaking views of the surrounding landscapes. The calm and tranquil environment makes it a perfect spot for families and friends looking to spend quality time together.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d255270.8692009779!2d98.65327301640622!3d1.4116991999999975!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302ec76e798b8b6b%3A0x33d1234a20edb8cf!2sPantai%20Barat%20Marhaen!5e0!3m2!1sid!2sid!4v1728655072457!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(53, 10, 1, 'Pamah Simelir', 'image/Langkat/pamah_simelir.jpg', 'Pamah Simelir, located in Langkat Regency, North Sumatra, is a stunning natural destination known for its captivating landscapes and rich biodiversity. This area is characterized by lush green hills, dense forests, and a serene atmosphere, making it an ideal spot for nature lovers and outdoor enthusiasts. Visitors to Pamah Simelir can engage in various activities such as hiking, bird watching, and exploring the diverse flora and fauna that thrive in this region. The natural beauty of Pamah Simelir offers picturesque views, especially during sunrise and sunset, providing perfect opportunities for photography. Additionally, the area is often less crowded, allowing for a peaceful retreat into nature. With its breathtaking scenery and tranquil environment, Pamah Simelir is a hidden gem in Langkat, inviting visitors to experience the enchanting beauty of North Sumatra.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15932.982141134657!2d98.37327454999999!3d3.2892389500000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3030e4138cf7adc9%3A0xd7e3f7eaec20006!2sPenatapan%20Pamah%20Simelir!5e0!3m2!1sid!2sid!4v1728655153000!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(54, 10, 1, 'Waterpool Abadi Langkat', 'image/Langkat/kolam_abadi_langkat.jpg', 'Waterfool Abadi Langkat, located in Langkat Regency, North Sumatra, is a beautiful natural pool renowned for its crystal-clear waters and tranquil surroundings. Nestled amidst lush greenery, this serene spot offers visitors a perfect escape into nature, making it ideal for relaxation and recreation. The pool is often characterized by its stunning blue waters, which are fed by natural springs, providing a refreshing place for swimming and enjoying the outdoors. Surrounded by scenic landscapes, Kolam Abadi is also a popular destination for picnics and family outings, where visitors can enjoy the peaceful ambiance and breathtaking views. The combination of natural beauty and serene atmosphere makes Kolam Abadi a must-visit location for those looking to experience the charm of Langkat`s natural attractions.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15931.12793364952!2d98.4183022!3d3.4032842999999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3030dff1d5db755d%3A0x7bb0118d4443bd0b!2swisata%2C%20kolam%20abadi%20teroh%20tetoh!5e0!3m2!1sid!2sid!4v1728655822468!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(55, 10, 1, 'Lawang Hill', 'image/Langkat/bukit_lawang.jpg', 'Lawang Hill, located in Langkat Regency, North Sumatra, is a popular ecotourism destination famous for its lush rainforest and rich biodiversity. Nestled on the banks of the Bohorok River, this charming village serves as the gateway to Gunung Leuser National Park, home to the critically endangered Sumatran orangutans. Visitors to Bukit Lawang can embark on guided jungle treks, where they can witness a variety of wildlife, including monkeys, birds, and exotic plants in their natural habitat. The area also offers opportunities for tubing and rafting on the river, adding to the adventure experience. With its stunning natural scenery, vibrant culture, and commitment to conservation, Bukit Lawang is an essential destination for nature lovers and adventure seekers exploring the beauty of North Sumatra.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d63714.15911924419!2d98.13946304999999!3d3.556369!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3030c81b5f04b997%3A0xd57e31753995db8f!2sBukit%20Lawang%2C%20Kec.%20Bohorok%2C%20Kabupaten%20Langkat%2C%20Sumatera%20Utara!5e0!3m2!1sid!2sid!4v1728656648078!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(56, 10, 1, 'Florida Beach', 'image/Langkat/pantai_florida.jpg', 'Florida Beach, located in Langkat Regency, North Sumatra, is a beautiful coastal destination known for its pristine beaches and serene environment. With soft white sand and clear blue waters, this beach offers visitors a perfect spot for relaxation and recreation. The tranquil atmosphere makes it an ideal location for families and friends looking to spend quality time together, whether it`s swimming, sunbathing, or enjoying beachside picnics. The surrounding palm trees and lush greenery enhance the natural beauty of the area, providing a picturesque backdrop for photography. Pantai Florida is also a great place to witness stunning sunrises and sunsets, creating memorable experiences for all who visit. With its charming coastal landscape and inviting ambiance, Pantai Florida is a must-visit destination for those exploring the beauty of Langkat.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3982.508020104039!2d98.4597137!3d3.4689257999999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3030d9579168f167%3A0x8cbc269e36165423!2sPantai%20Florida!5e0!3m2!1sid!2sid!4v1728656690015!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(57, 9, 1, 'Aek Sordang', 'image/LabuhanbatuUtara/aek_sordang.jpg', 'Aek Sordang, located in Labuhanbatu Utara (Labura) Regency, North Sumatra, is a captivating natural spring known for its crystal-clear waters and refreshing ambiance. Surrounded by lush greenery and picturesque landscapes, this spring offers a serene escape for visitors seeking relaxation and enjoyment in nature. The cool, clean waters are perfect for swimming and soaking, making it an ideal spot for family outings and picnics. The tranquil atmosphere, combined with the beautiful surroundings, provides a perfect setting for unwinding and connecting with nature. Aek Sordang is a hidden gem in Labura, attracting nature enthusiasts and those looking to experience the natural beauty of North Sumatra.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1020640.7339440316!2d99.25448589999999!3d2.19985925!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30320d545d280411%3A0xf29bf69f180ffcfb!2sWisata%20Alam%20Aek%20Sordang!5e0!3m2!1sid!2sid!4v1728656723379!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(58, 9, 1, 'Pulo Bisky', 'image/LabuhanbatuUtara/pulo_bisky.JPG', 'Pulo Bisky, located in Labuhanbatu Utara (Labura) Regency, North Sumatra, is a popular destination known for its picturesque natural scenery and vibrant cultural atmosphere. This area features lush landscapes, making it an ideal spot for outdoor activities such as hiking, picnicking, and photography. Pulo Bisky is often frequented by locals and tourists alike who come to enjoy the beauty of nature and the tranquility of the surroundings. The charming ambiance, coupled with nearby attractions and local cuisine, provides visitors with a delightful experience. With its stunning views and inviting atmosphere, Pulo Bisky is a wonderful place for nature lovers and those seeking to explore the natural wonders of Labura.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3986.6109622397457!2d99.66239949999999!3d2.2975442999999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302d8e44993ee47f%3A0xb2323da8c683d7c1!2sPulo%20Bisky%20(Pantai%20Wisky)!5e0!3m2!1sid!2sid!4v1728674096603!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(59, 8, 1, 'Pemandian Pandayangan Indah', 'image/LabuhanbatuSelatan/pemandian_pandayangan_indah.jpg', 'Pemandian Pandayangan Indah, located in Labuhan Batu Selatan Regency, North Sumatra, is a picturesque natural bathing spot renowned for its clear, refreshing waters and beautiful surroundings. Nestled amidst lush greenery, this serene area offers visitors a tranquil escape from the hustle and bustle of everyday life. The clean, natural pools provide the perfect environment for swimming, relaxing, and enjoying the beauty of nature. Additionally, the peaceful ambiance is ideal for family gatherings, picnics, and unwinding in a scenic setting. With its inviting atmosphere and stunning landscapes, Pemandian Pandayangan Indah is a must-visit destination for those exploring the natural attractions of Labuhan Batu Selatan.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3987.67826712176!2d99.95306099999999!3d1.8766909999999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302d0109af2347c9%3A0xc5ee63a5d9a8d833!2sPandayangan%20Indah!5e0!3m2!1sid!2sid!4v1728656759723!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(60, 8, 1, 'Batu Ajo Indah Garden', 'image/LabuhanbatuSelatan/taman_batu_ajo_indah.JPG', 'Batu Ajo Indah Garden, located in Labuhan Batu Selatan Regency, North Sumatra, is a beautiful recreational park known for its stunning landscapes and vibrant atmosphere. The park features lush greenery, well-maintained pathways, and unique rock formations, making it an ideal spot for leisurely strolls, picnics, and family gatherings. Visitors can enjoy various outdoor activities while appreciating the natural beauty of the area. The park`s serene environment is perfect for relaxation, and its picturesque scenery provides great opportunities for photography. Taman Batu Ajo Indah is a delightful destination for those looking to unwind and connect with nature in Labuhan Batu Selatan.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3987.9164149189764!2d100.1352464!3d1.7691831!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302ce3352b81aaed%3A0xf34e15e91012dc77!2sBatu%20Ajo%20indah!5e0!3m2!1sid!2sid!4v1728673816615!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(61, 8, 1, 'Pagaran Padang Lake', 'image/LabuhanbatuSelatan/danau_pagaran_padang.JPG', 'Pagaran Padang Lake, located in Labuhan Batu Regency, North Sumatra, is a serene and picturesque lake known for its stunning natural beauty. Surrounded by lush greenery and hills, this tranquil body of water offers a peaceful retreat for visitors looking to enjoy the outdoors. The lake is ideal for various recreational activities, such as fishing, picnicking, and boating, allowing visitors to immerse themselves in the serene environment. The calm waters reflect the surrounding landscape, creating beautiful scenery, especially during sunrise and sunset. With its tranquil ambiance and scenic views, Danau Pagaran Padang is a must-visit destination for nature lovers and those seeking relaxation in Labuhan Batu.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3987.6637692445884!2d100.12222200000001!3d1.8830376999999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302d1b7efbae2fe7%3A0xc994743265e24354!2sDanau%20Pagaran%20Padang!5e0!3m2!1sid!2sid!4v1728673843907!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(62, 7, 1, 'Linggahara Waterfall', 'image/Labuhanbatu/air_terjun_linggahara.jpg', 'Linggahara Waterfall, located in Labuhan Batu Regency, North Sumatra, is a breathtaking waterfall surrounded by lush tropical forests. Known for its cascading waters and serene environment, the waterfall creates a mesmerizing sight and soothing sounds. The area features hiking trails that lead to scenic viewpoints, offering stunning landscapes. Visitors can also enjoy refreshing dips in the clear waters, making it an ideal spot for relaxation and recreation. With its tranquil ambiance, Air Terjun Linggahara is a hidden gem perfect for nature lovers and adventure seekers.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3987.289832850285!2d99.82232920000001!3d2.039926!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302da1e5eaaaaaab%3A0xa2f134c55554d000!2sAir%20Terjun%20Linggahara-Rantau%20Prapat!5e0!3m2!1sid!2sid!4v1728656826865!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(63, 5, 1, 'Sipinsur Geosite', 'image/HumbangHasundutan/sipinsur_geosite.jpg', 'Sipinsur Geosite, located in Humbang Hasundutan Regency, North Sumatra, is a breathtaking natural attraction renowned for its stunning landscapes and panoramic views. This geosite features a picturesque hill that offers visitors a spectacular vantage point to admire the beauty of Lake Toba and the surrounding mountains. The area is rich in geological significance, showcasing unique rock formations and diverse flora and fauna that highlight the region`s ecological diversity. Visitors can enjoy various activities such as hiking, photography, and picnicking while immersing themselves in the serene environment. Sipinsur Geosite is also an ideal spot for watching the sunrise or sunset, creating a magical experience for nature enthusiasts and adventurers alike. With its captivating scenery and tranquil atmosphere, Sipinsur Geosite is a must-visit destination for those exploring the natural beauty of Humbang Hasundutan.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3986.522139508582!2d98.8813939!3d2.3291448!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302e191e11932b13%3A0x47ffc29f2eb0d3e1!2sGeosite%20Sipinsur!5e0!3m2!1sid!2sid!4v1728656880940!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(64, 5, 1, 'Simamora Island', 'image/HumbangHasundutan/pulau_simamora.JPG', 'Simamora Island, located in Humbang Hasundutan Regency, North Sumatra, is a charming island known for its natural beauty and serene atmosphere. Surrounded by the stunning waters of Lake Toba, Pulau Simamora offers visitors a tranquil escape with its lush landscapes and picturesque views. The island is characterized by its pristine beaches, clear waters, and vibrant greenery, making it an ideal spot for relaxation, swimming, and picnicking. Visitors can explore the island`s natural wonders, enjoy local cuisine at nearby eateries, and engage in various outdoor activities such as kayaking and fishing. The calm and peaceful ambiance of Pulau Simamora provides an excellent opportunity for those seeking to unwind and connect with nature. With its breathtaking scenery and inviting atmosphere, Pulau Simamora is a must-visit destination for anyone exploring the beauty of Humbang Hasundutan.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3986.479128094812!2d98.8233535!3d2.3442939999999997!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302e221a91a00445%3A0x9f8674cff4ed0eb!2sPulau%20Simamora!5e0!3m2!1sid!2sid!4v1728671951490!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(65, 5, 1, 'Janji Waterfall', 'image/HumbangHasundutan/air_jerjun_janji.PNG', 'Janji Waterfall, located in Humbang Hasundutan Regency, North Sumatra, is a stunning waterfall that captivates visitors with its natural beauty and serene environment. Surrounded by lush greenery and mountainous landscapes, this waterfall features crystal-clear waters cascading down rocky cliffs, creating a picturesque setting perfect for photography and relaxation. The sound of the rushing water adds to the tranquil ambiance, making it an ideal spot for those seeking a peaceful retreat in nature. Visitors can enjoy activities such as hiking to the waterfall, swimming in the natural pools, or simply soaking in the beauty of the surroundings. Air Terjun Janji is not only a beautiful natural attraction but also a popular destination for adventure seekers and nature lovers exploring the enchanting landscapes of Humbang Hasundutan.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3986.492991016278!2d98.81577829999999!3d2.339422000000012!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302e221610e7ad55%3A0x35989309af20d587!2sAir%20Terjun%20Janji!5e0!3m2!1sid!2sid!4v1728671978751!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(66, 27, 2, 'Monument Durian', 'image/Gunungsitoli/tugu_durian.jpg', 'Monument Durian, located in Gunung Sitoli, Nias Island, is a unique landmark that celebrates the region`s rich cultural heritage and its famous durian fruit.\n\nThis iconic monument features a distinctive design that showcases the durian, which is often referred to as the \"king of fruits\" in Indonesia, highlighting its significance to the local community.\n\nSurrounded by lush greenery and vibrant local markets, Tugu Durian serves as a popular gathering spot for both locals and tourists.\n\nVisitors often stop by to take photos and enjoy the lively atmosphere while exploring nearby stalls that sell various durian products and other local delicacies.\n\nThe tugu also symbolizes the pride of the people of Gunung Sitoli in their agricultural products, making it a must-visit attraction for anyone looking to experience the cultural richness of Nias Island.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.8071738280555!2d97.61972329999999!3d1.2899630999999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3025fbda9b4857a5%3A0x908dd43e486b2915!2sTugu%20Durian!5e0!3m2!1sid!2sid!4v1728656927594!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(67, 27, 2, 'Yahowu Garden', 'image/Gunungsitoli/taman_yahowu.JPG', 'Yahowu Garden, located in Gunung Sitoli, Nias Island, is a beautifully landscaped park that serves as a recreational area for both locals and visitors.\n\nKnown for its lush greenery and well-maintained gardens, the park provides a tranquil escape from the hustle and bustle of city life.\n\nVisitors can enjoy leisurely strolls along the pathways, relax in the serene atmosphere, and take in the scenic views of the surrounding landscape.\n\nTaman Yahowu is also equipped with various facilities, including playgrounds for children, picnic areas, and spaces for community events, making it an ideal destination for families and gatherings.\n\nThe park`s vibrant flora, combined with its peaceful ambiance, makes Taman Yahowu a perfect spot for relaxation, socializing, and appreciating the natural beauty of Gunung Sitoli.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.806759613143!2d97.61936819999997!3d1.2902272999999966!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3025fbf07851a935%3A0x4a8b2398a75e060f!2sTaman%20Yaahowu!5e0!3m2!1sid!2sid!4v1728656958766!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(68, 27, 2, 'Museum Pustaka', 'image/Gunungsitoli/museum_pustaka.JPG', 'Museum Pustaka Nias, located in Gunung Sitoli, Nias Island, is a cultural institution dedicated to preserving and showcasing the rich heritage of the Nias people.\n\nThe museum features a diverse collection of artifacts, traditional clothing, tools, and historical documents that highlight the unique customs, traditions, and history of Nias.\n\nVisitors can explore various exhibits that delve into the island`s cultural practices, including traditional ceremonies, music, and dance.\n\nThe museum also serves as an educational resource, offering insights into the lives and traditions of the Nias community.\n\nWith its informative displays and welcoming atmosphere, Museum Pustaka Nias is an essential destination for anyone looking to gain a deeper understanding of Nias Island`s vibrant culture and history.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.79349151921!2d97.608058!3d1.2986617!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3025e4caf615ea8b%3A0x26f817428b618831!2sMuseum%20Pusaka%20Nias!5e0!3m2!1sid!2sid!4v1728671442766!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(69, 4, 1, 'Monako Park', 'image/DeliSerdang/monako_park.jpg', 'Monako Park, located in Deli Serdang Regency, North Sumatra, is a popular recreational area known for its beautiful landscapes and vibrant atmosphere. This park features lush greenery, well-maintained gardens, and various facilities for outdoor activities, making it an ideal destination for families and nature lovers. Visitors can enjoy walking or jogging along the scenic pathways, picnicking in designated areas, or simply relaxing while taking in the fresh air. The park also hosts various events and activities throughout the year, including cultural festivals and community gatherings, fostering a sense of togetherness among locals. With its inviting ambiance and natural beauty, Monako Park offers a perfect escape from the hustle and bustle of city life, providing a refreshing experience for everyone who visits.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3982.785769474802!2d98.69145689999999!3d3.4023683000000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30313d12f3b38029%3A0x287b1a00039f0abe!2sMonako%20Park%20Sibiru-biru!5e0!3m2!1sid!2sid!4v1728656991759!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(70, 4, 2, 'Buluh Awar', 'image/DeliSerdang/buluh_awar.jpg', 'Buluh Awar, located in Deli Serdang Regency, North Sumatra, is a serene natural destination famous for its lush bamboo forests and tranquil environment. This area is characterized by towering bamboo groves that create a stunning landscape, making it a perfect spot for nature lovers and photographers. Visitors can explore the scenic trails that wind through the bamboo, enjoy the soothing sounds of rustling leaves, and appreciate the beauty of the surrounding greenery. Buluh Awar is also an ideal place for family outings, picnics, or simply unwinding in nature. The unique charm of this location, combined with its peaceful atmosphere, makes Buluh Awar a hidden gem in Deli Serdang, perfect for those seeking a quiet retreat away from the bustling city life.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15932.483179801868!2d98.59291455!3d3.3203129999999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031194015ae70cd%3A0xb5483c4c64b3ac21!2sBuluh%20Awar%2C%20Kec.%20Sibolangit%2C%20Kabupaten%20Deli%20Serdang%2C%20Sumatera%20Utara!5e0!3m2!1sid!2sid!4v1728670948178!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(71, 4, 1, 'Pelangi Indah Waterfall', 'image/DeliSerdang/air_terjun_pelangi_indah.JPG', 'Pelangi Indah Waterfall, located in Deli Serdang Regency, North Sumatra, is a stunning waterfall that captivates visitors with its natural beauty and refreshing ambiance. Surrounded by lush tropical vegetation, this waterfall features crystal-clear waters cascading down rocky cliffs, creating a picturesque scene that is perfect for photography and relaxation. The vibrant colors of the surrounding flora enhance the enchanting atmosphere, often resulting in beautiful rainbows formed by the sunlight hitting the water spray, hence the name \"Pelangi\" which means \"rainbow\" in Indonesian. Visitors can enjoy activities such as swimming in the natural pools, hiking through the nearby trails, or simply soaking in the serene environment. Air Terjun Pelangi Indah is an ideal destination for nature enthusiasts and adventure seekers looking to experience the tranquil beauty of Deli Serdang`s landscape.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3983.580397880814!2d98.6905094!3d3.2043331!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30310fc659ca0131%3A0x177370e7fd4c3f8f!2sAir%20Terjun%20Pelangi%20Indah!5e0!3m2!1sid!2sid!4v1728670980045!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(72, 3, 2, 'Monument Dairi', 'image/Dairi/tugu_dairi.jpeg', 'Monument Dairi, located in Dairi Regency, North Sumatra, is a prominent landmark that symbolizes the pride of the local community. This monument was built to commemorate the region`s history and culture, serving as a symbol of unity among the people of Dairi. With its unique architectural design, the monument is surrounded by a lush garden, making it an ideal spot for relaxation and photography. Additionally, Tugu Dairi is often used as a venue for cultural events and local celebrations, further strengthening the social and community significance it embodies. Its presence not only attracts tourists but also serves as an important reference point for exploring the rich culture and natural beauty of Dairi Regency.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d255029.8589782901!2d98.33952899999998!3d2.8620695000000027!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031b489df4939c1%3A0x1b51dbcc5b7d70b8!2sTugu%20Makam%20Raja%20Silalahisabungan!5e0!3m2!1sid!2sid!4v1728657162299!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(73, 3, 1, 'Pemandian Lau Timah', 'image/Dairi/pemandian_lau_timah.jpg', 'Pemandian Lau Timah, located in Dairi Regency, North Sumatra, is a natural hot spring known for its therapeutic benefits and stunning natural scenery. Surrounded by lush greenery and mountainous landscapes, this hot spring features warm, mineral-rich waters believed to have healing properties, attracting both locals and tourists seeking relaxation and rejuvenation. Visitors can enjoy bathing in the natural pools while soaking in the serene atmosphere and beautiful views. The area around Lau Timah is also suitable for picnicking, making it a perfect destination for families and friends looking to escape the hustle and bustle of city life. Overall, Pemandian Lau Timah offers a unique blend of natural beauty and wellness, making it a must-visit destination in Dairi.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.0265664749636!2d98.05740240000002!3d3.0875832000000174!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30308b81c244becf%3A0x1f32edd062b4fef5!2sPemandian%20Alam%20Lau%20Timah!5e0!3m2!1sid!2sid!4v1728657195898!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(74, 3, 1, 'Siadtaratas Hill', 'image/Dairi/bukit_siadtaratas.jpg', 'Siadtaratas Hill, situated in Dairi Regency, North Sumatra, is a captivating hill renowned for its breathtaking panoramic views and serene environment. Offering a picturesque landscape, this hill provides visitors with the opportunity to experience the beauty of nature while enjoying activities such as hiking and photography. The trek to the top of Bukit Siadtaratas is both rewarding and invigorating, as it leads to stunning vistas of the surrounding mountains and valleys. The area is also rich in local flora and fauna, making it a perfect spot for nature enthusiasts. Many visitors come to witness the sunrise or sunset from the hilltop, creating unforgettable memories. Bukit Siadtaratas is an ideal destination for those seeking adventure and tranquility in Dairi.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.999207593402!2d98.5237676!3d2.8163611!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3031b48e25b6d00f%3A0x61d9a1b0cb7a2f24!2sBukit%20Siattaratas!5e0!3m2!1sid!2sid!4v1728657227189!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(75, 26, 2, 'Monument Binjai', 'image/Binjai/tugu_binjai.jpg', 'Monument Binjai, located in the city of Binjai, North Sumatra, is an iconic landmark symbolizing the city`s cultural heritage and history. This monument stands as a testament to the local identity and pride of the Binjai community. Surrounded by a bustling area, Tugu Binjai is often a gathering spot for locals and visitors alike, serving as a backdrop for photos and social events. The monument is beautifully designed, and the surrounding gardens provide a pleasant atmosphere for relaxation and leisure. Tugu Binjai is not only a significant historical site but also a vibrant part of the city`s landscape, reflecting the spirit and culture of Binjai.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3981.8994560296164!2d98.4947833!3d3.6104753000000005!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303129e5645f8ce9%3A0x7e8a780e4a7c6a0c!2sTugu%20PerJuangan%2045%20Binjai!5e0!3m2!1sid!2sid!4v1728657262364!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(76, 26, 1, 'Sawah Lukis', 'image/Binjai/sawah_lukis.jpg', 'Sawah Lukis, located in Binjai, North Sumatra, is a unique and picturesque rice field known for its stunning landscapes and vibrant colors. This area is often referred to as a \"living painting\" due to the beautiful patterns created by the rice terraces and the surrounding natural scenery. Visitors to Sawah Lukis can enjoy leisurely walks through the fields, taking in the fresh air and observing local farmers tending to their crops. The site is popular for photography, especially during sunrise and sunset, when the colors of the fields are at their most striking. Sawah Lukis offers a serene escape into nature, showcasing the beauty of traditional rice farming and the rich agricultural heritage of Binjai.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3981.6741704228984!2d98.49169739999999!3d3.66149!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30312b7ebda51a7d%3A0xbc1f5b027e241542!2sSawah%20Lukis!5e0!3m2!1sid!2sid!4v1728657310265!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(77, 26, 1, 'Garden Selfie', 'image/Binjai/taman_selfie.JPG', 'Garden Selfie Binjai is a popular recreational park located in Binjai, North Sumatra, designed specifically for photography enthusiasts and visitors looking to capture beautiful moments. The park features a variety of colorful and artistic installations, unique backdrops, and vibrant gardens, making it an ideal spot for selfies and group photos. With its playful decorations and scenic views, Taman Selfie offers a fun atmosphere for families, friends, and couples to enjoy. In addition to photo opportunities, the park provides spaces for relaxation, picnicking, and community activities, making it a lively destination in Binjai for both locals and tourists.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3981.6762817360723!2d98.49128999999999!3d3.6610151999999996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30312a08d0e0156b%3A0xb7dd264dbb6cb586!2sTaman%20Selfie!5e0!3m2!1sid!2sid!4v1728668948154!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(78, 2, 1, 'Datuk nature tourism ', 'image/Batubara/wisata_alam_datuk.jpg', 'Datuk nature tourism , located in Batubara, North Sumatra, is a captivating natural destination that offers a blend of scenic beauty and outdoor activities. The area is characterized by lush forests, rolling hills, and serene water bodies, making it perfect for hiking, picnicking, and enjoying nature. Visitors can immerse themselves in the tranquil environment while exploring various trails, spotting local wildlife, and experiencing the diverse flora. The site is also popular for its stunning views, especially during sunrise and sunset, making it a great spot for photography. Wisata Alam Datuk is an ideal retreat for those seeking adventure and relaxation amidst the beauty of North Sumatra`s natural landscape.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3983.011681012855!2d99.4804726!3d3.3472581!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3033c1bdcf7e18c1%3A0x5a653acb3004a90d!2sWisata%20Alam%20Datuk!5e0!3m2!1sid!2sid!4v1728657343481!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(79, 2, 1, 'Tador Sea Lake', 'image/Batubara/danau_laut_tador.jpg', 'Tador Sea Lake, located in Batubara, North Sumatra, is a stunning lake renowned for its serene beauty and clear waters. Surrounded by lush greenery and rolling hills, the lake offers a peaceful environment ideal for relaxation and outdoor activities. Visitors can enjoy various activities such as fishing, boating, and picnicking along the shores. The calm atmosphere and picturesque views make it a popular spot for families and nature lovers looking to escape the hustle and bustle of daily life. Danau Laut Tador is also a great location for photography, especially during sunrise and sunset, providing breathtaking vistas that showcase the natural beauty of the region.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31866.66918356731!2d99.22481313955079!3d3.2671113000000207!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3033d982e4c7bd71%3A0x7adac8044b92f552!2sDanau%20Laut%20Tador!5e0!3m2!1sid!2sid!4v1728657401856!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(80, 2, 1, 'Pandang Island', 'image/Batubara/pandang_island.jpeg', 'Pandang Island, located in Batubara, North Sumatra, is a picturesque island known for its stunning natural beauty and tranquil environment. The island features white sandy beaches, crystal-clear waters, and lush greenery, making it a perfect destination for those seeking relaxation and adventure. Visitors can enjoy various activities such as swimming, snorkeling, and sunbathing on the beautiful beaches. The island is also ideal for exploring marine life and enjoying water sports, attracting both locals and tourists. With its serene atmosphere and breathtaking views, Pandang Island offers a peaceful escape into nature, making it a must-visit destination in Batubara.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3982.7059845975696!2d99.7580383!3d3.42161965!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303399a53d96c00b%3A0xcb7b3ac2d275f745!2sPulau%20Pandang!5e0!3m2!1sid!2sid!4v1728657505650!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(81, 1, 1, 'Teratai Lake', 'image/Asahan/danau_teratai.jpg', 'Teratai Lake, located in Asahan, North Sumatra, is a serene lake known for its abundance of blooming lotus flowers that cover its surface. The lake offers a peaceful and picturesque setting, with its vibrant lotus blooms creating a unique and calming atmosphere. Visitors often come to admire the natural beauty, take photos, and enjoy the tranquility of the surroundings. The calm waters and lush greenery around the lake make it a perfect spot for relaxation and nature walks. Danau Teratai is an ideal destination for those seeking a quiet escape into nature and a scenic spot to unwind.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31878.47272193506!2d99.5686111!3d2.87138885!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303247bde84d9d33%3A0x2fd435cd692c56af!2sDanau%20Teratai!5e0!3m2!1sid!2sid!4v1728657539719!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(82, 1, 1, 'Simonang Waterfall', 'image/Asahan/air_terjun_simonang.jpg', 'Simonang Waterfall, located in Asahan, North Sumatra, is a hidden gem offering a peaceful and scenic retreat in nature. The waterfall features a gentle cascade surrounded by lush greenery, creating a calming atmosphere perfect for relaxation. Although it is not as tall as some other waterfalls in the region, Air Terjun Simonang`s beauty lies in its tranquil setting and serene environment. Visitors often come to enjoy the natural surroundings, take a dip in the cool water, or have a quiet picnic by the falls. It`s a great spot for those looking to escape the hustle and bustle of daily life and connect with nature.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3985.597063051866!2d99.4709115!3d2.6358475!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3032130cd80ff0c3%3A0xd8b04896b3cc3b89!2sAir%20Terjun%20Simonang%20Monang!5e0!3m2!1sid!2sid!4v1728657572004!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(83, 1, 1, 'Ponot Waterfall', 'image/Asahan/air_terjun_ponot.jpg', 'Ponot Waterfall, located in Asahan, North Sumatra, is one of the tallest waterfalls in Indonesia, with a height of around 250 meters. Nestled in a lush, green forested area, the waterfall boasts powerful cascades that create a mesmerizing natural spectacle. Its impressive height and the surrounding scenic beauty make it a popular destination for nature lovers and adventurers.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3985.852109140998!2d99.30473060000001!3d2.5549651!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303204f20d821595%3A0xaf3c5548a5f01918!2sAir%20Terjun%20Ponot!5e0!3m2!1sid!2sid!4v1728657744452!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(84, 4, 3, 'Lesehan Kraton Garden', 'image/DeliSerdang/Lesehan_Taman_Kraton.jpeg', 'Lesehan Kraton Garden, located in Deli Serdang, Indonesia, is a popular culinary destination known for its relaxed and casual dining experience. The restaurant offers a traditional \"lesehan\" seating style, where guests sit on mats at low tables, creating a warm and welcoming atmosphere perfect for enjoying local Indonesian dishes. Surrounded by lush greenery and a serene garden setting, it provides an ideal place for families and friends to gather while savoring the rich flavors of authentic Indonesian cuisine, making it a must-visit spot for both locals and tourists.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d22995.24555714363!2d98.58017959191754!3d3.599000043659927!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30312ec7df9a62e3%3A0xde723ec470f59c0d!2sRestoran%20Taman%20Keraton!5e0!3m2!1sid!2sid!4v1729348234723!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(85, 28, 3, 'Tengah Cafe', 'image/Medan/Tengah_Cafe.jpg', 'Tengah Cafe, situated in the heart of Medan City, is a trendy and vibrant spot for those looking to enjoy a mix of modern and traditional Indonesian cuisine. With its cozy, contemporary design and warm ambiance, it provides a perfect setting for social gatherings or casual meet-ups. The cafe is popular among locals and visitors alike for its diverse menu, offering everything from signature coffee blends to delicious comfort food. Tengah Cafe\'s central location and inviting atmosphere make it a must-visit destination for food enthusiasts exploring Medan.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d254848.01320688!2d98.51745297812501!3d3.5874265000000083!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303131960ba86b21%3A0x4e56f8e53a03b0e7!2sTengah%20People%20%26%20Place%20-%20Medan!5e0!3m2!1sid!2sid!4v1729348627939!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>');
INSERT INTO `tourismplaces` (`tourism_id`, `city_id`, `category_id`, `tourism_name`, `image_url`, `description`, `map_url`) VALUES
(86, 28, 3, 'Ucok Durian', 'image/Medan/Ucok_Durian.jpg', 'Ucok Durian, located in Medan City, is an iconic destination for durian lovers and has become a must-visit spot for both locals and tourists. Famous for serving fresh, high-quality durians, Ucok Durian offers an authentic taste of Medan’s renowned fruit, attracting visitors from across the region. The atmosphere is lively and bustling, with rows of durians ready to be enjoyed on-site or packed for takeaway. Known for its friendly service and consistency in delivering top-notch durians, Ucok Durian has earned a reputation as the go-to place for durian enthusiasts visiting Medan.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31856.165530893133!2d98.63685853476562!3d3.582722000000006!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x30312e2b0180ac79%3A0xb862c35ec4eb0e3!2sUCOK%20DURIAN%20MEDAN!5e0!3m2!1sid!2sid!4v1729348801204!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(87, 30, 3, 'ET Terrace Garden', 'image/Pematangsiantar/ET_Terrace_Garden.jpg', 'ET Terrace Garden, located in Medan, is a charming and picturesque dining destination offering a blend of nature and culinary delights. Known for its open-air terrace and lush green surroundings, the restaurant provides a serene atmosphere perfect for relaxing while enjoying a delicious meal. Its menu features a variety of local and international dishes, making it a popular spot for both casual diners and special gatherings. The scenic setting and peaceful ambiance at ET Terrace Garden make it a favorite among visitors looking for a tranquil escape in the bustling city of Medan.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3984.575330608313!2d99.08808717287194!3d2.9376370970386336!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x303185b4c4b7b29f%3A0x6efdce36b8c78ba7!2sEt%20Terrace%20Garden%20Resto!5e0!3m2!1sid!2sid!4v1729349113890!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(88, 24, 3, 'Ribur Mokja', 'image/TapanuliUtara/Ribur_Mokja.jpg', 'Ribur Mokja, located in Tapanuli Utara, is a popular culinary destination known for its authentic Batak cuisine and warm, welcoming atmosphere. Surrounded by the natural beauty of North Sumatra, the restaurant offers a rustic and laid-back dining experience, allowing guests to savor traditional dishes made from fresh, local ingredients. Ribur Mokja is especially renowned for its signature Batak dishes, such as saksang and naniura, which are deeply rooted in the region’s cultural heritage. Its unique combination of delicious food and scenic surroundings makes Ribur Mokja a must-visit spot for those exploring the flavors of Tapanuli Utara.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31897.719470357788!2d98.90837211694206!3d2.0699221708796025!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302e6dbd3965d4ff%3A0xd1dfdd8e4561d2c2!2sRibur%20Mokja!5e0!3m2!1sid!2sid!4v1729349316427!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(89, 24, 3, 'Boma Restaurant', 'image/TapanuliUtara/RM_Boma.jpg', 'Boma Restaurant or RM Boma, located in Tapanuli Utara, is a well-known eatery that specializes in serving traditional Minang and Batak dishes. The restaurant offers a cozy and homely atmosphere, making it a popular spot for locals and visitors seeking comfort food with rich, authentic flavors. RM Boma is particularly famous for its rendang and other spicy Minang delicacies, alongside Batak favorites, providing a diverse menu that reflects the culinary diversity of the region. With its welcoming environment and delicious local cuisine, RM Boma stands out as a must-try dining destination in Tapanuli Utara.', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3987.3341526293034!2d98.9603229728674!3d2.02196699795982!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x302e6e8caae49c9f%3A0x415d370f0f0593e!2sRumah%20Makan%20Minang%20Boma!5e0!3m2!1sid!2sid!4v1729349610071!5m2!1sid!2sid\" width=\"560\" height=\"400\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`) VALUES
(1, 'dini', 'dinisahfitriiiii@gmail.com', '$2y$10$Yp.i7zM0uY/TAYjtykqovOFpIVELweFfhQW7fp3bnAauxTBdetFCq'),
(2, 'amir', 'amirhuseinsarumpaet2001@gmail.com', '$2y$10$NxXv8VpXaM7kMtFgCqorSOOkKocSSwtqD3/M79MntZ5yNBeDIs97K'),
(5, 'karin', 'karin@gmail.com', '$2y$10$1Z2VhEj.ZhmyijY9q9CF9OHKdykbN/R8GIdQEdg8sHZ0dabmrWPzi');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tourism_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`idpengguna`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`like_id`),
  ADD UNIQUE KEY `post_id` (`post_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_posts_user_id` (`user_id`);

--
-- Indexes for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `post_shares`
--
ALTER TABLE `post_shares`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `tourism_id` (`tourism_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `shares`
--
ALTER TABLE `shares`
  ADD PRIMARY KEY (`share_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tourismcategories`
--
ALTER TABLE `tourismcategories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `tourismplaces`
--
ALTER TABLE `tourismplaces`
  ADD PRIMARY KEY (`tourism_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tourism_id` (`tourism_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `idpengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `post_shares`
--
ALTER TABLE `post_shares`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shares`
--
ALTER TABLE `shares`
  MODIFY `share_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tourismcategories`
--
ALTER TABLE `tourismcategories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tourismplaces`
--
ALTER TABLE `tourismplaces`
  MODIFY `tourism_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD CONSTRAINT `post_likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_likes_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `post_shares`
--
ALTER TABLE `post_shares`
  ADD CONSTRAINT `post_shares_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `post_shares_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`tourism_id`) REFERENCES `tourismplaces` (`tourism_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `shares`
--
ALTER TABLE `shares`
  ADD CONSTRAINT `shares_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `shares_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `tourismplaces`
--
ALTER TABLE `tourismplaces`
  ADD CONSTRAINT `tourismplaces_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`city_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tourismplaces_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `tourismcategories` (`category_id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`tourism_id`) REFERENCES `tourismplaces` (`tourism_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
