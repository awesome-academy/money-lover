FactoryBot.define do
  factory :categories_user do |f|
    f.category_id {FactoryBot.create(:category).id}
    f.user_id {FactoryBot.create(:user).id}
  end
end
