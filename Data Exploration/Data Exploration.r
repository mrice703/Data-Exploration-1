library("dplyr")
library("ggplot2")
library("gapminder")

# Find the different countries in the data set

levels(gapminder$country)

View(gapminder)

# Filter data 

countries <- gapminder %>% filter(country%in% c("Canada", "Egypt", "Ireland", "Netherlands", "Israel"))

# Line plot of years and lifeExp

ggplot(countries, aes(x=year, y=lifeExp)) + geom_line()

#Add country as a color 

ggplot(countries, aes(x=year, y=lifeExp, color=country)) + geom_line()

# Lowest lifeExp in 1952 and 2007

filter(countries, year %in% c(1952, 2007)) %>% arrange(lifeExp) %>% select(country, year, lifeExp)

# Highest lifeExp in 1952 and 2007

filter(countries, year %in% c(1952, 2007)) %>% arrange(desc(lifeExp)) %>% select(country, year, lifeExp)

# Find the median of lifeExp 

median <- countries %>% select(year,lifeExp) %>% group_by(year) %>% summarise(medlifeExp = median(lifeExp))
