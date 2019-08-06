class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, [:name, :username, :email, :phone, :address], name: "name_email_phone_address", type: :fulltext
  end
end
