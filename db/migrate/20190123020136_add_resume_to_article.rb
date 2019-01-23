class AddResumeToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :resume, :text
  end
end
