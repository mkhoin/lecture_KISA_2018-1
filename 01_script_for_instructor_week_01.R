#### .##################. ####
#### | 1. 시각화의 중요성 | ####
#### .##################. ####


### .-============================-. ####


#### .#################################. ####
#### | 2. 데이터 속성에 따른 올바른 접근법 | ####
#### .#################################. ####


### .-============================-. ####


#### .####################. ####
#### | 3. 잘못된 시각화 사례 | ####
#### .####################. ####


### .-============================-. ####


#### .################################. ####
#### | 4. 시각화를 위한 언어와 관련 도구 | ####
#### .################################. ####


### .-============================-. ####


#### .###################. ####
#### | 5. R을 활용한 시각화 | ####
#### .###################. ####
# install.packages("ggplot2")
library("ggplot2")
library("plotly")
library("ggcorrplot")


#### __ [01] ggplot 개요 ####

#### __ [02] 유용한 사이트 ####
# http://ggplot2.tidyverse.org/reference
# https://www.rstudio.com/resources/cheatsheets
# https://color.adobe.com
# http://www.color-hex.com/

#### __ [03] ggplot 시작하기 ####
#### ____ ● 산점도 ####
# 데이터 & 패키지 준비
data_point = data.frame(xx = 1:10,
                        yy = sample(1:10, 10))
library("ggplot2")

# 그래프
ggplot(data = data_point, aes(x = xx, y = yy)) + geom_point()
ggplot(data = data_point, aes(xx, yy)) + geom_point()
ggplot() + geom_point(data = data_point, aes(x = xx, y = yy))
ggplot() + geom_point(data = data_point, aes(xx, yy))
ggplot() + geom_point(data_point, aes(xx, yy))

#### ____ ● 기초 문법 ####
# 스타일 1

# 스타일 2

#### __ [04] 기본 그래프 ####
#### ____ ● 선 그래프 ####
ggplot(data = data_point, aes(x = xx, y = yy)) + geom_line()

#### ____ ● 막대 그래프 ####
data_bar = data.frame(xx = 1:10,
                      yy = sample(1:3, 10, replace = TRUE))
data_bar

ggplot(data = data_bar, aes(x = yy)) + geom_bar()

table(data_bar$yy)

ggplot(data = data_bar, aes(x = xx, y = yy)) + geom_bar(stat = "identity")

ggplot(data = data_bar, aes(x = xx, y = yy)) + geom_col()

#### ____ ● 추가 기능####
ggplot(data = data_point, aes(x = xx, y = yy)) + 
  geom_point(color = "#FFA500")

ggplot(data = data_point, aes(x = xx, y = yy)) + 
  geom_point(size = 5)

ggplot(data = data_point, aes(x = xx, y = yy)) + 
  geom_point(color = "#FFA500", size = 5)

#### __ [05] 다중 그래프 ####
#### ____ ● 선 그래프 ####
# 데이터 준비
line_df = data.frame(obs = 1:30,
                     var_1 = rep(c("A", "B", "C"), 10),
                     value = sample(1:100, size = 10),
                     stringsAsFactors = FALSE)
head(line_df)

library("ggplot2")

# 그래프 1
ggplot(data = line_df, aes(x = obs,
                           y = value)) + 
  geom_line()

# 그래프 2
ggplot(data = line_df, aes(x = obs,
                           y = value,
                           group = var_1)) + 
  geom_line()

# 그래프 3
ggplot(data = line_df, aes(x = obs,
                           y = value,
                           group = var_1,
                           color = var_1)) + 
  geom_line()


# 그래프 4
ggplot(data = line_df, aes(x = obs,
                           y = value,
                           group = var_1,
                           color = var_1)) + 
  geom_line() + 
  geom_point(data = line_df, aes(x = obs,
                                 y = value,
                                 group = var_1,
                                 color = var_1))

# 그래프 5
ggplot(data = line_df, aes(x = obs,
                           y = value,
                           group = var_1,
                           color = var_1)) + 
  geom_line(size = 1.3) + 
  geom_point(data = line_df, aes(x = obs,
                                 y = value,
                                 group = var_1,
                                 color = var_1),
             size = 4)


# 그래프 5 - 퀴즈: 코드를 조금 더 간결하게 바꾸시오.
ggplot(data = line_df, aes(x = obs,
                           y = value,
                           group = var_1,
                           color = var_1)) + 
  geom_line(size = 1.3) + 
  geom_point(size = 4)


#### __ [06] 색상 설정 Ⅰ ####
#### ____ ● 막대 그래프 ####
# 데이터 준비
bar_df = data.frame(obs = 1:10,
                    var = rep(c("A", "B", "C"), length.out = 10),
                    value = sample(1:100, size = 10),
                    stringsAsFactors = FALSE)
head(bar_df)

# 그래프 1
ggplot(data = bar_df, aes(x = obs,
                          y = value)) + 
  geom_bar(stat = "identity")

ggplot(data = bar_df, aes(x = obs,
                          y = value)) + 
  geom_col()


# 그래프 2
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_bar(stat = "identity")

# 그래프 3
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          fill = value)) + 
  geom_bar(stat = "identity")

# 그래프 4
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          fill = as.factor(value))) + 
  geom_bar(stat = "identity")

# 그래프 5
ggplot(data = bar_df, aes(x = as.factor(obs),
                          y = value,
                          fill = as.factor(value))) + 
  geom_bar(stat = "identity")


# 그래프 5 - 퀴즈: 그래프 4와 5의 차이점은?

# 그래프 6
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = as.factor(value))) + 
  geom_bar(stat = "identity", position = "stack")

# 그래프 7
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = as.factor(value))) + 
  geom_bar(stat = "identity", position = "dodge")


#### __ [07] 색상 설정 Ⅱ ####
#### ____ ● 막대 그래프 ####
# 데이터 준비
color_df = data.frame(obs = 1:10,
                      var = rep(c("A", "B", "C"), length.out = 10),
                      value = sample(1:100, size = 10),
                      stringsAsFactors = FALSE)
head(color_df)

# 그래프 1
ggplot(data = color_df, aes(x = var,
                            y = value,
                            fill = as.factor(value))) + 
  geom_bar(stat = "identity", position = "stack")

# 그래프 2
ggplot(data = color_df, aes(x = var,
                            y = value,
                            fill = "blue")) + 
  geom_bar(stat = "identity", position = "stack")

# 그래프 3
ggplot(data = color_df, aes(x = var,
                            y = value),
       fill = "blue") + 
  geom_bar(stat = "identity", position = "stack")

# 그래프 4
ggplot(data = color_df, aes(x = var,
                            y = value)) + 
  geom_bar(stat = "identity", 
           position = "stack",
           fill = "blue")

# 그래프 5
ggplot(data = color_df, aes(x = var,
                            y = value)) + 
  geom_bar(stat = "identity", 
           position = "stack",
           fill = "blue",
           alpha = 0.3)

#### __ [08] 색상 설정 Ⅲ ####
#### ____ ● 선 그래프 ####
# 데이터 준비
color_df = data.frame(obs = 1:10,
                      var = rep(c("A", "B", "C"), length.out = 10),
                      value = sample(1:100, size = 10),
                      stringsAsFactors = FALSE)
head(color_df)

# 그래프 1
ggplot(data = color_df,
       aes(x = obs,
           y = value)) + 
  geom_line(size = 2)

# 그래프 2
ggplot(data = color_df,
       aes(x = obs,
           y = value,
           color = value)) + 
  geom_line(size = 2)


# 그래프 3
ggplot(data = color_df,
       aes(x = obs,
           y = value,
           color = "blue")) + 
  geom_line(size = 2)


# 그래프 4
ggplot(data = color_df,
       aes(x = obs,
           y = value),
       color = "blue") + 
  geom_line(size = 2)


# 그래프 5
ggplot(data = color_df,
       aes(x = obs,
           y = value)) + 
  geom_line(size = 2,
            color = "blue")


# 그래프 6
ggplot(data = color_df,
       aes(x = obs,
           y = value)) + 
  geom_line(size = 2,
            color = "blue",
            alpha = 0.3)

#### ____ ● 선 그래프 - 색상함수 활용####
# 그래프 1
ggplot(data = color_df,
       aes(x = obs,
           y = value,
           group = var,
           color = var)) + 
  geom_line(size = 2) + 
  scale_color_grey(start = 0.2,
                   end = 0.8)


# 그래프 2
ggplot(data = color_df,
       aes(x = obs,
           y = value,
           group = var,
           color = var)) + 
  geom_line(size = 2) + 
  scale_color_brewer(palette = 1)

# 그래프 3
ggplot(data = color_df,
       aes(x = obs,
           y = value,
           group = var,
           color = var)) + 
  geom_line(size = 2) + 
  scale_color_brewer(palette = 2)

# 그래프 4
ggplot(data = color_df,
       aes(x = obs,
           y = value,
           group = var,
           color = var)) + 
  geom_line(size = 2) + 
  scale_color_brewer(palette = 3)

# 그래프 5 - 중요!
ggplot(data = color_df,
       aes(x = obs,
           y = value,
           group = var,
           color = var)) + 
  geom_line(size = 2) + 
  scale_color_manual(values = c("A" = "red",
                                "B" = "blue",
                                "C" = "green"))

#### __ [09] 축 설정 ####
#### ____ ● 여백 조정 ####
# 데이터 준비
bar_df = data.frame(obs = 1:10,
                    var = rep(c("A", "B", "C"), length.out = 10),
                    value = sample(1:100, size = 10),
                    stringsAsFactors = FALSE)
head(bar_df)

# 기본 그래프
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) + 
  # geom_col()
  geom_bar(stat = "identity")

# 그래프 1
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) + 
  geom_bar(stat = "identity") + 
  scale_x_discrete(expand = c(0.01, 0.01))

# 그래프 2
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) + 
  geom_bar(stat = "identity") + 
  scale_x_discrete(expand = c(0.5, 0.5))

# 그래프 3
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) + 
  geom_bar(stat = "identity") + 
  scale_y_discrete(expand = c(0.01, 0.01))

# 그래프 4
ggplot(data = bar_df, aes(x = var,
                          y = value,
                          fill = value)) + 
  geom_bar(stat = "identity") + 
  scale_y_discrete(expand = c(0.5, 0.5))
#### ____ ● 최대, 최소값 설정 ####
# 그래프 1
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) + 
  geom_line(size = 2)

# 그래프 2
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) + 
  geom_line(size = 2) + 
  scale_x_continuous(limits = c(5, 10))

# 그래프 3
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) + 
  geom_line(size = 2) + 
  scale_y_continuous(limits = c(20, 80))


# 그래프 4
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) + 
  geom_line(size = 2) + 
  scale_y_continuous(limits = c(0, 200))


#### ____ ● 구간 설정 ####
# 그래프 1
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) + 
  geom_line(size = 2) + 
  scale_x_continuous(breaks = c(5, 10),
                     labels = c(5, 10))


# 그래프 2
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value)) + 
  geom_line(size = 2) + 
  scale_x_continuous(breaks = seq(0, 100, 10),
                     labels = seq(0, 100, 10))


#### __ [10] 요소(element) 설정 ####
#### ____ ● 기호 변경 ####
# 데이터 준비
bar_df = data.frame(obs = 1:10,
                    var = rep(c("A", "B", "C"), length.out = 10),
                    value = sample(1:100, size = 10),
                    stringsAsFactors = FALSE)
head(bar_df)

# 그래프 1
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10)

# 그래프 2
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10,
             shape = 1)


# 그래프 3
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10,
             shape = 2)


# 그래프 4
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value,
                          shape = var)) + 
  geom_point(size = 10) + 
  scale_shape_manual(values = c("A" = 7,
                                "B" = 8,
                                "C" = 9))

#### __ [11] 텍스트 설정 ####
#### ____ ● 글자 모양 설정 ####
# 기본 그래프
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10)

# 그래프 1
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10) + 
  theme(axis.title = element_text(size = 10))

# 그래프 2
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10) + 
  theme(axis.title = element_text(size = 10,
                                  face = "bold"))

# 그래프 3
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10) + 
  theme(axis.title = element_text(size = 10,
                                  face = "bold",
                                  angle = 45))

# 그래프 4
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10) + 
  theme(axis.title.x = element_text(size = 30,
                                    face = "italic",
                                    angle = 30),
        axis.title.y = element_text(size = 30,
                                    face = "bold",
                                    angle = 180))


#### ____ ● 제목 변경 ####
# 그래프 1
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10) + 
  labs(x = "title_x_axis",
       y = "title_y_axis",
       title = "This_is_title") + 
  theme(axis.title = element_text(size = 30),
        title = element_text(size = 40))

# 그래프 2
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10) + 
  scale_x_continuous(name = "title_x_axis") +
  scale_y_continuous(name = "title_y_axis") +
  ggtitle("Your_title") +
  theme(axis.title = element_text(size = 30),
        title = element_text(size = 40))

# 그래프 3
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10) + 
  theme(axis.title.x = element_text(size = 30,
                                    face = "bold",
                                    angle = 45))


# 그래프 4
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10) + 
  theme(axis.title.y = element_text(size = 30,
                                    face = "bold",
                                    angle = 45))


#### __ [12] 덧그리기 ####
#### ____ ● 가로/세로선 추가####
# 데이터 준비
bar_df = data.frame(obs = 1:10,
                    var = rep(c("A", "B", "C"), length.out = 10),
                    value = sample(1:100, size = 10),
                    stringsAsFactors = FALSE)
head(bar_df)

# 기본 그래프
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10) 

# 그래프(가로선 추가)
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10) + 
  geom_hline(yintercept = (1:10) * 10,
             color = "#FFAACC",
             alpha = 0.7,
             linetype = 1:10)

# 그래프(세로선 추가)
ggplot(data = bar_df, aes(x = obs,
                          y = value,
                          color = value)) + 
  geom_point(size = 10) + 
  geom_vline(xintercept = 1:10,
             color = rep(c("#FFAACC", "#44FF44"), each = 5),
             alpha = 0.7,
             linetype = 1:10)


#### ____ ● annotate() 함수 ####
# 텍스트
ggplot() + 
  geom_point(aes(x = 1:10,
                 y = 1:10),
             size = 3) + 
  annotate(geom = "text",
           label = "Adf",
           size = 10,
           x = 7,
           y = 3)

# 사각형
ggplot() + 
  geom_point(aes(x = 1:10,
                 y = 1:10),
             size = 3) + 
  annotate(geom = "rect",
           fill = "#FFA500",
           xmin = 5, xmax = 7,
           ymin = 2, ymax = 3)

# 선분
ggplot() + 
  geom_point(aes(x = 1:10,
                 y = 1:10),
             size = 3) + 
  annotate(geom = "segment",
           color = "#FF0000",
           size = 2,
           x = 5, xend = 7,
           y = 2, yend = 3)

# 값 범위
ggplot() + 
  geom_point(aes(x = 1:10,
                 y = 1:10),
             size = 3) + 
  annotate(geom = "pointrange",
           color = "#FF0000",
           size = 2,
           x = 7, y = 3,
           ymin = 2, ymax = 5)


#### __ [13] 범례 ####
#### ____ ● 사전 준비 ####
# 데이터 준비
bar_df = data.frame(obs = 1:10,
                    var = rep(c("A", "B", "C"), length.out = 10),
                    value = sample(1:100, size = 10),
                    stringsAsFactors = FALSE)
head(bar_df)

# 기본 그래프
ggplot(data = bar_df,
       aes(x = obs,
           y = value,
           color = value,
           shape = var)) + 
  geom_point(size = 10)

#### ____ ● 위치 조정 ####
# top, bottom, left, right

# 그래프 1

# 그래프 2

#### ____ ● 텍스트 ####
# 그래프 3

# 그래프 4

#### ____ ● 기타 ####
# 그래프 5

# 그래프 6

#### __ [14] 다양한 그래프 ####
#### ____ ● 히스토그램 ####
# 데이터 준비
data("diamonds")

# 그래프

# 그래프 퀴즈: Very Good 이상 등급만 사용하여 그리시오.


#### ____ ● dot plot ####
# 데이터 준비
data("mtcars")

# dot plot

#### ____ ● ribbon graph ####
# 데이터 준비
data("LakeHuron")
df = data.frame(year  = 1875:1972,
                level = as.vector(LakeHuron))

# ribbon graph

#### ____ ● 다차원 시각화 ####

#### ____ ● 분할 ####

#### ____ ● 병합 ####

#### __ [15] 종합 문제 ####
#### ____ ● 막대그래프 중첩 ####

#### ____ ● 그래프 6개 중첩 ####
df = data.frame(xx = 1:10,
                yy = 1:10)

ggplot(data = df, aes(x = xx,
                      y = yy)) +
  geom_line(size = 2) + 
  geom_point(size = 9) + 
  geom_point(size = 7,
             color = "#FFFFFF") +
  geom_point(data = data.frame(a = c(2, 8),
                               b = c(2, 8)),
             aes(x = a, y = b),
             size = 7,
             color = "#FFAACC")

#### __ [16] 고급 시각화 ####
#### ____ ● 반응형 그래프 ####
library("ggplot2")
library("plotly")

gg = ggplot() + 
  geom_point(aes(x = 1:10,
                 y = 1:10),
             size = 10)
ggplotly(gg)

#### ____ ● 반응형 3D 그래프 ####
library("reshape2")
library("plotly")

pp = function(n, r = 4){
  x = seq(from = -r * pi, to = r * pi, length.out = n)
  df = expand.grid(x = x, y = x)
  df$r = sqrt(df$x^2 + df$y^2)
  df$z = cos(df$r^2) * exp(-df$r/6)
  return(df)
}
data_xyz = pp(100)
data_z = acast(data_xyz, x ~ y, value.var = "z")
plot_ly(z = data_z, type = "surface")

#### ____ ● Google Map ####
library("ggplot2")
# install.packages("ggmap")
library("ggmap")

kor = get_map("seoul", zoom = 11, maptype = "hybrid")
# saveRDS(kor, "map_kor.rds")
# kor = readRDS("map_kor.rds")
df = data.frame(lon = 0, lat = 0,
                location = c("신림역", "서울역"), 
                stringsAsFactors = FALSE)
for(n in 1:nrow(df)){
  location_sub = geocode(enc2utf8(df[n, "location"]), source = "google", force = TRUE)
  df[n, 1:2] = location_sub
  Sys.sleep(1)
}
# write.csv(df, "map_location.csv", row.names = FALSE)
# df = read.csv("map_location.csv", stringsAsFactors = FALSE)

ggmap(kor) + 
  geom_point(data = df, 
             aes(x = lon, y = lat),
             size = 5, alpha = 0.7,
             color = "#FF0000") + 
  geom_text(data = df, 
            aes(x = lon, y = lat + 0.01, 
                label = location), 
            size = 3) + 
  labs(x = NULL, y = NULL)


### .-============================-. ####
