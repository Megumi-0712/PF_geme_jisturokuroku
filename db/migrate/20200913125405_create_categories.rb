class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :tag
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
