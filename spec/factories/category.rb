require "ffaker"

FactoryBot.define do
  factory :category do |f|
    f.name {FFaker::Name.unique.name}
    f.parent_id {Random.rand(1..4)}
  end
end
