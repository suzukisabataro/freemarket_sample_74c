Rails.application.routes.draw do
  devise_for :users
  root 'items#index' 
  resources :items, only: [:show, :edit, :new, :create]

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'
      post 'step6'
    end
  end
  
end
