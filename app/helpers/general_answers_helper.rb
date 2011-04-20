module GeneralAnswersHelper
  def build_all_answers person
    @questions = GeneralQuestion.all
    @answers = person.general_answers.all
    if @answers.empty?
      @questions.each do | question |
        person.general_answers.build(:general_question_id => question.id)
        person.save
      end
    end
  end
  
end
