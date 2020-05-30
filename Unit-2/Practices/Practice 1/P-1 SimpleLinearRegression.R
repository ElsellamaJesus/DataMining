getwd()
setwd("C:/Users/JS/Documents/DataMining/MachineLearning/SimpleLinearRegression")
getwd()

# Importing the dataset
dataset <- read.csv('Minutos_ por_partido_en_la_temporada.csv')
head(dataset)
# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Minutos, SplitRatio = 2/3)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Minutos ~ Partidos,
               data = dataset)
summary(regressor)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training set results
library(ggplot2)
ggplot() +
  geom_point(aes(x=training_set$Partidos, y=training_set$Minutos),
             color = 'red') +
  geom_line(aes(x = training_set$Partidos, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle('Minutos vs Partidos (Training Set)') +
  xlab('Partidos') +
  ylab('Minutos')

# Visualising the Test set results
ggplot() +
  geom_point(aes(x=test_set$Partidos, y=test_set$Minutos),
             color = 'red') +
  geom_line(aes(x = test_set$Partidos, y = predict(regressor, newdata = test_set)),
            color = 'blue') +
  ggtitle('Minutos vs Partidos (Test Set)') +
  xlab('Partidos') +
  ylab('Minutos')
