class RenameMethodInRecipeMethods < ActiveRecord::Migration[7.0]
  def change
    rename_column :recipe_methods, :method, :process
  end
end
