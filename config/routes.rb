Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/:id', to: 'projects#show', as: 'project'

  root 'projects#index'
end
