class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, null: false, uniqueness: true
      t.integer :categorization_id, null: false
    end
  end
end
