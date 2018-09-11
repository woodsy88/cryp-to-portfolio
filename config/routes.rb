Rails.application.routes.draw do

  resources :cryptos
  devise_for :users, controllers: {registrations: 'registrations'}
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end

  get 'pages/lookup' => 'pages#lookup'

  post "/pages/lookup" => 'pages#lookup'
  
  root to: 'pages#home'
  
end
