library(dplyr)
exam <- read_excel("D:/may/excel_exam.xlsx")
View(exam)


#row를가지고 오는 걸 filter 
#head 앞에부분 몇개만 
#tail 뒷부분 몇개만 
exam%>%filter(class==1)%>%head(3)

#필터된것을 변수에 저장 

class1<-exam %>% filter(class==1)
class2<-exam %>% filter(class==2)
class3<-exam %>% filter(class==3)
class4<-exam %>% filter(class==4)

classNot1<-exam %>% filter(class!=1)
classNot1


#파이프 연산자를 사용하면서필터로 row를 먼저 가지고 와주고 -> 가지고 온 데이터 중에서 column값을 추출해주면 된다. 

#80점인것을 골라라 영어가. 
exam%>%filter(english<=80)

#80점 아래중에서 클래스가 3인것만 골라라 

exam %>% filter(english<=80 & class==3)

#수학이 80점 이상이거나 과학이 85점 이상일때 
exam %>% filter(math>=80|science>=85)

#클래스가 1이거나 3이거나 5일 때 
exam %>% filter(class==1|class==3|class==5)
#또는 (%in%= `~중에서`)
exam %>% filter(class %in% c(1,3,5)) 

mean(class1$math)
max(class1$math)

#ggplot2:package+dataset 
install.packages("ggplot2")
library(ggplot2)

mpg<-as.data.frame(ggplot2::mpg)

View(mpg)

#1.ford차량 row 추출

ford1<-mpg %>% filter(manufacturer=="ford")
ford1


#3. ford차량의 고속도로 연비평균
mean(ford1$hwy)


#1. class가 compact의 고속도로 연비 
compact<-mpg %>% filter(class=="compact")
mean(compact$hwy)
#2. class가 suv의 고속도로 연비
suv<-mpg %>% filter(class=="suv")
mean(suv$hwy)

#select는 열을 추출할땐 사용 
#eg.math column을 가지고 올때 사용 
exam %>% select(math)
exam %>% select(math,english)
#math빼고 가져와주세요 (-)
exam %>% select(-math)

#readable format
exam %>% 
  filter(class==1) %>% #class가 1인 row 추출 
  select(english) %>%   # 그중 english 추출
  head(2) #앞부분 2열 

exam %>% arrange(math) #arrange-> 오름차순 

exam %>% arrange(class,math) #class 1차정렬하고 math 2차정렬

exam %>% arrange(desc(class,math))#desc:내림차순

a<-exam %>% arrange(class,math) #변수저장 
a %>% select(math,english) #오름차순햇던 부분만 추출 

exam %>% mutate(total=math+english+science) #total 계산해서 넣기 + 추가 


exam %>% 
  group_by(class) %>% 
  summarise(meanMath=mean(math), 
            sumMath=sum(math),
            median=median(math),
            n=n()
  )

#회사별로 "suv"자동차의 도시 및 고속도로 통합 연비 평균을 구해 내림차순으로 출력하기 
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>% 
  mutate(tot=(cty+hwy)/2) %>% 
  summarise(mean=mean(tot)) %>% 
  arrange(desc(mean)) %>% 
  head(5)



