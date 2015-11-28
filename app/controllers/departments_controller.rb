class DepartmentsController < ApplicationController 
	before_action :require_user
	before_action :require_active_user
	before_action :require_admin_user, only: [:index, :edit, :update, :show]

	def index
		@departments = Department.paginate(page: params[:page], per_page: 10)
	end
	
	def show
		@department = Department.find(params[:id])
		@receipts = @department.receipts

	end

	def new
		@department = Department.new
	end
	def edit
		@department = Department.find(params[:id])
	end
	def update
		@department = Department.find(params[:id])
		if @department.update(department_params)
			flash[:success] = "The Department has been updated succesfully"
			redirect_to departments_path
		else
			render 'edit'
		end
	end
	
	def create
		@department = Department.new(department_params)

		if @department.save
			flash[:success] = "Department created succesfully."
			redirect_to departments_path
		else
			render 'new'
		end

	end

	private
	def department_params
		params.require(:department).permit(:department_name, :department_description)
	end

end