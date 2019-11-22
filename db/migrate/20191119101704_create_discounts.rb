class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.string :title
      t.text :body
      t.date :end_time
      t.string :adress
      t.integer :offer
      t.boolean :active
      t.references :sale, foreign_key: true

      t.timestamps
    end
  end
end
