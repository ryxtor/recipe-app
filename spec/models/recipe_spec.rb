require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.create(name: 'Lucas', id: 1, email: 'a@a', password: '123456', role: 'admin', confirmed_at: Time.now)
      @recipe = Recipe.create(name: 'Test Recipe', preparation_time: '10', cooking_time: '10',
                              description: 'Test Description', user_id: @user.id)
    end
    it 'is valid with valid attributes' do
      expect(@recipe).to be_valid
    end

    it 'is not valid without a name' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a preparation_time' do
      @recipe.preparation_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a coking_time' do
      @recipe.cooking_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a description' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end

    it 'is not valid without a user_id' do
      @recipe.user_id = nil
      expect(@recipe).to_not be_valid
    end
  end
end
