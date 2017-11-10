Rails.application.routes.draw do
  devise_for :users
  resources :surveys
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'surveys/index'
  root 'surveys#index'
  resources :test_surveys do 
  	collection do
  	  post :check_answer
      get :user_result
  	end
  end
end
