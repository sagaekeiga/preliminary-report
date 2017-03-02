class CreateBots < ActiveRecord::Migration[5.0]
  def change
    create_table :bots do |t|
      t.text :name
      t.text :url
      t.text :xpath
      t.text :selector
      t.string :date
      t.integer :call_id
      t.integer :pattern

      t.timestamps
    end
  end
end
