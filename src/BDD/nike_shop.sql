-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 11 mai 2025 à 12:59
-- Version du serveur : 8.3.0
-- Version de PHP : 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nike_shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_BA388B7A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cart_line`
--

DROP TABLE IF EXISTS `cart_line`;
CREATE TABLE IF NOT EXISTS `cart_line` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cart_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `cartline_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3EF1B4CF1AD5CDBF` (`cart_id`),
  KEY `IDX_3EF1B4CF4584665A` (`product_id`),
  KEY `IDX_3EF1B4CFBACCF09E` (`cartline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_64C19C1EA9FDD75` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `description`, `media_id`) VALUES
(1, 'Chaussures Homme', '<div>Baskets et sneakers Nike conçues pour les hommes.</div>', 66),
(2, 'Chaussures Femme', '<div>Chaussures Nike élégantes et performantes pour femmes.</div>', 67),
(3, 'Running', '<div>Chaussures de course Nike pour tous les niveaux.</div>', 65),
(4, 'Lifestyle', '<div>Modèles tendance à porter au quotidien.</div>', 64);

-- --------------------------------------------------------

--
-- Structure de la table `command_line`
--

DROP TABLE IF EXISTS `command_line`;
CREATE TABLE IF NOT EXISTS `command_line` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `size_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_70BE1A7B8D9F6D38` (`order_id`),
  KEY `IDX_70BE1A7B4584665A` (`product_id`),
  KEY `IDX_70BE1A7B498DA827` (`size_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `command_line`
--

INSERT INTO `command_line` (`id`, `order_id`, `product_id`, `quantity`, `size_id`) VALUES
(1, 1, 1, 1, 10),
(2, 1, 1, 1, 8),
(3, 2, 1, 1, 6),
(4, 3, 7, 1, 9);

-- --------------------------------------------------------

--
-- Structure de la table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE IF NOT EXISTS `customer_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cp` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `customer_address`
--

INSERT INTO `customer_address` (`id`, `type`, `address`, `cp`, `city`, `country`) VALUES
(1, 'rue', '5C Rue Eugène Varlin', '93100', 'MONTREUIL', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250403230048', '2025-04-03 23:01:14', 999),
('DoctrineMigrations\\Version20250403235227', '2025-04-03 23:52:36', 33),
('DoctrineMigrations\\Version20250509163757', '2025-05-09 16:38:02', 117),
('DoctrineMigrations\\Version20250510000653', '2025-05-10 00:07:08', 383),
('DoctrineMigrations\\Version20250510022603', '2025-05-10 02:31:02', 132),
('DoctrineMigrations\\Version20250510033411', '2025-05-10 03:34:24', 121);

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6A2CA10C4584665A` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `product_id`, `type`, `path`, `alt`) VALUES
(41, 1, 'image/jpeg', '/images/airmax90.jpg', 'Nike Air Max 90'),
(42, 2, 'image/jpeg', '/images/airforce1.jpg', 'Nike Air Force 1'),
(43, 3, 'image/jpeg', '/images/reactinfinity.jpg', 'Nike React Infinity Run'),
(44, 4, 'image/jpeg', '/images/blazer77.jpg', 'Nike Blazer Mid 77'),
(45, 5, 'image/jpeg', '/images/pegasustrail.jpg', 'Nike Pegasus Trail 4'),
(46, 6, 'image/jpeg', '/images/airmax270.jpg', 'Nike Air Max 270 Femme'),
(47, 7, 'image/jpeg', '/images/invincible.jpg', 'Nike ZoomX Invincible Run'),
(48, 8, 'image/jpeg', '/images/courtlegacy.jpg', 'Nike Court Legacy'),
(49, 9, 'image/jpeg', '/images/freern5.jpg', 'Nike Free RN 5.0'),
(50, 10, 'image/jpeg', '/images/vomero16.jpg', 'Nike Air Zoom Vomero 16'),
(51, 11, 'image/jpeg', '/images/pegasus40.jpg', 'Nike Air Zoom Pegasus 40'),
(52, 12, 'image/jpeg', '/images/streakfly.jpg', 'Nike Streakfly'),
(53, 13, 'image/jpeg', '/images/vaporfly3.jpg', 'Nike Vaporfly 3'),
(54, 14, 'image/jpeg', '/images/winflo10.jpg', 'Nike Winflo 10'),
(55, 15, 'image/jpeg', '/images/infinityrn4.jpg', 'Nike InfinityRN 4'),
(56, 16, 'image/jpeg', '/images/dunklow.jpg', 'Nike Dunk Low'),
(57, 17, 'image/jpeg', '/images/airmaxplus.jpg', 'Nike Air Max Plus'),
(58, 18, 'image/jpeg', '/images/waffleone.jpg', 'Nike Waffle One'),
(59, 19, 'image/jpeg', '/images/huarache.jpg', 'Nike Air Huarache'),
(60, 20, 'image/jpeg', '/images/cortez.jpg', 'Nike Cortez'),
(63, 81, 'image/jpeg', '/images/img-20241029-230342-1746965860.jpg', 'coco'),
(64, NULL, 'image/jpeg', '/images/78-best-nike-sneakers-16286817-main-1746966635.webp', 'lifestyle'),
(65, NULL, 'image/jpeg', '/images/reggiseni-sportivi-nike-1746966657.webp', 'running'),
(66, NULL, 'image/jpeg', '/images/6-65a8eee1-ea23-4eea-9bc4-b6f6f6b49673-1746966746.webp', 'homme'),
(67, NULL, 'image/jpeg', '/images/lsawdodc1pbwctchjvy2vzc2luzy9wag90b2jvec9lmzkwnmq5otkxmge1nzaznty0mzmyyzdmndjkngfizi5qcgc-1746966765.webp', 'femme');

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `order_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid` tinyint(1) NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `order_number`, `valid`, `date_time`) VALUES
(1, 14, 'CMD-681fea67d4296', 1, '2025-05-11 00:08:07'),
(2, 14, 'CMD-681ffab150824', 0, '2025-05-11 01:17:37'),
(3, 14, 'CMD-681ffac161d17', 0, '2025-05-11 01:17:53');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_ht` double NOT NULL,
  `available` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `description`, `price_ht`, `available`) VALUES
(1, 1, 'Nike Air Max 90', 'Confort légendaire et style intemporel.', 129.99, 1),
(2, 1, 'Nike Air Force 1', 'Icône du streetwear depuis 1982.', 119.99, 1),
(3, 1, 'Nike React Infinity Run', 'Conçue pour les longues distances.', 149.99, 1),
(4, 1, 'Nike Blazer Mid 77', 'Look rétro avec un cuir premium.', 109.99, 1),
(5, 1, 'Nike Pegasus Trail 4', 'Polyvalente pour route et sentier.', 139.99, 1),
(6, 2, 'Nike Air Max 270', 'Style lifestyle avec grande bulle d’air.', 129.99, 1),
(7, 2, 'Nike ZoomX Invincible Run', 'Amorti maximal pour coureuses exigeantes.', 159.99, 1),
(8, 2, 'Nike Court Legacy', 'Tennis old school revisitées.', 74.99, 1),
(9, 2, 'Nike Free RN 5.0', 'Souplesse et légèreté.', 99.99, 1),
(10, 2, 'Nike Air Zoom Vomero 16', 'Confort premium pour la performance.', 149.99, 1),
(11, 3, 'Nike Air Zoom Pegasus 40', 'Polyvalence et dynamisme.', 129.99, 1),
(12, 3, 'Nike Streakfly', 'Parfaite pour les courses rapides.', 159.99, 1),
(13, 3, 'Nike Vaporfly 3', 'Pour battre tes records.', 249.99, 1),
(14, 3, 'Nike Winflo 10', 'Confort et stabilité pour le quotidien.', 99.99, 1),
(15, 3, 'Nike InfinityRN 4', 'Amorti et maintien renforcé.', 159.99, 1),
(16, 4, 'Nike Dunk Low', 'Style rétro très en vogue.', 109.99, 1),
(17, 4, 'Nike Air Max Plus', 'Look agressif et confort optimal.', 179.99, 1),
(18, 4, 'Nike Waffle One', 'Vintage et moderne à la fois.', 89.99, 1),
(19, 4, 'Nike Air Huarache', 'Icône des années 90 revisitée.', 119.99, 1),
(20, 4, 'Nike Cortez', 'Modèle historique remis au goût du jour.', 84.99, 1),
(81, 4, 'Test', '<div>gzgzg</div>', 100, 1);

-- --------------------------------------------------------

--
-- Structure de la table `product_size`
--

DROP TABLE IF EXISTS `product_size`;
CREATE TABLE IF NOT EXISTS `product_size` (
  `product_id` int NOT NULL,
  `size_id` int NOT NULL,
  PRIMARY KEY (`product_id`,`size_id`),
  KEY `IDX_7A2806CB498DA827` (`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product_size`
--

INSERT INTO `product_size` (`product_id`, `size_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(81, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(81, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(7, 4),
(8, 4),
(9, 4),
(10, 4),
(11, 4),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(81, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(6, 5),
(7, 5),
(8, 5),
(9, 5),
(10, 5),
(11, 5),
(12, 5),
(13, 5),
(14, 5),
(15, 5),
(16, 5),
(17, 5),
(18, 5),
(19, 5),
(20, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(6, 6),
(7, 6),
(8, 6),
(9, 6),
(10, 6),
(11, 6),
(12, 6),
(13, 6),
(14, 6),
(15, 6),
(16, 6),
(17, 6),
(18, 6),
(19, 6),
(20, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7),
(6, 7),
(7, 7),
(8, 7),
(9, 7),
(10, 7),
(11, 7),
(12, 7),
(13, 7),
(14, 7),
(15, 7),
(16, 7),
(17, 7),
(18, 7),
(19, 7),
(20, 7),
(1, 8),
(2, 8),
(3, 8),
(4, 8),
(5, 8),
(6, 8),
(7, 8),
(8, 8),
(9, 8),
(10, 8),
(11, 8),
(12, 8),
(13, 8),
(14, 8),
(15, 8),
(16, 8),
(17, 8),
(18, 8),
(19, 8),
(20, 8),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(5, 9),
(6, 9),
(7, 9),
(8, 9),
(9, 9),
(10, 9),
(11, 9),
(12, 9),
(13, 9),
(14, 9),
(15, 9),
(16, 9),
(17, 9),
(18, 9),
(19, 9),
(20, 9),
(1, 10),
(2, 10),
(3, 10),
(4, 10),
(5, 10),
(6, 10),
(7, 10),
(8, 10),
(9, 10),
(10, 10),
(11, 10),
(12, 10),
(13, 10),
(14, 10),
(15, 10),
(16, 10),
(17, 10),
(18, 10),
(19, 10),
(20, 10),
(1, 11),
(2, 11),
(3, 11),
(4, 11),
(5, 11),
(6, 11),
(7, 11),
(8, 11),
(9, 11),
(10, 11),
(11, 11),
(12, 11),
(13, 11),
(14, 11),
(15, 11),
(16, 11),
(17, 11),
(18, 11),
(19, 11),
(20, 11),
(1, 12),
(2, 12),
(3, 12),
(4, 12),
(5, 12),
(6, 12),
(7, 12),
(8, 12),
(9, 12),
(10, 12),
(11, 12),
(12, 12),
(13, 12),
(14, 12),
(15, 12),
(16, 12),
(17, 12),
(18, 12),
(19, 12),
(20, 12);

-- --------------------------------------------------------

--
-- Structure de la table `size`
--

DROP TABLE IF EXISTS `size`;
CREATE TABLE IF NOT EXISTS `size` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `size`
--

INSERT INTO `size` (`id`, `label`) VALUES
(1, '36'),
(2, '37'),
(3, '38'),
(4, '39'),
(5, '40'),
(6, '41'),
(7, '42'),
(8, '43'),
(9, '44'),
(10, '45'),
(11, '46'),
(12, '47');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_address_id` int DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  UNIQUE KEY `UNIQ_8D93D64987EABF7` (`customer_address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `customer_address_id`, `first_name`, `last_name`, `phone`, `email`, `password`, `roles`, `is_verified`) VALUES
(14, 1, 'ibrahima sory', 'Diallo', '0644922686', 'acepowerman2305@gmail.com', '$2y$13$nrrY8qfBhEakPhqbBJ1tMOJgOOM89FOG/NKRdQ4cZNdGfeiXA4at6', '[\"ROLE_USER\"]', 1),
(15, NULL, 'Admin', 'Nike', '0125146445', 'admin@nike.fr', '$2y$13$nrrY8qfBhEakPhqbBJ1tMOJgOOM89FOG/NKRdQ4cZNdGfeiXA4at6', '[\"ROLE_ADMIN\"]', 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_BA388B7A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `cart_line`
--
ALTER TABLE `cart_line`
  ADD CONSTRAINT `FK_3EF1B4CF1AD5CDBF` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FK_3EF1B4CF4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_3EF1B4CFBACCF09E` FOREIGN KEY (`cartline_id`) REFERENCES `cart` (`id`);

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`);

--
-- Contraintes pour la table `command_line`
--
ALTER TABLE `command_line`
  ADD CONSTRAINT `FK_70BE1A7B4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_70BE1A7B498DA827` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  ADD CONSTRAINT `FK_70BE1A7B8D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `product_size`
--
ALTER TABLE `product_size`
  ADD CONSTRAINT `fk_product_size_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_product_size_size` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D64987EABF7` FOREIGN KEY (`customer_address_id`) REFERENCES `customer_address` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
