'Directorio'
getwd()
setwd("C:/Users/JS/Documents/DataMining/Examen")
getwd()

#Libreria donde esta el modelo Naive Bayes
library(e1071)
library(ggplot2)
library(caret)

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[c(2,5)]

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
t.ids <- createDataPartition(dataset$Purchased,p = 0.75, list = F)


mod <- naiveBayes(Purchased ~ ., data = dataset[t.ids,])
mod

pred <- predict(mod, dataset[-t.ids,])
tab <- table(dataset[-t.ids,]$Purchased, pred, dnn = c("Actual","Predicha"))
confusionMatrix(tab)
