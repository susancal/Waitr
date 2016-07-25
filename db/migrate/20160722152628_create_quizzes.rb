class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.integer :seconds_per_question, default: 15
      t.timestamps
    end
  end
end
