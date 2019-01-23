require 'redcarpet/render_strip'

class ParserFactory
  def self.for(type = 'HTML')
    renderer = send("render_#{type.downcase}")
    Redcarpet::Markdown.new(renderer, {})
  end

  def self.render_html
    Redcarpet::Render::Safe.new
  end

  def self.render_string
    Redcarpet::Render::StripDown.new
  end

  def self.method_missing(*args)
    raise 'Unsupported type of render'
  end
end
