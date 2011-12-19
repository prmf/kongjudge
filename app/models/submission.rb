class Submission < ActiveRecord::Base
      belongs_to :problem
      belongs_to :user
      has_one :language
	  attr_accessor :problem_id # WTF is problem_id?
	  attr_accessor :user_id # WTF is user_id?
end
