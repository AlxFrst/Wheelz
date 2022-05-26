class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    @kilometers = params[:kilometers] || session[:params]["kilometers"].to_i
    @start_date = params[:start_date] || session[:params]["start_date"]
    @end_date = params[:end_date] || session[:params]["end_date"]
    @comment = params[:comment] || session[:params]["comment"]
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    if @booking.save
      redirect_to dashboard_booking_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :kilometers, :user_id, :comment)
  end
end
