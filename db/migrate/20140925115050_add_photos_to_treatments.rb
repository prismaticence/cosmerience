class AddPhotosToTreatments < ActiveRecord::Migration
  def change
  	change_table :treatments do |t|
  		t.string :photo_url
  	end

  	change_table :users do |t|
  		t.string :email
  	end
  end
end
