class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.string :url, null: false
      t.string :images
      t.string :mtitle
      t.string :mdescription

      t.timestamps
    end

	add_index :pages, :url, unique: true

  end
end
