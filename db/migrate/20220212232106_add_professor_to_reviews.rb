class AddProfessorToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :professor_name, :string
  end
end
