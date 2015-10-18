class CreateSelectedCourses < ActiveRecord::Migration
  def change
    create_table :selected_courses do |t|
      t.references :course, index: true
      t.references :user, index: true
      t.integer :quarter
      t.integer :year

      t.timestamps null: false
    end
    add_foreign_key :selected_courses, :courses
    add_foreign_key :selected_courses, :users
  end
end
