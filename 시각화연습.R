
library(ggplot2)
library(dplyr)

#[산점도]
#1
mpg<-as.data.frame(ggplot2::mpg)  #데이터 읽어오기 
mpg

ggplot(data=mpg,aes(x=displ,y=hwy))+geom_point()

#2
midwest<-as.data.frame(ggplot2::midwest)
midwest
ggplot(data=midwest,aes(x=poptotal,y=popasian))+geom_point()

#[막대그래프]
df_mpg<-mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy)) 

ggplot(data=df_mpg,aes(x=drv,y=mean_hwy))+geom_col()  


#[box graph]
ggplot(data=mpg,aes(x=drv,y=hwy))+geom_boxplot()
