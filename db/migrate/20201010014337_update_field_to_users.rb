class UpdateFieldToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :email
    remove_column :users, :userName
    add_column :users, :email, :string,  null: false, uniqueness: true
    add_column :users, :userName, :string,  null: false, uniqueness: true
  end
end
