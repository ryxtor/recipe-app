class PublicRecipesController < ApplicationController
  def index
    @pub_recipes = Recipe.includes(:user, [:foods], :recipe_foods).where(public: true)
  end
end
