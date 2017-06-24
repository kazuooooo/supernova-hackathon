Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    member do
      get 'profile'
    end
    collection do
      get 'match'
    end
  end
end
