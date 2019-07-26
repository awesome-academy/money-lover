class AddColumnDateToFinancesUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :finances_users, :date, :date
  end
end
