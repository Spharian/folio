module ProjectsHelper
  def get_description
    '3D Modeling / Graphics Design / Digital Art / Digital Painting / Cinema 4D / Compositing / Motion Design.'
  end

  def nav_link(project, direction)
    if project.send(direction)
      link_to("#{direction} project",
        project.send(direction),
        {data: {push: true},
        class: "project__navigation-link project__navigation-link--#{direction}"})
    end
  end

  def home_project_picture(project)
    position_x = project.featured_image_x == 0 ? "center" : "#{project.featured_image_x}px"
    position_y = project.featured_image_y == 0 ? "center" : "#{project.featured_image_y}px"

    style = {
      "background-image": "url(#{project.featured_image.url})",
      "background-position": "#{position_x} #{position_y}"
    }

    content_tag(
      :div,
      nil,
      class: "project-picture",
      style: style.map { |property, value| "#{property}: #{value}"}.join("; ")
    )
  end

  def scale_style(project)
    "-webkit-transform: scale(#{project.featured_image_scale}); transform: scale(#{project.featured_image_scale});" unless project.featured_image_scale == 1
  end

  def vimeo_link(video_link)
    "https://player.vimeo.com/video/#{video_link.split("/").last}"
  end

  def format_marmoset(marmoset_viewer_html)
    marmoset_viewer_html.gsub("”", "\"").gsub("″", "\"").html_safe
  end

  def text_present?(text)
    output = text
    replacements = [/<[^>]+>/, "&nbsp;", " ", "\r", "\n"]
    replacements.each { |replacement| output = output.gsub(replacement, "") }
    output.present?
  end

  def project_has_any_items?(pictures, videos, marmosets)
    pictures.any? || videos.any? || marmosets.any?
  end
end
