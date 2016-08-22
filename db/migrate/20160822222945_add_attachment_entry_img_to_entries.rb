class AddAttachmentEntryImgToEntries < ActiveRecord::Migration
  def self.up
    change_table :entries do |t|
      t.attachment :entry_img
    end
  end

  def self.down
    remove_attachment :entries, :entry_img
  end
end
