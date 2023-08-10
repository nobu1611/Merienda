class UpdateUsersForNameAuthentication < ActiveRecord::Migration[7.0]
  def change
     # emailのユニーク制約を削除
    remove_index :users, :email

    # nameにユニーク制約を追加
    add_index :users, :name, unique: true

    # emailを完全にデータベースから削除
    remove_column :users, :email
  end
end
