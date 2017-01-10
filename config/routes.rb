Rails.application.routes.draw do
  namespace :tournament do
    resources :bases
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tournaments, controller: 'tournament_basis'
end
