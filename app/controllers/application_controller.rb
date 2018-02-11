class ApplicationController < ActionController::Base
  # before_filter :redirect_heroku_domain
  protect_from_forgery with: :exception

  def redirect_heroku_domain
    if request.host.include?('ketfikevin.herokuapp.com')
      redirect_to 'http://ketfikevin.com'
    end
  end
end
