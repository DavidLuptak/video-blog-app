class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end

  add_column :comments, :likers_count, :integer, :default => 0
  end
end
