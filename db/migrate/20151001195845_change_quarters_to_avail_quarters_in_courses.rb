class ChangeQuartersToAvailQuartersInCourses < ActiveRecord::Migration
  def change
  	rename_column :courses, :quarters, :available_quarters
  end
end
