Rails.application.routes.draw do
  scope module: :end_users do
    get ':end_users_id/destinations', to: 'destinations#index', :as => :destinations_index
    patch ':end_users_id/destinations', to: 'destinations#update', :as => :destinations_update
    get ':end_users_id/destinations/:id/edit', to: 'destinations#edit', :as => :destinations_edit
    delete ':end_users_id/destinations/:id', to: 'destinations#destroy', :as => :destinations_destroy
    post ':end_users_id/destinations', to: 'destinations#create', :as => :destinations_create
  end
  namespace :admins do
    get 'categories', to: "categories#index"
    get 'categories/:id', to: "categories#edit"
    post 'categories', to: "categories#create", :as => :categories_create
    patch 'categories/:id', to: "categories#update", :as => :categories_update
  end
  namespace :admins do
    get 'orders/show'
    get 'orders/index'
    get 'orders/update'
  end

  namespace :admins do
    get 'items/', to: 'items#index'
    get 'items/new', to: 'items#new', :as => :item_new_path
    get 'items/:id', to: 'items#show', :as => :item_show_path
    patch 'items/:id', to: 'items#update', :as => :item_update
    get 'items/:id/edit', to: 'items#edit', :as => :item_edit
    post 'items/', to: 'items#create', :as => :item_create
  end


    get "items/:id", to: "items#show", :as => :items_show

  namespace :admins do
    get 'end_users/', to: 'end_users#index', :as => :end_users_index
    get 'end_users/:id/edit', to: 'end_users#edit', :as => :end_users_edit
    get 'end_users/:id', to: 'end_users#show', :as => :end_users_show
    patch 'end_users/:id', to: 'end_users#update'
  end

  scope module: :end_users do
    get 'orders/new', to: 'orders#new', :as => :orders_new
    post 'orders/new'
    get 'orders/:id', to: 'orders#show', :as => :orders_show
    post 'orders/', to: 'orders#create', :as => :orders_create
    get 'orders/confirm'
    post 'orders/confirm', to: 'orders#send', :as => :orders_send
    get 'orders/thanks' => 'orders#thanks'
    get 'orders/index'
  end

  root to: "end_users/top#index"
  get '/admins', to: 'admins/top#index', :as => :admins_root
  get '/end_users/close', to: 'end_users#bye', :as => :end_users_bye
  patch '/end_users/close', to: 'end_users#close'
  get '/about/', to: 'end_users/top#about'
  get '/end_users/mypage', to: 'end_users#mypage'
  get '/end_users/edit', to: 'end_users#edit'
  patch '/end_users/edit', to: 'end_users#update'
  put '/end_users/edit', to: 'end_users#update'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
}

devise_for :end_users, controllers: {
  sessions:      'end_users/sessions',
  passwords:     'end_users/passwords',
  registrations: 'end_users/registrations'
}

  get '/carts', to: 'carts#index'
  patch'/carts', to: 'carts#update'
  delete'/carts/:id', to: 'carts#destroy', :as => :carts_destroy
  delete'/carts/', to: 'carts#empty', :as => :carts_empty
  post '/items/:id', to: 'carts#create', :as => :carts_add


end