class AddColumnToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users ,:profile_type, :boolean
  end
end
