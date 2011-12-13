class ProblemsController < ApplicationController
	def index
		@problems = Problem.all
	end
	
	def show
		@problem = Problem.find_by_name(params[:problem_short_title])
	end
	
	def create #form POST
		@problem = Problem.new(params[:problem])
		if @problem.save
			redirect_to (@problem)
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

	def to_param
		# http://api.rubyonrails.org/classes/ActiveRecord/Base.html#method-i-to_param
		problem_short_title
	end
end
