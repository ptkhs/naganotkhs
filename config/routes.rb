Rails.application.routes.draw do
  namespace :admins do
    get 'items/index'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
    get 'items/new'
    get 'items/create'
  end
  scope module: :end_users do
    resources :orders, only: [:new,:show,:create]
    get 'orders/confirm'
    post 'orders/send'
    get 'orders/thanks' => 'orders#thanks'
  end
  root to: "end_users/top#index"
  get '/about/', to: 'end_users/top#about'
  get '/end_users/mypage', to: 'end_users#mypage'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :end_users, controllers: {
  sessions:      'end_users/sessions',
  passwords:     'end_users/passwords',
  registrations: 'end_users/registrations'
}

  resources :carts, only: [:index]


end