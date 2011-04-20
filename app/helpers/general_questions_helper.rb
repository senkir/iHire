module GeneralQuestionsHelper
  def build_all_answers person
    @questions = GeneralQuestion.all
    @questions.each do | question |
    person.general_answers.build(:general_question_id => question.id)
    person.save
    end
  end
  
end
