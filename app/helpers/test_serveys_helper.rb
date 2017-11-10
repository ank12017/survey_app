module TestServeysHelper

	def check_if_true(answer)
		
	  if(answer == 'true' or answer == true or answer == 1 or answer == '1')
	    return true
	  else
	    return false
	  end
  end

  def check_survey(survey)
  	check_survey = CheckAnswer.where(user_id: current_user.id, survey_id: survey.id).first
    return check_survey
  end
end
