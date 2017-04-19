library(tidyverse)

# Read in data
math <- read.table("student-mat.csv", sep=";", header=TRUE)
port <- read.table("student-por.csv", sep=";", header=TRUE)

# merge data
math <- mutate(math, class = "M")
port <- mutate(port, class = "P")

data <- rbind(math, port)


# remove those with 0 as G3 score
group_by(data, G3) %>%
    summarize(cnt = n())

data <- data[data$G3 != 0,]
data <- data[data$G3 != 1,]


# weekly study time
ggplot(data, aes(x = studytime, y = G3))+ geom_jitter() + geom_smooth(method = "lm")

# workday alcohol consumption
ggplot(data, aes(x = Dalc, y = G3)) +  geom_jitter() + geom_smooth(method = "lm")

# weekday alcohol consumption
ggplot(data, aes(x = Walc, y = G3)) +  geom_jitter() + geom_smooth(method = "lm")

# health
ggplot(data, aes(x = health, y = G3)) +  geom_jitter() + geom_smooth(method = "lm")


ggplot(data, aes(x = famsize, y = G3)) +  geom_jitter() + geom_smooth(method = "lm")

