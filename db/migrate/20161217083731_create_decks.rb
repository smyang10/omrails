class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.references :user, foreign_key: true
      t.text :cards
      t.integer :size

      t.timestamps
    end
  end
end
