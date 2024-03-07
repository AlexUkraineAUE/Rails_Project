class TeamsController < ApplicationController
  def index
    @teams = Team.page(params[:page]).per(20)
  end

  def show
    @team = Team.find(params[:id])
    @games = @team.games
  end

  def search
    wildcard_search = "%#{params[:keywords]}%"
    @teams = Team.where("name LIKE ?", wildcard_search)
  end
end
