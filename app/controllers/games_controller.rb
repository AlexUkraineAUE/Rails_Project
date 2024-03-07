class GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(20)

  end

  def show
    @game = Game.find(params[:id])
  end
end
