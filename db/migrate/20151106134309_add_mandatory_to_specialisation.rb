class AddMandatoryToSpecialisation < ActiveRecord::Migration
  def change
  	add_column :courses, :mandatory, :boolean
  end
end
