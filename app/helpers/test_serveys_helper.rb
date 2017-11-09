module TestServeysHelper

	def check_if_true(answer)
		
  if(answer == 'true' or answer == true or answer == 1 or answer == '1')
    return true
  else
    return false
  end
end
end
