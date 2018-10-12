# Rails.application.routes.draw do
#   # resources :checklist_items
#   # resources :users_checklisted_items
#   # resources :wishlisted_hotels
#   # resources :notes
#   # resources :checklists
#   # resources :blades
#   # resources :hotels
#   # resources :likes
#   # resources :wishlists
#   # resources :users
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# end

Rails.application.routes.draw do
  resources :checklist_items
  resources :users_checklisted_items
  resources :wishlisted_hotels
  resources :hotels
  resources :users
  post "/signin", to: 'users#signin'
  post "/signup", to: 'users#signup'
  get "/users/:user_id/wishlist", to: 'users#get_wishlist'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
