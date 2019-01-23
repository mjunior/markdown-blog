class ParserService
  MAX_PREVIEW = 140

  def initialize(text)
    @text = text
  end

  def preview
    @text = ParserFactory.for('STRING').render(@text[0..MAX_PREVIEW])
    html
  end

  def html
    ParserFactory.for('HTML').render(@text)
  end
end
