class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :hacker_news_id, index: true, null: false
      t.string :title
      t.string :url
      t.boolean :hidden, default: false
      t.timestamps
    end
  end
end
