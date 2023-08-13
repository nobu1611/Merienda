class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    unless column_exists? :users, :username
      add_column :users, :username, :string, null: false
    end
  end
end
