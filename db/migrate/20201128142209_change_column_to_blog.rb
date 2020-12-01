class ChangeColumnToBlog < ActiveRecord::Migration[5.2]
  def up
  	change_column :blogs, :body, :text, null: false, limit: 4294967235		#limitを付け加えるだけで、text型からlongtext型になる
  end

  def down
  	change_column :blogs, :body, :text
  end

end
