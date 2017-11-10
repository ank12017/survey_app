module TestServeysHelper

		def check_survey(survey)
  		check_survey = CheckAnswer.where(user_id: current_user.id, survey_id: survey.id).first
    	return check_survey
  	end
end
