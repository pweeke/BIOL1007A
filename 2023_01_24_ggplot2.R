#### ggplot2
#### 24 January 2023
#### PPW

library(ggplot2)
library(ggthemes)
library(patchwork)

#### Template for ggplot code
### ggplot(data = <DATA>, mapping = aes(x = xVar, y = yVar)) +
### <GEOM FUNCTION> ##+ geom_boxplot()
### print(p1)

#### Load in built-in dataset
d <- mpg
str(mpg)

library(dplyr)
glimpse(d)

#### qplot: quick, plotting
qplot(x=d$hwy)

# histogram
qplot(x=d$hwy, fill = I("darkblue"), color = I("black")) #need I() to get the colors

# scatterplot
qplot(x=d$displ, y=d$hwy, geom=c("smooth", "point"), method="lm")

# boxplot
qplot(x=d$fl, y=d$cty, geom="boxplot", fill=I("forestgreen"))

# barplot
qplot(x=d$fl, geom="bar", fill=I("forestgreen"))

### Create some data (specified counts)
x_trt <- c("Control", "Low", "High")
y_resp <- c(12, 2.5, 22.9)
qplot(x=x_trt, y=y_resp, geom="col", fill=I(c("forestgreen", "pink", "yellow2")))

##### ggplot: uses dataframes instead of vectors

p1 <- ggplot(data=d, mapping=aes(x=displ, y=cty, color = cyl)) + 
  geom_point()
p1

p1 + theme_base()
p1 + theme_bw()
p1 + theme_classic()
p1 + theme_linedraw()
p1 + theme_dark()
p1 + theme_minimal()
p1 + theme_void()
p1 + theme_economist()

p1 + theme_bw(base_size = 30, base_family = "serif")

p2 <- ggplot(data=d, aes(x=fl, fill=fl)) +
  geom_bar()
p2 + coord_flip() + theme_classic(base_size = 15, base_family = "sans") #flips axis, changes theme and size/font

# Theme modifications
p3 <- ggplot(data=d, aes(x=displ, y=cty)) +
  geom_point(size = 4,shape = 21, color = "magenta", fill = "black") +
  xlab("Count") +
  ylab("Fuel") +
  labs(title = "My Title Here", subtitle = "my subtitle goes here") #x=/y= axis
p3 + xlim(1,10) + ylim(0, 35)

library(viridis)
cols <- viridis(7, option = "magma") #plasma, turbo, regular (just write 7) - have to give the same # as you have groups
ggplot(data=d, aes(x=class, y=hwy, fill=class)) +
  geom_boxplot() +
  scale_fill_manual(values=cols)

library(patchwork)
p1 / p2/ p3 #shows all three
(p1 + p2) / p3 # 1 and 2 on the top w 3 on the bottom 






  
  
  