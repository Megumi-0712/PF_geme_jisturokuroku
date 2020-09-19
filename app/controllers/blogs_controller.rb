class BlogsController < ApplicationController

before_action :authenticate_user!
before_action :correct_blog, only: [:edit, :update, :destroy]

	def index
		@blogs = Blog.all
	end

	def new
		@blog = Blog.new
	end

	def create
		blog = Blog.new(blog_params)
		blog.save
		redirect_to blog_path(@blog.id)
	end

	def show
		@blog = Blog.find(params[:id])
		@blog = Blog.find_by(id: params[:id])
    	@user = @blog.user
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
	def blog_params
		params.require(:blog).permit(:title, :blog_text)
	end
end