class RecipesController < ApplicationController
    load_and_authorize_resource
    def index; 
        @recipes = current_user.recipes.all
    end

    def create
        @recipe = current_user.recipes.new(recipe_params)
        if @recipe.save
          flash[:success] = 'Your recipe has been created!'
          redirect_to recipes_path
        else
          flash[:error] = 'Inventory not created!'
          redirect_to new_recipe_path
        end
    end
   

    def show
       @recipe = current_user.recipes.find(params[:id])
    end

    def destroy
        @recipe = current_user.recipes.find(params[:id])
        @recipe.destroy
        redirect_to '/recipes'
    end

    private
    def recipe_params
      params.require(:recipe).permit(:name, :preparation_time, :coking_time, :description, :public)
    end
end
  