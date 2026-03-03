############### Les donnees simuées de la loi normale ############
setwd("F:/Master/M2 moi 2025-2026/Statistique Computationnelle/projet") # Le chemin

# Les parametres 
n<-100 # La taille de l'echantillon
theta<-4 # La valeur reelle de la variance

set.seed(123) # Pour la reproductibilité
X<-rnorm(n,mean = 0, sd = sqrt(theta)) # L'echantillon X
