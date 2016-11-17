class PlayersController < ApplicationController

  def index
    @player = Player.new
    @players = Player.all
  end

  def create
    @player = Player.new(player_params)
      if @player.save
        redirect_to players_url
      else
        render :new
      end
  end

  def new
    @player = Player.new
  end

  def brackets
    @players = Player.all
  end

  private
  def player_params
    params.require(:player).permit(:firstname, :lastname)
  end
end
