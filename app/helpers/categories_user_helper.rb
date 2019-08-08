module CategoriesUserHelper
  def get_default_cate list_category
    list_category.select{|category| !not_default(category)}
  end

  def not_default category
    CategoriesUser.find_by category_id: category.id
  end
end
