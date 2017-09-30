class AddAuthorForeignKeyToArticles < ActiveRecord::Migration[5.1]
  def change
    change_table :articles do |t|
        t.references :author, username: true
    end
  end
end
