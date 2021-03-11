#Loubiou Remi
#Marty Florian
#Mestreau Marine


# Introduction : Chargement du fichier csv
# /!\ Avant de commencer il faut changer le chemin vers le fichier csv 
data <- read.csv("../ventes.csv")
#Pour la partie 2
data2 <- read.csv("../ventes.csv")
names(data) <- c("Canal","Region","ProduitsFrais","Lait","Epicerie","Surgele","Detergents","Traiteur")

# Partie 1 :
	#Question 1 : Suppression de la colonne Canal
data$Canal <- NULL

	#Question 2 : Ajout colonne Total de chaque colonne sauf Région
data$Total <- rowSums(data[2:7])

	#Question 3 : Ajout colonne pourcentage de chiffre d’affaires des produits suivants arrondi à l'entier prés : 
data$"% ProduitsFrais" <- round(data$ProduitsFrais * 100 / data$Total)
data$"% Lait" <- round(data$Lait * 100 / data$Total)
data$"% Epicerie" <- round(data$Epicerie * 100 / data$Total)
data$"% Surgele" <- round(data$Surgele * 100 / data$Total)
data$"% Detergents" <- round(data$Detergents * 100 / data$Total)
data$"% Traiteur" <- round(data$Traiteur * 100 / data$Total)

	#Question 4 : Exportation du tableau
write.csv2(data, file = "D:/Epsi/EPSI I5/language R/tp/TPR.csv")

	#Question 5 : Chiffre d’affaire « Total » moyen
#Solution 1 : les moyennes sans la mise en forme avec le texte
apply(data[8],2,tapply,data$Region,mean)

#Solution 2 : les moyennes avec la mise en forme avec le texte
region1 <- data[data$Region == "1",]
region2 <- data[data$Region == "2",]
region3 <- data[data$Region == "3",]

paste(c("CA Total moyen Region 1 : ",round(mean(region1$Total), 2),"euros"), collapse = " ")
paste(c("CA Total moyen Region 2 : ",round(mean(region2$Total), 2),"euros"), collapse = " ")
paste(c("CA Total moyen Region 3 : ",round(mean(region3$Total), 2),"euros"), collapse = " ")

#Partie 2 :
#fichier csv d'origine

#data2 <- read.csv("C:/Users/rems_/OneDrive/Bureau/R/tp_langageR/ventes.csv")
names(data2) <- c("Canal","Region","ProduitsFrais","Lait","Epicerie","Surgele","Detergents","Traiteur")

	#Question 1 : Meilleur coéfficient de corélation linéaire
cor(data2[-2][-1], use="complete.obs")
#On peut voir que c'est la paire Détergent - Epicerie

	#Question 2 : deux régressions linéaires
plot(data2$Detergents, data$Epicerie, xlab = "Detergents", ylab = "Epicerie")
reg <- lm(Epicerie ~ Detergents, data = data2)


plot(data2$Epicerie , data2$Detergents, xlab = "Epicerie", ylab = "Détergents")
reg2 <- lm(Detergents ~ Epicerie, data = data2)


	#Question 3
prev <- predict(reg, newdata=data.frame(Detergents = mean(data2$Epicerie)*2))

prev2 <- predict(reg2, newdata=data.frame(Epicerie = mean(data2$Detergents)*2))


	#Question 4 : Affichage
#Prévision 1 : Detergents par Epicerie
prev

#Prévision 2 : Epicerie par Detergents
prev2

#Graphique : nuage de point et droite de régression ( Detergents par rapport aux Epiceries )
abline(reg2)

#Graphique 2 : nuage de point et droite de régression ( Epiceries par rapport aux Detergents )
#abline(reg)
