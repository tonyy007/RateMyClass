class AddForeignKeyToReviews < ActiveRecord::Migration[6.1]
  def change
    #remove_foreign_key :users, :reviews
    add_reference :reviews, :users, column: :username, type: :string
  end
end
