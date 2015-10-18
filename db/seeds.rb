# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Course.create(course_name: "Kommunikationssystem", course_code: "ETS130", credits: 7.5, available_quarters: "1", level: "G1")
Course.create(course_name: "Kognition", course_code: "TEK210", credits: 4.5, available_quarters: "2", level: "G1")
Course.create(course_name: "Fotonik", course_code: "FAFA60", credits: 5, available_quarters: "3", level: "G1")
Course.create(course_name: "Informationsöverföring", course_code: "EIT100", credits: 7.5, available_quarters: "4", level: "G1")
