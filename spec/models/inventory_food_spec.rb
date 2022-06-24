require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.create(name: 'Lucas', id: 1, email: 'a@a', password: '123456', role: 'admin', confirmed_at: Time.now)
      @inventory = Inventory.create(name: 'Test Inventory', description: 'Test Description', user_id: @user.id)
      @food = Food.create(name: 'Test Food', measurement_unit: 'Test Measurement Unit', price: 1.0, user_id: @user.id)
      @ifood = InventoryFood.create(inventory_id: @inventory.id, food_id: @food.id, quantity: 1)
    end

    it 'is valid with valid attributes' do
      expect(@ifood).to be_valid
    end

    it 'is not valid without an inventory_id' do
      @ifood.inventory_id = nil
      expect(@ifood).to_not be_valid
    end

    it 'is not valid without a food_id' do
      @ifood.food_id = nil
      expect(@ifood).to_not be_valid
    end

    it 'is not valid without a quantity' do
      @ifood.quantity = nil
      expect(@ifood).to_not be_valid
    end
  end
end
