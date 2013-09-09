class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :name
      t.string :handle
      t.integer :followers_count
      t.datetime :twitter_birthday
      t.timestamps
    end
  end
end
