class ProjectsController < ApplicationController
  def index
    @projects = Project.includes(:category)
    @categories = @projects.map(&:category).uniq
  end
end
