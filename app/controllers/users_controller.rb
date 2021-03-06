class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

	if @user.save
		session[:user_id] = @user.id
		flash[:notice] = "You have signed up successfully."
		redirect_to projects_path
	else
		render :new
	end
  end

  def update
  	if @user.update(user_params)
		flash[:notice] = "Profile has been updated"
		redirect_to @user
	else
		flash[:alert] = "Profile has not been updated"
		render "edit"
	end
  end

  def edit
  end

  def show
  end

  private
  	def set_user
		@user = User.find(params[:id])
	end
  	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)
	end
end
