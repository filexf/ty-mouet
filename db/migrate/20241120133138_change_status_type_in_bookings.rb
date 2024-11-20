class ChangeStatusTypeInBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :status, :string
    add_column :bookings, :status, :integer, default: 0
  end
end
