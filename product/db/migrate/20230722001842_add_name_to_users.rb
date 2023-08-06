class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    unless column_exists? :users, :name
      add_column :users, :name, :string, null: false
    end
  end
end
