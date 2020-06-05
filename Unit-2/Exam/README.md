# Exams
### <html><H2 align="center"> Exam U2 </H2></html>
#### Code R
```R
#Directory
getwd()
setwd("C:/Users/Valdo/Downloads/Compressed/ExamenU2")
getwd()

#Dataset and segmentation
movies <- read.csv("Project-Data.csv")
movies <- movies[c(3, 6, 8, 18)]

#Rename and group columns
colnames(movies) <- c("Genre","Studio","BudgetMillons","GrossPorcentUS")
g <- c("action", "adventure", "animation", "comedy", "drama")
s <- c("Buena Vista Studios", "Fox", "Paramount Pictures", "Sony", "Universal", "WB")

#Filter content
library(ggplot2)

movies <- movies[movies$Genre %in% g, ]
movies <- movies[movies$Studio %in% s, ]


#Assign plot to movies
movies <- ggplot(movies, aes(x=Genre, y=GrossPorcentUS, 
                             size=BudgetMillons))

#Assign layout to plot
m <- movies + geom_jitter(aes(color=Studio)) + geom_boxplot(size=0.1, alpha=0.8)+ xlab("Genre") +
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre") +
  theme(axis.title.x = element_text(color = "Purple", size=15),
        axis.title.y = element_text(color = "Purple", size=15),
        plot.title = element_text(color = "Black",
                                  size = 2, hjust = 0.5))
#Final plot
m
```

#### Data visualization
<html><div align="center"><img src="https://i.ibb.co/6PvLVrY/Exam-U2.png"></div></html>

#### Analysis
Analysis
In the box plot analysis, we can notice notifications that the data was segmented into 5 movie genres and 6 studies.

* Regarding the results, we can see that the "action" genre has a higher concentration of data but its box is in an average position with respect to the others, in addition to much of its data being below the second quartile.

* As for the "adventure" genre, not much can be said because it does not present much data and its means is the lowest of the rest.

* On the part of the "animation" genre we can notice an increase in data compared to the previous one and present a media position with respect to the other genres.

* In the "comedy" genre we find that its box is above the rest, which indicates that perhaps it is the one that generates the best numbers, however it presents much less data compared to the "action" genre.

* Finally, the "drama" genre presents the smallest box of the group and the least amount of data, although its midpoint is in a good position, so if invited it can become profitable.

In conclusion with the graph, we can define the genre "comedy" genres higher gains obtained scattered results, but the genre "action" has a greater amount and concentration of data which makes it a stable option. Therefore, we are facing a question of quality and quantity. Which may indicate that "action" raises less profit because its initial investment is greater and "comedy" when investing less expectations, generates greater profits.

---
### <html><H2 align="center"> Exam U3 </H2></html>
#### Code R
```R
# Naive Bayes
# Set our workspace
getwd()
setwd("C:/Users/Valdo/Documents/GitHub/DataMining/Unit-2/Exam/ExamU3")
getwd()

# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Purchased = factor(dataset$Purchased, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased, SplitRatio = 0.75)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[-3] = scale(training_set[-3])
test_set[-3] = scale(test_set[-3])

# Fitting Naive Bayes to the Training set
# install.packages('e1071')
library(e1071)
classifier = naiveBayes(x = training_set[,-3], 
                        y = training_set$Purchased)
naiveBayes

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
colnames(grid_set) = c('Age', 'EstimatedSalary')
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3],
     main = 'Naive bayes (Training set)',
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
y_grid = predict(classifier, newdata = grid_set)
plot(set[, -3], main = 'Naive bayes (Test set)',
     xlab = 'Age', ylab = 'Estimated Salary',
     xlim = range(X1), ylim = range(X2))
contour(X1, X2, matrix(as.numeric(y_grid), length(X1), length(X2)), add = TRUE)
points(grid_set, pch = '.', col = ifelse(y_grid == 1, 'springgreen3', 'tomato'))
points(set, pch = 21, bg = ifelse(set[, 3] == 1, 'green4', 'red3'))
```
#### Data visualization
##### Plot Training_Set
<html><div align="center"><img src="https://i.ibb.co/6yCwBgS/Naive-bayes-Training-set.png"></div></html>

##### Plot Test_Set
<html><div align="center"><img src="https://i.ibb.co/rMCXcv8/Naive-bayes-Test-set.png"></div></html>

#### Analysis
In the plot based on applications of previous models say SVM or KNN, we choose the same graph which consists of separating two attributes of an independent variable.
In the plot a quantity of 400 data is required based on the data set "Social_Network_Ads.csv", we can see that the red color separation is for people who do not buy and the color separation is to buy, all this taking the people's age and estimated salary

* ##### Training set
In the plot of the training set, there were 75% giving an amount of 300 data to analysis, we appreciate that despite the data in denial (0) of red color they were more than the data that if they bought (1), the data of the green side seem to be on par because they are scattered. Regarding the amount of data in red, it can be deduced that there is a large concentration in ages below the average (37 years) and with a reduced salary. On the other hand, the amount of data outside its color is not so many in the total number of people evaluated, but we consider it as unusual or out of range data.

* ##### Test equipment
In the plot of the test set, there was 25% giving an amount of 100 data to analysis, unlike the training set, here the amount of data is similar. Like the training set, the situation of the great concentration continues to occur at below-average ages (approximately 30-40 years) and with a reduced salary.

