Rails.application.routes.draw do
  scope module: :end_users do
    resources :orders, only: [:new,:show,:create]
    get 'orders/confirm'
    post 'orders/send'
    get 'orders/thanks' => 'orders#thanks'
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
