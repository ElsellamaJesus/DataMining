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

In conclusion with the graph, we can define the genre "comedy" genres higher gains obtained scattered results, but the genre "action" has a greater amount and concentration of data which makes it a stable option.
Therefore, we are facing a question of quality and quantity. Which may indicate that "action" raises less profit because its initial investment is greater and "comedy" when investing less expectations, generates greater profits.
---