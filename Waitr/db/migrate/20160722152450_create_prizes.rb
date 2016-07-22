class CreatePrizes < ActiveRecord::Migration[5.0]
  def change
    create_table :prizes do |t|

      t.timestamps
    end
  end
end
