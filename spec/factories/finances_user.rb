require "ffaker"

FactoryBot.define do
  factory :finances_user do
    amout {1000000.0}
    date {Time.zone.now}
    status {true}
    staticExpense {true}
    association :user
    association :finance
  end
end
