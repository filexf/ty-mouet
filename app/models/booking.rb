class Booking < ApplicationRecord
  belongs_to :mouette
  belongs_to :renter, class_name: 'User'
end
