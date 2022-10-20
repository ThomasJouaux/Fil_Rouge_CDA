-- Active: 1664372619408@@127.0.0.1@3306@cp
DROP DATABASE IF EXISTS fil_rouge ;

CREATE DATABASE fil_rouge;

USE fil_rouge;

CREATE TABLE Fournisseur_Constructeur(
   fournisseur_id INT AUTO_INCREMENT,
   fournisseur_pays VARCHAR(40) ,
   fournisseur_appartement VARCHAR(50) ,
   fournisseur_numero VARCHAR(50) ,
   fournisseur_nom VARCHAR(50) ,
   fournisseur_telephone VARCHAR(50) ,
   fournisseur_ville VARCHAR(40) ,
   fournisseur_rue VARCHAR(50) ,
   fournisseur_mail VARCHAR(50) ,
   fournisseur_batiment VARCHAR(50) ,
   PRIMARY KEY(fournisseur_id)
);

CREATE TABLE utilisateur(
   utilisateur_id INT AUTO_INCREMENT,
   utilisateur_prenom VARCHAR(50) ,
   utilisateur_nom VARCHAR(50) ,
   utilisateur_sexe CHAR(1),
   utilisateur_role VARCHAR(50) ,
   utilisateur_telephone VARCHAR(50) ,
   utilisateur_mdp VARCHAR(50) ,
   utilisateur_date_de_naissance VARCHAR(50) ,
   PRIMARY KEY(utilisateur_id)
);

CREATE TABLE promo(
   promo_id INT AUTO_INCREMENT,
   promo_taux VARCHAR(50) ,
   promo_code VARCHAR(50) ,
   promo_frais DECIMAL(15,2)  ,
   promo_date_debut DATETIME,
   promo_date_fin DATETIME,
   promo_montant INT,
   promo_reduction_valeur INT,
   promo_pourcentage_valeur INT,
   PRIMARY KEY(promo_id)
);

CREATE TABLE categorie(
   categorie_id INT AUTO_INCREMENT,
   categorie_nom VARCHAR(50) ,
   categorie_type VARCHAR(50) ,
   PRIMARY KEY(categorie_id)
);

CREATE TABLE adresse(
   adresse_id INT,
   adresse_1 VARCHAR(50) ,
   adresse_2 VARCHAR(50) ,
   adresse_3 VARCHAR(50) ,
   code_postale VARCHAR(50) ,
   ville VARCHAR(50) ,
   pays VARCHAR(50) ,
   utilisateur_id INT NOT NULL,
   PRIMARY KEY(adresse_id),
   FOREIGN KEY(utilisateur_id) REFERENCES utilisateur(utilisateur_id)
);

CREATE TABLE commande(
   commande_id INT AUTO_INCREMENT,
   commande_statut VARCHAR(50) ,
   moyen_reglement VARCHAR(50) ,
   paye CHAR(1),
   facturation_date DATETIME,
   commande_date DATE,
   adresse_id INT NOT NULL,
   utilisateur_id INT NOT NULL,
   adresse_id_1 INT NOT NULL,
   PRIMARY KEY(commande_id),
   FOREIGN KEY(adresse_id) REFERENCES adresse(adresse_id),
   FOREIGN KEY(utilisateur_id) REFERENCES utilisateur(utilisateur_id),
   FOREIGN KEY(adresse_id_1) REFERENCES adresse(adresse_id)
);

CREATE TABLE sous_categorie(
   sous_categorie_id INT,
   sous_categorie_nom VARCHAR(50) ,
   sous_categorie_type VARCHAR(50) ,
   categorie_id INT NOT NULL,
   PRIMARY KEY(sous_categorie_id),
   FOREIGN KEY(categorie_id) REFERENCES categorie(categorie_id)
);

CREATE TABLE livraison(
   livraison_id INT AUTO_INCREMENT,
   livraison_statut CHAR(1),
   livraison_date_depart DATE,
   livraison_date DATE,
   commande_id INT NOT NULL,
   PRIMARY KEY(livraison_id),
   FOREIGN KEY(commande_id) REFERENCES commande(commande_id)
);

CREATE TABLE produit(
   produit_id INT AUTO_INCREMENT,
   produit_nom VARCHAR(50) ,
   produit_en_stock INT,
   produit_description VARCHAR(50) ,
   produit_image VARCHAR(200) ,
   produit_actif BOOLEAN,
   produit_tva INT,
   sous_categorie_id INT NOT NULL,
   fournisseur_id INT NOT NULL,
   PRIMARY KEY(produit_id),
   FOREIGN KEY(sous_categorie_id) REFERENCES sous_categorie(sous_categorie_id),
   FOREIGN KEY(fournisseur_id) REFERENCES Fournisseur_Constructeur(fournisseur_id)
);

CREATE TABLE detail_commande(
   detail_de_commande_id INT,
   detail_commande_nom_produit VARCHAR(50) ,
   detail_commande_qt_article INT,
   detail_commande_prix_ht DECIMAL(15,2)  ,
   detail_commande_prix_ttc DECIMAL(15,2)  ,
   produit_id INT NOT NULL,
   commande_id INT NOT NULL,
   PRIMARY KEY(detail_de_commande_id),
   FOREIGN KEY(produit_id) REFERENCES produit(produit_id),
   FOREIGN KEY(commande_id) REFERENCES commande(commande_id)
);

CREATE TABLE livraison_detail(
   detail_de_livraison_id INT AUTO_INCREMENT,
   quantite_produit_livre INT,
   livraison_id INT NOT NULL,
   detail_de_commande_id INT NOT NULL,
   PRIMARY KEY(detail_de_livraison_id),
   FOREIGN KEY(livraison_id) REFERENCES livraison(livraison_id),
   FOREIGN KEY(detail_de_commande_id) REFERENCES detail_commande(detail_de_commande_id)
);

CREATE TABLE deduit(
   commande_id INT,
   promo_id INT,
   PRIMARY KEY(commande_id, promo_id),
   FOREIGN KEY(commande_id) REFERENCES commande(commande_id),
   FOREIGN KEY(promo_id) REFERENCES promo(promo_id)
);
