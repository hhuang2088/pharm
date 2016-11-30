Rails.application.routes.draw do

  get 'patients/new'
  root to: 'sessions#new'
  get 'sessions/new'
  post '/' => 'sessions#create_patient'
  get 'patients/show'
  get 'patients/new'
  get '/logout' => 'sessions#destroy_patient'
  resource :sessions
  resource :patients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
