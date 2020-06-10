# K-Means Clustering
# Set our workspace
getwd()
setwd("C:/Users/Valdo/Documents/GitHub/DataMining/Unit-3/ExamU4")
getwd()

# Importing the dataset
iris = read.csv('iris.csv')
iris.species<- iris[,"species"]
iris = iris[1:4]

# Using the elbow method to find the optimal number of clusters
set.seed(6)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(iris, i)$withinss)
plot(1:10,
     wcss,
     type = 'b',
     main = paste('The Elbow Method'),
     xlab = 'Number of clusters',
     ylab = 'WCSS')


# Fitting K-Means to the dataset
set.seed(29)
kmeans = kmeans(x = iris, centers = 3)
y_kmeans = kmeans$cluster
y_kmeans

# K-means cluster table
table(iris.species,kmeans$cluster,dnn=c("Species","Cluster"))

# Visualize the clusters
# Results
# Cluster 3 - Purple - setosa
# Cluster 2 - Red - virginica
# Cluster 1 - Blue - versicolor
library(cluster)
clusplot(iris,
         y_kmeans,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 4,
         plotchar = TRUE,
         span = TRUE,
         main = paste('Clusters of iris'),
)


