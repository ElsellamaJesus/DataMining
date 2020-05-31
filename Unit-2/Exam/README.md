# Exams
### <html><H3 align="center"> Exam U2 </H3></html>
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

---