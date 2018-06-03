library(tidyverse)
library(plyr) #Always load before dplyr
library(dplyr)
library(tidyr)

#Here we are importing the data. We use the col_names to rename the names of the columns.
#Followed by the col_types specification to let R know what type of column this is going to be.
adult <- read_csv("adult.data",
                  col_names = c("age", 'workclass', 'fnlwgt', 'education', 'education-num',
                                'marital-status', 'occupation', 'relationship', 'race',
                                'sex', 'capital-gain', 'capital-loss', 'hours-per-week',
                                'native-country', 'salary'),
                  col_types = cols(col_integer(), col_character(), col_integer(), col_character(),
                                   col_integer(), col_character(), col_character(), col_character(),
                                   col_character(), col_character(), col_integer(), col_integer(),
                                   col_integer(), col_character(), col_character()))

#Here we only want to focus on the successful minority communities.
#4 year degrees and above making over 50K
adult %>%
  filter(adult$salary == '>50K', adult$race != 'White', !(adult$education %in% c('10th', '11th', '12th', '1st-4th', '5th-6th', '7th-8th', '9th', 'Assoc-acdm', 'Assoc-voc', 'HS-grad',
             'Preschool', 'Prof-school', 'Some-college'))) %>%
  ggplot(aes(x = age, fill = sex))+
  geom_bar(color = "black")

#Here we look at the sucessful whites.  
adult %>%
  filter(adult$salary == '>50K', adult$race == 'White',
         !(adult$education %in% c('10th', '11th', '12th', '1st-4th', '5th-6th', '7th-8th', '9th', 'Assoc-acdm', 'Assoc-voc', 'HS-grad',
                                  'Preschool', 'Prof-school', 'Some-college'))) %>% 
  ggplot(aes(x = age, fill = sex))+
  geom_bar(color = "black")

