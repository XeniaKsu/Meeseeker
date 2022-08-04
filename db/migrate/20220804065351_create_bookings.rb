class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.text :task
      t.date :date_available_from
      t.date :data_available_to
      t.references :user, null: false, foreign_key: true
      t.references :meeseek, null: false, foreign_key: true

      t.timestamps
    end
  end
end
