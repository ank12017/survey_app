class TestSurveysController < ApplicationController
	def index
		@surveys = Survey.all
	end

	def show
		 @survey = Survey.find(params[:id])
	end

	def check_answer
		redirect_to test_surveys_path
	end
end
