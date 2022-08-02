class AddImageToMeeseeks < ActiveRecord::Migration[7.0]
  def change
    add_column :meeseeks, :image, :string
  end
end
