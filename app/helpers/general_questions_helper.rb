module GeneralQuestionsHelper
  def build_all_answers person
    @questions = GeneralQuestion.all
    @questions.each do | question |
    person.general_answers.build(question.id)
    end
  end
  
end
