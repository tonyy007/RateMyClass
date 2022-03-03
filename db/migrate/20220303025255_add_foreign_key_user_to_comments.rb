class AddForeignKeyUserToComments < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :comments, :users, column: :users_id, primary_key: :username
  end
end
