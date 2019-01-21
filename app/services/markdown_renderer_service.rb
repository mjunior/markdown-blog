class MarkdownRendererService
  def initialize(text)
    renderer = Redcarpet::Render::HTML.new(renderer_options)
    @markdown = Redcarpet::Markdown.new(renderer, {})
    @text = text
  end

  def html
    @markdown.render(@text)
  end

  private

  def renderer_options
    {
      escape_html: true
    }
  end
end
