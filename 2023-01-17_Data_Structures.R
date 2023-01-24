#### Vectors, Matricies, Data Frames, and Lists
#### 17 January 2023
#### PPW

### Vectors (continued)
### Properties

## Coercion

## All atomic vectors are of the same data type
## If you use c() to assemble different types, R coerces them
## logical -> integer -> double -> character

a <- c(2, 2.2)
a #coerces to double

b <- c("purple", "green")
typeof(b)
#stays as character

d <- c(a,b)
print(d)
#makes them all characters

### comparison operators yield a logical result
a <- runif(10)
print(a)
# gives random values

a > 0.5 #said T/F for being true

### How many elemetns in the vector are >0.5?
sum(a > 0.5) #sums up the response from above
mean(a > 0.5) #mean of proportion of elements that are > 0.5


### Vectorization
## adds a constant to a vector
z <- c(10, 20, 30)
z + 1 ##makes it 11, 21, 31

## what happens when vectors are added together
y <- c(1, 2, 3)
z + y ## resultss in an "element by element" operation on the vector, making them 11, 22, 33

## Recycling
# what id vector lenghts are not equal?

z
x <- c(1,2)
z+x #warning is issued but calculation is still made
#shorter vector is always recycled

## Simulating data: runif and rnorm()

runif(n=5, min=5, max=10) #radomly generated numbers with n=sample size, min=minimum value, max=maximum value

set.seed(123)
runif(n=5, min=5, max=10) ##run these both together, same random numbers will be generated everytime you run them together

## rnorm: random normal values with mean 0 and sd 1
RandomNormalNumber <- rnorm(100)
mean(RandomNormalNumber) #hist function shows the distribution in a graph 


##### Matrix data structures
### 2-dimensional (rows and columns)
### still homogeneous data type 

# matrix is an automic vector organiized into rows and columns
my_vec <- 1:12

m <- matrix(data = my_vec, nrow = 4) # now in matrix, 3x4
m <- matrix(data = my_vec, ncol = 3) # same as above
m <- matrix(data = my_vec, ncol=3, byrow=T) #changes the order numbers appear to left to right instead of top to bottom
# change to byrow=F to switch to line 


##### Lists
## are like aromic vectors but each element can hold different data types and sizes

mylist <- list(1:10, matrix(1:8, nrow=4, byrow=TRUE), letters[1:3], pi) #list with four different types and elements
class(mylist) #type
str(mylist) #preview of list

### subsetting lists
## using [] gives you a single item BUT not the elements
mylist[4] #gives you just element in spot 4 which is always type list
mylist[4] - 3 #error

# to grab object itself, use[[]]
mylist[[4]] #now we access contents

mylist[[2]] #returns the matrix
mylist[[2]][4,1] #calls up the list, extracts elements from compartment, pulls from the fourth row, first column
## in 2 dimensional - first number is row index, second is column [row, column]

mylist[c(1,2)] #to obtain multiple compartments

c(mylist[[1]], mylist[[2]]) # to obtain multiple elements within list

### Name list items when they are created
# $ accesses names items
mylist2 <- list(Tester = FALSE, littleM = matrix(1:9, nrow=3))
mylist2 #shows each value and its name
mylist2$Tester #runs the name of the elements and returns the elements contents
mylist2$littleM[2,3] #returns the second row, third column of the "littleM" element

mylist2$littleM[2,] #gets the whole second row since column selection is left blank

mylist2$littleM[5] #gives you single integer in place #5, but better to use [row, column] form

### unlist to string everything back to vectors
unRolled <- unlist(mylist2)
unRolled

data(iris)
head(iris) #lets you see the first 6 lines of something
plot(Sepal.Length ~ Petal.Length, data = iris) # relates sepal to petal lentgh and returns graph y~x

model <- lm(Sepal.Length ~ Petal.Length, data = iris) #shows linear model not graph

results <- summary(model) #gives stats we like to see/see in excel

str(results)

#use [] to extract Petal.Length pvalue
results$coefficients
results$coefficients[2,4]

#different way: use unlist()
unlistedresults <- unlist(results)
unlistedresults$coefficients8


##### Data frames
## (list of) equal-length vectors, each of which is a column, 

varA <- 1:12
varB <- rep(c("con", "lowN", "highN"), each=4) # repeats each character four times
varC <- runif(12)

dframe <- data.frame(varA, varB, varC, stringsAsFactors = FALSE) ##stringsAs... makes them readable as characters
print(dframe) #shows you as list
str(dframe) # tells you info

# add another row
newData <- list(varA=13, varB="HighN", varC=0.668)

#use rbind() to add row to other data
dframe <- rbind(dframe, newData) #adds 13th observation at the end

##why can't we use c()?
Newdata2 <- c(14, "HighN", 0.668)
# coerces to character
dframe <- rbind(dframe, Newdata2) #all character data types now!

### add a column
newVar <- runif(15)

#use cbind() function to add column
dframe <- cbind(dframe, newVar) #adds newVar as column
head(dframe) #first 6

### Data Frames vs. Matricies
zMat <- matrix(data=1:30, ncol=3, byrow=T)
zdframe <- as.data.frame(zMat)
zdframe #changes matrix headings to titles not [row,column]

zMat[3,3]
zdframe[3,3] #give the same response since located the same, just named differently

zMat[,3]
zdframe[,3] #same as ^^ just with whole column (can also do opposite for row)

zMat[3] #gives just third element
zdframe[3] #gives third column 


##### Eliminating NAs
# complete.cases() function 
zd <- c(NA, rnorm(10), NA, rnorm(3))
complete.cases(zd) #gives logical output to say where NAs are

# clean out NAs
zd[complete.cases(zd)] #automatically removes the NAs 
which(!complete.cases(zd)) #tells you which # the NAs are, ! means "is not"

#use with matrix
m <- matrix(1:20, nrow=5)
m[1,1] <- NA #makes [1,1] a NA
m[5,4] <- NA #" [5,4] "

complete.cases(m) #gives T/F as to whether whole row is 'complete' (no NAs)
m[complete.cases(m),] #gives # values

## get complete.cases for only certain rows
m[complete.cases(m[,c(1:2)]),] # returns all columns and shows NA