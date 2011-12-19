class SubmissionsController < ApplicationController
	def create
		problem_short_title = params[:submission][:problem_short_title]
		@curr_problem = Problem.find_by_problem_short_title(problem_short_title)
		@submission = @curr_problem.submissions.build(:code => params[:submission][:code])
		if @submission.save
			redirect_to (root_path)
		else
		 	render :new
		end
	end
end
