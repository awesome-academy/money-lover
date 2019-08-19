FactoryBot.define do
  factory :saving do |f|
    f.saving_in_year {FFaker::Random.rand 100000}
  end
end
