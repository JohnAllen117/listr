class AddUserIdToLists < ActiveRecord::Migration
  def change
    add_column :lists, :user_id, :integer, null: false
  end
end
