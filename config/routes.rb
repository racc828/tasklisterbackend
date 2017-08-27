Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
		namespace :v1 do
			resources :lists, :tasks, :users
      post '/sessions', to: 'sessions#create'
      get '/sessions/current_user', to: 'sessions#show'
		end
	end
end
