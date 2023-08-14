class Ingredient < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients
  belongs_to :user
  validates :name, presence: true
  validates :cost_per_gram, presence: true, numericality: { greater_than: 0 }
end
