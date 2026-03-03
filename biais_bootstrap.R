################ L'estimation du biais de la variance par bootstrap ############

setwd("F:/Master/M2 moi 2025-2026/Statistique Computationnelle/projet") # Le chemin

source("donnees_normale.R") # Le fichier des donnees
source("estimateur_variance.R") # Le fichier de la fonction 
                                # l'estimateur de la variance
 biais_boot<-function(w)
 {
   mean(w) - S(X) # biais de s(X)
 }
 