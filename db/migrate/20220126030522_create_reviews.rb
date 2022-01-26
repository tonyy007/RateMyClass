class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :workTime
      t.integer :studyTime
      t.integer :diffculty
      t.integer :timeWish

      t.timestamps
    end
  end
end
