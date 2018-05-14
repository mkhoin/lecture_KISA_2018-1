#### .###################. ####
#### | 1. 시계열 데이터 | ####
#### .###################. ####

#### __ [01] 시계열 데이터 ####

#### __ [02] 시간 데이터 생성 ####
# as.POSIXct() 함수 사용

# 시스템 시간 호출

# seq() 함수 활용
seq(from = as.POSIXct("2016-03-10"), 
    to   = as.POSIXct("2018-05-12"),
    by   = "")

# Q. 격일로 출력하려면?


#### __ [03] 시간 데이터 추출 ####
time_1 = as.POSIXct("2016-03-10 13:12:45")

# 내장함수 활용

# 패키지(lubridate) 활용
library("lubridate")

#### __ [04] 달력 만들기 ####
library("lubridate")
timeline = seq(as.POSIXct("2018-01-01"), as.POSIXct("2018-12-31"), by = "30 sec")

# quiz

### .-============================-. ####

#### .###################. ####
#### | 2. R과 금융 데이터 | ####
#### .###################. ####

## 패키지: 관련 데이터 주소
# Quantmod:	http://www.quantmod.com/
# Quandl:	http://www.quandl.com/help/packages/r
# TFX: http://rpubs.com/gsee/TFX
# Rbbg: http://findata.org/rbloomberg/
# IBrokers:	https://www.interactivebrokers.com/en/main.php
# rdatastream: https://github.com/fcocquemas/rdatastream
# pwt: https://pwt.sas.upenn.edu/
# fImport: http://www.rmetrics.org/
# Thinknum: http://thinknum.com/

### .-============================-. ####

#### .###################. ####
#### | 3. 금융 데이터 시각화 | ####
#### .###################. ####
library("ggplot2")

#### __ [01] 목표치 설정 ####
#### ____ ● 막대 그래프 ####
# 데이터 준비
set.seed(1228)
df = data.frame(Company = LETTERS[1:5],
                Performance = sample(30:120, 5),
                Predict = sample(130:160, 5))

# 기본 그래프

# 01

# 02

# 03

# 04

# 05
ggplot(data = df,
       aes(x = Company)) + 
  geom_col(aes(y = Predict),
           fill = "#EEEEEE",
           width = 0.7) +
  geom_col(aes(y = Predict,
               fill  = Company,
               color = Company),
           size = 1,
           alpha = 0.1,
           width = 0.7) +
  geom_col(aes(y = Performance,
               fill = Company),
           width = 0.7) +
  geom_hline(yintercept = 0, color = "#666666", size = 1.2) +
  scale_y_continuous(expand = c(0, 0),
                     limits = c(0, 160),
                     breaks = (0:6) * 25,
                     labels = (0:6) * 25) + 
  theme(axis.text = element_text(size = 12),
        axis.ticks = element_line(size = 1),
        panel.grid.major.x = element_blank(),
        panel.grid.minor = element_blank(),
        panel.grid.major.y = element_line(size = 1.5),
        panel.border = element_blank(),
        legend.position = "none")

#### ____ ● 선 그래프 ####
# 데이터 준비
set.seed(1228)
df = data.frame(date = seq(as.POSIXct("2018-01-01"), as.POSIXct("2018-07-01"), by = "month"),
                value = cumsum(sample(1:4, 7, replace = TRUE)))
df

# 01

# 02

# 03

# 04

# 05

#### __ [02] 지역 비교 ####
# 데이터 준비
library("maptools")
library("maps")
library("ggsn")
library("scatterpie")
map = readShapePoly("2013_si_do.shp", verbose = FALSE)
map_for = fortify(map)
head(map_for)

df_cl = read.csv("clusters.csv", stringsAsFactors = FALSE)
head(df_cl)

# map_for = map_for[(map_for$long >= 125.6) & (map_for$long <= 130), ]

#### ____ ● geom_polygon 활용 ####
# 01
ggplot() + 
  geom_polygon(data = map_for, 
               aes(x = long, 
                   y = lat,
                   group = group),
               color = "#000000",
               fill = "#FFFFFF")

# 02
library("dplyr")
df_index = data.frame(id = as.character(0:16),
                      index = 0:16,
                      stringsAsFactors = FALSE)
map_join = left_join(map_for, df_index)
head(map_join)

ggplot(data = df_cl) + 
  geom_polygon(data = map_join, 
               aes(x = long, 
                   y = lat, 
                   fill = index,
                   group = group),
               color = "#000000")

#### ____ ● 파이차트 활용 ####
# 데이터 준비
df_cl = read.csv("clusters.csv", stringsAsFactors = FALSE)
head(df_cl)

# 그래프
ggplot(data = df_cl) + 
  geom_polygon(data = map_for, 
               aes(x = long, 
                   y = lat, 
                   group = group),
               fill = "#FFFFFF", 
               color = "#000000") + 
  geom_scatterpie(data = df_cl,
                  aes(x = long, 
                      y = lat,
                      group = obs, 
                      r = 0.13),
                  cols = c("cl_1", "cl_2"), 
                  color = NA,
                  alpha = 1) +
  scale_fill_manual(values = c("cl_1" = "#3171FF", "cl_2" = "#E86815")) + 
  facet_wrap(~ year, ncol = 2) +
  scalebar(data = df_cl,
           dist = 100, dd2km = TRUE, model = "WGS84", location = "bottomright",
           st.size = 3.6,
           anchor = c(x = 131.5,
                      y = 33.25),
           facet.var = "df_cl$year",
           facet.lev = "year") +
  labs(x = "Longitude", y = "Latitude") + 
  theme_bw() + 
  theme(legend.position = "none",
        strip.text = element_text(size = 20)) 


#### __ [03] 금융거래 ####
#### ____ ● Heatmap ####
df = read.csv("calendar_heatmap.csv", stringsAsFactors = FALSE)
head(df)

#### ____ ● Bar-plot ####
# install.packages("ggpubr")
library("ggpubr")
df = read.csv("fund_bar_lolipop.csv", stringsAsFactors = FALSE)
head(df)

# 01

# 02


#### ____ ● Bubble chart ####
library("ggpubr")
df = read.csv("fund_bar_lolipop.csv", stringsAsFactors = FALSE)
head(df)


### .-============================-. ####

#### .###################. ####
#### | 4. R과 JS의 결합 | ####
#### .###################. ####

# https://www.highcharts.com/
# d3js.org

#### __ [01] highchart #####
# install.packages("highcharter")
library("highcharter")

# 데이터 준비
data(diamonds, mpg, package = "ggplot2")

# 산점도
hchart(object  = mpg, 
       type    = "scatter", 
       mapping = hcaes(x = displ, 
                       y = hwy, 
                       group = class))

# 막대 그래프
hchart(object = diamonds$cut, 
       colorByPoint = TRUE)

# 선 그래프 + 시계열
# install.packages("forecast")
library("forecast")
airforecast = forecast(auto.arima(AirPassengers), level = 95)
hchart(airforecast)

airforecast
head(airforecast)
str(airforecast)

# 봉차트
install.packages("quantmod")
library("quantmod")
highchart(type = "stock") %>% 
  hc_add_series(getSymbols("GOOG", auto.assign = FALSE)) %>% 
  hc_add_series(getSymbols("AMZN", auto.assign = FALSE),
                type = "ohlc")

#### __ [02] D3.js ####
#### ____ ● 반응형 네트워크 그래프 ####
library("networkD3")
library("d3Network")

src = c(rep("A",4), rep("B", 2), rep("C", 2), "D")
target = c("B", "C", "D", "J", "E", "F", "G", "H", "I")
networkData = data.frame(src, target)

simpleNetwork(networkData)

#### ____ ● 반응형 2D 그래프 ####
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

x = seq(from = -4 * pi, to = 4 * pi, length.out = 100)
df = expand.grid(x = x, y = x)
df$r = sqrt(df$x^2 + df$y^2)
df$z = cos(df$r^2) * exp(-df$r/6)

data_z = acast(df, x ~ y, value.var = "z")
plot_ly(z = data_z, type = "surface")

#### __ [03] radarchart ####
# install.packages("radarchart")
library("radarchart")

labs = c("리스크", "매출", "자본", "규모", "시장", "부채")
scores = list("values" = c(6, 3, 8, 6, 9, 1))

chartJSRadar(scores = scores,
             labs = labs,
             width  = 20, 
             height = 20,
             addDots = FALSE, 
             maxScale = 10,
             lineAlpha = 0,
             showLegend = FALSE)


### .-============================-. ####

#### .###################. ####
#### | 5. Shiny를 활용한 시각화 | ####
#### .###################. ####

### .-============================-. ####