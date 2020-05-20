Rails.application.routes.draw do
  devise_for :users
  root 'items#index' 
  resources :items, only: [:show, :edit, :new, :create]
  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
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
