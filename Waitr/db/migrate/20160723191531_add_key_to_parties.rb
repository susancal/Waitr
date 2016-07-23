class AddKeyToParties < ActiveRecord::Migration[5.0]
  def change
    add_column :parties, :key, :string
  end
end
