class AddAncestryToSale < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :ancestry, :string
    add_index :sales, :ancestry
  end
end
