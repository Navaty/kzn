class AddAdwposToPlaces < ActiveRecord::Migration[5.1]
  def change
    add_column :places, :adwpos, :integer, :null => true, :default => :null
  end
end
