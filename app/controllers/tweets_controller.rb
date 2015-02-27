class TweetsController < ApplicationController
	before_filter :homeTimeline

  def new
  end
#The create method will take input from the user and use that information to send a tweet
#current_user method is defined in application controller.
#Pass the message to tweet method of user.rb >> Tweet Method will pass it to client.update
  def create
  	current_user.tweet(twitter_params[:message])
  end

  def twitter_params
  	params.require(:tweet).permit(:message)
  end


  def create_retweet
  	current_user.retweet(rt_params[:id])
  	
  end

  def rt
  	params.require(:retweet).permit(:id)
  end
 

  def search
  	@temp = params[:search]
  	
  	@result = @client.search(@temp)


  
     
      
    

  

  end



  def homeTimeline


  		@homeNewsFeed = []
  		

		@client = Twitter::REST::Client.new do |config|
		config.consumer_key = "HoVab6MwmTklrqD1J4Bw3A"
		config.consumer_secret = "1muXZ3UV0HKY8W3zc0Go9g1vhmXsfTopSzYujyyNTw"

		if current_user.nil? 
			config.access_token ="54292452-QPFHB62vk7HzkFz2IqfQjMopjLo5p6dZGnmUuRchE"
		else
		config.access_token = current_user.oauth_token
		config.access_token_secret = current_user.oauth_secret

		end

	end
		if !current_user.nil? 
		@tweetURIs = []
		@homeTimeline = @client.user_timeline
		#@tweetURIs << @homeTimeline.twuri
		@homeNewsFeed = @client.home_timeline
		end	
	end

	def retweet(id)
		
		@client = Twitter::REST::Client.new do |config|
		config.consumer_key = "HoVab6MwmTklrqD1J4Bw3A"
		config.consumer_secret = "1muXZ3UV0HKY8W3zc0Go9g1vhmXsfTopSzYujyyNTw"
		config.access_token = "54292452-QPFHB62vk7HzkFz2IqfQjMopjLo5p6dZGnmUuRchE"
		config.access_token_secret = "XqW0gM7RFHMz6u718MIblCjZ9PODnT255T8tTMDwj85Y8"
	end
	@client.retweet(id)
	end


end
