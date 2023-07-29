class RecipeIngredientsController < ApplicationController
  def new
    @recipe_ingredient = RecipeIngredient.new
  end
end
