class User < ActiveRecord::Base
      has_and_belongs_to_many :problems
      has_many :submissions
      has_and_belongs_to_many :badges

      validates_uniqueness_of :username

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  
  	def to_param
		# http://api.rubyonrails.org/classes/ActiveRecord/Base.html#method-i-to_param
		username
	end
end
