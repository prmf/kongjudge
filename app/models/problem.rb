class Problem < ActiveRecord::Base
      belongs_to :user
      has_many :submissions
      has_many :languages
      
      validates_format_of :problem_short_title, :with => /^[A-Z]+$/      

  def to_param
    # http://api.rubyonrails.org/classes/ActiveRecord/Base.html#method-i-to_param
    problem_short_title
  end
end
