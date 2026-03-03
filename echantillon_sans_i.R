setwd("F:/Master/M2 moi 2025-2026/Statistique Computationnelle/projet") # Le chemin

# Fonction pour identifier les echantillons bootstrapé sans l'observation i


echantillon_sans_i<-function(i,x)
  # x est est une list de vecteurs contenant les indices de chaque echantillon_boot
  # echantillon contient false si l'indice i n'est pas dans les indices de echantillon_boot
  {
    sapply(x, function(indices) !(i %in% indices))
  }
