class AddCourseReferenceToSpecialisations < ActiveRecord::Migration
  def change
  	add_reference :specialisations, :courses, index: true
	add_foreign_key :specialisations, :courses
  end
end
