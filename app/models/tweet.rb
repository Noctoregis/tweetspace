require 'grackle'

class Tweet < ActiveRecord::Base

MY_APPLICATION_NAME = "TweetSpace_Ingesup"
  
  def self.get_latest
  	puts("Hello"); # Est affiché

  	tweets = client.user_timeline("gem")
    # tweets = client.statuses.user_timeline? :screen_name => MY_APPLICATION_NAME # hit the API
    puts("Hello3"); # N'est pas affiché
    tweets.each do |t|
      created = DateTime.parse(t.created_at)
      unless Tweet.exists?(["created=?", created])
        Tweet.create({:content => t.text, :created => created })
      end
    end
    
  end
  
  private
  def self.client
    Grackle::Client.new(
      ssl: true,
      auth: {
        type: :oauth,
        claonsumer_key: 'Gzm6I93ZW8sR2LMbCpod7HOnf',
        consumer_secret: 'nIOyQmzYq2wnwYMvaNHjhNutjqXnD2uTNFbvsph5KpsqxdHtJ7',
        token: "440215471-ViSDu9rTcC9OzWKmgq5cJRryALIOaJdxh28j3N0g",
        token_secret: "xOkniXd5Pvg0QJLXxmtWbIou5wmq2aOJRZUhWy7mVMIXA",
      }
    )
  end
end

