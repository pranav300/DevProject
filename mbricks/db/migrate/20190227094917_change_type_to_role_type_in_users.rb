class ChangeTypeToRoleTypeInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :type, :role_type
  end
end
