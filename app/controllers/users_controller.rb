class UsersController < ApplicationController 
	before_action :require_user, except: [:new, :create]
	before_action :require_active_user, except: [ :edit, :update, :show, :create, :password]
	before_action :set_user, only: [:edit, :update, :show]
	before_action :require_admin_user, only: [:index, :edit, :update, :show]

	def index
		@users = User.paginate(page: params[:page], per_page: 8)
	end

	def new
		@user = User.new
	end

	def create 
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Your account has been created succesfully"
			session[:user_id] = @user.id
			redirect_to receipts_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Your account has been updated succesfully"
			redirect_to receipts_path(@user) #TODO change to users_path
		else
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id])
		@receipts = @user.receipts.order("updated_at DESC")

	end

private
	def user_params
		params.require(:user).permit(:firstname, :lastname, :email, :seid, :admin, :active, :password, :title, :avatar)
	end

	def set_user
		@user = User.find(params[:id])
	end
	
	
end