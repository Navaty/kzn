class AddMatetagsToSubjects < ActiveRecord::Migration[5.1]
  def change
  	add_column :discounts, :mtitle, :string
  	add_column :discounts, :mdescription, :string

  	add_column :places, :mtitle, :string
  	add_column :places, :mdescription, :string

  	add_column :posts, :mtitle, :string
  	add_column :posts, :mdescription, :string

  	add_column :sales, :mtitle, :string
  	add_column :sales, :mdescription, :string

  	add_column :events, :mtitle, :string
  	add_column :events, :mdescription, :string

  	add_column :tidings, :mtitle, :string
  	add_column :tidings, :mdescription, :string


  end
end
