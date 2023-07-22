class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.decimal :cost_per_gram, precision: 10, scale: 2

      t.timestamps
    end
  end
end
