class MonthService

  def initialize user_id
    @user_id = user_id.to_s
  end

  def transaction_this_month
    transaction_this_month_private
  end

  def transaction_old_month month
    transaction_old_month_private month
  end

  def sum_income month
    sum_private Settings.status_income, month
  end

  def sum_expense month
    sum_private Settings.status_expense, month
  end

  private
  def transaction_this_month_private
    transactions = FinancesUser.includes(:finance).find_transaction_in_month @user_id
  end

  def transaction_old_month_private month
    transaction_in_month = FinancesUser.includes(:finance).find_transaction_by_month(@user_id, month)
  end

  def sum_private status, month
    sum_in_month = FinancesUser.sum_transaction_month(@user_id, status, month)
  end
end
