class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :title
      t.text :body
      t.text :body_rendered

      t.timestamps
    end
  end
end
