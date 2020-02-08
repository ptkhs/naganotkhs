Rails.application.routes.draw do
  namespace :end_users do
    get 'destinations/index'
    get 'destinations/update'
    get 'destinations/edit'
    get 'destinations/destroy'
  end
  namespace :admins do
    get 'orders/:id', to: 'orders#show', :as => :orders_show
    get 'orders/', to: 'orders#index', :as => :orders_index
    patch 'orders/:id', to: 'orders#update', :as => :orders_update
  end

  namespace :admins do
    get 'items/', to: 'items#index'
    get 'items/new', to: 'items#new', :as => :item_new_path
    get 'items/:id', to: 'items#show', :as => :item_show_path
    patch 'items/:id', to: 'items#update'
    put 'items/:id', to: 'items#update'
    get 'items/:id/edit', to: 'items#edit', :as => :item_edit
    post 'items/', to: 'items#create'
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

  resources :carts, only: [:index]
end