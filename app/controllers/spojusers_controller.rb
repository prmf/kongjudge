class SpojusersController < ApplicationController
  
   def show
     @spojusers = Spojuser.all
   end
   def new
    # @spojuser = Spojuser.new
   end
   def create
	@spojuser = nil;
	search = Spojuser.where(:username => params[:username])
	if(search == [])
		@spojuser = Spojuser.new(:username => params[:username])
     	@spojuser.lastUpdate = Time.now
    	 @spojuser.save
	else
		#flash error here
	end
	render 'show'
   end
   def edit
   end
   def update
   end
   def delete
     
   end

	def destroyall
		Spojuser.destroy_all
	end
end
