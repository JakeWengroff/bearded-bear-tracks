Rails.application.routes.draw do

  devise_for :users
  
  get 'welcome/index'
  get 'welcome/about'
  root to: 'welcome#index'
  
  post :incoming, to: 'incoming#create'

  resources :users, only: [:update] 
  
  resources :bookmarks, only: [:index]

  resources :topics do
<<<<<<< HEAD
    resources :bookmarks
=======
    resources :bookmarks, shallow: true, except: [:index] 
>>>>>>> df96936d4718ad4eb32f3828935750e97962391e
  end
end
