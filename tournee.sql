-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 02 juin 2024 à 09:19
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tournee`
--

-- --------------------------------------------------------

--
-- Structure de la table `artist`
--

DROP TABLE IF EXISTS `artist`;
CREATE TABLE IF NOT EXISTS `artist` (
  `id_group` int NOT NULL,
  `id_artist` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_artist`),
  KEY `id_groupe` (`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `artist`
--

INSERT INTO `artist` (`id_group`, `id_artist`, `name`) VALUES
(6, 1, 'Joeystarr'),
(6, 2, 'Kool Shen'),
(7, 7, 'Bono'),
(7, 8, 'The Edge'),
(7, 9, 'Adam Clayton'),
(7, 10, 'Larry Mullen Jr.'),
(4, 11, 'Ed Sheeran'),
(7, 13, 'test1');

-- --------------------------------------------------------

--
-- Structure de la table `concert`
--

DROP TABLE IF EXISTS `concert`;
CREATE TABLE IF NOT EXISTS `concert` (
  `id_concert` int NOT NULL AUTO_INCREMENT,
  `id_group` int NOT NULL,
  `place` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id_concert`),
  KEY `id_groupe2` (`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `concert`
--

INSERT INTO `concert` (`id_concert`, `id_group`, `place`, `date`) VALUES
(1, 7, 'Laval', '2024-09-15'),
(2, 6, 'Marseille', '2024-11-27'),
(4, 7, 'Montpellier', '2024-12-31'),
(5, 4, 'Mayenne', '2024-12-03');

-- --------------------------------------------------------

--
-- Structure de la table `group`
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE IF NOT EXISTS `group` (
  `id_group` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `group`
--

INSERT INTO `group` (`id_group`, `name`, `description`, `picture`) VALUES
(3, 'Ariana Grande', 'Chanteuse pop des années 2011', 'view/img/grande.jpg'),
(4, 'Ed Sheeran', 'Chanteur pop des années 2010', 'view/img/sheeran.jpg'),
(6, 'NTM', 'Groupe de rap des années 90', 'view/img/ntm.jpg'),
(7, 'U2', 'groupe de rock', '');

-- --------------------------------------------------------

--
-- Structure de la table `instrument`
--

DROP TABLE IF EXISTS `instrument`;
CREATE TABLE IF NOT EXISTS `instrument` (
  `id_instrument` int NOT NULL AUTO_INCREMENT,
  `id_artist` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` int NOT NULL,
  `volume` int NOT NULL,
  PRIMARY KEY (`id_instrument`),
  KEY `id_artist` (`id_artist`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `instrument`
--

INSERT INTO `instrument` (`id_instrument`, `id_artist`, `name`, `weight`, `volume`) VALUES
(1, 9, 'basse', 700, 600),
(3, 10, 'batterie', 1200, 1900),
(4, 8, 'Clavier', 1000, 1100),
(5, 11, 'Guitare', 400, 650),
(6, 8, 'guitare', 700, 550),
(7, 7, 'harmonica', 200, 100),
(8, 7, 'tuba', 10000, 5000);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `login` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id_user`, `login`, `password`) VALUES
(1, 'admin', 'admin');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `artist`
--
ALTER TABLE `artist`
  ADD CONSTRAINT `id_groupe` FOREIGN KEY (`id_group`) REFERENCES `group` (`id_group`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `concert`
--
ALTER TABLE `concert`
  ADD CONSTRAINT `id_groupe2` FOREIGN KEY (`id_group`) REFERENCES `group` (`id_group`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `instrument`
--
ALTER TABLE `instrument`
  ADD CONSTRAINT `id_artist` FOREIGN KEY (`id_artist`) REFERENCES `artist` (`id_artist`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
