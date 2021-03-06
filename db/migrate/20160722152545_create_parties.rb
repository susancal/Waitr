class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.integer :restaurant_id
      t.string :name, null: false
      t.string :key
      t.integer :size, null: false
      t.string :cell, null: false
      t.boolean :in_queue, default: true
      t.integer :points_earned, default: 0


      t.timestamps
    end
  end
end
