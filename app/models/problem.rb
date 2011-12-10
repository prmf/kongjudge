class Problem < ActiveRecord::Base
      belongs_to :user
      has_many :submission
      has_many :language
end
