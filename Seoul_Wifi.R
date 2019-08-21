# Seoul Wifi
# invalid multibyte string 1 문제해결 
Sys.setlocale(category = 'LC_ALL', locale = 'US')

# 한글 꺠짐 문제해결
Sys.setlocale("LC_ALL","C")
SeoulWifi <- read.csv('seoulpublicwifi.csv', header = T, encoding = 'UTF-8', as.is=T)
Sys.setlocale("LC_ALL","Korean")

colnames(SeoulWifi) = c('location', '유형', '설치주소', 
                        '지역명', '상세설치정보', '설치기관',
                        'lon', 'lat', '콘텐츠아이디')
View(SeoulWifi)
str(SeoulWifi)

# 열 추출 (location, lon, lat)
library(dplyr)
SeoulWifi <- SeoulWifi %>% select(location, lon, lat)
View(SeoulWifi)

# Error: Discrete value supplied to continuous scale
Wifi_levels <- levels(SeoulWifi$lon)
SeoulWifi$lon <- as.numeric(SeoulWifi$lon)

Wifi_levels <- levels(SeoulWifi$lat)
SeoulWifi$lat <- as.numeric(SeoulWifi$lat)

# 시각화 
get_map(location='south korea', zoom=13, source='google', maptype='terrain')
seoul_map <- get_map(location="37.556,126.983", zoom=11, maptype='roadmap', color='bw', scale ='2')
ggmap(seoul_map)

# geom_point
ggmap(seoul_map) + geom_point(data = SeoulWifi, aes(x=lon, y=lat, color = location), alpha=0.8)

# stat_density_2d
ggmap(seoul_map) + stat_density_2d(data = SeoulWifi, aes(x=lon, y=lat))
