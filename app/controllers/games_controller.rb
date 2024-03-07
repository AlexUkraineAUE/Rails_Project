class GamesController < ApplicationController
  def index
    @games = Game.page(params[:page]).per(20)
  end

  def show
    @game = Game.find(params[:id])
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @games = Game.includes(:teams, :genres).where("title LIKE ?", wildcard_search)
    if params[:team].present? && params[:team][:team_ids].present?
      @games = @games.joins(:teams).where(teams: { id: params[:team][:team_ids] })
    end

    if params[:genre].present? && params[:genre][:genre_ids].present?
      @games = @games.joins(:genres).where(genres: { id: params[:genre][:genre_ids] })
    end
  end
end
