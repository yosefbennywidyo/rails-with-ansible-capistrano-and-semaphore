Rails.application.routes.draw do
  resources :dummies

  root 'dummies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
