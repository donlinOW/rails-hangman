class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [ :create, :update, :destroy ]

  # list all games
  def index
    @games = Game.all
    render json: @games
  end

  # create a new game
  def create
    @game = Game.create
    render json: @game
  end

  # show a specific game
  def show
    @game = Game.find(params[:id])
    render json: {
      word: @game.display,
      lives: @game.lives,
      guessed_letters: @game.guessed_letters.split(''),
      state: @game.state
    }
  end

  # guess a letter
  def update
    @game = Game.find(params[:id])
    @game.process_guess(params[:letter]) if params[:letter]
    render json: {
      word: @game.display,
      lives: @game.lives,
      guessed_letters: @game.guessed_letters.split(''),
      state: @game.state
    }
  end

  # delete a game
  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    head :no_content
  end
end
