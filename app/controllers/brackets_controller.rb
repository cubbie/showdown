class BracketsController < ApplicationController

  def new
    @bracket = Bracket.new
  end

  def create
    @bracket = Bracket.new(bracket_params)
    @bracket.admin = current_user.email
    if @bracket.save
      redirect_to root_url
    else
      render :back
    end
  end


  def show
    @bracket = Bracket.find_by(show_bracket_params)
  end



private
  def bracket_params
    params.require(:bracket).permit(:game_name, :description)
  end

  def show_bracket_params
    params.permit(:id)
  end
end
