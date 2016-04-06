class Course < ActiveRecord::Base
	# has_many :specialisations
	has_many :selected_courses
	before_save :set_avail_quarters

	def set_avail_quarters
		self.available_quarters = self.quarters[0]
	end
end
