class AddSpecialisationStringToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :specialisation, :string
  end
end
