class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
end
