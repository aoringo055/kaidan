class AddUserIdToHorrors < ActiveRecord::Migration[6.1]
  def change
    add_column :horrors, :user_id, :integer
  end
end
