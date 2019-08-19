FactoryBot.define do
  factory :categories_user do
    category_id {FactoryBot.create(:category).id}
    user_id {FactoryBot.create(:user).id}
  end
end
