class AddSlugs < ActiveRecord::Migration
  def change
  	add_column :users, :slug, :string
  	add_column :reviews, :slug, :string
  	add_column :treatments, :slug, :string
  end
end
