#### Lecture 8: Loading in Data
#### 26 January 2023
### PPW

### Create and save a dataset
### write.table(x=varName, file="outputFileName.csv", header=TRUE, sep=",")


### These functions read in a data set
### read.table(file="path/to/data.csv", header=TRUE, sep =",")
### read.cs(file="data.csv", header=T)

### Use RDS objects when only working in R
# helpful in large datasets
## saveRDS(my_data, file="FileName.RDS")
## readRDS("FileName.RDS")
## p <- readRDS("FileName.RDS")

### Long vs Wide data formats
### wide format = contains values that do not repeat in the ID column
### long format = contains values that DO repeat in the ID column


## pivot_ longer: makes data longer
library(tidyverse)
glimpse(billboard) #a wide dataset with lots of columns (less rows)
b1 <- billboard %>%
  pivot_longer( 
    cols = starts_with("wk"), #specifies which columns you want to make 'longer'
    names_to = "Week", #name of new column which will contain the header names
    values_to = "Rank", #name of new column which will contain the values
    values_drop_na = TRUE #removes any rows where the value = NA
  )

view(b1) ## rmarkdown does NOT like this - remove before knitting 

## pivot_wider: makes data wider
## best for making occupancy matrix
glimpse(fish_encounters)
view(fish_encounters)
fish_encounters %>%
  pivot_wider(names_from = station, #which column you want to turn into multiple columns
              values_from = seen #which column contains the values for new column cells
              )

fish_encounters %>%
  pivot_wider(names_from = station,
              values_from = seen,
              values_fill = 0) #fills NAs with 0

#### Dryad: makes research data freely reusable, citable, and discoverable

## read.table() after loading it into BIOL folder
dryadData <- read.table(file = "data/veysey-babbitt_data_amphibians.csv", header = TRUE, sep = ",") 

glimpse(dryadData) #make sure dataset loaded in right
head(dryadData)

table(dryadData$species) ### allows you to see different groups of character column 
summary(dryadData$mean.hydro)

## copied in from Assignment 8
str(dryadData$species) ## running thsis before next code shows that R thinks species are just one thing
dryadData$species<-factor(dryadData$species, labels=c("Spotted Salamander", "Wood Frog")) ## this creates 'labels' to use for the plot 

dryadData$treatment <- factor(dryadData$treatment, 
                              levels=c("Reference",
                                       "100m", "30m")) ## gives 'labels' for x-axis


p<- ggplot(data=dryadData, 
           aes(x=interaction(wetland, treatment), 
               y=count.total.adults, fill=factor(year))) + geom_bar(position="dodge", stat="identity", color="black") +
  ylab("Number of breeding adults") +
  xlab("") +
  scale_y_continuous(breaks = c(0,100,200,300,400,500)) +
  scale_x_discrete(labels=c("30 (Ref)", "124 (Ref)", "141 (Ref)", "25 (100m)","39 (100m)","55 (100m)","129 (100m)", "7 (30m)","19 (30m)","20 (30m)","59 (30m)")) +
  facet_wrap(~species, nrow=2, strip.position="right") +
  theme_few() + scale_fill_grey() + 
  theme(panel.background = element_rect(fill = 'gray94', color = 'black'), legend.position="top",  legend.title= element_blank(), axis.title.y = element_text(size=12, face="bold", colour = "black"), strip.text.y = element_text(size = 10, face="bold", colour = "black")) + 
  guides(fill=guide_legend(nrow=1,byrow=TRUE)) 

p


## continued annotating in daily assignment 8






