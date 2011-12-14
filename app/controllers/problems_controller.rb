class ProblemsController < ApplicationController
	def index
		@problems = Problem.all
	end
	
	def show
		@problem = Problem.find_by_problem_short_title(params[:problem_short_title])
	end
	
	def create #form POST
		@problem = Problem.new(params[:problem])
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
