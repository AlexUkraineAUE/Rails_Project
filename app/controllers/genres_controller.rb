class GenresController < ApplicationController
  def index
    @genres = Genre.page(params[:page]).per(20)
  end

  def show
    @genre = Genre.find(params[:id])
    @games = @genre.games
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @genres = Genre.where("name LIKE ?", wildcard_search)
  end
end
