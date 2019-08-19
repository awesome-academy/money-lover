require "ffaker"

FactoryBot.define do
  factory :finance do |f|
    f.name {FFaker::Music.song}
    f.category_id {Random.rand(1..4)}
    f.created_at {Time.zone.now}
    f.updated_at {Time.zone.now}
end
end
