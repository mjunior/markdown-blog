class ArticleDecorator < SimpleDelegator
  def self.collection(collection)
    collection.map do |obj|
      new obj
    end
  end

  def body
    return '<p>Processando...</p>'.html_safe if body_rendered.nil?
    body_rendered.html_safe
  end

  def preview
    return '<p>Processando...</p>'.html_safe if resume.nil?
    resume.html_safe
  end

  def published_at
    created_at.strftime("Publicado em: %m/%d/%Y")
  end
end
