class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet_id
      t.string :text
      t.datetime :time_of_tweet
      t.belongs_to :twitter_user
      t.timestamps
    end
  end
end
