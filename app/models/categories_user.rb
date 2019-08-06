class CategoriesUser < ApplicationRecord
  CATEGORY_USER_PARAMS =  %i(user_id)

  belongs_to :user
  belongs_to :category

  scope :by_user_id, ->(id){where user_id: id}
  scope :no_by_user, ->(user_id){where.not category_id: (where user_id: user_id).pluck(:category_id)}
end
