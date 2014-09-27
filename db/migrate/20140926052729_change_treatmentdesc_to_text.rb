class ChangeTreatmentdescToText < ActiveRecord::Migration
  def change
    change_column :treatments, :description,  :text
    change_column :reviews, :body,  :text
    change_column :comments, :body,  :text
    
  end
end
