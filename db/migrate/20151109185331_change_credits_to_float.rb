class ChangeCreditsToFloat < ActiveRecord::Migration
  def change
  	change_column :courses, :credits, :float
  end
end
