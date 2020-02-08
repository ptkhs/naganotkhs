Rails.application.routes.draw do
  namespace :admins do
    get 'orders/show'
    get 'orders/index'
    get 'orders/update'
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
    get 'orders/new'
    get 'orders/show'
    post 'orders/create'
    get 'orders/confirm'
    post 'orders/send'
    get 'orders/thanks' => 'orders#thanks'
  end

  root to: "end_users/top#index"
  get '/admins', to: 'admins/top#index', :as => :admins_root
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