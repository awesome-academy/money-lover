module ReportHelper
  def sum array
    array.map{|e| e[0]}.reduce(:+)
  end

  def saving arr1, arr2
    return 0 unless arr1.present? || arr2.present?
    income = sum arr1
    expense = sum arr2
    income - expense
  end

  def standardized num
    return 0 unless num.present?
    num.round(0).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end

  def page_index params_page, index, per_page
    params_page ||= Settings.page_index
    (params_page.to_i - 1) * per_page.to_i + index.to_i + 1
  end

  def getMonth
    Date.today.strftime("%m")
  end

  def cal_money nums, percent
    nums*percent/100
  end
end
