class ChangeTableNameSpecializationsToSpecialisations < ActiveRecord::Migration
  def change
     rename_table :specializations, :specialisations
  end
end
