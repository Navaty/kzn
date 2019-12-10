class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.references :tiding, foreign_key: true
      t.boolean :active, null: false, default: false

      t.timestamps
    end
  end
end
