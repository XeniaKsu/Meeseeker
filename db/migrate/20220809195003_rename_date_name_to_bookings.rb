class RenameDateNameToBookings < ActiveRecord::Migration[7.0]
  def change
    rename_column :bookings, :data_available_to, :date_available_to
  end
end
