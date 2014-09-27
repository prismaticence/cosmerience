class AddDoctorToReviews < ActiveRecord::Migration
  def change
  	change_table :reviews do |t|
  		t.string :doctor
  		t.string :clinic_location
  		t.text :doctor_review
  	end

  end
end
