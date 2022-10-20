-- Active: 1664372619408@@127.0.0.1@3306@fil_rouge
USE fil_rouge;


 INSERT INTO utilisateur (utilisateur_id,`utilisateur_prenom`,`utilisateur_nom`,`utilisateur_sexe`,`utilisateur_role`,`utilisateur_telephone`,`utilisateur_mdp`,`utilisateur_date_de_naissance`)
VALUES
  (1,"Zephania","Henry","H","quis","01 83 73 18 74","FO0542590528842001","21-07-22"),
  (2,"Sade","Blake","H","per","06 26 17 47 78","HR9093298463836368437","12-02-23"),
  (3,"Maxine","Forrest","F","ac","08 87 65 50 38","LV62CSXV2703632014532","21-06-23"),
  (4,"Timon","August","F","justo","07 54 47 74 35","LU397734968704775449","30-12-22"),
  (5,"Maggie","Brody","F","elit.","04 32 57 38 10","TR858167148045856982271724","31-10-21");

INSERT INTO promo (promo_id,`promo_taux`,`promo_code`,`promo_frais`,`promo_date_debut`,`promo_date_fin`,`promo_montant`,`promo_reduction_valeur`,promo_pourcentage_valeur)
VALUES
  (1,"6","43",180328856,"20.09.23","07.09.23",387,690,21),
  (2,"8","67",447375108,"14.08.22","21.11.22",528,20,88),
  (3,"16","59",481000539,"28.12.22","16.05.22",122,151,86),
  (4,"16","1",405135088,"18.09.23","10.01.22",28,644,2),
  (5,"6","89",401723710,"05.07.22","26.02.23",597,64,66);

INSERT INTO Fournisseur_Constructeur(`fournisseur_id`,`fournisseur_pays`,`fournisseur_appartement`,`fournisseur_numero`,`fournisseur_nom`,`fournisseur_telephone`,`fournisseur_ville`,`fournisseur_rue`,`fournisseur_mail`,`fournisseur_batiment`)
VALUES
  (1,"Netherlands","301-6985 Cras Av.",32,"Mauris Ut Mi Institute","03 38 13 50 35","Burnie","P.O. Box 235, 4961 Sed Ave","nec@icloud.edu","17"),
  (2,"France","235-293 Egestas Rd.",27,"Ornare Sagittis Felis Foundation","05 41 48 58 91","South Perth","472-4825 Id, Avenue","nam@google.couk","17"),
  (3,"Belgium","P.O. Box 774, 9584 In Ave",13,"Diam Corp.","09 18 63 74 11","Boulogne-sur-Mer","P.O. Box 682, 1680 Dui Ave","proin.eget.odio@google.edu","7"),
  (4,"Germany","Ap #644-8501 Nec Rd.",23,"Ipsum Suspendisse PC","08 65 45 75 56","Borås","9973 Est, Rd.","vel@yahoo.ca","13"),
  (5,"China","P.O. Box 379, 7052 Consectetuer Ave",14,"Elementum Lorem Company","08 18 52 18 25","Pervomaisk","Ap #809-6375 Natoque Rd.","interdum.sed.auctor@outlook.net","1");


INSERT INTO categorie (`categorie_nom`,categorie_id,`categorie_type`)
VALUES
  ("Homme",1,"Type1"),
  ("Femme",2,"Type2"),
  ("Enfant",3,"Type3");


INSERT INTO sous_categorie (sous_categorie_id,`sous_categorie_nom`,`sous_categorie_type`, categorie_id)
VALUES
  (1,"Diovan","pies",1),
  (2,"Glipizide","sandwiches",2),
  (3,"Paroxetine HCl","soups",3),
  (4,"Amoxicillin","pies",3),
  (5,"Potassium Chloride","pies",2);

INSERT INTO adresse(adresse_id , adresse_1 , adresse_2 , adresse_3 , code_postale , ville , pays, utilisateur_id)
VALUES
(1 , "30" , "rue jean marie" , "appartement 12" , "80000" , "Amiens" , "France",1),
(2 , "15" , "rue de la paix" , "appartement 1" , "75000" , "Paris" , "France",2),
(3 , "2" , "rue de la republique" , "appartement 6" , "38000" , "grenoble" , "France",3),
(4 , "15" , "rue des mohamed" , NULL , "45000" , "Moncul" , "France",4);

INSERT INTO commande(commande_id , commande_statut , moyen_reglement , paye , facturation_date , commande_date , adresse_id , utilisateur_id , adresse_id_1)
VALUES
(1 , "En cours de livraison" , "CB" , "Y" , "2022-06-12" , "2022-06-12",1 ,1 ,1 ),
(2, "Pas encore envoyer" , "PayPal" , "Y" , "2021-05-14" , "2021-05-14",2,2,2),
(3 , "Livré" , "CB" , "Y" , "2012-06-12" , "2012-06-12",3,3,3 ),
(4 , "livré" , "cheque" , "N" , NULL, "1995-05-11",4,4,4),
(5 , "recu" , "CB" , "Y" , "2022-05-11", "2022-05-11",2,2,2);


  INSERT INTO produit (produit_id,`produit_nom`,`produit_en_stock`,`produit_description`,`produit_image`,`produit_actif`,`produit_tva` , sous_categorie_id , fournisseur_id)
VALUES
  (1,"yellow",59,"Customer Relations","Adobe","0",17,2,1),
  (2,"violet",58,"Human Resources","Finale","1",5,3,2),
  (3,"orange",10,"Public Relations","Yahoo","1",9,1,2),
  (4,"indigo",50,"Media Relations","Finale","0",7,4,3),
  (5,"green",71,"Accounting","Sibelius","0",17,3,4);

 INSERT INTO detail_commande(detail_de_commande_id , detail_commande_nom_produit , detail_commande_qt_article , detail_commande_prix_ht , detail_commande_prix_ttc , produit_id , commande_id)
 VALUES
 (1 , "Sneakers" , 3 , 75 , 120 , 4 , 2),
 (2 , "Converse" , 6  , 600 , 800 , 3 ,1),
 (3 , "Bottes" , 2 , 150 , 200,2 ,3),
 (4 , "running" , 1 , 300 , 350,1 ,4);


 INSERT INTO livraison(livraison_id , livraison_statut , livraison_date_depart , livraison_date , commande_id)
 VALUES
 (1 , "Y" , "2022-05-17" , "2022-06-01" ,4),
 (2 , "N" , NULL , NULL,3),
 (3 , "Y" , "2021-05-12" , "2022-05-30",2),
 (4 , "Y" , "2020-06-15","2022-06-30",1);

 INSERT INTO livraison_detail(detail_de_livraison_id , quantite_produit_livre , livraison_id , detail_de_commande_id)
 VALUES
 (1 , 3 ,1 ,2),
 (2,5,3,4),
 (3,4,2,3),
 (4,1,1,4);
 INSERT INTO deduit(commande_id , promo_id)
 VALUES
 (1 ,2),
 (2, 4),
 (3, 3),
 (4, 5);