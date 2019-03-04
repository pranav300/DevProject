Rails.application.routes.draw do
  get 'welcome/index'
namespace :customer do
    resources :users, only: [:create]
    resource :session, only: [:create]
    resource :confirmation, only: [:new]
  end
  get 'register' => 'customer/users#new'  
  post 'register' => 'customer/users#create'
  get 'pay' => 'customer/session#pay' 
 # post 'pay' => 'customer/sessions#pay'

  get 'login' => 'customer/session#new'
  post 'login' => 'customer/session#create'
  get 'logout' => 'customer/session#destroy'
  get 'users_show' => 'customer/users#show'
  post 'admin_index' => 'admin#index'
  get 'admin' => 'admin#new'
  post 'admin' => 'admin#create'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
