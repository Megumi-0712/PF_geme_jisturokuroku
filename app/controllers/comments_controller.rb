class CommentsController < ApplicationController

	def new
	end

	def create
		blog = Blog.find(params[:blog_id])
		blog_comment = current_user.comments.new(comment_params)
		blog_comment.blog_id = blog_id
		blog_comment.save
		redirect_to blog_path(blog)
	end

	def destroy
	end

	private
	def blog_comment_params
		params.require(:comment).permit(:comment_post)

end
