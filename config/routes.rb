PetApp::Application.routes.draw do
  resources :vaccines

  resources :vaccinations

  resources :visits

  resources :animals
  resources :pets
  resources :owners

  root :to => 'pages#home'

  match '/home', :to => 'pages#home'
  match '/about', :to => 'pages#about'
  match '/contact', :to => 'pages#contact'
  match '/privacy', :to => 'pages#privacy'
  match '/signup', :to => 'owners#new'
  match '/owners', :to => 'owners#index'
  match '/pets/new', :to => 'pets#new' 
  match '/pets', :to => 'pets#index' 
  match '/animals/new', :to => 'animals#new' 
  match '/animals', :to => 'animals#index'
end
