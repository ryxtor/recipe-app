require 'rails_helper'

RSpec.describe Inventory, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.create(name: 'Lucas', id: 1, email: 'a@a', password: '123456', role: 'admin', confirmed_at: Time.now)
      @inventory = Inventory.create(name: 'Test Inventory', description: 'Test Description', user_id: @user.id)
    end

    it 'is valid with valid attributes' do
      expect(@inventory).to be_valid
    end

    it 'is not valid without a name' do
      @inventory.name = nil
      expect(@inventory).to_not be_valid
    end

    it 'is not valid without a description' do
      @inventory.description = nil
      expect(@inventory).to_not be_valid
    end

    it 'is not valid without a user_id' do
      @inventory.user_id = nil
      expect(@inventory).to_not be_valid
    end
  end
end
