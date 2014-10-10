# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# importer = Importer.new(categories.csv)

require 'csv'

filename = Rails.root.join('db/data/categories.csv')

CSV.foreach(filename, headers: true) do |row|
  attributes = row.to_hash
  category = Category.find_by(attributes)
  if category
    puts "#{row['name']} category already exists."
  else
    Category.create(attributes)
    puts "#{row['name']} category created."
  end
end
