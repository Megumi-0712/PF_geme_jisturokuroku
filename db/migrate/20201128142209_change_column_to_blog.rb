class ChangeColumnToBlog < ActiveRecord::Migration[5.2]
  def up
  	Change_column :blogs, :body, :text, null: false, limit: 4294967295
  end

  def down
  end

end
