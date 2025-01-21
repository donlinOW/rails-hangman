class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.string :word, null: false
      t.integer :lives, null: false, default: 9
      t.string :guessed_letters, null: false, default: ''
      t.string :display, null: false
      t.string :state, null: false, default: 'in_progress'

      t.timestamps
    end
  end
end
