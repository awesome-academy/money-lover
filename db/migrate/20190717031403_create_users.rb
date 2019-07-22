class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :avatar
      t.string :username
      t.string :password_digest
      t.boolean :admin
      t.string :remember_digest
      t.string :reset_digest

      t.timestamps
    end
  end
end
