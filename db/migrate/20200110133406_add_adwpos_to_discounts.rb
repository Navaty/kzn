class AddAdwposToDiscounts < ActiveRecord::Migration[5.1]
  def change
    add_column :discounts, :adwpos, :integer, :null => true, :default => :null
  end
end
