-- Active: 1664372619408@@127.0.0.1@3306@fil_rouge
CREATE VIEW v_ProduitFournis AS
SELECT produit.* , fournisseur_appartement , fournisseur_batiment  , fournisseur_mail , fournisseur_nom , fournisseur_numero , fournisseur_pays , fournisseur_rue , fournisseur_telephone , fournisseur_ville
FROM produit
JOIN Fournisseur_Constructeur fc ON fc.fournisseur_id = produit.fournisseur_id; 
DROP VIEW `v_ProduitFourni`;

SELECT * FROM `v_ProduitFournis`;