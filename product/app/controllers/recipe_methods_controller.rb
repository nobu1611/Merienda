class RecipeMethodsController < ApplicationController
  before_action :set_recipe_method, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @recipe_method = RecipeMethod.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_method = RecipeMethod.new(recipe_method_params)
    @recipe_method.recipe_id = @recipe.id

    if @recipe_method.save
      redirect_to request.referer
    else
      redirect_to recipe_recipe_method_path, alert: @recipe_method.errors.full_messages.join(', ')
    end
  end

  def update
    if @recipe_method.update(recipe_method_params)
      redirect_to request.referer
    else
      redirect_to request.referer, alert: @recipe_method.errors.full_messages.join(', ')
    end
  end

  def destroy
    @recipe_method.destroy
    redirect_to request.referer
  end

  private

  def set_recipe_method
    @recipe_method = RecipeMethod.find(params[:id])
  end


  def recipe_method_params
    params.require(:recipe_method).permit(:process)
  end
end
