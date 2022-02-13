class AddCourseCodeToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :course_code, :string
  end
end
