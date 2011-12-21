class Submission < ActiveRecord::Base
      belongs_to :problem
      belongs_to :user
      has_one :language
	  attr_accessor :problem_id
	  attr_accessor :user_id
	  attr_accessor :ideone_user, :ideone_pass
	  
	  def judge_submission
		# username: UFPTTest
		# password: finchley
		# api password: finchley
		client = Savon::Client.new("http://ideone.com/api/1/service.wsdl")
		submissionResponse = client.request :create_submission, body: { user: "UFPTTest", pass: "finchley", sourceCode: :code, language: 1, input: " ", run: true, private: true }
		submissionResult = client.request :get_submission_status, body: { user: "UFPTTest", pass: "finchley", link: submissionResponse.to_hash[:create_submission_response][:return][:item][1][:value] }
		self.update_attributes(:result => submissionResult.to_hash[:get_submission_status_response][:return][:item][2][:value])
	  end
end
