class Api::V1::MatchesController < ApplicationController
  before_action :set_match, only: [:update]

  def index
    @teams = Team.pluck(:name, :id).map { |name, id| { label: name, value: id } }
    @teams_data = Team.all
    @upcoming_matches = Match.today_onwards.order(id: :desc)
    @completed_matches = Match.where(completed: true)
    @team1 = @completed_matches.map { |match| match.team1 }
    @team2 = @completed_matches.map { |match| match.team2 }
    @team1stats = @completed_matches.map { |match| match.team1_match_stat }
    @team2stats = @completed_matches.map { |match| match.team2_match_stat }
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.create(match_params)
    if @match.save
      render json: { match: @match }
    else
      respond_with_error "Error Creating Match", :not_found
    end
  end
  def update
    if @match.update(update_match_params)
      render json: { match: @match }
    else
      respond_with_error "Unable to update match", :not_found
    end
  end


  def fetch_players
    batting_team = Team.find_by(name: params[:batting_team])
    bowling_team = Team.find_by(name: params[:bowling_team])
    @batting_team_players = batting_team.users.pluck(:username, :id).map { |name, id| { label: name, value: name } }
    @bowling_team_players = bowling_team.users.pluck(:username, :id).map { |name, id| { label: name, value: name } }
  end

  private
  def match_params
    begin
      parsed_date = Date.strptime(params[:match][:match_date], "%m/%d/%Y")
      formatted_date = parsed_date.strftime("%Y-%m-%d")
      params[:match][:match_date] = formatted_date
      params.require(:match).permit(:venue, :match_time, :match_date, :overs, :match_no, :team1_id, :team2_id)
    rescue ArgumentError => e
      flash[:error] = "Invalid date format"
    end
  end
  def update_match_params
    params.require(:match).permit(:id, :completed, :status)
  end

  def set_match
    @match = Match.find_by(id: params[:id])
  end
end