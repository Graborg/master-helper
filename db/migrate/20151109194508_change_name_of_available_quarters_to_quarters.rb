class ChangeNameOfAvailableQuartersToQuarters < ActiveRecord::Migration
  def change
  	rename_column :courses, :available_quarters, :quarters
  end
end
