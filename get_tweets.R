# Search and Collect Tweet Content 

tweetcontent <- get_all_tweets(
  query = "Hogmanay",
  start_tweets = "2019-12-31T00:00:00Z",
  end_tweets = "2020-01-01T00:00:00Z",
  bearer_token = get_bearer(),
  n = 500   # latest 'n' tweets in this time interval(use n=Inf to get all tweets)
)
