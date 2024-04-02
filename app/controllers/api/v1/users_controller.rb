class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create_team_player
    team_id = params[:user][:user][:user][:team_id].to_s
    team = Team.find_by(id: team_id)
    players_data = params[:players]
    players_data.each do |player_data|
      user = User.create!(
        username: player_data[:name],
        email: player_data[:email],
        department: player_data[:contact_number],
        password: '111111',
        password_confirmation: '111111',
        role: 'Player',
        team_id: team_id
      )
      team.team_players.create(user: user)

    end

  end
end