class ChangeColumnNameToSavings < ActiveRecord::Migration[5.2]
  def change
    rename_column :savings, :savingInYear, :saving_in_year
  end
end
