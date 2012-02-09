class SubmitSubmission
	@queue = :submission_q

	def judge_submission
		#We must move code here

		# 1) Send code to ideone
		# 2) Compare result with diff
		# 3) Update user solves and badges
	end

	def self.perform(code,curr_submission_id)
		# username: UFPTTest
		# password: finchley
		# api password: finchley
		client = Savon::Client.new("http://ideone.com/api/1/service.wsdl")
		# things that need to be changed:
		# not hardcoding the username, password, ideone api url
		# making sure that the submission is successful -- if not, error handling
		# making sure the result fetching is successful -- if not, error handling
		# making sure the result is where is it supposed to be -- easy to see an exception happening here

		submissionResponse = client.request :create_submission, body: { user: "UFPTTest", pass: "finchley", sourceCode: code, language: 10, input: " ", run: true, private: true }
		link = submissionResponse.to_array(:create_submission_response, :return, :item, 1, :value)
		if link
			submissionResult = client.request :get_submission_status, body: { user: "UFPTTest", pass: "finchley", link: link.first }
			result = submissionResult.to_array(:get_submission_status_response, :return, :item, 2, :value)
			if result
				#This could be improved, we are searching by id once again, instead of just passing the object here.
				submissionDetails = client.request :get_submission_details, body: { user: "UFPTTest", pass: "finchley", link: link.first, withSource: false, withInput: false, withOutput: true, withStderr: false, withCmpinfo: false }
				puts submissionDetails.to_array(:get_submission_details_response, :return, :item, 6, :value)
				status = submissionDetails.to_array(:get_submission_details_response, :return, :item, 6, :value)[0]
				until Integer(status) == 0
					# there should probably be a better wait time and some error handling here. sometimes IDEone screws up and we could be doing this for 10 minutes or so
					sleep(10)
					submissionDetails = client.request :get_submission_details, body: { user: "UFPTTest", pass: "finchley", link: link.first, withSource: false, withInput: false, withOutput: true, withStderr: false, withCmpinfo: false }
					status = submissionDetails.to_array(:get_submission_details_response, :return, :item, 6, :value)[0]
				end
				output = submissionDetails.to_array(:get_submission_details_response, :return, :item, 11, :value)[0]
				@curr_submission = Submission.find_by_id(curr_submission_id)
				@curr_submission[:result] = result.first
				@curr_submission.save
			end
		end
	end
end
