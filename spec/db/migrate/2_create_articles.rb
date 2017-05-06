class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :body
      t.datetime :published_at

      t.timestamps
    end
  end
end
