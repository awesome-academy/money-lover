class FinancesUser < ApplicationRecord
  FINANCES_USER_PARAMS = %i(amout date user_id status staticExpense).freeze

  belongs_to :user
  belongs_to :finance

  validates :amout, presence: true, numericality: {greater_than: Settings.zero}
  validates :date, presence: true

  scope :by_user_id, ->(id){where user_id: id}
  scope :by_status, ->(status){where status: status}
  scope :by_this_month, ->(){where date: Date.today.beginning_of_month..Date.today}
  scope :by_this_year, ->(){where date: Date.today.beginning_of_year..Date.today}
  scope :by_month, ->(month){where("extract(month from date) = ?", month)}
  scope :select_column, -> {select(Arel.sql("sum(amout) as sum_amount, monthname(date) as month_name, status"))}
  scope :pluck_column, -> {pluck(Arel.sql("sum(amout) as sum_amount, monthname(date) as month_name, status"))}
  scope :order_by_updated_date, ->{order(updated_at: :desc)}
  scope :by_date, ->(from_date, to_date){where date: from_date..to_date}

  scope :last_month, -> (){where date: 1.month.ago.beginning_of_month..1.month.ago.end_of_month}
  scope :permanent, -> (){where staticExpense: true}

  scope :permanent_last_month, ->() do
    last_month.permanent
  end
  scope :sum_each_month, ->(user_id, status) do
    select_column.by_user_id(user_id).by_status(status).by_this_year.group(:month_name).pluck_column
  end
  scope :find_transaction_in_month, ->(user_id) do
    by_this_month.by_this_year.by_user_id(user_id).order_by_updated_date
  end
  scope :find_transaction_by_month, ->(user_id, month) do
    by_month(month).by_this_year.by_user_id(user_id).order_by_updated_date
  end
  scope :sum_transaction_month, ->(user_id, status, month) do
    by_user_id(user_id).by_this_year.by_status(status).by_month(month).sum(:amout)
  end
  scope :sum_this_month, ->(user_id, status) do
    by_user_id(user_id).by_this_year.by_this_month.by_status(status).sum(:amout)
  end
  scope :find_from_date_to_date, ->(from_date, to_date, user_id) do
    by_user_id(user_id).by_this_year.by_date(from_date, to_date).order_by_updated_date
  end
end
