### Entering the tidyverse(dplyr)
### 23 January 2023
### PPW

###tidyverse: collection of packages that share philosophy, grammar (or how the code is structured), and data structures

## Operators: symbols that tell R to perform different operations (between variables, functions, etc.)

## Arithmetic operators: + - * / ^ ~
## Assignment operator: <- 
## Logical operators: !(not) &(and) |(or)
## Relational operators: == != > < >= <=
## Miscellaneous operators: %>% (forward pipe) %in%

library(tidyverse) #library function to load in packages

# dplyr: new(er) packages provides a set of tools for manipulating data sets
# specifically written to be fast
# individual functions that correspond to common operations

#### The core verbs
## filter()
## arrange()
## select()
## group_by() and summarize()
## mutate()

## built in data set
data(starwars)
class(starwars)

## Tibble (tbl): modern take on data frames
# keeps great aspects of dfs and drops frusterating ones (change variables)
glimpse(starwars)

### NAs
anyNA(starwars) #are there any NAs?
starwarsClean <- starwars[complete.cases(starwars[,1:10]),]
anyNA(starwarsClean[,1:10])

### filter(): picks/subsets observations (ROWS) by their values

filter(starwarsClean, gender == "masculine" & height < 180) # , means &

filter(starwarsClean, gender == "masculine", height < 180, height > 100) #Multiple conditions for the same variable

filter(starwarsClean, gender == "masculine" | gender == "feminine") # using the | (or) to get either 

#### %in% operator (matching); similar to == but you can compare vectors of different length
#sequence of letters
a <- LETTERS[1:10]
length(a) #length of vector

b <- LETTERS[4:10]
length(b)

## output of %in% depends on first vector
a %in% b #returns logical if b is in a
b %in% a

# use %in% to subset
eyes <- filter(starwars, eye_color %in% c("blue", "brown"))
view(eyes)

## arrange(): reorders rows
arrange(starwarsClean, by=height) #default is ascending order
# can use helper function desc()
arrange(starwarsClean, by=desc(height))

arrange(starwarsClean, height, desc(mass)) #second variable used to break ties

sw <- arrange(starwars, by=height)
tail(sw) #missing values are at the end


#### select(): chooses variables (COLUMNS) by their names
select(starwarsClean, 1:11)
select(starwarsClean, name:species)
select(starwarsClean, -(films:starships)) #all remove the last three columns 


### Rearrange columns
select(starwarsClean, name, gender, species, everything()) #reorders the columns
#everything() is a helper function; useful if you have a couple varibales you want to move to the beginning 

# contains() helper function
select(starwarsClean, contains ("color")) # returns column names w phrase in it
# others include: ends_with(), starts_with(), num_range()

# select() can also rename columns
select(starwarsClean, haircolor = hair_color) #returns newly names column
rename(starwarsClean, haircolor = hair_color) #returns whole df

### mutate(): creates new variables using functions of existing variables
# let's create a new column that is height divided by mass
mutate(starwarsClean, ratio = height/mass)

starwars_lbs <- mutate(starwarsClean, mass_lbs = mass*2.2)
view(starwars_lbs)
starwars_lbs <- select(starwars_lbs, 1:3, mass_lbs, everything()) #brought column to the front 

# transmute()
transmute(starwarsClean, mass_lbs=mass*2.2) #only returns mutated column
transmute(starwarsClean, mass, mass_lbs=mass*2.2, height) #returns the three columns

### group_by() and summarize()
summarize(starwarsClean, meanHeight = mean(height)) # returns one mean of all characters - use na.rm if throws NA

summarize(starwarsClean, meanHeight = mean(height), totalNumber = n()) # returns av height and total # of operations

# use group_by for maximum usefulness
starwarsGenders <- group_by(starwars, gender) #seperated into gender groups
head(starwarsGenders)

summarize(starwarsGenders, meanHeight = mean(height, na.rm=TRUE), totalNumber=n()) #returns av height of each gender grouped

# Piping %>%
# use to emphasize a sequence of actions 
# allows you to pass on intermediate results onto the next function (uses output of one function as input of the next function)
# avoid if you need to manipulate more than one object/variable at a time; or if variable is meaningful
# formatting: should always have a space before the %>% followed by the new line

starwarsClean %>% 
  group_by(gender) %>%
  summarize(meanHeight = mean(height, na.rm=TRUE), totalNumber=n()) #much cleaner with piping

##case_when() is useful for multiple if/ifelse statements
starwarsClean %>%
  mutate(sp = case_when(species == "Human" ~ "Human", TRUE ~ "Non-Human")) #uses conditions, puts "Human" if true in sp column, puts "Non-Human" if it's FALSE










