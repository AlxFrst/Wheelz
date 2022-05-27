class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    if session[:params] && session[:params]["calendar"]
      @start_date = session[:params]["calendar"].split[0]
      @end_date = session[:params]["calendar"].split[2]
    else
      @start_date = params[:calendar].split[0]
      @end_date = params[:calendar].split[2]
    end
    @kilometers = params[:kilometers] || session[:params]["kilometers"].to_i
    @comment = params[:comment] || session[:params]["comment"]
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    if @booking.save
      redirect_to payment_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :kilometers, :user_id, :comment)
  end
end
