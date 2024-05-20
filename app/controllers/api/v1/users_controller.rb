class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update]

  def index
    @users = User.all
  end

  def create_team_player
    user_id = params[:user][:id]
    team_id = User.find(user_id).team_id
    team = Team.find_by(id: team_id)
    players_data = params[:players]
    players_data.each do |player_data|
      user = User.create!(
        username: player_data[:name],
        email: player_data[:email],
        age: player_data[:age],
        player_type: player_data[:player_type],
        password: '111111',
        password_confirmation: '111111',
        role: 'Player',
        team_id: team_id,
        batting_style: player_data[:batting_style]
      )
      team.team_players.create(user: user)

    end
  end

  def update
    if @user.update(update_user_params)
      render json: { user: @user }
    else
      respond_with_error "Unable to update user", :not_found
    end
  end

  private
  def update_user_params
    params.require(:user).permit(:username, :email, :player_type, :age, :batting_style)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end