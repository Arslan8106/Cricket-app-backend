class Match < ApplicationRecord
  has_one :team1, class_name: 'Team', foreign_key: 'id', primary_key: 'team1_id'
  has_one :team2, class_name: 'Team', foreign_key: 'id', primary_key: 'team2_id'
  has_one :team1_match_stat, class_name: 'MatchStat', foreign_key: 'id', primary_key: 'team1_id'
  has_one :team2_match_stat, class_name: 'MatchStat', foreign_key: 'id', primary_key: 'team2_id'
  scope :today_onwards, -> {
    today = Date.today
    where("match_date >=?", today).where(completed: false)
  }
end
