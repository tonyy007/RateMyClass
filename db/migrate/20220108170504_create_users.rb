class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: false do |t|
      t.string :username, primary_key:true
      t.string :password_hash
      t.string :type_of_user

      t.timestamps
    end
  end
end
