class Submission < ActiveRecord::Base
      belongs_to :problem
      belongs_to :user
      has_one :language
end
