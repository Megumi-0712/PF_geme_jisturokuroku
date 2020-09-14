class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :comment_post
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
