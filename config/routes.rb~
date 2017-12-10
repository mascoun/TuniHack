Rails.application.routes.draw do
  resources :hospitals do 
	  resources :equipment
	get "/photo", to:"hospitals#photo"
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'hospitals#index'

    match '/signup', :to => 'users#new', :via => :get
    match '/signup', :to => 'users#create', :via => :post
    
    delete '/verify/:id' , :to => "users#approve"
    get '/messages', :to => 'users#messages'

    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'

end
