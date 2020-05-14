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
      get 'step6'
      get 'done'
      get 'pay'
      post 'pay'
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 