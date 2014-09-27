class AddAttachmentPhotosToReviews < ActiveRecord::Migration
  def self.up
    change_table :reviews do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :reviews, :photos
  end
end
