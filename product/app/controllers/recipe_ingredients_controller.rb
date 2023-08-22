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
      flash[:notice] = "分量を追加しました"
    else
      flash[:alert] = "分量を入力してください"
    end
    redirect_to request.referer
  end

  def update
    if @recipe_ingredient.update(recipe_ingredient_params)
      flash[:notice] = "分量を変更しました"
    else
      flash[:alert] = "分量を入力してください"
    end
    redirect_to request.referer
  end

  def destroy
    if @recipe_ingredient.destroy
      flash[:notice] = "分量を削除しました"
    else
      flash[:alert] = "分量を削除できませんでした"
    end
    redirect_to request.referer
  end

  private

  def set_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:ingredient_id, :quantity_in_grams)
  end
end
