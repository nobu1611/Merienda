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
    @recipe.user = current_user

    if @recipe.save
      respond_to do |format|
        format.html { redirect_to recipe_path(@recipe) }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @recipe_ingredients = @recipe.recipe_ingredients
    @recipe_methods = @recipe.recipe_methods
  end

  def edit
    @recipe.recipe_ingredients.build
    @recipe.recipe_methods.build
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
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

  def recipe_params
    params.require(:recipe).permit(:title, :notes, :user_id)
  end
end
