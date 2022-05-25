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
    raise
  end
end
