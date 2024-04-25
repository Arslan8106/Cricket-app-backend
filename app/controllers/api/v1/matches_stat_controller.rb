class Api::V1::MatchesStatController < ApplicationController
  def create
   @match_stat = MatchStat.create(match_stat_params)
    if @match_stat.save
      render json: { first_innings_stats: @match_stat }
    end
  end

  private

  def match_stat_params
    params[:match_stat][:team_id] = Team.find_by(name: params[:match_stat][:team_id]).id
    params.require(:match_stat).permit(:team_id, :match_id, :team_score,:overs, :wickets)
  end
end
