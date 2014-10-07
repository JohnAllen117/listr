module ApplicationHelper
  def render_markdown(markdown)
    extensions = {  }
    renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions)
    renderer.render(markdown || "").html_safe
  end
end
