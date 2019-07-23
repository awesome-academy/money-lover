class CreateCategoriesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_users do |t|

      t.timestamps
    end
  end
end
