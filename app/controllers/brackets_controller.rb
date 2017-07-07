class BracketsController < ApplicationController

  def index # This passes all of the brackets to the index page to be rendered
    @brackets = Bracket.all
  end

  def new
    @bracket = Bracket.new
  end

  def create #This creates the bracket and sets the admin equal to the current users email
    @bracket = Bracket.new(bracket_params)
    @bracket.admin = current_user.email
    @bracket.started = false
    if @bracket.save #If the bracket can be saved (passes validations) save and redirect
      redirect_to root_url
    else
      render :back
    end
  end

  def show
    @bracket = Bracket.find_by(show_bracket_params) #Fetches a specific bracket for rendering
    if @bracket.started
      @games = Game.where(bracket_id: @bracket.id)
    end
  end

  def process_status # Processes user status' in the tournament
    bracket = Bracket.find_by(id: process_request_params[:bracket_id])
    user = User.find_by(id: process_request_params[:user_id])
    if process_request_params[:status] == "remove"
      leave_bracket(bracket, user)
    elsif process_request_params[:status] == "join"
      join_bracket(bracket, user)
    end
    redirect_to :back
  end

  def start # Starts the tournament, should only be called by the bracket admin.
    @bracket = Bracket.find_by(show_bracket_params)
    @bracket.started = true
    create_games(@bracket)
    @bracket.save

    redirect_to :back
  end




private
  def next_power(number)
    return (2 ** (Math.log(number)/ Math.log(2)).ceil) - 37
  end

  def create_games(bracket)

    ((2 ** (Math.log(bracket.users.length)/ Math.log(2)).ceil) - bracket.users.length).times do
      bracket.users << User.new(email: "bye@bye.com", password: "bye")
    end

    users = bracket.users.to_a

    while users.length != 0
      first_user = users[rand(0...users.length)]
      users.delete(first_user)
      second_user = users[rand(0...users.length)]
      users.delete(second_user)
      Game.create(first_team_id: first_user.id, second_team_id: second_user.id, bracket_id: bracket.id, round: 1)
    end
    array_of_round_lengths = get_game_count(bracket.users.length)
    array_of_round_lengths.each_with_index do |game_count, index|
      puts(array_of_round_lengths)
      game_count.times do
        Game.create(round: index + 2, bracket_id: bracket.id)
      end
    end
  end

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

  def get_game_count(team_count)
    total_games = []
    divisor = 4
    while team_count / divisor != 1
      puts(team_count / divisor)
      total_games << team_count / divisor
      if team_count / (divisor * 2) == 1
        total_games << 1
      end
      divisor = divisor * 2
    end
    return total_games
  end

  helper_method :add_user_to_bracket, :remove_user_from_bracket
end
