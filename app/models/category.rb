class Category < ApplicationRecord
  CATEGORY_PARAMS = %i(name parent_id).freeze
  before_save :change_root_id

  has_many :categories_users, dependent: :destroy
  has_many :finances, dependent: :destroy
  belongs_to :parent_category, class_name: Category.name, optional: true, foreign_key: :parent_id
  has_many :child_categories, class_name: Category.name, foreign_key: :parent_id, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :root_category, -> {where parent_id: nil}
  scope :category_select, ->(cat_id) {where.not id: cat_id}
  scope :by_user, ->(user_id){where id: CategoriesUser.where(user_id: user_id).pluck(:category_id)}
  scope :default_category, -> {where.not id: CategoriesUser.pluck(:category_id).uniq}

  private
    def change_root_id
      self.parent_id = nil if self.parent_id == Settings.value_root
    end
end
