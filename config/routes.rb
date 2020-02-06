Rails.application.routes.draw do
  namespace :admins do
    get 'items/index'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
    get 'items/new'
    get 'items/create'
  end
  namespace :end_users do
    get 'items/index'
    get 'items/show'
  end
  namespace :end_usres do
    get 'items/index'
    get 'items/show'
  end
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
end
