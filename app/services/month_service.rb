class MonthService
  def initialize user_id
    @user_id = user_id.to_s
  end

  def transaction_in_time_select from_date, to_date
    transaction_in_time_select_private from_date, to_date
  end

  def transaction_this_month
    transaction_this_month_private
  end

  def transaction_old_month month
    transaction_old_month_private month
  end

  def select_transaction from_date, to_date, this_month_page
    unless from_date.present?
      transaction_this_month.page(this_month_page).per Settings.this_month_per_page
    else
      transaction_in_time_select(from_date, to_date).page(this_month_page).per Settings.this_month_per_page
    end
  end

  def sum_income month
    sum_private Settings.status_income, month
  end

  def sum_expense month
    sum_private Settings.status_expense, month
  end

  def sum_this_month_income
    sum_this_month_private Settings.status_income
  end

  def sum_this_month_expense
    sum_this_month_private Settings.status_expense
  end

  private
  def transaction_this_month_private
    FinancesUser.includes(:finance).find_transaction_in_month @user_id
  end

  def transaction_old_month_private month
    FinancesUser.includes(:finance).find_transaction_by_month @user_id, month
  end

  def transaction_in_time_select_private from_date, to_date
    FinancesUser.includes(:finance).find_from_date_to_date from_date, to_date, @user_id
  end

  def sum_private status, month
    FinancesUser.sum_transaction_month @user_id, status, month
  end

  def sum_this_month_private status
    FinancesUser.sum_this_month @user_id, status
  end
end
