require File.dirname(__FILE__) + '/../../script/submitsubmission.rb'

class Submission < ActiveRecord::Base
	belongs_to :problem
	belongs_to :user
	has_one :language
	attr_accessor :problem_id
	attr_accessor :user_id
	attr_accessor :ideone_user, :ideone_pass

	def async_send_submission(code)
		Resque.enqueue(SubmitSubmission,code,self.id)
	end
end
