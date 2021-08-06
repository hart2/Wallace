# Code written by Savannah Hartman for modeling for 20 most prevalent seabirds
# Using Wallace for species distribution modelling

install.packages("shiny")
install.packages("rgbif")
install.packages("sdmpredictors")

library(shiny)
library(leaflet)
library(wallace)
library(rmarkdown)
library(rgbif)
library(readr)
library(dplyr)
library(tidyverse)

avesWallace <- read_csv("~/github/Wallace/avesWallace.csv")

# Species: Bucephala albeola, Morus bassanus,Larus argentatus, Uria aalge,Larus glaucescens,
# Melanitta perspicillata, Larus philadelphia, Puffinus gravis, Gavia stellata,
# Larus marinus, Oceanites oceanicus, Gavia immer, Alca torda, Puffinus griseus, 
# Phalaropus fulicarius, Fulmarus glacialis, Mergus serrator, Aechmophorus occidentalis,
# Calonectris diomedea, Phalacrocorax urile

P.urile <- avesWallace %>%
  filter(name == "Phalacrocorax urile")#20
write.csv(P.urile,"./P_urile.csv")

C.diomedea <- avesWallace %>% 
  filter(name == "Calonectris diomedea") #19
write.csv(C.diomedea,"./C_diomedea.csv")

A.occidentalis <- avesWallace %>%
  filter(name == "Aechmophorus occidentalis") #18
write.csv(A.occidentalis,"./A_occidentalis.csv")

M.serrator <- avesWallace %>%
  filter(name == "Mergus serrator") #17
write.csv(M.serrator,"./M_serrator.csv")

F.glacialis <- avesWallace %>%
  filter(name == "Fulmarus glacialis") #16
write.csv(F.glacialis,"./F_glacialis.csv")

P.fulicarius <- avesWallace %>%
  filter(name == "Phalaropus fulicarius") #15
write.csv(P.fulicarius,"./P_fulicarius.csv")

P.griseus <- avesWallace %>%
  filter(name == "Puffinus griseus") #14
write.csv(P.griseus,"./P_griseus.csv")

A.torda <- avesWallace %>%
  filter(name == "Alca torda") #13
write.csv(A.torda,"./A_torda.csv")

G.immer <- avesWallace %>%
  filter(name == "Gavia immer") #12
write.csv(G.immer,"./G_immer.csv")

O.oceanicus <- avesWallace %>%
  filter(name == "Oceanites oceanicus") #11
write.csv(O.oceanicus,"./O_oceanicus.csv")

L.marinus <- avesWallace %>%
  filter(name == "Larus marinus") #10
write.csv(L.marinus,"./L_marinus.csv")

G.stellata <- avesWallace %>%
  filter(name == "Gavia stellata") #9
write.csv(G.stellata,"./G_stellata.csv")

P.gravis <- avesWallace %>%
  filter(name == "Puffinus gravis") #8
write.csv(P.gravis,"./P_gravis.csv")

L.philadelphia <- avesWallace %>%
  filter(name == "Larus philadelphia") #7
write.csv(L.philadelphia,"./L_philadelphia.csv")

M.perspicillata <- avesWallace %>%
  filter(name == "Melanitta perspicillata") #6
write.csv(M.perspicillata,"./M_perspicillata.csv")

L.glaucescens <- avesWallace %>%
  filter(name == "Larus glaucescens") #5
write.csv(L.glaucescens,"./L_glaucescens.csv")

U.aalge <- avesWallace %>%
  filter(name == "Uria aalge") #4
write.csv(U.aalge,"./U_aalge.csv")

L.argentatus <- avesWallace %>%
  filter(name == "Larus argentatus") #3
write.csv(L.argentatus,"./L_argentatus.csv")

M.bassanus <- avesWallace %>%
  filter(name == "Morus bassanus") #2
write.csv(M.bassanus,"./M_bassanus.csv")

B.albeola <- avesWallace %>%
  filter(name == "Bucephala albeola") #1
write.csv(B.albeola,"./B_albeola.csv")


# Subsample so Wallace will run in a reasonable amount of time
total_samp <- nrow(P.urile)          #find total number of samples for subregion
sub10 <- round(0.1*total_samp)       #number of values needed as a subsample 10% of the total sample
P.urile10 <- P.urile[sample(nrow(P.urile), sub10), ]
write.csv(P.urile10,"./P_urile10.csv") #has 1000 records, 20% would have 2000 
                                       #records, takes about an hour to run in 
                                       #spatially thinning section of Wallace

run_wallace()

# library(sdmpredictors)
# datasets <- list_datasets(terrestrial = FALSE, marine = TRUE)
# layers <- list_layers(datasets)   # exploring the marine layers 