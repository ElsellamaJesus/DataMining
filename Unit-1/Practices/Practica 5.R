?read.csv()

# Method 1: Select the file manually
stats <- read.csv(file.choose())
stats

# Method 2: Set Working Directory and Read Data
getwd()
#windows
setwd("E:/Miner�a de datos/DF")
#Mac
setwd()
setwd('/home/chris/Documents/itt/Enero_Junio_2020/Mineria_de_datos/DataMining/Dataframes')
getwd()
rm(stats)
stats <- read.csv("Demographic-Data.csv")

#------Exploring the data
stats
is.data.frame(stats)
nrow(stats)
ncol(stats)
head(stats, n=10)
tail(stats, n=8)
str(stats)
summary(stats)

#------Using the $ sing
stats
head(stats)
stats[3,3]
stats[3, "Birth.rate"]
typeof(stats)
stats$Internet.users
stats$Internet.users[2]
stats[ , "Internet.users"]
levels(stats$Income.Group)

#------Basic operations with dataframes-----------------------
stats[1:10, ] #subsetting
stats[3:9, ]
stats[c(4, 100)]
is.data.frame(stats[1, ])
is.data.frame(stats[,1])
is.data.frame(stats[,1, drop=F])
stats[,1, drop=F]

#-------Multiply columns
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#-------Add Columns
head(stats)
stats$BRbyIU <- stats$Birth.rate * stats$Internet.users
head(stats)

#------Thigs to know
stats$xyz <- 1:5
head(stats, n=12)

#------Remove columns
head(stats)
stats$BRbyIU <- NULL
stats$xyz <- NULL

#------Filtering Data Frames -----------------------
head(stats)
filter <- stats$Internet.users < 2 #TRUE
filter
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)

#Practice

#Filter countries by Low income
stats[stats$Income.Group == "Low income",]

#Filter countries by Lower middle income
stats[stats$Income.Group == "Lower middle income",]

#Filter countries by Upper middle income
stats[stats$Income.Group == "Upper middle income",]

#Filter by countrie Malta
stats[stats$Country.Name == "Malta",]


#Filter by countrie Qatar
stats[stats$Country.Name == "Qatar",]

#Filter by countrie Netherlands
stats[stats$Country.Name == "Netherlands",]

#Filter by countrie Norway
stats[stats$Country.Name == "Norway",]

