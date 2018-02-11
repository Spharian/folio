module ApplicationHelper
  def is_root?
    current_page?(root_url)
  end

  def page_title(root: false)
    title = 'Ketfi Kevin - Portfolio'
    title = "#{@page_title} - #{title}" unless root
    title
  end

  def body_class
    'inner-page' unless is_root?
  end
end
