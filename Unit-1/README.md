## Practices
---
### Practice 1
 Test the Law Of Large Numbers for N random normally distribute
 numbers with mean = 0, stdev=1:   
 Create an R script that will count how many of these numbers fall between -1 and 1 and divide
 by the total quantity of N
 You know that E(X) = 68.2%
 Check that Mean(Xn)->E(X) as you rerun your script while increasing N

Hint:
1. Initialize sample size
2. Initialize counter
3. loop for(i in rnorm(size))
4. Check if the iterated variable falls
5. Increase counter if the condition is true
6. return a result <- counter / N


#### 1.  Initialize sample size
    
    x<-rnorm(50)
    y <- dnorm(x,mean = 0, sd = 1)
    plot(x,y)
    
#### 2. Initialize counter
    
    count <- 0
    res <- 0
    
#### 3.  loop for(i in rnorm(size))
    
    for(i in rnorm(50))
    {
    count <- count+1
    print(count)
    
#### 4. Check if the iterated variable falls
    
    if(i<=1&&i>=-1){
        print(i)
        print("^ este esta entre -1 y 1")
    
#### 5. Increase counter if the condition is true
        
            res <- res +1
        }
        else
        {
            print(i)
            print("este no esta en el rango")
        }
        }
        
#### 6. return a result <- counter / N
        
        Res <- res/count
        print(Res)
---
### Practice 2
Practice find 20 more functions in R and make an example of it.

##### 1.  c (a1, a2, ...) 
This function allows you to concatenate (join) objects: variables text, numbers, etc.
##### Example:
    x <- c (1,2,3)
    t <- c ("one", "two", "three")
    x; t

##### 2.  names (x) <- value  
Allows you to assign names to the elements of a variable.
##### Example:
    n <- c (2,4,6) # Assigns three values ​​to the variable x
    names (n) <- c ("I", "II", "III") # Assigns names to the three previous values
    n

##### 3.  invisible (x)
Hide x in the return function so that the result is not visible. x can still be assigned even if it does not appear.
##### Example:
    sum <- function (a, b) {
      s <- a + b
      return (invisible (s))
    }
    sum (5.4)

##### 4.  cat ("text", x1, "text", x2, ..., "\ n")
This function writes text and variables in the output.
The escape sequence "\ n" produces a new line and prevents the next program exit from being on the same line.
##### Example:
    x <- 2
    and <- 4
    cat (x, "raised to", y, "is", x ^ y, "\ n")

##### 5.  length (x)
Shows the number of elements in a vector.
##### Example:
    x <- 1:20
    length (x)

##### 6.  trunc (x)
Remove the decimals of a number.
##### Example:
    x <- 56.13
    trunc (x)

##### 7.  round (x, decimals = 0)
Round a number with the indicated decimals, if decimals are not indicated, it is rounded without decimals. When the decimal that follows the last one to be displayed is 5 or greater than five then the last decimal is approximated.
##### Example:
    round (6.78) = 7

##### 8.  runif (n, start = 0, end = 1)
Generate n random numbers between start and end. If no start and end is indicated, they are generated between 0 and 1.

##### 9.  max (x)
Shows the maximum number in a vector.
##### Example:
    and <- 1:20
    max (y)

##### 10. min (x)
Shows the minimum value in a vector.
##### Example:
    z <- 1:20
    min (z)

##### 11. mean (x)
Shows the average of the data in a vector.
##### Example:
    z <- 1:20
    mean (z)

##### 12. head (x)
Shows the first three data of a field or vector.
##### Example:
    z <- 1:20
    head (z)

##### 13. tail (x)
Shows the last three data of a field or vector.
##### Example:
    z <- 1:20
    tail (z)

##### 14. matrix (x: y)
Create a one-dimensional matrix, the "x" marks the beginning and the "y" the end of the range.
##### Example:
    x <- matrix (4:10)
    x

##### 15. matrix (a: b, ncol = x, nrow = x)
Create a two-dimensional array, a and b mark a range of data and the ncol and nrow commands, columns and rows respectively.

##### Example:
    x <- matrix (1: 9, ncol = 3, nrow = 3)
    x 

##### 16. dim (x)
Command to see the dimension of an array.

##### 17. is.matrix (x)
Returns a Boolean value TRUE or FALSE if it is an array or is not.

##### 18. colnames (x) = c ("data", "data", ...)
Command to rename the columns of a vector.
##### Example:
    colnames (x) = c ("Age", "Weight", "Height")

##### 19. rownames (x) = c ("data", "data", ...)
Command to rename the columns of a vector.
##### Example:
    rownames (x) = c ("Jesus", "Rodrigo", "Angel")

##### 20. Applies a function to an array, list or vector that is passed as a parameter.
Argument x: matrix, list or vector.
Argument and: "1" to operate on the columns and "2" to operate on the rows.
Argument z: Operator that is applied on rows or columns, according to the argument y.
##### Example:
    apply (x, 1, sum)
    apply (x, 2, sum)
---
### Practice 3
Scenario: You are a Data Scientist working for a consulting firm.
One of your colleagues from the Auditing Department has asked you
to help them assess the financial statement of organization X.

You have been supplied with two vector of data: mounthly revenue and
expenses for the financial year in quiestion. Your task is to calculate
the following financial matrics:

- profit for each mounth
- profit after tax for each month (the tax rate is 30%)
- profit margin for each month - equal to profit after tax divided by revenue
- good months - where the profit after tax was greater than the mean for the year
- bad months - where the profit after tax was less then the mean for years
- the best month - where the profit after tax was max for the year
- the worst month - where the profit after tax was min for the year

All results need to be presented as vectors.

Results for dollar values need to be calculate with $0.01 precision, but need to be presented in Units of $1,000(i.e. 1k) with no decimal point.

Results for the profit margin ratio needed to be presented in units of % with no decimal points.

Note: Your collegue has warned you that it is okay for tax for any given month to be # negative (in accounting terms, negative tax translates into a deferred tax asset).

##### Hint 1
##### Use:
##### round()
##### mean()
##### max()
##### min()


Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

Solution
#Calculate Profit As The Differences Between Revenue And Expenses
profit <- revenue - expenses
profit

#Calculate Tax As 30% Of Profit And Round To 2 Decimal Points
tax <- round(0.30 * profit, digits = 2)
tax 

Calculate Profit Remaining After Tax Is Deducted
profit.after.tax <- profit - tax
profit.after.tax

Calculate The Profit Margin As Profit After Tax Over Revenue
#Round To 2 Decimal Points, Then Multiply By 100 To Get %
profit.margin <- round(profit.after.tax / revenue, 2) * 100
profit.margin

Calculate The Mean Profit After Tax For The 12 Months
mean_pat <- mean(profit.after.tax)
mean_pat

Find The Months With Above-Mean Profit After Tax
good.months <- profit.after.tax > mean_pat
good.months

Bad Months Are The Opposite Of Good Months !
bad.months <- !good.months
bad.months

The Best Month Is Where Profit After Tax Was Equal To The Maximum
best.month <- profit.after.tax == max(profit.after.tax)
best.month

The Worst Month Is Where Profit After Tax Was Equal To The Minimum
worst.month <- profit.after.tax == min(profit.after.tax)
worst.month

Convert All Calculations To Units Of One Thousand Dollars
revenue.1000 <- round(revenue / 1000, 0)
expenses.1000 <- round(expenses / 1000, 0)
profit.1000 <- round(profit / 1000, 0)
profit.after.tax.1000 <- round(profit.after.tax / 1000, 0)

Print Results
revenue.1000
expenses.1000
profit.1000
profit.after.tax.1000
profit.margin
good.months
bad.months
best.month
worst.month

BONUS:
Preview Of What's Coming In The Next Section
M <- rbind(
  revenue.1000,
  expenses.1000,
  profit.1000,
  profit.after.tax.1000,
  profit.margin,
  good.months,
  bad.months,
  best.month,
  worst.month
)

Print The Matrix
M

--- 
### Practice 4

Dear Student,
Welcome to the dataset for the homework exercise.
#Instructions for this dataset:
 You have only been supplied vectors. You will need
 to create the matrices yourself.
#### Matrices:
 - FreeThrows
 - FreeThrowAttempts
Sincerely,
Kirill Eremenko
#### www.superdatascience.com

#### Copyright: These datasets were prepared using publicly available data.
           However, theses scripts are subject to Copyright Laws. 
           If you wish to use these R scripts outside of the R Programming Course
           by Kirill Eremenko, you may do so by referencing www.superdatascience.com in your work.

#### Comments:
Seasons are labeled based on the first year in the season
E.g. the 2012-2013 season is preseneted as simply 2012

#### Notes and Corrections to the data:
Kevin Durant: 2006 - College Data Used
Kevin Durant: 2005 - Proxied With 2006 Data
Derrick Rose: 2012 - Did Not Play
Derrick Rose: 2007 - College Data Used
Derrick Rose: 2006 - Proxied With 2007 Data
Derrick Rose: 2005 - Proxied With 2007 Data

# You have been supplied data for two more additional in-game statistics:

 You need to create three plots that portray the following insights:
 * Free Throw Attempts per game
 * Accurancy of Free Throws
 * Player playing style (2 vs 3 points preference) excluding Free Throws

 - Each Free Throw is worth 1 point

 The data has been supplied in the form of vectors. You will have to create
 two matrices before you proceed with the analysis.

#### Seasons
Seasons <- c("2005","2006","2007","2008","2009","2010","2011","2012","2013","2014")

#### Players
Players <- c("KobeBryant","JoeJohnson","LeBronJames","CarmeloAnthony","DwightHoward","ChrisBosh","ChrisPaul","KevinDurant","DerrickRose","DwayneWade")

#### Games 
KobeBryant_G <- c(80,77,82,82,73,82,58,78,6,35)
JoeJohnson_G <- c(82,57,82,79,76,72,60,72,79,80)
LeBronJames_G <- c(79,78,75,81,76,79,62,76,77,69)
CarmeloAnthony_G <- c(80,65,77,66,69,77,55,67,77,40)
DwightHoward_G <- c(82,82,82,79,82,78,54,76,71,41)
ChrisBosh_G <- c(70,69,67,77,70,77,57,74,79,44)
ChrisPaul_G <- c(78,64,80,78,45,80,60,70,62,82)
KevinDurant_G <- c(35,35,80,74,82,78,66,81,81,27)
DerrickRose_G <- c(40,40,40,81,78,81,39,0,10,51)
DwayneWade_G <- c(75,51,51,79,77,76,49,69,54,62)
#### Matrix
Games <- rbind(KobeBryant_G, JoeJohnson_G, LeBronJames_G, CarmeloAnthony_G, DwightHoward_G, ChrisBosh_G, ChrisPaul_G, KevinDurant_G, DerrickRose_G, DwayneWade_G)
rm(KobeBryant_G, JoeJohnson_G, CarmeloAnthony_G, DwightHoward_G, ChrisBosh_G, LeBronJames_G, ChrisPaul_G, DerrickRose_G, DwayneWade_G, KevinDurant_G)
colnames(Games) <- Seasons
rownames(Games) <- Players

#### Points
KobeBryant_PTS <- c(2832,2430,2323,2201,1970,2078,1616,2133,83,782)
JoeJohnson_PTS <- c(1653,1426,1779,1688,1619,1312,1129,1170,1245,1154)
LeBronJames_PTS <- c(2478,2132,2250,2304,2258,2111,1683,2036,2089,1743)
CarmeloAnthony_PTS <- c(2122,1881,1978,1504,1943,1970,1245,1920,2112,966)
DwightHoward_PTS <- c(1292,1443,1695,1624,1503,1784,1113,1296,1297,646)
ChrisBosh_PTS <- c(1572,1561,1496,1746,1678,1438,1025,1232,1281,928)
ChrisPaul_PTS <- c(1258,1104,1684,1781,841,1268,1189,1186,1185,1564)
KevinDurant_PTS <- c(903,903,1624,1871,2472,2161,1850,2280,2593,686)
DerrickRose_PTS <- c(597,597,597,1361,1619,2026,852,0,159,904)
DwayneWade_PTS <- c(2040,1397,1254,2386,2045,1941,1082,1463,1028,1331)
#### Matrix
Points <- rbind(KobeBryant_PTS, JoeJohnson_PTS, LeBronJames_PTS, CarmeloAnthony_PTS, DwightHoward_PTS, ChrisBosh_PTS, ChrisPaul_PTS, KevinDurant_PTS, DerrickRose_PTS, DwayneWade_PTS)
rm(KobeBryant_PTS, JoeJohnson_PTS, LeBronJames_PTS, CarmeloAnthony_PTS, DwightHoward_PTS, ChrisBosh_PTS, ChrisPaul_PTS, KevinDurant_PTS, DerrickRose_PTS, DwayneWade_PTS)
colnames(Points) <- Seasons
rownames(Points) <- Players

#### Free Throws
KobeBryant_FT <- c(696,667,623,483,439,483,381,525,18,196)
JoeJohnson_FT <- c(261,235,316,299,220,195,158,132,159,141)
LeBronJames_FT <- c(601,489,549,594,593,503,387,403,439,375)
CarmeloAnthony_FT <- c(573,459,464,371,508,507,295,425,459,189)
DwightHoward_FT <- c(356,390,529,504,483,546,281,355,349,143)
ChrisBosh_FT <- c(474,463,472,504,470,384,229,241,223,179)
ChrisPaul_FT <- c(394,292,332,455,161,337,260,286,295,289)
KevinDurant_FT <- c(209,209,391,452,756,594,431,679,703,146)
DerrickRose_FT <- c(146,146,146,197,259,476,194,0,27,152)
DwayneWade_FT <- c(629,432,354,590,534,494,235,308,189,284)
#### Matrix

#### <put your code here>

FreeThrows <- rbind(KobeBryant_FT, JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
rm(KobeBryant_FT, JoeJohnson_FT, LeBronJames_FT, CarmeloAnthony_FT, DwightHoward_FT, ChrisBosh_FT, ChrisPaul_FT, KevinDurant_FT, DerrickRose_FT, DwayneWade_FT)
rownames(FreeThrows) <- Players
colnames(FreeThrows) <- Seasons

#### Free Throw Attempts
KobeBryant_FTA <- c(819,768,742,564,541,583,451,626,21,241)
JoeJohnson_FTA <- c(330,314,379,362,269,243,186,161,195,176)
LeBronJames_FTA <- c(814,701,771,762,773,663,502,535,585,528)
CarmeloAnthony_FTA <- c(709,568,590,468,612,605,367,512,541,237)
DwightHoward_FTA <- c(598,666,897,849,816,916,572,721,638,271)
ChrisBosh_FTA <- c(581,590,559,617,590,471,279,302,272,232)
ChrisPaul_FTA <- c(465,357,390,524,190,384,302,323,345,321)
KevinDurant_FTA <- c(256,256,448,524,840,675,501,750,805,171)
DerrickRose_FTA <- c(205,205,205,250,338,555,239,0,32,187)
DwayneWade_FTA <- c(803,535,467,771,702,652,297,425,258,370)
#### Matrix

#### <put your code here>

FreeThrowAttempts <- rbind(KobeBryant_FTA, JoeJohnson_FTA, LeBronJames_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, ChrisPaul_FTA, KevinDurant_FTA, DerrickRose_FTA, DwayneWade_FTA)
rm(KobeBryant_FTA, JoeJohnson_FTA, CarmeloAnthony_FTA, DwightHoward_FTA, ChrisBosh_FTA, LeBronJames_FTA, ChrisPaul_FTA, DerrickRose_FTA, DwayneWade_FTA, KevinDurant_FTA)
rownames(FreeThrowAttempts) <- Players
colnames(FreeThrowAttempts) <- Seasons

myplot <- function(z, who=1:10) {
  matplot(t(z[who,,drop=F]), type="b", pch=15:18, col=c(1:4,6), main="Basketball Players Analysis")
  legend("bottomleft", inset=0.01, legend=Players[who], col=c(1:4,6), pch=15:18, horiz=F)
}
myplot(FreeThrows/Games)
        