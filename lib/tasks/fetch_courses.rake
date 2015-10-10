require 'rest-client'
require 'nokogiri'
desc "Fetch course from http://kurser.lth.se/"
task fetch_courses: :environment do
	BASE_URL = "http://kurser.lth.se/lot/?val=program&prog="
	result = RestClient.get BASE_URL + "c"
	html = Nokogiri.HTML(result)
	html.css('.CourseListView tbody tr').each do |course_row|
		count = 0
		# Fetches all the course codes
		puts course_row.css('td')[0].css('a').text
		# if course_row.css('td').length > 0
		# 	course_row.css('td').each do |value|

		# 		puts value[0].text if count == 0
		# 	end
		# end
	end
end