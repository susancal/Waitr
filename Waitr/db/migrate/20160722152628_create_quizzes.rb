class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.string :title, null: false
      t.integer :seconds_per_question, default: 10
    
      t.timestamps
    end
  end
end
