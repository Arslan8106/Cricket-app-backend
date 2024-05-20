class Team < ApplicationRecord
  has_many :team_players, dependent: :destroy
  has_many :users, through: :team_players

  before_destroy :handle_users

  private

  def handle_users
    users.update_all(team_id: nil) # This sets the team_id in users to null
  end
end
