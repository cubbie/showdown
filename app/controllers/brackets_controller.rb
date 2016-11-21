class BracketsController < ApplicationController

  def index
    @brackets = Bracket.all
  end

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

  def process_status


    bracket = Bracket.find_by(id: process_request_params[:bracket_id])
    user = User.find_by(id: process_request_params[:user_id])
    if process_request_params[:status] == "remove"
      leave_bracket(bracket, user)
    elsif process_request_params[:status] == "join"
      join_bracket(bracket, user)
    end
    redirect_to root_url
  end





private
  def bracket_params
    params.require(:bracket).permit(:game_name, :description)
  end

  def show_bracket_params
    params.permit(:id)
  end

  def process_request_params
    params.require(:information).permit(:status, :bracket_id, :user_id)
  end

  def leave_bracket(bracket, user)
    bracket.users.delete(user)
    bracket.save
  end

  def join_bracket(bracket, user)
    bracket.users << user
    bracket.save
  end
  helper_method :add_user_to_bracket, :remove_user_from_bracket
end
