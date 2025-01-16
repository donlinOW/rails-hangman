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
end