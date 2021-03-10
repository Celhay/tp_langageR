# Introduction : Chargement du fichier csv
data <- read.csv("D:/Epsi/EPSI I5/language R/tp/ventes.csv")
#data <- read.csv("C:/Users/rems_/OneDrive/Bureau/R/tp_langageR/ventes.csv")
names(data) <- c("Canal","Region","ProduitsFrais","Lait","Epicerie","Surgele","Detergents","Traiteur")

# Partie 1 :
	#Suppression de la colonne Canal
data$Canal <- NULL

	#Ajout colonne Total de chaque colonne sauf Région
data$Total <- rowSums(data[2:7])

	#Ajout colonne pourcentage de chiffre d’affaires des produits suivants arrondi à l'entier prés : 
data$"% ProduitsFrais" <- round(data$ProduitsFrais * 100 / data$Total)
data$"% Lait" <- round(data$Lait * 100 / data$Total)
data$"% Epicerie" <- round(data$Epicerie * 100 / data$Total)
data$"% Surgele" <- round(data$Surgele * 100 / data$Total)
data$"% Detergents" <- round(data$Detergents * 100 / data$Total)
data$"% Traiteur" <- round(data$Traiteur * 100 / data$Total)

	#Exportation du tableau
write.csv2(data, file = "D:/Epsi/EPSI I5/language R/tp/TPR.csv")

	#Chiffre d’affaire « Total » moyen
apply(data[8],2,tapply,data$Region,mean)

#Partie 2 :

data <- read.csv("C:/Users/rems_/OneDrive/Bureau/R/tp_langageR/ventes.csv")
names(data) <- c("Canal","Region","ProduitsFrais","Lait","Epicerie","Surgele","Detergents","Traiteur")

	#Meilleur coéfficient de coréaltion linéaire
cor(data[-2][-1], use="complete.obs")
#On peut voir que c'est la paire Détergent - Epicerie

	#Question 2
plot(data$Detergents, data$Epicerie, xlab = "Detergents", ylab = "Epicerie")
reg <- lm(Epicerie ~ Detergents, data = data)
abline(reg)

plot(data$Epicerie , data$Detergents, xlab = "Epicerie", ylab = "Détergents")
reg2 <- lm(Detergents ~ Epicerie, data = data)
abline(reg2)

#Question 3
prev <- predict(reg, newdata=data.frame(Detergents = min(data$Epicerie)*2))
prev
prev2 <- predict(reg2, newdata=data.frame(Epicerie = min(data$Detergents)*2))
prev2