class Car < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :bookings
  geocoded_by :address
  after_validation :geocode

  validates :brand, presence: true
  validates :model, presence: true
  validates :horsepower, presence: true, numericality: { only_integer: true }, length: { maximum: 4 }
  validates :year, presence: true
  validates :kilometers, presence: true, numericality: { only_integer: true }, length: { maximum: 6 }
  validates :plate, presence: true, length: { maximum: 10 }, uniqueness: true
  validates :energy, presence: true
  validates :seats, presence: true, numericality: { only_integer: true }, length: { maximum: 2 }
  validates :user_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }, length: { maximum: 4 }

  private

  def address
    "4 avenue des saules, Lille"
  end

  def article_params
    params.require(:user).permit(:avatar)
  end
end
