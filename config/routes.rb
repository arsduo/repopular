Repopular::Application.routes.draw do
  get "sessions/facebook"

  get "sessions/github"

  match '/auth/facebook/callback', to: 'sessions#facebook'
  match '/auth/github/callback',   to: 'sessions#github'
end
