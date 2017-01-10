class CreateRetweets < ActiveRecord::Migration[5.0]
  def change
    create_table :retweets do |t|
      t.integer :tweet_id
      t.integer :original_user_id
      t.integer :created_by

      t.timestamps
    end
  end
end
