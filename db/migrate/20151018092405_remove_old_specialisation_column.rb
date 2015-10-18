class RemoveOldSpecialisationColumn < ActiveRecord::Migration
  def change
    remove_column :courses, :specializations
 end
end
