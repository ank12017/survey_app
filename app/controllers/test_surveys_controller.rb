class TestSurveysController < ApplicationController
	def index
		@surveys = Survey.all
	end

	def show
		 @survey = Survey.find(params[:id])
	end
  
	def check_answer
     # all survey user & question answers in this check_answer 
	  check_params.each do |key, value|
	  	check_answer = CheckAnswer.new
	  	check_answer.survey_id = params[:survey_id]
	    check_answer.question_id = key
	    check_answer.answer_id = value
	    check_answer.user_id = current_user.id
        check_answer.save!
	  end
	  redirect_to test_surveys_path
	end

	def user_result
		# admin correct answers
		right_answer = {}
		@survey = Survey.find(params[:id])
		@survey.questions.each do |q|
			q.answers.each do |a|
				if a.correct_answer
					right_answer[q.id] = a.id
				end
			end
		end
		# user's ticked answers
		user_answer = {}
		check_user_answer =  CheckAnswer.where(user_id: current_user.id, survey_id: @survey.id)
	  check_user_answer.each do |ans|
	  	user_answer[ans.question_id] = ans.answer_id
	  end
    # compare the correct answers of admin n ticked anwsers of user for result
    @results = 0
	  right_answer.each do |key, value|
	  	user_answer.each do |q_key, a_value|
        if key == q_key
        	if value == a_value
            @results = @results + 1
        	end
        end
	    end
	  end
	end


	private 

	def check_params
      params.require(:check_answer).permit!
    end

end
