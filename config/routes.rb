Rails.application.routes.draw do
  get 'users/show'
  get '/mypage', to: 'users#show'
  root 'users#show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :users, :only => [:show]
  resources :routes do
    collection do
      patch :update_order
    end
  end


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
