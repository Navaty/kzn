class AddAncestryToTiding < ActiveRecord::Migration[5.1]
  def change
    add_column :tidings, :ancestry, :string
    add_index :tidings, :ancestry
  end
end
