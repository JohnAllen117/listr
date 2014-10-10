class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users_tables do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :nickname, null: false, uniqueness: true
      t.string :email, null: false, uniqueness: true
      t.string :name, null: false, uniqueness: true
      t.string :image
      t.string :oauth_token, null: false
      t.datetime :oauth_expires_at, null: false

      t.timestamps
    end
  end
end
