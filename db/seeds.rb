# encoding: utf-8
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

transaction1 = MoneyTransaction.new done_by: "Иван Георгиев", amount: BigDecimal.new("10.5"), date: DateTime.now
transaction2 = MoneyTransaction.new done_by: "Георги Захариев", amount: BigDecimal.new("110.5"), date: DateTime.now
transaction3 = MoneyTransaction.new done_by: "Мария Пертова", amount: BigDecimal.new("-22.5"), date: DateTime.now
transaction4 = MoneyTransaction.new done_by: "Филип Йорданов", amount: BigDecimal.new("100.0"), date: DateTime.now
transaction5 = MoneyTransaction.new done_by: "Мария Петрова", amount: BigDecimal.new("-50"), date: DateTime.now

Category.create([
  {name: 'Здраве'},
  {name: 'Образование'},
  {name: 'Образование'},
  {name: 'Екология'},
  {name: 'Култура'},
  {name: 'Социална политика'},
]) 

CharityOwner.create([
  {name: 'Фондация Екообщност'},
  {name: 'Иван Иванов'},
  {name: 'Петър Георгиев'},
  {name: 'Фондация Светът на Мария'},
  {name: 'Фондация за нашите деца'},
  {name: 'Екообщност'},
  {name: 'Общество'},
  {name: 'Мария Петкова'},
  {name: 'Тодор Пасквалев'},
  {name: 'БТВ'},
])

#prng = Random.new

CSV.foreach 'db/charity_campaigns.csv', headers: true do |row|
  pic = File.open Rails.root.join 'db', 'charity_photos', row['charity_photo']
  charity = CharityCampaign.create title: row['title'], description: row['description'], goal: row['goal'], avatar: pic
  charity.money_transactions = [transaction1, transaction2, transaction3, transaction4, transaction5]
  Category.all.each do |category|
    charity.categories << category
  end
  charity.save
end

# Happy Endings
CharityCampaign.create([
  {
    title: "Да помогнем на Мария",
    description: "Да помогнем на едно малко дете да се пребори с болестта",
    goal: BigDecimal.new("50000"),
    avatar: 'images.jpeg',
    money_transactions: MoneyTransaction.create([{amount: BigDecimal.new("50000"), done_by: 'Петко Георгиев', date: DateTime.now}])
  },
  {
    title: "Да помогнем на Иван",
    description: "Да помогнем на едно малко дете да се пребори с болестта",
    goal: BigDecimal.new("50000"),
    avatar: 'images.jpeg',
    money_transactions: MoneyTransaction.create([{amount: BigDecimal.new("50000"), done_by: 'Петко Георгиев', date: DateTime.now}])
  },
  {
    title: "Да почистим ФМИ",
    description: "Да изхвърлим торбичките от кофите за боклук",
    goal: BigDecimal.new("500"),
    avatar: 'images.jpeg',
    money_transactions: MoneyTransaction.create([{amount: BigDecimal.new("500"), done_by: 'Петко Георгиев', date: DateTime.now}])
  },
  {
    title: "Да дарим надежда",
    description: "Да помогнем на едно младо момиче да се пребори с болестта",
    goal: BigDecimal.new("20000"),
    avatar: 'images.jpeg',
    money_transactions: MoneyTransaction.create([{amount: BigDecimal.new("20000"), done_by: 'Петко Георгиев', date: DateTime.now}])
  },
])
