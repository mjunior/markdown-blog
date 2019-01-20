class ArticleDecorator < SimpleDelegator
  def self.collection(collection)
    collection.map do |obj|
      new obj
    end
  end

  def body
    return '<p>Processando</p>'.html_safe if body_rendered.nil?
    body_rendered.html_safe
  end
end
