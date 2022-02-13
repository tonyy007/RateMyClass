class AddCourseTitleToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :course_title, :string
  end
end
