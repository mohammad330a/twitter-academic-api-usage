# Search and Collect Twitter User Data

user_id <- get_user_id(
  usernames = "edhogmanay", # string containing one user id or a vector of user ids
  bearer_token = get_bearer(),
)

data <- get_user_profile(
  "80868086", # string containing one user id or a vector of user ids
  bearer_token = get_bearer()
) 

timeline <- get_user_timeline(
  "80868086",  # string containing one user id or a vector of user ids
  start_tweets = "2020-01-01T00:00:00Z",
  end_tweets = "2020-12-31T23:59:59Z",
  bearer_token = get_bearer(),
  n = Inf
)

followers <- get_user_followers(
  "80868086",  # string containing one user id or a vector of user ids
)

following <- get_user_following(
  "80868086",  # string containing one user id or a vector of user ids
)

tweetsblm <- get_all_tweets(
  query = "BLM",
  users = c(“CNN”, “FoxNews”),
  start_tweets = "2016-01-01T00:00:00Z",
  end_tweets = "2020-01-05T00:00:00Z",
  bearer_token = get_bearer(),
  file = "data/blmtweets.rds", # string, name of the resulting RDS file
  data_path = "data/json_data/", # string, if supplied, fetched data can be saved to the designated path as jsons
  n = Inf
)
