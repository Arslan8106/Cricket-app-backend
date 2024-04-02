class Api::V1::MatchesController < ApplicationController
  def index
    @teams = Team.pluck(:name, :id).map { |name, id| { label: name, value: id } }
    @teams_data = Team.all
    @upcoming_matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
    binding.pry
    @match = Match.create(match_params)
    if @match.save
      render json: { match: @match }
    else
      respond_with_error "Error Creating Match", :not_found
    end
  end

  private
  def match_params
    params.require(:match).permit(:venue, :match_time, :match_date, :overs, :match_no, :team1_id, :team2_id)
  end
end