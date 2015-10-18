class ChangeColumnSpecialisationToName < ActiveRecord::Migration
  def change
  	rename_column :specialisations, :specialization, :name
  end
end
