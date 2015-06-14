Rails.application.routes.draw do

  devise_for :users
  
  get 'welcome/index'
  get 'welcome/about'
  root to: 'welcome#index'
  
  post :incoming, to: 'incoming#create'

  resources :users, only: [:update, :show, :index]
  
  resources :topics do
    resources :bookmarks, except: [:index]
  end

end
