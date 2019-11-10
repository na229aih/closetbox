Rails.application.routes.draw do

  devise_for :users

  root 'coordinates#index'

  resources :users ,only: [:show] do
    collection do
      post '/follow' => 'users#follow', defaults: { format: 'json' }
      delete '/unfollow' => 'users#unfollow', defaults: { format: 'json' }
    end
  end

  resources :items ,only: [:new, :create, :edit, :update, :destroy]

  resources :coordinates ,only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
    collection do
      get '/select_outer' => 'coordinates#select_outer', defaults: { format: 'json' }
      get '/select_tops' => 'coordinates#select_tops', defaults: { format: 'json' }
      get '/select_pants' => 'coordinates#select_pants', defaults: { format: 'json' }
      get '/select_shoes' => 'coordinates#select_shoes', defaults: { format: 'json' }
      get '/select_bag' => 'coordinates#select_bag', defaults: { format: 'json' }
      get '/select_accessory' => 'coordinates#select_accessory', defaults: { format: 'json' }
    end
  end

  resources :likes, only: [] do
    collection do
      post '/create' => 'likes#create', defaults: { format: 'json' }
      delete '/destroy' => 'likes#destroy', defaults: { format: 'json' }
    end
  end

end