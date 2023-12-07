library(readr)
library(fixest)
library(tidyverse)
library(jtools)

MathData <- function() {
  Math <- read_csv("Data/student-mat.csv")
  
  Math <- Math %>% mutate(schoolsup = schoolsup == "yes",
                          famsup = famsup == "yes",
                          paid = paid == "yes",
                          activities = activities == "yes",
                          nursery = nursery == "yes",
                          higher = higher == "yes",
                          internet = internet == "yes",
                          romantic = romantic == "yes",
                          Pstatus = Pstatus == "T",
                          lowDalc = Dalc == 1,
                          lowWalc = Walc == 1)
  
  # Modify alcohol consumption categories
  Math <- Math %>% mutate(newDalc = case_when(
    Dalc %in% c(1) ~ 0,
    Dalc %in% c(2) ~ 1,
    Dalc %in% c(3,4,5) ~ 2
  ))

  # Modify alcohol consumption categories
  Math <- Math %>% mutate(newWalc = case_when(
    Walc %in% c(1) ~ 0,
    Walc %in% c(2) ~ 1,
    Walc %in% c(3,4,5) ~ 2
  ))
  
  # Convert to out of 100
  Math <- Math %>% mutate(G3 = G3 * 5)
  
  return(Math)
}

PortugueseData <- function() {
  Portuguese <- read_csv("Data/student-por.csv")
  
  Portuguese <- Portuguese %>% mutate(schoolsup = schoolsup == "yes",
                                      famsup = famsup == "yes",
                                      paid = paid == "yes",
                                      activities = activities == "yes",
                                      nursery = nursery == "yes",
                                      higher = higher == "yes",
                                      internet = internet == "yes",
                                      romantic = romantic == "yes",
                                      Pstatus = Pstatus == "T",
                                      lowDalc = Dalc == 1,
                                      lowWalc = Walc == 1)
  
  # Convert to out of 100
  Portuguese <- Portuguese %>% mutate(G3 = G3 * 5)
  
  # Modify alcohol consumption categories
  Portuguese <- Portuguese %>% mutate(newDalc = case_when(
    Dalc %in% c(1) ~ 0,
    Dalc %in% c(2) ~ 1,
    Dalc %in% c(3,4,5) ~ 2
  ))
  
  # Modify alcohol consumption categories
  Portuguese <- Portuguese %>% mutate(newWalc = case_when(
    Walc %in% c(1) ~ 0,
    Walc %in% c(2) ~ 1,
    Walc %in% c(3,4,5) ~ 2
  ))
  
  return(Portuguese)
}

MathData <- MathData()

PortugueseData <- PortugueseData()