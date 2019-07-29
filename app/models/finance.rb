class Finance < ApplicationRecord
  FINANCE_PARAMS = %i(name category_id).freeze

  has_many :finances_users, dependent: :destroy
  has_many :users, through: :finances_users
  
  belongs_to :category

  delegate :name, to: :category, prefix: :cate

  validates :name, presence: true
  validates :category_id, presence: true
end
