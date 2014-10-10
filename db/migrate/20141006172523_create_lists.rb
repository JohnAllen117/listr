class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.integer :likes, null: false, default: 0
      t.text :content, null: false

      t.timestamps
    end
  end
end
