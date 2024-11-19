class Booking < ApplicationRecord
  belongs_to :mouette
  belongs_to :renter, class_name: 'User'
  
  # start date not before today
  validates :start_date, comparison: { greater_than_or_equal_to: Date.today }
  # end date after or equal to start date
  validates :end_date, comparison: { greater_than_or_equal_to: :start_date }
  # status in a list of statuses["waiting","accepted","rejected"]
  validates :status, inclusion: {
        in: ["waiting","accepted","rejected"],
        message: 'Must select : ["waiting","accepted","rejected"]'
      }
end
