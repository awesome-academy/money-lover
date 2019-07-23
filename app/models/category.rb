class Category < ApplicationRecord
  has_many :categories_users, dependent: :destroy
  has_many :categories, through: :categories_users
  belongs_to :parent, class_name: Category.name, foreign_key: "parent_id"
  has_many :finances, dependent: :destroy
end
