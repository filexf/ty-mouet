class Mouette < ApplicationRecord
  validates :name, :availability, presence: true
  validates :description, length: { minimum: 10 }
  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_one_attached :photo

end
