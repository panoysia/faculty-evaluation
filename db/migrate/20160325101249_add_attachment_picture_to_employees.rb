class AddAttachmentPictureToEmployees < ActiveRecord::Migration
  def self.up
    change_table :employees do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :employees, :picture
  end
end
