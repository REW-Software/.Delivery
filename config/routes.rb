Rails.application.routes.draw do
  post 'sign_in' => 'sessions#create'
  delete 'sign_out' => 'sessions#destroy'
  root 'sessions#new'

  get 'homeAdmin' => 'home#admin'
  get 'homeDeliveryMan' => 'home#deliveryMan'

  resources :users
  resources :products
  resources :sales
  resources :deliveries
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
