Rails.application.routes.draw do
  resources :notes
  resources :checklists
  resources :blades
  resources :hotels
  resources :likes
  resources :wishlists
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
