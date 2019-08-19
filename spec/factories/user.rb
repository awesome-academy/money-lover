FactoryBot.define do
  factory :user do
    name {FFaker::Name.unique.name}
    email {FFaker::Internet.email}
    phone {FFaker::PhoneNumber.short_phone_number}
    address {FFaker::Address.street_address}
    avatar {"links"}
    username {FFaker::Internet.user_name}
    admin {FFaker::Boolean.sample}
    password {FFaker::InternetSE.password}
    reset_digest {User.digest User.new_token}
    reset_sent_at {Time.zone.now - 1.months}
    month_intense {Random.rand(1..500000)}
    saving_id {Random.rand(1..4)}
  end
end
