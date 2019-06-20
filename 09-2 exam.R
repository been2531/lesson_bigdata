library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

df_cold <- read.csv(file = "실제진료정보_감기_시도.csv")


df_cold <- data.frame(date, city, occur)
df_cold <- rename(df_cold,
                  date = "날짜",
                  city = "시도지역코드",
                  occur = "발생건수.건.")
df_cold

summary(df_cold$city)
table(is.na(df_cold)) # 결측치 없음


test1 <- df_cold %>% 
  filter(city == 11 | 99) %>%
  group_by(date) %>%
  arrange(desc(occur))
test1

test_city<- data.frame(id = c(11, 26, 27, 28, 29, 30, 31, 41, 42, 43, 44, 45, 46, 47, 48, 49, 99),
                             city = c("서울",
                                      "부산",
                                      "대구",
                                      "인천",
                                      "광주",
                                      "대전", 
                                      "울산", 
                                      "경기", 
                                      "강원", 
                                      "충북", 
                                      "충남", 
                                      "전북", 
                                      "전남", 
                                      "경북", 
                                      "경남", 
                                      "제주", 
                                      "전국"))
test_city


test1$city <- ifelse(test1$city == 11, "서울", 
                     ifelse(test1$city == 26, "부산", 
                            ifelse(test1$city == 27, "대구", 
                                   ifelse(test1$city == 28, "인천", 
                                          ifelse(test1$city == 29, "광주", 
                                                 ifelse(test1$city == 30,  "대전", 
                                                        ifelse(test1$city == 31, "울산", 
                                                               ifelse(test1$city == 41, "경기", 
                                                                      ifelse(test1$city == 42, "강원", 
                                                                             ifelse(test1$city == 43, "충북", 
                                                                                    ifelse(test1$city == 44, "충남", 
                                                                                           ifelse(test1$city == 45, "전북", 
                                                                                                  ifelse(test1$city == 46, "전남", 
                                                                                                         ifelse(test1$city == 47, "경북", 
                                                                                                                ifelse(test1$city == 48, "경남", 
                                                                                                                       ifelse(test1$city == 49, "제주", 
                                                                                                                              ifelse(test1$city == 99, "전국", NA)))))))))))))))))

test_city <- test1$city
test_city

ggplot(data = test1, aes(x = city, y = occur)) +
  geom_col() +
  scale_x_discrete(limits = c("서울", "부산", "대구", "인천", "광주", "대전", "울산", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주", "전국"))



df_skin <- read.csv(file = "실제진료정보_피부염_시도.csv")
df_skin

df_skin <- data.frame(date, city, occur)
df_skin <- rename(df_skin,
                  date = "날짜",
                  city = "시도지역코드",
                  occur = "발생건수.건.")
df_skin

summary(df_cold$city)
table(is.na(df_skin)) # 결측치 없음


test2 <- df_skin %>% 
  filter(city == 11 | 99) %>%
  group_by(date) %>%
  arrange(desc(occur))
test2

skin_city<- data.frame(id = c(11, 26, 27, 28, 29, 30, 31, 41, 42, 43, 44, 45, 46, 47, 48, 49, 99),
                       city = c("서울",
                                "부산",
                                "대구",
                                "인천",
                                "광주",
                                "대전", 
                                "울산", 
                                "경기", 
                                "강원", 
                                "충북", 
                                "충남", 
                                "전북", 
                                "전남", 
                                "경북", 
                                "경남", 
                                "제주", 
                                "전국"))
skin_city


test2$city <- ifelse(test2$city == 11, "서울", 
                     ifelse(test2$city == 26, "부산", 
                            ifelse(test2$city == 27, "대구", 
                                   ifelse(test2$city == 28, "인천", 
                                          ifelse(test2$city == 29, "광주", 
                                                 ifelse(test2$city == 30,  "대전", 
                                                        ifelse(test2$city == 31, "울산", 
                                                               ifelse(test2$city == 41, "경기", 
                                                                      ifelse(test2$city == 42, "강원", 
                                                                             ifelse(test2$city == 43, "충북", 
                                                                                    ifelse(test2$city == 44, "충남", 
                                                                                           ifelse(test2$city == 45, "전북", 
                                                                                                  ifelse(test2$city == 46, "전남", 
                                                                                                         ifelse(test2$city == 47, "경북", 
                                                                                                                ifelse(test2$city == 48, "경남", 
                                                                                                                       ifelse(test2$city == 49, "제주", 
                                                                                                                              ifelse(test2$city == 99, "전국", NA)))))))))))))))))

skin_city <- test2$city
skin_city 

ggplot(data = test2, aes(x = city, y = occur)) +
  geom_col() +
  scale_x_discrete(limits = c("서울", "부산", "대구", "인천", "광주", "대전", "울산", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주", "전국"))



