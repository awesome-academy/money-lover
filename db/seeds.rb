(1..10).each do |n|
  saving = 500000*n
  Saving.create!( savingInYear: saving )
end

User.create!(name: "Example User",
  email: "exam@mail.org",
  phone: "123",
  address: "HN",
  avatar: "links",
  username: "exampleUser",
  admin: true,
  password: "foobar",
  password_confirmation: "foobar",
  saving_id: 1)

99.times do |n|
  name  = FFaker::Name.unique.name
  email = "example-#{n+1}@railstutorial.org"
  phone = FFaker::PhoneNumber.short_phone_number
  address = FFaker::Address.street_address
  avatar = "links"
  username = FFaker::InternetSE.user_name_random
  password = "password"
  saving_id = 1 + Random.rand(10)
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



# category_list = [
#   ["Bills & Utilities", ["Electricity", "Gas", "Internet", "Phone", "Rental","Television", "Water"],
#   ["Bussiness", []],
#   ["Education", ["Books", "Learning English"]],
#   ["Entertainment", ["Games", "Movies"]],
#   ["Family", ["Children", "Home Improvement", "Home Services", "Pets"]],
#   ["Fees & Charges", []],
#   ["Food & Beverage", ["Café", "Restaurants"]],
#   ["Friends & Lover", []],
#   ["Gifts & Donations", ["Charity", "Funeral", "Marriage"]],
#   ["Health & Fitness", ["Doctor", "Personal Care", "Pharmacy", "Sports"]],
#   ["Insurances", []],
#   ["Investment", []],
#   ["Shopping", ["Accessories", "Clothing", "Electronics", "Footwear"]],
#   ["Transportation", ["Maintenance", "Parking Fees", "Petrol", "Taxi"]],
#   ["Travel", []]
# ]

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
