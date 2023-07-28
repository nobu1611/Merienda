class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @ingredient = Ingredient.new
    @ingredients = Ingredient.all
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    # @ingredient.user_id = 1
    @ingredient.user = current_user

    # respond_to do |format|
      if @ingredient.save
        redirect_to ingredients_path
        # format.html { redirect_to @ingredient, notice: 'Ingredient was successfully created.' }
        # format.js   # this will render 'create.js.erb'
        # format.json { render :show, status: :created, location: @ingredient }
      else
        # Rails.logger.error @ingredient.errors.full_messages.join(', ')
        redirect_to ingredients_path, alert: @ingredient.errors.full_messages.join(', ')
        # format.html { render :new }
        # format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    # end
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      # render :show, status: :ok, location: @ingredient
    else
      # render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
    # respond_to do |format|
    #   format.html { redirect_to ingredients_url, notice: 'Ingredient was successfully destroyed.' }
    #   format.js   # this will render 'destroy.js.erb'
    #   format.json { head :no_content }
    # end
  end

  private

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :cost_per_gram)
    end
end
