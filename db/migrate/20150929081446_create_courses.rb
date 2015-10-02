class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :course_name
      t.string :course_id
      t.integer :credits
      t.string :quarters
      t.string :level
      t.references :specializations
      t.string :syllabus_url
      t.string :evaluations_url
      t.string :web_page

      t.timestamps null: false
    end
  end
end
