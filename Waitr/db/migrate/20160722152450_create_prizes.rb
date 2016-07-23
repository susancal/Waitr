class CreatePrizes < ActiveRecord::Migration[5.0]
  def change
    create_table :prizes do |t|
      t.integer :restaurant_id
      t.integer :points_needed, null: false
      t.string :prize_name, null: false
      t.timestamps
    end
  end
end
