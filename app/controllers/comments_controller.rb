class CommentsController < ApplicationController
	before_action :authenticate_user!

	def create
		blog = Blog.find(params[:blog_id])		#blog_idのカラムに関係する
		comment = current_user.comments.new(comment_params)	 	#ブログにコメントが作成される
		comment.blog_id = blog.id		#コメントのidとユーザーidは一緒
		comment.save
			flash[:success] = "コメントしました"
			redirect_to blog_path(blog)
	end

	def destroy
		Comment.find_by(id: params[:id], blog_id: params[:blog_id]).destroy
		redirect_to blog_path(params[:blog_id])
	end

	private
	def comment_params
		params.require(:comment).permit(:user_id, :blog_id, :comment_post)
	end

	def correct_comment
		comment = Comment.find(params[:id])
		user = comment.user
		unless user == current_user
			redirect_to(user_path)
		end
	end
end
