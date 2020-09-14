class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :title
      t.text :report
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
