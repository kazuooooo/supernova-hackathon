Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'users#register'

  resources :users do
    member do
      get 'profile'
      get 'register'
      get 'survey'
    end
    collection do
      get 'match'
      get 'result'
    end
  end
end
