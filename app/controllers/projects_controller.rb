class ProjectsController < ApplicationController
  before_filter :get_projects_and_categories

  def index
  end

  def show
    @project = Project.includes(:pictures).friendly.find(params[:id])
    @page_title = @project.title
  end

private
  def get_projects_and_categories
    @projects = Project.includes(:category)
    @categories = @projects.map(&:category).uniq.sort_by(&:position)
  end
end
