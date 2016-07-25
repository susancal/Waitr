class CreateWaitingrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :waitingrooms do |t|
      t.integer :restaurant_id
      t.integer :party_id
      t.integer :party_key

      t.timestamps
    end
  end
end
