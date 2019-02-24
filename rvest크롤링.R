#네이버 뮤직 크롤링 

#1. 네트워크로 연결 
library(rvest)
library(dplyr)
library(ggplot2)

#2. 문서 읽기 
url<-"http://music.naver.com/listen/top100.nhn?domain=DOMESTIC&duration=1h";
download.file(url,destfile="navermusic.html",quiet=T)
naver_music<-read_html("navermusic.html")
naver_music


#3.데이터 추출(열:벡터), 전처리하기 
#순위 (숫자로 바꾸는 전처리)
ranking<-naver_music %>% 
  html_nodes("._tracklist_move .ranking") %>% #class 
  html_text() %>% #문자만 가지고 와주세요. 
                  #그렇지만 ""으로 나타내기 때문에 문자열이라서 숫자로 바꾸어주어야함 
  as.numeric()  #숫자로 바꿔줌 

ranking

#순위변동

gap<-naver_music %>% 
  html_nodes("._tracklist_move .change") %>% 
  html_text() %>% 
  gsub(pattern = "\r\n||\t||\n||\r",replacement="")
  
gap


#노래제목 
title<-naver_music %>% 
  html_nodes("._tracklist_move .title") %>% 
  html_text() %>% 
  gsub(pattern = "\r\n||\t||\n||\r",replacement="")

title

#가수 
artist<-naver_music %>% 
  html_nodes("._tracklist_move .artist a") %>% 
  html_text() %>% 
  gsub(pattern = "\r\n||\t||\n||\r",replacement="")

artist

#4. 데이터 프레임에 넣기 

musicTop50<-data.frame(ranking,gap,title,artist)
musicTop50
View(musicTop50)
head(5)
a<-musicTop50 %>% head(5)
View(a)
b<-musicTop50 %>% tail(5)
View(b)
