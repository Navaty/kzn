class CreateDiscountAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :discount_addresses do |t|
      t.references :discount, foreign_key: true
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
