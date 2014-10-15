# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: "Chicago" }, { name: "Copenhagen" }])
#   Mayor.create(name: "Emanuel", city: cities.first)
# importer = Importer.new(categories.csv)

require "csv"

filename = Rails.root.join("db/data/categories.csv")

CSV.foreach(filename, headers: true) do |row|
  attributes = row.to_hash
  category = Category.find_by(attributes)
  if category
    puts "#{row["name"]} category already exists."
  else
    Category.create(attributes)
    puts "#{row["name"]} category created."
  end
end
user = User.create(provider: "facebook", uid: "32123", email: "fake@fake.com", name: "Fake McFakerson", first_name: "Fake", oauth_token: "32123", oauth_expires_at: "2099-10-16 00:00:00")
list = List.create(title: "Profanity", content: "More Profanity", user_id: 2)
