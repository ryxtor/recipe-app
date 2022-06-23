class InventoryFoodsController < ApplicationController
  def create
    @inventory_food = InventoryFood.new(inventory_food_params)
    @inventory_food.save
    redirect_to inventory_path(@inventory_food.inventory)
  end

  def update
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.update(inventory_food_params)
    redirect_to inventory_path(@inventory_food.inventory)
  end

  def edit
    @inventory_food = InventoryFood.find(params[:id])
  end

  def new
    @inventory = Inventory.find(params[:inventory_id])
  end

  def destroy
    @inventory_food = InventoryFood.find(params[:id])
    @inventory_food.destroy
    redirect_to inventory_path(@inventory_food.inventory)
  end

  private

  def inventory_food_params
    params.require(:inventory_food).permit(:food_id, :inventory_id, :quantity)
  end
end
