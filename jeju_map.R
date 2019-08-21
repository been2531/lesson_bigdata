install.packages('ggplot2')
library(ggplot2)

# old version 삭제 
# remove.packages("ggmap")
# remove.packages("tibble")

# rJava 설치 
Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_221')
library('rJava')

install.packages('devtools') 
library('devtools') 
install.packages('ggmap')
library('ggmap')

register_google(key='AIzaSyDjPt6XFCnBIBMmVdlqoftfs0h0SEpQ16U') 
names <- c("용두암","성산일출봉","정방폭포",
           "중문관광단지","차귀도")
addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동홍동 299-3",
          "서귀포시 중문동 2624-1",
          "제주시 한경면 고산리 125")
gc <- geocode(enc2utf8(addr))
gc
# A tibble: 5 x 2
#     lon   lat
#   <dbl> <dbl>
# 1  127.  33.5
# 2  127.  33.5
# 3  127.  33.3
# 4  126.  33.3
# 5  126.  33.3


df <- data.frame(name=names,
                 lon=gc$lon,
                 lat=gc$lat)
cen <- c(mean(df$lon),mean(df$lat))
map <- get_googlemap(center=cen,
                     maptype="roadmap",
                     zoom=10,
                     size=c(640,640),
                     marker=gc)
ggmap(map) 