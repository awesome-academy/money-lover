(1..10).each do |n|
  saving = 500000*n
  Saving.create!( saving_in_year: saving )
end

9.times do |n|
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
    admin: true,
    password: password,
    password_confirmation: password,
    saving_id: saving_id)
end

root_category = [
  "Bills & Utilities",
  "Bussiness",
  "Education",
  "Entertainment",
  "Family",
  "Fees & Charges",
  "Food & Beverage",
  "Friends & Lover",
  "Gifts & Donations",
  "Health & Fitness",
  "Insurances",
  "Investment",
  "Shopping",
  "Transportation",
  "Travel"
]

root_category.each do |x|
  Category.create!(
    name: x
  )
end

sub_cat_1 = ["Electricity", "Gas", "Internet", "Phone", "Rental","Television", "Water"]
sub_cat_3 = ["Books", "Learning English"]
sub_cat_4 = ["Games", "Movies"]

[1,3,4].each do |x|
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

50.times do |n|
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
