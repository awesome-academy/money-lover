(1..10).each do |n|
  saving = 500000*n
  Saving.create!( saving_in_year: saving )
end

90.times do |n|
  r = Random.new
  name  = FFaker::Name.unique.name
  email = "example-#{n+1}@railstutorial.org"
  phone = 10000000000 + r.rand(1...9999999)
  address = FFaker::Address.street_address
  avatar = "links"
  username = FFaker::InternetSE.user_name_random
  password = "password"
  saving_id = r.rand(1...9)
  User.create!(name: name,
    email: email,
    phone: phone,
    address: address,
    avatar: avatar,
    username: username,
    admin: false,
    password: password,
    password_confirmation: password,
    saving_id: saving_id)
end

1.times do |n|
  r = Random.new
  name  = FFaker::Name.unique.name
  email = "admin@railstutorial.org"
  phone = 10000000000 + r.rand(1...9999999)
  address = FFaker::Address.street_address
  avatar = "links"
  username = FFaker::InternetSE.user_name_random
  password = "password"
  saving_id = r.rand(1...9)
  User.create!(name: name,
    email: email,
    phone: phone,
    address: address,
    avatar: avatar,
    username: username,
    admin: true,
    password: password,
    password_confirmation: password,
    saving_id: saving_id)
end

(1..10).each do |n|
  user = User.find_by id: n
  user.update created_at: Time.zone.now + 1.years
end

(11..25).each do |n|
  user = User.find_by id: n
  user.update created_at: Time.zone.now + 1.years + 1.months
end

(26..30).each do |n|
  user = User.find_by id: n
  user.update created_at: Time.zone.now + 1.years + 2.months
end

(31..40).each do |n|
  user = User.find_by id: n
  user.update created_at: Time.zone.now + 2.months
end

(41..60).each do |n|
  user = User.find_by id: n
  user.update created_at: Time.zone.now + 4.months
end

(61..90).each do |n|
  user = User.find_by id: n
  user.update created_at: Time.zone.now + 5.months
end

root_category = [
  "Expenditure needed",
  "Savings for future",
  "Education",
  "Enjoy",
  "Investment",
  "Charity"
]

root_category.each do |x|
  Category.create!(
    name: x
  )
end

sub_cat_1 = ["Personal", "Rental", "Transportation", "Family"]
sub_cat_2 = ["Shopping", "Traveling"]
sub_cat_3 = ["Course", "Books"]
sub_cat_4 = ["Relaxing", "Spa", "Other"]
sub_cat_5 = ["Real Estate", "Savings"]

[1,2,3,4,5].each do |x|
  sub_cat = eval("sub_cat_#{x}")
  sub_cat.each do |y|
    Category.create!(
      name: y,
      parent_id: x
    )
  end
end

income = ["Salary", "Stock", "Business", "Scholarship", "Gas", "Electric", "Water", "Food", "Rental"]

income.each do |x|
  r = Random.new
  category_id = r.rand(1...15)
  amout = 1000000 * r.rand(1...30)
  Finance.create!(
    category_id: category_id,
    name: x,
  )
end

def random_date_in_year(year)
  return rand(Date.civil(year.min, 1, 1)..Date.civil(year.max, 30, 6)) if year.kind_of?(Range)
  rand(Date.civil(year, 1, 1)..Date.civil(year, 12, 31))
end

5000.times do |n|
  r = Random.new
  finance_id = r.rand(1...8)
  user_id = r.rand(1...8)
  amout = 1000000 * r.rand(1...30)
  random_boolean = [true, false].sample
  FinancesUser.create!(
    finance_id: finance_id,
    user_id: user_id,
    amout: amout,
    status: random_boolean,
    staticExpense: random_boolean,
    date: random_date_in_year(2019)
  )
end


50.times do |n|
  r = Random.new
  category_id = r.rand(15...19)
  user_id = r.rand(1...8)
  CategoriesUser.create!(
    category_id: category_id,
    user_id: user_id,
  )
end
