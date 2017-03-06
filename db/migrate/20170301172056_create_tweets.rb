class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :title
      t.text :link
      t.timestamps
    end
  end
end