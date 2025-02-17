class BlogsController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_blog, only: [:edit, :update, :destroy]

	impressionist :actions => [:show]

	def index
		@user = current_user
		@blogs = Blog.page(params[:page]).reverse_order
	end

	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.user_id = current_user.id
		if @blog.save
			flash[:notice] = "ブログを投稿しました"
			redirect_to blog_path(@blog)
		else
			@user = current_user
			render :new
		end
	end

	def show
		@blog = Blog.find_by(id: params[:id])
		impressionist(@blog, nil,unique: [:session_hash])		#複数回閲覧すると1回になるように計測した
		@user = @blog.user
		@comments = Comment.all
		@comment = Comment.find_by(id: params[:id])
		@comment = Comment.new		#ブログ詳細ページでコメント投稿が出来るようにさせる
		@favorite = Favorite.find_by(id: params[:id])
	end

	def edit
		@blog = Blog.find_by(id: params[:id])
	end

	def update
		@blog = Blog.find_by(id: params[:id])
		if @blog.update(blog_params)
			flash[:notice] = "ブログを更新しました"
			redirect_to blog_path(@blog)
		else
			render :edit
		end
	end

	def destroy
		@blog = Blog.find(params[:id])
		@blog.destroy
		redirect_to blogs_path
	end

	private

	def blog_params
		params.require(:blog).permit(:title, :body)
	end

	def correct_blog
		blog = Blog.find(params[:id])
		user = blog.user
		unless user == current_user
			redirect_to(user_path)
		end
	end
end