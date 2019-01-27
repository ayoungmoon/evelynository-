#외부 라이브러리 설치
install.packages("glue") 
install.packages("ggplot2")

#외부 라이브러리 사용 
library(glue)

# practice by using 'glue' 
# 백터 만들어 보기 
ages<- c (10,33,44)
ages[1]<- 20

#이름 벡터를 만들고, 두번째 사람이 박아무개 개명하고 이름의 전체내용을 출력하라. 
names<- c("피카츄","꼬부기","파이리")
names[2]<- "박아무개"
print(names)

#factor구분하기 
address<- c("서울","대구","부산","군산","서울","서울","대구")
address
str(address)
str(year)
#데이터 타입을 알기위해서 str()함수를 넣어 확인해준다. (string)

#문자열을 factor로 바꾸자. 
address2<-as.factor(address)
address2
#공통적으로 들어가서 요소를 뽑을 수 있는 요소를 뽑아주었다. 따라서 이 요소에 따라 분류할 수 있다. 
str(address2)
address2[1]<-"광주"
# factor로 바꾸기 전과는 다르게 값을 수정할 수 없다.(factor의 특징이다.)
address[2]<-"대구"
#하지만, 이미 존재하는 값으로는 수정할 수 있다. 
#새로운 내용을 factor에 추가하고 싶을 겨우에는 factor를 풀고(기존 as.character로 변경) 수정한 후 다시 factor로 변경시켜준다. 

#숫자를 입력했을 때 기본값은 무조건 스트링(문자열) 이다. 스트링으로 입력이 되어버리면 계산을 할 수 가 없다. 
#계산을 할 시 숫자로 변환해줘야 한다. 

#입력의 다양한 형태 (for 숫자:integer(정수) and real,float,double(실수)) 
x<- scan()
str(x)
class(x)
typeof(x)

x<-scan(what="")
#숫자말고 문자열을 쓰일때 'what=""' 써준다. 
x
print(x)
favorite<-x[1]
print("내가 제일 좋아하는 음식은"+ favorite)
#print는 연결되어 출력되지 않는다. (단순출력)

cat("내가 제일 좋아하는 음식은->",favorite)
#연결되어 출력하고 싶으면, cat()을 사용한다. 

library(glue)
name<-"순희"
glue("내 이름은 {name}이다.")
#glue를 사용하여 원하는 위치에 입력값을 출력할 수 있다. 

#공공데이터 포탈에서 데이터를 받는 방법은 1) 파일로 제공 (엑셀, csv)나 2)검색어를 주면서 찾아서 실시간으로 프로그램에 전달해준다 (네트워크프로그램) 
#네트워크 프로그램 = 함수 예: connect("http://www.data.go.kr?key=산") <-open API (함수,방법)   
#정보: 예)북한산 은평구 700 02-55-9874 
#메타데이터형태로 보여준다-> [데이터 형태:json] name: 북한산, location: 은평구 (name과 location은 메타데이타) 
# (주의) open API 받을 때 요청할 수 있는 키를 발급받아야 한다. 
#open api 로 정보를 가져와서 분석할 수 있다.
