class AddTitleToDecks < ActiveRecord::Migration[5.0]
  def change
    add_column :decks, :title, :string
  end
end
