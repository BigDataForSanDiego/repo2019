setwd("C:/Users/Aiden/Documents/GitHub/BigDataHackSDSU/2019-Team-101")

#Load dependencies
library(dplyr)
library(readxl)
library(tidyverse)
library(ggmap)
library(httr)
library(jsonlite)
library(rgdal)
library(data.table)
library(stringr)
library(ggplot2)
library(gridExtra)
library(grid)
library(reshape2)
library(lattice)

# google maps api

register_google(key = "AIzaSyBvG1tvPsmSts5bo1p-vkHF5_2y_H9KgH8")
has_google_key()

# df <- read_excel("2016aadt.xls")
# df <- df %>% filter(df$County == "SD")

sd.map <- get_map(location = "San Diego, California", maptype = "roadmap", color = "bw",
                                    source = "google", zoom = 13)

# merging the two datasets by pole_id
# p.df1 <- read.csv("treas_parking_meters_loc_datasd.csv")
# p.df2 <- read.csv("treas_parking_payments_2019_datasd.csv")
# 
# p.df <- merge(p.df1, p.df2, by.x = "pole", by.y = "pole_id")

p.df <- read.csv("parking_meter.csv")

# organizes by unique pole
p.df3 <- unique(p.df, by = "pole")

mean(p.df$trans_amt)

# # used to filter below
# uniq_config <- unique(p.df3, by= "config_name")
# uniq_config$config_name

# filtering out meters that have shorter than 2 hrs availability (could make it prettier but...)
p.df4 <- p.df%>% filter(config_name != "15 Min Max $1.25 HR 8am-6pm Mon-Sat")
p.df4 <- p.df4%>% filter(config_name != "15 Min Max $1.25 HR 10am-8pm Mon-Sat  (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "30 Min Max $1.25 HR 10am-8pm Mon-Sat  (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "1 Hour Max $1.25 HR 10am-8pm Mon-Sat")
p.df4 <- p.df4%>% filter(config_name != "1 Hour Max $1.25 HR 10am-8pm Mon-Sat (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "30 Min Max $1.25 HR 8am-6pm Mon-Sat (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "30 Min Max $1.25 HR 8am-6pm Mon-Sat")
p.df4 <- p.df4%>% filter(config_name != "MSPM 1 Hour Max $1.25 HR 10am-8pm Mon-Sat")
p.df4 <- p.df4%>% filter(config_name != "1 Hour Max $1.25 HR 8am-6pm Mon-Sat")
p.df4 <- p.df4%>% filter(config_name != "1 Hour Max $1.25 HR 8am-5pm Mon-Sat, No Parking 5pm-2am, 3 Min Passenger Loading")
p.df4 <- p.df4%>% filter(config_name != "15 Min Max $1.25 HR 10am-8pm Mon-Sat (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "30 Min Max $1.25 HR 10am-8pm Mon-Sat (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "15 Min Max $1.25 HR 10am-8pm Mon-Fri  (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "San Diego Default")
p.df4 <- p.df4%>% filter(config_name != "30 Min Max $1.25 HR 10am-8pm Mon-Sat (Mobile Pay), 3 Min Passenger Loading")
p.df4 <- p.df4%>% filter(config_name != "15 Min Max $1.25 7am-7pm Daily")
p.df4 <- p.df4%>% filter(config_name != "15 Min Max $1.25 HR 10am-8pm Mon-Sat (Mobile Pay), 3 Min Passenger Loading")
p.df4 <- p.df4%>% filter(config_name != "30 Min Max $1.25 HR 8am-8pm Mon-Sat (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "MSPM 1 Hour Max $1.25 HR 9am-6pm Mon-Sat")
p.df4 <- p.df4%>% filter(config_name != "15 Min Max $1.25 HR 8am-6pm Mon-Sat (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "1 Hour Max $1.25 HR 8am-6pm Mon-Sat (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "1 Hour Max $1.25 HR 8am-4pm Mon-Sat")
p.df4 <- p.df4%>% filter(config_name != "1 Hour Max $1.25 HR 8am-4pm Mon-Fri 8am-6pm Sat")
p.df4 <- p.df4%>% filter(config_name != "15 Min Max $1.25 HR 8am-6pm M-Sat")
p.df4 <- p.df4%>% filter(config_name != "MSPM Ballpark Special Event")
p.df4 <- p.df4%>% filter(config_name != "Single Space 2 hour meters Petco Special Event (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "Single Space 30 min meters Petco Special Event Parking (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "30 Min Max $1.25 HR 8am-5pm Mon-Sat, No Parking 5pm-2am, 3 Min Passenger Loading")
p.df4 <- p.df4%>% filter(config_name != "15 Min Max $1.25 HR 8am-6pm Mon-Sat  (Mobile Pay)")
p.df4 <- p.df4%>% filter(config_name != "30 Min Max $1.25 HR 8am-6pm Mon-Sat  (Mobile Pay)")

# # looking for the unique poles that has been filtered
# uniq_p.df4 <- unique(p.df4, by = "pole")

# display map of sd with all parking meters
ggmap(sd.map) + geom_point(data = p.df3, aes(x = longitude, y = latitude), size = 0.13, alpha = 0.3)

# display map of sd with parking meters more than 2 hr availability
ggmap(sd.map) + geom_point(data = uniq_p.df4, aes(x = longtitude, y = latitude), size = 0.13, alpha = 0.3)

# mean is around 120 suggesting that people might be staying for about an hour.
mean(p.df4$trans_amt)
# sd is REALLY big.
sd(p.df4$trans_amt)

# # showed it wasn't norm. had weird steps
# qqnorm(p.df4$trans_amt)


count_cash <- nrow(p.df4%>%filter(pay_method == "CASH"))
count_card <- nrow(p.df4 %>% filter(pay_method == "CREDIT CARD")) + nrow(p.df4 %>% filter(pay_method == "SMART CARD"))

# extractiing day name
p.df4.mod <- p.df4 %>% mutate(trans_start_day = as.Date(p.df4$trans_start))
p.df4.mod <- p.df4 %>% mutate(trans_start_day_name = strftime(p.df4.mod$trans_start_day, "%A"))

weekday <- c("Monday", "Tuesday", "Wednesday", "Thursday")
weekend <- c("Friday","Saturday", "Sundady")

temp <- numeric(dim(p.df4.mod)[1])
for(i in 1:dim(p.df4.mod)[1])
{
  for(d in weekday)
  {
    if(p.df4.mod$trans_start_day_name[i] == d)
    {
      temp[i] <- 1
    }
  }
}

# added binary 1 = weekday, 0 = weekend
p.df4.mod <- p.df4.mod %>% mutate(trans_start_weekday_binary = temp)

# extracting time of transaction start
p.df4.mod <- p.df4.mod %>% mutate(trans_start_time = as.ITime(p.df4.mod$trans_start))

# count of weekday and weekend
count_weekday <- nrow(p.df4.mod %>% filter(trans_start_weekday_binary == 0))
count_weekend <- nrow(p.df4.mod %>% filter(trans_start_weekday_binary == 1))

# shows that people don't really stay much longer than an hour.
mean((p.df4.mod%>%filter(trans_start_weekday_binary == 0))$trans_amt)
mean((p.df4.mod%>%filter(trans_start_weekday_binary == 1))$trans_amt)

# about 100 each.
sd((p.df4.mod%>%filter(trans_start_weekday_binary == 0))$trans_amt)
sd((p.df4.mod%>%filter(trans_start_weekday_binary == 1))$trans_amt)

# extracts hours and puts it in a column
p.df4.mod <- p.df4.mod %>% mutate(trans_start_time_hour = format(strptime(trans_start_time,"%H:%M:%S"),'%H'))

# Dawn: 4am - 6am, Morning: 6am - 12am, Noon: 12am - 1pm, Afternoon: 1pm - 4pm
# Evening: 4pm - 9pm, Night: 9pm - 11pm, Midnight: 11pm - 12am, Past Midnight: 12am - 4am
# after midnight till 10 people dont use parking meters
time_of_day <- c("morning", "noon", "afternoon", "evening", "night")
# 
# temp <- p.df4.mod$trans_start_time_hour
# for(i in 1:length(temp))
# {
#   if(temp[i] >= 4 & temp[i] < 6)
#   {temp[i] = "Dawn"} else if(temp[i] >= 6 & temp[i] < 11)
#   {temp[i] = "Morning"} else if(temp[i] >= 11 & temp[i] < 13)
#   {temp[i] = "Noon"} else if(temp[i] >= 13 & temp[i] < 16)
#   {temp[i] = "Afternoon"} else if(temp[i] >= 16 & temp[i] < 21)
#   {temp[i] = "Evening"} else if(temp[i] >= 21 & temp[i] < 24)
#               {temp[i] = "Night"} else{temp[i] = "Past Midnight"}
# }
# 
# p.df4.mod <- p.df4.mod %>% mutate(time_of_day = temp)


p.df4.morning <- p.df4.mod %>% filter(trans_start_time_hour == 10|
                                        trans_start_time_hour == 11)

p.df4.noon <- p.df4.mod %>% filter(trans_start_time_hour == 12|
                                     trans_start_time_hour == 13)

p.df4.afternoon <- p.df4.mod %>% filter(trans_start_time_hour == 14|
                                          trans_start_time_hour == 15|
                                          trans_start_time_hour == 16)

p.df4.evening <- p.df4.mod %>% filter(trans_start_time_hour == 17|
                                        trans_start_time_hour == 18|
                                        trans_start_time_hour == 19)
  
p.df4.night <- p.df4.mod %>% filter(trans_start_time_hour == 20|
                                      trans_start_time_hour == 21|
                                      trans_start_time_hour == 22|
                                      trans_start_time_hour == 23)

p.df4.morning <- p.df4.morning %>% mutate(time_of_day = "morning")
p.df4.noon <- p.df4.noon %>% mutate(time_of_day = "noon")
p.df4.afternoon <- p.df4.afternoon %>% mutate(time_of_day = "afternoon")
p.df4.evening <- p.df4.evening %>% mutate(time_of_day = "evening")
p.df4.night <- p.df4.night %>% mutate(time_of_day = "night")

mean(p.df4.morning$trans_amt)
mean(p.df4.noon$trans_amt)
mean(p.df4.afternoon$trans_amt)
mean(p.df4.evening$trans_amt)
mean(p.df4.night$trans_amt)

#### PLOT ####
df <- rbind(p.df4.morning, p.df4.noon)
df <- rbind(df, p.df4.afternoon)
df <- rbind(df, p.df4.evening)
df <- rbind(df, p.df4.night)

trans_amt.box <- ggplot(df, aes(x = time_of_day, y = trans_amt)) +
  geom_boxplot()

trans_amt.box

morning.trans_amt.hist <- ggplot(filter(df, time_of_day == "morning"), aes(x = trans_amt)) +
  geom_histogram() +
  theme(axis.title = element_blank()) +
  ggtitle("Morning")

noon.trans_amt.hist <- ggplot(filter(df, time_of_day == "noon"), aes(x = trans_amt)) +
  geom_histogram() +
  theme(axis.title = element_blank()) +
  ggtitle("Noon")

afternoon.trans_amt.hist <- ggplot(filter(df, time_of_day == "afternoon"), aes(x = trans_amt)) +
  geom_histogram() +
  theme(axis.title = element_blank()) +
  ggtitle("Afternoon")

evening.trans_amt.hist <- ggplot(filter(df, time_of_day == "evening"), aes(x = trans_amt)) +
  geom_histogram() +
  theme(axis.title = element_blank()) +
  ggtitle("Evening")

night.trans_amt.hist <- ggplot(filter(df, time_of_day == "night"), aes(x = trans_amt)) +
  geom_histogram() +
  theme(axis.title = element_blank()) +
  ggtitle("Night")

grid.arrange(morning.trans_amt.hist, noon.trans_amt.hist, afternoon.trans_amt.hist,
             evening.trans_amt.hist, night.trans_amt.hist, bottom = textGrob("Transaction Amount (in cents)",gp=gpar(fontsize=15)),
             left = textGrob("Count", rot = 90, vjust = 0.4, gp=gpar(fontsize=15)),
             top = textGrob("Transaction by period of day", gp=gpar(fontsize=15)))

## END PLOT ##
#####################
# for(i in time_of_day)
# {
#   eval(parse(text=paste0("mean(p.df4.",i,"$trans_amt, na.rm = TRUE")))
# 
# }
# # unique street array by zone
# uniq_strt_ar <- unique(p.df4, by = "zone")

# street_lamp <- read.csv("street_lights.csv")

# 
# 
# 
# 
# ggmap(sd.map) + geom_point(data = street_lamp, aes(x = lon, y = lat), size = .13, alpha = 0.3)
#   
# mts_key <- "b1045cbf-9203-48ba-89c2-b9b949f7442e"
# path <- paste("https://realtime.sdmts.com/api/api/gtfs_realtime/vehicle-positions-for-agency/MTS.pb?key=",
#               mts_key, sep = "")
# 
# loc <- GET(path)
# 
# loc_text <- content(loc, "text")
# 
# loc_json <- fromJSON(loc_text, flatten = TRUE)
# 
# 
# stringi::stri_enc_detect(content(loc, "raw"))
# 
# 
# bus_stop <- readOGR("transit_stops_datasd.geojson")
# bstop.df <- as.data.frame(bus_stop)
# bstop.df <- mutate(bstop.df, lon = coords.x1, lat = coords.x2)



