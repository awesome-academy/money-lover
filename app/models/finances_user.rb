class FinancesUser < ApplicationRecord
  belongs_to :user
  belongs_to :finance

  scope :by_user_id, ->(id){where user_id: id}
  scope :by_status, ->(status){where status: status}
  scope :by_this_year, ->(){where date: Date.today.beginning_of_year..Date.today}
  scope :select_column, -> {select(Arel.sql("sum(amout) as sum_amount, monthname(date) as month_name, status"))}
  scope :pluck_column, -> {pluck(Arel.sql("sum(amout) as sum_amount, monthname(date) as month_name, status"))}
  scope :sum_each_month, ->(user_id, status) do
    select_column
      .by_user_id(user_id)
      .by_status(status)
      .by_this_year
      .group(:month_name)
      .pluck_column
  end
end
