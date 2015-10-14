require 'rest-client'
require 'nokogiri'
BASE_URL = "http://kurser.lth.se/lot/?val=program&lang=en&prog="
desc "Fetch courses from all the LTH-programmes at http://kurser.lth.se/ and add them to database"
task fetch_courses: :environment do
	# Not included
	# Maskinteknik - teknisk design,
	programmes = ['B', 'D', 'W', 'E', 'I', 'C', 'K', 'L', 'M', 'BME', 'F', 'M', 'N', 'V']
	raw_html = fetch_course_html('C')
	html = Nokogiri.HTML(raw_html)
	table_counter = 0
	course_table = html.css('.CourseListView')[0]
	# html.css('.CourseListView').each do |course_table|
		table_name = html.css('h3')[table_counter].text
		specialization = table_name.split('-')[1].strip if table_name.start_with?('Specialisation')# If it's a specializtion, retreive the spec name
		mandatory = table_name.include?('Mandatory')

		columns = get_columns(course_table.css('thead'))
		columns |= ['mandatory'] #If the table haven't got the column mandatory, we add it and set it to 'true'

		# Retrieve 'courses' as an array of (course data)arrays [["ETT051", "7.5"...], ["EITF05", "4"...]]
		courses = get_courses(course_table.css('tbody'))
		zipped = []
		courses.each do |course|
			course =  Hash[columns.zip(course)]
			course['mandatory'] = mandatory || course['mandatory'] == 'O'
			course['specialization'] = specialization
			zipped << course
		end
		zipped.each do |course|
			puts course
			puts
		end
	table_counter += 1
	# end
end
def fetch_course_html(course_letter)
	return RestClient.get BASE_URL + course_letter
end
def get_columns(table_header)
	columns = []
	columns << 'quarters'
	table_header.css('th').each do |header|
		column = header.css('strong')[0]
		column ||= header
		# Filter if it begins with a number (representing which year the course is given)
		unless column.text[0] =~ /^\d/
			column = column.text.downcase
			column.gsub!('cycle', 'level') # cycle is known as level in our database
			column.gsub!('mand./ elect.', 'mandatory') # cycle is known as level in our database
			column.gsub!(' ', '_')
			columns << column
		end
	end
	columns
end
def get_courses(table_body)
	courses = []
	count = 0
	table_body.css('tr').each do |course_row|
		course_data = []
		quarters = course_row.css('td.bg_blue').text.gsub(' ', '').scan(/^(\d)/).join
		course_data << quarters
		course_row.css('td').each do |value|
			if value && value.text.strip != "" && !value.to_s.include?('pdf-noprint')
				course_data << value.text.strip
			end
		end
		count += 1
		courses << course_data
	end
	courses
end