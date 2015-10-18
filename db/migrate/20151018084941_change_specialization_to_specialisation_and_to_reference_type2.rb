class ChangeSpecializationToSpecialisationAndToReferenceType2 < ActiveRecord::Migration
  def change
  	change_column :courses, :specializations_id, :references
  end
end
