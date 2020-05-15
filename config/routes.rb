Rails.application.routes.draw do
  devise_for :users
  root 'items#index' 
  resources :items, only: [:show, :edit, :new, :create]

  resources :signup do
    collection do
      get 'index'
      get 'registration'
      get 'sms_confirmation'
      get 'sms_confirmation_sms'
      get 'address'
      post 'create'
    end
  end
  
end
