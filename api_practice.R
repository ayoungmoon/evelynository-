#다음사이트 

#반정형 데이터 스크래핑 + 전처리 

install.packages("rvest")
library(rvest)

url<-"http://www.daum.net"
htmlText<-read_html(url)  #인터넷 html로 읽어오기 
htmlText



#html_nodes함수는 태그 전체를 가지고 온것이다. (문자외의 코드들 전부)  
#크롬 사이트에서 F12 을 눌러 코드를 찾는다. 
#htmlText 전체 안에서 id인 news를 가지고 오고, htmlText전체에서 class인 screen_out을 가지고온다.
news<-html_nodes(htmlText,"#news") # 샵(#) = id 
news

product<-html_nodes(htmlText,".screen_out") #점(.)=class
product

product1<-html_nodes(htmlText,"h2") #tag는 그냥 
product1



#가지고 온 것에서 문자만 추출 
product2Text<-html_text(product1)
product2Text

#인텍스 사용해서 가져오기
product2Text[3]

#연습
kakao<-html_nodes(htmlText,".inner_service")
kakao

kakaoText<-html_text(kakao)
kakaoText



