class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :question_text, null: false
      t.string :answer,null: false
      t.integer :quiz_id
      t.integer :value, null: false

      t.timestamps
    end
  end
end
