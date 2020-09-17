class UsersController < ApplicationController
	before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
		@users = User.all
	end

	def update
	end

	def destroy
	end

	private
    def user_params
    	params.require(:user).permit(:name, :profile_image, :introduction)
    end

    def correct_user
        user = User.find(params[:id])

        unless user == current_user
        redirect_to(user_path(current_user))
        end
    end
end
