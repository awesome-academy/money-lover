class YearService
  def initialize user_id
    @user_id = user_id.to_s
  end

  def perform_amount_income
    cal_amount(Settings.status_income)
  end

  def perform_amount_expense
    cal_amount Settings.status_expense
  end

  def perform_percent_income
    cal_percent Settings.status_income
  end

  def perform_percent_expense
    cal_percent Settings.status_expense
  end

  def saving_in_year
    saving_year
  end

  private
  def cal_amount status
    @amount = FinancesUser.sum_each_month @user_id, status
    JSON.parse @amount.to_json
  end

  def cal_percent status
    @percent = FinancesUser.select(:amout).where("(date between DATE_FORMAT(NOW(),'%Y-01-01')
    AND NOW())").where(user_id: @user_id).where(status: status)
    @percent.to_json
  end

  def convert_arr_to_fixnum num
    num.inject{|n, d| n * 10 + d}
  end

  def saving_year
    saving_id = User.by_user_id(@user_id).pluck :saving_id
    saving_in_year = Saving.by_saving_id(convert_arr_to_fixnum(saving_id)).pluck :saving_in_year
    convert_arr_to_fixnum saving_in_year
  end
end
