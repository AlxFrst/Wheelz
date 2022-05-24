class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :cars, through: :bookings, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true
  validates :birthday, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :license, presence: true
end
