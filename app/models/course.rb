class Course < ActiveRecord::Base
	has_many :specialisations
	has_many :selected_courses
end
