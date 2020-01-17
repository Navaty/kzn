class AddAdwposToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :adwpos, :integer, :null => true, :default => :null
  end
end
