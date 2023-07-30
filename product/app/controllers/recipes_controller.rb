class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    # @recipe = Recipe.new
    @recipes = Recipe.all
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
      redirect_to recipe_path(@recipe.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @recipe_ingredient = RecipeIngredient.new
    @recipe_method = RecipeMethod.new
    @user = current_user
    @ingredients = @user.ingredients
    # @recipe_ingredients = @ingredients.left_joins(:recipe_ingredients)
    @recipe_ingredients = RecipeIngredient.where(recipe_id: @recipe.id).includes(:ingredient)
    # @recipe_ingredients = @recipe.joins(:recipe_ingredients)
    # @recipe_ingredients = @recipe.recipe_ingredients.joins(:recipe)
    @recipe_methods = @recipe.recipe_methods
  end

  def edit
    @user = current_user
    @ingredients = @user.ingredients
    @recipe_ingredients = RecipeIngredient.where(recipe_id: @recipe.id).includes(:ingredient)
    @recipe_methods = @recipe.recipe_methods
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to request.referer
    else
      redirect_to request.referer, alert: @recipe.errors.full_messages.join(', ')
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # def recipe_params
  #   params.require(:recipe).permit(:title, :notes)
  # end
  def recipe_params
  params.require(:recipe).permit(:title, :notes, recipe_ingredients_attributes: [:id, :ingredient_id, :quantity_in_grams], recipe_methods_attributes: [:id, :process])
  end

end
