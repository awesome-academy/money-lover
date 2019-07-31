module AdminHelper
  def category_options categories
    categories.pluck :name, :id
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
end
