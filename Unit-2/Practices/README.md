# Practices
---
## Practice 1
### <html><H3 align="center"> Simple Linear Regression </H3></html>
#### Code R.
    getwd()
    setwd("C:/Users/JS/Documents/DataMining/MachineLearning/SimpleLinearRegression")
    etwd()
##### Importing the dataset
    dataset <- read.csv('Minutos_ por_partido_en_la_temporada.csv')
    head(dataset)
##### Splitting the dataset into the Training set and Test set
##### Install.packages('caTools')
    library(caTools)
    set.seed(123)
    split <- sample.split(dataset$Minutos, SplitRatio = 2/3)
    training_set <- subset(dataset, split == TRUE)
    test_set <- subset(dataset, split == FALSE)
##### Fitting Simple Linear Regression to the Training set
    regressor = lm(formula = Minutos ~ Partidos,
               data = dataset)
    summary(regressor)
##### Predicting the Test set results
    y_pred = predict(regressor, newdata = test_set)
##### Visualising the Training set results
    library(ggplot2)
    ggplot() +
    geom_point(aes(x=training_set$Partidos, y=training_set$Minutos),
                color = 'red') +
    geom_line(aes(x = training_set$Partidos, y = predict(regressor, newdata = training_set)),
                color = 'blue') +
    ggtitle('Minutos vs Partidos (Training Set)') +
    xlab('Partidos') +
    ylab('Minutos')
##### Visualising the Test set results
    ggplot() +
    geom_point(aes(x=test_set$Partidos, y=test_set$Minutos),
             color = 'red') +
    geom_line(aes(x = test_set$Partidos, y = predict(regressor, newdata = test_set)),
            color = 'blue') +
    ggtitle('Minutos vs Partidos (Test Set)') +
    xlab('Partidos') +
    ylab('Minutos')
#### Dataset "Minutes per game in the season"
<html><div align="center"><img src="https://i.ibb.co/9sSbSkB/dataset.png"></div></html>

#### Graphics
<html><div align="center"><img src="https://i.ibb.co/WWNzJ5f/Minutes-Vs-Games.png"></div></html>
**Observation:** It can be seen in the Training Set that there are 2 outliers, as for the others they remained in a range of 20 to 30 games with a time of between 1500 min and 2500 min played.
<html><div align="center"><img src="https://i.ibb.co/2yY25LG/Minutes-Vs-Games-Test-Set.png"></div></html>
**Observation:** It can be seen in the Training Set that there are 5 values at the beginning separated by approximately 5 games, maintaining an improvement between each player, but as for the others, there is a proximity between 25 to 30 games with a time of between 2000 min and 2500 min played.

---