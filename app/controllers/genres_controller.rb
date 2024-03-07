class GenresController < ApplicationController
  def index
    @genres = Genre.page(params[:page]).per(20)
  end

  def show
    @genre = Genre.find(params[:id])
    @games = @genre.games
  end
end
