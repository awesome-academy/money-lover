FactoryBot.define do
  factory :user do |f|
    f.name {FFaker::Name.unique.name}
    f.email {FFaker::Internet.email}
    f.phone {FFaker::PhoneNumber.short_phone_number}
    f.address {FFaker::Address.street_address}
    f.avatar {"links"}
    f.username {FFaker::Internet.user_name}
    f.admin {FFaker::Boolean.sample}
    f.password {FFaker::InternetSE.password}
    f.reset_digest {User.digest User.new_token}
    f.reset_sent_at {Time.zone.now - 1.months}
    f.month_intense {Random.rand(1..500000)}
    f.saving_id {FactoryBot.create :saving}
    f.created_at {Time.zone.now}
    f.updated_at {Time.zone.now}
  end
end
