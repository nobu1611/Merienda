class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @recipe = Recipe.all
    @user = current_user
    @recipes = @user.recipes
    @ingredients = @user.ingredients
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build
    @recipe.recipe_methods.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipe.save
      flash[:notice] = "新しいレシピを作成しました"
      redirect_to edit_recipe_path(@recipe.id)
    else
      render :new, flash[:alert] = "レシピを入力してください"
    end
  end

  def show
    @recipe_ingredient = RecipeIngredient.new
    @recipe_method = RecipeMethod.new
    @user = current_user
    @ingredients = @user.ingredients
    @recipe_ingredients = RecipeIngredient.where(recipe_id: @recipe.id).includes(:ingredient)
    @recipe_methods = @recipe.recipe_methods
  end

  def edit
    @user = current_user
    @ingredients = @user.ingredients
    @recipe_ingredients = RecipeIngredient.where(recipe_id: @recipe.id).includes(:ingredient)
    @recipe_methods = @recipe.recipe_methods
    @recipe_method = RecipeMethod.new
  end

  def update
    @recipe.update(recipe_params)
    redirect_to request.referer
    flash[:notice] = "更新しました"
  end

  def destroy
    @recipe.destroy
    redirect_to request.referer
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # def recipe_params
  #   params.require(:recipe).permit(:title, :notes)
  # end

  # 許可するパラメーターを設定
  def recipe_params
    params.require(:recipe).permit(:title, :notes, recipe_ingredients_attributes: [:id, :ingredient_id, :quantity_in_grams], recipe_methods_attributes: [:id, :process])
  end
end
