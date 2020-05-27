Rails.application.routes.draw do

  devise_for :users
  root 'items#index' 
  resources :items
  resources :cards, only: [:new, :show, :destroy,:index] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end

  resources :items do
    resources :buyers, only: [:index] do
      collection do
        get 'complete', to: 'buyers#complete'
        post 'pay', to: 'buyers#pay'
      end
    end
  end

  resources :signup, only: [:index, :create] do
    collection do
      get 'registration'
      get 'sms_confirmation'
      # get 'sms_confirmation_sms' #電話番号認証
      get 'address'
    end
  end

  resources :mypage, only: [:index] do
    member do
      get 'user_profile'
      get 'credit_card'
      get 'logout'
    end
  end

  resources :categories, only: [:index]
end
