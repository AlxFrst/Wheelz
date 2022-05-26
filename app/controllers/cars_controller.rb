class CarsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "brand ILIKE :query OR model ILIKE :query"
      @cars = Car.where(sql_query, query: "%#{params[:query]}%")
    else
      @cars = Car.all
    end
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(params_validate)
    @car.user = current_user
    if @car.save!
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(params_validate)
    if @car.save!
      redirect_to dashboard_my_car_path
    else
      render :edit
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to dashboard_my_car_path
  end

  private

  def params_validate
    params.require(:car).permit(:brand, :model, :year, :horsepower,
                                :kilometers, :plate, :energy, :seats, :smoker, :animals, :color, :price, :description, photos: [])
  end
end
