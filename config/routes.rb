Rails.application.routes.draw do
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#destroy'
  root 'sessions#new'

  get 'homeAdmin' => 'home#admin'
  get 'homeDeliveryMan' => 'home#deliveryMan'
  get 'openDeliveries' => 'home#openDeliveries'
  get 'closedDeliveries' => 'home#closedDeliveries'

  resources :users do
    resources :addresses
  end
  resources :products
  resources :sales
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
