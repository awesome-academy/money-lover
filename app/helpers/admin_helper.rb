module AdminHelper
  def category_options categories
    categories.pluck :name, :id
  end
end
