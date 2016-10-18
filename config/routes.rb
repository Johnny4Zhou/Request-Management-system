Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/requests' =>'requests#index', as: :requests
  get '/requests/new' => 'requests#new', as: :new_request
  post '/requests' => 'requests#create'
  get '/requests/:id/edit' => 'requests#edit', as: :edit_request


  get '/search' => 'requests#search', as: :search_request


  get   '/requests/:id' =>'requests#switch', as: :switch_mark
  patch  '/requests/:id' => 'requests#update', as: :request
  delete '/requests/:id' => 'requests#destroy'


end
