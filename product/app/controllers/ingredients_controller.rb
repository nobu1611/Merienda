class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @ingredient = Ingredient.new
    @user = current_user
    @ingredients = @user.ingredients
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.user = current_user

    if @ingredient.save
      redirect_to ingredients_path, notice: '材料が追加されました'
    else
      redirect_to ingredients_path, alert: '材料が追加されていません'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :cost_per_gram)
  end
end
