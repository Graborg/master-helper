class AddSpecialisationReferenceColumnToCourses < ActiveRecord::Migration
  def change
	add_reference :courses, :specialisations, index: true
	add_foreign_key :courses, :specialisations
  end
end
