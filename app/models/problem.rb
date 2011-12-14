class Problem < ActiveRecord::Base
	belongs_to :user
	has_many :submissions
	has_many :languages

	#problem_title validation
	validates_presence_of :problem_title, :message => "must exist"
	validates_length_of :problem_title, :maximum=>50, :message => "must be within 50 characters"

	#problem_short_title validation
	validates_presence_of :problem_short_title
	validates_uniqueness_of :problem_short_title, :message => "is already in use"      
	validates_format_of :problem_short_title, :with => /^[A-Z0-9]+$/, :message => "must be uppercase alphanumeric with no whitespace"
	validates_length_of :problem_short_title, :within => 3..8, :message => "must be within 3 and 8 alphanumeric characters long"    

	#problem_statement validation
	validates_presence_of :problem_statement, :message => "must not be blank"
	validates_length_of :problem_statement, :maximum => 50000, :message => "too large"

	#input validation
	validates_length_of :input, :maximum => 1000000, :message => "too large"

	#solution validation
	validates_presence_of :solution, :message => "must exist"
	validates_length_of :solution, :maximum => 1000000, :message => "too large"

	#time_limit validation
	validates_presence_of :time_limit
	validates_numericality_of :time_limit, :only_integer => true
	validates_inclusion_of :time_limit, :in => 1..300000

	

	def to_param
		# http://api.rubyonrails.org/classes/ActiveRecord/Base.html#method-i-to_param
		problem_short_title
	end
end
