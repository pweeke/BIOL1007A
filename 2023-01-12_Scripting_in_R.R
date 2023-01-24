###### Programming in R
###### 12 January 2023
###### PPW

# Advantages
## interactive use
## graphics, statistics
## very active community of contributors
## works on multiple plattforms

# Disadvantages
## lazy evaluation
## some packages are poorly documented
## some functions are hard to learn (steep learning curve)
## unreliable packages
## problems with big data (multiple GBs)

# Let's start with the basics
## run using "command enter"
## Assignments operator: used to assign a new value to a variable

x <- 5
print(x)
x

y = 4 #legal but not used except in function arguments
print(y)
y = y + 1.1
y <- y + 1.1
y <- y + 1.1

## Variables: used to store information (a container) 

z <- 3 #single letter variables (temporary, don't show much)
plantHeight <- 10 #camel case format
plant_height <- 3.3 #snake case format #a preferred method
plant.height <- 4.2 #avoid using the period bc confusing
. <- 5.5 #we reserve this for a temporary variable (not saved to environment but can be run as placeholder)

## Functions: blocks of code that perform a task; use short command over again instead of writing out that block of code multiple times 

#you can create your own function!

square <- function(x = NULL){
  x <- x^2
  print(x)
}

z <- 103
square(x=z) #the argument name is x

## or there are built in functions
sum(109, 3, 10) ##look at package info using ?sum in console or going to help panel


### Atomic vectors
# one dimensional (a single row)
# data structures in R programming

### Types
# character strings (usually within quotes)
# integers (whole numbers)
# double (real numbers, decimal)
# both integers and doubles are numeric
# logical (TRUE or FALSE)
# factor (categorizes, groups variables)

#c function (combine)
z <- c(3.2, 5, 5, 6)
print(z) # prints
class(z) #tells you class of variable
typeof(z) #tells you type of variable
is.numeric(z) #returns t/f - asking a question

## c() always "flattens" to a vector
### c() useful for creating vectors
z <- c(c(3,4), c(5,6))

# character vectors
z <- c("perch", "bass", "trout")
print(z)
z <- c("this is only 'one' character string", "a second", "a third")
print(z)

typeof(z)
is.character(z) #is.functions tests whether it is certain data type

###Logical (Boolean), no quotes, all caps: TRUE and/or FALSE
z <- c(T, F, T, F) #as.functions coerces data type
z <- as.character(z)
is.logical(z)

# Type
# is.numeric / as.character
# type.of()

# Length 
length(z) #tells you how many variables are in it
dim(z) #reads NULL because there is only one dimension

## Names
z <- runif(5) # gives five random numbers
names(z) # no names

# add names: using <- (assignmnet operator) assigns names
names(z) <- c("chow", "pug", "beagle", "greyhound", "akita")
print(z)
names(z) #shows assigned names now

#### NA values
#### missing data
z <- c(3.2, 3.5, NA) #means that the third variable is NA
typeof(z) #can tell you based on dimension
mean(z) #can't tell you because there is an NA

#check for NAs
anyNA(z) #replies w/ t/f is there is/isn't an NA
is.na(z) #tells you which one is NA
which(is.na(z)) #helpful in exploring data and determining where NAs are 

## Subsetting vectors
# vectors are indexed 
z <- c(3.1, 9.2, 1.3, 0.4, 7.5)
z[4] #only returns the fourth element: using [] square bracekts to subset by index 
z[c(4,5)] #need c, otherwise reads as dimensions
z[-c(2,3)] # - (minus sign) before c: gives everything except those
z[-1]
z==7.5 # returns t/f with variables that are 7.5
z[z==7.5] # double equals inside the [] returns the exact match
z[z<7.5] #using logical statements inside [] to subset by conditions

which(z < 7.5) #returns which elements are <7.5
z[which(z<7.5)] # returns the value of the elements are <7.5 

# creating logical vector
z < 7.5

## subsetting characters (named elements)
names(z) <- c("a", "b", "c", "d", "e")
print(z)
z[c("a","d")] #returns the values of "a" and "d"

# subset
subset(x=z, subset= z>1.5) # returns all values > 1.5

# randomly sample 
# sample function
story_vec <- c("A", "Frog", "Jumped", "Here")
sample(story_vec) #runs and randomly returns the variables

# randomly select 3 elements from vector
sample(story_vec, size=3)

story_vec <- c(story_vec[1], "Green", story_vec[2:4])
story_vec[2] <- "Blue"
story_vec  

# vector function
vec <- vector(mode ="numeric", length=5)

### rep and seq functions
z <- rep(x=0, times=100) #repeats zero 100 times
z <- rep(x=1:4) #makes four variables 1 through 4 
z <- rep(x=1:4, each = 3) # same as above but repeats each one 3 times

z <- seq(from= 2, to=4) #makes 2, 3, 4
z <- seq(from= 2, to=4, by =0.5) # same as above but by 0.5s

z <- runif(5)
seq(from=1, to=length(z))
