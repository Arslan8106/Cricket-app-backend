class Team < ApplicationRecord
  has_many :team_players
  has_many :users, through: :team_players
  belongs_to :match , optional: true
end
