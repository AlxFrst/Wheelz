class CarsController < ApplicationController
  def index
    if params[:query].present?
      @cars = Car.where("brand ILIKE ?", "%#{params[:query]}%") && Car.where("model ILIKE ?", "%#{params[:query]}%")
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
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
  end

  private

  def params_validate
    params.require(:car).permit(:brand, :model, :year, :horsepower,
                                :kilometers, :plate, :energy, :seats, :smoker, :animals, :color, :price, :description, photos: [])
  end
end
