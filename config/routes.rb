Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users

  root to: 'tournament/bases#index'

  resources :tournaments, controller: "tournament/bases" do
    resources :teams, param: :team_id, controller: "tournament/teams"
  end

  # namespace :tournament do
  #   resources :bases
  #   # resources :teams
  # end

  namespace :team do
    resources :bases
  end

  get 'my_profile', controller: "my_profile", action: "index", as: :user_profile
  resource :my_profile, except: [:new, :index], controller: "my_profile"

  namespace :user do
    resources :teams
    resources :tournaments
    resource :profile
  end


end
