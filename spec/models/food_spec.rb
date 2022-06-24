require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.create(name: 'Lucas', id: 1, email: 'a@a', password: '123456', role: 'admin', confirmed_at: Time.now)
      @food = Food.create(name: 'Test Food', measurement_unit: 'g', price: 1, user_id: @user.id)
    end

    it 'is valid with valid attributes' do
      expect(@food).to be_valid
    end

    it 'is not valid without a name' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'is not valid without a measurement_unit' do
      @food.measurement_unit = nil
      expect(@food).to_not be_valid
    end

    it 'is not valid without a price' do
      @food.price = nil
      expect(@food).to_not be_valid
    end

    it 'is not valid without a user_id' do
      @food.user_id = nil
      expect(@food).to_not be_valid
    end
  end
end
