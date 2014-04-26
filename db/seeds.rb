# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'

CharityCampaign.all.destroy
Category.all.destroy

CSV.foreach 'db/charity_campaigns.csv', headers: true do |row|
  pic = File.open Rails.root.join 'db', 'charity_photos', row['charity_photo']
  category = Category.find_or_create_by name: row['category']
  CharityCampaign.create title: row['title'], description: row['description'], goal: row['goal'], avatar: pic, categories: [category]
end

