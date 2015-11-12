class AddAvailableQuartersToCourses < ActiveRecord::Migration
  def change
  	add_column :courses, :available_quarters, :string
  end
end
