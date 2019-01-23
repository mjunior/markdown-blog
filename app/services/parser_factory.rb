require 'redcarpet/render_strip'

class ParserFactory
  def self.for(type = 'HTML');
    renderer = render_type(type)
    Redcarpet::Markdown.new(renderer, {})
  end

  private
  def self.render_type(type)
    case type
    when 'HTML'
      Redcarpet::Render::Safe.new
    when 'STRING'
      Redcarpet::Render::StripDown.new
    else
      raise "Unsupported type #{type} of render"
    end
  end
end
