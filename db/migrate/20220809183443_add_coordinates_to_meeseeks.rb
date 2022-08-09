class AddCoordinatesToMeeseeks < ActiveRecord::Migration[7.0]
  def change
    add_column :meeseeks, :latitude, :float
    add_column :meeseeks, :longitude, :float
  end
end
