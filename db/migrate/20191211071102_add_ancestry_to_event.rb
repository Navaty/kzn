class AddAncestryToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :ancestry, :string
    add_index :events, :ancestry
  end
end
