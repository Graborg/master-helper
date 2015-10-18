class DeleteSpecailisationReferenceFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :specialisations
  end
end
