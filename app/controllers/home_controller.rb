class HomeController < ApplicationController
  def index
    @projects = Project.includes(:category)

    categories_with_projects = @projects.map { |project| project.category.id }.uniq
    @categories = Category.find(categories_with_projects)
  end
end
