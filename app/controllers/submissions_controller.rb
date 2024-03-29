class SubmissionsController < ApplicationController
	def show
		if !!(params[:id] =~ /^[0-9]+$/) # this is checking to see if the id is an integer.
			# if the ID is an integer, then we will display the submission that has an ID number of that integer
			@submissions = Submission.find(params[:id])
		else
			# else, we display the submissions of the user with the id given
			user = User.where(:username => params[:id])[0]
			@submissions = user.submissions
		end
	end
	
	def create
		problem_short_title = params[:submission][:problem_short_title]
		@curr_problem = Problem.find_by_problem_short_title(problem_short_title)

		if current_user
			@submission = @curr_problem.submissions.build(:code => params[:submission][:code], :user => current_user, :problem => @curr_problem, :result => -1)
			@submission = current_user.submissions.build(:code => params[:submission][:code], :user => current_user, :problem => @curr_problem, :result => -1)
			if @submission.save
				@submission.async_send_submission(params[:submission][:code])
				redirect_to (user_path(current_user))
			else
				render :new
			end
		else
			flash[:message] = "You must be logged in to submit a problem!"
			redirect_to(@curr_problem, :notice => "You must be logged in to submit a problem!")
		end
	end
end
