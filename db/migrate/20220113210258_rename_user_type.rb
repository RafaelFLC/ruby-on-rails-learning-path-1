class RenameUserType < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :type, :role
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
