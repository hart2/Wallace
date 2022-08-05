# Code written by Savannah Hartman for modeling for 20 most prevalent seabirds 
# for winter 2018
# Using Wallace for species distribution modelling

install.packages("shiny")
install.packages("rgbif")
install.packages("sdmpredictors")

library(shiny)
library(wallace)
library(rmarkdown)
library(readr)
library(dplyr)
library(tidyverse)

avesWallace <- read_csv("C:/Users/savan/Documents/github/AvesOBIS/Aves2.csv")%>%
  select(scientificName, decimalLongitude, decimalLatitude, season, date_year)%>%
  filter(season == "Winter")

# Species: 
# Alca torda and Clangula hyemalis
# No need to remove duplicates, Wallace does that upon upload

# Winter for all years to compare to seasonal map of each species, how accurate
# will my sdm be?

tordaWinter <- avesWallace %>%
  select(scientificName,decimalLongitude,decimalLatitude)%>%
  filter(scientificName == "Alca torda")
names(tordaWinter) <- c('name','longitude','latitude')
write.csv(tordaWinter,"./Atorda_winter.csv") #began thinning at 3:49 pm 6.9.22

hyemalisWinter <- avesWallace %>%
  select(scientificName,decimalLongitude,decimalLatitude)%>%
  filter(scientificName == "Clangula hyemalis")
names(hyemalisWinter) <- c('name','longitude','latitude')
write.csv(hyemalisWinter,"./Chyemalis_winter.csv")

# Year 2018
A.torda2018 <- avesWallace %>%
  select(scientificName,decimalLongitude,decimalLatitude,date_year)%>%
  filter(scientificName == "Alca torda", date_year =="2018") 
names(A.torda2018) <- c('name','longitude','latitude','year')
A.torda2018 <- subset(A.torda2018, select = -c(year))
write.csv(A.torda2018,"./A_torda2018.csv")
rm(A.torda)

C.hyemalis2018 <- avesWallace %>%
  select(scientificName,decimalLongitude,decimalLatitude,date_year)%>%
  filter(scientificName == "Clangula hyemalis", date_year == "2018") 
names(C.hyemalis2018) <- c('name','longitude','latitude','year')
C.hyemalis2018 <- subset(C.hyemalis2018, select = -c(year))
write.csv(C.hyemalis2018,"./C.hyemalis2018.csv") #adds unusable first column, rm manually

#Years 2001, 2002, 2007, 2011, 2015, 2016, 2017 do not contain data for both species (also 
# years of El Nino/La Nina - leave out for simplicity)

#Year 2003
A.torda2003 <- avesWallace %>%
  select(scientificName,decimalLongitude,decimalLatitude,date_year)%>%
  filter(scientificName == "Alca torda", date_year =="2003") 
names(A.torda2003) <- c('name','longitude','latitude','year')
A.torda2003 <- subset(A.torda2003, select = -c(year))
write.csv(A.torda2003,"./A_torda2003.csv")

C.hyemalis2003 <- avesWallace %>%
  select(scientificName,decimalLongitude,decimalLatitude,date_year)%>%
  filter(scientificName == "Clangula hyemalis", date_year == "2003") 
names(C.hyemalis2003) <- c('name','longitude','latitude','year')
C.hyemalis2003 <- subset(C.hyemalis2003, select = -c(year))
write.csv(C.hyemalis2003,"./C.hyemalis2003.csv") #adds unusable first column, rm manually

#Year 2004
A.torda2004 <- avesWallace %>%
  select(scientificName,decimalLongitude,decimalLatitude,date_year)%>%
  filter(scientificName == "Alca torda", date_year =="2004") 
names(A.torda2004) <- c('name','longitude','latitude','year')
A.torda2004 <- subset(A.torda2004, select = -c(year))
write.csv(A.torda2004,"./A_torda2004.csv")

C.hyemalis2004 <- avesWallace %>%
  select(scientificName,decimalLongitude,decimalLatitude,date_year)%>%
  filter(scientificName == "Clangula hyemalis", date_year == "2004") 
names(C.hyemalis2004) <- c('name','longitude','latitude','year')
C.hyemalis2004 <- subset(C.hyemalis2004, select = -c(year))
write.csv(C.hyemalis2004,"./C.hyemalis2004.csv") #adds unusable first column, rm manually

#Year 2005
#Year 2006
#Year 2008
#Year 2009
#Year 2010
#Year 2012
#Year 2013
#Year 2014


# Run Wallace -------------------------------------------------------------
run_wallace()

# library(sdmpredictors)
# datasets <- list_datasets(terrestrial = FALSE, marine = TRUE)
# layers <- list_layers(datasets)   # exploring the marine layers 