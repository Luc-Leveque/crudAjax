-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Mar 26 Novembre 2019 à 09:53
-- Version du serveur :  5.6.36
-- Version de PHP :  7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `formation`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedureSelect` (IN `idUser` INT, OUT `log` VARCHAR(50))  BEGIN 
SELECT login into log FROM user WHERE id_user = idUser ;
   END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `id_activite` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `prenom` varchar(150) NOT NULL,
  `adresse` varchar(250) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `civilite` char(1) DEFAULT NULL,
  `numero` char(5) NOT NULL,
  `id_ville` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `adresse`, `date_naissance`, `civilite`, `numero`, `id_ville`) VALUES
(4, 'DUPOND', 'Paul', '11 rue de la liberté', '2000-01-14', NULL, '1234', 1),
(5, 'LA FONTAINE', 'Pierre', '1 avenue de Paris', '1990-12-10', NULL, '1235', 2),
(7, 'Dessard', 'Chris', '4 rue de Londres', NULL, 'M', '1237', 3),
(8, 'Farou', 'Joelle', '4 rue de Londres', NULL, 'F', '1238', 3),
(10, 'DESSARD', 'Laura', '5 rue de la liberté', NULL, 'F', '12310', 18),
(17, 'LEGRAND', 'Louis', '', NULL, NULL, '12317', NULL),
(18, 'ZADI', 'Joachim', NULL, NULL, 'M', '12318', NULL),
(19, 'HAGHIGHI', 'David', NULL, NULL, 'M', '12319', NULL),
(20, 'DEBLANGY', 'Claude', NULL, NULL, 'M', '12320', NULL),
(21, 'T.', 'Merlin', NULL, NULL, 'M', '12321', NULL),
(22, 'SANDRO', 'Rossi', NULL, NULL, 'M', '12322', NULL),
(23, 'KELMOH', 'Landry', NULL, NULL, 'M', '12323', NULL),
(24, 'ELALAMA', 'Mohamed', NULL, NULL, 'M', '12324', NULL),
(25, 'ATTAL', 'David', NULL, NULL, 'M', '12325', NULL),
(26, 'MATSIMA', 'Constant', NULL, NULL, 'M', '12326', NULL),
(27, 'OMARI', 'Youssef', NULL, NULL, 'M', '12327', NULL),
(28, 'RENAUD', 'Claude', NULL, NULL, 'M', '12328', NULL),
(29, 'EZZAT', 'Tarek', NULL, NULL, 'M', '12329', 2),
(30, 'ZOME', 'Christophe', '151 avenue de la république', '1992-07-16', 'M', '12330', 2),
(31, 'RODRIGUES JR.', 'Sidnei', '', NULL, 'M', '12331', 1),
(32, 'FEUZEU', 'Thierry', '', NULL, 'M', '12332', NULL),
(33, 'GRECEANU', 'Vincent', '', NULL, 'M', '12333', NULL),
(34, 'BOUKEBECHE', 'Madani', NULL, NULL, 'M', '12334', 1);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `numero` char(5) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `date_commande`, `numero`, `id_client`) VALUES
(1, '2018-09-01', '00001', 7),
(2, '2018-09-11', '00002', 7),
(5, '2018-12-28', '00003', 18),
(6, '2018-12-31', '00004', 18),
(7, '2018-12-25', '00005', 4),
(8, '2018-11-11', '00006', 10);

-- --------------------------------------------------------

--
-- Structure de la table `commande_produit`
--

CREATE TABLE `commande_produit` (
  `id_produit` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire` decimal(15,0) DEFAULT NULL,
  `taux_remise` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `commande_produit`
--

INSERT INTO `commande_produit` (`id_produit`, `id_commande`, `quantite`, `prix_unitaire`, `taux_remise`) VALUES
(1, 6, 1, '999', 0),
(3, 1, 1, '899', 0),
(3, 2, 2, '899', 10),
(4, 5, 2, '750', 0),
(5, 7, 2, '799', 0),
(9, 1, 2, '1299', 0),
(9, 8, 4, '45', 5),
(10, 5, 3, '255', 0),
(10, 7, 2, '255', 0),
(11, 6, 11, '299', 0),
(13, 1, 1, '429', 0),
(13, 5, 1, '429', 0),
(15, 7, 5, '499', 0),
(17, 2, 10, '29', 20),
(17, 5, 5, '29', 0),
(17, 7, 3, '29', 0);

-- --------------------------------------------------------

--
-- Structure de la table `droit`
--

CREATE TABLE `droit` (
  `chemin` varchar(255) NOT NULL,
  `id_user` int(11) NOT NULL,
  `type_droit` set('LECTURE','ECRITURE') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `droit`
--

INSERT INTO `droit` (`chemin`, `id_user`, `type_droit`) VALUES
('/depot', 3, 'LECTURE'),
('/depot', 4, 'ECRITURE'),
('/depot', 5, 'LECTURE,ECRITURE'),
('/dossier_principal', 2, 'LECTURE'),
('/dossier_principal/diaz', 4, 'LECTURE,ECRITURE'),
('/dossier_principal/dossier_pl', 2, 'LECTURE,ECRITURE');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id_facture` int(11) NOT NULL,
  `date_facture` date DEFAULT NULL,
  `numero` varchar(10) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `id_paiement` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `facture`
--

INSERT INTO `facture` (`id_facture`, `date_facture`, `numero`, `id_commande`, `id_paiement`) VALUES
(2, '2018-10-01', '12345', 1, 1),
(3, '2018-10-04', '12346', 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id_fournisseur` int(11) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `id_ville` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `fournisseur`
--

INSERT INTO `fournisseur` (`id_fournisseur`, `nom`, `id_ville`) VALUES
(1, 'MSI', 22),
(2, 'HP', 3),
(3, 'Dell', 2),
(4, 'Sony', 19),
(5, 'Apple', 3),
(6, 'Samsung', 1);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE `livraison` (
  `id_livraison` int(11) NOT NULL,
  `mode` varchar(10) NOT NULL,
  `date_livraison` date DEFAULT NULL,
  `id_facture` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `maire`
--

CREATE TABLE `maire` (
  `id_maire` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `id_ville` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `maire`
--

INSERT INTO `maire` (`id_maire`, `nom`, `prenom`, `id_ville`) VALUES
(1, 'Le maire', 'Gentil', 1),
(2, 'Le maire2', 'Gentil', 2),
(3, 'Le maire3', 'Gentil', 3),
(4, 'Le maire11', 'Gentil', 11),
(5, 'Le maire18', 'Gentil', 18),
(6, 'Le maire19', 'Gentil', 19),
(7, 'Le maire20', 'Gentil', 20),
(8, 'Le maire21', 'Gentil', 21),
(9, 'Le maire22', 'Gentil', 22),
(10, 'Le maire23', 'Gentil', 23);

-- --------------------------------------------------------

--
-- Structure de la table `paierment`
--

CREATE TABLE `paierment` (
  `id_paiement` int(11) NOT NULL,
  `type_paiement` varchar(50) NOT NULL,
  `date_paiement` date DEFAULT NULL,
  `id_facture` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `paierment`
--

INSERT INTO `paierment` (`id_paiement`, `type_paiement`, `date_paiement`, `id_facture`) VALUES
(1, 'CB', '2018-10-01', 2),
(2, 'CHEQUE', '2018-10-03', 3);

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `code_pays` char(2) NOT NULL,
  `nom` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `pays`
--

INSERT INTO `pays` (`code_pays`, `nom`) VALUES
('FR', 'France'),
('UK', 'Royaume uni');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `libelle` varchar(150) NOT NULL,
  `prix_unitaire` decimal(15,3) NOT NULL,
  `reference` char(8) NOT NULL,
  `id_fournisseur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `libelle`, `prix_unitaire`, `reference`, `id_fournisseur`) VALUES
(1, 'PC Gamer', '999.000', 'MSIG111', 1),
(2, 'PC Gamer Killer', '1499.000', 'MSIGK12', 1),
(3, 'MSI Start', '899.000', 'MSIS01', 1),
(4, 'HP Pavillon', '750.000', 'HP1566', 2),
(5, 'HP Pavilion x360', '799.000', '11107712', 2),
(8, 'PC Gamer HP OMEN 17', '1099.000', 'an122nf', 2),
(9, 'PC Gamer HP OMEN 17', '1299.000', 'an106nf', 2),
(10, 'Imprimante lazer', '255.000', 'HPLZ123', 2),
(11, 'HP Jetencre Photosmart', '299.000', 'HPPS221', 2),
(12, 'Souris fast', '39.000', 'HP 721', 2),
(13, 'HP Ecran 21"', '429.000', 'HPS21', 2),
(14, 'Souris sans fil 5 boutons', '67.000', 'MSIM1251', 1),
(15, 'Ecran ultra rapide', '499.000', 'MSISUS', 1),
(16, 'HP Ecran extra plat 25"', '535.000', 'HPSUF', 2),
(17, 'Souris 3 boutons', '29.000', 'HPMB111', 2),
(19, 'Cartouche Encre HP JET Boir', '45.000', 'HPPS221N', 2);

-- --------------------------------------------------------

--
-- Structure de la table `produit_categorie`
--

CREATE TABLE `produit_categorie` (
  `id_categorie` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `responsable`
--

CREATE TABLE `responsable` (
  `id_responsable` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `id_service` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE `service` (
  `id_service` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `id_activite` int(11) NOT NULL,
  `id_responsable` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `societe`
--

CREATE TABLE `societe` (
  `id_societe` bigint(11) NOT NULL,
  `nom` varchar(250) DEFAULT NULL,
  `complement_nom` varchar(250) DEFAULT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `mail` varchar(150) DEFAULT NULL,
  `id_ville` bigint(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `societe`
--

INSERT INTO `societe` (`id_societe`, `nom`, `complement_nom`, `telephone`, `adresse`, `mail`, `id_ville`) VALUES
(1, 'Solutec', 'Paris', NULL, NULL, NULL, 3),
(2, 'Solutec', 'Lyon', NULL, NULL, NULL, 2),
(3, 'Fekra', NULL, NULL, NULL, NULL, 1),
(4, 'Sogeti', NULL, NULL, NULL, NULL, 3),
(5, 'Esic', NULL, '01 66 55 44 88', '36 Avenue Pierre Brossolette', 'esic@esic.fr', 20),
(6, 'Pokemon Inc', '', '', '24 rue des Lilas', 'pika@pokemon.fr', 11);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `login` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `profil` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `login`, `nom`, `password`, `prenom`, `email`, `profil`) VALUES
(1, 'dp', 'Dupond', 'abc', 'Paul', 'dp@gmail.com', b'1'),
(2, 'nouveau login', 'Un user', 'azerty', 'david', 'pl@yahoo.fr', b'1'),
(3, 'legrand', 'Le Grand', 'unMotdePass', 'Pierre', 'legrand@free.fr', b'0'),
(4, 'diaz', 'Diaz', 'dzl', 'Laura', 'ldz@laposte.net', b'1'),
(5, 'chris', 'Dessard', 'lemdp', 'Chris', 'dessard@gmail.com', b'0'),
(6, 'pif', 'Le Petit', 'fip', 'alexandra', 'pp@laposte.net', b'0'),
(7, 'utilis', 'utilisateur', 'abc', 'Un nouvel', 'utilis@gmail.com', b'0'),
(9, 'zj', 'Zadi', 'jo', 'Jose', 'jozadi@gmail.com', b'1'),
(10, 'Lenouveau', 'LE NOUVEAU', 'mdp', 'Patrick', 'lenouveau@gmail.com', b'0'),
(12, 'zj', 'Zadi', 'jo', 'Joe', 'joezadi@gmail.com', b'1'),
(13, 'zj', 'Zadi', 'Paul', 'Jose', 'jozadi8@gmail.com', b'1'),
(14, 'Paula', 'Dupont', 'Pauld', 'Paula', 'paulad@gmail.com', b'1'),
(16, 'Paula', 'Dupont', 'Pauld', 'Pauline', 'pauline@gmail.com', b'1'),
(17, 'Paula', 'Dupont', 'Pauld', 'Paulina', 'paulina@gmail.com', b'1');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_client` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `actif` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_client`, `login`, `password`, `email`, `actif`) VALUES
(4, 'paul', 'abc', 'dp@gmail.com', 1),
(7, 'christo', 'cd', 'chis.d@tivipro.tv', 1),
(10, 'luara', 'azerty', 'laura@laposte.fr', 1);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE `ville` (
  `id_ville` bigint(20) NOT NULL,
  `nom` varchar(150) NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `code_pays` char(2) DEFAULT NULL,
  `id_maire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ville`
--

INSERT INTO `ville` (`id_ville`, `nom`, `code_postal`, `code_pays`, `id_maire`) VALUES
(1, 'Malakoff', '92240', 'FR', 1),
(2, 'Lyon', '69003', 'FR', 2),
(3, 'Paris', '75008', 'FR', 3),
(11, 'Manchester', 'M11BA', 'UK', 4),
(18, 'Paris', '75014', 'FR', 5),
(19, 'Paris', '75001', 'FR', 6),
(20, 'Montrouge', '92120', 'FR', 7),
(21, 'Lyon', '69009', 'FR', 8),
(22, 'Londres', 'SW1X', 'UK', 9),
(23, 'Liverpool', 'L1OAA', 'UK', 10);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`id_activite`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD KEY `id_ville` (`id_ville`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD KEY `Commande_Client_FK` (`id_client`);

--
-- Index pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD PRIMARY KEY (`id_produit`,`id_commande`),
  ADD KEY `commande_produit_Commande0_FK` (`id_commande`);

--
-- Index pour la table `droit`
--
ALTER TABLE `droit`
  ADD PRIMARY KEY (`chemin`,`id_user`),
  ADD KEY `FK_user` (`id_user`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id_facture`),
  ADD UNIQUE KEY `facture_Commande0_AK` (`id_commande`),
  ADD UNIQUE KEY `facture_paierment1_AK` (`id_paiement`);

--
-- Index pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id_fournisseur`),
  ADD KEY `fournisseur_ville_FK` (`id_ville`);

--
-- Index pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD PRIMARY KEY (`id_livraison`),
  ADD UNIQUE KEY `livraison_facture0_AK` (`id_facture`);

--
-- Index pour la table `maire`
--
ALTER TABLE `maire`
  ADD PRIMARY KEY (`id_maire`),
  ADD UNIQUE KEY `maire_ville0_AK` (`id_ville`);

--
-- Index pour la table `paierment`
--
ALTER TABLE `paierment`
  ADD PRIMARY KEY (`id_paiement`),
  ADD UNIQUE KEY `paierment_facture0_AK` (`id_facture`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`code_pays`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD UNIQUE KEY `reference` (`reference`),
  ADD KEY `Produit_fournisseur_FK` (`id_fournisseur`);

--
-- Index pour la table `produit_categorie`
--
ALTER TABLE `produit_categorie`
  ADD PRIMARY KEY (`id_categorie`,`id_produit`),
  ADD KEY `produit_categorie_Produit1_FK` (`id_produit`);

--
-- Index pour la table `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`id_responsable`),
  ADD UNIQUE KEY `responsable_service0_AK` (`id_service`);

--
-- Index pour la table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id_service`),
  ADD UNIQUE KEY `service_activite0_AK` (`id_activite`),
  ADD UNIQUE KEY `service_responsable1_AK` (`id_responsable`);

--
-- Index pour la table `societe`
--
ALTER TABLE `societe`
  ADD PRIMARY KEY (`id_societe`),
  ADD KEY `FK_societe_id_ville` (`id_ville`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `login` (`login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`id_ville`),
  ADD UNIQUE KEY `ville_maire0_AK` (`id_maire`),
  ADD KEY `idx_code_pays` (`code_pays`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `id_activite` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `id_facture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `livraison`
--
ALTER TABLE `livraison`
  MODIFY `id_livraison` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `maire`
--
ALTER TABLE `maire`
  MODIFY `id_maire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `paierment`
--
ALTER TABLE `paierment`
  MODIFY `id_paiement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `responsable`
--
ALTER TABLE `responsable`
  MODIFY `id_responsable` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `service`
--
ALTER TABLE `service`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `societe`
--
ALTER TABLE `societe`
  MODIFY `id_societe` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `ville`
--
ALTER TABLE `ville`
  MODIFY `id_ville` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_ville` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `Commande_Client_FK` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `commande_produit`
--
ALTER TABLE `commande_produit`
  ADD CONSTRAINT `commande_produit_Commande0_FK` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `commande_produit_Produit_FK` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`);

--
-- Contraintes pour la table `droit`
--
ALTER TABLE `droit`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_Commande0_FK` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `facture_paierment1_FK` FOREIGN KEY (`id_paiement`) REFERENCES `paierment` (`id_paiement`);

--
-- Contraintes pour la table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD CONSTRAINT `fournisseur_ville_FK` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`);

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `livraison_facture0_FK` FOREIGN KEY (`id_facture`) REFERENCES `facture` (`id_facture`);

--
-- Contraintes pour la table `maire`
--
ALTER TABLE `maire`
  ADD CONSTRAINT `maire_ville0_FK` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`);

--
-- Contraintes pour la table `paierment`
--
ALTER TABLE `paierment`
  ADD CONSTRAINT `paierment_facture0_FK` FOREIGN KEY (`id_facture`) REFERENCES `facture` (`id_facture`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `Produit_fournisseur_FK` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id_fournisseur`);

--
-- Contraintes pour la table `produit_categorie`
--
ALTER TABLE `produit_categorie`
  ADD CONSTRAINT `produit_categorie_Categorie0_FK` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`),
  ADD CONSTRAINT `produit_categorie_Produit1_FK` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`);

--
-- Contraintes pour la table `responsable`
--
ALTER TABLE `responsable`
  ADD CONSTRAINT `responsable_service0_FK` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`);

--
-- Contraintes pour la table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_activite0_FK` FOREIGN KEY (`id_activite`) REFERENCES `activite` (`id_activite`),
  ADD CONSTRAINT `service_responsable1_FK` FOREIGN KEY (`id_responsable`) REFERENCES `responsable` (`id_responsable`);

--
-- Contraintes pour la table `societe`
--
ALTER TABLE `societe`
  ADD CONSTRAINT `societe_ibfk_1` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

--
-- Contraintes pour la table `ville`
--
ALTER TABLE `ville`
  ADD CONSTRAINT `ville_ibfk_1` FOREIGN KEY (`code_pays`) REFERENCES `pays` (`code_pays`),
  ADD CONSTRAINT `ville_maire1_FK` FOREIGN KEY (`id_maire`) REFERENCES `maire` (`id_maire`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
