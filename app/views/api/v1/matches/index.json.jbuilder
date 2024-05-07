if @teams
  json.teams @teams
  json.teams_data @teams_data
  json.matchesData @upcoming_matches
  json.completed_matches @completed_matches
  json.team1 @team1
  json.team2 @team2
  json.teamOneStats @team1stats
  json.teamTwoStats @team2stats
end