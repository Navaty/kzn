class AddPositionToSliders < ActiveRecord::Migration[5.1]
  def change
    add_column :sliders, :position, :integer
  end
end
