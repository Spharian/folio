class HomeController < ApplicationController
  def index
    @projects = Project.includes(:category)
    @categories = Category.all
  end
end
