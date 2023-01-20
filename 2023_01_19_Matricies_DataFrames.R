#### Finishing up Matricies ad Data Frames
#### 19 January 2023
#### PPW

m <- matrix(data = 1:12, nrow=3)


## subsetting based on elements
m[1:2, ]
m[ , 2:4]

## subset with logical (conditional) statements
## selecet all columns for which the totals are > 15

colSums(m) #all sums
colSums(m)>15 #which sums are >15
m[, colSums(m)>15] #prints the columns that's sums are >15

## row sums now
## select rows that sum up to 22
m[rowSums(m)==22, ] #returns row that adds to 22

m[rowSums(m)!=22, ] #returns all rows that don't equal 22

## Logical operators: == , =! , > , <

## subsetting to a vector changes the data type
z <- m[1,]
print(z)
str(z)

z2 <- m[1, , drop=FALSE] ##keeps it a matrix
z2

# simulate new matrix
m2 <- matrix(data = runif(9), nrow=3)
m2


### use assignment operator to substitute values
m2[m2 > 0.6] <- NA
m2

data <- iris
head(data) #first 6
tail(data) #last 6

data[3,2] #numbered indicies
dataSub <- data[,c("Species", "Petal.Length")] #calling named columns
str(dataSub)

### sort a data frame by values
orderedIris <- iris[order(iris$Petal.Length),] ##order iris by petal.length cols
head(orderedIris)


#### FUNCTIONS in R!!

# everything in R is a function
sum(3,2) #sum
3 + 2 # + sign is a function
sd

### user-defined functions

## functionName <- function(argX=defaultX, argY=defaultY){}
  #curly bracket starts the body of the function
  ### lines of code and notes
  ### create local variables (only visible to R within the function)
  ### return(z) - instead of print for within a function

myFunc <- function(a=3, b=4){
  z <- a + b
  return(z)
}

myFunc() ##runs default- or z
myFunc(a=100, b=3.4) #outputs the changed arguments

myFuncBad <- function(a=3) {
  z <- a + b
  return(z)
}
myFuncBad() #doesn't work 

# DOESN'T recognize variables within function until saved outside as well

### multiple return statements

################################################################################
# FUNCTION: HWE
# input: all allele freq p (0,1)
# output: p and the freq of 3 genotypes AA AB BB
#------------------------------------------------------------------------------
#^ you can hide that as a section

HWE <- function(p=runif(1)){
  if(p>1.0 | p<0.0){
    return("Function Failure: p must be bweteen 0 and 1")
  }
  q <- 1-p
  fAA <- p^2
  fAB <- 2*p*q
  fBB <- q^2
  vecOut <- signif(c(p = p, AA = fAA, AB = fAB, BB = fBB), digits = 3)
    return(vecOut)
}
#############################################################################

HWE()
freqs <- HWE()
freqs
HWE(p=3)

### create a complex default value
####################################################################
#FUNCTION: fitlinear2
# fits simple regression line
# input: list (p) of predictor (x) and response (y)
# outputs: slope and p-value

fitlinear2 <- function(p=NULL){
  if(is.null(p)){
    p <- list(x=runif(20), y=runif(20))
  }
  myMod <- lm(p$x~p$y)
  myOut <- c(slope=summary(myMod)$coefficients[2,1], pValue= summary(myMod)$coefficients[2,4])
  plot(x=p$x, y=p$y) #quick plot to check output
  return(myOut)
}

fitlinear2() #default that simulated for us
myPars <- list(x=1:10, y=runif(10))
fitlinear2(p=myPars)



