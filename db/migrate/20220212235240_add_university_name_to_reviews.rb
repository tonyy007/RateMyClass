class AddUniversityNameToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :university_name, :string
  end
end
