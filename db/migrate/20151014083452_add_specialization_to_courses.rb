class AddSpecializationToCourses < ActiveRecord::Migration
  def change
  	rename_column :courses, :specializations_id, :specialisations
  	change_column :courses, :specialisations, :reference
  end
end
