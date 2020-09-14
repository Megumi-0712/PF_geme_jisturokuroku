class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :comment_id
      t.string :name
      t.text :blog_post
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
