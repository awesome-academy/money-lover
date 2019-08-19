require "ffaker"

FactoryBot.define do
  factory :finance do
    name {FFaker::Music.song}
    association :category
  end
end
