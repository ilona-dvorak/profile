require "json"
require "rest-client"
# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.
TOP_STORIES_URL = "https://hacker-news.firebaseio.com/v0/topstories.json"
posts_ids = JSON.parse(RestClient.get(TOP_STORIES_URL))
new_posts = posts_ids.first(10)

new_posts.each do |id|
  url = "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
  post = JSON.parse(RestClient.get(url))
  title = post["title"]
  votes = post["scores"]
  url = post["url"]
  Post.create(title: title, votes: votes, url: url)
end
