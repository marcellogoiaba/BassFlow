def index
    #Get the tweets (records) from the model Ordered by 'twitter_created_at' descending
    @tweeting = Tweet.order("twitter_created_at desc") 
    @tweeting = Post.all   
end