file<-read.csv("D:/may/day04/naData (1).csv")
View(file)

file

mean(file$english)
mean(file$math)

#is.na<- na 전처리 함수 

file$math<-ifelse(is.na(file$math),0,file$math)
file
file$class<-ifelse(is.na(file$class),0,file$class)
file
mean(file$math)


