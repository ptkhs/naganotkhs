Rails.application.routes.draw do

  namespace :end_users do
    get 'categories/:id', to: "categories#show", :as => :categories_show
  end

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
    patch 'orders/:id', to: "orders#update", :as => :orders_update
    get 'orders/:id', to: "orders#show", :as => :orders_show
    get 'orders/', to: "orders#index", :as => :orders_index
  end

  namespace :admins do
    patch 'orderdetail/:id', to: "orders#detailup", :as => :detail_update
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

  namespace :admins do
    get 'sales/', to: 'sales#index', :as => :sales
    get 'sales/view', to: 'sales#view', :as => :sales_view
  end

  scope module: :end_users do
    get 'orders/new', to: 'orders#new', :as => :orders_new
    post 'orders/new', to: 'orders#create', :as => :orders_create
    get 'orders/confirm', to: 'orders#confirm', :as => :orders_confirm
    post 'orders/confirm', to: 'orders#sending', :as => :orders_send
    delete 'orders/:id', to: 'orders#destroy', :as => :orders_destroy
    get 'orders/thanks' => 'orders#thanks'
    get 'orders/index'
    get 'orders/:id', to: 'orders#show', :as => :orders_show
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
  get '/end_users/password', to: 'end_users#password', :as => :end_users_password
  get '/end_users/password/changed', to: 'end_users#changed', :as => :end_users_changed

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

  get '/search', to: 'search#index', :as => :search


end