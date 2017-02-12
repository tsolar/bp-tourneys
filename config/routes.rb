Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tournament/bases#index'

  resources :tournaments, controller: "tournament/bases" do
    resources :teams, param: :team_id, controller: "tournament/teams"
  end

  namespace :tournament do
    resources :bases
    # resources :teams
  end

  namespace :team do
    resources :bases
  end

end
