class CreateCheckAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :check_answers do |t|
      t.integer :question_id
      t.integer :answer_id
      t.integer :survey_id
      t.integer :user_id 
      t.timestamps
    end
  end
end
