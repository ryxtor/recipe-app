class InventoriesController < ApplicationController
  load_and_authorize_resource
  def index
    @inventories = current_user.inventories.all
  end

  def create
    @inventory = current_user.inventories.new(inventory_params)
    if @inventory.save
      flash[:success] = 'Inventory created!'
      redirect_to inventories_path
    else
      flash[:error] = 'Inventory not created!'
      redirect_to new_inventory_path
    end
  end

  def show
    @inventory = current_user.inventories.find(params[:id])
  end

  def destroy
    @inventory = current_user.inventories.find(params[:id])
    @inventory.destroy
    redirect_to inventories_path
  end

  private

  def inventory_params
    params.require(:inventory).permit(:name, :description)
  end
end
