Rails.application.routes.draw do
  get 'welcome/index'
namespace :customer do
    resources :users, only: [:create]
    resource :session, only: [:create]
    resource :confirmation, only: [:new]
  end
  get 'register' => 'customer/users#new'  
  post 'register' => 'customer/users#create'
  
  get 'login' => 'customer/sessions#new'
  post 'login' => 'customer/session#create'
  get 'logout' => 'customer/session#destroy'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
