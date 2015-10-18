class SelectedCourse < ActiveRecord::Base
  has_one :course
  belongs_to :user
end
