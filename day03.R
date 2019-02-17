#주제선정->수집->전처리->처리,분석->시각화
#1) 파일 2) 인터넷 스크랩핑/크롤링 

car.1<- read.csv("D:/may/car1 (1).csv")
View(car.1)

#<데이터 추출>
str(car.1)
names(car.1) #이름만 출력 
names(car.1)<-c("이름","밤낮","사고수","사망","중상","부상","고통","리포트")
#이름 바꾸기 

names(car.1)<-c("name","DayNight","count","death","injury","Sinjury","wound","report")
car.1$name #name열만 출력 

#car.1에 result라는 콜럼하나 추가한다.
#car.1의 Daynight 콜럼이 1일때 낮이고 아닐때 밤이다.
#삼항연산자로 쓸경우 제일 많이 쓰는건 -> ifelse
#ifelse(조건, 조건이 맞을때 답, 조건이 틀리 때 답)
car.1$result<-ifelse(car.1$DayNight==1,"낮","밤")

car.1$result2<-ifelse(car.1$name=="과속","속도문제","x")

car.1$result3<-ifelse(car.1$count>5000,"큰사고","작은사고")

#'밤'이 몇개고 '낮'이 몇개인지 테이블로 요약한번 해보자. 
table(car.1$DayNight)
table(car.1$result)


#<시각화>
hist(table(car.1$result))  #hist: histogram 

plot(table(car.1$result)) #막대그래프 

library(ggplot2)

qplot(car.1$result)


#again..
#없는 컬럼을 하나 변수로 만들어 추가. --->파생변수 (eg. result4)
car.1$result4<-ifelse(car.1$death>=1000,"대형사고",
               ifelse(car.1$death>=100,"중형사고","보통사고")
                )

car.1$result4  #컬럼추가
View(car.1)  #컬롬보기 

table(car.1$result4) #요약
qplot(car.1$result4) #시각화 ggplot2패키지. qplot이 알아서 빈도수 처리해줌. 'plot'함수는 베이스 페키지 .

car2<-data.frame(name=car.1$name,count=car.1$count,result4=car.1$result4) #데이터프래임만들기와 이름지정 
car2
View(car2)


#요약함수 (table함수)
#막대그래프 (qplot함수)
#부분 추출 함수(subset(추출대상,조건))
#car.1안에 있는 DayNight1에만 해당되는 count 
dayCount<-subset(car.1$count,car.1$DayNight==1)
dayCount

typeof(dayCount)
class(dayCount)
str(dayCount)

sum(dayCount)

nightCount<-subset(car.1$count,car.1$DayNight==0)
nightCount
sum(nightCount)

#1) 밤낮의 전체건수 결과를 데이터 프레임에 넣어보세요. 
#2) 막대그래프를 그려주세요 

dayNightTotal<-data.frame(day=sum(dayCount),night=sum(nightCount))
dayNightTotal

dayNightTotal<-data.frame(day=dayCount,night=nightCount)

View(dayNightTotal)
table(dayNightTotal)
hist(dayNightTotal$day)


#통계
sum(dayCount)
mean(dayCount)
max(dayCount)
min(dayCount)

sum(nightCount)
mean(nightCount)
max(nightCount)
min(nightCount)

#ifelse(조건1&조건2)
#밤에 과속인 경우:dayNight==0&name=="과속" 
#밤에 신호위반인 경우:dayNight==0&name=="신호위반" 


#True일때count값을 더해주세요.

nightSpeed<-sum(ifelse(car.1$DayNight==0&car.1$name=="과속",car.1$count,0))
nightSignal<-sum(ifelse(car.1$DayNight==0&car.1$name=="신호위반",car.1$count,0))

nightSpeed
nightSignal
#둘중에 누가 더 크나요?
max(nightSpeed,nightSignal)#nightSignal이 더 크다. 




