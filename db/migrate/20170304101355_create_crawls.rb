class CreateCrawls < ActiveRecord::Migration[5.0]
  def change
    create_table :crawls do |t|
      t.text :keyword
      t.text :title
      t.text :link
      t.date :date
      t.text :user_id
      t.text :name
      t.text :text
      t.text :geo
      t.integer :method

      t.timestamps
    end
  end
end
