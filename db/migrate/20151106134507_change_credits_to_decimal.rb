class ChangeCreditsToDecimal < ActiveRecord::Migration
  def change
  	change_column :courses, :credits, :decimal
  end
end
