FactoryBot.define do
  factory :category do |f|
    f.name {FFaker::Name.unique.name}
    f.parent_id {nil}
    f.created_at {Time.zone.now}
    f.updated_at {Time.zone.now}
  end
end
