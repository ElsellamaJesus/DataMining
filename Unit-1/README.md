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


        