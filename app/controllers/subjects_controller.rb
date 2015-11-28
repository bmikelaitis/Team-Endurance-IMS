class SubjectsController < ApplicationController 
	before_action :require_user
	before_action :require_active_user
	before_action :require_admin_user, only: [:index, :edit, :update, :show]

	def index
		@subjects = Subject.paginate(page: params[:page], per_page: 10)
	end
	
	def show
		@subject = Subject.find(params[:id])
		@receipts = @subject.receipts
	end

	def new
		@subject = Subject.new
	end
	def edit
		@subject = Subject.find(params[:id])
	end
	
	def update
		@subject = Subject.find(params[:id])
		if @subject.update(subject_params)
			flash[:success] = "The Subject has been updated succesfully"
			redirect_to subjects_path
		else
			render 'edit'
		end
	end

	def create
		@subject = Subject.new(subject_params)

		if @subject.save
			flash[:success] = "Subject created succesfully."
			redirect_to subjects_path
		else
			render 'new'
		end

	end

	private
	def subject_params
		params.require(:subject).permit(:subject_name, :description)
	end

end