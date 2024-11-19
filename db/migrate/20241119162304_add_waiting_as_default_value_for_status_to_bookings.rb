class AddWaitingAsDefaultValueForStatusToBookings < ActiveRecord::Migration[7.1]
  def change
    change_column_default(:bookings, :status, 'waiting')
  end
end
