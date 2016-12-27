class AddAttachmentImageToDecks < ActiveRecord::Migration
  def self.up
    change_table :decks do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :decks, :image
  end
end
