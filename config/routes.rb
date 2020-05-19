Rails.application.routes.draw do
  devise_for :users
  root 'items#index' 
  resources :items, only: [:show, :edit, :new, :create]

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :signup, only: [:index, :create] do
    collection do
      get 'registration'
      get 'sms_confirmation'
      get 'sms_confirmation_sms'
      get 'address'
    end
  end
  
end
