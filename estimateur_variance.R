######################## LES FONCTIONS ####################################
setwd("F:/Master/M2 moi 2025-2026/Statistique Computationnelle/projet") # Le chemin

# La fonction S pour calculer l'estimateur de la variance
S<-function(x){
  # Calcul l'estimateur de la variance d'un echantillon
  # x :  L'echantillon de variable dont on veut calculer l'estimateur de la variance
  x_bar<-mean(x) # La moyenne de x (le x bar)
  n<- length(x) # La taille de l'echantillon x
  sum((x-x_bar)^2)/n # Calcul de l'estimateur biaisé de la variance
}

