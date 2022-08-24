## R Basics

2 + 2
my_number <- 2
my_string <- "Hello WOrld"
my_vector <- c(2, 2)
my_string_vector <- c("Hello", "World")
mean(my_vector)
my_vector[1]
#setwd()
load("SICSS/Coronavirus_Tweets.Rdata")
load("SICSS/Apple_Mobility_Data.Rdata")
tweet_texts <- covid_tweets$tweet_text


## Data “Wrangling”

# install.packages("tidyverse")

library(tidyverse)

brazil_data <- filter(apple_data, region=="Brazil")

regions <- select(apple_data, region)

tranport_types <- count(apple_data, transportation_type)

alpha_order <- arrange(apple_data, region)


## Data Visualization (Part 1: bar graph)

library(tidyverse)

apple_data <- read_csv("SICSS/apple_mobility_data.csv")

long_data <- gather(apple_data, key=day, value=mobility_data, `2020-01-13`:`2020-08-20`)

country_averages <- long_data %>%
                      filter(transportation_type=="walking") %>%
                        group_by(country) %>%
                          summarise(walking_average=mean(mobility_data, na.rm=TRUE)) %>%
                            filter(!is.na(country))
                            
ggplot(country_averages, aes(y=reorder(country, walking_average), weight=walking_average)) + 
  geom_bar(fill="cyan") + 
    xlab("Reletive Rate of Walking Direction Request") +
      ylab("Country") +
        theme_minimal()


## Data Visualization (Part 2: line)

library(lubridate)

long_data$day <- as_date(long_data$day)

italy_spain_data <- long_data %>%
  filter(country==c("Italy", "Spain"), transportation_type=="walking") %>%
    group_by(country, day) %>%
      summarise(walking_average=mean(mobility_data, na.rm=TRUE))

ggplot(italy_spain_data, aes(x=day, y=walking_average, group=country, colour=country)) +
  geom_line() +
    facet_wrap(~country) +
      theme_bw()
