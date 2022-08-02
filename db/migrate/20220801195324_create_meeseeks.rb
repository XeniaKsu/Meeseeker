class CreateMeeseeks < ActiveRecord::Migration[7.0]
  def change
    create_table :meeseeks do |t|
      t.string :location

      t.timestamps
    end
  end
end
