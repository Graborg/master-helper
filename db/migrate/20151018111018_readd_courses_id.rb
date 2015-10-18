class ReaddCoursesId < ActiveRecord::Migration
  def change
    	remove_column :specialisations, :courses_id
  	add_reference :specialisations, :course, index: true
	add_foreign_key :specialisations, :course
  end
end
