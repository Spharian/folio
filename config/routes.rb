Rails.application.routes.draw do
  root 'projects#index'

  resources :projects, only: [:index, :show]
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
