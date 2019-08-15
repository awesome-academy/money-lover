class Category < ApplicationRecord
  CATEGORY_PARAMS = %i(name parent_id).freeze
  before_save :change_root_id

  has_many :categories_users, dependent: :destroy
  has_many :users, through: :categories_users
  has_many :finances, dependent: :destroy
  belongs_to :parent_category, class_name: Category.name, optional: true, foreign_key: :parent_id
  has_many :child_categories, class_name: Category.name, foreign_key: :parent_id, dependent: :destroy

  validates :name, presence: true

  scope :root_category, -> {where parent_id: nil}
  scope :child_categories_default, -> (parent_id){where parent_id: parent_id}
  scope :category_select, ->(cat_id) {where.not id: cat_id}
  scope :by_user, ->(user_id){where id: CategoriesUser.where(user_id: user_id).pluck(:category_id)}
  scope :default_category, -> {where.not id: CategoriesUser.pluck(:category_id).uniq}
  scope :list_category, -> {pluck(:name, :id).unshift([I18n.t("option.root"), Settings.value_root])}
  scope :by_user, ->(user_id){where id: CategoriesUser.where(user_id: user_id).pluck(:category_id)}
  scope :categories_not_user, -> {where.not id: CategoriesUser.pluck(:category_id)}
  scope :categories_for_user, ->(user_id){where.not id: (CategoriesUser.no_by_user user_id).pluck(:category_id)}

  private
    def change_root_id
      self.parent_id = nil if self.parent_id == Settings.value_root
    end
end
