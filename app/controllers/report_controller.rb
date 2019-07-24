class ReportController < ApplicationController
  def month_report
    @transactions = FinancesUser.includes(:finance).by_user_id current_user.id

    income_transactions = @transactions.by_status(true)
    expense_transactions = @transactions - income_transactions
    gon.hash_gon = {income_amout: income_transactions.pluck(:amout).sum,
    expense_amout: expense_transactions.pluck(:amout).sum}

    @number_transactions = JSON.parse(@transactions.to_json).size
  end
end
