class CommentsController < ApplicationController
	before_action :authenticate_user!
	before_action :ensure_correct_user, only: [:destroy]

	def create
		blog = Blog.find(params[:blog_id])		#blog_idのカラムに関係する
		comment = current_user.comments.new(comment_params)	 	#ブログにコメントが作成される
		comment.user_id = blog.id		#コメントのidとユーザーidは一緒
		if comment.save
			flash[:success] = "コメントしました"
			redirect_to blog_path(blog)

		else
			flash[:danger] = "コメント投稿に失敗しました"
			render 'show'
		end							#ブログの投稿に関する分岐
	end

	def destroy
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.find(params[:id])
		@comment.destroy
		redirect_to blog_path(params[:blog_id])
	end

	private
	def comment_params
		params.require(:comment).permit(:user_id, :blog_id, :comment_post)
	end
end
