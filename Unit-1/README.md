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



        