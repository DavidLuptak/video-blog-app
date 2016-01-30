class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :link
      t.string :title
      t.string :uid
      t.datetime :published_at
      t.string :thumbnail_url
      t.string :category_title
      t.integer :view_count
      t.integer :like_count
      t.integer :dislike_count
      t.integer :duration
      t.belongs_to :post, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :videos, :uid
  end
end
