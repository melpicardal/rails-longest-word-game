Rails.application.routes.draw do
  root to: 'games#home'
  get '/new', to: 'games#new', as: 'new'
  post '/score', to: 'games#score', as: 'score'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
