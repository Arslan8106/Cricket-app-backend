Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, controllers: { registrations: 'devise_overides/users',
                                        sessions: 'devise_overides/sessions',
                                        passwords: 'devise_overides/passwords'}
      devise_scope :user do
        get "show/user", to: "users#show"
        # registrations: 'api/v1/registrations'
        resources :users
      end
      get "users", to: "users#index"
      resources :teams
      post "fetch_team", to: "teams#fetch_team"
      post "create_players", to: "users#create_team_player"
      post "fetch_players_names", to: "matches#fetch_players"
      post '/send-email', to: 'emails#send_email'
      resources :matches
      resources :matches_stat
    end
  end
end
