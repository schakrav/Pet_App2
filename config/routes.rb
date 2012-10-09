PetApp::Application.routes.draw do



  resources :animals

  resources :pets



  resources :owners
  root :to => 'pages#home'
  match '/about', :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/privacy', :to => 'pages#privacy'
  match '/signup', :to => 'owners#new'

  match '/owners', :to => 'owners#index'



end
