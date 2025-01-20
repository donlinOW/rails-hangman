require 'rails_helper'

RSpec.describe Game, type: :model do
  describe '#initialise_game' do
    it 'initialises the game with a random word and display' do
      game = Game.new
      game.initialize_game
      expect(game.word).not_to be_nil
      expect(game.display).to eq('_' * game.word.length)
    end
  end

  describe '#random_word' do
    it 'returns a random word from the words.txt file' do
      game = Game.new
      word = game.random_word
      words = File.readlines(Rails.root.join('lib', 'words.txt')).map(&:chomp)
      expect(words).to include(word)
    end
  end

  describe '#game_over?' do
    it 'returns true if the game is won' do
      game = Game.new(state: 'won')
      expect(game.game_over?).to be true
    end

    it 'returns true if the game is lost' do
      game = Game.new(state: 'lost')
      expect(game.game_over?).to be true
    end

    it 'returns false if the game is in progress' do
      game = Game.new(state: 'in_progress')
      expect(game.game_over?).to be false
    end
  end
end
