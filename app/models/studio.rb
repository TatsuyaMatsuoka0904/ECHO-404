class Studio < ApplicationRecord
  geocoded_by :address
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image_id
  has_many :rooms
  has_many :created_events, class_name: 'Event', foreign_key: 'studio_id'
  after_validation :geocode, if: :address_changed?
  validates :name, presence: true
  validates :address, presence: true
end
