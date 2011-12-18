class SubmissionsController < ApplicationController
	def create
		@curr_problem = Problem.find_by_problem_short_title(params[:problem_short_title])

		puts @curr_problem
		@submission = @curr_problem.submissions.build(params[:submission])
		if @submission.save
			redirect_to (root_path)
		else
		 	render :new
		end
	end
end
