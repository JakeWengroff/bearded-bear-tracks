Rails.application.routes.draw do

  devise_for :users
  
  get 'welcome/index'
  get 'welcome/about'
  root to: 'welcome#index'
  
  post :incoming, to: 'incoming#create'

  resources :users, only: [:update, :show, :index] 
  
  resources :bookmarks, only: [:index]

  resources :topics do
<<<<<<< HEAD
    resources :bookmarks, except: [:index]
=======
    resources :bookmarks, shallow: true, except: [:index] do
      resources :likes, only: [:create, :destroy]
    end
>>>>>>> 92a72f27f048ff23fd4c2b995da069e63d3033f7
  end

  resources :bookmarks, except: [:index] do
    resources :likes, only: [:create, :destroy]
  end

  
end
