class ProblemsController < ApplicationController
      #http://railscasts.com/episodes/210-customizing-devise
      before_filter :authenticate_user!, :except => [:show,:index]

	def index
		@problems = Problem.all
	end
	
	def show
		@submission = Submission.new
		@problem = Problem.find_by_problem_short_title(params[:problem_short_title])
	end
	
	def create #form POST
		@problem = current_user.problems.build(params[:problem])
		if @problem.save
			redirect_to (@problem)
		else
		  render :new
		end
	end
	
	def new #form GET
		@problem = Problem.new
	end
	
	def edit 
	
	end
	
	def update
	
	end
	
	def destroy
	
	end
end
