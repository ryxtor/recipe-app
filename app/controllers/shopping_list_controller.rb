class ShoppingListController < ApplicationController
  def index
    inventory = Inventory.first
    @food = InventoryFood.where(inventory_id: inventory.id)
  end
end
