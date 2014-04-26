# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'


CharityCampaign.delete_all
Category.delete_all

Category.create name: 'Здраве'
Category.create name: 'Образование'
Category.create name: 'Екология'
Category.create name: 'Култура'
Category.create name: 'Социална политика'


CSV.foreach 'db/charity_campaigns.csv', headers: true do |row|
  pic = File.open Rails.root.join 'db', 'charity_photos', row['charity_photo']
  charity = CharityCampaign.create title: row['title'], description: row['description'], goal: row['goal'], avatar: pic
  Category.all.each do |category|
    charity.categories << category
  end
  charity.save
end

