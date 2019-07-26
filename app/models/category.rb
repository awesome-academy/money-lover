class Category < ApplicationRecord
  CATEGORY_PARAMS = %i(name parent_id).freeze

  has_many :categories_users, dependent: :destroy
  has_many :categories, through: :categories_users
  belongs_to :parent, class_name: Category.name, optional:true, foreign_key: :parent_id
  has_many :finances, dependent: :destroy
  belongs_to :parent_category, class_name: Category.name, optional: true, foreign_key: :parent_id
  has_many :child_categories, class_name: Category.name, foreign_key: :parent_id, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :root_category, -> {where parent_id: nil}
  scope :category_select, ->(cat_id) {where.not id: cat_id}
end
