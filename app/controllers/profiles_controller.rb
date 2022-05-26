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
end
