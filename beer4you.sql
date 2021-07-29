-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 02 mars 2021 à 12:54
-- Version du serveur :  5.7.33-0ubuntu0.18.04.1
-- Version de PHP : 7.3.15-3+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `fsjs-03_beer4you`
--

-- --------------------------------------------------------

--
-- Structure de la table `beers`
--

CREATE TABLE `beers` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` text NOT NULL,
  `price` int(5) NOT NULL,
  `photo` varchar(90) NOT NULL,
  `quantity` int(11) NOT NULL,
  `creationTimestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `beers`
--

INSERT INTO `beers` (`id`, `name`, `description`, `price`, `photo`, `quantity`, `creationTimestamp`) VALUES
(2, 'La fameuse 1664', 'Pour les bourgeois des pauvres !!', 25, '1664.jpeg', 100, '2020-06-17 17:28:07'),
(4, 'La destructrice 86', 'Même les alcoolique arrive à être ivre', 15, '86.jpeg', 400000, '2020-06-17 17:28:07'),
(5, 'La sympatique Amstel', 'Une bière sans goût c\'est tout ce qu\'on veut', 20, 'amstel.jpeg', 10, '2020-06-17 17:28:07'),
(30, 'Mort subite', 'Coucou la mort !!', 12, 'mort-subite.jpeg', 123, '2020-06-24 12:49:24'),
(32, 'Corona', 'chichi', 1, 'coronas.jpeg', 123, '2020-06-24 12:50:49');

-- --------------------------------------------------------

--
-- Structure de la table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `beer_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orderdetails`
--

INSERT INTO `orderdetails` (`id`, `order_id`, `beer_id`, `quantity`, `total`) VALUES
(32, 37, 2, 2, 50),
(33, 37, 4, 1, 15),
(34, 37, 32, 1, 1),
(35, 38, 2, 1, 25),
(36, 38, 5, 1, 20),
(37, 39, 2, 1, 25),
(38, 39, 5, 1, 20),
(39, 39, 4, 1, 15),
(40, 40, 2, 1, 25),
(41, 40, 5, 1, 20),
(42, 40, 4, 1, 15),
(43, 41, 2, 2, 50),
(44, 41, 32, 1, 1),
(45, 42, 32, 1, 1),
(46, 43, 2, 3, 75),
(47, 43, 4, 1, 15),
(48, 43, 30, 1, 12),
(49, 44, 30, 1, 12),
(50, 45, 30, 1, 12),
(51, 46, 4, 40, 600),
(52, 47, 4, 3, 45),
(53, 47, 5, 1, 20),
(54, 48, 30, 23, 276),
(55, 49, 2, 1, 25),
(56, 49, 5, 3, 60);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `totalAmount` double NOT NULL,
  `creationTimestamp` datetime NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `totalAmount`, `creationTimestamp`, `status`) VALUES
(37, 1, 66, '2020-06-25 09:57:03', 'not payed'),
(38, 1, 45, '2020-06-25 10:38:42', 'not payed'),
(39, 1, 60, '2020-06-25 14:15:59', 'not payed'),
(40, 1, 60, '2020-06-25 14:20:23', 'payed'),
(41, 1, 51, '2020-06-25 15:01:50', 'not payed'),
(42, 1, 1, '2020-06-25 15:05:59', 'not payed'),
(43, 1, 102, '2020-06-26 10:13:17', 'payed'),
(44, 1, 12, '2020-06-26 10:28:35', 'payed'),
(45, 1, 12, '2020-06-26 10:32:37', 'payed'),
(46, 1, 600, '2020-06-26 10:37:02', 'payed'),
(47, 1, 65, '2020-11-05 11:24:55', 'payed'),
(48, 1, 276, '2020-11-05 11:26:51', 'payed'),
(49, 11, 85, '2021-02-24 14:35:25', 'not payed');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(60) NOT NULL,
  `lastName` varchar(60) NOT NULL,
  `email` varchar(90) NOT NULL,
  `password` varchar(120) NOT NULL,
  `role` varchar(15) NOT NULL,
  `address` varchar(60) NOT NULL,
  `zip` int(5) NOT NULL,
  `city` varchar(40) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `creationTimestamp` datetime NOT NULL,
  `connexionTimestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `role`, `address`, `zip`, `city`, `phone`, `creationTimestamp`, `connexionTimestamp`) VALUES
(1, 'Thib', 'Mones', 'thib@gmail.com', '$2b$10$MQOxj3vTDSPko5I86DbTceOb5t2/DWmwd0PJZ0xMOWA/nrKpKctwO', 'user', '32 rue de la paix', 75011, 'Paris', '0909090998', '2020-06-23 10:58:49', '2020-06-23 10:58:49'),
(2, 'Bernard', 'Malas', 'nanard@gmail.com', '$2b$10$aaBkd7do.Nwk8bKt/ISjd.zPuQzhGw4NCUXT/6rWsYWFr0lQQCw.W', 'user', '10 rue de la paix', 75008, 'Paris', '0651508656', '2020-06-23 11:43:24', '2020-06-23 11:43:24'),
(3, 'Gerard', 'gege@gmail.com', '', '$2b$10$2XYSWL9VEpT51UzpG/loh.Voptt4gEy001sMlAScLG6vVdEUnriRa', 'user', '30 rue du port', 13002, 'Marseille', '0606060809', '2020-06-23 11:44:17', '2020-06-23 11:44:17'),
(4, 'test', 'test@test.fr', '', '$2b$10$vghxfvnVEsn9Cjslm22dEelD.N1udJBJJtzIBmofsZnhkM0MJvkXO', 'user', '5 rue de la rep', 75011, 'Paris', '09087886', '2020-06-23 11:45:58', '2020-06-23 11:45:58'),
(5, 'Bernard', 'Majax', 'majax@gmail.com', '$2b$10$hh7rGocblfXEQbYXdeQ2W.gBYVqP3/Jy48rj9gNaE9M8pk5onDNc2', 'user', '10 rue de la paix', 75010, 'Paris', '090937453', '2020-06-23 12:32:43', '2020-06-23 12:32:43'),
(7, 'Kevin', 'tatane', 'keke@gmail.com', '$2b$10$srwO91L1nC.br/95AzkmMuc3iSj6Zzv1sN.zIETd.kBvu6pgPIczi', 'user', '12 place de la poste', 59000, 'Roubaix', '0909986676', '2020-06-23 15:39:26', '2020-06-23 15:39:26'),
(8, 't', 't', 'test@test.fr', '$2b$10$rrxDGI.OBpvuK1mV9E2VvuGAEBYzCJxXYUl8XpnTmVJYDx12P8c4S', 'user', '5 rue de la rep', 75011, 'Paris', '0978865446', '2020-06-23 15:41:35', '2020-06-23 15:41:35'),
(9, 'jean', 'valjean', 'jeje@gmail.com', '$2b$10$dElNDj5NEmctmnAnp7.qu.763zC5nOZEyZri9CpLdE0X4zPHP381a', 'user', '12 rue de la paix', 92100, 'paris', '8282882', '2020-06-23 16:03:46', '2020-06-23 16:03:46'),
(11, 'antoine', 'monesma', 'blabla@gmail.com', '$2b$10$bIMt9tljcwiPpa6NpaeKCuJk66H9/c9ZzLuMGzCOYA4wRShcvgAwS', 'admin', '8-10 rue kurwa', 92170, 'Kurwacity', '0214563258', '2020-06-26 15:52:53', '2020-06-26 15:52:53');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `beers`
--
ALTER TABLE `beers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `beers`
--
ALTER TABLE `beers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
