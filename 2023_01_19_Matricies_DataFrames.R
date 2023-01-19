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









