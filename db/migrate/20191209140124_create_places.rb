class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :places do |t|
      t.string :title
      t.text :body
      t.string :adress
      t.date :start_time
      t.date :end_time
      t.references :event, foreign_key: true
      t.boolean :active, null: false, default: false
      t.boolean :free, null: false, default: false

      t.timestamps
    end
  end
end
