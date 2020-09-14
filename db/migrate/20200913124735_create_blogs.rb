class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :blog_id
      t.string :title
      t.text :blog_text
      t.datetime :create_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
