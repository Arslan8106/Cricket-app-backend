class Api::V1::TeamsController < ApplicationController
  def index

  end

  def new
    @team = Team.new
  end

  def create
    user_id = params.dig("team", "user", "user", "user", "id")
    @user = User.find_by(id: user_id)
    @team = @user.build_team(team_params)
    if @user.save
      render json: { team: @team }
    end
  end

  def fetch_team
    user_id = params.dig("user", "user", "id")
    @user = User.find_by(id: user_id)
    if @user.team
      render json: { team: @user.team, players: @user.team.users }
    else
      respond_with_error "No Team Found", :not_found
    end
  end

  # def send_message
  #   binding.pry
  #   @client = Twilio::REST::Client.new
  #   conversation1 = @client.conversations
  #                         .v1
  #                         .conversations
  #                         .create(friendly_name: 'Friendly Conversation')
  #
  #   puts conversation1.sid
  #   conversation = @client.conversations
  #                         .v1
  #                         .conversations(conversation1.sid)
  #                         .fetch
  #
  #   puts conversation.chat_service_sid
  #   participant = @client.conversations
  #                        .v1
  #                        .conversations(conversation1.sid)
  #                        .participants
  #                        .create(messaging_binding_address: 'whatsapp:+923133721276',
  #                          messaging_binding_proxy_address: 'whatsapp:+14155238886'
  #                        )
  #
  #   puts participant.sid
  #   # @client = Twilio::REST::Client.new(account_sid, auth_token)
  #   #
  #   # message = @client.messages.create(
  #   #   body: 'Helloo',
  #   #   from: 'whatsapp:+14155238886',
  #   #   to: 'whatsapp:+923133721276'
  #   # )
  # end

  private

  def set_team
    @user = Team.find_by(id: params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :captain,)
  end
end