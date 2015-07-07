Rails.application.routes.draw do

  devise_for :users
  
  get 'welcome/index'
  get 'welcome/about'
  root to: 'welcome#index'
  
  post :incoming, to: 'incoming#create'

  resources :users, only: [:show] 

  resources :bookmarks, only: [:index]

  resources :topics do
    resources :bookmarks, shallow: true, except: [:index]
  end

  resources :bookmarks, except: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  
end
