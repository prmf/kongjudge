class SubmissionsController < ApplicationController
	def show
		if !!(params[:id] =~ /^[0-9]+$/) # this is checking to see if the id is an integer.
			# if the ID is an integer, then we will display the submission that has an ID number of that integer
			@submissions = Submission.find(params[:id])
		else
			# else, we display the submissions of the user with the id given
			user = User.where(:username => params[:id])[0]
			puts user.username
			puts 'FINCHLEY CENTRAL!!!!!'
			@submissions = user.submissions
		end
	end
	
	def create
		problem_short_title = params[:submission][:problem_short_title]
		@curr_problem = Problem.find_by_problem_short_title(problem_short_title)
		@submission = @curr_problem.submissions.build(:code => params[:submission][:code], :user => current_user, :problem => @curr_problem)
		@submission = current_user.submissions.build(:code => params[:submission][:code], :user => current_user, :problem => @curr_problem)
		if @submission.save
			@submission.judge_submission
			redirect_to (root_path)
		else
		 	render :new
		end
	end
end
