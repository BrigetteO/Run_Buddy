class CreateRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :runs do |t|
      t.integer :user_id
      t.string :title
      t.string :location
      t.date :date
      t.time :time
      t.decimal :miles

      t.timestamps
    end
  end
end
