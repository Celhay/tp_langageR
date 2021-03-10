# Introduction : Chargement du fichier csv
url <- ("D:/Epsi/EPSI I5/language R/tp/")
data <- read.csv("D:/Epsi/EPSI I5/language R/tp/ventes.csv")
names(data) <- c("Canal","Region","ProduitsFrais","Lait","Epicerie","Surgele","Detergents","Traiteur")
str(data)