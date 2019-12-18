class CreateSliders < ActiveRecord::Migration[5.1]
  def change
    create_table :sliders do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
