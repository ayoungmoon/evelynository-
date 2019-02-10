a <-100 #변수 
b <-200 
print(a+b)

# 프로그램 전체 제어
  #1. 프로그램은 순차적으로 실행 
  #2. 반복
  #3. 조건 
# 데이터의 자료 구조 
  #데이터 프래임 = 열(vector), 행(list) 조합으로 만들어짐. 

name<-c(1,2,3,4,5)
name[3] #인덱스 []사용 

name[3]<-333  #인덱스3에 333으로 바꿈. 
print(name)
name

name<-c("김지훈","이유진","박동현","김민지")
name
name[4]<-"송민지"
name

str(name) #structure
table(name) #summary 
class(name) #data type 
typeof(name) #data type (detail)

eng<-c(90,80,60,70)
math<-c(50,60,100,20)

#자동완성 (컨트롤+스페이스바) 
midTerm<-data.frame(name,eng,math)
midTerm

str(midTerm) #structure
table(midTerm) #summary 
class(midTerm) #data type 
typeof(midTerm) #data type (detail)

View(midTerm) #capital letter 'v'

###############################################################

#2. 직접 데이터프레임을 만들어 봅시다. 

lastTerm <- data.frame(name2=c("song","kim","park"),eng2=c(100,50,80),math2=c(50,60,80)) 
View(lastTerm)



lastTerm$name2
lastTerm$eng2
str(lastTerm$name2)
table(lastTerm$eng2)

test<-c("apple","banana","kiwi","apple","banana","apple")
table(test)





#average
mean(lastTerm$eng2)
mean(lastTerm$math2)

#파일의 형태
  #1. CSV 파일 (텍스트 파일, 콤마로 구분되어있는 파일)
  #2. EXCEL 파일 
  #3. JSON, XML 파일 

midterm2<-read.csv("D:/may/day02/midterm2.csv") #백슬러시를 그냥 슬러시로 바꿔주어야함. 
View(midterm2)
str(midterm2)

midterm33<-read_excel("D:/may/day02/readTest33.xlsx")
View(midterm33)
str(midterm33)

write.csv(midTerm,file="midTerm.csv") #csv파일로 저장하기 
rm(midterm33) #변수 삭제 remove
ls() #변수들의 리스트  list 
list<-ls()
list
rm(list=ls())
ls()

subMidTerm<-data.frame(name2=midterm2$name,
                      te2=midterm2$tel)
subMidTerm
write.csv(subMidTerm,file="subMidTerm.csv")

subMidTerm$age2<-c(20,30,40)
subMidTerm

addr<-c("서울시","부산","경기도")
subMidTerm$addr<-addr 
subMidTerm
names(subMidTerm)
subMidTerm[1]    #인덱스를 사용하여 원하는 값을 가지고 오거나 $표시를 사용하여 가지고 오거나.
                # 반복문이나 조건처리할 때 인덱스표현이 아주 적절함. 
                #열 추출 =>name 2 
                #[행,열]
subMidTerm[1,]
subMidTerm[1,1]
subMidTerm[1,4]
subMidTerm[3,1]
subMidTerm[3,3]

#행과 열 삭제 

subMidTerm[,-1]
subMidTerm1<-subMidTerm[,-1] 
subMidTerm1

subMidTerm5<-subMidTerm[,-c(2:4)] #2~4 까지 전체 지워라
subMidTerm5

subMidTerm6<-subMidTerm[,-c(1,3)] # 부분 지워라 
subMidTerm6

temp1<-c(1:100)
temp1
temp2<-c(1,3,5,7,9)
temp2

a<-100
b<-200
c<-100
print(a==b) 
print(a==c) #비교의 결과는 true/false 이다. 

if(a!=b){
  print("두 수가 달라요.")
  print("끝....")
  #제어문 안에 조건이 True일 경우에는 중가로의 문장이 프린트 된다. 
}#if-close

#()소괄호: 함수, 조건
#{}중괄호: 포함 
#[]대괄호: 인덱스, 리스트 

###############################################################
#순차적 실행 기본 
#조건문(조건에 따라서 다르게 처리해야하는 경우) 
#반복문(여러번 반복해서 처리해야한다.)


#조건문 
i<-2

if(i<5){
  print("5보다 작아요.")
}else{
  print("5보다 커요.")
}


i2<-"파이썬"

if(i2=="빅데이터"){
  print("빅데이터반 입니다.")
}else if(i2=="파이썬"){
  print(" 파이썬반이군요.")
}else{
  print("아무 반도 아니군요.")
}


fruit<-"사과"

if(fruit=="사과"){
  print("제철이군요.")
}else if(fruit=="배"){
  print("배이면 설에 먹어요.")
}else if(fruit=="키위"){
  print("키위이면 수입이에요.")
}else{
  print("아무것도 아니면 과일이 아닌가봐요.")
}
  
install.packages("lubridate")
library("lubridate")
now()
date=now()
year(date)
month(date)
day(date)
wday(date,label=T)
hour(date)
minute(date)
second(date)


#11시 전 이면 굿모닝~ 
#15시 전 이면 굿에프터눈~
#20시 전 이면 굿이브닝~
#기타이면 굿나잇~

if(hour(date)<11){
  print("굿모닝~")
}else if(hour(date)<15){
  print("굿에프터눈~")
}else if(hour(date)<20){
  print("굿이브닝~")
}else{
  print("굿나잇~")
}

date+minutes(10) #date에 10분을 더한 날짜와 시각 

###################################################
#입력 받은 값 판별 
input<-scan()

if(input==100){
  print("만점입니다.")
}else{
  print("다음 기회에")
}

input<-scan(what="")

if(input=="100점"){
  print("만점입니다.")
}else{
  print("다음 기회에")
}

#3항연산자 
i=99
result=ifelse(i>90,"수","수 아님")
print(result)


temp3<-80
result1<-ifelse(temp3>=80,"통과","실패")
print(result1)

###################################################
#반복문 

#while문
temp4<-10
while(temp4>7){
  print("7보다 크군요!!")    #무한루프 
}


temp4<-10
while(temp4>7){
  print("7보다 크군요!!")
  temp4<-temp4-1
}


#for문 

temp5<-c(1:5)  #while문과 다르게 for문은 돌아가는 횟수를 알아서 계산을 해서 반복해준다. 
for(temp6 in temp5){
  print(temp6)
}


name<-c("김아무개","박아무개","송아무개","정아무개") #인덱스를 쓰지않고 for문을 사용하여 알아서 값을 찾아줌 
for(name1 in name){
  cat("당신의 이름은",name1,"이군요.\n")  #출력할 값을 연결시킬 것이기 때문에 print가 아닌 cat을 써준다. 
}

student<-data.frame(name2=name,
              age2=c(30,50,15,45)
              )
student


for(student1 in student$name2){
  print(student1)
}   #for문을 사용하여 student data.frame 안에 있는 name2열만 추출 



#무한반복에 break 넣어주기 
while(TRUE){
  input3<-scan()
  print(input3)
  if(input3== 0){
    print("종료합니다.")
    break
  }
}

