class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :blog_text
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
