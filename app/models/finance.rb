class Finance < ApplicationRecord
  has_many :finances_users, dependent: :destroy
  has_many :users, through: :finances_users
  belongs_to :category
end
