Sys.setenv(JAVA_HOME="C:/Program Files/Java/jre1.8.0_211")
install.packages("rJava")
install.packages("RJDBC")

library(rJava)
library(RJDBC)

drv <- JDBC("oracle.jdbc.driver.OracleDriver","C:/app/CPB06GameN/product/11.2.0/dbhome_1/jdbc/lib/ojdbc6.jar")

conn<- dbConnect(drv,
                 "jdbc:oracle:thin:localhost:1512:orcl",
                 "SCOTT","tiger")

query <- "select * from MAN"
query

result <- dbGetQuery(conn,query)

head(result)

dbDisconnect(conn)

# dbListTables(conn)

library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

df_problem <- read_excel("MARRIED_PROBLEM.xlsx")
df_problem

# 피해자일 경우 
gg <- ggplot(df_problem, aes(x=1 :nrow(df_problem), y=MAN_VICTIM)) +
  xlim(df_problem$PROBLEM) + 
  theme (axis.text.x = element_text(colour = "gray20", size = 12, angle=15, hjust=.5, vjust=.5),          axis.text.y = element_text(colour="grey20", size=12))

gg + geom_line(size=2, color="blue") + 
  geom_line(aes(x=1 :nrow(df_problem), y=WOMAN_VICTIM), size=2, color="red") 
  
# 가해자일 경우 
gg2 <- ggplot(df_problem, aes(x=1 :nrow(df_problem), y=MAN_ATTACKER)) +
  xlim(df_problem$PROBLEM) + 
  theme (axis.text.x = element_text(colour = "gray20", size = 12, angle=15, hjust=.5, vjust=.5),          axis.text.y = element_text(colour="grey20", size=12))

gg2 + geom_line(size=2, color="blue") + 
  geom_line(aes(x=1 :nrow(df_problem), y=WOMAN_ATTACKER), size=2, color="red")
