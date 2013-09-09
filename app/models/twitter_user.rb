class TwitterUser < ActiveRecord::Base
  # Remember to create a migration!

  has_many :tweets

  def fetch_tweets!
    user_timeline = Twitter.user_timeline(self.handle)[0..9]
    user_timeline.each do |tweet|
      tweet = self.tweets.new(tweet_id: tweet.id, text: tweet.text, time_of_tweet: tweet.created_at)
      tweet.save
    end
  end

  def tweets_stale?
    true if Time.now - self.tweets.last.updated_at > 900
  end

  def avg_time_between_tweets
    times = []
    last_ten = self.tweets[-10..-1]
    p self.tweets[-10..-1]
    last_ten.each_with_index do |tweet, i|
      if (i - 1) > -1 
        times << (last_ten[i].time_of_tweet - last_ten[i-1].time_of_tweet)
      end
    end
    (times.inject(:+))/9
  end


end
