class StoryAttributes < ActiveRecord::Migration[5.2]
  def change
    add_column :stories ,:body, :string
    add_column :stories, :user_id, :string
  end
end
