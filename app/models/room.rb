class Room < ApplicationRecord
  belongs_to :user
  belongs_to :studio
  has_many :messages
end
