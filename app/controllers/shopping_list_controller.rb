class ShoppingListController < ApplicationController
  def index
    @inventory = Inventory.first
    @foods = InventoryFood.where(inventory_id: @inventory.id).includes([:food])

    @prices = 0
    @foods.each do |food|
      @prices += (food.quantity * food.food.price)
    end
  end
end
