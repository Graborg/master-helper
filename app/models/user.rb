class User < ActiveRecord::Base
	has_many :selected_courses
end
