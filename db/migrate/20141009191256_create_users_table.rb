class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :email, null: false, uniqueness: true
      t.string :name, null: false, uniqueness: true
      t.string :first_name, null: false
      t.string :image
      t.string :oauth_token, null: false
      t.datetime :oauth_expires_at, null: false

      t.timestamps
    end
  end
end
