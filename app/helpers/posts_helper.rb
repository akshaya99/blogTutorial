module PostsHelper
  def cleanify_html(stuff)
    #require ActionView::Helpers::SanitizeHelper
    unless stuff.html_safe?
      stuff.html_safe
    else
      strip_tags(stuff)
    end
  end
end
