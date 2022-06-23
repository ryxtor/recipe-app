class PublicRecipesController < ApplicationController
  def index
    @pub_recipes = Recipe.includes(:user).where(public: true)
  end
end
