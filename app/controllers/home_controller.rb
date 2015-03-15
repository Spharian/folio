class HomeController < ApplicationController
  def index
    @projects = Project.order(:position)
  end
end
