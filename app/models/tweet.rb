class Tweet < ActiveRecord::Base

MY_APPLICATION_NAME = "TweetSpace_Ingesup"
  
  def self.get_latest
  	#tweets = client.user_timeline("Space_Station")
    #tweets = client.get("https://api.twitter.com/1.1/search/tweets.json?q=%40from%3ASpace_Station+filter%3Aimages&result_type=popular")
    search_options = {
    result_type: "popular",
    from: "Space_Station",
    filter: "images",
    media: "true",
    tweet_mode: 'extended',
    }
    tweets = client.search("", search_options).take(12)
    tweets.each do |t|
      puts(t.favorite_count)
    end
  end
  
  private
  def self.client
  client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "Gzm6I93ZW8sR2LMbCpod7HOnf"
      config.consumer_secret     = "nIOyQmzYq2wnwYMvaNHjhNutjqXnD2uTNFbvsph5KpsqxdHtJ7"
      config.access_token        = "440215471-ViSDu9rTcC9OzWKmgq5cJRryALIOaJdxh28j3N0g"
      config.access_token_secret = "xOkniXd5Pvg0QJLXxmtWbIou5wmq2aOJRZUhWy7mVMIXA"
    end
  end

end

