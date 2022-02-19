class EditNotesInReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :notes, :text, limit: 300
  end
end
