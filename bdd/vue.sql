-- Active: 1664372619408@@127.0.0.1@3306@fil_rouge

--------------------------------VUE1----------------------------------------
CREATE VIEW v_ProduitFourni
as
SELECT produit_actif, produit_description, produit_en_stock, produit_id, produit_image, produit_nom, produit_tva, sous_categorie_id, fc.fournisseur_id fournisseur_appartement,fournisseur_batiment,fournisseur_mail,fournisseur_nom,fournisseur_numero,fournisseur_rue,fournisseur_telephone, fournisseur_ville, fournisseur_pays FROM produit
JOIN `Fournisseur_Constructeur` fc on fc.fournisseur_id = produit.fournisseur_id;

SELECT * from v_ProduitFourni;

-------------------------------VUE2-----------------------------------------
CREATE view v_ProduitScCategorie
as
SELECT produit.*, sous_categorie_nom , sous_categorie_type, categorie_nom, categorie_type  from produit
join sous_categorie sc on sc.sous_categorie_id = produit.sous_categorie_id 
join categorie on categorie.categorie_id = sc.categorie_id ;

SELECT * FROM v_ProduitScCategorie;

--------------------------- PROCEDURE STOCKEE------------------------------
CREATE PROCEDURE  commande_statut (IN commande_non_solde VARCHAR(50))
BEGIN
SELECT * FROM commande
WHERE commande_statut = commande_non_solde;
END;

CALL commande_statut('En cours de livraison')