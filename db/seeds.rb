require 'csv'

CharityCampaign.delete_all
Category.delete_all
CharityOwner.delete_all
CharityAccountTransaction.delete_all

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

prng = Random.new

CSV.foreach 'db/charity_campaigns.csv', headers: true do |row|
  pic = File.open Rails.root.join 'db', 'charity_photos', row['charity_photo']
  charity = CharityCampaign.create title: row['title'], description: row['description'], goal: row['goal'], avatar: pic
  Category.all.each do |category|
    charity.categories << category
  end
  charity.charity_account_transactions.create([
    {amount: prng.rand(5000), done_by: 'Иван Георгиев', transaction_type: 'transaction'},
    {amount: prng.rand(5000), done_by: 'Иван Георгиев', transaction_type: 'transaction'},
    {amount: prng.rand(1000), done_by: 'Иван Георгиев', transaction_type: 'transaction'},
    {amount: prng.rand(2000), done_by: 'Иван Георгиев', transaction_type: 'transaction'},
    {amount: prng.rand(100), done_by: 'Иван Георгиев', transaction_type: 'transaction'},
    {amount: prng.rand(5000), done_by: 'Иван Георгиев', transaction_type: 'transaction'},
    ])
  charity.save
end

# Happy Endings
CharityCampaign.create([
  {
    title: "Да помогнем на Мария",
    description: "Да помогнем на едно малко дете да се пребори с болестта",
    goal: 50000,
    avatar: 'images.jpeg',
    charity_account_transactions: CharityAccountTransaction.create([{amount: 50000, done_by: 'Петко Георгиев', transaction_type: 'transaction'}])
  },
  {
    title: "Да помогнем на Иван",
    description: "Да помогнем на едно малко дете да се пребори с болестта",
    goal: 50000,
    avatar: 'images.jpeg',
    charity_account_transactions: CharityAccountTransaction.create([{amount: 50000, done_by: 'Петко Георгиев', transaction_type: 'transaction'}])
  },
  {
    title: "Да почистим ФМИ",
    description: "Да изхвърлим торбичките от кофите за боклук",
    goal: 500,
    avatar: 'images.jpeg',
    charity_account_transactions: CharityAccountTransaction.create([{amount: 500, done_by: 'Петко Георгиев', transaction_type: 'transaction'}])
  },
  {
    title: "Да дарим надежда",
    description: "Да помогнем на едно младо момиче да се пребори с болестта",
    goal: 20000,
    avatar: 'images.jpeg',
    charity_account_transactions: CharityAccountTransaction.create([{amount: 20000, done_by: 'Петко Георгиев', transaction_type: 'transaction'}])
  },
])
