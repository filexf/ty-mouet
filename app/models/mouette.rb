class Mouette < ApplicationRecord
  validates :name, :availability, presence: true
  validates :description, length: { minimum: 10 }
end
