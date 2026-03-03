############### Le code principal pour appliquer le JAB ############
setwd("F:/Master/M2 moi 2025-2026/Statistique Computationnelle/projet") # Le chemin

# Les parametres
B <- 1000  # Le nombre d'échantillons bootstrapés
m <- n     # La taille des échantillons bootstrapés

# Les fichiers externes
source("donnees_normale.R")      # Le fichier des données
source("estimateur_variance.R")  # Le fichier de la fonction estimateur de la variance
source("biais_bootstrap.R")      # Le fichier qui contient la fonction qui calcule le biais
source("echantillon_sans_i.R")  # fichier qui contient la fonction pour identifier 
                                # les echantillons bootstrapé sans une observation
# L'estimateur de X
S(X)

# Généreration des indices de tous les echantillons bootstrapés 
# sous forme de liste de vecteur
indices_boot <- replicate(B, sample(1:n, m, replace = TRUE), simplify = FALSE)

# Les estimateurs de la variance sur les échantillons bootstrapés
S_B <- sapply(1:B, function(b) {
  echantillon_boot <- X[indices_boot[[b]]] # echantillon bootstrapé b
  S(echantillon_boot)  # Applique la fonction estimateur 
})

# L'estimation du biais de la variance empirique par bootstrap
biais_bootstrap <- biais_boot(S_B)
biais_bootstrap

# Application du jackknife-after-bootstrap
biais_boot_i <- sapply(1:n, function(i) 
  {
    # Identification des échantillons bootstrap qui ne contiennent pas l'observation i
    echantillons_sans_i <- echantillon_sans_i(i, indices_boot)
    
    # Les estimateurs sans la variable Xi
    S_B_sans_i <- S_B[echantillons_sans_i]
    
    # Calculer le biais bootstrap pour cette itération
    if (length(S_B_sans_i) > 0) 
    {
      # s'il existe des echantillons qui ne contiennent pas i
      biais_boot(S_B_sans_i) # calcul le biais de s(x) en se basant seulement sur les S_B_sans_i
    } 
    else 
    {
      NA  # Si tous les échantillons contiennent i
    }
  }
                    )
# Calculer l'écart-type jackknife du biais bootstrap
biais_boot_moy <- mean(biais_boot_i, na.rm = TRUE) # La moyenne des biais boots
# Ecart_type de jackknife
ecart_type_jack <- sqrt(((n - 1) / n) * sum((biais_boot_i - biais_boot_moy)^2, na.rm = TRUE))
ecart_type_jack
