class CreateTides < ActiveRecord::Migration[5.0]
  def change
    create_table :tides do |t|
      t.date :date
      t.time :time
      t.string :day
      t.integer :predictions_in_ft
      t.integer :predictions_in_cm
      t.string :highlow

      t.timestamps
    end
  end
end
