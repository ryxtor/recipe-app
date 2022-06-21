class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    @food.destroy

    redirect_to foods_path, notice: 'Food successfully deleted'
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)

    if @food.save
      redirect_to foods_path, notice: 'Food type was successfully added'
    else
      render :new, alert: 'Food could not be added'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
