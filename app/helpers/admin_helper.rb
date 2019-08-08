module AdminHelper
  def category_options cat_id
    Category.default_category.category_select(cat_id).list_category
  end

  def convert_hash_to_array_hash hashObj
    listMonth = []
    arrayHashObj = []
    return arrayHashObj if hashObj.blank?
    (1..12).each do |i|
      listMonth.push t("admin.months._#{i}")
      if hashObj.key? i
        arrayHashObj << {y: hashObj[i], label: listMonth[i-1]}
      else
        arrayHashObj << {y: Settings.zero, label: listMonth[i-1]}
      end
    end
    arrayHashObj
  end

  def create_id prefix, id
    "#{prefix}_#{id}"
  end
end
