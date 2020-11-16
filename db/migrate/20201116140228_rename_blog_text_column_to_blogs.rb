class RenameBlogTextColumnToBlogs < ActiveRecord::Migration[5.2]
  def change
  	rename_column :blogs, :blog_text, :body
  end
end
