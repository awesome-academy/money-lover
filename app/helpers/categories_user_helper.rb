module CategoriesUserHelper
  def check? category
    CategoriesUser.find_by category_id: category.id
  end
end
