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


data$%ProduitsFrais <- rowSums(data[2:7])




str(data)