class Game < ApplicationRecord
  before_create :initialize_game

  def initialize_game
    self.lives = 9
    self.guessed_letters = ''
    self.state = 'in_progress'
    self.word = random_word
    self.display = "_" * word.length
  end

  def random_word
    File.readlines(Rails.root.join('lib', 'words.txt')).map(&:chomp).sample
  end

  def game_over?
    state == 'won' || state == 'lost'
  end

  def process_guess(guess)
    return if game_over? || guessed_letters.include?(guess)

    self.guessed_letters += guess
    if word.include?(guess)
      update_display(guess)
      check_win
    else
      self.lives -= 1
      check_loss
    end
    save
  end

  def update_display(guess)
    word.chars.each_with_index do |char, index|
      display[index] = guess if char == guess
    end
  end

  def check_win
    self.state = 'won' if display == word
  end

  def check_loss
    if lives <= 0
      self.state = 'lost'
      self.display = word 
    end
  end
end
