Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'auth/registrations',
                                   confirmations: 'auth/confirmations',
                                   passwords:     'auth/passwords',
                                   sessions:      'auth/sessions'}

  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  root 'pages#home'

  resources :articles, only: [:index, :show]
end
