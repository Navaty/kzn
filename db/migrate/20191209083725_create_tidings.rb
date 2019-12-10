class CreateTidings < ActiveRecord::Migration[5.1]
  def change
    create_table :tidings do |t|
      t.string :name

      t.timestamps
    end
  end
end
