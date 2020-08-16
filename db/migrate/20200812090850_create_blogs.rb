class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.string :date
      t.string :tags
      t.integer :category_id
      t.integer :user_id
      t.string :image
      t.integer :view_count, default: 0
      t.datetime :last_viewed_at

      t.timestamps
    end
  end
end
