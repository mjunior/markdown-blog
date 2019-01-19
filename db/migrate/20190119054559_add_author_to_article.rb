class AddAuthorToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :author_id, :uuid
    add_foreign_key :articles, :users, column: :author_id
  end
end
