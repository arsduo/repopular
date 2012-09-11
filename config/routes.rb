Repopular::Application.routes.draw do
  get "sessions/facebook"
  get "sessions/github"

  get "home/index"
  get "home/login"

  post "home/update_repos"

  match '/auth/facebook/callback', to: 'sessions#facebook'
  match '/auth/github/callback',   to: 'sessions#github'

  root to: 'home#index'
end
