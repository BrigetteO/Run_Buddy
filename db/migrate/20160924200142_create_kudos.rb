class CreateKudos < ActiveRecord::Migration[5.0]
  def change
    create_table :kudos do |t|
      t.integer :user_id
      t.integer :run_id

      t.timestamps
    end
  end
end
