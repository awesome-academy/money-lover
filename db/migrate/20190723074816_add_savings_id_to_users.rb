class AddSavingsIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :saving, foreign_key: true
  end
end
