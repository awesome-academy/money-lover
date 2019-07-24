class FinancesUser < ApplicationRecord
  belongs_to :user
  belongs_to :finance

  scope :by_user_id, ->(id){where user_id: id}
  scope :by_status, ->(status){where status: status}
end
