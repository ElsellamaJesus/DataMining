## <html><H2 align="center"> Exam U4 </H2></html>

#### Code R
```R
# K-Means Clustering
# Set our workspace
getwd()
setwd("C:/Users/Valdo/Documents/Exam U4")
getwd()

# Importing the dataset
dataset = read.csv('iris.csv')
petal = dataset[3:4]
sepal = dataset[1:2]


# Using the elbow method to find the optimal number of clusters

#PETAL
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(petal, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')

#SEPAL
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(sepal, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')


# Fitting K-Means to the dataset

#PETAL
set.seed(29)
kmeans = kmeans(x = petal, centers = 3)
y_kmeans = kmeans$cluster

#SEPAL
set.seed(29)
kmeans = kmeans(x = sepal, centers = 3)
y_kmeans = kmeans$cluster

# Visualising the clusters
# install.packages('cluster')

#PETAL
library(cluster)
clusplot(petal,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of iris'),
         xlab = 'Petal Length',
         ylab = 'Petal Width')

#SEPAL
library(cluster)
clusplot(sepal,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of iris'),
         xlab = 'Sepal Length',
         ylab = 'Sepal Width')
```
#### Data visualization


#### Analysis