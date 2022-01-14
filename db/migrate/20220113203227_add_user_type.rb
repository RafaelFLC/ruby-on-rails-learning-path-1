class AddUserType < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :password
    add_column :users, :type, :integer
  end
end
