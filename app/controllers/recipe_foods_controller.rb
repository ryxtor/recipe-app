class RecipeFoodsController < ApplicationController
load_and_authorize_resource
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.save
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.update(recipe_food_params)
    redirect_to recipe_path(@recipe_food.recipe)
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :recipe_id, :quantity)
  end
end