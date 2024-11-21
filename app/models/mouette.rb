class Mouette < ApplicationRecord


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :owner, class_name: "User"
  has_many :bookings
  has_one_attached :photo

  ACCESSORIES = ["casque", "slip", "chaussures"]
  AVAILABILITY = ["✅ Available ", "❌ Not available "]


  validates :name, :availability, :price, :photo, :description, presence: true
  # validates :name, :uniqueness: true { message: "Name already taken" }


  validates :availability, inclusion: {
      in: AVAILABILITY,
      message: "Must select : #{AVAILABILITY}"
  }

  validates :accessories, inclusion: {
      in: ACCESSORIES,
      message: "Must select : #{ACCESSORIES}"
  }

  validates :price, numericality: { greater_than: 0, message: "must be a number greater than 0" }

  validates :description, length: { minimum: 10 }
  # validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0,less_than_or_equal_to: 5 }
end
