-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 14 nov. 2024 à 11:41
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `marieteam_nef`
--

DELIMITER $$
--
-- Fonctions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hash_password` (`input_password` TINYTEXT) RETURNS TINYTEXT CHARSET utf8mb4 DETERMINISTIC BEGIN
  RETURN CONCAT('$2y$10$', SUBSTRING(SHA2(input_password, 256), 1, 53));
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `administrerliaison`
--

CREATE TABLE `administrerliaison` (
  `id_Utilisateur` int(11) NOT NULL,
  `id_Liaison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `administrerliaison`
--

INSERT INTO `administrerliaison` (`id_Utilisateur`, `id_Liaison`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `bateau`
--

CREATE TABLE `bateau` (
  `id_Bateau` int(11) NOT NULL,
  `Longueur_bateau` int(11) DEFAULT NULL,
  `Largeur_bateau` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bateau`
--

INSERT INTO `bateau` (`id_Bateau`, `Longueur_bateau`, `Largeur_bateau`) VALUES
(1, 120, 30),
(2, 150, 40),
(3, 180, 50);

-- --------------------------------------------------------

--
-- Structure de la table `bateaufret`
--

CREATE TABLE `bateaufret` (
  `id_Bateaufret` int(11) NOT NULL,
  `Poid_max` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bateaufret`
--

INSERT INTO `bateaufret` (`id_Bateaufret`, `Poid_max`) VALUES
(1, 10000),
(2, 20000),
(3, 30000);

-- --------------------------------------------------------

--
-- Structure de la table `bateauvoyageur`
--

CREATE TABLE `bateauvoyageur` (
  `id_BateauVoyageur` int(11) NOT NULL,
  `Vitesse` int(11) DEFAULT NULL,
  `Places` int(11) DEFAULT NULL,
  `id_Image` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bateauvoyageur`
--

INSERT INTO `bateauvoyageur` (`id_BateauVoyageur`, `Vitesse`, `Places`, `id_Image`) VALUES
(1, 30, 100, 1),
(2, 25, 150, 2),
(3, 40, 200, 3);

-- --------------------------------------------------------

--
-- Structure de la table `categorietarif`
--

CREATE TABLE `categorietarif` (
  `Lettre_identification` char(1) NOT NULL,
  `Libelle_categorie_tarif` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorietarif`
--

INSERT INTO `categorietarif` (`Lettre_identification`, `Libelle_categorie_tarif`) VALUES
('A', 'Passagers'),
('B', 'Vehicule inferieur a 5m de long'),
('C', 'Vehicule superieur a 5 m de long');

-- --------------------------------------------------------

--
-- Structure de la table `equipement`
--

CREATE TABLE `equipement` (
  `id_Equipement` int(11) NOT NULL,
  `Lib_equipement` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`id_Equipement`, `Lib_equipement`) VALUES
(1, 'Chaises'),
(2, 'Canoë'),
(3, 'Bateaux de secours'),
(4, 'Système GPS');

-- --------------------------------------------------------

--
-- Structure de la table `equipementbateau`
--

CREATE TABLE `equipementbateau` (
  `id_BateauVoyageur` int(11) NOT NULL,
  `id_Equipement` int(11) NOT NULL,
  `Quantite_equipement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `equipementbateau`
--

INSERT INTO `equipementbateau` (`id_BateauVoyageur`, `id_Equipement`, `Quantite_equipement`) VALUES
(1, 1, 50),
(1, 2, 10),
(2, 3, 5),
(2, 4, 2),
(3, 1, 100);

-- --------------------------------------------------------

--
-- Structure de la table `fret`
--

CREATE TABLE `fret` (
  `id_Bateaufret` int(11) NOT NULL,
  `id_Bateau` int(11) NOT NULL,
  `Fret` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fret`
--

INSERT INTO `fret` (`id_Bateaufret`, `id_Bateau`, `Fret`) VALUES
(1, 1, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id_Image` int(11) NOT NULL,
  `Nom_Image` tinytext DEFAULT NULL,
  `Content_image` longblob DEFAULT NULL,
  `Extension` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id_Image`, `Nom_Image`, `Content_image`, `Extension`) VALUES
(1, 'bateau1.jpg', NULL, 'jpg'),
(2, 'bateau2.jpg', NULL, 'jpg'),
(3, 'bateau3.jpg', NULL, 'jpg');

-- --------------------------------------------------------

--
-- Structure de la table `liaison`
--

CREATE TABLE `liaison` (
  `id_Liaison` int(11) NOT NULL,
  `Lieu_depart` tinytext DEFAULT NULL,
  `Lieu_arrivee` tinytext DEFAULT NULL,
  `Distance_liaison` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `liaison`
--

INSERT INTO `liaison` (`id_Liaison`, `Lieu_depart`, `Lieu_arrivee`, `Distance_liaison`) VALUES
(1, 'Cherbourg-en-Cotentin', 'Poole', 139),
(2, 'Marseille', 'Porto Torres', 413),
(3, 'Nice', 'Bastia', 247);

-- --------------------------------------------------------

--
-- Structure de la table `periode`
--

CREATE TABLE `periode` (
  `id_Periode` int(11) NOT NULL,
  `Debut_periode` date DEFAULT NULL,
  `Fin_periode` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `periode`
--

INSERT INTO `periode` (`id_Periode`, `Debut_periode`, `Fin_periode`) VALUES
(1, '2024-09-01', '2025-06-15'),
(2, '2025-06-16', '2025-09-15'),
(3, '2025-09-16', '2026-06-30');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_Reservation` int(11) NOT NULL,
  `id_Traversee` int(11) DEFAULT NULL,
  `id_Utilisateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_Reservation`, `id_Traversee`, `id_Utilisateur`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 3, 4),
(5, 3, 5);

-- --------------------------------------------------------

--
-- Structure de la table `reservationtarif`
--

CREATE TABLE `reservationtarif` (
  `id_Reservation` int(11) NOT NULL,
  `id_TypeTarif` int(11) NOT NULL,
  `Quantite_tarif` int(11) DEFAULT NULL,
  `id_Periode` int(11) NOT NULL,
  `id_Liaison` int(11) NOT NULL,
  `Lettre_identification` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservationtarif`
--

INSERT INTO `reservationtarif` (`id_Reservation`, `id_TypeTarif`, `Quantite_tarif`, `id_Periode`, `id_Liaison`, `Lettre_identification`) VALUES
(1, 2, 1, 2, 1, 'C'),
(2, 2, 3, 1, 1, 'A'),
(3, 2, 4, 2, 2, 'A'),
(4, 2, 4, 3, 3, 'B'),
(5, 2, 7, 3, 3, 'B');

-- --------------------------------------------------------

--
-- Structure de la table `tarifliaison`
--

CREATE TABLE `tarifliaison` (
  `id_Liaison` int(11) NOT NULL,
  `id_TypeTarif` int(11) NOT NULL,
  `Lettre_identification` char(1) NOT NULL,
  `id_Periode` int(11) NOT NULL,
  `Tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `tarifliaison`
--

INSERT INTO `tarifliaison` (`id_Liaison`, `id_TypeTarif`, `Lettre_identification`, `id_Periode`, `Tarif`) VALUES
(1, 1, 'B', 2, 142),
(1, 1, 'C', 2, 284),
(1, 2, 'A', 1, 15),
(2, 1, 'B', 1, 100),
(2, 2, 'A', 2, 17),
(3, 2, 'B', 3, 197);

-- --------------------------------------------------------

--
-- Structure de la table `traversee`
--

CREATE TABLE `traversee` (
  `id_Traversee` int(11) NOT NULL,
  `Date_depart` datetime DEFAULT NULL,
  `Date_arrive` datetime DEFAULT NULL,
  `Nombre_place` int(11) DEFAULT NULL,
  `id_Bateau` int(11) NOT NULL,
  `id_Liaison` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `traversee`
--

INSERT INTO `traversee` (`id_Traversee`, `Date_depart`, `Date_arrive`, `Nombre_place`, `id_Bateau`, `id_Liaison`) VALUES
(1, '2024-12-05 08:00:00', '2024-12-05 12:00:00', 100, 1, 1),
(2, '2024-12-06 09:00:00', '2024-12-06 13:00:00', 150, 2, 2),
(3, '2024-12-07 10:00:00', '2024-12-07 14:00:00', 200, 3, 3);

-- --------------------------------------------------------

--
-- Structure de la table `typetarif`
--

CREATE TABLE `typetarif` (
  `id_TypeTarif` int(11) NOT NULL,
  `Lettre_identification` char(1) NOT NULL,
  `Libelle_typeTarif` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `typetarif`
--

INSERT INTO `typetarif` (`id_TypeTarif`, `Lettre_identification`, `Libelle_typeTarif`) VALUES
(1, 'A', 'Adulte'),
(1, 'B', 'Voiture inferieur à 4 m de long'),
(1, 'C', 'Fourgon'),
(2, 'A', 'Junior 8 à 18 ans'),
(2, 'B', 'Voiture supperieur a 4 m de long'),
(2, 'C', 'Camping Car'),
(3, 'A', 'Enfant 0 à 7 ans'),
(3, 'C', 'Camion');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_Utilisateur` int(11) NOT NULL,
  `Nom_utilisateur` tinytext DEFAULT NULL,
  `Prenom_utilisateur` tinytext DEFAULT NULL,
  `Mail` tinytext DEFAULT NULL,
  `Mot_de_passe` tinytext DEFAULT NULL,
  `Role` tinytext DEFAULT 'Client'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_Utilisateur`, `Nom_utilisateur`, `Prenom_utilisateur`, `Mail`, `Mot_de_passe`, `Role`) VALUES
(1, 'admin', 'admin', 'a@admin.ad', '$2y$10$NoSms8bPncwxWetF2MM/re4FcSeZYGFxy9jqhuTOEnmlualOr7JUK', 'Admin'),
(2, 'Dupont', 'Jean', 'jean.dupont@example.com', '$2y$10$a8e11d21e4ab5b68c6cc61a723ab23f704fd760a8203028ff8ee6', 'client'),
(3, 'Martin', 'Paul', 'paul.martin@example.com', '$2y$10$d803d55b67a75def710eebed64a88a0b259ef33c8034af33724c6', 'client'),
(4, 'Durand', 'Marie', 'marie.durand@example.com', '$2y$10$0fdbd5f08d3329fea11436a78029f206bded9235ab420d0f736fe', 'client'),
(5, 'Lemoine', 'Luc', 'luc.lemoine@example.com', '$2y$10$4c1a33305a4e205e81a42b896a228498844d43a3f7de3fd66696b', 'admin'),
(6, 'Robert', 'Anne', 'anne.robert@example.com', '$2y$10$31bd3c19652053d14c49120bbb1642a63e0e5e7cd13a4498ed585', 'client'),
(7, 'Moreau', 'Julie', 'julie.moreau@example.com', '$2y$10$bc8a4c5ec0a3f318a7547a30d79ba6ac3fd2e7ec1d4ea3f34f72a', 'client'),
(8, 'Lemoine', 'Philippe', 'philippe.lemoine@example.com', '$2y$10$8c56b9431b56a5e1f7fe90211fb7429e2bd8b80896bf7b26a69d1', 'client'),
(9, 'Bernard', 'Alice', 'alice.bernard@example.com', '$2y$10$3d46d627c7cc5db220aca96d2272e1133dfc988cc65840fd709b9', 'admin'),
(10, 'Gauthier', 'Clément', 'clement.gauthier@example.com', '$2y$10$bc3c2ece768f16cab97c52a1292d90529c4efb57b668cc820c096', 'client'),
(11, 'Dufresne', 'Michel', 'michel.dufresne@example.com', '$2y$10$07ee6de2ddc723963f2da7c298de206be3a313fc4f319f9d3fd71', 'client'),
(12, 'Thompson', 'Claire', 'claire.thompson@example.com', '$2y$10$d9ab5992027516f66d8dc8305ede500648c7bf923269c1c9dfa44', 'client'),
(13, 'Lefevre', 'Éric', 'eric.lefevre@example.com', '$2y$10$9e1dd0289456dfbf89b779429a9841af0cb14bcca3a6638490b4f', 'client'),
(14, 'Pires', 'Sophie', 'sophie.pires@example.com', '$2y$10$ac5c99036c2a4074c122655f9d9e03ed896ed55bc6db7562a9abc', 'client'),
(15, 'Caron', 'Michel', 'michel.caron@example.com', '$2y$10$32fe553ff9a880adfc45163e6a393d684b3448a4dc00e7a1a60df', 'admin'),
(16, 'Lambert', 'Jacques', 'jacques.lambert@example.com', '$2y$10$32fe553ff9a880adfc45163e6a393d684b3448a4dc00e7a1a60df', 'client'),
(17, 'Dupuis', 'Caroline', 'caroline.dupuis@example.com', '$2y$10$e23e0fbacc480c77a1df79d853c44cc8d6d62ce5cb5440cd051c4', 'client'),
(18, 'Fournier', 'Bernard', 'bernard.fournier@example.com', '$2y$10$ecfef7d71b6039feba541203bfa754b342008a5c71b48b8c74b34', 'client'),
(19, 'Lemoine', 'Estelle', 'estelle.lemoine@example.com', '$2y$10$f9ee395548250bbd8cf5fdd9f4c3a11df71f63fa525b526214935', 'client'),
(20, 'Hernandez', 'Alfred', 'alfred.hernandez@example.com', '$2y$10$319efa150ef4ba4d1a1c80a73e1ae394e80e9ffdf0d005aee615a', 'client'),
(21, 'Wang', 'Yin', 'yin.wang@example.com', '$2y$10$c05d0865e0908020e63c6d47ef0ceead05f46bcb9efa0bf3429dd', 'client'),
(22, 'Gagnon', 'Bernadette', 'bernadette.gagnon@example.com', '$2y$10$63b40bdfd832260f50e0ce6f80489fe1c2aefa6394e3a405ba2a3', 'client'),
(23, 'Carpentier', 'Laurent', 'laurent.carpentier@example.com', '$2y$10$492896a71e7a0a5d567f2ab5921ac54636c5fcc597599b43ace1f', 'client'),
(24, 'Rousseau', 'Nadine', 'nadine.rousseau@example.com', '$2y$10$cba2a55ce4ace3a5b9b5f31c30667cfbd927c01a04150dfe9b922', 'client'),
(25, 'Chauvin', 'Dominique', 'dominik.chauvin@example.com', '$2y$10$56142b76c313c6f364eab8c4bc4828ea908a432c9fd09b7ab2d1e', 'admin'),
(26, 'Faure', 'Gérard', 'gerard.faure@example.com', '$2y$10$3f21322c0cb4fca84e3b2011aa656b795c8da12d59608e6366089', 'client'),
(27, 'Lemoine', 'David', 'david.lemoine@example.com', '$2y$10$c303c9a871cfe4333db3d9c59a5a31184010708cd37715cf82698', 'client'),
(28, 'Bouquet', 'Pierre', 'pierre.bouquet@example.com', '$2y$10$3d00d4ed9b3da7ecafee8daf91bd1c314a85add4c64c7494e8105', 'client'),
(29, 'Roy', 'Jean-Pierre', 'jeanpierre.roy@example.com', '$2y$10$a332b66fd4092c31571e65a1ee8a143ab32db0f353dc850a84ecc', 'client'),
(30, 'Moulin', 'René', 'rene.moulin@example.com', '$2y$10$7b20255a6a238fe6807dd5e96435086d43e8ccc0ebff74768deab', 'client'),
(31, 'Royer', 'Claudine', 'claudine.royer@example.com', '$2y$10$6fe2304224ebda2fd34761928a3562147d6b53d007f14c565d936', 'client'),
(32, 'Boucher', 'Martine', 'martine.boucher@example.com', '$2y$10$b586e0e63709ebdd05a17551e16356473d17d66bc36e9357dad21', 'client'),
(33, 'Lemoine', 'Jean', 'jean.lemoine@example.com', '$2y$10$f652a454e88f44e83d097ed5b478105a83a52b2b639f1ebc1e17b', 'client'),
(34, 'Schmidt', 'Monique', 'monique.schmidt@example.com', '$2y$10$fb388cbaf1c1d317cb9332a88f84f70dd9a39b8a4ef820b1d7f77', 'client'),
(35, 'Lambert', 'Sébastien', 'sebastien.lambert@example.com', '$2y$10$60434b0f305fb6123c9b4fcff470a65289d8bcf9ae730cc4398aa', 'client'),
(36, 'Joly', 'Brigitte', 'brigitte.joly@example.com', '$2y$10$9ee697d59299f1ab58948813a2486a4e2f9f6d3f260022524eda3', 'admin'),
(37, 'Dufresne', 'Michel', 'michel.dufresne@example.com', '$2y$10$7c57ce6b90e0d812b9bdac73851abe6287214f7eb096460d7035f', 'client'),
(38, 'Gonzalez', 'Julio', 'julio.gonzalez@example.com', '$2y$10$a7682fe6a91b5e69b7e1f3eb904bef67edd1e8d27c702517aedde', 'client'),
(39, 'Thomas', 'Estelle', 'estelle.thomas@example.com', '$2y$10$658d24e377eee3b70f520e29a0c27ded825adf04b60de2ba9f3e6', 'client'),
(40, 'Olivier', 'Emilie', 'emilie.olivier@example.com', '$2y$10$a9f308a0a879c364110a7141be63ecfa302acc08b5dd3923da580', 'client'),
(41, 'Leclerc', 'Jacques', 'jacques.leclerc@example.com', '$2y$10$fac41de7a2328852e60e512ad358742c132d39bce739e70016fa2', 'client'),
(42, 'Girard', 'Philippe', 'philippe.girard@example.com', '$2y$10$458bc85d643adfe48efad77336e9d61079ca080709772b68f0efc', 'client'),
(43, 'Beaufort', 'Lucie', 'lucie.beaufort@example.com', '$2y$10$e029488aac60a55febeabf17482cb96c375579b78b69f771b675f', 'client'),
(44, 'Prévost', 'Catherine', 'catherine.prevost@example.com', '$2y$10$09271763f997eb353d5c571cb8f005e8528096ad63b2bbe460169', 'client'),
(45, 'Pires', 'Julien', 'julien.pires@example.com', '$2y$10$98b8be5739e45c64f4cd10800d908c6c53e26968659b7648dc831', 'client'),
(46, 'Richard', 'Valérie', 'valerie.richard@example.com', '$2y$10$5f29f4979008e7c73cf34d7c9b1450d1d3b7ea1133df362f4241f', 'client'),
(47, 'Davidson', 'Lynne', 'lynne.davidson@example.com', '$2y$10$ee08564e77ae72fe0ee5f40f1628386d21178e1914768796ec21b', 'client'),
(48, 'Benoit', 'Damien', 'damien.benoit@example.com', '$2y$10$d5ed29c8efceeabcfc30b7cf781a9c2cd177875f01f6ee3514e52', 'client'),
(49, 'Lemoine', 'Véronique', 'veronique.lemoine@example.com', '$2y$10$873df8b9480e8c015e56690c2bfe599b20d4e6cebcc6988418c8c', 'client'),
(50, 'Hebert', 'Sylvie', 'sylvie.hebert@example.com', '$2y$10$52ebfe221244d6bd90241b1ddd438277a2e7f3f5fdaa52a46126d', 'client'),
(51, 'Grégoire', 'Alice', 'alice.gregoire@example.com', '$2y$10$096942e7a53a9c9af9314efd65730e0274220709ccb764be19f4a', 'client'),
(52, 'Lemoine', 'Claude', 'claude.lemoine@example.com', '$2y$10$3a3886ed913981474f292f3c66a67442c61fd83cd2999b49eb1a6', 'admin'),
(53, 'Delacroix', 'Philippe', 'philippe.delacroix@example.com', '$2y$10$4983762058f62defb00ce39951d5ec31f29eb13753e499a653178', 'client'),
(54, 'Jardin', 'Cécile', 'cecile.jardin@example.com', '$2y$10$c693d0ee2e6a59b073fdcab7575c7f6cd0b2bcb3f1be1d09e103b', 'client'),
(55, 'Fournier', 'Luc', 'luc.fournier@example.com', '$2y$10$203300304469fcd77d6b08f292d3a4ef160275b586dcd7aea87ac', 'client'),
(56, 'Legros', 'Henri', 'henri.legros@example.com', '$2y$10$624898dff13528cac6b6bdaf92a88f6cfd7763f9d8587e940823d', 'client'),
(57, 'Gauthier', 'Sarah', 'sarah.gauthier@example.com', '$2y$10$0755cb3e1e6c54d9d2f91b9096051a7f5cf8621cb474c75a3a2be', 'client'),
(58, 'Michaud', 'André', 'andre.michaud@example.com', '$2y$10$222950f830142fbf4397f7bb295cf0b4f5532b158bc8dd6cc34c0', 'client'),
(59, 'Leclercq', 'Lucie', 'lucie.leclercq@example.com', '$2y$10$48046fbb3e8f6abd06a2e154235ee59deeecb6b99a828b5fa0add', 'client'),
(60, 'Client', 'test', 'client.tets@test.st', '$2y$10$3e5bbd7bcdbcc13153b735a042dcb5a9fe7807acbcb2b6f0c50f4', 'Client');

-- --------------------------------------------------------

--
-- Structure de la table `voyageur`
--

CREATE TABLE `voyageur` (
  `id_BateauVoyageur` int(11) NOT NULL,
  `id_Bateau` int(11) NOT NULL,
  `Voyageur` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `voyageur`
--

INSERT INTO `voyageur` (`id_BateauVoyageur`, `id_Bateau`, `Voyageur`) VALUES
(2, 2, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrerliaison`
--
ALTER TABLE `administrerliaison`
  ADD PRIMARY KEY (`id_Utilisateur`,`id_Liaison`),
  ADD KEY `FK_AdministrerLiaison_id_Liaison` (`id_Liaison`);

--
-- Index pour la table `bateau`
--
ALTER TABLE `bateau`
  ADD PRIMARY KEY (`id_Bateau`);

--
-- Index pour la table `bateaufret`
--
ALTER TABLE `bateaufret`
  ADD PRIMARY KEY (`id_Bateaufret`);

--
-- Index pour la table `bateauvoyageur`
--
ALTER TABLE `bateauvoyageur`
  ADD PRIMARY KEY (`id_BateauVoyageur`),
  ADD KEY `FK_BateauVoyageur_id_Image` (`id_Image`);

--
-- Index pour la table `categorietarif`
--
ALTER TABLE `categorietarif`
  ADD PRIMARY KEY (`Lettre_identification`);

--
-- Index pour la table `equipement`
--
ALTER TABLE `equipement`
  ADD PRIMARY KEY (`id_Equipement`);

--
-- Index pour la table `equipementbateau`
--
ALTER TABLE `equipementbateau`
  ADD PRIMARY KEY (`id_BateauVoyageur`,`id_Equipement`),
  ADD KEY `FK_EquipementBateau_id_Equipement` (`id_Equipement`);

--
-- Index pour la table `fret`
--
ALTER TABLE `fret`
  ADD PRIMARY KEY (`id_Bateaufret`,`id_Bateau`),
  ADD KEY `FK_Fret_id_Bateau` (`id_Bateau`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id_Image`);

--
-- Index pour la table `liaison`
--
ALTER TABLE `liaison`
  ADD PRIMARY KEY (`id_Liaison`);

--
-- Index pour la table `periode`
--
ALTER TABLE `periode`
  ADD PRIMARY KEY (`id_Periode`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_Reservation`),
  ADD KEY `FK_Reservation_id_Traversee` (`id_Traversee`),
  ADD KEY `FK_Reservation_id_Utilisateur` (`id_Utilisateur`);

--
-- Index pour la table `reservationtarif`
--
ALTER TABLE `reservationtarif`
  ADD PRIMARY KEY (`id_Reservation`,`id_TypeTarif`,`id_Periode`,`id_Liaison`,`Lettre_identification`),
  ADD KEY `FK_ReservationTarif_id_TypeTarif` (`id_TypeTarif`),
  ADD KEY `FK_ReservationTarif_Lettre_identifiaction` (`Lettre_identification`),
  ADD KEY `FK_ReservationTarif_id_Periode` (`id_Periode`),
  ADD KEY `Fk_ReservationTarif_id_Liaison` (`id_Liaison`);

--
-- Index pour la table `tarifliaison`
--
ALTER TABLE `tarifliaison`
  ADD PRIMARY KEY (`id_Liaison`,`id_TypeTarif`,`Lettre_identification`,`id_Periode`),
  ADD KEY `FK_TarifLiaison_id_TypeTarif` (`id_TypeTarif`),
  ADD KEY `FK_TarifLiaison_Lettre_identification` (`Lettre_identification`),
  ADD KEY `FK_TarifLiaison_id_Periode` (`id_Periode`);

--
-- Index pour la table `traversee`
--
ALTER TABLE `traversee`
  ADD PRIMARY KEY (`id_Traversee`),
  ADD KEY `FK_Traversee_id_Bateau` (`id_Bateau`),
  ADD KEY `FK_Traversee_id_Liaison` (`id_Liaison`);

--
-- Index pour la table `typetarif`
--
ALTER TABLE `typetarif`
  ADD PRIMARY KEY (`id_TypeTarif`,`Lettre_identification`),
  ADD KEY `FK_TypeTarif_Lettre_identification` (`Lettre_identification`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_Utilisateur`);

--
-- Index pour la table `voyageur`
--
ALTER TABLE `voyageur`
  ADD PRIMARY KEY (`id_BateauVoyageur`,`id_Bateau`),
  ADD KEY `FK_Voyageur_id_Bateau` (`id_Bateau`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrerliaison`
--
ALTER TABLE `administrerliaison`
  MODIFY `id_Utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `bateau`
--
ALTER TABLE `bateau`
  MODIFY `id_Bateau` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `bateaufret`
--
ALTER TABLE `bateaufret`
  MODIFY `id_Bateaufret` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `bateauvoyageur`
--
ALTER TABLE `bateauvoyageur`
  MODIFY `id_BateauVoyageur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `equipement`
--
ALTER TABLE `equipement`
  MODIFY `id_Equipement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `equipementbateau`
--
ALTER TABLE `equipementbateau`
  MODIFY `id_BateauVoyageur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `fret`
--
ALTER TABLE `fret`
  MODIFY `id_Bateaufret` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id_Image` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `liaison`
--
ALTER TABLE `liaison`
  MODIFY `id_Liaison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `periode`
--
ALTER TABLE `periode`
  MODIFY `id_Periode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_Reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `reservationtarif`
--
ALTER TABLE `reservationtarif`
  MODIFY `id_Reservation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `tarifliaison`
--
ALTER TABLE `tarifliaison`
  MODIFY `id_Liaison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `traversee`
--
ALTER TABLE `traversee`
  MODIFY `id_Traversee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_Utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT pour la table `voyageur`
--
ALTER TABLE `voyageur`
  MODIFY `id_BateauVoyageur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrerliaison`
--
ALTER TABLE `administrerliaison`
  ADD CONSTRAINT `FK_AdministrerLiaison_id_Liaison` FOREIGN KEY (`id_Liaison`) REFERENCES `liaison` (`id_Liaison`),
  ADD CONSTRAINT `FK_AdministrerLiaison_id_Utilisateur` FOREIGN KEY (`id_Utilisateur`) REFERENCES `utilisateur` (`id_Utilisateur`);

--
-- Contraintes pour la table `bateauvoyageur`
--
ALTER TABLE `bateauvoyageur`
  ADD CONSTRAINT `FK_BateauVoyageur_id_Image` FOREIGN KEY (`id_Image`) REFERENCES `image` (`id_Image`);

--
-- Contraintes pour la table `equipementbateau`
--
ALTER TABLE `equipementbateau`
  ADD CONSTRAINT `FK_EquipementBateau_id_BateauVoyageur` FOREIGN KEY (`id_BateauVoyageur`) REFERENCES `bateauvoyageur` (`id_BateauVoyageur`),
  ADD CONSTRAINT `FK_EquipementBateau_id_Equipement` FOREIGN KEY (`id_Equipement`) REFERENCES `equipement` (`id_Equipement`);

--
-- Contraintes pour la table `fret`
--
ALTER TABLE `fret`
  ADD CONSTRAINT `FK_Fret_id_Bateau` FOREIGN KEY (`id_Bateau`) REFERENCES `bateau` (`id_Bateau`),
  ADD CONSTRAINT `FK_Fret_id_Bateaufret` FOREIGN KEY (`id_Bateaufret`) REFERENCES `bateaufret` (`id_Bateaufret`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `FK_Reservation_id_Traversee` FOREIGN KEY (`id_Traversee`) REFERENCES `traversee` (`id_Traversee`),
  ADD CONSTRAINT `FK_Reservation_id_Utilisateur` FOREIGN KEY (`id_Utilisateur`) REFERENCES `utilisateur` (`id_Utilisateur`);

--
-- Contraintes pour la table `reservationtarif`
--
ALTER TABLE `reservationtarif`
  ADD CONSTRAINT `FK_ReservationTarif_Lettre_identifiaction` FOREIGN KEY (`Lettre_identification`) REFERENCES `categorietarif` (`Lettre_identification`),
  ADD CONSTRAINT `FK_ReservationTarif_id_Periode` FOREIGN KEY (`id_Periode`) REFERENCES `periode` (`id_Periode`),
  ADD CONSTRAINT `FK_ReservationTarif_id_Reservation` FOREIGN KEY (`id_Reservation`) REFERENCES `reservation` (`id_Reservation`),
  ADD CONSTRAINT `FK_ReservationTarif_id_TypeTarif` FOREIGN KEY (`id_TypeTarif`) REFERENCES `typetarif` (`id_TypeTarif`),
  ADD CONSTRAINT `Fk_ReservationTarif_id_Liaison` FOREIGN KEY (`id_Liaison`) REFERENCES `liaison` (`id_Liaison`);

--
-- Contraintes pour la table `tarifliaison`
--
ALTER TABLE `tarifliaison`
  ADD CONSTRAINT `FK_TarifLiaison_Lettre_identification` FOREIGN KEY (`Lettre_identification`) REFERENCES `categorietarif` (`Lettre_identification`),
  ADD CONSTRAINT `FK_TarifLiaison_id_Liaison` FOREIGN KEY (`id_Liaison`) REFERENCES `liaison` (`id_Liaison`),
  ADD CONSTRAINT `FK_TarifLiaison_id_Periode` FOREIGN KEY (`id_Periode`) REFERENCES `periode` (`id_Periode`),
  ADD CONSTRAINT `FK_TarifLiaison_id_TypeTarif` FOREIGN KEY (`id_TypeTarif`) REFERENCES `typetarif` (`id_TypeTarif`);

--
-- Contraintes pour la table `traversee`
--
ALTER TABLE `traversee`
  ADD CONSTRAINT `FK_Traversee_id_Bateau` FOREIGN KEY (`id_Bateau`) REFERENCES `bateau` (`id_Bateau`),
  ADD CONSTRAINT `FK_Traversee_id_Liaison` FOREIGN KEY (`id_Liaison`) REFERENCES `liaison` (`id_Liaison`);

--
-- Contraintes pour la table `typetarif`
--
ALTER TABLE `typetarif`
  ADD CONSTRAINT `FK_TypeTarif_Lettre_identification` FOREIGN KEY (`Lettre_identification`) REFERENCES `categorietarif` (`Lettre_identification`);

--
-- Contraintes pour la table `voyageur`
--
ALTER TABLE `voyageur`
  ADD CONSTRAINT `FK_Voyageur_id_Bateau` FOREIGN KEY (`id_Bateau`) REFERENCES `bateau` (`id_Bateau`),
  ADD CONSTRAINT `FK_Voyageur_id_BateauVoyageur` FOREIGN KEY (`id_BateauVoyageur`) REFERENCES `bateauvoyageur` (`id_BateauVoyageur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
