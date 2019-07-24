class CreateFinancesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :finances_users do |t|
      t.references :user, foreign_key: true
      t.references :finance, foreign_key: true
      t.float :amout
      t.boolean :status
      t.boolean :staticExpense

      t.timestamps
    end
  end
end
