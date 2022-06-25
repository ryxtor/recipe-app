require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.create(name: 'Lucas', id: 1, email: 'a@a', password: '123456', role: 'admin', confirmed_at: Time.now)
      @recipe = Recipe.create(name: 'Test Recipe', preparation_time: '10', cooking_time: '10',
                              description: 'Test Description', user_id: @user.id)
      @food = Food.create(name: 'Test Food', measurement_unit: 'g', price: 1, user_id: @user.id)
      @recipe_food = RecipeFood.create(recipe_id: @recipe.id, food_id: @food.id, quantity: 1)
    end
    it 'is valid with valid attributes' do
      expect(@recipe_food).to be_valid
    end

    it 'is not valid without a recipe_id' do
      @recipe_food.recipe_id = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'is not valid without a food_id' do
      @recipe_food.food_id = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'is not valid without a quantity' do
      @recipe_food.quantity = nil
      expect(@recipe_food).to_not be_valid
    end
  end
end
