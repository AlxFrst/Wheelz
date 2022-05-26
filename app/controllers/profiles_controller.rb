class ProfilesController < ApplicationController
  def dashboard
  end

  def my_car
    @my_cars = Car.where(user_id: current_user.id)
  end

  def booking
    @my_bookings = Booking.where(user_id: current_user.id)
    my_cars = Car.where(user_id: current_user.id)
    @my_cars_bookings = Booking.where(car_id: my_cars.ids)
  end

  def destroy_booking
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_booking_path
  end

  def accept_request
    @booking = Booking.find(params[:id])
    @booking.update(status: "accepted")
    redirect_to dashboard_booking_path
  end

  def decline_request
    @booking = Booking.find(params[:id])
    @booking.update(status: "declined")
    redirect_to dashboard_booking_path
  end
end
