# [과제] 한국복지패널 데이터를 이용한 문제를 3개 만들기 
# 문제를 정의하고 분석하여 보고서 출력한 자료를 제출하고 발표한다.
# (1) 교육수준 & 근로시간형태
# (2) 교육수준 & 주된 경제활동 참여상태 
# (3) 주된 경제활동 참여상태  & 입원일수 
# (4) 교육수준 & 주된 경제활동 참여상태 & 성별 
install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", 
                         to.data.frame = T)
welfare <- raw_welfare
welfare

# 교육수준 
welfare <- rename(welfare, 
                  education = h10_g6,
                  worktime = h10_eco6)
welfare

# (1) 교육수준 & 근로시간형태
# 교육수준1 변수 검토
class(welfare$education)
table(welfare$education) # 이상치 확인
table(is.na(welfare$education)) # 결측치 확인

# 전처리 
test_education <- data.frame(id = c(1:9),
                             education = c("미취학",
                                           "무학",
                                           "초등학교",
                                           "중학교",
                                           "고등학교",
                                           "전문대학",
                                           "대학교",
                                           "석사",
                                           "박사"))
test_education

# 근무시간형태 
class(welfare$worktime)
table(welfare$worktime)
welfare$worktime <- ifelse(welfare$worktime == 9, NA, welfare$worktime)
welfare$worktime
table(is.na(welfare$worktime))

welfare$worktime <- ifelse(welfare$worktime == 1, "part_time", "full_time")
table(welfare$worktime)
qplot(welfare$worktime)

# 교육수준에 따른 근무시간형태 
worktime_education <- welfare %>% 
  filter(!is.na(education) & !is.na(worktime)) %>% # 결측치 제거한 값을 가져오기 위해 
  count(education, worktime) %>%
  group_by(education) %>%
  mutate(pct = round(n/sum(n)*100, 2))
welfare <- worktime_education

# 비율막대 
ggplot(data = welfare, aes(x = education, y = pct, fill = worktime)) +
  geom_col(position = "dodge") + 
  coord_flip() +
  scale_x_discrete(limits = c("미취학", "무학", "초등학교", "중학교", "고등학교", "전문대학", "대학교", "석사", "박사"))

-------------------------------------------------------------
  
# (2) 교육수준 & 주된 경제활동 참여상태 
install.packages("foreign")
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", 
                         to.data.frame = T)
welfare <- raw_welfare
welfare

# 교육수준 
welfare <- rename(welfare, 
                  education = h10_g6,
                  worktime = h10_eco6,
                  participate = h10_eco4)

welfare
# 교육수준1 변수 검토 및 전처리 
# 교육수준1 변수 검토
class(welfare$education)
table(welfare$education) # 이상치 확인
table(is.na(welfare$education)) # 결측치 확인

# 전처리 
test_education <- data.frame(id = c(1:9),
                             education = c("미취학",
                                           "무학",
                                           "초등학교",
                                           "중학교",
                                           "고등학교",
                                           "전문대학",
                                           "대학교",
                                           "석사",
                                           "박사"))
test_education

welfare$education <- ifelse(welfare$education == 1, "미취학",
                            ifelse(welfare$education == 2, "무학",
                                   ifelse(welfare$education == 3, "초등학교",
                                          ifelse(welfare$education == 4, "중학교",
                                                 ifelse(welfare$education == 5, "고등학교",
                                                        ifelse(welfare$education == 6,  "전문대학",
                                                               ifelse(welfare$education == 7, "대학교",
                                                                      ifelse(welfare$education == 8, "석사",
                                                                             ifelse(welfare$education == 9, "박사", NA)))))))))

education <- welfare$education
education 

welfare$education <- factor(welfare$education,
                            level = c("박사",
                                      "석사",
                                      "대학교",
                                      "전문대학",
                                      "고등학교",
                                      "중학교",
                                      "초등학교",
                                      "무학",
                                      "미취학"))
welfare$education
table(welfare$education)
qplot(welfare$education)

# 주된 경제활동 참여상태 
class(welfare$participate)
table(welfare$participate)
welfare$participate <- ifelse(welfare$participate == 99, NA, welfare$participate)
welfare$participate
table(is.na(welfare$participate))

# 교육수준에 따른 주된 경제활동 참여상태 차이
worktime_participate <- welfare %>% 
  count(education, participate) %>%
  group_by(education) %>%
  mutate(pct = round(n/sum(n)*100, 2))
welfare <- worktime_participate

str(welfare)

ggplot(data = welfare, aes(x = participate, y = pct, fill = education)) + 
  geom_col(position = "dodge") + 
  coord_flip() +
  scale_x_discrete(limits = c("상용직", "임시직", "일용직", "자활근로", "고용주", "자영업자", "무급가족종사자", "실업자", "비경제 활동인구")) 

-------------------------------------------------------------
  
# (3) 주된 경제활동 참여상태  & 입원일수 
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", 
                         to.data.frame = T)
welfare <- raw_welfare
welfare

welfare <- rename(welfare, 
                  education = h10_g6,
                  worktime = h10_eco6,
                  participate = h10_eco4,
                  hospital = h10_med4,
                  sex = h10_g3)
welfare

class(welfare$hospital)
table(welfare$hospital)
summary(welfare$hospital)
welfare$hospital <- ifelse(welfare$hospital == 99, NA, welfare$hospital)
welfare$hospital
table(is.na(welfare$hospital))

# 주된 경제활동 참여상태에 따른 입원일수 차이 
participate_hospital <- welfare %>% 
  filter(!is.na(hospital)) %>%
  group_by(participate) %>%
  summarise(mean_hospital = mean(hospital))
participate_hospital

ggplot(data = participate_hospital, aes(x = participate, y = mean_hospital)) +
  geom_col() +
  coord_flip() +
  scale_x_discrete(limits = c("상용직", "임시직", "일용직", "자활근로", "고용주", "자영업자", "무급가족종사자", "실업자", "비경제 활동인구"))


# (4) 성별  
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", 
                         to.data.frame = T)
welfare <- raw_welfare
welfare

welfare <- rename(welfare, 
                  education = h10_g6,
                  worktime = h10_eco6,
                  participate = h10_eco4,
                  hospital = h10_med4,
                  sex = h10_g3)
welfare

class(welfare$sex)
table(welfare$sex)
summary(welfare$sex)
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
welfare$sex
table(is.na(welfare$sex))

welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)
qplot(welfare$sex)

# 주된 경제활동 참여상태에 따른 입원일수와 그 이유 
participate_hospital <- welfare %>% 
  filter(!is.na(participate)) %>%
  group_by(participate, sex) %>%
  summarise(mean_hospital = mean(hospital))
participate_hospital

str(participate_hospital)

ggplot(data = participate_hospital, aes(x = participate, y = mean_hospital, fill = sex)) +
  geom_col(position = "dodge") +
  coord_flip() +
  scale_x_discrete(limits = c("상용직", "임시직", "일용직", "자활근로", "고용주", "자영업자", "무급가족종사자", "실업자", "비경제 활동인구"))

