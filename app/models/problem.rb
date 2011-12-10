class Problem < ActiveRecord::Base
      belongs_to :user
      has_many :submissions
      has_many :languages
end
