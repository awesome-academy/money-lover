class ReportController < ApplicationController
  include ReportHelper

  def month_report
    monthService = MonthService.new current_user.id
    @transactions = monthService.transaction_this_month
    @transactions_old_month = monthService.transaction_old_month(params['mydata']).page(params[:page]).per(Settings.old_month_per_page)
    income_transactions = @transactions.by_status(true)
    expense_transactions = @transactions - income_transactions
    @income_sum = monthService.sum_income(params['mydata'])
    @expense_sum = monthService.sum_expense(params['mydata'])
    gon.hash_gon = {income_amout: income_transactions.pluck(:amout).sum,
    expense_amout: expense_transactions.pluck(:amout).sum}

    @number_transactions = JSON.parse(@transactions.to_json).size
    respond_to do |format|
      format.js
      format.html
    end
  end

  def year_report
    yearService = YearService.new current_user.id
    @income = yearService.perform_percent_income
    @expense = yearService.perform_percent_expense
    @income_amout = yearService.perform_amount_income
    @expense_amout = yearService.perform_amount_expense
    @savings = standardized(saving(@income_amout, @expense_amout))
    @saving = Saving.new

    @saving_in_year = standardized yearService.saving_in_year
  end
end
