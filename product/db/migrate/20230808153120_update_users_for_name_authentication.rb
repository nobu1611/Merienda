class UpdateUsersForNameAuthentication < ActiveRecord::Migration[7.0]
  def up
    remove_index :users, :email
    add_index :users, :username, unique: true
    remove_column :users, :email
  end

  def down
    add_column :users, :email, :string
    remove_index :users, :username
    add_index :users, :email
  end
end
