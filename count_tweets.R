# Search and Collect Counts of Tweets

library(ggplot2) 
library(dplyr)
library(lubridate)

tweetcounts <- count_all_tweets(
  query = "Hogmanay",                    # query
  start_tweets = "2019-12-27T00:00:00Z", # start date
  end_tweets = "2020-01-05T00:00:00Z",   # end date
  bearer_token = get_bearer(),           # token
  granularity = "hour",                  # time unit over which we are asking Twitter to count up our tweets (hours, days, minutes)
  n = 500                                # The n here just refers to the upper limit of tweet counts to be fetched
)

### convert "start" column from char to datetime and store in column time
tweetcounts$time <- 
  parse_date_time(tweetcounts$start, orders="ymdHMS")
tweetcounts %>% 
  ggplot() +
    geom_line(aes(time, tweet_count))
