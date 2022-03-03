class AddForeignKeyToComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :users, column: :username, type: :string
  end
end
