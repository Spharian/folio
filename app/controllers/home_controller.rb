class HomeController < ApplicationController
  def index
    @projects = Project.includes(:category).order(:position)
    @categories = Category.order(:position)
  end
end
