## <html><H2 align="center"> Exam U4 </H2></html>

#### Code R
```R
# K-Means Clustering
# Set our workspace
getwd()
setwd("C:/Users/JS/Documents/DataMining/Examen")
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

```
#### Data visualization
##### The elbow method
<html><div align="center"><img src="https://i.ibb.co/0D8Hh2w/The-Elbow-Method.png"></div></html>

##### Clusters of iris
<html><div align="center"><img src="https://i.ibb.co/89QYLNW/Clusters-of-iris.png"></div></html>

#### Analysis
The data set "iris.csv" is very popular in data analysis, its objective is to demonstrate that if there is similarity in the data they are grouped based on their characteristics, in this example the iris flowers are divided into three species " setosa "," Virginica "and" versicolor ", with characteristics of length and width of the" petal "and the" sepal "with 50 data respectively for each species.

* ##### Plot "Cluster of iris"
     According to the analysis of our graph in R, we could notice that the data in the distribution table of the groups does not exactly coincide with the graph, we conclude that they are needed due to the difficulty of the model.
     Taking into account the distribution of the data, the plot order was as follows:

     Results of predominant species in cluster
     Cluster 3 - Purple - setosa
     Cluster 2 - Red - virginica
     Cluster 1 - Blue - versicolor

     Concluding with these results and based on the data set, the dimensions of the iris flower "virginica" and "versicolor" have an interference in the groups because the characteristics are similar given in these 2 flowers are different in terms of color but their Dimensions are very similar, so the software classifies some plants in the same cluster.