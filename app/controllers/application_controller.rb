class ApplicationController < ActionController::Base
  before_action :redirect_heroku_domain, if: proc { app_url && heroku_url }
  protect_from_forgery with: :exception

  private

    def redirect_heroku_domain
      redirect_to app_url if request.host.include?(heroku_url)
    end

    def app_url
      @app_url ||= ENV['APP_URL']
    end

    def heroku_url
      @heroku_url ||= ENV['HEROKU_URL']
    end
end
