Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :sales
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
