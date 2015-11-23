class LoginsController < ApplicationController
	def new
		redirect_to receipts_path if logged_in?
	end

	def create
		user = User.find_by(email: params[:email])
		if user && user.authenticate(params[:password])
			flash[:success] = "You are Logged In!"
			redirect_to receipts_path
			session[:user_id] = user.id
		else
			flash.now[:danger] = "Your email address or password does not match.  For Password Help, Please Contact a System Administration."
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end
end