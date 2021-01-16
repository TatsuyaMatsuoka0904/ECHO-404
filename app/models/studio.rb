class Studio < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_many :rooms
  has_many :created_events, class_name: 'Event', foreign_key: 'studio_id'
end
