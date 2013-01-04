class AddAttachmentImageToGalleries < ActiveRecord::Migration
  def self.up
    change_table :galleries do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :galleries, :image
  end
end
