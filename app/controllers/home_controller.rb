class HomeController < ApplicationController
  def index
    @projects = Project.includes(:category)

    categories_with_projects = Project.used_categories
    @categories = Category.find(categories_with_projects)
  end
end
