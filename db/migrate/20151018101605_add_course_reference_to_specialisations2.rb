class AddCourseReferenceToSpecialisations2 < ActiveRecord::Migration
  def change
    remove_column :courses, :specialisations_id
end
end
