class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @car = Car.find(params[:car_id])
    @kilometers = params[:kilometers].to_i
    @start_date = params[:start_date]
    @end_date = params[:end_date]
    @comment = params[:comment]
  end
end
