class AddFlagToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :flag, :boolean, default:  false
  end
end
