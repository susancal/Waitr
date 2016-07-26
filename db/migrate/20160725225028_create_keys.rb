class CreateKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :keys do |t|
      t.string :key
      t.integer :quiz_id
    end
  end
end
