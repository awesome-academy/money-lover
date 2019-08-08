class ReportController < ApplicationController
  include ReportHelper

  before_action :cal_saving

  def month_report
    monthService = MonthService.new current_user.id
    @transactions = monthService.select_transaction(params["from_date"], params["to_date"], params[:this_month_page])
    @transactions_old_month = monthService.transaction_old_month(params["mydata"]).page(params[:old_month_page]).per(Settings.old_month_per_page)
    income_transactions = @transactions.by_status(true)
    expense_transactions = @transactions - income_transactions
    @income_sum = monthService.sum_income(params["mydata"])
    @expense_sum = monthService.sum_expense(params["mydata"])
    @sum_this_month_income = monthService.sum_this_month_income
    @sum_this_month_expense = monthService.sum_this_month_expense
    @this_month_page = params[:this_month_page] ? params[:this_month_page] : "1"
    gon.hash_gon = {income_amout: income_transactions.pluck(:amout).sum,
    expense_amout: expense_transactions.pluck(:amout).sum}

    @number_transactions = JSON.parse(@transactions.to_json).size
    @categories_user = Category.by_user current_user.id

    respond_to do |format|
      format.js
      format.html
    end
  end

  def year_report
    yearService = YearService.new current_user.id
    @income = yearService.perform_percent_income
    @expense = yearService.perform_percent_expense
    @expense_sum = yearService.sum_transaction(@expense_amout)
    @income_sum = yearService.sum_transaction(@income_amout)
    @saving = Saving.new
  end

  def cal_saving
    yearService = YearService.new current_user.id
    @income_amout = yearService.perform_amount_income
    @expense_amout = yearService.perform_amount_expense
    @saving_in_year = standardized yearService.saving_in_year
    @savings = standardized saving(@income_amout, @expense_amout)
  end
end
