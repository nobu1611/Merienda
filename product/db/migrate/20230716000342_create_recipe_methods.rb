class CreateRecipeMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_methods do |t|
      t.references :recipe, null: false, foreign_key: true
      t.text :method

      t.timestamps
    end
  end
end
