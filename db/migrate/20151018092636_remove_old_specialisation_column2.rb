class RemoveOldSpecialisationColumn2 < ActiveRecord::Migration
  def change
    remove_column :courses, :specializations_id
  end
end
