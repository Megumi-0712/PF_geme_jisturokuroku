class FavoritesController < ApplicationController

	def create
		blog = Blog.find(params[:blog_id])
		favorite = current_user.favorites.new(blog_id: blog.id)
		favorite.save
		redirect_to blog_path(blog)
	end

	def destroy
		blog = Blog.find(params[:blog_id])
		favorite = current_user.favorites.find_by(blog_id: blog.id)
		favorite.destroy
		redirect_to blog_path(blog)
	end

	private
	def comment_params
		params.require(:favorite).permit(:user_id, :blog_id)
	end

	def correct_comment
		favorite = favorite.find(params[:id])
		user = favorite.user
		unless favorite == current_user
			redirect_to(user_path)
		end
	end

end
