class ChangeContactNumberToUniqueInUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :contact_number, unique: true
  end
end
