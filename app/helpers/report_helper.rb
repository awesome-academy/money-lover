module ReportHelper
  def sum array
    array.map{|e| e[0]}.reduce(:+)
  end

  def saving arr1, arr2
    income = sum arr1
    expense = sum arr2
    income - expense
  end

  def standardized num
    num.round(0).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end
end
