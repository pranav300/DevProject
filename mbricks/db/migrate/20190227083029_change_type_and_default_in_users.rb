class ChangeTypeAndDefaultInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role, :string, default: "User"
    change_column :users, :type, :string, default: "Unpaid"
    add_column :users, :validity, :string
  end
end
