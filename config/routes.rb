Rails.application.routes.draw do
  resources :surveys
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'surveys/index'
  root 'surveys#index'
end
