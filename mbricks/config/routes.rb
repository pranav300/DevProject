Rails.application.routes.draw do
  get 'welcome/index'
namespace :customer do
    resources :users, only: [:create]
    resource :session, only: [:create]
    resource :confirmation, only: [:new]
  end
  get 'register' => 'customer/users#new'  
  post 'register' => 'customer/users#create'
 
  post 'pay' => 'customer/sessions#pay'
  get 'login' => 'customer/sessions#new'
  post 'login' => 'customer/sessions#create'
  get 'logout' => 'customer/sessions#destroy'
  get 'users_show' => 'customer/users#show'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
