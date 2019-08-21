FactoryBot.define do
  factory :saving do
    saving_in_year {FFaker::Random.rand 100000}
  end
end
