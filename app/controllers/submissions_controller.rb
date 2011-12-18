class SubmissionsController < ApplicationController
	def create
		@curr_problem = @problem
		@submission = @curr_problem.submissions.build(params[:submission])
		if @submission.save
			redirect_to (@curr_problem)
		else
		 	render :new
		end
	end
end
