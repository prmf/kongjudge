class ProblemsController < ApplicationController
	def index
		@problems = Problem.all
	end
	
	def show
		@problem = Problem.find(params[:id])
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
end
