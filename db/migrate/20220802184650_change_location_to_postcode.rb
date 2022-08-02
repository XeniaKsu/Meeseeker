class ChangeLocationToPostcode < ActiveRecord::Migration[7.0]
  def change
    rename_column :meeseeks, :location, :postcode
  end
end
