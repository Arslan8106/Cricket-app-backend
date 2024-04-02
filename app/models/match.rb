class Match < ApplicationRecord
  has_one :team1, class_name: 'Team', foreign_key: 'id', primary_key: 'team1_id'
  has_one :team2, class_name: 'Team', foreign_key: 'id', primary_key: 'team2_id'
end
