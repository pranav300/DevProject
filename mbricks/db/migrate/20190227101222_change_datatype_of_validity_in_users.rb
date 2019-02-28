class ChangeDatatypeOfValidityInUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role_type, :date
  end
end
