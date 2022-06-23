class ShoppingListController < ApplicationController
  def index
    @inventory = Inventory.first.id
    @foods = InventoryFood.where(inventory_id: @inventory).includes([:food])
  end
end
