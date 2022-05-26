class Booking < ApplicationRecord
  belongs_to :car
  belongs_to :user

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :kilometers, presence: true
end
