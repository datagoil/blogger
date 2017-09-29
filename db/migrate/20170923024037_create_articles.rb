class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
        t.string :author
        t.string :title
        t.text :body
      t.timestamps
        t.references :author, foreign_key: true
    end
  end
end
