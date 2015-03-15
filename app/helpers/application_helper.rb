module ApplicationHelper
  def tagify(string)
    string.delete(' ').downcase
  end
end
