class CategoriesUser < ApplicationRecord
  belongs_to :user
  belongs_to :category

  scope :by_user_id, ->(id){where user_id: id}
end
