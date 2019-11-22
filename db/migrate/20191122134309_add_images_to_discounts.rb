class AddImagesToDiscounts < ActiveRecord::Migration[5.1]
  def change
    add_column :discounts, :images, :string
  end
end
