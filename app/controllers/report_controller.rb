class ReportController < ApplicationController
  include ReportHelper

  def month_report
    @transactions = FinancesUser.includes(:finance).by_user_id current_user.id

    income_transactions = @transactions.by_status(true)
    expense_transactions = @transactions - income_transactions
    gon.hash_gon = {income_amout: income_transactions.pluck(:amout).sum,
    expense_amout: expense_transactions.pluck(:amout).sum}

    @number_transactions = JSON.parse(@transactions.to_json).size
  end

  def year_report
    yearService = YearService.new current_user.id
    @income = yearService.perform_percent_income
    @expense = yearService.perform_percent_expense
    @income_amout = yearService.perform_amount_income
    @expense_amout = yearService.perform_amount_expense
    @savings = standardized(saving(@income_amout, @expense_amout))
    @saving = Saving.new
  end
end
