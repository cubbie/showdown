class BracketsController < ApplicationController

  def new
    @bracket = Bracket.new
  end

  def create
    @bracket = Bracket.new(bracket_params)
    if @bracket.save
      redirect_to root_url
    else
      render :back
    end
  end


private
  def bracket_params
    params.require(:bracket).permit(:game_name, :description)
  end
end
