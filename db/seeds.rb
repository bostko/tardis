require 'csv'
require 'bigdecimal'

CharityCampaign.delete_all
Category.delete_all
MoneyTransaction.delete_all

transaction1 = MoneyTransaction.new done_by: "Иван Георгиев", amount: BigDecimal.new("10.5"), date: DateTime.now
transaction2 = MoneyTransaction.new done_by: "Георги Захариев", amount: BigDecimal.new("11011.5"), date: DateTime.now
transaction3 = MoneyTransaction.new done_by: "Мария Пертова", amount: BigDecimal.new("-22.5"), date: DateTime.now
transaction4 = MoneyTransaction.new done_by: "Филип Йорданов", amount: BigDecimal.new("100.0"), date: DateTime.now
transaction5 = MoneyTransaction.new done_by: "Мария Петрова", amount: BigDecimal.new("-50"), date: DateTime.now

Category.create([
  {name: 'Здраве'},
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
    description: "Да помогнем на едно малко дете да се пребори с болестта. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.",
    goal: BigDecimal.new("50000"),
    avatar: (File.open Rails.root.join 'db', 'charity_photos', 'images.jpeg'),
    money_transactions: MoneyTransaction.create([{amount: BigDecimal.new("50000"), done_by: 'Петко Георгиев', date: DateTime.now}])
  },
  {
    title: "Да помогнем на Иван",
    description: "Да помогнем на едно малко дете да се пребори с болестта. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.",
    goal: BigDecimal.new("50000"),
    avatar: (File.open Rails.root.join 'db', 'charity_photos', 'images.jpeg'),
    money_transactions: MoneyTransaction.create([{amount: BigDecimal.new("50000"), done_by: 'Петко Георгиев', date: DateTime.now}])
  },
  {
    title: "Да почистим ФМИ",
    description: "Да изхвърлим торбичките от кофите за боклук. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.",
    goal: BigDecimal.new("500"),
    avatar: (File.open Rails.root.join 'db', 'charity_photos', 'images.jpeg'),
    money_transactions: MoneyTransaction.create([{amount: BigDecimal.new("500"), done_by: 'Петко Георгиев', date: DateTime.now}])
  },
  {
    title: "Да дарим надежда",
    description: "Да помогнем на едно младо момиче да се пребори с болестта. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram, anteposuerit litterarum formas humanitatis per seacula quarta decima et quinta decima. Eodem modo typi, qui nunc nobis videntur parum clari, fiant sollemnes in futurum.",
    goal: BigDecimal.new("20000"),
    avatar: (File.open Rails.root.join 'db', 'charity_photos', 'images.jpeg'),
    money_transactions: MoneyTransaction.create([{amount: BigDecimal.new("20000"), done_by: 'Петко Георгиев', date: DateTime.now}])
  },
])
