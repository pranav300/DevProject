class ChangeFieldNameAndTypesInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password_digest, :password
    add_index :users, :email, unique: true
    add_column :users, :password_confirmation, :string
    add_column :users, :contact_number, :string, limit:10, unique: true 
  end
end
