class ShoppingListController < ApplicationController
  def index
    @inventory = Inventory.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
    @foods = []
    @prices = 0

    food_helper
  end

  private

  def food_helper
    i_foods = InventoryFood.where(inventory_id: @inventory.id).includes([:food])
    r_foods = RecipeFood.where(recipe_id: @recipe.id).includes([:food])

    p r_foods
    p i_foods

    r_foods.each do |r_food|
      i_foods.each do |i_food|
        if r_food.food.id == i_food.food.id
          if r_food.quantity > i_food.quantity
            quantity = r_food.quantity - i_food.quantity
            newfood = r_food
            newfood.quantity = quantity
            @foods.push(newfood)
            @prices += (quantity * i_food.food.price)
          elsif r_food.quantity <= i_food.quantity
            break
          else
            @foods.push(r_food)
            @prices += (r_food.quantity * i_food.food.price)
          end
        end
      end
    end
  end
end
