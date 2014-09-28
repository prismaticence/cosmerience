class AddAncestryToComments < ActiveRecord::Migration
  def change
  	change_table :comments do |t|
  		t.string :ancestry
  	end
  

  	add_index :comments, :ancestry
  end
end
