class AddAttachmentToWebsites < ActiveRecord::Migration
  def change
    add_attachment :websites, :screenshot
  end
end
