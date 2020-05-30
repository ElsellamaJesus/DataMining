# Practices
---
## Practice 1
### <html><H3 align="center"> Simple Linear Regression </H3></html>
#### Code R
```R
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
```
#### Dataset "Minutes per game in the season"
<html><div align="center"><img src="https://i.ibb.co/9sSbSkB/dataset.png"></div></html>

#### Graphics
<html><div align="center"><img src="https://i.ibb.co/WWNzJ5f/Minutes-Vs-Games.png"></div></html>

**Observation:** It can be seen in the Training Set that there are 2 outliers, as for the others they remained in a range of 20 to 30 games with a time of between 1500 min and 2500 min played.
<html><div align="center"><img src="https://i.ibb.co/2yY25LG/Minutes-Vs-Games-Test-Set.png"></div></html>

**Observation:** It can be seen in the Training Set that there are 5 values at the beginning separated by approximately 5 games, maintaining an improvement between each player, but as for the others, there is a proximity between 25 to 30 games with a time of between 2000 min and 2500 min played.

---
## Practice 2
### <html><H3 align="center"> Multiple Linear Regression </H3></html>
#### Code R
```R
getwd()
setwd("C:/Users/Valdo/Documents/GitHub/Profe/DataMining/MachineLearning/MultipleLinearRegression")
getwd()

# Importing the dataset
dataset <- read.csv('50_Startups.csv')

# Encoding categorical data 
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1,2,3))
dataset
# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Profit, SplitRatio = 0.8)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Fitting Multiple Linear Regression to the Training set
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Profit ~ .,
               data = training_set )
summary(regressor)

# Prediction the Test set results
y_pred = predict(regressor, newdata = test_set)
y_pred

# Assigment: visualize the siple liner regression model with R.D.Spend 
# Building the optimal model using Backward Elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset )
summary(regressor)

y_pred = predict(regressor, newdata = test_set)
y_pred
```
#### Results
```R
> summary(regressor)

Call:
lm(formula = Profit ~ R.D.Spend + Marketing.Spend, data = dataset)

Residuals:
   Min     1Q Median     3Q    Max 
-33645  -4632   -414   6484  17097 

Coefficients:
                 Estimate Std. Error t value Pr(>|t|)    
(Intercept)     4.698e+04  2.690e+03  17.464   <2e-16 ***
R.D.Spend       7.966e-01  4.135e-02  19.266   <2e-16 ***
Marketing.Spend 2.991e-02  1.552e-02   1.927     0.06 .  
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 9161 on 47 degrees of freedom
Multiple R-squared:  0.9505,	Adjusted R-squared:  0.9483 
F-statistic: 450.8 on 2 and 47 DF,  p-value: < 2.2e-16
```
**Analysis.** We see that our Multiple R-Squared is 95% is high, which means that our model fits well to the real data, since it is almost 100%. Our P value is very close to 0, it could indicate that there is a significant difference between the data sets, although it is striking that it is so small.

---