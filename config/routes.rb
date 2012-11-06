PetApp::Application.routes.draw do
  

  resources :vaccines

  resources :vaccinations

  resources :visits

  resources :animals
  resources :pets
  resources :owners
  resources :users
  resources :sessions

  root :to => 'pages#home'

  match '/home', :to => 'pages#home'
  match '/about', :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/privacy', :to => 'pages#privacy'
  match '/signup', :to => 'users#new'
  match '/login', :to => 'sessions#new'
  match '/logout', :to => 'sessions#destroy'
end
