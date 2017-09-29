class AddAuthorForeignKeyToArticles < ActiveRecord::Migration[5.1]
  def change
     change_table :articles do |t|
         t.references :author, index: true
      end
   end
end