class AddFlagAndPinToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :flag, :boolean, default:  false
    add_column :reviews, :pin, :boolean, default: false
  end
end
