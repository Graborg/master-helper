class ChangeCourseIdToCourseCode < ActiveRecord::Migration
  def change
  	rename_column :courses, :course_id, :course_code

  end
end
