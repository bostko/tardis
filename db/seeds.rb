# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
require 'bigdecimal'

CharityCampaign.delete_all
Category.delete_all
MoneyTransaction.delete_all

category = Category.create name: 'Здраве'
Category.create name: 'Образование'
Category.create name: 'Екология'
Category.create name: 'Култура'
Category.create name: 'Социална политика'

transaction1 = MoneyTransaction.new done_by: "Иван Георгиев", amount: BigDecimal.new("10.5"), date: DateTime.now
transaction2 = MoneyTransaction.new done_by: "Георги Захариев", amount: BigDecimal.new("110.5"), date: DateTime.now
transaction3 = MoneyTransaction.new done_by: "Мария", amount: BigDecimal.new("-22.5"), date: DateTime.now

CSV.foreach 'db/charity_campaigns.csv', headers: true do |row|
  pic = File.open Rails.root.join 'db', 'charity_photos', row['charity_photo']
  charity = CharityCampaign.create title: row['title'], description: row['description'], goal: row['goal'], avatar: pic
  charity.categories << category
  charity.money_transactions = [transaction1, transaction2, transaction3]
  charity.save
end
