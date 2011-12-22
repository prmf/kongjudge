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
		# things that need to be changed:
		# not hardcoding the username, password, ideone api url
		# making sure that the submission is successful -- if not, error handling
		# making sure the result fetching is successful -- if not, error handling
		# making sure the result is where is it supposed to be -- easy to see an exception happening here
		submissionResponse = client.request :create_submission, body: { user: "UFPTTest", pass: "finchley", sourceCode: :code, language: 1, input: " ", run: true, private: true }
		link = submissionResponse.to_array(:create_submission_response, :return, :item, 1, :value)
		if link
			submissionResult = client.request :get_submission_status, body: { user: "UFPTTest", pass: "finchley", link: link.first }
			result = submissionResult.to_array(:get_submission_status_response, :return, :item, 2, :value)
			if result
				self.update_attributes(:result => result.first)
			end
		end
	end
end
