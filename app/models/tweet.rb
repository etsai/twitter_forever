class Tweet < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :twitter_user
  validates :tweet_id, :uniqueness => true

  def print_time
    "#{self.time_of_tweet.hour}:#{self.time_of_tweet.min}"
  end

  def print_date
    "#{self.time_of_tweet.month}/#{self.time_of_tweet.day}/#{self.time_of_tweet.year}"
  end
end
