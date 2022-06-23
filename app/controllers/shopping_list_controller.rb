class ShoppingListController < ApplicationController
  def index
    @inventory = Inventory.first
    @foods = InventoryFood.where(inventory_id: @inventory.id).includes([:food])
  end
end
