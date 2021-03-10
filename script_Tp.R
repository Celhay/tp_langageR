# Introduction : Chargement du fichier csv
url <- ("D:/Epsi/EPSI I5/language R/tp/")
data <- read.csv("D:/Epsi/EPSI I5/language R/tp/ventes.csv")
names(data) <- c("Canal","Region","ProduitsFrais","Lait","Epicerie","Surgele","Detergents","Traiteur")

# Partie 1 :
	#Suppression de la colonne Canal
data$Canal <- NULL

	#Ajout colonne Total de tout le tableau 
#data$Total <- sum(as.numeric(data$ProduitsFrais,data$Lait,data$Epicerie,data$Surgele,data$Detergents,data$Traiteur))
	#Ajout colonne Total de chaque colonne sauf Région
data$TotalColonne <- rowSums(data[2:7])

	#Ajout colonne pourcentage de chiffre d’affaires des produits suivants : 
data$PourcentageProduitsFrais <- data$ProduitsFrais * 100 / data$TotalColonne
data$PourcentageLait <- data$Lait * 100 / data$TotalColonne
data$PourcentageEpicerie <- data$Epicerie * 100 / data$TotalColonne
data$PourcentageSurgele <- data$Surgele * 100 / data$TotalColonne
data$PourcentageDetergents <- data$Detergents * 100 / data$TotalColonne
data$PourcentageTraiteur <- data$Traiteur * 100 / data$TotalColonne

str(data)