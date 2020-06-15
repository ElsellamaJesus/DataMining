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
## Practice 3
### <html><H3 align="center"> Backward Elimination </H3></html>
#### Code R
```R
# Homework analise the follow atomation backwardElimination function 
backwardElimination <- function(x, sl) {
  #We set the length of the vector of R to be "x".
  numVars = length(x).
  #We create a cycle for the vector.
  for (i in c(1:numVars)){
    #Linear regression fit
    regressor = lm(formula = Profit ~ ., data = x)
    #The coefficients of the objects are extracted
    #Pr (> | t |) "will give us the value p, it is related to the probability of
    #observing any value equal to or greater than t.
    maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
    #A condition is added
    if (maxVar > sl){
      j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
      x = x[, -j]
    }
    #Subtract one from the vector numVars
    numVars = numVars - 1
  }
  #Return linear regression
  return(summary(regressor))
}
SL = 0.05
#dataset = dataset[, c(1,2,3,4,5)]
training_set
backwardElimination(training_set, SL)
```
---
## Practice 4
### <html><H3 align="center"> Logistic Regression </H3></html>
#### Code R
```R
getwd()
setwd("C:/Users/Valdo/Documents/GitHub/Profe/DataMining/MachineLearning/LogisticRegression")
getwd()

# Importing the dataset
dataset <- read.csv('Social_Network_Ads.csv')
dataset <- dataset[, 3:5]

# Splitting the dataset into the Training set and Test set
# Install.packages('caTools')
library(caTools)
set.seed(123)
split <- sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set <- subset(dataset, split == TRUE)
test_set <- subset(dataset, split == FALSE)

# Feature scaling
training_set[, 1:2] <- scale(training_set[, 1:2])
test_set[, 1:2] <- scale(test_set[, 1:2])

# Fitting Logistic Regression to Training set
classifier = glm(formula = Purchased ~ .,
                 family = binomial,
                 data = training_set)

# Predicting the Test set results
prob_pred = predict(classifier, type = 'response', newdata = test_set[-3])
prob_pred
y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred

# Making the Confusion Metrix
cm = table(test_set[, 3], y_pred)
cm

# 
library(ggplot2)
ggplot(training_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(training_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=EstimatedSalary, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

ggplot(test_set, aes(x=Age, y=Purchased)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)

# Visualization the Training set result
install.packages('ElemStatLearn')
# manual mode. Go to this URL https://cran.r-project.org/src/contrib/Archive/ElemStatLearn/
# Download with the latest date 2019-08-12 09:20	12M
# Then follow this page steps https://riptutorial.com/r/example/5556/install-package-from-local-source

library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Training set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'EstimatedSalary')
prob_set = predict(classifier, type = 'response', newdata = grid_set)
y_grid = ifelse(prob_set > 0.5, 1, 0)
plot(set[, -3],
     main = 'Logistic Regression (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
#### Data visualization
##### Visualization the Training set result
<html><div align="center"><img src="https://i.ibb.co/KyqGJJ5/LR-Training-set.png"></div></html>

##### Visualising the Test set results
<html><div align="center"><img src="https://i.ibb.co/j8fTHLb/LR-Test-set.png"></div></html>

---
## Practice 5
### <html><H3 align="center"> Support Vector Machines </H3></html>
#### Code R
```R
# Support Vector Machine (SVM)
# Set our workspace
getwd()
setwd("C:/Users/Valdo/Documents/Practice 5")
getwd()

# Importing the dataset
dataset = read.csv('DataCredit.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Married = factor(dataset$Married, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Married, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting SVM to the Training set
# install.packages('e1071')
library(e1071)
classifier = svm(formula = Married ~ .,
                 data = training_set,
                 type = 'C-classification',
                 kernel = 'polynomial')
svm
# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3])
y_pred
# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm
# Visualising the Training set results
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'Limit')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'SVM (Training set)',
     xlab = 'Age', ylab = 'Limit',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'Limit')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'SVM (Test set)',
     xlab = 'Age', ylab = 'Limit',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
#### Data visualization
##### Visualization the Training set result
<html><div align="center"><img src="https://i.ibb.co/MkC3w87/SVM-Training-set.png"></div></html>

##### Visualising the Test set results
<html><div align="center"><img src="https://i.ibb.co/Tkyf8yb/SVM-Test-set.png"></div></html>
A credit data data set will be used, where the fields of whether you are married, your credit limit and your age will be used. Changed core from linear to polynomial.

---
## Practice 6
### <html><H3 align="center"> Decision Tree </H3></html>
#### Code R
```R
# Decision Tree Classification
#Directory
getwd()
setwd("C:/Users/Valdo/Documents/GitHub/profe/DataMining/MachineLearning/DesicionThree")
getwd()
# Importing the dataset
dataset = read.csv('DataCredit.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Married = factor(dataset$Married, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Married, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting Decision Tree Classification to the Training set
# install.packages('rpart')
library(rpart)
classifier = rpart(formula = Married ~ .,
                   data = training_set)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-3], type = 'class')
y_pred
# Making the Confusion Matrix
cm = table(test_set[, 3], y_pred)
cm
# Visualising the Training set results
library(ElemStatLearn)
set = training_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'Limit')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3],
     main = 'Decision Tree Classification (Training set)',
     xlab = 'Age', ylab = 'Limit',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Visualising the Test set results
library(ElemStatLearn)
set = test_set
X1 = seq(min(set[, 1]) - 1, max(set[, 1]) + 1, by = 0.01)
X2 = seq(min(set[, 2]) - 1, max(set[, 2]) + 1, by = 0.01)
grid_set = expand.grid(X1, X2)
colnames(grid_set) = c('Age', 'Limit')
y_grid = predict(classifier, newdata = grid_set, type = 'class')
plot(set[, -3], main = 'Decision Tree Classification (Test set)',
     xlab = 'Age', ylab = 'Limit',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))

# Plotting the tree
plot(classifier)
text(classifier, cex=0.6)
```
#### Data visualization
##### Visualization the Training set result
<html><div align="center"><img src="https://i.ibb.co/gjqhqKF/Decision-Tree-Classification-Training-set.png"></div></html>

##### Visualising the Test set results
<html><div align="center"><img src="https://i.ibb.co/m9DNNsy/Decision-Tree-Classification-Test-set.png"></div></html>

##### Visualizing the decision tree plot
<html><div align="center"><img src="https://i.ibb.co/NND9BR6/Plotting-the-tree.png"></div></html>
A credit dataset was used, using the fields if you are married, your age and your credit limit.

---