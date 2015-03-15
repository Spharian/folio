ActiveAdmin.setup do |config|
  config.site_title = 'Portfolio Ketfi Kevin'
  config.site_title_link  = '/'

  config.authentication_method = :authenticate_admin_user!
  config.current_user_method = :current_admin_user
  config.logout_link_path = :destroy_admin_user_session_path
  config.root_to = 'projects#index'
  config.comments = false
  config.batch_actions = true

  config.namespace :admin do |admin|
    admin.download_links = false
  end
end
