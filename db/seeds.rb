# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Course.create(course_name: "Kommunikationssystem", course_id: "ETS130", credits: 7.5, quarters: "1", level: "G1", specializations_id: nil)
Course.create(course_name: "Kognition", course_id: "TEK210", credits: 4.5, quarters: "2", level: "G1", specializations_id: nil)
Course.create(course_name: "Fotonik", course_id: "FAFA60", credits: 5, quarters: "3", level: "G1", specializations_id: nil)
Course.create(course_name: "Informationsöverföring", course_id: "EIT100", credits: 7.5, quarters: "4", level: "G1", specializations_id: nil)
