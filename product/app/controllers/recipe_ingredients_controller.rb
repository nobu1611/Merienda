class RecipeIngredientsController < ApplicationController
  before_action :set_recipe_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @recipe_ingredient = RecipeIngredient.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    @recipe_ingredient.recipe_id = @recipe.id

    if @recipe_ingredient.save
      redirect_to request.referer
    else
      redirect_to recipe_recipe_ingredient_path, alert: @ingredient.errors.full_messages.join(', ')
    end
  end

  def update
    if @recipe_ingredient.update(recipe_ingredient_params)
      redirect_to request.referer
    else
      redirect_to request.referer, alert: @recipe_ingredient.errors.full_messages.join(', ')
    end
  end

  def destroy
    if @recipe_ingredient.destroy
      redirect_to request.referer
    else
      redirect_to request.referer, alert: @recipe_ingredient.errors.full_messages.join(', ')
    end
  end

  private

  def set_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:ingredient_id, :quantity_in_grams)
  end
end
