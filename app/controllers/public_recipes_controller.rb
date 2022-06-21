class RecipesController < ApplicationController
    def index; 
        @pub_recipes = Recipe.all
    end
end
  