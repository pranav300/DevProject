class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :contact_number
      t.string :password_digest
      t.string :role
      t.string :role_type
      t.string :validity

      t.timestamps
    end
    add_index :users, :email, unique: true
    change_column :users, :role, :string, default: "User"
    change_column :users, :role_type, :string, default: "Unpaid"
  end
end
