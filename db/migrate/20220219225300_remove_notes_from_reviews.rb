class RemoveNotesFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :notes
  end
end
