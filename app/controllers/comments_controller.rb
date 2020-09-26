class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		blog = Blog.find(params[:blog_id])
		@comment = current_user.comments.build(comment_params)
		@comment.user_id = current_user_id
		if comment.save
			flash[:success] = "コメントしました"
			redirect_back(fallback_location: blog_url(blog.id))

		else
			flash[:danger] = "コメント投稿に失敗しました"
			redirect_back(fallback_location: blog_url(blog.id))
		end
	end

	def destroy
		blog = Blog.find(params[:blog.id])
		@comment = blog.comments.find(params[:id])
		@comment.destroy
		redirect_back(fallback_location: blog_path(blog))
	end

	private
	def comment_params
		params.require(:comment).permit(:comment_post)
	end
end
