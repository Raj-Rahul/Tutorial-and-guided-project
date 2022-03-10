#list

l1 <- list("apple", 23, "prashant", "rahul", 45, 21.3, TRUE)
l2 <- list(c(1,2,3),c("a","b","c"),c(T,F,T))

#matrix

m1 <- matrix(c(1,2,3,4,5,6))
m2 <- matrix(c(1,2,3,4,5,"z"),nrow = 2,ncol =3)
m3 <- matrix(c(1,2,3,4,5,"z"),nrow = 2,ncol =3,byrow=T)

#Array

vec1 <- c(1,2,3,4,5,6)
vec2 <- c(7,8,9,10,11,12)

a1 <- array(c(vec1,vec2),dim= c(2,3,2))

#Factor

color1 <- c("red","violet","green","blue")
as.factor(color1) -> color1
color1

#Data_frame

data.frame(student_name=c("Rajat","Ayush","Aditya","Shreya","Bhavya","Sagar","Rahul","Shikha"),Marks=c(80,90,89,98,79,75,92,85),Roll_code=c(001,002,003,004,005,006,007,008))

#inbuilt_function

View(iris)
str(iris)
head(iris)
tail(iris)
table(iris)
table(iris$Species)

min(iris$Sepal.Length)
max(iris$Sepal.Length)
mean(iris$Sepal.Length)

#if...else

if(iris$Sepal.Length[1]<4){
  print("Sepal Length is less than 4")
}else{
    print("Sepal Length is greater than 4")
}

#for statement

vec1 <- 1:9

for(i in vec1){
  print(i+5)
}

#while statement

i=1
while(i<10){
  print(i+5)
  i=i+1
}

#user-defined function

add5<-function(x){
  print(x+10)
}
add5(3)

#data_manipulation_in_R

library(dplyr)
DataProducts <- read.csv("C:/Users/Hp/Downloads/ProductsData.csv")


DataProducts %>% select(1,2) -> DataProducts1_2
View(DataProducts1_2)
DataProducts %>% select(3:6) -> DataProducts3_6
View(DataProducts3_6)
DataProducts %>% select("Product","Amount","Country") -> DataProducts_Price
View(DataProducts_Price)
DataProducts %>% select(starts_with("P")) -> DataProducts_P
View(DataProducts_P)
DataProducts %>% select(ends_with("y")) -> DataProducts_y
View(DataProducts_y)

#Filters

DataProducts %>% filter(Product=="Banana") -> DataProducts_BA
View(DataProducts_BA)
DataProducts %>% filter(Order.ID>50) -> DataProducts_Id
View(DataProducts_Id)
DataProducts %>% filter(Product=="Apple" & Order.ID>50) -> DataProducts_PO
View(DataProducts_PO)

#combining_Filters_&_Select

DataProducts %>% select("Order.ID","Product","Category") %>% filter(Product=="Banana") -> Products_FS
View(Products_FS)
DataProducts %>% select("Order.ID","Product","Category") %>% filter(Product=="Banana" & Order.ID>50) -> Products_FS1
View(Products_FS1)

#Data_Visualization_with_R

library(ggplot2)
View(diamonds)
?diamonds

#Histogram

ggplot(data=diamonds,aes(x=price)) + geom_histogram()
ggplot(data=diamonds,aes(x=price)) + geom_histogram(fill="Blue")
ggplot(data=diamonds,aes(x=price)) + geom_histogram(fill="Blue",col="Red")  

#Barplot

ggplot(data=diamonds,aes(x=cut,fill=cut)) + geom_bar()
ggplot(data=diamonds,aes(x=color,fill=color)) + geom_bar()

#Scatterplot

ggplot(data=diamonds,aes(x=carat,y=price)) + geom_point()
ggplot(data=diamonds,aes(x=carat,y=price,col=cut)) + geom_point()

#Box-plot

ggplot(data = diamonds, aes(x=clarity, y=carat, fill=clarity)) + geom_boxplot()
ggplot(data = diamonds, aes(x=clarity, y=carat,fill=clarity,col="orange")) + geom_boxplot()
  
#Faceting

ggplot(data = diamonds, aes(x=clarity, y=carat,fill=cut)) + geom_boxplot() + facet_grid(~cut)
ggplot(data = diamonds, aes(x=clarity, y=carat,fill=cut,col="orange")) + geom_boxplot() + facet_grid(~cut)

#Pokemon

Pokemon <- read.csv("C:/Users/Hp/Downloads/pokemon.csv")
View(Pokemon)

#checking number of rows and columns

nrow(Pokemon) #output is 801
ncol(Pokemon) #output is 41

#tabulation of categorical columns

table(Pokemon$is_legendary)
table(Pokemon$generation)
table(Pokemon$type1)

#min_max

min(Pokemon$hp) #output is 1
max(Pokemon$hp) #output is 255

min(Pokemon$speed) #output is 5
max(Pokemon$speed) #output is 180

#checking missing values

is.na((Pokemon$abilities))
sum(is.na(Pokemon$abilities))

#Renaming column names

colnames(Pokemon)[colnames(Pokemon)=='type1'] <- "Primary_Type"
View(Pokemon)
colnames(Pokemon)[colnames(Pokemon)=='type2'] <- "Secondary_Type"
View(Pokemon)
colnames(Pokemon)[colnames(Pokemon)=='name'] <- "Pokemon_names"
View(Pokemon)

#grass pokemon

Pokemon %>% filter(Primary_Type=="grass") -> grass_pokemon
View(grass_pokemon)

min(grass_pokemon$speed) #output is 10
max(grass_pokemon$speed) #output is 145

mean(grass_pokemon$sp_attack) #output is 74.32051
mean(grass_pokemon$sp_defense) #output is 69.23077

#visualizing stats of grass-pokemon

library(ggplot2)
ggplot(data = grass_pokemon, aes(x=hp)) + geom_histogram(fill="orange")
 
#height
ggplot(data = grass_pokemon, aes(x=height_m)) + geom_histogram(fill="green")

#weight
ggplot(data = grass_pokemon, aes(x=weight_kg)) + geom_histogram(fill="blue")

#legendary Vs not-legendary
ggplot(data = grass_pokemon, aes(x=is_legendary)) + geom_bar(fill="red")


#Fire_pokemon

Pokemon %>% filter(Primary_Type=="fire") -> fire_pokemon
View(fire_pokemon)

min(fire_pokemon$speed) #Output is 20
max(fire_pokemon$speed) #Output is 126

mean(fire_pokemon$sp_attack) #output is 87.73077
mean(fire_pokemon$sp_defense) #output is 71.53846

#Visualization stats of fire_pokemon

ggplot(data = fire_pokemon,aes(x=generation,fill=as.factor(generation))) +geom_bar()

#Secondary_type

ggplot(data = fire_pokemon,aes(x=Secondary_Type,fill=Secondary_Type)) +geom_bar()

#sp_attack Vs #sp_defence

ggplot(data = fire_pokemon,aes(x=sp_attack, y=sp_defense)) + geom_point(col="coral")

#height & weight

ggplot(data = fire_pokemon,aes(x=height_m, y=weight_kg)) + geom_point(col="coral")

#Water_Pokemon

Pokemon %>% filter(Pokemon$Primary_Type=="water") -> water_pokemon
View(water_pokemon)

min(water_pokemon$speed) #output is 5
max(water_pokemon$speed) #output is 132

mean(water_pokemon$sp_attack) #output is 74.0614
mean(water_pokemon$sp_defense) #output is 71.79825

#visualization stats of water_pokemon

#against_ice

ggplot(data=water_pokemon,aes(x=against_ice)) +geom_histogram()

#against_poison

ggplot(data=water_pokemon,aes(x=against_poison)) +geom_histogram()

#against_grass

ggplot(data=water_pokemon,aes(x=against_grass)) +geom_histogram()

#Psychic pokemon

Pokemon %>% filter(Pokemon$Primary_Type=="psychic") -> psychic_pokemon
View(psychic_pokemon)

min(psychic_pokemon$speed) #output is 20
max(psychic_pokemon$speed) #output is 180

mean(psychic_pokemon$sp_attack) #output is 92.60377
mean(psychic_pokemon$sp_defense) #output is 85.73585

#visualization stats of psychic pokemon

ggplot(data = psychic_pokemon,aes(x=base_total)) +geom_histogram(fill="blue")

ggplot(data = psychic_pokemon,aes(x=as.factor(generation),y=sp_defense)) +geom_boxplot(fill="blue")

ggplot(data = psychic_pokemon,aes(x=is_legendary)) +geom_bar(fill="blue")


h <- c(3,7,NA,4,7)
g <- c(5,NA,1,2,2)
x+y



