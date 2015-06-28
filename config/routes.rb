Rails.application.routes.draw do

  devise_for :users
  
  get 'welcome/index'
  get 'welcome/about'
  root to: 'welcome#index'
  
  post :incoming, to: 'incoming#create'

  resources :users, only: [:update, :show, :index] 
  
  resources :bookmarks, only: [:index]

  resources :topics do
    resources :bookmarks, shallow: true, except: [:index] do
      resources :likes, shallow: true, only: [:create, :destroy]
    end
  end
  
end
